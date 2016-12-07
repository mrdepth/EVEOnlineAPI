//
//  CRType.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 07.12.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation

public class CRType: EVEObject {
	public var typeID: Int = 0
	public var typeName: String = ""
	
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
			"typeID": EVESchemeElementType.Int(elementName: "id", transformer: nil),
			"typeName": EVESchemeElementType.String(elementName: "name", transformer: nil)
		]
	}
	
	public var dictionary: [String: Any] {
		return [
			"id": typeID,
			"name": self.typeName,
			"href": "https://crest-tq.eveonline.com/inventory/types/\(typeID)/"
		]
	}
}
