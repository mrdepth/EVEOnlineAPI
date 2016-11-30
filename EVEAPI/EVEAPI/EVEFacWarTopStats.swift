//
//  EVEFacWarTopStats.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 30.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit


public class EVEFacWarTopStatsCharactersItem: EVEObject {
	public var characterID: Int = 0
	public var characterName: String = ""
	public var kills: Int = 0
	
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"characterID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"characterName":EVESchemeElementType.String(elementName:nil, transformer:nil),
			"kills":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		]
	}
}

public class EVEFacWarTopStatsCorporationsItem: EVEObject {
	public var corporationID: Int = 0
	public var corporationName: String = ""
	public var kills: Int = 0
	
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"corporationID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"corporationName":EVESchemeElementType.String(elementName:nil, transformer:nil),
			"kills":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		]
	}
}

public class EVEFacWarTopStatsFactionsItem: EVEObject {
	public var factionID: Int = 0
	public var factionName: String = ""
	public var kills: Int = 0
	
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"factionID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"factionName":EVESchemeElementType.String(elementName:nil, transformer:nil),
			"kills":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		]
	}
}

public class EVEFacWarTopStatsCharacters: EVEObject {
	public var killsYesterday: [EVEFacWarTopStatsCharactersItem] = []
	public var killsLastWeek: [EVEFacWarTopStatsCharactersItem] = []
	public var killsTotal: [EVEFacWarTopStatsCharactersItem] = []
	public var victoryPointsYesterday: [EVEFacWarTopStatsCharactersItem] = []
	public var victoryPointsLastWeek: [EVEFacWarTopStatsCharactersItem] = []
	public var victoryPointsTotal: [EVEFacWarTopStatsCharactersItem] = []
	
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
			"killsLastWeek":EVESchemeElementType.Object(elementName: nil, type: EVEFacWarTopStatsCharactersItem.self, transformer: nil),
			"killsTotal":EVESchemeElementType.Object(elementName: nil, type: EVEFacWarTopStatsCharactersItem.self, transformer: nil),
			"victoryPointsYesterday":EVESchemeElementType.Object(elementName: nil, type: EVEFacWarTopStatsCharactersItem.self, transformer: nil),
			"victoryPointsLastWeek":EVESchemeElementType.Object(elementName: nil, type: EVEFacWarTopStatsCharactersItem.self, transformer: nil),
			"victoryPointsTotal":EVESchemeElementType.Object(elementName: nil, type: EVEFacWarTopStatsCharactersItem.self, transformer: nil),
		]
	}
}

public class EVEFacWarTopStatsCorporations: EVEObject {
	public var killsYesterday: [EVEFacWarTopStatsCorporationsItem] = []
	public var killsLastWeek: [EVEFacWarTopStatsCorporationsItem] = []
	public var killsTotal: [EVEFacWarTopStatsCorporationsItem] = []
	public var victoryPointsYesterday: [EVEFacWarTopStatsCorporationsItem] = []
	public var victoryPointsLastWeek: [EVEFacWarTopStatsCorporationsItem] = []
	public var victoryPointsTotal: [EVEFacWarTopStatsCorporationsItem] = []
	
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
			"killsLastWeek":EVESchemeElementType.Object(elementName: nil, type: EVEFacWarTopStatsCorporationsItem.self, transformer: nil),
			"killsTotal":EVESchemeElementType.Object(elementName: nil, type: EVEFacWarTopStatsCorporationsItem.self, transformer: nil),
			"victoryPointsYesterday":EVESchemeElementType.Object(elementName: nil, type: EVEFacWarTopStatsCorporationsItem.self, transformer: nil),
			"victoryPointsLastWeek":EVESchemeElementType.Object(elementName: nil, type: EVEFacWarTopStatsCorporationsItem.self, transformer: nil),
			"victoryPointsTotal":EVESchemeElementType.Object(elementName: nil, type: EVEFacWarTopStatsCorporationsItem.self, transformer: nil),
		]
	}
}

public class EVEFacWarTopStatsFactions: EVEObject {
	public var killsYesterday: [EVEFacWarTopStatsFactionsItem] = []
	public var killsLastWeek: [EVEFacWarTopStatsFactionsItem] = []
	public var killsTotal: [EVEFacWarTopStatsFactionsItem] = []
	public var victoryPointsYesterday: [EVEFacWarTopStatsFactionsItem] = []
	public var victoryPointsLastWeek: [EVEFacWarTopStatsFactionsItem] = []
	public var victoryPointsTotal: [EVEFacWarTopStatsFactionsItem] = []
	
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
			"killsLastWeek":EVESchemeElementType.Object(elementName: nil, type: EVEFacWarTopStatsFactionsItem.self, transformer: nil),
			"killsTotal":EVESchemeElementType.Object(elementName: nil, type: EVEFacWarTopStatsFactionsItem.self, transformer: nil),
			"victoryPointsYesterday":EVESchemeElementType.Object(elementName: nil, type: EVEFacWarTopStatsFactionsItem.self, transformer: nil),
			"victoryPointsLastWeek":EVESchemeElementType.Object(elementName: nil, type: EVEFacWarTopStatsFactionsItem.self, transformer: nil),
			"victoryPointsTotal":EVESchemeElementType.Object(elementName: nil, type: EVEFacWarTopStatsFactionsItem.self, transformer: nil),
		]
	}
}

public class EVEFacWarTopStats: EVEResult {
	public var characters: EVEFacWarTopStatsCharacters = EVEFacWarTopStatsCharacters()
	public var corporations: EVEFacWarTopStatsCorporations = EVEFacWarTopStatsCorporations()
	public var factions: EVEFacWarTopStatsFactions = EVEFacWarTopStatsFactions()
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"characters":EVESchemeElementType.Object(elementName: nil, type: EVEFacWarTopStatsCharacters.self, transformer: nil),
			"corporations":EVESchemeElementType.Object(elementName: nil, type: EVEFacWarTopStatsCorporations.self, transformer: nil),
			"factions":EVESchemeElementType.Object(elementName: nil, type: EVEFacWarTopStatsFactions.self, transformer: nil)
		]
	}
}

