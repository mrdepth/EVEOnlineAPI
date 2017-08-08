import Foundation
import Alamofire


public extension ESI {
	public var assets: Assets {
		return Assets(sessionManager: self)
	}
	
	class Assets {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		public func getCharacterAssets(characterID: Int, completionBlock:((Result<[Assets.Asset]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-assets.read_assets.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/assets/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Assets.Asset]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		public class Asset: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public enum GetCharactersCharacterIDAssetsLocationType: String, JSONCoding, HTTPQueryable {
				case other = "other"
				case solarSystem = "solar_system"
				case station = "station"
				
				public init() {
					self = .station
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCharactersCharacterIDAssetsLocationType(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum Flag: String, JSONCoding, HTTPQueryable {
				case assetSafety = "AssetSafety"
				case autoFit = "AutoFit"
				case cargo = "Cargo"
				case corpseBay = "CorpseBay"
				case deliveries = "Deliveries"
				case droneBay = "DroneBay"
				case fighterBay = "FighterBay"
				case fighterTube0 = "FighterTube0"
				case fighterTube1 = "FighterTube1"
				case fighterTube2 = "FighterTube2"
				case fighterTube3 = "FighterTube3"
				case fighterTube4 = "FighterTube4"
				case fleetHangar = "FleetHangar"
				case hangar = "Hangar"
				case hangarAll = "HangarAll"
				case hiSlot0 = "HiSlot0"
				case hiSlot1 = "HiSlot1"
				case hiSlot2 = "HiSlot2"
				case hiSlot3 = "HiSlot3"
				case hiSlot4 = "HiSlot4"
				case hiSlot5 = "HiSlot5"
				case hiSlot6 = "HiSlot6"
				case hiSlot7 = "HiSlot7"
				case hiddenModifiers = "HiddenModifiers"
				case implant = "Implant"
				case loSlot0 = "LoSlot0"
				case loSlot1 = "LoSlot1"
				case loSlot2 = "LoSlot2"
				case loSlot3 = "LoSlot3"
				case loSlot4 = "LoSlot4"
				case loSlot5 = "LoSlot5"
				case loSlot6 = "LoSlot6"
				case loSlot7 = "LoSlot7"
				case locked = "Locked"
				case medSlot0 = "MedSlot0"
				case medSlot1 = "MedSlot1"
				case medSlot2 = "MedSlot2"
				case medSlot3 = "MedSlot3"
				case medSlot4 = "MedSlot4"
				case medSlot5 = "MedSlot5"
				case medSlot6 = "MedSlot6"
				case medSlot7 = "MedSlot7"
				case module = "Module"
				case quafeBay = "QuafeBay"
				case rigSlot0 = "RigSlot0"
				case rigSlot1 = "RigSlot1"
				case rigSlot2 = "RigSlot2"
				case rigSlot3 = "RigSlot3"
				case rigSlot4 = "RigSlot4"
				case rigSlot5 = "RigSlot5"
				case rigSlot6 = "RigSlot6"
				case rigSlot7 = "RigSlot7"
				case shipHangar = "ShipHangar"
				case specializedAmmoHold = "SpecializedAmmoHold"
				case specializedCommandCenterHold = "SpecializedCommandCenterHold"
				case specializedFuelBay = "SpecializedFuelBay"
				case specializedGasHold = "SpecializedGasHold"
				case specializedIndustrialShipHold = "SpecializedIndustrialShipHold"
				case specializedLargeShipHold = "SpecializedLargeShipHold"
				case specializedMaterialBay = "SpecializedMaterialBay"
				case specializedMediumShipHold = "SpecializedMediumShipHold"
				case specializedMineralHold = "SpecializedMineralHold"
				case specializedOreHold = "SpecializedOreHold"
				case specializedPlanetaryCommoditiesHold = "SpecializedPlanetaryCommoditiesHold"
				case specializedSalvageHold = "SpecializedSalvageHold"
				case specializedShipHold = "SpecializedShipHold"
				case specializedSmallShipHold = "SpecializedSmallShipHold"
				case structureFuel = "StructureFuel"
				case structureServiceSlot0 = "StructureServiceSlot0"
				case structureServiceSlot1 = "StructureServiceSlot1"
				case structureServiceSlot2 = "StructureServiceSlot2"
				case structureServiceSlot3 = "StructureServiceSlot3"
				case structureServiceSlot4 = "StructureServiceSlot4"
				case structureServiceSlot5 = "StructureServiceSlot5"
				case structureServiceSlot6 = "StructureServiceSlot6"
				case structureServiceSlot7 = "StructureServiceSlot7"
				case subSystemBay = "SubSystemBay"
				case subSystemSlot0 = "SubSystemSlot0"
				case subSystemSlot1 = "SubSystemSlot1"
				case subSystemSlot2 = "SubSystemSlot2"
				case subSystemSlot3 = "SubSystemSlot3"
				case subSystemSlot4 = "SubSystemSlot4"
				case subSystemSlot5 = "SubSystemSlot5"
				case subSystemSlot6 = "SubSystemSlot6"
				case subSystemSlot7 = "SubSystemSlot7"
				case unlocked = "Unlocked"
				case wardrobe = "Wardrobe"
				
				public init() {
					self = .autoFit
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = Flag(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var isSingleton: Bool = Bool()
			public var itemID: Int64 = Int64()
			public var locationFlag: Assets.Asset.Flag = Assets.Asset.Flag()
			public var locationID: Int64 = Int64()
			public var locationType: Assets.Asset.GetCharactersCharacterIDAssetsLocationType = Assets.Asset.GetCharactersCharacterIDAssetsLocationType()
			public var quantity: Int? = nil
			public var typeID: Int = Int()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let isSingleton = dictionary["is_singleton"] as? Bool else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.isSingleton = isSingleton
				guard let itemID = dictionary["item_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.itemID = itemID
				guard let locationFlag = Assets.Asset.Flag(rawValue: dictionary["location_flag"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.locationFlag = locationFlag
				guard let locationID = dictionary["location_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.locationID = locationID
				guard let locationType = Assets.Asset.GetCharactersCharacterIDAssetsLocationType(rawValue: dictionary["location_type"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.locationType = locationType
				quantity = dictionary["quantity"] as? Int
				guard let typeID = dictionary["type_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.typeID = typeID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				isSingleton = aDecoder.decodeBool(forKey: "is_singleton")
				itemID = aDecoder.decodeInt64(forKey: "item_id")
				locationFlag = Assets.Asset.Flag(rawValue: aDecoder.decodeObject(forKey: "location_flag") as? String ?? "") ?? Assets.Asset.Flag()
				locationID = aDecoder.decodeInt64(forKey: "location_id")
				locationType = Assets.Asset.GetCharactersCharacterIDAssetsLocationType(rawValue: aDecoder.decodeObject(forKey: "location_type") as? String ?? "") ?? Assets.Asset.GetCharactersCharacterIDAssetsLocationType()
				quantity = aDecoder.containsValue(forKey: "quantity") ? aDecoder.decodeInteger(forKey: "quantity") : nil
				typeID = aDecoder.decodeInteger(forKey: "type_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(isSingleton, forKey: "is_singleton")
				aCoder.encode(itemID, forKey: "item_id")
				aCoder.encode(locationFlag.rawValue, forKey: "location_flag")
				aCoder.encode(locationID, forKey: "location_id")
				aCoder.encode(locationType.rawValue, forKey: "location_type")
				if let v = quantity {
					aCoder.encode(v, forKey: "quantity")
				}
				aCoder.encode(typeID, forKey: "type_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["is_singleton"] = isSingleton.json
				json["item_id"] = itemID.json
				json["location_flag"] = locationFlag.json
				json["location_id"] = locationID.json
				json["location_type"] = locationType.json
				if let v = quantity?.json {
					json["quantity"] = v
				}
				json["type_id"] = typeID.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.isSingleton.hashValue)
				hashCombine(seed: &hash, value: self.itemID.hashValue)
				hashCombine(seed: &hash, value: self.locationFlag.hashValue)
				hashCombine(seed: &hash, value: self.locationID.hashValue)
				hashCombine(seed: &hash, value: self.locationType.hashValue)
				hashCombine(seed: &hash, value: self.quantity?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.typeID.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Assets.Asset, rhs: Assets.Asset) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Assets.Asset) {
				isSingleton = other.isSingleton
				itemID = other.itemID
				locationFlag = other.locationFlag
				locationID = other.locationID
				locationType = other.locationType
				quantity = other.quantity
				typeID = other.typeID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Assets.Asset(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Asset)?.hashValue == hashValue
			}
			
		}
		
		
	}
	
}
