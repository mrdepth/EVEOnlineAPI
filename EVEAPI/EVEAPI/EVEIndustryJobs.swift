//
//  EVEIndustryJobs.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEIndustryJobsItem: EVEObject {
	public var runs: Int = 0
	public var licensedRuns: Int = 0
	public var stationID: Int = 0
	public var productTypeID: Int = 0
	public var activityID: Int = 0
	public var blueprintTypeID: Int = 0
	public var timeInSeconds: Int = 0
	public var facilityID: Int = 0
	public var solarSystemID: Int = 0
	public var teamID: Int = 0
	public var successfulRuns: Int = 0
	public var installerID: Int64 = 0
	public var completedCharacterID: Int = 0
	public var jobID: Int64 = 0
	public var blueprintID: Int64 = 0
	public var outputLocationID: Int64 = 0
	public var blueprintLocationID: Int64 = 0
	public var cost: Double = 0
	public var probability: Double = 0
	public var startDate: Date = Date.distantPast
	public var endDate: Date = Date.distantPast
	public var pauseDate: Date = Date.distantPast
	public var completedDate: Date = Date.distantPast
	public var installerName: String = ""
	public var solarSystemName: String = ""
	public var blueprintTypeName: String = ""
	public var productTypeName: String = ""
	public var status: EVEIndustryJobStatus = .delivered

	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"runs":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"licensedRuns":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"stationID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"productTypeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"activityID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"blueprintTypeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"timeInSeconds":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"facilityID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"solarSystemID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"teamID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"successfulRuns":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"installerID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"completedCharacterID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"jobID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"blueprintID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"outputLocationID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"blueprintLocationID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"cost":EVESchemeElementType.Double(elementName:nil, transformer:nil),
			"probability":EVESchemeElementType.Double(elementName:nil, transformer:nil),
			"startDate":EVESchemeElementType.Date(elementName:nil, transformer:nil),
			"endDate":EVESchemeElementType.Date(elementName:nil, transformer:nil),
			"pauseDate":EVESchemeElementType.Date(elementName:nil, transformer:nil),
			"completedDate":EVESchemeElementType.Date(elementName:nil, transformer:nil),
			"installerName":EVESchemeElementType.String(elementName:nil, transformer:nil),
			"solarSystemName":EVESchemeElementType.String(elementName:nil, transformer:nil),
			"blueprintTypeName":EVESchemeElementType.String(elementName:nil, transformer:nil),
			"productTypeName":EVESchemeElementType.String(elementName:nil, transformer:nil),
			"status": EVESchemeElementType.Int(elementName:nil, transformer:nil)
		]
	}
}


public class EVEIndustryJobs: EVEResult {
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

