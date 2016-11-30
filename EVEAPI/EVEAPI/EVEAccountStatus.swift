//
//  EVEAccountStatus.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 28.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEAccountStatusMultiCharacterTrainingItem: EVEObject {
	public var trainingEnd: Date = Date.distantPast

	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	override public func scheme() -> [String:EVESchemeElementType] {
		return ["trainingEnd":EVESchemeElementType.Date(elementName:nil, transformer:nil)]
	}
}

public class EVEAccountStatus: EVEResult {
	public var paidUntil: Date = Date.distantPast
	public var createDate: Date = Date.distantPast
	public var logonCount: Int = 0
	public var logonMinutes: Int = 0
	public var multiCharacterTraining: [EVEAccountStatusMultiCharacterTrainingItem] = []

	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"paidUntil":EVESchemeElementType.Date(elementName:nil, transformer:nil),
			"createDate":EVESchemeElementType.Date(elementName:nil, transformer:nil),
			"logonCount":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"logonMinutes":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"multiCharacterTraining":EVESchemeElementType.Object(elementName: nil, type: EVEAccountStatusMultiCharacterTrainingItem.self, transformer: nil)
		]
	}
}
