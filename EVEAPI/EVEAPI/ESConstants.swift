//
//  ESConstants.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 09.12.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation

@objc public enum ESLocationFlag: Int {
	case none
	case autoFit
	case cargo
	case corpseBay
	case droneBay
	case fleetHangar
	case hangar
	case hangarAll
	case loSlot0
	case loSlot1
	case loSlot2
	case loSlot3
	case loSlot4
	case loSlot5
	case loSlot6
	case loSlot7
	case medSlot0
	case medSlot1
	case medSlot2
	case medSlot3
	case medSlot4
	case medSlot5
	case medSlot6
	case medSlot7
	case hiSlot0
	case hiSlot1
	case hiSlot2
	case hiSlot3
	case hiSlot4
	case hiSlot5
	case hiSlot6
	case hiSlot7
	case assetSafety
	case locked
	case unlocked
	case implant
	case quafeBay
	case rigSlot0
	case rigSlot1
	case rigSlot2
	case rigSlot3
	case rigSlot4
	case rigSlot5
	case rigSlot6
	case rigSlot7
	case shipHangar
	case specializedFuelBay
	case specializedOreHold
	case specializedGasHold
	case specializedMineralHold
	case specializedSalvageHold
	case specializedShipHold
	case specializedSmallShipHold
	case specializedMediumShipHold
	case specializedLargeShipHold
	case specializedIndustrialShipHold
	case specializedAmmoHold
	case specializedCommandCenterHold
	case specializedPlanetaryCommoditiesHold
	case specializedMaterialBay
	case subSystemSlot0
	case subSystemSlot1
	case subSystemSlot2
	case subSystemSlot3
	case subSystemSlot4
	case subSystemSlot5
	case subSystemSlot6
	case subSystemSlot7
	case fighterBay
	case fighterTube0
	case fighterTube1
	case fighterTube2
	case fighterTube3
	case fighterTube4
	
	init(_ string: String) {
		switch string {
		case "AutoFit":
			self = .autoFit
		case "Cargo":
			self = .cargo
		case "CorpseBay":
			self = .corpseBay
		case "DroneBay":
			self = .droneBay
		case "FleetHangar":
			self = .fleetHangar
		case "Hangar":
			self = .hangar
		case "HangarAll":
			self = .hangarAll
		case "LoSlot0":
			self = .loSlot0
		case "LoSlot1":
			self = .loSlot1
		case "LoSlot2":
			self = .loSlot2
		case "LoSlot3":
			self = .loSlot3
		case "LoSlot4":
			self = .loSlot4
		case "LoSlot5":
			self = .loSlot5
		case "LoSlot6":
			self = .loSlot6
		case "LoSlot7":
			self = .loSlot7
		case "MedSlot0":
			self = .medSlot0
		case "MedSlot1":
			self = .medSlot1
		case "MedSlot2":
			self = .medSlot2
		case "MedSlot3":
			self = .medSlot3
		case "MedSlot4":
			self = .medSlot4
		case "MedSlot5":
			self = .medSlot5
		case "MedSlot6":
			self = .medSlot6
		case "MedSlot7":
			self = .medSlot7
		case "HiSlot0":
			self = .hiSlot0
		case "HiSlot1":
			self = .hiSlot1
		case "HiSlot2":
			self = .hiSlot2
		case "HiSlot3":
			self = .hiSlot3
		case "HiSlot4":
			self = .hiSlot4
		case "HiSlot5":
			self = .hiSlot5
		case "HiSlot6":
			self = .hiSlot6
		case "HiSlot7":
			self = .hiSlot7
		case "AssetSafety":
			self = .assetSafety
		case "Locked":
			self = .locked
		case "Unlocked":
			self = .unlocked
		case "Implant":
			self = .implant
		case "QuafeBay":
			self = .quafeBay
		case "RigSlot0":
			self = .rigSlot0
		case "RigSlot1":
			self = .rigSlot1
		case "RigSlot2":
			self = .rigSlot2
		case "RigSlot3":
			self = .rigSlot3
		case "RigSlot4":
			self = .rigSlot4
		case "RigSlot5":
			self = .rigSlot5
		case "RigSlot6":
			self = .rigSlot6
		case "RigSlot7":
			self = .rigSlot7
		case "ShipHangar":
			self = .shipHangar
		case "SpecializedFuelBay":
			self = .specializedFuelBay
		case "SpecializedOreHold":
			self = .specializedOreHold
		case "SpecializedGasHold":
			self = .specializedGasHold
		case "SpecializedMineralHold":
			self = .specializedMineralHold
		case "SpecializedSalvageHold":
			self = .specializedSalvageHold
		case "SpecializedShipHold":
			self = .specializedShipHold
		case "SpecializedSmallShipHold":
			self = .specializedSmallShipHold
		case "SpecializedMediumShipHold":
			self = .specializedMediumShipHold
		case "SpecializedLargeShipHold":
			self = .specializedLargeShipHold
		case "SpecializedIndustrialShipHold":
			self = .specializedIndustrialShipHold
		case "SpecializedAmmoHold":
			self = .specializedAmmoHold
		case "SpecializedCommandCenterHold":
			self = .specializedCommandCenterHold
		case "SpecializedPlanetaryCommoditiesHold":
			self = .specializedPlanetaryCommoditiesHold
		case "SpecializedMaterialBay":
			self = .specializedMaterialBay
		case "SubSystemSlot0":
			self = .subSystemSlot0
		case "SubSystemSlot1":
			self = .subSystemSlot1
		case "SubSystemSlot2":
			self = .subSystemSlot2
		case "SubSystemSlot3":
			self = .subSystemSlot3
		case "SubSystemSlot4":
			self = .subSystemSlot4
		case "SubSystemSlot5":
			self = .subSystemSlot5
		case "SubSystemSlot6":
			self = .subSystemSlot6
		case "SubSystemSlot7":
			self = .subSystemSlot7
		case "FighterBay":
			self = .fighterBay
		case "FighterTube0":
			self = .fighterTube0
		case "FighterTube1":
			self = .fighterTube1
		case "FighterTube2":
			self = .fighterTube2
		case "FighterTube3":
			self = .fighterTube3
		case "FighterTube4":
			self = .fighterTube4
		default:
			self = .none
		}
	}
}

