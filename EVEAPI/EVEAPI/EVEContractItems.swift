//
//  EVEContractItems.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEContractItemsItem: EVEObject {
	public var recordID: Int = 0
	public var typeID: Int = 0
	public var quantity: Int = 0
	public var rawQuantity: Int = 0
	public var singleton: Bool = false
	public var included: Bool = false
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"recordID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"typeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"quantity":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"rawQuantity":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"singleton":EVESchemeElementType.Bool(elementName:nil, transformer:nil),
			"included":EVESchemeElementType.Bool(elementName:nil, transformer:nil),
		]
	}
}


public class EVEContractItems: EVEResult {
	public var itemList: [EVEContractItemsItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"itemList":EVESchemeElementType.Rowset(elementName: nil, type: EVEContractItemsItem.self, transformer: nil),
		]
	}
}
