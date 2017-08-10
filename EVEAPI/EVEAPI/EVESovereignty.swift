//
//  EVESovereignty.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 30.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVESovereigntyItem: EVEObject {
	public var solarSystemID: Int = 0
	public var allianceID: Int64 = 0
	public var factionID: Int64 = 0
	public var solarSystemName: String = ""
	public var corporationID: Int64 = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"solarSystemID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"allianceID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"factionID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"solarSystemName":EVESchemeElementType.String(elementName:nil, transformer:nil),
			"corporationID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		]
	}
}

public class EVESovereignty: EVEResult {
	public var solarSystems: [EVESovereigntyItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"solarSystems":EVESchemeElementType.Rowset(elementName: nil, type: EVESovereigntyItem.self, transformer: nil)
		]
	}
}
