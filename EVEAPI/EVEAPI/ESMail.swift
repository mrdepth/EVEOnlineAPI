//
//  ESMail.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 12.12.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation

public class ESMailRecipient: EVEObject {
	public var recipientID: Int64 = 0
	public var recipientType: ESRecipientType = .character
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"recipientID": EVESchemeElementType.Int64(elementName: "recipient_id", transformer: nil),
			"recipientType": EVESchemeElementType.Int(elementName: "recipient_type", transformer:{(value:Any?) -> Any? in
				if let s = value as? String {
					return ESRecipientType(s).rawValue
				}
				else {
					return ESRecipientType.character.rawValue
				}
			}),
		]
	}
}

public class ESMail: EVEObject {
	public var from: Int64 = 0
	public var isRead: Bool = false
	public var labels: [Int64] = []
	public var mailID: Int64 = 0
	public var recipients: [ESMailRecipient] = []
	public var subject: String = ""
	public var timestamp: Date = Date.distantPast
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"from": EVESchemeElementType.Int64(elementName: nil, transformer: nil),
		"isRead": EVESchemeElementType.Bool(elementName: "is_read", transformer: nil),
		"labels": EVESchemeElementType.Array(elementName: nil, type: Int64.self, transformer: nil),
		"mailID": EVESchemeElementType.Int64(elementName: "mail_id", transformer: nil),
		"recipients": EVESchemeElementType.Array(elementName: nil, type: ESMailRecipient.self, transformer: nil),
		"subject": EVESchemeElementType.String(elementName: nil, transformer: nil),
		"timestamp": EVESchemeElementType.ESIDate(elementName: nil, transformer: nil),
		]
	}
}

public class ESMailBody: ESResult {
	public var body: String = ""
	public var from: Int64 = 0
	public var labels: [Int64] = []
	public var isRead: Bool = false
	public var recipients: [ESMailRecipient] = []
	public var subject: String = ""
	public var timestamp: Date = Date.distantPast
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"body": EVESchemeElementType.String(elementName: nil, transformer: nil),
			"from": EVESchemeElementType.Int64(elementName: nil, transformer: nil),
			"labels": EVESchemeElementType.Array(elementName: nil, type: Int64.self, transformer: nil),
			"isRead": EVESchemeElementType.Bool(elementName: "read", transformer: nil),
			"recipients": EVESchemeElementType.Array(elementName: nil, type: ESMailRecipient.self, transformer: nil),
			"subject": EVESchemeElementType.String(elementName: nil, transformer: nil),
			"timestamp": EVESchemeElementType.ESIDate(elementName: nil, transformer: nil),
		]
	}
}

public class ESMailLabel: EVEObject {
	public var color: UIColor = UIColor.white
	public var labelID: Int64 = 0
	public var name: String = ""
	public var unreadCount: Int = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"color": EVESchemeElementType.Object(elementName: nil, type: nil, transformer: {(value: Any?) -> Any? in
				guard let s = value as? String else {return nil}
				if !s.isEmpty && s[s.startIndex] == "#" {
					let end = s.endIndex
					var start = s.index(after: s.startIndex)
					var rgba: [CGFloat] = [0, 0, 0, 1]
					var i = 0
					while start < end {
						let end = min(s.index(start, offsetBy: 2), end)
						let scanner = Scanner(string: s.substring(with: start..<end))
						var n: UInt32 = 0
						scanner.scanHexInt32(&n)
						rgba[i] = CGFloat(n) / 255.0
						start = end
						i += 1
					}
					return UIColor(red: rgba[0], green: rgba[1], blue: rgba[2], alpha: rgba[3])
				}
				else {
					return nil
				}
			}),
			"labelID": EVESchemeElementType.Int64(elementName: "label_id", transformer: nil),
			"name": EVESchemeElementType.String(elementName: nil, transformer: nil),
			"unreadCount": EVESchemeElementType.Int(elementName: "unread_count", transformer: nil),
		]
	}
}

public class ESMailLabels: ESResult {
	public var labels: [ESMailLabel] = []
	public var totalUnreadCount: Int = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"labels": EVESchemeElementType.Array(elementName: nil, type: ESMailLabel.self, transformer: nil),
			"totalUnreadCount": EVESchemeElementType.Int(elementName: "total_unread_count", transformer: nil),
		]
	}
}


public class ESMailingList: EVEObject {
	public var mailingListID: Int = 0
	public var name: String = ""
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"mailingListID": EVESchemeElementType.Int(elementName: "mailing_list_id", transformer: nil),
			"name": EVESchemeElementType.String(elementName: nil, transformer: nil),
		]
	}
}
