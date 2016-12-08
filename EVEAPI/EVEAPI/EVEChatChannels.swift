//
//  EVEChatChannels.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEChatChannelsAccessor: EVEObject {
	public var accessorID: Int64 = 0
	public var accessorName: String = ""
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"accessorID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"accessorName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		]
	}
}

public class EVEChatChannelsAccessorBlock: EVEChatChannelsAccessor {
	public var untilWhen: Date = Date.distantPast
	public var reason: String = ""
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		var scheme = super.scheme()
		scheme["untilWhen"] = EVESchemeElementType.Date(elementName:nil, transformer:nil)
		scheme["reason"] = EVESchemeElementType.String(elementName:nil, transformer:nil)
		return scheme
	}
}

public class EVEChatChannelsItem: EVEObject {
	public var channelID: Int = 0
	public var ownerID: Int64 = 0
	public var ownerName: String = ""
	public var displayName: String = ""
	public var comparisonKey: String = ""
	public var hasPassword: Bool = false
	public var motd: String = ""
	public var allowed: [EVEChatChannelsAccessor] = []
	public var blocked: [EVEChatChannelsAccessorBlock] = []
	public var muted: [EVEChatChannelsAccessorBlock] = []
	public var operators: [EVEChatChannelsAccessor] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"channelID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"ownerID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"ownerName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"displayName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"comparisonKey":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"hasPassword":EVESchemeElementType.Bool(elementName:nil, transformer:nil),
		"motd":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"allowed":EVESchemeElementType.Rowset(elementName: nil, type: EVEChatChannelsAccessor.self, transformer: nil),
		"blocked":EVESchemeElementType.Rowset(elementName: nil, type: EVEChatChannelsAccessorBlock.self, transformer: nil),
		"muted":EVESchemeElementType.Rowset(elementName: nil, type: EVEChatChannelsAccessorBlock.self, transformer: nil),
		"operators":EVESchemeElementType.Rowset(elementName: nil, type: EVEChatChannelsAccessor.self, transformer: nil),
		]
	}
}

public class EVEChatChannels: EVEResult {
	public var channels: [EVEChatChannelsItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"channels":EVESchemeElementType.Rowset(elementName: nil, type: EVEChatChannelsItem.self, transformer: nil)
		]
	}
}

