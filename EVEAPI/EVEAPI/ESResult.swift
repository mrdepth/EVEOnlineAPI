//
//  ESResult.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 09.12.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation

public class ESResult: EVEObject {
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [:]
	}
}

public class ESArray<T>: ESResult {
	public var array: [Any] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return ["array": EVESchemeElementType.Array(elementName: "items", type: T.self, transformer: nil),]
	}
}

/*public class ESDictionary<T, key, value>: ESResult {
	public var dictionary: [String:T] = [:]
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return ["dictionary": EVESchemeElementType.Dictionary(elementName: "items", key: key, value: value, transformer: nil),]
	}
}
*/
