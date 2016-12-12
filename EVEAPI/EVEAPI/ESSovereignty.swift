//
//  ESSovereignty.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 12.12.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation

public class ESSovereigntyParticipant: EVEObject {
	public var allianceID: Int64 = 0
	public var score: Double = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"allianceID": EVESchemeElementType.Int64(elementName: "alliance_id", transformer: nil),
			"score": EVESchemeElementType.Double(elementName: nil, transformer: nil),
		]
	}
}

public class ESSovereigntyCampaign: EVEObject {
	public var attackersScore: Double?
	public var campaignID: Int = 0
	public var constellationID: Int = 0
	public var defenderID: Int64?
	public var defenderScore: Double?
	public var eventType: ESEventType = .none
	public var participants: [ESSovereigntyParticipant] = []
	public var solarSystemID: Int = 0
	public var startTime: Date = Date.distantPast
	public var structureID: Int64 = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"attackersScore": EVESchemeElementType.Double(elementName: "attackers_score", transformer: nil),
		"campaignID": EVESchemeElementType.Int(elementName: "campaign_id", transformer: nil),
		"constellationID": EVESchemeElementType.Int(elementName: "constellation_id", transformer: nil),
		"defenderID": EVESchemeElementType.Int64(elementName: "defender_id", transformer: nil),
		"defenderScore": EVESchemeElementType.Double(elementName: "defender_score", transformer: nil),
		"eventType":EVESchemeElementType.Int(elementName:"event_type", transformer:{(value:Any?) -> Any? in
			if let s = value as? String {
				return ESEventType(s).rawValue
			}
			else {
				return ESEventType.none.rawValue
			}
		}),
		"participants": EVESchemeElementType.Array(elementName: nil, type: ESSovereigntyParticipant.self, transformer: nil),
		"solarSystemID": EVESchemeElementType.Int(elementName: "solar_system_id", transformer: nil),
		"startTime": EVESchemeElementType.ESIDate(elementName: "start_time", transformer: nil),
		"structureID": EVESchemeElementType.Int64(elementName: "structure_id", transformer: nil),
		]
	}
}

public class ESSovereigntyStructure: EVEObject {
	public var allianceID: Int64 = 0
	public var solarSystemID: Int = 0
	public var structureID: Int64 = 0
	public var structureTypeID: Int = 0
	public var vulnerabilityOccupancyLevel: Double?
	public var vulnerableEndTime: Date?
	public var vulnerableStartTime: Date?
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"allianceID": EVESchemeElementType.Int64(elementName: "alliance_id", transformer: nil),
		"solarSystemID": EVESchemeElementType.Int(elementName: "solar_system_id", transformer: nil),
		"structureID": EVESchemeElementType.Int64(elementName: "structure_id", transformer: nil),
		"structureTypeID": EVESchemeElementType.Int(elementName: "structure_type_id", transformer: nil),
		"vulnerabilityOccupancyLevel": EVESchemeElementType.Double(elementName: "vulnerability_occupancy_level", transformer: nil),
		"vulnerableEndTime": EVESchemeElementType.ESIDate(elementName: "vulnerable_end_time", transformer: nil),
		"vulnerableStartTime": EVESchemeElementType.ESIDate(elementName: "vulnerable_start_time", transformer: nil),
		]
	}
}
