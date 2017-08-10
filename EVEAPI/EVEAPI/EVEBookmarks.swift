//
//  EVEBookmarks.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEBookmarksItem: EVEObject {
	public var bookmarkID: Int64 = 0
	public var creatorID: Int64 = 0
	public var created:Date = Date.distantPast
	public var itemID: Int64 = 0
	public var typeID:Int = 0
	public var locationID:Int64 = 0
	public var x:Double = 0
	public var y:Double = 0
	public var z:Double = 0
	public var memo:String = ""
	public var note:String = ""
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"bookmarkID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"creatorID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"created":EVESchemeElementType.Date(elementName:nil, transformer:nil),
			"itemID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"typeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"locationID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"x":EVESchemeElementType.Double(elementName:nil, transformer:nil),
			"y":EVESchemeElementType.Double(elementName:nil, transformer:nil),
			"z":EVESchemeElementType.Double(elementName:nil, transformer:nil),
			"memo":EVESchemeElementType.String(elementName:nil, transformer:nil),
			"note":EVESchemeElementType.String(elementName:nil, transformer:nil),
		]
	}
}

public class EVEBookmarksFolder: EVEObject {
	public var folderID: Int = 0
	public var folderName: String = ""
	public var creatorID: Int64 = 0
	public var bookmarks: [EVEBookmarksItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"folderID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"folderName":EVESchemeElementType.String(elementName:nil, transformer:nil),
			"creatorID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"bookmarks":EVESchemeElementType.Rowset(elementName: nil, type: EVEBookmarksItem.self, transformer: nil)
		]
	}
}

public class EVEBookmarks: EVEResult {
	public var folders: [EVEBookmarksFolder] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"folders":EVESchemeElementType.Rowset(elementName: nil, type: EVEBookmarksFolder.self, transformer: nil)
		]
	}
}

