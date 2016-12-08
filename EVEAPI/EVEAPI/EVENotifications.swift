//
//  EVENotifications.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVENotificationsItem: EVEObject {
	public var notificationID: Int64 = 0
	public var typeID: Int = 0
	public var senderID: Int64 = 0
	public var senderName: String = ""
	public var sentDate: Date = Date.distantPast
	public var read: Bool = false
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"notificationID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"typeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"senderID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"senderName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"sentDate":EVESchemeElementType.Date(elementName:nil, transformer:nil),
		"read":EVESchemeElementType.Bool(elementName:nil, transformer:nil),
		]
	}
}


public class EVENotifications: EVEResult {
	public var notifications: [EVENotificationsItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"notifications":EVESchemeElementType.Rowset(elementName: nil, type: EVENotificationsItem.self, transformer: nil),
		]
	}
}
