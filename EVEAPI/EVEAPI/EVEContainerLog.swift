//
//  EVEContainerLog.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEContainerLogItem: EVEObject {
	public var logTime: Date = Date.distantPast
	public var itemID: Int64 = 0
	public var itemTypeID: Int = 0
	public var actorID: Int64 = 0
	public var actorName: String = ""
	public var flag: EVEInventoryFlag = .none
	public var locationID: Int64 = 0
	public var action: String = ""
	public var passwordType: String = ""
	public var typeID: Int = 0
	public var quantity: Int = 0
	public var oldConfiguration: String = ""
	public var theNewConfiguration: String = ""
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"logTime":EVESchemeElementType.Date(elementName:nil, transformer:nil),
		"itemID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"itemTypeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"actorID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"actorName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"flag":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"locationID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"action":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"passwordType":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"typeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"quantity":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"oldConfiguration":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"theNewConfiguration":EVESchemeElementType.String(elementName:"newConfiguration", transformer:nil),
		]
	}
}

public class EVEContainerLog: EVEResult {
	public var containerLog: [EVEContainerLogItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"containerLog":EVESchemeElementType.Rowset(elementName: nil, type: EVEContainerLogItem.self, transformer: nil)
		]
	}
}
