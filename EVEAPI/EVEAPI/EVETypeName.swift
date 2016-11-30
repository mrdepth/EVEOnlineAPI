//
//  EVETypeName.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 30.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVETypeNameItem: EVEObject {
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

public class EVETypeName: EVEResult {
	public var types: [EVETypeNameItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"types":EVESchemeElementType.Rowset(elementName: nil, type: EVETypeNameItem.self, transformer: nil)
		]
	}
}
