//
//  EVEOutpostList.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 30.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEOutpostListItem: EVEObject {
	public var stationID: Int = 0
	public var ownerID: Int64 = 0
	public var stationName: String = ""
	public var solarSystemID: Int = 0
	public var dockingCostPerShipVolume: Double = 0
	public var officeRentalCost: Double = 0
	public var stationTypeID: Int = 0
	public var reprocessingEfficiency: Double = 0
	public var reprocessingStationTake: Double = 0
	public var standingOwnerID: Int64 = 0
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
		"ownerID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"stationName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"solarSystemID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"dockingCostPerShipVolume":EVESchemeElementType.Double(elementName:nil, transformer:nil),
		"officeRentalCost":EVESchemeElementType.Double(elementName:nil, transformer:nil),
		"stationTypeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"reprocessingEfficiency":EVESchemeElementType.Double(elementName:nil, transformer:nil),
		"reprocessingStationTake":EVESchemeElementType.Double(elementName:nil, transformer:nil),
		"standingOwnerID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"x":EVESchemeElementType.Double(elementName:nil, transformer:nil),
		"y":EVESchemeElementType.Double(elementName:nil, transformer:nil),
		"z":EVESchemeElementType.Double(elementName:nil, transformer:nil),
		]
	}
}


public class EVEOutpostList: EVEResult {
	public var corporationStarbases: [EVEOutpostListItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"corporationStarbases":EVESchemeElementType.Rowset(elementName: nil, type: EVEOutpostListItem.self, transformer: nil),
		]
	}
}
