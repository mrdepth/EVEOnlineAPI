//
//  EVECharacterSheet.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVECharacterSheetAttributes: EVEObject {
	public var intelligence: Int = 0
	public var memory: Int = 0
	public var charisma: Int = 0
	public var perception: Int = 0
	public var willpower: Int = 0
	
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
			"intelligence":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"memory":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"charisma":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"perception":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"willpower":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		]
	}
}

public class EVECharacterSheetSkill: EVEObject {
	public var typeID: Int = 0
	public var skillPoints: Int = 0
	public var published: Bool = false
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"typeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"skillPoints":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"published":EVESchemeElementType.Bool(elementName:nil, transformer:nil),
		]
	}
}

public class EVECharacterSheetCertificate: EVEObject {
	public var certificateID: Int = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"certificateID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		]
	}
}

public class EVECharacterSheetCorporationRole: EVEObject {
	public var roleID: Int64 = 0
	public var roleName: String = ""
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"roleID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"roleName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		]
	}
}

public class EVECharacterSheetCorporationTitle: EVEObject {
	public var titleID: Int = 0
	public var titleName: String = ""
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"titleID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"titleName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		]
	}
}

public class EVECharacterSheetImplant: EVEObject {
	public var typeID: Int = 0
	public var typeName: String = ""
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"typeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"typeName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		]
	}
}

public class EVECharacterSheetJumpClone: EVEObject {
	public var jumpCloneID: Int = 0
	public var typeID: Int = 0
	public var locationID: Int64 = 0
	public var cloneName: String = ""
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"jumpCloneID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"typeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"locationID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"cloneName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		]
	}
}

public class EVECharacterSheetJumpCloneImplant: EVEObject {
	public var jumpCloneID: Int = 0
	public var typeID: Int = 0
	public var typeName: String = ""
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"jumpCloneID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"typeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"typeName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		]
	}
}

public class EVECharacterSheet: EVEResult {
	public var characterID: Int64 = 0
	public var characterName: String = ""
	public var homeStationID: Int = 0
	public var dateOfBirth: Date = Date.distantPast
	public var race: String = ""
	public var bloodLineID: Int = 0
	public var bloodLine: String = ""
	public var ancestryID: Int = 0
	public var ancestry: String = ""
	public var gender: EVECharacterGender = .Male
	public var corporationName: String = ""
	public var corporationID: Int64 = 0
	public var allianceName: String = ""
	public var allianceID: Int64 = 0
	public var factionName: String = ""
	public var factionID: Int64 = 0
	public var cloneTypeID: Int = 0
	public var cloneName: String = ""
	public var cloneSkillPoints: Int = 0
	public var freeSkillPoints: Int = 0
	public var freeRespecs: Int = 0
	public var cloneJumpDate: Date = Date.distantPast
	public var lastRespecDate: Date = Date.distantPast
	public var lastTimedRespec: Date = Date.distantPast
	public var remoteStationDate: Date = Date.distantPast
	public var jumpClones: [EVECharacterSheetJumpClone] = []
	public var jumpCloneImplants: [EVECharacterSheetJumpCloneImplant] = []
	public var jumpActivation: Date = Date.distantPast
	public var jumpFatigue: Date = Date.distantPast
	public var jumpLastUpdate: Date = Date.distantPast
	public var balance: Double = 0
	public var implants: [EVECharacterSheetImplant] = []
	public var attributes: EVECharacterSheetAttributes = EVECharacterSheetAttributes()
	public var skills: [EVECharacterSheetSkill] = []
	public var certificates: [EVECharacterSheetCertificate] = []
	public var corporationRoles: [EVECharacterSheetCorporationRole] = []
	public var corporationRolesAtHQ: [EVECharacterSheetCorporationRole] = []
	public var corporationRolesAtBase: [EVECharacterSheetCorporationRole] = []
	public var corporationRolesAtOther: [EVECharacterSheetCorporationRole] = []
	public var corporationTitles: [EVECharacterSheetCorporationTitle] = []
	
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"characterID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"characterName":EVESchemeElementType.String(elementName:"name", transformer:nil),
		"homeStationID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"dateOfBirth":EVESchemeElementType.Date(elementName:"DoB", transformer:nil),
		"race":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"bloodLineID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"bloodLine":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"ancestryID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"ancestry":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"gender": EVESchemeElementType.Int(elementName:nil, transformer: {(value:Any?) -> Any? in
			if let s = value as? String {
				return EVECharacterGender(s).rawValue
			}
			else {
				return EVECharacterGender.Male.rawValue
			}
		}),
		"corporationName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"corporationID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"allianceName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"allianceID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"factionName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"factionID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"cloneTypeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"cloneName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"cloneSkillPoints":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"freeSkillPoints":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"freeRespecs":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"cloneJumpDate":EVESchemeElementType.Date(elementName:nil, transformer:nil),
		"lastRespecDate":EVESchemeElementType.Date(elementName:nil, transformer:nil),
		"lastTimedRespec":EVESchemeElementType.Date(elementName:nil, transformer:nil),
		"remoteStationDate":EVESchemeElementType.Date(elementName:nil, transformer:nil),
		"jumpClones":EVESchemeElementType.Rowset(elementName: nil, type: EVECharacterSheetJumpClone.self, transformer: nil),
		"jumpCloneImplants":EVESchemeElementType.Rowset(elementName: nil, type: EVECharacterSheetJumpCloneImplant.self, transformer: nil),
		"jumpActivation":EVESchemeElementType.Date(elementName:nil, transformer:nil),
		"jumpFatigue":EVESchemeElementType.Date(elementName:nil, transformer:nil),
		"jumpLastUpdate":EVESchemeElementType.Date(elementName:nil, transformer:nil),
		"balance":EVESchemeElementType.Double(elementName:nil, transformer:nil),
		"implants":EVESchemeElementType.Rowset(elementName: nil, type: EVECharacterSheetImplant.self, transformer: nil),
		"attributes":EVESchemeElementType.Object(elementName: nil, type: EVECharacterSheetAttributes.self, transformer: nil),
		"skills":EVESchemeElementType.Rowset(elementName: nil, type: EVECharacterSheetSkill.self, transformer: nil),
		"certificates":EVESchemeElementType.Rowset(elementName: nil, type: EVECharacterSheetCertificate.self, transformer: nil),
		"corporationRoles":EVESchemeElementType.Rowset(elementName: nil, type: EVECharacterSheetCorporationRole.self, transformer: nil),
		"corporationRolesAtHQ":EVESchemeElementType.Rowset(elementName: nil, type: EVECharacterSheetCorporationRole.self, transformer: nil),
		"corporationRolesAtBase":EVESchemeElementType.Rowset(elementName: nil, type: EVECharacterSheetCorporationRole.self, transformer: nil),
		"corporationRolesAtOther":EVESchemeElementType.Rowset(elementName: nil, type: EVECharacterSheetCorporationRole.self, transformer: nil),
		"corporationTitles":EVESchemeElementType.Rowset(elementName: nil, type: EVECharacterSheetCorporationTitle.self, transformer: nil),
		]
	}
}

