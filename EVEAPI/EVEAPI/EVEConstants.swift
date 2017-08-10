//
//  Constants.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation

@objc public enum EVEAPIKeyType: Int {
	case account
	case character
	case corporation
	
	init(_ string:String) {
		switch string {
		case "Account":
			self = .account
		case "Character":
			self = .character
		case "Corporation":
			self = .corporation
		default:
			self = .character
		}
	}
}

@objc public enum EVEInventoryFlag: Int {
	case none = 0
	case wallet = 1
	case factory = 2
	case hangar = 4
	case cargo = 5
	case briefcase = 6
	case skill = 7
	case reward = 8
	case connected = 9
	case disconnected = 10
	case loSlot0 = 11
	case loSlot1 = 12
	case loSlot2 = 13
	case loSlot3 = 14
	case loSlot4 = 15
	case loSlot5 = 16
	case loSlot6 = 17
	case loSlot7 = 18
	case medSlot0 = 19
	case medSlot1 = 20
	case medSlot2 = 21
	case medSlot3 = 22
	case medSlot4 = 23
	case medSlot5 = 24
	case medSlot6 = 25
	case medSlot7 = 26
	case hiSlot0 = 27
	case hiSlot1 = 28
	case hiSlot2 = 29
	case hiSlot3 = 30
	case hiSlot4 = 31
	case hiSlot5 = 32
	case hiSlot6 = 33
	case hiSlot7 = 34
	case fixedSlot = 35
	case capsule = 56
	case pilot = 57
	case passenger = 58
	case boardingGate = 59
	case crew = 60
	case skillInTraining = 61
	case corpMarket = 62
	case locked = 63
	case unlocked = 64
	case officeSlot1 = 70
	case officeSlot2 = 71
	case officeSlot3 = 72
	case officeSlot4 = 73
	case officeSlot5 = 74
	case officeSlot6 = 75
	case officeSlot7 = 76
	case officeSlot8 = 77
	case officeSlot9 = 78
	case officeSlot10 = 79
	case officeSlot11 = 80
	case officeSlot12 = 81
	case officeSlot13 = 82
	case officeSlot14 = 83
	case officeSlot15 = 84
	case officeSlot16 = 85
	case bonus = 86
	case droneBay = 87
	case booster = 88
	case implant = 89
	case shipHangar = 90
	case shipOffline = 91
	case rigSlot0 = 92
	case rigSlot1 = 93
	case rigSlot2 = 94
	case rigSlot3 = 95
	case rigSlot4 = 96
	case rigSlot5 = 97
	case rigSlot6 = 98
	case rigSlot7 = 99
	case factoryOperation = 100
	case corpSAG2 = 116
	case corpSAG3 = 117
	case corpSAG4 = 118
	case corpSAG5 = 119
	case corpSAG6 = 120
	case corpSAG7 = 121
	case secondaryStorage = 122
	case captainsQuarters = 123
	case wisPromenade = 124
	case subSystem0 = 125
	case subSystem1 = 126
	case subSystem2 = 127
	case subSystem3 = 128
	case subSystem4 = 129
	case subSystem5 = 130
	case subSystem6 = 131
	case subSystem7 = 132
	case specializedFuelBay = 133
	case specializedOreHold = 134
	case specializedGasHold = 135
	case specializedMineralHold = 136
	case specializedSalvageHold = 137
	case specializedShipHold = 138
	case specializedSmallShipHold = 139
	case specializedMediumShipHold = 140
	case specializedLargeShipHold = 141
	case specializedIndustrialShipHold = 142
	case specializedAmmoHold = 143
	case structureActive = 144
	case structureInactive = 145
	case junkyardReprocessed = 146
	case junkyardTrashed = 147
}

@objc public enum EVECalendarEventAttendeeResponse: Int {
	case undecided
	case accepted
	case declined
	case tentative
	
	init(_ string:String) {
		switch string {
		case "Undecided":
			self = .undecided
		case "Accepted":
			self = .accepted
		case "Declined":
			self = .declined
		case "Tentative":
			self = .tentative
		default:
			self = .undecided
		}
	}
}

@objc public enum EVECharacterGender: Int {
	case male
	case female
	
	init(_ string:String) {
		switch string {
		case "Male":
			self = .male
		default:
			self = .female
		}
	}
}

@objc public enum EVEContractType: Int {
	case unknown
	case itemExchange
	case auction
	case loan
	case courier
	
	init(_ string:String) {
		switch string {
		case "ItemExchange":
			self = .itemExchange
		case "Auction":
			self = .auction
		case "Loan":
			self = .loan
		case "Courier":
			self = .courier
		default:
			self = .unknown
		}
	}
}

@objc public enum EVEContractStatus: Int {
	case unknown
	case completed
	case completedByIssuer
	case completedByContractor
	case outstanding
	case inProgress
	case cancelled
	case reversed
	case rejected
	case failed
	case deleted
	
	init(_ string:String) {
		switch string {
		case "Completed":
			self = .completed
		case "CompletedByIssuer":
			self = .completedByIssuer
		case "CompletedByContractor":
			self = .completedByContractor
		case "Outstanding":
			self = .outstanding
		case "InProgress":
			self = .inProgress
		case "Cancelled":
			self = .cancelled
		case "Reversed":
			self = .reversed
		case "Rejected":
			self = .rejected
		case "Failed":
			self = .failed
		case "Deleted":
			self = .deleted
		default:
			self = .unknown
		}
	}
}

@objc public enum EVEContractAvailability: Int {
	case `public`
	case `private`
	
	init(_ string:String) {
		switch string {
		case "Public":
			self = .public
		case "Private":
			self = .private
		default:
			self = .public
		}
	}
}

@objc public enum EVEIndustryJobStatus: Int {
	case active = 1
	case paused = 2
	case ready = 3
	case delivered = 101
	case cancelled = 102
	case reverted = 103
}

@objc public enum EVEOrderState: Int {
	case open = 0
	case closed = 1
	case expired = 2
	case cancelled = 3
	case pending = 4
	case characterDeleted = 5
}

@objc public enum EVEMedalStatus: Int {
	case `private`
	case `public`
	
	init(_ string:String) {
		switch string {
		case "public":
			self = .public
		case "private":
			self = .private
		default:
			self = .public
		}
	}
}

@objc public enum EVEPOSState: Int {
	case unanchored = 0
	case offline = 1
	case onlining = 2
	case reinforced = 3
	case online = 4
}

@objc public enum EVEOwnerGroup: Int {
	case character = 1
	case corporation = 2
	case faction = 19
	case alliance = 32
}

@objc public enum EVECharacterAttribute: Int {
	case intelligence
	case memory
	case charisma
	case perception
	case willpower
	init(_ string:String) {
		switch string {
		case "intelligence":
			self = .intelligence
		case "memory":
			self = .memory
		case "charisma":
			self = .charisma
		case "perception":
			self = .perception
		case "willpower":
			self = .willpower
		default:
			self = .intelligence
		}
	}
}

@objc public enum EVECallType:Int {
	case character = 0
	case corporation
}
