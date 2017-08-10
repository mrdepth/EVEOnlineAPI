//
//  EVEErrorList.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 30.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEErrorListItem: EVEObject {
	public var errorCode: Int = 0
	public var errorText: String = ""
	
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"errorCode":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"errorText":EVESchemeElementType.String(elementName:nil, transformer:nil),
		]
	}
}

public class EVEErrorList: EVEResult {
	public var errors: [EVEErrorListItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"errors":EVESchemeElementType.Rowset(elementName: nil, type: EVEErrorListItem.self, transformer: nil)
		]
	}
}

