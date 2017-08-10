//
//  ESSkills.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 12.12.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation

public class ESSkillQueueItem: EVEObject {
	public var finishDate: Date?
	public var finishedLevel: Int = 0
	public var levelEndSP: Int = 0
	public var levelStartSP: Int = 0
	public var queuePosition: Int = 0
	public var skillID: Int = 0
	public var startDate: Date?
	public var trainingStartSP: Int = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"finishDate": EVESchemeElementType.ESIDate(elementName: "finish_date", transformer: nil),
		"finishedLevel": EVESchemeElementType.Int(elementName: "finished_level", transformer: nil),
		"levelEndSP": EVESchemeElementType.Int(elementName: "level_end_sp", transformer: nil),
		"levelStartSP": EVESchemeElementType.Int(elementName: "level_start_sp", transformer: nil),
		"queuePosition": EVESchemeElementType.Int(elementName: "queue_position", transformer: nil),
		"skillID": EVESchemeElementType.Int(elementName: "skill_id", transformer: nil),
		"startDate": EVESchemeElementType.ESIDate(elementName: "start_date", transformer: nil),
		"trainingStartSP": EVESchemeElementType.Int(elementName: "training_start_sp", transformer: nil),
		]
	}
}

public class ESSkill: EVEObject {
	public var currentSkillLevel: Int = 0
	public var skillID: Int = 0
	public var skillPointsInSkill: Int = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"currentSkillLevel": EVESchemeElementType.Int(elementName: "current_skill_level", transformer: nil),
			"skillID": EVESchemeElementType.Int(elementName: "skill_id", transformer: nil),
			"skillPointsInSkill": EVESchemeElementType.Int(elementName: "skillpoints_in_skill", transformer: nil),
		]
	}
}

public class ESSkills: ESResult {
	public var skills: [ESSkill] = []
	public var totalSP: Int64 = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"skills": EVESchemeElementType.Array(elementName: nil, type: ESSkill.self, transformer: nil),
			"totalSP": EVESchemeElementType.Int64(elementName: "total_sp", transformer: nil),
		]
	}
}
