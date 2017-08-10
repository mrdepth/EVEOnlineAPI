//
//  ESLocation.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 12.12.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation

public class ESCharacterLocation: ESResult {
	public var solarSystemID: Int = 0
	public var stationID: Int = 0
	public var structureID: Int64 = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"solarSystemID": EVESchemeElementType.Int(elementName: "solar_system_id", transformer: nil),
			"stationID": EVESchemeElementType.Int(elementName: "station_id", transformer: nil),
			"structureID": EVESchemeElementType.Int64(elementName: "structure_id", transformer: nil),
		]
	}
}

public class ESCharacterShip: ESResult {
	public var shipTypeID: Int = 0
	public var shipName: String = ""
	public var shipItemID: Int64 = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"shipTypeID": EVESchemeElementType.Int(elementName: "ship_type_id", transformer: nil),
			"shipName": EVESchemeElementType.String(elementName: "ship_name", transformer: nil),
			"shipItemID": EVESchemeElementType.Int64(elementName: "ship_item_id", transformer: nil),
		]
	}
}
