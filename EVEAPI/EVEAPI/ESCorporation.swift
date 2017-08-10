//
//  ESCorporation.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 12.12.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation

public class ESCorporationNames: ESResult {
	public var names: [Int64: String] = [:]
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"names": EVESchemeElementType.Dictionary(elementName: "items", key: "corporation_id", value: "corporation_name", transformer: nil)
		]
	}
}

public class ESCorporation: ESResult {
	public var allianceID: Int64 = 0
	public var ceoID: Int64 = 0
	public var corporationName: String = ""
	public var memberCount: Int = 0
	public var ticker: String = ""
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"allianceID": EVESchemeElementType.Int64(elementName: "alliance_id", transformer: nil),
			"ceoID": EVESchemeElementType.Int64(elementName: "ceo_id", transformer: nil),
			"corporationName": EVESchemeElementType.String(elementName: "corporation_name", transformer: nil),
			"memberCount": EVESchemeElementType.Int(elementName: "member_count", transformer: nil),
			"ticker": EVESchemeElementType.String(elementName: nil, transformer: nil),
		]
	}
}

public class ESCorporationAllianceHistoryAlliance: EVEObject {
	public var allianceID: Int64 = 0
	public var isDeleted: Bool = false
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"allianceID": EVESchemeElementType.Int64(elementName: "alliance_id", transformer: nil),
			"isDeleted": EVESchemeElementType.Bool(elementName: "is_deleted", transformer: nil),
		]
	}
}

public class ESCorporationAllianceHistory: EVEObject {
	public var alliance: ESCorporationAllianceHistoryAlliance?
	public var recordID: Int = 0
	public var startDate: Date = Date.distantPast
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"alliance": EVESchemeElementType.Object(elementName: nil, type: ESCorporationAllianceHistoryAlliance.self, transformer: nil),
			"recordID": EVESchemeElementType.Int(elementName: "record_id", transformer: nil),
			"startDate": EVESchemeElementType.ESIDate(elementName: "start_date", transformer: nil),
		]
	}
}

public class ESCorporationIcons: ESResult {
	public var icon64: String = ""
	public var icon128: String = ""
	public var icon256: String = ""
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"icon64": EVESchemeElementType.String(elementName: "px64x64", transformer: nil),
			"icon128": EVESchemeElementType.String(elementName: "px128x128", transformer: nil),
			"icon256": EVESchemeElementType.String(elementName: "px256x256", transformer: nil),
		]
	}
}


public class ESCorporationRole: EVEObject {
	public var characterID: Int64 = 0
	public var grantableRoles: [ESRole] = []
	public var grantableRolesAtBase: [ESRole] = []
	public var grantableRolesAtHq: [ESRole] = []
	public var grantableRolesAtOther: [ESRole] = []
	public var roles: [ESRole] = []
	public var rolesAtBase: [ESRole] = []
	public var rolesAtHq: [ESRole] = []
	public var rolesAtOther: [ESRole] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		let transformer = { (value: Any?) -> Any? in
			guard let array = value as? [String] else {return nil}
			var roles = [ESRole]()
			for item in array {
				roles.append(ESRole(item))
			}
			return roles
		}
		
		return [
			"characterID": EVESchemeElementType.Int64(elementName: "character_id", transformer: nil),
			"grantableRoles": EVESchemeElementType.Array(elementName: "grantable_roles", type: ESRole.self, transformer: transformer),
			"grantableRolesAtBase": EVESchemeElementType.Array(elementName: "grantable_roles_at_base", type: ESRole.self, transformer: transformer),
			"grantableRolesAtHq": EVESchemeElementType.Array(elementName: "grantable_roles_at_hq", type: ESRole.self, transformer: transformer),
			"grantableRolesAtOther": EVESchemeElementType.Array(elementName: "grantable_roles_at_other", type: ESRole.self, transformer: transformer),
			"roles": EVESchemeElementType.Array(elementName: nil, type: ESRole.self, transformer: transformer),
			"rolesAtBase": EVESchemeElementType.Array(elementName: "roles_at_base", type: ESRole.self, transformer: transformer),
			"rolesAtHq": EVESchemeElementType.Array(elementName: "roles_at_hq", type: ESRole.self, transformer: transformer),
			"rolesAtOther": EVESchemeElementType.Array(elementName: "roles_at_other", type: ESRole.self, transformer: transformer),
		]
	}
}
