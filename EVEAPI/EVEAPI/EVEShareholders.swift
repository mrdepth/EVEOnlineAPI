//
//  EVEShareholders.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 30.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEShareholdersItem: EVEObject {
	public var shareholderID: Int64 = 0
	public var shareholderName: String = ""
	public var shares: Int = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"shareholderID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"shareholderName":EVESchemeElementType.String(elementName:nil, transformer:nil),
			"shares":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		]
	}
}

public class EVEShareholdersCharactersItem: EVEShareholdersItem {
	public var shareholderCorporationID: Int = 0
	public var shareholderCorporationName: String = ""
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		var scheme = super.scheme()
		scheme["shareholderCorporationID"] = EVESchemeElementType.Int(elementName:nil, transformer:nil)
		scheme["shareholderCorporationName"] = EVESchemeElementType.String(elementName:nil, transformer:nil)
		return scheme
	}
}

public class EVEShareholders: EVEResult {
	public var characters: [EVEShareholdersCharactersItem] = []
	public var corporations: [EVEShareholdersItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"characters":EVESchemeElementType.Rowset(elementName: nil, type: EVEShareholdersCharactersItem.self, transformer: nil),
			"corporations":EVESchemeElementType.Rowset(elementName: nil, type: EVEShareholdersItem.self, transformer: nil),
		]
	}
}
