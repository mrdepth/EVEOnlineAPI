//
//  ESIncursions.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 12.12.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation

public class ESIncursion: EVEObject {
	public var constellationID: Int = 0
	public var factionID: Int = 0
	public var hasBoss: Bool = false
	public var infestedSolarSystems: [Int] = []
	public var influence: Double = 0
	public var stagingSolarSystemID: Int = 0
	public var state: ESIncursionsState = .withdrawing
	public var type: String = ""
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"constellationID": EVESchemeElementType.Int(elementName: "constellation_id", transformer: nil),
		"factionID": EVESchemeElementType.Int(elementName: "faction_id", transformer: nil),
		"hasBoss": EVESchemeElementType.Bool(elementName: "has_boss", transformer: nil),
		"infestedSolarSystems": EVESchemeElementType.Array(elementName: "infested_solar_systems", type: Int.self, transformer: nil),
		"influence": EVESchemeElementType.Double(elementName: nil, transformer: nil),
		"stagingSolarSystemID": EVESchemeElementType.Int(elementName: "staging_solar_system_id", transformer: nil),
		"state": EVESchemeElementType.Int(elementName: nil, transformer: nil),
		"type": EVESchemeElementType.Int(elementName: nil, transformer:{ value in
			if let s = value as? String {
				return ESLocationType(s).rawValue
			}
			else {
				return nil
			}
		}),
		]
	}
}