@objc public enum ESLocationType: Int {
	case station
	case solarSystem
	case structure
	case other
	
	init(_ string: String) {
		switch string {
		case "station":
			self = .station
		case "solar_system":
			self = .solarSystem
		case "structure":
			self = .structure
		case "other":
			self = .other
		default:
			self = .other
		}
	}
}

@objc public enum ESEventResponse: Int {
	case declined
	case notResponded
	case accepted
	case tentative
	
	init(_ string: String) {
		switch string {
		case "declined":
			self = .declined
		case "not_responded":
			self = .notResponded
		case "accepted":
			self = .accepted
		case "tentative":
			self = .tentative
		default:
			self = .notResponded
		}
	}
}

@objc public enum ESGender: Int {
	case male
	case female
	
	init(_ string: String) {
		switch string {
		case "male":
			self = .male
		case "female":
			self = .female
		default:
			self = .male
		}
	}
}

@objc public enum ESRole: Int {
	case none
	case director
	case personnelManager
	case accountant
	case securityOfficer
	case factoryManager
	case stationManager
	case auditor
	case hangarTake1
	case hangarTake2
	case hangarTake3
	case hangarTake4
	case hangarTake5
	case hangarTake6
	case hangarTake7
	case hangarQuery1
	case hangarQuery2
	case hangarQuery3
	case hangarQuery4
	case hangarQuery5
	case hangarQuery6
	case hangarQuery7
	case accountTake1
	case accountTake2
	case accountTake3
	case accountTake4
	case accountTake5
	case accountTake6
	case accountTake7
	case diplomat
	case configEquipment
	case containerTake1
	case containerTake2
	case containerTake3
	case containerTake4
	case containerTake5
	case containerTake6
	case containerTake7
	case rentOffice
	case rentFactoryFacility
	case rentResearchFacility
	case juniorAccountant
	case configStarbaseEquipment
	case trader
	case communicationsOfficer
	case contractManager
	case starbaseDefenseOperator
	case starbaseFuelTechnician
	case fittingManager
	case terrestrialCombatOfficer
	case terrestrialLogisticsOfficer
	
