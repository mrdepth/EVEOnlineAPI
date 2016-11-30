//
//  EVEOutpostServiceDetail.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 30.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEOutpostServiceDetailItem: EVEObject {
	public var stationID: Int = 0
	public var ownerID: Int = 0
	public var serviceName: String = ""
	public var minStanding: Double = 0
	public var surchargePerBadStanding: Double = 0
	public var discountPerGoodStanding: Double = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"stationID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"ownerID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"serviceName":EVESchemeElementType.String(elementName:nil, transformer:nil),
			"minStanding":EVESchemeElementType.Double(elementName:nil, transformer:nil),
			"surchargePerBadStanding":EVESchemeElementType.Double(elementName:nil, transformer:nil),
			"discountPerGoodStanding":EVESchemeElementType.Double(elementName:nil, transformer:nil),
		]
	}
}


public class EVEOutpostServiceDetail: EVEResult {
	public var outpostServiceDetails: [EVEOutpostServiceDetailItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"outpostServiceDetails":EVESchemeElementType.Rowset(elementName: nil, type: EVEOutpostServiceDetailItem.self, transformer: nil),
		]
	}
}
