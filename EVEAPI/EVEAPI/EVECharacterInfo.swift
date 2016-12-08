//
//  EVECharacterInfo.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 30.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVECharacterInfoEmploymentHistoryItem: EVEObject {
	public var recordID: Int = 0
	public var corporationID: Int64 = 0
	public var corporationName: String = ""
	public var startDate: Date = Date.distantPast
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"recordID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"corporationID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"corporationName":EVESchemeElementType.String(elementName:nil, transformer:nil),
			"startDate":EVESchemeElementType.Date(elementName:nil, transformer:nil),
		]
	}
}

public class EVECharacterInfo: EVEResult {
	public var characterID: Int64 = 0
	public var characterName: String = ""
	public var race: String = ""
	public var bloodLineID: Int = 0
	public var bloodLine: String = ""
	public var ancestryID: Int = 0
	public var ancestry: String = ""
	public var balance: Double = 0
	public var skillPoints: Int = 0
	public var nextTrainingEnds: Date = Date.distantPast
	public var shipName: String = ""
	public var shipTypeID: Int = 0
	public var shipTypeName: String = ""
	public var corporationID: Int64 = 0
	public var corporationName: String = ""
	public var corporationDate: Date = Date.distantPast
	public var allianceName: String = ""
	public var allianceID: Int64 = 0
	public var allianceDate: Date = Date.distantPast
	public var lastKnownLocation: String = ""
	public var securityStatus: Double = 0
	public var employmentHistory: [EVECharacterInfoEmploymentHistoryItem] = []
	
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"characterID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"characterName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"race":EVESchemeElementType.String(elementName:"bloodlineID", transformer:nil),
		"bloodLineID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"bloodLine":EVESchemeElementType.String(elementName:"bloodline", transformer:nil),
		"ancestryID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"ancestry":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"balance":EVESchemeElementType.Double(elementName:"accountBalance", transformer:nil),
		"skillPoints":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"nextTrainingEnds":EVESchemeElementType.Date(elementName:nil, transformer:nil),
		"shipName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"shipTypeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"shipTypeName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"corporationID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"corporationName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"corporationDate":EVESchemeElementType.Date(elementName:nil, transformer:nil),
		"allianceName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"allianceID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"allianceDate":EVESchemeElementType.Date(elementName:nil, transformer:nil),
		"lastKnownLocation":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"securityStatus":EVESchemeElementType.Double(elementName:nil, transformer:nil),
		"employmentHistory":EVESchemeElementType.Rowset(elementName: nil, type: EVECharacterInfoEmploymentHistoryItem.self, transformer: nil)
		]
	}
}
