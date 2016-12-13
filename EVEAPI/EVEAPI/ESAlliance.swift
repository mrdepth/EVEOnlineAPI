//
//  ESAlliance.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 09.12.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation

public class ESAlliance: ESResult {
	public var ticker: String = ""
	public var dateFounded: Date = Date.distantPast
	public var executorCorp: Int64 = 0
	public var allianceName: String = ""
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"ticker": EVESchemeElementType.String(elementName: nil, transformer: nil),
		"dateFounded": EVESchemeElementType.ESIDate(elementName: "date_founded", transformer: nil),
		"executorCorp": EVESchemeElementType.Int64(elementName: "executor_corp", transformer: nil),
		"allianceName": EVESchemeElementType.String(elementName: "alliance_name", transformer: nil),
		]
	}
}

public class ESAllianceNames: ESResult {
	public var names: [Int64: String] = [:]
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"names": EVESchemeElementType.Dictionary(elementName: "items", key: "alliance_id", value: "alliance_name", transformer: nil)
		]
	}
}

public class ESAllianceIcons: ESResult {
	public var icon64: String?
	public var icon128: String?
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"icon64": EVESchemeElementType.String(elementName: "px64x64", transformer: nil),
			"icon128": EVESchemeElementType.String(elementName: "px128x128", transformer: nil),
		]
	}
}
