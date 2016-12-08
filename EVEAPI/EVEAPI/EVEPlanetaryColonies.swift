//
//  EVEPlanetaryColonies.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEPlanetaryColoniesItem: EVEObject {
	public var solarSystemID: Int = 0
	public var solarSystemName: String = ""
	public var planetID: Int = 0
	public var planetName: String = ""
	public var planetTypeID: Int = 0
	public var planetTypeName: String = ""
	public var ownerID: Int64 = 0
	public var ownerName: String = ""
	public var lastUpdate: Date = Date.distantPast
	public var upgradeLevel: Int = 0
	public var numberOfPins: Int = 0
	
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"solarSystemID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"solarSystemName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"planetID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"planetName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"planetTypeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"planetTypeName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"ownerID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"ownerName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"lastUpdate":EVESchemeElementType.Date(elementName:nil, transformer:nil),
		"upgradeLevel":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"numberOfPins":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		]
	}
}


public class EVEPlanetaryColonies: EVEResult {
	public var colonies: [EVEPlanetaryColoniesItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"colonies":EVESchemeElementType.Rowset(elementName: nil, type: EVEPlanetaryColoniesItem.self, transformer: nil),
		]
	}
}
