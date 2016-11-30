//
//  EVEAPIKeyInfo.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 28.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEAPIKeyInfoCharacter: EVEObject {
	public var characterID: Int = 0
	public var characterName: String = ""
	public var corporationID: Int = 0
	public var corporationName: String = ""
	public var allianceID: Int = 0
	public var allianceName: String = ""
	public var factionID: Int = 0
	public var factionName: String = ""
	
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
		]
	}
}

public class EVEAPIKeyInfoKey: EVEObject {
	public var accessMask: Int = 0
	public var type: EVEAPIKeyType = .Character
	public var expires: Date = Date.distantPast
	public var characters: [EVEAPIKeyInfoCharacter] = []

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
			"accessMask":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"type":EVESchemeElementType.Int(elementName:nil, transformer:{(value:Any?) -> Any? in
				if let s = value as? String {
					return EVEAPIKeyType(s).rawValue
				}
				else {
					return EVEAPIKeyType.Character.rawValue
				}
			}),
			"expires":EVESchemeElementType.Date(elementName:nil, transformer:nil),
			"characters":EVESchemeElementType.Rowset(elementName: nil, type: EVEAPIKeyInfoCharacter.self, transformer: nil)
		]
	}
}

public class EVEAPIKeyInfo: EVEResult {
	public var key: EVEAPIKeyInfoKey = EVEAPIKeyInfoKey()
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"key":EVESchemeElementType.Object(elementName: nil, type: EVEAPIKeyInfoKey.self, transformer: nil)
		]
	}
}
