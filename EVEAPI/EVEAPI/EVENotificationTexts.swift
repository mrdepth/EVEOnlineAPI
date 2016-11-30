//
//  EVENotificationTexts.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVENotificationTextsItem: EVEObject {
	public var notificationID: Int = 0
	public var text: String = ""
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"notificationID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"text":EVESchemeElementType.Int(elementName:"_", transformer:nil),
		]
	}
}


public class EVENotificationTexts: EVEResult {
	public var notifications: [EVENotificationTextsItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"notifications":EVESchemeElementType.Rowset(elementName: nil, type: EVENotificationTextsItem.self, transformer: nil),
		]
	}
}
