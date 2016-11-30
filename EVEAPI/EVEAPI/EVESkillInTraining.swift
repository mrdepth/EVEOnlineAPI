//
//  EVESkillInTraining.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVESkillInTraining: EVEResult {
	public var currentTQTime: Date = Date.distantPast
	public var trainingEndTime: Date = Date.distantPast
	public var trainingStartTime: Date = Date.distantPast
	public var trainingTypeID: Int = 0
	public var trainingStartSP: Int = 0
	public var trainingDestinationSP: Int = 0
	public var trainingToLevel: Int = 0
	public var skillInTraining: Int = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"currentTQTime":EVESchemeElementType.Date(elementName: nil, transformer: nil),
		"trainingEndTime":EVESchemeElementType.Date(elementName: nil, transformer: nil),
		"trainingStartTime":EVESchemeElementType.Date(elementName: nil, transformer: nil),
		"trainingTypeID":EVESchemeElementType.Int(elementName: nil, transformer: nil),
		"trainingStartSP":EVESchemeElementType.Int(elementName: nil, transformer: nil),
		"trainingDestinationSP":EVESchemeElementType.Int(elementName: nil, transformer: nil),
		"trainingToLevel":EVESchemeElementType.Int(elementName: nil, transformer: nil),
		"skillInTraining":EVESchemeElementType.Int(elementName: nil, transformer: nil),
		]
	}
}
