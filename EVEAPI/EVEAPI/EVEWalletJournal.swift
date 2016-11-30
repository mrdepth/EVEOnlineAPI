//
//  EVEWalletJournal.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEWalletJournalItem: EVEObject {
	public var date: Date = Date.distantPast
	public var refID: Int64 = 0
	public var refTypeID: Int = 0
	public var ownerName1: String = ""
	public var ownerID1: Int = 0
	public var ownerName2: String = ""
	public var ownerID2: Int = 0
	public var argName1: String = ""
	public var argID1: Int = 0
	public var amount: Double = 0
	public var balance: Double = 0
	public var reason: String = ""
	public var owner1TypeID: Int = 0
	public var owner2TypeID: Int = 0
	public var taxReceiverID: Int = 0
	public var taxAmount: Double = 0

	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"date":EVESchemeElementType.Date(elementName:nil, transformer:nil),
		"refID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"refTypeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"ownerName1":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"ownerID1":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"ownerName2":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"ownerID2":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"argName1":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"argID1":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"amount":EVESchemeElementType.Double(elementName:nil, transformer:nil),
		"balance":EVESchemeElementType.Double(elementName:nil, transformer:nil),
		"reason":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"owner1TypeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"owner2TypeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"taxReceiverID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"taxAmount":EVESchemeElementType.Double(elementName:nil, transformer:nil),
		]
	}
}

public class EVEWalletJournal: EVEResult {
	public var transactions: [EVEWalletJournalItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"transactions":EVESchemeElementType.Rowset(elementName: nil, type: EVEWalletJournalItem.self, transformer: nil),
		]
	}
}

public class EVEWalletJournalCorp: EVEWalletJournal {
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"transactions":EVESchemeElementType.Rowset(elementName: "entries", type: EVEWalletJournalItem.self, transformer: nil),
		]
	}
}
