//
//  EVEMailMessages.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEMailMessagesItem: EVEObject {
	public var messageID: Int = 0
	public var senderID: Int = 0
	public var senderName: String = ""
	public var sentDate: Date = Date.distantPast
	public var title: String = ""
	public var toCorpOrAllianceID: Int = 0
	public var toCharacterIDs: [Int] = []
	public var toListID: [Int] = []
	public var senderTypeID: Int = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"messageID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"senderID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"senderName":EVESchemeElementType.String(elementName:nil, transformer:nil),
			"sentDate":EVESchemeElementType.Date(elementName:nil, transformer:nil),
			"title":EVESchemeElementType.String(elementName:nil, transformer:nil),
			"toCorpOrAllianceID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"toCharacterIDs":EVESchemeElementType.IntList(elementName:nil, transformer:nil),
			"toListID":EVESchemeElementType.IntList(elementName:nil, transformer:nil),
			"senderTypeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		]
	}
}


public class EVEMailMessages: EVEResult {
	public var messages: [EVEMailMessagesItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"messages":EVESchemeElementType.Rowset(elementName: nil, type: EVEMailMessagesItem.self, transformer: nil)
		]
	}
}
