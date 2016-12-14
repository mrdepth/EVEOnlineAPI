//
//  ESClones.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 12.12.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation

public class ESLocation: EVEObject {
	public var locationID: Int64 = 0
	public var locationType: ESLocationType = .other
	
	public override init() {
		super.init()
	}
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"locationID": EVESchemeElementType.Int64(elementName: "location_id", transformer: nil),
			"locationType": EVESchemeElementType.Int(elementName: "location_type", transformer:{ value in
				if let s = value as? String {
					return ESLocationType(s).rawValue
				}
				else {
					return nil
				}
			}),
		]
	}
}

public class ESJumpClone: EVEObject {
	public var implants: [Int] = []
	public var location: ESLocation = ESLocation()
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"implants": EVESchemeElementType.Array(elementName: nil, type: Int.self, transformer: nil),
			"location": EVESchemeElementType.Object(elementName: "@self", type: ESLocation.self, transformer: nil),
		]
	}
}

public class ESClones: ESResult {
	public var homeLocation: ESLocation = ESLocation()
	public var jumpClones: [ESJumpClone] = []
	public var lastJumpDate: Date = Date.distantPast
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"homeLocation": EVESchemeElementType.Object(elementName: "home_location", type: ESLocation.self, transformer: nil),
			"jumpClones": EVESchemeElementType.Array(elementName: "jump_clones", type: ESJumpClone.self, transformer: nil),
			"lastJumpDate": EVESchemeElementType.ESIDate(elementName: "last_jump_date", transformer: nil),
		]
	}
}
