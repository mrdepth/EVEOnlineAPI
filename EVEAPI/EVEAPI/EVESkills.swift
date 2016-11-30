//
//  EVESkills.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVESkillsItem: EVEObject {
	public var typeID: Int = 0
	public var typeName: String = ""
	public var skillpoints: Int = 0
	public var level: Int = 0
	public var published: Bool = false
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"typeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"typeName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"skillpoints":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"level":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"published":EVESchemeElementType.Bool(elementName:nil, transformer:nil),
		]
	}
}

public class EVESkills: EVEResult {
	public var research: [EVESkillsItem] = []
	public var freeSkillPoints: Int = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"skills":EVESchemeElementType.Rowset(elementName: nil, type: EVESkillsItem.self, transformer: nil),
			"freeSkillPoints":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		]
	}
}

