//
//  EVEFacilities.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 30.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEFacilitiesItem: EVEObject {
	public var facilityID: Int64 = 0
	public var typeID: Int = 0
	public var typeName: String = ""
	public var solarSystemID: Int = 0
	public var solarSystemName: String = ""
	public var regionID: Int = 0
	public var regionName: String = ""
	public var starbaseModifier: Int = 0
	public var tax: Double = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"facilityID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"typeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"typeName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"solarSystemID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"solarSystemName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"regionID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"regionName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"starbaseModifier":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"tax":EVESchemeElementType.Double(elementName:nil, transformer:nil),
		]
	}
}

public class EVEFacilities: EVEResult {
	public var facilities: [EVEFacilitiesItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"facilities":EVESchemeElementType.Rowset(elementName: nil, type: EVEFacilitiesItem.self, transformer: nil)
		]
	}
}
