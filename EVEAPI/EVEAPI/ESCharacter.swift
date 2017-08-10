//
//  ESCharacter.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 12.12.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation

public class ESCharacterNames: ESResult {
	public var names: [Int64: String] = [:]
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"names": EVESchemeElementType.Dictionary(elementName: "items", key: "character_id", value: "character_name", transformer: nil)
		]
	}
}

public class ESCharacter: ESResult {
	public var ancestryID: Int = 0
	public var birthday: Date = Date.distantPast
	public var bloodlineID: Int = 0
	public var corporationID: Int64 = 0
	public var userDescription: Int = 0
	public var gender: ESGender = .male
	public var name: String = ""
	public var raceID: Int = 0
	public var securityStatus: Double = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"ancestryID": EVESchemeElementType.Int(elementName: "ancestry_id", transformer: nil),
		"birthday": EVESchemeElementType.ESIDate(elementName: nil, transformer: nil),
		"bloodlineID": EVESchemeElementType.Int(elementName: "bloodline_id", transformer: nil),
		"corporationID": EVESchemeElementType.Int64(elementName: "corporation_id", transformer: nil),
		"userDescription": EVESchemeElementType.String(elementName: "description", transformer: nil),
		"gender": EVESchemeElementType.Double(elementName: nil, transformer:{ value in
			if let s = value as? String {
				return ESGender(s).rawValue
			}
			else {
				return nil
			}
		}),
		"name": EVESchemeElementType.String(elementName: nil, transformer: nil),
		"raceID": EVESchemeElementType.Int(elementName: "race_id", transformer: nil),
		"securityStatus": EVESchemeElementType.Double(elementName: "security_status", transformer: nil),
		]
	}
}

public class ESCharacterCorporationHistory: EVEObject {
	public var corporationID: Int64 = 0
	public var isDeleted: Bool = false
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
			"corporationID": EVESchemeElementType.Int64(elementName: "corporation_id", transformer: nil),
			"isDeleted": EVESchemeElementType.Bool(elementName: "is_deleted", transformer: nil),
			"recordID": EVESchemeElementType.Int(elementName: "record_id", transformer: nil),
			"startDate": EVESchemeElementType.ESIDate(elementName: "start_date", transformer: nil),
		]
	}
}

public class ESCharacterPortraits: ESResult {
	public var icon64: String = ""
	public var icon128: String = ""
	public var icon256: String = ""
	public var icon512: String = ""
	
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
			"icon512": EVESchemeElementType.String(elementName: "px512x512", transformer: nil),
		]
	}
}
