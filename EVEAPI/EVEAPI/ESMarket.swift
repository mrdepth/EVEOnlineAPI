//
//  ESMarket.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 09.12.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation

public class ESMarketPrice: EVEObject {
	public var typeID: Int = 0
	public var averagePrice: Double = 0
	public var adjustedPrice: Double = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"typeID": EVESchemeElementType.Int(elementName: "type_id", transformer: nil),
			"averagePrice": EVESchemeElementType.Double(elementName: "average_price", transformer: nil),
			"adjustedPrice": EVESchemeElementType.Double(elementName: "adjusted_price", transformer: nil),
		]
	}
}

public class ESMarketHistory: EVEObject {
	public var date: Date = Date.distantPast
	public var highest: Double = 0
	public var average: Double = 0
	public var lowest: Double = 0
	public var volume: Int = 0
	public var orderCount: Int = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"date": EVESchemeElementType.ESIDate(elementName: nil, transformer: nil),
			"highest": EVESchemeElementType.Double(elementName: nil, transformer: nil),
			"average": EVESchemeElementType.Double(elementName: nil, transformer: nil),
			"lowest": EVESchemeElementType.Double(elementName: nil, transformer: nil),
			"volume": EVESchemeElementType.Int(elementName: nil, transformer: nil),
			"orderCount": EVESchemeElementType.Int(elementName: "order_count", transformer: nil),
		]
	}
}

public class ESMarketOrder: EVEObject {
	public var duration: Int = 0
	public var isBuyOrder: Bool = false
	public var issued: Int64 = 0
	public var locationID: Int64 = 0
	public var minVolume: Int64 = 0
	public var orderID: Int64 = 0
	public var price: Double = 0
	public var range: ESMarketOrderRange = .jumps1
	public var typeID: Int = 0
	public var volumeRemain: Int64 = 0
	public var volumeTotal: Int64 = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"duration": EVESchemeElementType.Int(elementName: nil, transformer: nil),
		"isBuyOrder": EVESchemeElementType.Bool(elementName: "is_buy_order", transformer: nil),
		"issued": EVESchemeElementType.Int64(elementName: nil, transformer: nil),
		"locationID": EVESchemeElementType.Int64(elementName: "location_id", transformer: nil),
		"minVolume": EVESchemeElementType.Int64(elementName: "min_volume", transformer: nil),
		"orderID": EVESchemeElementType.Int64(elementName: "order_id", transformer: nil),
		"price": EVESchemeElementType.Double(elementName: nil, transformer: nil),
		"range":EVESchemeElementType.Int(elementName:"event_response", transformer:{ value in
			if let s = value as? String {
				return ESMarketOrderRange(s).rawValue
			}
			else {
				return nil
			}
		}),
		"typeID": EVESchemeElementType.Int(elementName: "type_id", transformer: nil),
		"volumeRemain": EVESchemeElementType.Int64(elementName: "volume_remain", transformer: nil),
		"volumeTotal": EVESchemeElementType.Int64(elementName: "volume_total", transformer: nil),
		]
	}
}

