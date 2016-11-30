//
//  EVECustomsOffices.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVECustomsOfficesItem: EVEObject {
	public var itemID: Int64 = 0
	public var solarSystemID: Int = 0
	public var solarSystemName: String = ""
	public var reinforceHour: Int = 0
	public var allowAlliance: Bool = false
	public var allowStandings: Bool = false
	public var standingLevel: Double = 0
	public var taxRateAlliance: Double = 0
	public var taxRateCorp: Double = 0
	public var taxRateStandingHigh: Double = 0
	public var taxRateStandingGood: Double = 0
	public var taxRateStandingNeutral: Double = 0
	public var taxRateStandingBad: Double = 0
	public var taxRateStandingHorrible: Double = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"itemID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"solarSystemID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"solarSystemName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"reinforceHour":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"allowAlliance":EVESchemeElementType.Bool(elementName:nil, transformer:nil),
		"allowStandings":EVESchemeElementType.Bool(elementName:nil, transformer:nil),
		"standingLevel":EVESchemeElementType.Double(elementName:nil, transformer:nil),
		"taxRateAlliance":EVESchemeElementType.Double(elementName:nil, transformer:nil),
		"taxRateCorp":EVESchemeElementType.Double(elementName:nil, transformer:nil),
		"taxRateStandingHigh":EVESchemeElementType.Double(elementName:nil, transformer:nil),
		"taxRateStandingGood":EVESchemeElementType.Double(elementName:nil, transformer:nil),
		"taxRateStandingNeutral":EVESchemeElementType.Double(elementName:nil, transformer:nil),
		"taxRateStandingBad":EVESchemeElementType.Double(elementName:nil, transformer:nil),
		"taxRateStandingHorrible":EVESchemeElementType.Double(elementName:nil, transformer:nil),
		]
	}
}

public class EVECustomsOffices: EVEResult {
	public var pocos: [EVECustomsOfficesItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"pocos":EVESchemeElementType.Rowset(elementName: nil, type: EVECustomsOfficesItem.self, transformer: nil)
		]
	}
}

