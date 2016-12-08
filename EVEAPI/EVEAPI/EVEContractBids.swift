//
//  EVEContractBids.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEContractBidsItem: EVEObject {
	public var bidID: Int = 0
	public var contractID: Int64 = 0
	public var bidderID: Int64 = 0
	public var dateBid: Date = Date.distantPast
	public var amount: Double = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"bidID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"contractID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"bidderID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"dateBid":EVESchemeElementType.String(elementName:nil, transformer:nil),
			"amount":EVESchemeElementType.Double(elementName:nil, transformer:nil),
		]
	}
}


public class EVEContractBids: EVEResult {
	public var bidList: [EVEContractBidsItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"bidList":EVESchemeElementType.Rowset(elementName: nil, type: EVEContractBidsItem.self, transformer: nil),
		]
	}
}
