//
//  EVEFacWarSystems.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 30.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEFacWarSystemsItem: EVEObject {
	public var solarSystemID: Int = 0
	public var solarSystemName: String = ""
	public var occupyingFactionID: Int64 = 0
	public var occupyingFactionName: String = ""
	public var owningFactionID: Int64 = 0
	public var owningFactionName: String = ""
	public var contested: Bool = false
	public var victoryPoints: Int = 0
	public var victoryPointThreshold: Int = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"solarSystemID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"solarSystemName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"occupyingFactionID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"occupyingFactionName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"owningFactionID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"owningFactionName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"contested":EVESchemeElementType.Bool(elementName:nil, transformer:nil),
		"victoryPoints":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"victoryPointThreshold":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		]
	}
}

public class EVEFacWarSystems: EVEResult {
	public var solarSystems: [EVEFacWarSystemsItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"solarSystems":EVESchemeElementType.Rowset(elementName: nil, type: EVEFacWarSystemsItem.self, transformer: nil)
		]
	}
}
