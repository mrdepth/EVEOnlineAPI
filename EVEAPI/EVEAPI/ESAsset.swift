//
//  ESAsset.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 09.12.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation

public class ESAsset: EVEObject {
	public var singleton: Bool = false
	public var itemID: Int64 = 0
	public var locationFlag: ESLocationFlag = .none
	public var locationID: Int64 = 0
	public var locationType: ESLocationType = .other
	public var typeID: Int = 0
	public var quantity: Int = 1
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"singleton": EVESchemeElementType.Bool(elementName: "is_singleton", transformer: nil),
			"itemID": EVESchemeElementType.Int64(elementName: "item_id", transformer: nil),
			"locationFlag":EVESchemeElementType.Int(elementName:"location_flag", transformer:{(value:Any?) -> Any? in
				if let s = value as? String {
					return ESLocationFlag(s).rawValue
				}
				else {
					return ESLocationFlag.none.rawValue
				}
			}),
			"locationID": EVESchemeElementType.Int64(elementName: "location_id", transformer: nil),
			"locationType":EVESchemeElementType.Int(elementName:"location_type", transformer:{(value:Any?) -> Any? in
				if let s = value as? String {
					return ESLocationType(s).rawValue
				}
				else {
					return ESLocationType.other.rawValue
				}
			}),
			"typeID": EVESchemeElementType.Int(elementName: "type_id", transformer: nil),
			"quantity": EVESchemeElementType.Int(elementName: nil, transformer: nil),
		]
	}
}
