//
//  EVEAssetList.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEAssetListItem: EVEObject {
	public var itemID: Int64 = 0
	public var locationID: Int64 = 0
	public var typeID: Int = 0
	public var quantity: Int64 = 0
	public var rawQuantity: Int64 = 0
	public var flag: EVEInventoryFlag = .none
	public var singleton: Bool = false
	public var contents:[EVEAssetListItem] = []
	public weak var parent:EVEAssetListItem? = nil
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
		for item in contents {
			item.parent = self
		}
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		for item in contents {
			item.parent = self
		}
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"itemID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"locationID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"typeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"quantity":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"rawQuantity":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"flag":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"singleton":EVESchemeElementType.Bool(elementName:nil, transformer:nil),
			"contents":EVESchemeElementType.Rowset(elementName: nil, type: EVEAssetListItem.self, transformer: nil)
		]
	}
}

public class EVEAssetList: EVEResult {
	public var assets: [EVEAssetListItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"assets":EVESchemeElementType.Rowset(elementName: nil, type: EVEAssetListItem.self, transformer: nil)
		]
	}
}
