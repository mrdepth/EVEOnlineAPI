//
//  ESUniverse.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 12.12.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation

public class ESName: EVEObject {
	public var category: ESNameCategory = .none
	public var id: Int64 = 0
	public var name: String = ""
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"category":EVESchemeElementType.Int(elementName:nil, transformer:{ value in
				if let s = value as? String {
					return ESNameCategory(s).rawValue
				}
				else {
					return nil
				}
			}),
			"id": EVESchemeElementType.Int(elementName: nil, transformer: nil),
			"name": EVESchemeElementType.String(elementName: nil, transformer: nil),
		]
	}
}

public class ESStation: ESResult {
	public var solarSystemID: Int = 0
	public var stationName: String = ""
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"solarSystemID": EVESchemeElementType.Int(elementName: "solar_system_id", transformer: nil),
			"stationName": EVESchemeElementType.String(elementName: "station_name", transformer: nil),
		]
	}
}

public class ESStructure: ESResult {
	public var solarSystemID: Int = 0
	public var name: String = ""
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"solarSystemID": EVESchemeElementType.Int(elementName: "solar_system_id", transformer: nil),
			"name": EVESchemeElementType.String(elementName: nil, transformer: nil),
		]
	}
}

public class ESType: ESResult {
	public var categoryID: Int = 0
	public var graphicID: Int = 0
	public var groupID: Int = 0
	public var iconID: Int = 0
	public var typeDescription: String = ""
	public var typeName: String = ""
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"categoryID": EVESchemeElementType.Int(elementName: "category_id", transformer: nil),
		"graphicID": EVESchemeElementType.Int(elementName: "graphic_id", transformer: nil),
		"groupID": EVESchemeElementType.Int(elementName: "group_id", transformer: nil),
		"iconID": EVESchemeElementType.Int(elementName: "icon_id", transformer: nil),
		"typeDescription": EVESchemeElementType.String(elementName: "type_description", transformer: nil),
		"typeName": EVESchemeElementType.String(elementName: "type_name", transformer: nil),
		]
	}
}
