//
//  EVECharacters.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 28.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVECharactersItem: EVEObject {
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
			"characterName":EVESchemeElementType.String(elementName:"name", transformer:nil),
			"corporationID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"corporationName":EVESchemeElementType.String(elementName:nil, transformer:nil),
			"allianceID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"allianceName":EVESchemeElementType.String(elementName:nil, transformer:nil),
			"factionID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"factionName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		]
	}
}

public class EVECharacters: EVEResult {
	public var characters: [EVECharactersItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"characters":EVESchemeElementType.Rowset(elementName: nil, type: EVECharactersItem.self, transformer: nil)
		]
	}
}
