//
//  EVEPlanetaryPins.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEPlanetaryPinsItem: EVEObject {
	public var pinID: Int64 = 0
	public var typeID: Int = 0
	public var typeName: String = ""
	public var schematicID: Int = 0
	public var lastLaunchTime: Date = Date.distantPast
	public var cycleTime: Int = 0
	public var quantityPerCycle: Int = 0
	public var installTime: Date = Date.distantPast
	public var expiryTime: Date = Date.distantPast
	public var contentTypeID: Int = 0
	public var contentTypeName: String = ""
	public var contentQuantity: Int = 0
	public var longitude: Double = 0
	public var latitude: Double = 0
	
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"pinID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"typeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"typeName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"schematicID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"lastLaunchTime":EVESchemeElementType.Date(elementName:nil, transformer:nil),
		"cycleTime":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"quantityPerCycle":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"installTime":EVESchemeElementType.Date(elementName:nil, transformer:nil),
		"expiryTime":EVESchemeElementType.Date(elementName:nil, transformer:nil),
		"contentTypeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"contentTypeName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"contentQuantity":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"longitude":EVESchemeElementType.Double(elementName:nil, transformer:nil),
		"latitude":EVESchemeElementType.Double(elementName:nil, transformer:nil),
		]
	}
}


public class EVEPlanetaryPins: EVEResult {
	public var pins: [EVEPlanetaryPinsItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"pins":EVESchemeElementType.Rowset(elementName: nil, type: EVEPlanetaryPinsItem.self, transformer: nil),
		]
	}
}
