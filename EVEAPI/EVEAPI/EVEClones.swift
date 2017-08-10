//
//  EVEClones.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEClones: EVEResult {
	public var dateOfBirth: Date = Date.distantPast
	public var race: String = ""
	public var bloodLineID: Int = 0
	public var bloodLine: String = ""
	public var ancestryID: Int = 0
	public var ancestry: String = ""
	public var gender: EVECharacterGender = .male
	public var freeRespecs: Int = 0
	public var cloneJumpDate: Date = Date.distantPast
	public var lastRespecDate: Date = Date.distantPast
	public var lastTimedRespec: Date = Date.distantPast
	public var remoteStationDate: Date = Date.distantPast
	public var attributes: EVECharacterSheetAttributes = EVECharacterSheetAttributes()
	public var implants: [EVECharacterSheetImplant] = []
	public var jumpClones: [EVECharacterSheetJumpClone] = []
	public var jumpCloneImplants: [EVECharacterSheetJumpCloneImplant] = []
	public var jumpActivation: Date = Date.distantPast
	public var jumpFatigue: Date = Date.distantPast
	public var jumpLastUpdate: Date = Date.distantPast
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
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
					return EVECharacterGender.male.rawValue
				}
			}),
			"freeRespecs":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"cloneJumpDate":EVESchemeElementType.Date(elementName:nil, transformer:nil),
			"lastRespecDate":EVESchemeElementType.Date(elementName:nil, transformer:nil),
			"lastTimedRespec":EVESchemeElementType.Date(elementName:nil, transformer:nil),
			"remoteStationDate":EVESchemeElementType.Date(elementName:nil, transformer:nil),
			"attributes":EVESchemeElementType.Object(elementName: nil, type: EVECharacterSheetAttributes.self, transformer: nil),
			"implants":EVESchemeElementType.Rowset(elementName: nil, type: EVECharacterSheetImplant.self, transformer: nil),
			"jumpClones":EVESchemeElementType.Rowset(elementName: nil, type: EVECharacterSheetJumpClone.self, transformer: nil),
			"jumpCloneImplants":EVESchemeElementType.Rowset(elementName: nil, type: EVECharacterSheetJumpCloneImplant.self, transformer: nil),
			"jumpActivation":EVESchemeElementType.Date(elementName:nil, transformer:nil),
			"jumpFatigue":EVESchemeElementType.Date(elementName:nil, transformer:nil),
			"jumpLastUpdate":EVESchemeElementType.Date(elementName:nil, transformer:nil),
		]
	}
}
