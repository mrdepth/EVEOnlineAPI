//
//  ESInsurance.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 12.12.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation

public class ESInsuranceLevel: EVEObject {
	public var cost: Double = 0
	public var name: String = ""
	public var payout: Double = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"cost": EVESchemeElementType.Double(elementName: nil, transformer: nil),
			"name": EVESchemeElementType.String(elementName: nil, transformer: nil),
			"payout": EVESchemeElementType.Double(elementName: nil, transformer: nil),
		]
	}
}

public class ESInsurance: EVEObject {
	public var levels: [ESInsuranceLevel] = []
	public var typeID: Int = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"levels": EVESchemeElementType.Array(elementName: nil, type: ESInsuranceLevel.self, transformer: nil),
			"typeID": EVESchemeElementType.Int(elementName: "type_id", transformer: nil),
		]
	}
}
