//
//  EVECharacterID.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 30.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVECharacterIDItem: EVEObject {
	public var characterID: Int64 = 0
	public var name: String = ""
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"characterID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"name":EVESchemeElementType.String(elementName:nil, transformer:nil),
		]
	}
}

public class EVECharacterID: EVEResult {
	public var characters: [EVECharacterIDItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"characters":EVESchemeElementType.Rowset(elementName: nil, type: EVECharacterIDItem.self, transformer: nil)
		]
	}
}
