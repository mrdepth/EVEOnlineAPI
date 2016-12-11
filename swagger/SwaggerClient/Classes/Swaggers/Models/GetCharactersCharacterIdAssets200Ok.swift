//
// GetCharactersCharacterIdAssets200Ok.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


/** 200 ok object */
public class GetCharactersCharacterIdAssets200Ok: JSONEncodable {
    public enum LocationFlag: String { 
        case AutoFit = "AutoFit"
        case Cargo = "Cargo"
        case CorpseBay = "CorpseBay"
        case DroneBay = "DroneBay"
        case FleetHangar = "FleetHangar"
        case Hangar = "Hangar"
        case HangarAll = "HangarAll"
        case LoSlot0 = "LoSlot0"
        case LoSlot1 = "LoSlot1"
        case LoSlot2 = "LoSlot2"
        case LoSlot3 = "LoSlot3"
        case LoSlot4 = "LoSlot4"
        case LoSlot5 = "LoSlot5"
        case LoSlot6 = "LoSlot6"
        case LoSlot7 = "LoSlot7"
        case MedSlot0 = "MedSlot0"
        case MedSlot1 = "MedSlot1"
        case MedSlot2 = "MedSlot2"
        case MedSlot3 = "MedSlot3"
        case MedSlot4 = "MedSlot4"
        case MedSlot5 = "MedSlot5"
        case MedSlot6 = "MedSlot6"
        case MedSlot7 = "MedSlot7"
        case HiSlot0 = "HiSlot0"
        case HiSlot1 = "HiSlot1"
        case HiSlot2 = "HiSlot2"
        case HiSlot3 = "HiSlot3"
        case HiSlot4 = "HiSlot4"
        case HiSlot5 = "HiSlot5"
        case HiSlot6 = "HiSlot6"
        case HiSlot7 = "HiSlot7"
        case AssetSafety = "AssetSafety"
        case Locked = "Locked"
        case Unlocked = "Unlocked"
        case Implant = "Implant"
        case QuafeBay = "QuafeBay"
        case RigSlot0 = "RigSlot0"
        case RigSlot1 = "RigSlot1"
        case RigSlot2 = "RigSlot2"
        case RigSlot3 = "RigSlot3"
        case RigSlot4 = "RigSlot4"
        case RigSlot5 = "RigSlot5"
        case RigSlot6 = "RigSlot6"
        case RigSlot7 = "RigSlot7"
        case ShipHangar = "ShipHangar"
        case SpecializedFuelBay = "SpecializedFuelBay"
        case SpecializedOreHold = "SpecializedOreHold"
        case SpecializedGasHold = "SpecializedGasHold"
        case SpecializedMineralHold = "SpecializedMineralHold"
        case SpecializedSalvageHold = "SpecializedSalvageHold"
        case SpecializedShipHold = "SpecializedShipHold"
        case SpecializedSmallShipHold = "SpecializedSmallShipHold"
        case SpecializedMediumShipHold = "SpecializedMediumShipHold"
        case SpecializedLargeShipHold = "SpecializedLargeShipHold"
        case SpecializedIndustrialShipHold = "SpecializedIndustrialShipHold"
        case SpecializedAmmoHold = "SpecializedAmmoHold"
        case SpecializedCommandCenterHold = "SpecializedCommandCenterHold"
        case SpecializedPlanetaryCommoditiesHold = "SpecializedPlanetaryCommoditiesHold"
        case SpecializedMaterialBay = "SpecializedMaterialBay"
        case SubSystemSlot0 = "SubSystemSlot0"
        case SubSystemSlot1 = "SubSystemSlot1"
        case SubSystemSlot2 = "SubSystemSlot2"
        case SubSystemSlot3 = "SubSystemSlot3"
        case SubSystemSlot4 = "SubSystemSlot4"
        case SubSystemSlot5 = "SubSystemSlot5"
        case SubSystemSlot6 = "SubSystemSlot6"
        case SubSystemSlot7 = "SubSystemSlot7"
        case FighterBay = "FighterBay"
        case FighterTube0 = "FighterTube0"
        case FighterTube1 = "FighterTube1"
        case FighterTube2 = "FighterTube2"
        case FighterTube3 = "FighterTube3"
        case FighterTube4 = "FighterTube4"
    }
    public enum LocationType: String { 
        case Station = "station"
        case SolarSystem = "solar_system"
        case Other = "other"
    }
    /** is_singleton boolean */
    public var isSingleton: Bool?
    /** item_id integer */
    public var itemId: Int64?
    /** location_flag string */
    public var locationFlag: LocationFlag?
    /** location_id integer */
    public var locationId: Int64?
    /** location_type string */
    public var locationType: LocationType?
    /** quantity integer */
    public var quantity: Int32?
    /** type_id integer */
    public var typeId: Int32?

    public init() {}

    // MARK: JSONEncodable
    func encodeToJSON() -> AnyObject {
        var nillableDictionary = [String:AnyObject?]()
        nillableDictionary["is_singleton"] = self.isSingleton
        nillableDictionary["item_id"] = self.itemId?.encodeToJSON()
        nillableDictionary["location_flag"] = self.locationFlag?.rawValue
        nillableDictionary["location_id"] = self.locationId?.encodeToJSON()
        nillableDictionary["location_type"] = self.locationType?.rawValue
        nillableDictionary["quantity"] = self.quantity?.encodeToJSON()
        nillableDictionary["type_id"] = self.typeId?.encodeToJSON()
        let dictionary: [String:AnyObject] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
