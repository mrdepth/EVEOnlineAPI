//
//  EVEIndustryJobsHistory.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit


public class EVEIndustryJobsHistory: EVEResult {
	public var jobs: [EVEIndustryJobsItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"jobs":EVESchemeElementType.Rowset(elementName: nil, type: EVEIndustryJobsItem.self, transformer: nil),
		]
	}
}
