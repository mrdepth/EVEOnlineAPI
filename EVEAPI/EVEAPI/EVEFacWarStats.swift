//
//  EVEFacWarStats.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEFacWarStats: EVEResult {
	public var factionID: Int64 = 0
	public var factionName: String = ""
	public var enlisted: Date = Date.distantPast
	public var currentRank: Int = 0
	public var highestRank: Int = 0
	public var killsYesterday: Int = 0
	public var killsLastWeek: Int = 0
	public var killsTotal: Int = 0
	public var victoryPointsYesterday: Int = 0
	public var victoryPointsLastWeek: Int = 0
	public var victoryPointsTotal: Int = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"factionID":EVESchemeElementType.Int64(elementName: nil, transformer: nil),
		"factionName":EVESchemeElementType.String(elementName: nil, transformer: nil),
		"enlisted":EVESchemeElementType.Date(elementName: nil, transformer: nil),
		"currentRank":EVESchemeElementType.Int(elementName: nil, transformer: nil),
		"highestRank":EVESchemeElementType.Int(elementName: nil, transformer: nil),
		"killsYesterday":EVESchemeElementType.Int(elementName: nil, transformer: nil),
		"killsLastWeek":EVESchemeElementType.Int(elementName: nil, transformer: nil),
		"killsTotal":EVESchemeElementType.Int(elementName: nil, transformer: nil),
		"victoryPointsYesterday":EVESchemeElementType.Int(elementName: nil, transformer: nil),
		"victoryPointsLastWeek":EVESchemeElementType.Int(elementName: nil, transformer: nil),
		"victoryPointsTotal":EVESchemeElementType.Int(elementName: nil, transformer: nil),
		]
	}
}