	init(_ string: String) {
		switch string {
		case "Director":
			self = .director
		case "Personnel_Manager":
			self = .personnelManager
		case "Accountant":
			self = .accountant
		case "Security_Officer":
			self = .securityOfficer
		case "Factory_Manager":
			self = .factoryManager
		case "Station_Manager":
			self = .stationManager
		case "Auditor":
			self = .auditor
		case "Hangar_Take_1":
			self = .hangarTake1
		case "Hangar_Take_2":
			self = .hangarTake2
		case "Hangar_Take_3":
			self = .hangarTake3
		case "Hangar_Take_4":
			self = .hangarTake4
		case "Hangar_Take_5":
			self = .hangarTake5
		case "Hangar_Take_6":
			self = .hangarTake6
		case "Hangar_Take_7":
			self = .hangarTake7
		case "Hangar_Query_1":
			self = .hangarQuery1
		case "Hangar_Query_2":
			self = .hangarQuery2
		case "Hangar_Query_3":
			self = .hangarQuery3
		case "Hangar_Query_4":
			self = .hangarQuery4
		case "Hangar_Query_5":
			self = .hangarQuery5
		case "Hangar_Query_6":
			self = .hangarQuery6
		case "Hangar_Query_7":
			self = .hangarQuery7
		case "Account_Take_1":
			self = .accountTake1
		case "Account_Take_2":
			self = .accountTake2
		case "Account_Take_3":
			self = .accountTake3
		case "Account_Take_4":
			self = .accountTake4
		case "Account_Take_5":
			self = .accountTake5
		case "Account_Take_6":
			self = .accountTake6
		case "Account_Take_7":
			self = .accountTake7
		case "Diplomat":
			self = .diplomat
		case "Config_Equipment":
			self = .configEquipment
		case "Container_Take_1":
			self = .containerTake1
		case "Container_Take_2":
			self = .containerTake2
		case "Container_Take_3":
			self = .containerTake3
		case "Container_Take_4":
			self = .containerTake4
		case "Container_Take_5":
			self = .containerTake5
		case "Container_Take_6":
			self = .containerTake6
		case "Container_Take_7":
			self = .containerTake7
		case "Rent_Office":
			self = .rentOffice
		case "Rent_Factory_Facility":
			self = .rentFactoryFacility
		case "Rent_Research_Facility":
			self = .rentResearchFacility
		case "Junior_Accountant":
			self = .juniorAccountant
		case "Config_Starbase_Equipment":
			self = .configStarbaseEquipment
		case "Trader":
			self = .trader
		case "Communications_Officer":
			self = .communicationsOfficer
		case "Contract_Manager":
			self = .contractManager
		case "Starbase_Defense_Operator":
			self = .starbaseDefenseOperator
		case "Starbase_Fuel_Technician":
			self = .starbaseFuelTechnician
		case "Fitting_Manager":
			self = .fittingManager
		case "Terrestrial_Combat_Officer":
			self = .terrestrialCombatOfficer
		case "Terrestrial_Logistics_Officer":
			self = .terrestrialLogisticsOfficer
		default:
			self = .none
		}
	}
}

@objc public enum ESIncursionsState: Int {
	case withdrawing
	case mobilizing
	case established
	
	init(_ string: String) {
		switch string {
		case "withdrawing":
			self = .withdrawing
		case "mobilizing":
			self = .mobilizing
		case "established":
			self = .established
		default:
			self = .withdrawing
		}
	}
}

@objc public enum ESRecipientType: Int {
	case alliance
	case character
	case corporation
	case mailingList
	
	init(_ string: String) {
		switch string {
		case "alliance":
			self = .alliance
		case "character":
			self = .character
		case "corporation":
			self = .corporation
		case "mailing_list":
			self = .mailingList
		default:
			self = .character
		}
	}
}

@objc public enum ESMarketOrderRange: Int {
	case jumps1 = 1
	case jumps2 = 2
	case jumps3 = 3
	case jumps4 = 4
	case jumps5 = 5
	case jumps10 = 10
	case jumps20 = 20
	case jumps30 = 30
	case jumps40 = 40
	case station = 1000
	case region
	case solarSystem
	
	init(_ string: String) {
		switch string {
		case "station":
			self = .station
		case "region":
			self = .region
		case "solarsystem":
			self = .solarSystem
		default:
			let s = string as NSString
			self = ESMarketOrderRange(rawValue: s.integerValue) ?? .jumps1
		}
	}
}

@objc public enum ESPlanetType: Int {
	case temperate
	case barren
	case oceanic
	case ice
	case gas
	case lava
	case storm
	case plasma
	
	init(_ string: String) {
		switch string {
		case "temperate":
			self = .temperate
		case "barren":
			self = .barren
		case "oceanic":
			self = .oceanic
		case "ice":
			self = .ice
		case "gas":
			self = .gas
		case "lava":
			self = .lava
		case "storm":
			self = .storm
		case "plasma":
			self = .plasma
		default:
			self = .temperate
		}
	}
}

@objc public enum ESEventType: Int {
	case none
	case tcuDefense
	case ihubDefense
	case stationDefense
	case stationFreeport
	
	init(_ string: String) {
		switch string {
		case "tcu_defense":
			self = .tcuDefense
		case "ihub_defense":
			self = .ihubDefense
		case "station_defense":
			self = .stationDefense
		case "station_freeport":
			self = .stationFreeport
		default:
			self = .none
		}
	}
}

@objc public enum ESNameCategory: Int {
	case none
	case alliance
	case character
	case constellation
	case corporation
	case inventoryType
	case region
	case solarSystem
	case station
	
	init(_ string: String) {
		switch string {
		case "alliance":
			self = .alliance
		case "character":
			self = .character
		case "constellation":
			self = .corporation
		case "inventory_type":
			self = .inventoryType
		case "region":
			self = .region
		case "solar_system":
			self = .solarSystem
		case "station":
			self = .station
		default:
			self = .none
		}
	}
}
