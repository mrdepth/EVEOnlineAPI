//
//  EVECharStandings.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEStandingsItem: EVEObject {
	public var fromID: Int64 = 0
	public var fromName: String = ""
	public var standing: Double = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"fromID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"fromName":EVESchemeElementType.String(elementName:nil, transformer:nil),
			"standing":EVESchemeElementType.Double(elementName:nil, transformer:nil),
		]
	}
}

public class EVEStandingsNPC: EVEObject {
	public var agents: [EVEStandingsItem] = []
	public var npcCorporations: [EVEStandingsItem] = []
	public var factions: [EVEStandingsItem] = []
	
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
			"agents":EVESchemeElementType.Rowset(elementName: nil, type: EVEStandingsItem.self, transformer: nil),
			"npcCorporations":EVESchemeElementType.Rowset(elementName: "NPCCorporations", type: EVEStandingsItem.self, transformer: nil),
			"factions":EVESchemeElementType.Rowset(elementName: nil, type: EVEStandingsItem.self, transformer: nil),
		]
	}
}

public class EVECharStandings: EVEResult {
	public var npcStandings: EVEStandingsNPC = EVEStandingsNPC()
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"npcStandings":EVESchemeElementType.Object(elementName: "characterNPCStandings", type: EVEStandingsNPC.self, transformer: nil),
		]
	}
}

