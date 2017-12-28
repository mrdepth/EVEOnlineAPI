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
		
		public func getCoporationAssetNames(corporationID: Int, itemIds: [Int64], completionBlock:((Result<[Assets.PostCorporationsCorporationIDAssetsNamesOk]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-assets.read_corporation_assets.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body = try? JSONSerialization.data(withJSONObject: itemIds.json, options: [])
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/assets/names/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Assets.PostCorporationsCorporationIDAssetsNamesOk]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getCorporationAssets(corporationID: Int, page: Int? = nil, completionBlock:((Result<[Assets.GetCorporationsCorporationIDAssetsOk]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-assets.read_corporation_assets.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v2/corporations/\(corporationID)/assets/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Assets.GetCorporationsCorporationIDAssetsOk]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getCharacterAssetLocations(characterID: Int, itemIds: [Int64], completionBlock:((Result<[Assets.PostCharactersCharacterIDAssetsLocationsOk]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-assets.read_assets.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body = try? JSONSerialization.data(withJSONObject: itemIds.json, options: [])
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v2/characters/\(characterID)/assets/locations/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Assets.PostCharactersCharacterIDAssetsLocationsOk]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getCorporationAssetLocations(corporationID: Int, itemIds: [Int64], completionBlock:((Result<[Assets.PostCorporationsCorporationIDAssetsLocationsOk]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-assets.read_corporation_assets.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body = try? JSONSerialization.data(withJSONObject: itemIds.json, options: [])
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v2/corporations/\(corporationID)/assets/locations/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Assets.PostCorporationsCorporationIDAssetsLocationsOk]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getCharacterAssetNames(characterID: Int, itemIds: [Int64], completionBlock:((Result<[Assets.PostCharactersCharacterIDAssetsNamesOk]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-assets.read_assets.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body = try? JSONSerialization.data(withJSONObject: itemIds.json, options: [])
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/assets/names/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Assets.PostCharactersCharacterIDAssetsNamesOk]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getCharacterAssets(characterID: Int, page: Int? = nil, completionBlock:((Result<[Assets.Asset]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-assets.read_assets.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v3/characters/\(characterID)/assets/"
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
		
		
		@objc(ESIAssetsGetCorporationsCorporationIDAssetsOk) public class GetCorporationsCorporationIDAssetsOk: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public enum GetCorporationsCorporationIDAssetsLocationType: String, JSONCoding, HTTPQueryable {
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
					guard let s = json as? String, let v = GetCorporationsCorporationIDAssetsLocationType(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDAssetsLocationFlag: String, JSONCoding, HTTPQueryable {
				case assetSafety = "AssetSafety"
				case autoFit = "AutoFit"
				case bonus = "Bonus"
				case booster = "Booster"
				case boosterBay = "BoosterBay"
				case capsule = "Capsule"
				case cargo = "Cargo"
				case corpDeliveries = "CorpDeliveries"
				case corpSAG1 = "CorpSAG1"
				case corpSAG2 = "CorpSAG2"
				case corpSAG3 = "CorpSAG3"
				case corpSAG4 = "CorpSAG4"
				case corpSAG5 = "CorpSAG5"
				case corpSAG6 = "CorpSAG6"
				case corpSAG7 = "CorpSAG7"
				case crateLoot = "CrateLoot"
				case deliveries = "Deliveries"
				case droneBay = "DroneBay"
				case dustBattle = "DustBattle"
				case dustDatabank = "DustDatabank"
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
				case hiddenModifers = "HiddenModifers"
				case implant = "Implant"
				case impounded = "Impounded"
				case junkyardReprocessed = "JunkyardReprocessed"
				case junkyardTrashed = "JunkyardTrashed"
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
				case officeFolder = "OfficeFolder"
				case pilot = "Pilot"
				case planetSurface = "PlanetSurface"
				case quafeBay = "QuafeBay"
				case reward = "Reward"
				case rigSlot0 = "RigSlot0"
				case rigSlot1 = "RigSlot1"
				case rigSlot2 = "RigSlot2"
				case rigSlot3 = "RigSlot3"
				case rigSlot4 = "RigSlot4"
				case rigSlot5 = "RigSlot5"
				case rigSlot6 = "RigSlot6"
				case rigSlot7 = "RigSlot7"
				case secondaryStorage = "SecondaryStorage"
				case serviceSlot0 = "ServiceSlot0"
				case serviceSlot1 = "ServiceSlot1"
				case serviceSlot2 = "ServiceSlot2"
				case serviceSlot3 = "ServiceSlot3"
				case serviceSlot4 = "ServiceSlot4"
				case serviceSlot5 = "ServiceSlot5"
				case serviceSlot6 = "ServiceSlot6"
				case serviceSlot7 = "ServiceSlot7"
				case shipHangar = "ShipHangar"
				case shipOffline = "ShipOffline"
				case skill = "Skill"
				case skillInTraining = "SkillInTraining"
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
				case structureActive = "StructureActive"
				case structureFuel = "StructureFuel"
				case structureInactive = "StructureInactive"
				case structureOffline = "StructureOffline"
				case subSystemSlot0 = "SubSystemSlot0"
				case subSystemSlot1 = "SubSystemSlot1"
				case subSystemSlot2 = "SubSystemSlot2"
				case subSystemSlot3 = "SubSystemSlot3"
				case subSystemSlot4 = "SubSystemSlot4"
				case subSystemSlot5 = "SubSystemSlot5"
				case subSystemSlot6 = "SubSystemSlot6"
				case subSystemSlot7 = "SubSystemSlot7"
				case subsystemBay = "SubsystemBay"
				case unlocked = "Unlocked"
				case wallet = "Wallet"
				case wardrobe = "Wardrobe"
				
				public init() {
					self = .assetSafety
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCorporationsCorporationIDAssetsLocationFlag(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var isSingleton: Bool = Bool()
			public var itemID: Int64 = Int64()
			public var locationFlag: Assets.GetCorporationsCorporationIDAssetsOk.GetCorporationsCorporationIDAssetsLocationFlag = Assets.GetCorporationsCorporationIDAssetsOk.GetCorporationsCorporationIDAssetsLocationFlag()
			public var locationID: Int64 = Int64()
			public var locationType: Assets.GetCorporationsCorporationIDAssetsOk.GetCorporationsCorporationIDAssetsLocationType = Assets.GetCorporationsCorporationIDAssetsOk.GetCorporationsCorporationIDAssetsLocationType()
			public var quantity: Int = Int()
			public var typeID: Int = Int()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let isSingleton = dictionary["is_singleton"] as? Bool else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.isSingleton = isSingleton
				guard let itemID = dictionary["item_id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.itemID = itemID
				guard let locationFlag = Assets.GetCorporationsCorporationIDAssetsOk.GetCorporationsCorporationIDAssetsLocationFlag(rawValue: dictionary["location_flag"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.locationFlag = locationFlag
				guard let locationID = dictionary["location_id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.locationID = locationID
				guard let locationType = Assets.GetCorporationsCorporationIDAssetsOk.GetCorporationsCorporationIDAssetsLocationType(rawValue: dictionary["location_type"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.locationType = locationType
				guard let quantity = dictionary["quantity"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.quantity = quantity
				guard let typeID = dictionary["type_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.typeID = typeID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				isSingleton = aDecoder.decodeBool(forKey: "is_singleton")
				itemID = aDecoder.decodeInt64(forKey: "item_id")
				locationFlag = Assets.GetCorporationsCorporationIDAssetsOk.GetCorporationsCorporationIDAssetsLocationFlag(rawValue: aDecoder.decodeObject(forKey: "location_flag") as? String ?? "") ?? Assets.GetCorporationsCorporationIDAssetsOk.GetCorporationsCorporationIDAssetsLocationFlag()
				locationID = aDecoder.decodeInt64(forKey: "location_id")
				locationType = Assets.GetCorporationsCorporationIDAssetsOk.GetCorporationsCorporationIDAssetsLocationType(rawValue: aDecoder.decodeObject(forKey: "location_type") as? String ?? "") ?? Assets.GetCorporationsCorporationIDAssetsOk.GetCorporationsCorporationIDAssetsLocationType()
				quantity = aDecoder.decodeInteger(forKey: "quantity")
				typeID = aDecoder.decodeInteger(forKey: "type_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(isSingleton, forKey: "is_singleton")
				aCoder.encode(itemID, forKey: "item_id")
				aCoder.encode(locationFlag.rawValue, forKey: "location_flag")
				aCoder.encode(locationID, forKey: "location_id")
				aCoder.encode(locationType.rawValue, forKey: "location_type")
				aCoder.encode(quantity, forKey: "quantity")
				aCoder.encode(typeID, forKey: "type_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["is_singleton"] = isSingleton.json
				json["item_id"] = itemID.json
				json["location_flag"] = locationFlag.json
				json["location_id"] = locationID.json
				json["location_type"] = locationType.json
				json["quantity"] = quantity.json
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
				hashCombine(seed: &hash, value: self.quantity.hashValue)
				hashCombine(seed: &hash, value: self.typeID.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Assets.GetCorporationsCorporationIDAssetsOk, rhs: Assets.GetCorporationsCorporationIDAssetsOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Assets.GetCorporationsCorporationIDAssetsOk) {
				isSingleton = other.isSingleton
				itemID = other.itemID
				locationFlag = other.locationFlag
				locationID = other.locationID
				locationType = other.locationType
				quantity = other.quantity
				typeID = other.typeID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Assets.GetCorporationsCorporationIDAssetsOk(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCorporationsCorporationIDAssetsOk)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIAssetsAsset) public class Asset: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
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
				case skill = "Skill"
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
					self = .assetSafety
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = Flag(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
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
					guard let s = json as? String, let v = GetCharactersCharacterIDAssetsLocationType(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
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
			public var quantity: Int = Int()
			public var typeID: Int = Int()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let isSingleton = dictionary["is_singleton"] as? Bool else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.isSingleton = isSingleton
				guard let itemID = dictionary["item_id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.itemID = itemID
				guard let locationFlag = Assets.Asset.Flag(rawValue: dictionary["location_flag"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.locationFlag = locationFlag
				guard let locationID = dictionary["location_id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.locationID = locationID
				guard let locationType = Assets.Asset.GetCharactersCharacterIDAssetsLocationType(rawValue: dictionary["location_type"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.locationType = locationType
				guard let quantity = dictionary["quantity"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.quantity = quantity
				guard let typeID = dictionary["type_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.typeID = typeID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				isSingleton = aDecoder.decodeBool(forKey: "is_singleton")
				itemID = aDecoder.decodeInt64(forKey: "item_id")
				locationFlag = Assets.Asset.Flag(rawValue: aDecoder.decodeObject(forKey: "location_flag") as? String ?? "") ?? Assets.Asset.Flag()
				locationID = aDecoder.decodeInt64(forKey: "location_id")
				locationType = Assets.Asset.GetCharactersCharacterIDAssetsLocationType(rawValue: aDecoder.decodeObject(forKey: "location_type") as? String ?? "") ?? Assets.Asset.GetCharactersCharacterIDAssetsLocationType()
				quantity = aDecoder.decodeInteger(forKey: "quantity")
				typeID = aDecoder.decodeInteger(forKey: "type_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(isSingleton, forKey: "is_singleton")
				aCoder.encode(itemID, forKey: "item_id")
				aCoder.encode(locationFlag.rawValue, forKey: "location_flag")
				aCoder.encode(locationID, forKey: "location_id")
				aCoder.encode(locationType.rawValue, forKey: "location_type")
				aCoder.encode(quantity, forKey: "quantity")
				aCoder.encode(typeID, forKey: "type_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["is_singleton"] = isSingleton.json
				json["item_id"] = itemID.json
				json["location_flag"] = locationFlag.json
				json["location_id"] = locationID.json
				json["location_type"] = locationType.json
				json["quantity"] = quantity.json
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
				hashCombine(seed: &hash, value: self.quantity.hashValue)
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
		
		
		@objc(ESIAssetsPostCharactersCharacterIDAssetsLocationsOk) public class PostCharactersCharacterIDAssetsLocationsOk: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			@objc(ESIAssetsPostCharactersCharacterIDAssetsLocationsOkPostCharactersCharacterIDAssetsLocationsPosition) public class PostCharactersCharacterIDAssetsLocationsPosition: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var x: Double = Double()
				public var y: Double = Double()
				public var z: Double = Double()
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let x = dictionary["x"] as? Double else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.x = x
					guard let y = dictionary["y"] as? Double else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.y = y
					guard let z = dictionary["z"] as? Double else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.z = z
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init?(coder aDecoder: NSCoder) {
					x = aDecoder.decodeDouble(forKey: "x")
					y = aDecoder.decodeDouble(forKey: "y")
					z = aDecoder.decodeDouble(forKey: "z")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(x, forKey: "x")
					aCoder.encode(y, forKey: "y")
					aCoder.encode(z, forKey: "z")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["x"] = x.json
					json["y"] = y.json
					json["z"] = z.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.x.hashValue)
					hashCombine(seed: &hash, value: self.y.hashValue)
					hashCombine(seed: &hash, value: self.z.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: Assets.PostCharactersCharacterIDAssetsLocationsOk.PostCharactersCharacterIDAssetsLocationsPosition, rhs: Assets.PostCharactersCharacterIDAssetsLocationsOk.PostCharactersCharacterIDAssetsLocationsPosition) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Assets.PostCharactersCharacterIDAssetsLocationsOk.PostCharactersCharacterIDAssetsLocationsPosition) {
					x = other.x
					y = other.y
					z = other.z
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Assets.PostCharactersCharacterIDAssetsLocationsOk.PostCharactersCharacterIDAssetsLocationsPosition(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? PostCharactersCharacterIDAssetsLocationsPosition)?.hashValue == hashValue
				}
				
			}
			
			public var itemID: Int64 = Int64()
			public var position: Assets.PostCharactersCharacterIDAssetsLocationsOk.PostCharactersCharacterIDAssetsLocationsPosition = Assets.PostCharactersCharacterIDAssetsLocationsOk.PostCharactersCharacterIDAssetsLocationsPosition()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let itemID = dictionary["item_id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.itemID = itemID
				position = try Assets.PostCharactersCharacterIDAssetsLocationsOk.PostCharactersCharacterIDAssetsLocationsPosition(json: dictionary["position"] as? [String: Any] ?? [:])
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				itemID = aDecoder.decodeInt64(forKey: "item_id")
				position = aDecoder.decodeObject(of: Assets.PostCharactersCharacterIDAssetsLocationsOk.PostCharactersCharacterIDAssetsLocationsPosition.self, forKey: "position")  ?? Assets.PostCharactersCharacterIDAssetsLocationsOk.PostCharactersCharacterIDAssetsLocationsPosition()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(itemID, forKey: "item_id")
				aCoder.encode(position, forKey: "position")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["item_id"] = itemID.json
				json["position"] = position.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.itemID.hashValue)
				hashCombine(seed: &hash, value: self.position.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Assets.PostCharactersCharacterIDAssetsLocationsOk, rhs: Assets.PostCharactersCharacterIDAssetsLocationsOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Assets.PostCharactersCharacterIDAssetsLocationsOk) {
				itemID = other.itemID
				position = Assets.PostCharactersCharacterIDAssetsLocationsOk.PostCharactersCharacterIDAssetsLocationsPosition(other.position)
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Assets.PostCharactersCharacterIDAssetsLocationsOk(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? PostCharactersCharacterIDAssetsLocationsOk)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIAssetsPostCorporationsCorporationIDAssetsLocationsOk) public class PostCorporationsCorporationIDAssetsLocationsOk: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			@objc(ESIAssetsPostCorporationsCorporationIDAssetsLocationsOkPostCorporationsCorporationIDAssetsLocationsPosition) public class PostCorporationsCorporationIDAssetsLocationsPosition: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var x: Double = Double()
				public var y: Double = Double()
				public var z: Double = Double()
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let x = dictionary["x"] as? Double else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.x = x
					guard let y = dictionary["y"] as? Double else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.y = y
					guard let z = dictionary["z"] as? Double else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.z = z
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init?(coder aDecoder: NSCoder) {
					x = aDecoder.decodeDouble(forKey: "x")
					y = aDecoder.decodeDouble(forKey: "y")
					z = aDecoder.decodeDouble(forKey: "z")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(x, forKey: "x")
					aCoder.encode(y, forKey: "y")
					aCoder.encode(z, forKey: "z")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["x"] = x.json
					json["y"] = y.json
					json["z"] = z.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.x.hashValue)
					hashCombine(seed: &hash, value: self.y.hashValue)
					hashCombine(seed: &hash, value: self.z.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: Assets.PostCorporationsCorporationIDAssetsLocationsOk.PostCorporationsCorporationIDAssetsLocationsPosition, rhs: Assets.PostCorporationsCorporationIDAssetsLocationsOk.PostCorporationsCorporationIDAssetsLocationsPosition) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Assets.PostCorporationsCorporationIDAssetsLocationsOk.PostCorporationsCorporationIDAssetsLocationsPosition) {
					x = other.x
					y = other.y
					z = other.z
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Assets.PostCorporationsCorporationIDAssetsLocationsOk.PostCorporationsCorporationIDAssetsLocationsPosition(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? PostCorporationsCorporationIDAssetsLocationsPosition)?.hashValue == hashValue
				}
				
			}
			
			public var itemID: Int64 = Int64()
			public var position: Assets.PostCorporationsCorporationIDAssetsLocationsOk.PostCorporationsCorporationIDAssetsLocationsPosition = Assets.PostCorporationsCorporationIDAssetsLocationsOk.PostCorporationsCorporationIDAssetsLocationsPosition()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let itemID = dictionary["item_id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.itemID = itemID
				position = try Assets.PostCorporationsCorporationIDAssetsLocationsOk.PostCorporationsCorporationIDAssetsLocationsPosition(json: dictionary["position"] as? [String: Any] ?? [:])
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				itemID = aDecoder.decodeInt64(forKey: "item_id")
				position = aDecoder.decodeObject(of: Assets.PostCorporationsCorporationIDAssetsLocationsOk.PostCorporationsCorporationIDAssetsLocationsPosition.self, forKey: "position")  ?? Assets.PostCorporationsCorporationIDAssetsLocationsOk.PostCorporationsCorporationIDAssetsLocationsPosition()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(itemID, forKey: "item_id")
				aCoder.encode(position, forKey: "position")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["item_id"] = itemID.json
				json["position"] = position.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.itemID.hashValue)
				hashCombine(seed: &hash, value: self.position.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Assets.PostCorporationsCorporationIDAssetsLocationsOk, rhs: Assets.PostCorporationsCorporationIDAssetsLocationsOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Assets.PostCorporationsCorporationIDAssetsLocationsOk) {
				itemID = other.itemID
				position = Assets.PostCorporationsCorporationIDAssetsLocationsOk.PostCorporationsCorporationIDAssetsLocationsPosition(other.position)
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Assets.PostCorporationsCorporationIDAssetsLocationsOk(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? PostCorporationsCorporationIDAssetsLocationsOk)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIAssetsPostCharactersCharacterIDAssetsNamesOk) public class PostCharactersCharacterIDAssetsNamesOk: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var itemID: Int64 = Int64()
			public var name: String = String()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let itemID = dictionary["item_id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.itemID = itemID
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.name = name
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				itemID = aDecoder.decodeInt64(forKey: "item_id")
				name = aDecoder.decodeObject(forKey: "name") as? String ?? String()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(itemID, forKey: "item_id")
				aCoder.encode(name, forKey: "name")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["item_id"] = itemID.json
				json["name"] = name.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.itemID.hashValue)
				hashCombine(seed: &hash, value: self.name.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Assets.PostCharactersCharacterIDAssetsNamesOk, rhs: Assets.PostCharactersCharacterIDAssetsNamesOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Assets.PostCharactersCharacterIDAssetsNamesOk) {
				itemID = other.itemID
				name = other.name
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Assets.PostCharactersCharacterIDAssetsNamesOk(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? PostCharactersCharacterIDAssetsNamesOk)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIAssetsPostCorporationsCorporationIDAssetsNamesOk) public class PostCorporationsCorporationIDAssetsNamesOk: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var itemID: Int64 = Int64()
			public var name: String = String()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let itemID = dictionary["item_id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.itemID = itemID
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.name = name
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				itemID = aDecoder.decodeInt64(forKey: "item_id")
				name = aDecoder.decodeObject(forKey: "name") as? String ?? String()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(itemID, forKey: "item_id")
				aCoder.encode(name, forKey: "name")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["item_id"] = itemID.json
				json["name"] = name.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.itemID.hashValue)
				hashCombine(seed: &hash, value: self.name.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Assets.PostCorporationsCorporationIDAssetsNamesOk, rhs: Assets.PostCorporationsCorporationIDAssetsNamesOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Assets.PostCorporationsCorporationIDAssetsNamesOk) {
				itemID = other.itemID
				name = other.name
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Assets.PostCorporationsCorporationIDAssetsNamesOk(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? PostCorporationsCorporationIDAssetsNamesOk)?.hashValue == hashValue
			}
			
		}
		
		
	}
	
}
