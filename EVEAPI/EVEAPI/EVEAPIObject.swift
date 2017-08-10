//
//  EVEAPIObject.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 28.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEAPIObject: EVEObject {
	public var currentTime: Date = Date()
	public var cachedUntil: Date = Date()
	public var cacheDate: Date = Date()
	public var version: String = ""
	public var error: Error?
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"currentTime":EVESchemeElementType.Date(elementName: nil, transformer: nil),
			"cachedUntil":EVESchemeElementType.Date(elementName: nil, transformer: nil),
			"cacheDate":EVESchemeElementType.Date(elementName: nil, transformer: nil),
			"version":EVESchemeElementType.String(elementName: nil, transformer: nil),
			"error":EVESchemeElementType.Error(elementName: nil, transformer: nil)
		]
	}
	
	
	//MARK: NSCoding
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

}
