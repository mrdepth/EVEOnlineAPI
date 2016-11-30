//
//  EVERefTypes.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 30.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVERefTypesItem: EVEObject {
	public var refTypeID: Int = 0
	public var refTypeName: String = ""
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"refTypeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"refTypeName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		]
	}
}

public class EVERefTypes: EVEResult {
	public var refTypes: [EVERefTypesItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"refTypes":EVESchemeElementType.Rowset(elementName: nil, type: EVEOwnerIDItem.self, transformer: nil)
		]
	}
}

