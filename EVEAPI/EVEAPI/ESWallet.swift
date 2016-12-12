//
//  ESWallet.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 12.12.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation

public class ESWallet: EVEObject {
	public var balance: Double = 0
	public var walletID: Int = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"balance": EVESchemeElementType.Double(elementName: nil, transformer: {value in
				if let value = value as? Double {
					return value / 100.0
				}
				else {
					return nil
				}
			}),
			"walletID": EVESchemeElementType.Int(elementName: "wallet_id", transformer: nil),
		]
	}
}
