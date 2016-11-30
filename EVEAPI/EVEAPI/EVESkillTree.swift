//
//  EVESkillTree.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 30.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit


public class EVESkillTreeRequiredAttributes: EVEObject {
	public var primaryAttribute: EVECharacterAttribute = .Intelligence
	public var secondaryAttribute: EVECharacterAttribute = .Intelligence
	
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
			"primaryAttribute":EVESchemeElementType.Int(elementName:nil, transformer:{(value:Any?) -> Any? in
				if let s = value as? String {
					return EVECharacterAttribute(s).rawValue
				}
				else {
					return EVECharacterAttribute.Intelligence.rawValue
				}
			}),
			"secondaryAttribute":EVESchemeElementType.Int(elementName:nil, transformer:{(value:Any?) -> Any? in
				if let s = value as? String {
					return EVECharacterAttribute(s).rawValue
				}
				else {
					return EVECharacterAttribute.Intelligence.rawValue
				}
			}),
		]
	}
}

public class EVESkillTreeRequiredSkill: EVEObject {
	public var typeID: Int = 0
	public var skillLevel: Int = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"typeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"skillLevel":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		]
	}
}

public class EVESkillTreeSkillBonusCollectionItem: EVEObject {
	public var bonusType: String = ""
	public var bonusValue: Int = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"bonusType":EVESchemeElementType.String(elementName:nil, transformer:nil),
			"bonusValue":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		]
	}
}

public class EVESkillTreeSkillGroup: EVEObject {
	public var groupID: Int = 0
	public var groupName: String = ""
	public var skills: [EVESkillTreeSkillsItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"groupID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"groupName":EVESchemeElementType.String(elementName:nil, transformer:nil),
			"skills":EVESchemeElementType.Rowset(elementName: nil, type: EVESkillTreeSkillsItem.self, transformer: nil)
		]
	}
}

public class EVESkillTreeSkillsItem: EVEObject {
	public var groupID: Int = 0
	public var typeID: Int = 0
	public var typeName: String = ""
	public var skillDescription: String = ""
	public var rank: Int = 0
	public var requiredSkills: [EVESkillTreeRequiredSkill] = []
	public var requiredAttributes: EVESkillTreeRequiredAttributes = EVESkillTreeRequiredAttributes()
	public var skillBonusCollection: [EVESkillTreeSkillBonusCollectionItem] = []
	public var published: Bool = false
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"groupID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"typeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"typeName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"skillDescription":EVESchemeElementType.String(elementName:"description", transformer:nil),
		"rank":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"requiredSkills":EVESchemeElementType.Rowset(elementName: nil, type: EVESkillTreeRequiredSkill.self, transformer: nil),
		"requiredAttributes":EVESchemeElementType.Object(elementName: nil, type: EVESkillTreeRequiredAttributes.self, transformer: nil),
		"skillBonusCollection":EVESchemeElementType.Rowset(elementName: nil, type: EVESkillTreeSkillBonusCollectionItem.self, transformer: nil),
		"published":EVESchemeElementType.Bool(elementName:nil, transformer:nil),
		]
	}
}

public class EVESkillTree: EVEResult {
	public var skillGroups: [EVESkillTreeSkillGroup] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"skillGroups":EVESchemeElementType.Rowset(elementName: nil, type: EVESkillTreeSkillGroup.self, transformer: nil)
		]
	}
}

