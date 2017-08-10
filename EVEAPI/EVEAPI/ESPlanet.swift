//
//  ESPlanet.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 12.12.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation

public class ESPlanet: EVEObject {
	public var lastUpdate: Date = Date.distantPast
	public var numPins: Int = 0
	public var ownerID: Int64 = 0
	public var planetID: Int = 0
	public var planetType: ESPlanetType = .temperate
	public var solarSystemID: Int = 0
	public var upgradeLevel: Int = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"lastUpdate": EVESchemeElementType.ESIDate(elementName: "last_update", transformer: nil),
		"numPins": EVESchemeElementType.Int(elementName: "num_pins", transformer: nil),
		"ownerID": EVESchemeElementType.Int64(elementName: "owner_id", transformer: nil),
		"planetID": EVESchemeElementType.Int(elementName: "planet_id", transformer: nil),
		"planetType":EVESchemeElementType.Int(elementName:"planet_type", transformer:{ value in
			if let s = value as? String {
				return ESPlanetType(s).rawValue
			}
			else {
				return nil
			}
		}),
		"solarSystemID": EVESchemeElementType.Int(elementName: "solar_system_id", transformer: nil),
		"upgradeLevel": EVESchemeElementType.Int(elementName: "upgrade_level", transformer: nil),
		]
	}
}

public class ESPlanetLink: EVEObject {
	public var sourcePinID: Int64 = 0
	public var destinationPinID: Int64 = 0
	public var linkLevel: Int = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"sourcePinID": EVESchemeElementType.Int64(elementName: "source_pin_id", transformer: nil),
			"destinationPinID": EVESchemeElementType.Int64(elementName: "destination_pin_id", transformer: nil),
			"linkLevel": EVESchemeElementType.Int(elementName: "link_level", transformer: nil),
		]
	}
}

public class ESPlanetContent: EVEObject {
	public var content: Int = 0
	public var contentQuantity: Int64 = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"content": EVESchemeElementType.Int(elementName: nil, transformer: nil),
			"contentQuantity": EVESchemeElementType.Int64(elementName: "content_quantity", transformer: nil),
		]
	}
}

public class ESPlanetExtractorHead: EVEObject {
	public var headID: Int = 0
	public var latitude: Double = 0
	public var longitude: Double = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"headID": EVESchemeElementType.Int(elementName: "head_id", transformer: nil),
			"latitude": EVESchemeElementType.Double(elementName: nil, transformer: nil),
			"longitude": EVESchemeElementType.Double(elementName: nil, transformer: nil),
		]
	}
}

public class ESPlanetExtractorDetails: EVEObject {
	public var cycleTime: TimeInterval = 0
	public var headRadius: Double = 0
	public var heads: [ESPlanetExtractorHead] = []
	public var productTypeID: Int = 0
	public var qtyPerCycle: Int = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"cycleTime": EVESchemeElementType.Double(elementName: "cycle_time", transformer: nil),
		"headRadius": EVESchemeElementType.Double(elementName: "head_radius", transformer: nil),
		"heads": EVESchemeElementType.Array(elementName: nil, type: ESPlanetExtractorHead.self, transformer: nil),
		"productTypeID": EVESchemeElementType.Int(elementName: "product_type_id", transformer: nil),
		"qtyPerCycle": EVESchemeElementType.Int(elementName: "qty_per_cycle", transformer: nil),
		]
	}
}

public class ESPlanetFactoryDetails: EVEObject {
	public var schematicID: Int = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"schematicID": EVESchemeElementType.Int(elementName: "schematic_id", transformer: nil),
		]
	}
}

public class ESPlanetPin: EVEObject {
	public var content: [ESPlanetContent] = []
	public var expiryTime: Date?
	public var extractorDetails: ESPlanetExtractorDetails?
	public var factoryDetails: ESPlanetFactoryDetails?
	public var installTime: Date?
	public var lastCycleStart: Date?
	public var latitude: Double = 0
	public var longitude: Double = 0
	public var pinID: Int64 = 0
	public var schematicID: Int = 0
	public var typeID: Int = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"content": EVESchemeElementType.Array(elementName: nil, type: ESPlanetContent.self, transformer: nil),
		"expiryTime": EVESchemeElementType.ESIDate(elementName: "expiry_time", transformer: nil),
		"extractorDetails": EVESchemeElementType.Object(elementName: "extractor_details", type: ESPlanetExtractorDetails.self, transformer: nil),
		"factoryDetails": EVESchemeElementType.Object(elementName: "factory_details", type: ESPlanetFactoryDetails.self, transformer: nil),
		"installTime": EVESchemeElementType.ESIDate(elementName: "install_time", transformer: nil),
		"lastCycleStart": EVESchemeElementType.ESIDate(elementName: "last_cycle_start", transformer: nil),
		"latitude": EVESchemeElementType.Double(elementName: nil, transformer: nil),
		"longitude": EVESchemeElementType.Double(elementName: nil, transformer: nil),
		"pinID": EVESchemeElementType.Int64(elementName: "pin_id", transformer: nil),
		"schematicID": EVESchemeElementType.Int(elementName: "schematic_id", transformer: nil),
		"typeID": EVESchemeElementType.Int(elementName: "type_id", transformer: nil),
		]
	}
}

public class ESPlanetWaypoint: EVEObject {
	public var order: Int = 0
	public var pinID: Int64 = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"order": EVESchemeElementType.Int(elementName: nil, transformer: nil),
			"pinID": EVESchemeElementType.Int64(elementName: "pin_id", transformer: nil),
		]
	}
}


public class ESPlanetRoute: EVEObject {
	public var contentTypeID: Int = 0
	public var destinationPinID: Int64 = 0
	public var quantity: Int64 = 0
	public var routeID: Int64 = 0
	public var sourcePinID: Int64 = 0
	public var waypoints: [ESPlanetWaypoint] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"contentTypeID": EVESchemeElementType.Int(elementName: "content_type_id", transformer: nil),
		"destinationPinID": EVESchemeElementType.Int64(elementName: "destination_pin_id", transformer: nil),
		"quantity": EVESchemeElementType.Int64(elementName: nil, transformer: nil),
		"routeID": EVESchemeElementType.Int64(elementName: "route_id", transformer: nil),
		"sourcePinID": EVESchemeElementType.Int64(elementName: "source_pin_id", transformer: nil),
		"waypoints": EVESchemeElementType.Array(elementName: nil, type: ESPlanetWaypoint.self, transformer: nil),
		]
	}
}

public class ESPlanetDetails: ESResult {
	public var links: [ESPlanetLink] = []
	public var pins: [ESPlanetPin] = []
	public var routes: [ESPlanetRoute] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"links": EVESchemeElementType.Array(elementName: nil, type: ESPlanetLink.self, transformer: nil),
			"pins": EVESchemeElementType.Array(elementName: nil, type: ESPlanetPin.self, transformer: nil),
			"routes": EVESchemeElementType.Array(elementName: nil, type: ESPlanetRoute.self, transformer: nil),
		]
	}
}
