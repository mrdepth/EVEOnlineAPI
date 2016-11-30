//
//  EVEStarbaseDetail.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 30.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEStarbaseDetailGeneralSettings: EVEObject {
	public var usageFlags: Int = 0
	public var deployFlags: Int = 0
	public var allowCorporationMembers: Bool = false
	public var allowAllianceMembers: Bool = false
	
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
		"usageFlags":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"deployFlags":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"allowCorporationMembers":EVESchemeElementType.Bool(elementName:nil, transformer:nil),
		"allowAllianceMembers":EVESchemeElementType.Bool(elementName:nil, transformer:nil),
		]
	}
}

public class EVEStarbaseDetailCombatSettings: EVEObject {
	public var useStandingsFromOwnerID: Int = 0
	public var onStandingDropStading: Int = 0
	public var onStatusDropEnabled: Bool = false
	public var onStatusDropStanding: Int = 0
	public var onAggressionEnabled: Bool = false
	public var onCorporationWarEnabled: Int = 0
	
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
		"useStandingsFromOwnerID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"onStandingDropStading":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"onStatusDropEnabled":EVESchemeElementType.Bool(elementName:nil, transformer:nil),
		"onStatusDropStanding":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"onAggressionEnabled":EVESchemeElementType.Bool(elementName:nil, transformer:nil),
		"onCorporationWarEnabled":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		]
	}
}

public class EVEStarbaseDetailFuelItem: EVEObject {
	public var typeID: Int = 0
	public var quantity: Int = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"typeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"quantity":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		]
	}
}

public class EVEStarbaseDetail: EVEResult {
	public var state: EVEPOSState = .Offline
	public var stateTimestamp: Date = Date.distantPast
	public var onlineTimestamp: Date = Date.distantPast
	public var generalSettings: EVEStarbaseDetailGeneralSettings = EVEStarbaseDetailGeneralSettings()
	public var combatSettings: EVEStarbaseDetailCombatSettings = EVEStarbaseDetailCombatSettings()
	public var fuel: [EVEStarbaseDetailFuelItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"state":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"stateTimestamp":EVESchemeElementType.Date(elementName:nil, transformer:nil),
		"onlineTimestamp":EVESchemeElementType.Date(elementName:nil, transformer:nil),
		"generalSettings":EVESchemeElementType.Object(elementName: nil, type: EVEStarbaseDetailGeneralSettings.self, transformer:nil),
		"combatSettings":EVESchemeElementType.Object(elementName: nil, type: EVEStarbaseDetailCombatSettings.self, transformer:nil),
		"fuel":EVESchemeElementType.Rowset(elementName: nil, type: EVEStarbaseDetailFuelItem.self, transformer: nil),
		]
	}
}
