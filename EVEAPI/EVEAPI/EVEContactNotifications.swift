//
//  EVEContactNotifications.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEContactNotificationsItem: EVEObject {
	public var notificationID: Int = 0
	public var senderID: Int = 0
	public var senderName: String = ""
	public var sentDate: Date = Date.distantPast
	public var messageData: String = ""
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"notificationID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"senderID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"senderName":EVESchemeElementType.String(elementName:nil, transformer:nil),
			"sentDate":EVESchemeElementType.Date(elementName:nil, transformer:nil),
			"messageData":EVESchemeElementType.String(elementName:nil, transformer:nil),
		]
	}
}


public class EVEContactNotifications: EVEResult {
	public var contactNotifications: [EVEContactNotificationsItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"contactNotifications":EVESchemeElementType.Rowset(elementName: nil, type: EVEContactNotificationsItem.self, transformer: nil),
		]
	}
}
