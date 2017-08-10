//
//  EVEFacWarGlobalStats.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 30.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEFacWarStatsKills: EVEObject {
	public var killsYesterday: Int = 0
	public var killsLastWeek: Int = 0
	public var killsTotal: Int = 0
	public var victoryPointsYesterday: Int = 0
	public var victoryPointsLastWeek: Int = 0
	public var victoryPointsTotal: Int = 0
	
	public override init() {
		super.init()
	}
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"killsLastWeek":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"killsTotal":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"victoryPointsYesterday":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"victoryPointsLastWeek":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"victoryPointsTotal":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		]
	}
}

public class EVEFacWarStatsFaction: EVEObject {
	public var factionID: Int64 = 0
	public var factionName: String = ""
	public var pilots: Int = 0
	public var systemsControlled: Int = 0
	
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"factionID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"factionName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"pilots":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"systemsControlled":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		]
	}
}

public class EVEFacWarStatsFactionWar: EVEObject {
	public var factionID: Int64 = 0
	public var factionName: String = ""
	public var againstID: Int = 0
	public var againstName: String = ""
	
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"factionID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"factionName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"againstID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"againstName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		]
	}
}

public class EVEFacWarGlobalStats: EVEResult {
	public var totals: EVEFacWarStatsKills = EVEFacWarStatsKills()
	public var factions: [EVEFacWarStatsFaction] = []
	public var factionWars: [EVEFacWarStatsFactionWar] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"totals":EVESchemeElementType.Object(elementName: nil, type: EVEFacWarStatsKills.self, transformer: nil),
			"factions":EVESchemeElementType.Rowset(elementName: nil, type: EVEFacWarStatsFaction.self, transformer: nil),
			"factionWars":EVESchemeElementType.Rowset(elementName: nil, type: EVEFacWarStatsFactionWar.self, transformer: nil)
		]
	}
}
