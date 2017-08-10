//
//  EVEAccountBalance.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEAccountBalanceItem: EVEObject {
	public var accountID: Int = 0
	public var accountKey: Int = 0
	public var balance: Double = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"accountID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"accountKey":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"balance":EVESchemeElementType.Double(elementName:nil, transformer:nil),
		]
	}
}

public class EVEAccountBalance: EVEResult {
	public var accounts: [EVEAccountBalanceItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"accounts":EVESchemeElementType.Rowset(elementName: nil, type: EVEAccountBalanceItem.self, transformer: nil)
		]
	}
}
