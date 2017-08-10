//
//  EVEWalletTransactions.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEWalletTransactionsItem: EVEObject {
	public var transactionDateTime: Date = Date.distantPast
	public var transactionID: Int64 = 0
	public var quantity: Int = 0
	public var typeName: String = ""
	public var typeID: Int = 0
	public var price: Double = 0
	public var clientID: Int64 = 0
	public var clientName: String = ""
	public var stationID: Int = 0
	public var stationName: String = ""
	public var transactionType: String = ""
	public var transactionFor: String = ""
	public var journalTransactionID: Int64 = 0
	public var clientTypeID: Int = 0
	public var characterID: Int64 = 0
	public var characterName: String = ""

	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"transactionDateTime":EVESchemeElementType.Date(elementName:nil, transformer:nil),
		"transactionID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"quantity":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"typeName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"typeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"price":EVESchemeElementType.Double(elementName:nil, transformer:nil),
		"clientID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"clientName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"stationID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"stationName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"transactionType":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"transactionFor":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"journalTransactionID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"clientTypeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"characterID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"characterName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		]
	}
}

public class EVEWalletTransactions: EVEResult {
	public var transactions: [EVEWalletTransactionsItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"transactions":EVESchemeElementType.Rowset(elementName: nil, type: EVEWalletTransactionsItem.self, transformer: nil),
		]
	}
}
