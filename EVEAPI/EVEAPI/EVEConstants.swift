//
//  Constants.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation

@objc public enum EVEAPIKeyType: Int {
	case Account
	case Character
	case Corporation
	
	init(_ string:String) {
		switch string {
		case "Account":
			self = .Account
		case "Character":
			self = .Character
		case "Corporation":
			self = .Corporation
		default:
			self = .Character
		}
	}
}

@objc public enum EVEInventoryFlag: Int {
	case None = 0
	case Wallet = 1
	case Factory = 2
	case Hangar = 4
	case Cargo = 5
	case Briefcase = 6
	case Skill = 7
	case Reward = 8
	case Connected = 9
	case Disconnected = 10
	case LoSlot0 = 11
	case LoSlot1 = 12
	case LoSlot2 = 13
	case LoSlot3 = 14
	case LoSlot4 = 15
	case LoSlot5 = 16
	case LoSlot6 = 17
	case LoSlot7 = 18
	case MedSlot0 = 19
	case MedSlot1 = 20
	case MedSlot2 = 21
	case MedSlot3 = 22
	case MedSlot4 = 23
	case MedSlot5 = 24
	case MedSlot6 = 25
	case MedSlot7 = 26
	case HiSlot0 = 27
	case HiSlot1 = 28
	case HiSlot2 = 29
	case HiSlot3 = 30
	case HiSlot4 = 31
	case HiSlot5 = 32
	case HiSlot6 = 33
	case HiSlot7 = 34
	case FixedSlot = 35
	case Capsule = 56
	case Pilot = 57
	case Passenger = 58
	case BoardingGate = 59
	case Crew = 60
	case SkillInTraining = 61
	case CorpMarket = 62
	case Locked = 63
	case Unlocked = 64
	case OfficeSlot1 = 70
	case OfficeSlot2 = 71
	case OfficeSlot3 = 72
	case OfficeSlot4 = 73
	case OfficeSlot5 = 74
	case OfficeSlot6 = 75
	case OfficeSlot7 = 76
	case OfficeSlot8 = 77
	case OfficeSlot9 = 78
	case OfficeSlot10 = 79
	case OfficeSlot11 = 80
	case OfficeSlot12 = 81
	case OfficeSlot13 = 82
	case OfficeSlot14 = 83
	case OfficeSlot15 = 84
	case OfficeSlot16 = 85
	case Bonus = 86
	case DroneBay = 87
	case Booster = 88
	case Implant = 89
	case ShipHangar = 90
	case ShipOffline = 91
	case RigSlot0 = 92
	case RigSlot1 = 93
	case RigSlot2 = 94
	case RigSlot3 = 95
	case RigSlot4 = 96
	case RigSlot5 = 97
	case RigSlot6 = 98
	case RigSlot7 = 99
	case FactoryOperation = 100
	case CorpSAG2 = 116
	case CorpSAG3 = 117
	case CorpSAG4 = 118
	case CorpSAG5 = 119
	case CorpSAG6 = 120
	case CorpSAG7 = 121
	case SecondaryStorage = 122
	case CaptainsQuarters = 123
	case WisPromenade = 124
	case SubSystem0 = 125
	case SubSystem1 = 126
	case SubSystem2 = 127
	case SubSystem3 = 128
	case SubSystem4 = 129
	case SubSystem5 = 130
	case SubSystem6 = 131
	case SubSystem7 = 132
	case SpecializedFuelBay = 133
	case SpecializedOreHold = 134
	case SpecializedGasHold = 135
	case SpecializedMineralHold = 136
	case SpecializedSalvageHold = 137
	case SpecializedShipHold = 138
	case SpecializedSmallShipHold = 139
	case SpecializedMediumShipHold = 140
	case SpecializedLargeShipHold = 141
	case SpecializedIndustrialShipHold = 142
	case SpecializedAmmoHold = 143
	case StructureActive = 144
	case StructureInactive = 145
	case JunkyardReprocessed = 146
	case JunkyardTrashed = 147
}

@objc public enum EVECalendarEventAttendeeResponse: Int {
	case Undecided
	case Accepted
	case Declined
	case Tentative
	
	init(_ string:String) {
		switch string {
		case "Undecided":
			self = .Undecided
		case "Accepted":
			self = .Accepted
		case "Declined":
			self = .Declined
		case "Tentative":
			self = .Tentative
		default:
			self = .Undecided
		}
	}
}

@objc public enum EVECharacterGender: Int {
	case Male
	case Female
	
	init(_ string:String) {
		switch string {
		case "Male":
			self = .Male
		default:
			self = .Female
		}
	}
}

@objc public enum EVEContractType: Int {
	case Unknown
	case ItemExchange
	case Auction
	case Loan
	case Courier
	
	init(_ string:String) {
		switch string {
		case "ItemExchange":
			self = .ItemExchange
		case "Auction":
			self = .Auction
		case "Loan":
			self = .Loan
		case "Courier":
			self = .Courier
		default:
			self = .Unknown
		}
	}
}

@objc public enum EVEContractStatus: Int {
	case Unknown
	case Completed
	case CompletedByIssuer
	case CompletedByContractor
	case Outstanding
	case InProgress
	case Cancelled
	case Reversed
	case Rejected
	case Failed
	case Deleted
	
	init(_ string:String) {
		switch string {
		case "Completed":
			self = .Completed
		case "CompletedByIssuer":
			self = .CompletedByIssuer
		case "CompletedByContractor":
			self = .CompletedByContractor
		case "Outstanding":
			self = .Outstanding
		case "InProgress":
			self = .InProgress
		case "Cancelled":
			self = .Cancelled
		case "Reversed":
			self = .Reversed
		case "Rejected":
			self = .Rejected
		case "Failed":
			self = .Failed
		case "Deleted":
			self = .Deleted
		default:
			self = .Unknown
		}
	}
}

@objc public enum EVEContractAvailability: Int {
	case Public
	case Private
	
	init(_ string:String) {
		switch string {
		case "Public":
			self = .Public
		case "Private":
			self = .Private
		default:
			self = .Public
		}
	}
}

@objc public enum EVEIndustryJobStatus: Int {
	case Active = 1
	case Paused = 2
	case Ready = 3
	case Delivered = 101
	case Cancelled = 102
	case Reverted = 103
}

@objc public enum EVEOrderState: Int {
	case Open = 0
	case Closed = 1
	case Expired = 2
	case Cancelled = 3
	case Pending = 4
	case CharacterDeleted = 5
}

@objc public enum EVEMedalStatus: Int {
	case Private
	case Public
	
	init(_ string:String) {
		switch string {
		case "public":
			self = .Public
		case "private":
			self = .Private
		default:
			self = .Public
		}
	}
}

@objc public enum EVEPOSState: Int {
	case Unanchored = 0
	case Offline = 1
	case Onlining = 2
	case Reinforced = 3
	case Online = 4
}

@objc public enum EVEOwnerGroup: Int {
	case Character = 1
	case Corporation = 2
	case Faction = 19
	case Alliance = 32
}

@objc public enum EVECharacterAttribute: Int {
	case Intelligence
	case Memory
	case Charisma
	case Perception
	case Willpower
	init(_ string:String) {
		switch string {
		case "intelligence":
			self = .Intelligence
		case "memory":
			self = .Memory
		case "charisma":
			self = .Charisma
		case "perception":
			self = .Perception
		case "willpower":
			self = .Willpower
		default:
			self = .Intelligence
		}
	}
}

@objc public enum EVECallType:Int {
	case Character = 0
	case Corporation
}
