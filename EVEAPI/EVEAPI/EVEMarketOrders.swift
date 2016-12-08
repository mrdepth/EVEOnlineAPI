//
//  EVEMarketOrders.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEMarketOrdersItem: EVEObject {
	public var orderID: Int64 = 0
	public var charID: Int64 = 0
	public var stationID: Int = 0
	public var volEntered: Int = 0
	public var volRemaining: Int = 0
	public var minVolume: Int = 0
	public var orderState: EVEOrderState = .Closed
	public var typeID: Int = 0
	public var range: Int = 0
	public var accountKey: Int = 0
	public var duration: Int = 0
	public var escrow: Double = 0
	public var price: Double = 0
	public var bid: Bool = false
	public var issued: Date = Date.distantPast
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"orderID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"charID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"stationID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"volEntered":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"volRemaining":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"minVolume":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"orderState":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"typeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"range":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"accountKey":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"duration":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"escrow":EVESchemeElementType.Double(elementName:nil, transformer:nil),
			"price":EVESchemeElementType.Double(elementName:nil, transformer:nil),
			"bid":EVESchemeElementType.Bool(elementName:nil, transformer:nil),
			"issued":EVESchemeElementType.Date(elementName:nil, transformer:nil),
		]
	}
}


public class EVEMarketOrders: EVEResult {
	public var orders: [EVEMarketOrdersItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"orders":EVESchemeElementType.Rowset(elementName: nil, type: EVEMarketOrdersItem.self, transformer: nil),
		]
	}
}
