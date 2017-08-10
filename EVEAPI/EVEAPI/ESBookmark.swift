//
//  ESBookmark.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 09.12.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation

public class ESCoordinates: EVEObject {
	public var x: Double = 0
	public var y: Double = 0
	public var z: Double = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"x": EVESchemeElementType.Double(elementName: nil, transformer: nil),
			"y": EVESchemeElementType.Double(elementName: nil, transformer: nil),
			"z": EVESchemeElementType.Double(elementName: nil, transformer: nil),
		]
	}
}

public class ESBookmarkItem: EVEObject {
	public var itemID: Int64 = 0
	public var typeID: Int = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"itemID": EVESchemeElementType.Int64(elementName: nil, transformer: nil),
			"typeID": EVESchemeElementType.Int(elementName: nil, transformer: nil),
		]
	}
}

public class ESBookmarkTarget: EVEObject {
	public var coordinates: ESCoordinates?
	public var item: ESBookmarkItem?
	public var locationID: Int64 = 0
	
	public override init() {
		super.init()
	}
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"coordinates": EVESchemeElementType.Object(elementName: nil, type: ESCoordinates.self, transformer: nil),
			"item": EVESchemeElementType.Object(elementName: nil, type: ESBookmarkItem.self, transformer: nil),
			"locationID": EVESchemeElementType.Int64(elementName: "location_id", transformer: nil),
		]
	}
}


public class ESBookmark: EVEObject {
	public var bookmarkID: Int64 = 0
	public var createDate: Date = Date.distantPast
	public var creatorID: Int64 = 0
	public var folderID: Int = 0
	public var memo: String = ""
	public var note: String = ""
	public var ownerID: Int64 = 0
	public var target: ESBookmarkTarget = ESBookmarkTarget()
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"bookmarkID": EVESchemeElementType.Int64(elementName: "bookmark_id", transformer: nil),
		"createDate": EVESchemeElementType.ESIDate(elementName: "create_date", transformer: nil),
		"creatorID": EVESchemeElementType.Int64(elementName: "creator_id", transformer: nil),
		"folderID": EVESchemeElementType.Int(elementName: "folder_id", transformer: nil),
		"memo": EVESchemeElementType.String(elementName: nil, transformer: nil),
		"note": EVESchemeElementType.String(elementName: nil, transformer: nil),
		"ownerID": EVESchemeElementType.Int64(elementName: "owner_id", transformer: nil),
		"target": EVESchemeElementType.Object(elementName: nil, type: ESBookmarkTarget.self, transformer: nil),
		]
	}
}

public class ESBookmarkFolder: EVEObject {
	public var folderID: Int = 0
	public var ownerID: Int64 = 0
	public var name: String = ""
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"folderID": EVESchemeElementType.Int(elementName: "folder_id", transformer: nil),
			"ownerID": EVESchemeElementType.Int64(elementName: "owner_id", transformer: nil),
			"name": EVESchemeElementType.String(elementName: nil, transformer: nil),
		]
	}
}
