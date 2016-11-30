//
//  EVEPlanetaryRoutes.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEPlanetaryRoutesItem: EVEObject {
	public var routeID: Int64 = 0
	public var sourcePinID: Int64 = 0
	public var destinationPinID: Int64 = 0
	public var contentTypeID: Int = 0
	public var contentTypeName: String = ""
	public var quantity: Int = 0
	public var waypoint1: Int64 = 0
	public var waypoint2: Int64 = 0
	public var waypoint3: Int64 = 0
	public var waypoint4: Int64 = 0
	public var waypoint5: Int64 = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"routeID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"sourcePinID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"destinationPinID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"contentTypeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"contentTypeName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"quantity":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"waypoint1":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"waypoint2":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"waypoint3":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"waypoint4":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"waypoint5":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		]
	}
}


public class EVEPlanetaryRoutes: EVEResult {
	public var routes: [EVEPlanetaryRoutesItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"routes":EVESchemeElementType.Rowset(elementName: nil, type: EVEPlanetaryRoutesItem.self, transformer: nil),
		]
	}
}
