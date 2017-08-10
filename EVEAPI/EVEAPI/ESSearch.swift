//
//  ESSearch.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 12.12.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation

public class ESSearch: ESResult {
	public var agent: [Int] = []
	public var alliance: [Int64] = []
	public var character: [Int64] = []
	public var corporation: [Int64] = []
	public var constellation: [Int] = []
	public var faction: [Int] = []
	public var inventoryType: [Int] = []
	public var region: [Int] = []
	public var solarSystem: [Int] = []
	public var station: [Int] = []
	public var wormhole: [Int] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"agent": EVESchemeElementType.Array(elementName: nil, type: Int.self, transformer: nil),
			"alliance": EVESchemeElementType.Array(elementName: nil, type: Int64.self, transformer: nil),
			"character": EVESchemeElementType.Array(elementName: nil, type: Int64.self, transformer: nil),
			"corporation": EVESchemeElementType.Array(elementName: nil, type: Int64.self, transformer: nil),
			"constellation": EVESchemeElementType.Array(elementName: nil, type: Int.self, transformer: nil),
			"faction": EVESchemeElementType.Array(elementName: nil, type: Int.self, transformer: nil),
			"inventoryType": EVESchemeElementType.Array(elementName: "inventorytype", type: Int.self, transformer: nil),
			"region": EVESchemeElementType.Array(elementName: nil, type: Int.self, transformer: nil),
			"solarSystem": EVESchemeElementType.Array(elementName: "solarsystem", type: Int.self, transformer: nil),
			"station": EVESchemeElementType.Array(elementName: nil, type: Int.self, transformer: nil),
			"wormhole": EVESchemeElementType.Array(elementName: nil, type: Int.self, transformer: nil),
		]
	}
}
