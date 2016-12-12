//
//  ESWar.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 12.12.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation

public class ESWarAggressor: EVEObject {
	public var allianceID: Int64? = 0
	public var corporationID: Int64? = 0
	public var iskDestroyed: Double = 0
	public var shipsKilled: Int = 0
	
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
			"allianceID": EVESchemeElementType.Int64(elementName: "alliance_id", transformer: nil),
			"corporationID": EVESchemeElementType.Int64(elementName: "corporation_id", transformer: nil),
			"iskDestroyed": EVESchemeElementType.Double(elementName: "isk_destroyed", transformer: nil),
			"shipsKilled": EVESchemeElementType.Int(elementName: "ships_killed", transformer: nil),
		]
	}
}

public typealias ESWarDefender = ESWarAggressor

public class ESWarAlly: EVEObject {
	public var allianceID: Int64? = 0
	public var corporationID: Int64? = 0
	
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
			"allianceID": EVESchemeElementType.Int64(elementName: "alliance_id", transformer: nil),
			"corporationID": EVESchemeElementType.Int64(elementName: "corporation_id", transformer: nil),
		]
	}
}

public class ESWar: ESResult {
	public var aggressor: ESWarAggressor = ESWarAggressor()
	public var allies: [ESWarAlly] = []
	public var declared: Date = Date.distantPast
	public var defender: ESWarDefender = ESWarDefender()
	public var finished: Date?
	public var id: Int = 0
	public var mutual: Bool = false
	public var openForAllies: Bool = false
	public var retracted: Date?
	public var started: Date?
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"aggressor": EVESchemeElementType.Object(elementName: nil, type: ESWarAggressor.self, transformer: nil),
		"allies": EVESchemeElementType.Array(elementName: nil, type: ESWarAlly.self, transformer: nil),
		"declared": EVESchemeElementType.ESIDate(elementName: nil, transformer: nil),
		"defender": EVESchemeElementType.Object(elementName: nil, type: ESWarDefender.self, transformer: nil),
		"finished": EVESchemeElementType.ESIDate(elementName: nil, transformer: nil),
		"id": EVESchemeElementType.Int(elementName: nil, transformer: nil),
		"mutual": EVESchemeElementType.Bool(elementName: nil, transformer: nil),
		"openForAllies": EVESchemeElementType.Bool(elementName: "open_for_allies", transformer: nil),
		"retracted": EVESchemeElementType.ESIDate(elementName: nil, transformer: nil),
		"started": EVESchemeElementType.ESIDate(elementName: nil, transformer: nil),
		]
	}
}
