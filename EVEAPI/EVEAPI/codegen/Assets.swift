import Foundation
import Alamofire
import Futures


public extension ESI {
	public var assets: Assets {
		return Assets(esi: self)
	}
	
	struct Assets {
		let esi: ESI
		
		@discardableResult
		public func getCharacterAssets(characterID: Int, ifNoneMatch: String? = nil, page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Assets.Asset]>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-assets.read_assets.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = esi.baseURL + "/v3/characters/\(characterID)/assets/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Assets.Asset]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Assets.Asset]>) in
				promise.set(response: response, cached: 3600.0)
			}
			return promise.future
		}
		
		@discardableResult
		public func getCorporationAssetLocations(corporationID: Int, itemIds: [Int64], cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Assets.PostCorporationsCorporationIDAssetsLocationsOk]>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-assets.read_corporation_assets.v1") else {return .init(.failure(ESIError.forbidden))}
			let body = try? JSONEncoder().encode(itemIds)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v2/corporations/\(corporationID)/assets/locations/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Assets.PostCorporationsCorporationIDAssetsLocationsOk]>>()
			esi.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Assets.PostCorporationsCorporationIDAssetsLocationsOk]>) in
				promise.set(response: response, cached: nil)
			}
			return promise.future
		}
		
		@discardableResult
		public func getCharacterAssetNames(characterID: Int, itemIds: [Int64], cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Assets.PostCharactersCharacterIDAssetsNamesOk]>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-assets.read_assets.v1") else {return .init(.failure(ESIError.forbidden))}
			let body = try? JSONEncoder().encode(itemIds)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/characters/\(characterID)/assets/names/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Assets.PostCharactersCharacterIDAssetsNamesOk]>>()
			esi.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Assets.PostCharactersCharacterIDAssetsNamesOk]>) in
				promise.set(response: response, cached: nil)
			}
			return promise.future
		}
		
		@discardableResult
		public func getCharacterAssetLocations(characterID: Int, itemIds: [Int64], cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Assets.PostCharactersCharacterIDAssetsLocationsOk]>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-assets.read_assets.v1") else {return .init(.failure(ESIError.forbidden))}
			let body = try? JSONEncoder().encode(itemIds)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v2/characters/\(characterID)/assets/locations/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Assets.PostCharactersCharacterIDAssetsLocationsOk]>>()
			esi.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Assets.PostCharactersCharacterIDAssetsLocationsOk]>) in
				promise.set(response: response, cached: nil)
			}
			return promise.future
		}
		
		@discardableResult
		public func getCorporationAssets(corporationID: Int, ifNoneMatch: String? = nil, page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Assets.CorpAsset]>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-assets.read_corporation_assets.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = esi.baseURL + "/v3/corporations/\(corporationID)/assets/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Assets.CorpAsset]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Assets.CorpAsset]>) in
				promise.set(response: response, cached: 3600.0)
			}
			return promise.future
		}
		
		@discardableResult
		public func getCorporationAssetNames(corporationID: Int, itemIds: [Int64], cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Assets.PostCorporationsCorporationIDAssetsNamesOk]>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-assets.read_corporation_assets.v1") else {return .init(.failure(ESIError.forbidden))}
			let body = try? JSONEncoder().encode(itemIds)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/corporations/\(corporationID)/assets/names/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Assets.PostCorporationsCorporationIDAssetsNamesOk]>>()
			esi.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Assets.PostCorporationsCorporationIDAssetsNamesOk]>) in
				promise.set(response: response, cached: nil)
			}
			return promise.future
		}
		
		
		public struct PostCorporationsCorporationIDAssetsLocationsOk: Codable, Hashable {
			
			public struct PostCorporationsCorporationIDAssetsLocationsPosition: Codable, Hashable {
				
				
				public var x: Double
				public var y: Double
				public var z: Double
				
				public init(x: Double, y: Double, z: Double) {
					self.x = x
					self.y = y
					self.z = z
				}
				
				public static func ==(lhs: Assets.PostCorporationsCorporationIDAssetsLocationsOk.PostCorporationsCorporationIDAssetsLocationsPosition, rhs: Assets.PostCorporationsCorporationIDAssetsLocationsOk.PostCorporationsCorporationIDAssetsLocationsPosition) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case x
					case y
					case z
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public var itemID: Int64
			public var position: Assets.PostCorporationsCorporationIDAssetsLocationsOk.PostCorporationsCorporationIDAssetsLocationsPosition
			
			public init(itemID: Int64, position: Assets.PostCorporationsCorporationIDAssetsLocationsOk.PostCorporationsCorporationIDAssetsLocationsPosition) {
				self.itemID = itemID
				self.position = position
			}
			
			public static func ==(lhs: Assets.PostCorporationsCorporationIDAssetsLocationsOk, rhs: Assets.PostCorporationsCorporationIDAssetsLocationsOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case itemID = "item_id"
				case position
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct Asset: Codable, Hashable {
			
			public enum Flag: String, Codable, HTTPQueryable {
				case assetSafety = "AssetSafety"
				case autoFit = "AutoFit"
				case boosterBay = "BoosterBay"
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
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCharactersCharacterIDAssetsLocationType: String, Codable, HTTPQueryable {
				case other = "other"
				case solarSystem = "solar_system"
				case station = "station"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var isBlueprintCopy: Bool?
			public var isSingleton: Bool
			public var itemID: Int64
			public var locationFlag: Assets.Asset.Flag
			public var locationID: Int64
			public var locationType: Assets.Asset.GetCharactersCharacterIDAssetsLocationType
			public var quantity: Int
			public var typeID: Int
			
			public init(isBlueprintCopy: Bool?, isSingleton: Bool, itemID: Int64, locationFlag: Assets.Asset.Flag, locationID: Int64, locationType: Assets.Asset.GetCharactersCharacterIDAssetsLocationType, quantity: Int, typeID: Int) {
				self.isBlueprintCopy = isBlueprintCopy
				self.isSingleton = isSingleton
				self.itemID = itemID
				self.locationFlag = locationFlag
				self.locationID = locationID
				self.locationType = locationType
				self.quantity = quantity
				self.typeID = typeID
			}
			
			public static func ==(lhs: Assets.Asset, rhs: Assets.Asset) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case isBlueprintCopy = "is_blueprint_copy"
				case isSingleton = "is_singleton"
				case itemID = "item_id"
				case locationFlag = "location_flag"
				case locationID = "location_id"
				case locationType = "location_type"
				case quantity
				case typeID = "type_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct PostCharactersCharacterIDAssetsNamesOk: Codable, Hashable {
			
			
			public var itemID: Int64
			public var name: String
			
			public init(itemID: Int64, name: String) {
				self.itemID = itemID
				self.name = name
			}
			
			public static func ==(lhs: Assets.PostCharactersCharacterIDAssetsNamesOk, rhs: Assets.PostCharactersCharacterIDAssetsNamesOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case itemID = "item_id"
				case name
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct PostCharactersCharacterIDAssetsLocationsOk: Codable, Hashable {
			
			public struct PostCharactersCharacterIDAssetsLocationsPosition: Codable, Hashable {
				
				
				public var x: Double
				public var y: Double
				public var z: Double
				
				public init(x: Double, y: Double, z: Double) {
					self.x = x
					self.y = y
					self.z = z
				}
				
				public static func ==(lhs: Assets.PostCharactersCharacterIDAssetsLocationsOk.PostCharactersCharacterIDAssetsLocationsPosition, rhs: Assets.PostCharactersCharacterIDAssetsLocationsOk.PostCharactersCharacterIDAssetsLocationsPosition) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case x
					case y
					case z
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public var itemID: Int64
			public var position: Assets.PostCharactersCharacterIDAssetsLocationsOk.PostCharactersCharacterIDAssetsLocationsPosition
			
			public init(itemID: Int64, position: Assets.PostCharactersCharacterIDAssetsLocationsOk.PostCharactersCharacterIDAssetsLocationsPosition) {
				self.itemID = itemID
				self.position = position
			}
			
			public static func ==(lhs: Assets.PostCharactersCharacterIDAssetsLocationsOk, rhs: Assets.PostCharactersCharacterIDAssetsLocationsOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case itemID = "item_id"
				case position
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct CorpAsset: Codable, Hashable {
			
			public enum Flag: String, Codable, HTTPQueryable {
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
				case hiddenModifiers = "HiddenModifiers"
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
				case wallet = "Wallet"
				case wardrobe = "Wardrobe"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDAssetsLocationType: String, Codable, HTTPQueryable {
				case other = "other"
				case solarSystem = "solar_system"
				case station = "station"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var isBlueprintCopy: Bool?
			public var isSingleton: Bool
			public var itemID: Int64
			public var locationFlag: Assets.CorpAsset.Flag
			public var locationID: Int64
			public var locationType: Assets.CorpAsset.GetCorporationsCorporationIDAssetsLocationType
			public var quantity: Int
			public var typeID: Int
			
			public init(isBlueprintCopy: Bool?, isSingleton: Bool, itemID: Int64, locationFlag: Assets.CorpAsset.Flag, locationID: Int64, locationType: Assets.CorpAsset.GetCorporationsCorporationIDAssetsLocationType, quantity: Int, typeID: Int) {
				self.isBlueprintCopy = isBlueprintCopy
				self.isSingleton = isSingleton
				self.itemID = itemID
				self.locationFlag = locationFlag
				self.locationID = locationID
				self.locationType = locationType
				self.quantity = quantity
				self.typeID = typeID
			}
			
			public static func ==(lhs: Assets.CorpAsset, rhs: Assets.CorpAsset) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case isBlueprintCopy = "is_blueprint_copy"
				case isSingleton = "is_singleton"
				case itemID = "item_id"
				case locationFlag = "location_flag"
				case locationID = "location_id"
				case locationType = "location_type"
				case quantity
				case typeID = "type_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct PostCorporationsCorporationIDAssetsNamesNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
			public static func ==(lhs: Assets.PostCorporationsCorporationIDAssetsNamesNotFound, rhs: Assets.PostCorporationsCorporationIDAssetsNamesNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case error
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct PostCorporationsCorporationIDAssetsLocationsNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
			public static func ==(lhs: Assets.PostCorporationsCorporationIDAssetsLocationsNotFound, rhs: Assets.PostCorporationsCorporationIDAssetsLocationsNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case error
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct PostCorporationsCorporationIDAssetsNamesOk: Codable, Hashable {
			
			
			public var itemID: Int64
			public var name: String
			
			public init(itemID: Int64, name: String) {
				self.itemID = itemID
				self.name = name
			}
			
			public static func ==(lhs: Assets.PostCorporationsCorporationIDAssetsNamesOk, rhs: Assets.PostCorporationsCorporationIDAssetsNamesOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case itemID = "item_id"
				case name
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
	}
	
}
