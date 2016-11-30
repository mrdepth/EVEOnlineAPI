//
//  EVESkillQueue.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVESkillQueueItem: EVEObject {
	public var queuePosition: Int = 0
	public var typeID: Int = 0
	public var level: Int = 0
	public var startSP: Int = 0
	public var endSP: Int = 0
	public var startTime: Date = Date.distantPast
	public var endTime: Date = Date.distantPast
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"queuePosition":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"typeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"level":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"startSP":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"endSP":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"startTime":EVESchemeElementType.Date(elementName:nil, transformer:nil),
		"endTime":EVESchemeElementType.Date(elementName:nil, transformer:nil),
		]
	}
}


public class EVESkillQueue: EVEResult {
	public var skillQueue: [EVESkillQueueItem] = []
	public var timeLeft: TimeInterval = 0

	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"skillQueue":EVESchemeElementType.Rowset(elementName: nil, type: EVESkillQueueItem.self, transformer: nil),
			"timeLeft":EVESchemeElementType.Double(elementName:nil, transformer:nil),
		]
	}
}

