//
//  EVEBlueprints.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEBlueprintsItem: EVEObject {
	public var itemID: Int64 = 0
	public var locationID: Int64 = 0
	public var typeID: Int = 0
	public var typeName: String = ""
	public var flag: EVEInventoryFlag = .none
	public var quantity: Int = 0
	public var timeEfficiency: Int = 0
	public var materialEfficiency: Int = 0
	public var runs: Int = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"itemID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"locationID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"typeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"typeName":EVESchemeElementType.String(elementName:nil, transformer:nil),
			"flag":EVESchemeElementType.Int(elementName:"flagID", transformer:nil),
			"quantity":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"timeEfficiency":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"materialEfficiency":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"runs":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		]
	}
}

public class EVEBlueprints: EVEResult {
	public var blueprints: [EVEBlueprintsItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"blueprints":EVESchemeElementType.Rowset(elementName: nil, type: EVEBlueprintsItem.self, transformer: nil)
		]
	}
}


