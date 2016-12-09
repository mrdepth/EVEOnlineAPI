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

