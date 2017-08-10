//
//  CRResult.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 07.12.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation

public class CRResult: EVEObject {

	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	public class var contentType: String {get {return ""}}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [:]
	}
}
