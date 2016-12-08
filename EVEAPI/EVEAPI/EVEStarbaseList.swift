//
//  EVEStarbaseList.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 30.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEStarbaseListItem: EVEObject {
	public var itemID: Int64 = 0
	public var typeID: Int = 0
	public var locationID: Int64 = 0
	public var moonID: Int = 0
	public var state: EVEPOSState = .Offline
	public var stateTimestamp: Date = Date.distantPast
	public var onlineTimestamp: Date = Date.distantPast
	public var standingOwnerID: Int64 = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"itemID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"typeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"locationID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"moonID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"state":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"stateTimestamp":EVESchemeElementType.Date(elementName:nil, transformer:nil),
		"onlineTimestamp":EVESchemeElementType.Date(elementName:nil, transformer:nil),
		"standingOwnerID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		]
	}
}


public class EVEStarbaseList: EVEResult {
	public var starbases: [EVEStarbaseListItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"starbases":EVESchemeElementType.Rowset(elementName: nil, type: EVEStarbaseListItem.self, transformer: nil),
		]
	}
}

