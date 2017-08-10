//
//  EVEResearch.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEResearchItem: EVEObject {
	public var agentID: Int64 = 0
	public var skillTypeID: Int = 0
	public var researchStartDate: Date = Date.distantPast
	public var pointsPerDay: Double = 0
	public var remainderPoints: Double = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"agentID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"skillTypeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"researchStartDate":EVESchemeElementType.Date(elementName:nil, transformer:nil),
		"pointsPerDay":EVESchemeElementType.Double(elementName:nil, transformer:nil),
		"remainderPoints":EVESchemeElementType.Double(elementName:nil, transformer:nil),
		]
	}
}

public class EVEResearch: EVEResult {
	public var research: [EVEResearchItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"research":EVESchemeElementType.Rowset(elementName: nil, type: EVEResearchItem.self, transformer: nil),
		]
	}
}
