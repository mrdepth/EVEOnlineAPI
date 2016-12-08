//
//  EVEMailBodies.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEMailBodiesItem: EVEObject {
	public var messageID: Int64 = 0
	public var text: String = ""
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"messageID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"text":EVESchemeElementType.String(elementName:nil, transformer:nil),
		]
	}
}


public class EVEMailBodies: EVEResult {
	public var messages: [EVEMailBodiesItem] = []
	public var missingMessageIDs: [Int] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"messages":EVESchemeElementType.Rowset(elementName: nil, type: EVEMailBodiesItem.self, transformer: nil),
			"missingMessageIDs":EVESchemeElementType.IntList(elementName: nil, transformer: nil),
		]
	}
}

