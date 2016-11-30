//
//  EVEKillMails.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEKillMailsVictim: EVEObject {
	public var characterID: Int = 0
	public var characterName: String = ""
	public var corporationID: Int = 0
	public var corporationName: String = ""
	public var allianceID: Int = 0
	public var allianceName: String = ""
	public var factionID: Int = 0
	public var factionName: String = ""
	public var damageTaken: Int = 0
	public var shipTypeID: Int = 0
	
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
		"corporationID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"corporationName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"allianceID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"allianceName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"factionID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"factionName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"damageTaken":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"shipTypeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		]
	}
}

public class EVEKillMailsAttacker: EVEObject {
	public var characterID: Int = 0
	public var characterName: String = ""
	public var corporationID: Int = 0
	public var corporationName: String = ""
	public var allianceID: Int = 0
	public var allianceName: String = ""
	public var factionID: Int = 0
	public var factionName: String = ""
	public var securityStatus: Double = 0
	public var damageDone: Double = 0
	public var finalBlow: Bool = false
	public var weaponTypeID: Int = 0
	public var shipTypeID: Int = 0
	
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
			"corporationID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"corporationName":EVESchemeElementType.String(elementName:nil, transformer:nil),
			"allianceID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"allianceName":EVESchemeElementType.String(elementName:nil, transformer:nil),
			"factionID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"factionName":EVESchemeElementType.String(elementName:nil, transformer:nil),
			"securityStatus":EVESchemeElementType.Double(elementName:nil, transformer:nil),
			"damageDone":EVESchemeElementType.Double(elementName:nil, transformer:nil),
			"finalBlow":EVESchemeElementType.Bool(elementName:nil, transformer:nil),
			"weaponTypeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"shipTypeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		]
	}
}

public class EVEKillMailsItem: EVEObject {
	public var flag: EVEInventoryFlag = .None
	public var qtyDropped: Int = 0
	public var qtyDestroyed: Int = 0
	public var typeID: Int = 0
	public var items:[EVEKillMailsItem] = []
	public var singleton: Bool = false
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"flag":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"qtyDropped":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"qtyDestroyed":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"typeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"items":EVESchemeElementType.Rowset(elementName: nil, type: EVEKillMailsItem.self, transformer: nil),
			"singleton":EVESchemeElementType.Bool(elementName:nil, transformer:nil),
		]
	}
}

public class EVEKillMailsKill: EVEObject {
	public var killID: Int = 0
	public var solarSystemID: Int = 0
	public var killTime: Date = Date.distantPast
	public var moonID: Int = 0
	public var victim: [EVEKillMailsVictim] = []
	public var attackers: [EVEKillMailsAttacker] = []
	public var items: [EVEKillMailsItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"killID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"solarSystemID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"killTime":EVESchemeElementType.Date(elementName:nil, transformer:nil),
			"moonID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"victim":EVESchemeElementType.Rowset(elementName: nil, type: EVEKillMailsVictim.self, transformer: nil),
			"attackers":EVESchemeElementType.Rowset(elementName: nil, type: EVEKillMailsAttacker.self, transformer: nil),
			"items":EVESchemeElementType.Rowset(elementName: nil, type: EVEKillMailsItem.self, transformer: nil)
		]
	}
}

public class EVEKillMails: EVEResult {
	public var kills: [EVEKillMailsKill] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"kills":EVESchemeElementType.Rowset(elementName: nil, type: EVEKillMailsKill.self, transformer: nil)
		]
	}
}
