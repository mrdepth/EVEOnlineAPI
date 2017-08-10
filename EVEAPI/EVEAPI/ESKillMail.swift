//
//  ESKillMail.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 12.12.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation

public class ESKillMail: EVEObject {
	public var killMailHash: String = ""
	public var killMailID: Int64 = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"killMailHash": EVESchemeElementType.String(elementName: "killmail_hash", transformer: nil),
			"killMailID": EVESchemeElementType.Int64(elementName: "killmail_id", transformer: nil),
		]
	}
}


public class ESKillMailAttacker: EVEObject {
	public var allianceID: Int64 = 0
	public var characterID: Int64 = 0
	public var corporationID: Int64 = 0
	public var factionID: Int = 0
	public var damageDone: Double = 0
	public var finalBlow: Bool = false
	public var securityStatus: Double = 0
	public var shipTypeID: Int = 0
	public var weaponTypeID: Int = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"allianceID": EVESchemeElementType.Int64(elementName: "alliance_id", transformer: nil),
		"characterID": EVESchemeElementType.Int64(elementName: "character_id", transformer: nil),
		"corporationID": EVESchemeElementType.Int64(elementName: "corporation_id", transformer: nil),
		"factionID": EVESchemeElementType.Int(elementName: "faction_id", transformer: nil),
		"damageDone": EVESchemeElementType.Double(elementName: "damage_done", transformer: nil),
		"finalBlow": EVESchemeElementType.Bool(elementName: "final_blow", transformer: nil),
		"securityStatus": EVESchemeElementType.Double(elementName: "security_status", transformer: nil),
		"shipTypeID": EVESchemeElementType.Int(elementName: "ship_type_id", transformer: nil),
		"weaponTypeID": EVESchemeElementType.Int(elementName: "weapon_type_id", transformer: nil),
		]
	}
}

public class ESKillMailItem: EVEObject {
	public var flag: ESLocationFlag = .none
	public var itemTypeID: Int = 0
	public var quantityDestroyed: Int = 0
	public var quantityDropped: Int = 0
	public var singleton: Bool = false
	public var items: [ESKillMailItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"flag": EVESchemeElementType.Int(elementName: nil, transformer: nil),
		"itemTypeID": EVESchemeElementType.Int(elementName: "item_type_id", transformer: nil),
		"quantityDestroyed": EVESchemeElementType.Int(elementName: "quantity_destroyed", transformer: nil),
		"quantityDropped": EVESchemeElementType.Int(elementName: "quantity_dropped", transformer: nil),
		"singleton": EVESchemeElementType.Bool(elementName: nil, transformer: nil),
		"items": EVESchemeElementType.Array(elementName: nil, type: ESKillMailItem.self, transformer: nil),
		]
	}
}

public class ESKillMailVictim: EVEObject {
	public var allianceID: Int64 = 0
	public var characterID: Int64 = 0
	public var corporationID: Int64 = 0
	public var factionID: Int = 0
	public var damageTaken: Double = 0
	public var items: [ESKillMailItem] = []
	public var position: ESCoordinates?
	public var shipTypeID: Int = 0
	
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
			"characterID": EVESchemeElementType.Int64(elementName: "character_id", transformer: nil),
			"corporationID": EVESchemeElementType.Int64(elementName: "corporation_id", transformer: nil),
			"factionID": EVESchemeElementType.Int(elementName: "faction_id", transformer: nil),
			"damageTaken": EVESchemeElementType.Double(elementName: "damage_taken", transformer: nil),
			"items": EVESchemeElementType.Array(elementName: nil, type: ESKillMailItem.self, transformer: nil),
			"position": EVESchemeElementType.Object(elementName: nil, type: ESCoordinates.self, transformer: nil),
			"shipTypeID": EVESchemeElementType.Int(elementName: "ship_type_id", transformer: nil),
		]
	}
}

public class ESKillMailDetails: ESResult {
	public var attackers: [ESKillMailAttacker] = []
	public var killMailID: Int64 = 0
	public var killMailTime: Date = Date.distantPast
	public var moonID: Int = 0
	public var solarSystemID: Int = 0
	public var victim: ESKillMailVictim = ESKillMailVictim()
	public var warID: Int = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"attackers": EVESchemeElementType.Array(elementName: nil, type: ESKillMailAttacker.self, transformer: nil),
		"killMailID": EVESchemeElementType.Int64(elementName: "killmail_id", transformer: nil),
		"killMailTime": EVESchemeElementType.ESIDate(elementName: "killmail_time", transformer: nil),
		"moonID": EVESchemeElementType.Int(elementName: "moon_id", transformer: nil),
		"solarSystemID": EVESchemeElementType.Int(elementName: "solar_system_id", transformer: nil),
		"victim": EVESchemeElementType.Object(elementName: nil, type: ESKillMailVictim.self, transformer: nil),
		"warID": EVESchemeElementType.Int(elementName: "war_id", transformer: nil),
		]
	}
}
