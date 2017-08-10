//
//  EVELocations.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVELocationsItem: EVEObject {
	public var itemID: Int64 = 0
	public var itemName: String = ""
	public var x: Double = 0
	public var y: Double = 0
	public var z: Double = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"itemID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"itemName":EVESchemeElementType.String(elementName:nil, transformer:nil),
			"x":EVESchemeElementType.Double(elementName:nil, transformer:nil),
			"y":EVESchemeElementType.Double(elementName:nil, transformer:nil),
			"z":EVESchemeElementType.Double(elementName:nil, transformer:nil),
		]
	}
}


public class EVELocations: EVEResult {
	public var locations: [EVELocationsItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"locations":EVESchemeElementType.Rowset(elementName: nil, type: EVELocationsItem.self, transformer: nil),
		]
	}
}
