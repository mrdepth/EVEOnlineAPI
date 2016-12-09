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
	case other
	
	init(_ string: String) {
		switch string {
		case "station":
			self = .station
		case "solar_system":
			self = .solarSystem
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
