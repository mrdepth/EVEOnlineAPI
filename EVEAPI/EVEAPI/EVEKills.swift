//
//  EVEKills.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 30.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEKillsItem: EVEObject {
	public var solarSystemID: Int = 0
	public var shipKills: Int = 0
	public var factionKills: Int = 0
	public var podKills: Int = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"solarSystemID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"shipKills":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"factionKills":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"podKills":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		]
	}
}

public class EVEKills: EVEResult {
	public var solarSystems: [EVEKillsItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"solarSystems":EVESchemeElementType.Rowset(elementName: nil, type: EVEKillsItem.self, transformer: nil)
		]
	}
}

