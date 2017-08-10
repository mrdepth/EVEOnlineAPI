//
//  EVEConquerableStationList.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 30.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEConquerableStationListItem: EVEObject {
	public var stationID: Int = 0
	public var stationName: String = ""
	public var stationTypeID: Int = 0
	public var solarSystemID: Int = 0
	public var corporationID: Int = 0
	public var corporationName: String = ""
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
		"stationID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"stationName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"stationTypeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"solarSystemID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"corporationID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"corporationName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"x":EVESchemeElementType.Double(elementName:nil, transformer:nil),
		"y":EVESchemeElementType.Double(elementName:nil, transformer:nil),
		"z":EVESchemeElementType.Double(elementName:nil, transformer:nil),
		]
	}
}

public class EVEConquerableStationList: EVEResult {
	public var outposts: [EVEConquerableStationListItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"outposts":EVESchemeElementType.Rowset(elementName: nil, type: EVEConquerableStationListItem.self, transformer: nil)
		]
	}
}

