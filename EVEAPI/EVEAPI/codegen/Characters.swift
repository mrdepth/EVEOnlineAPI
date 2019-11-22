import Foundation
import Alamofire
import Combine


extension ESI {
	public var characters: Characters {
		return Characters(esi: self, route: .path("characters", next: .root(ESI.apiURL)))
	}
	
	public struct Characters {
		let esi: ESI
		let route: APIRoute
		
		
		
		public func affiliation() -> Affiliation {
			Affiliation(esi: esi, route: .path("affiliation", next: route))
		}
		public func characterID(_ value: Int) -> CharacterID {
			CharacterID(esi: esi, route: .parameter(value, next: route))
		}
		
		public struct Affiliation {
			let esi: ESI
			let route: APIRoute
			
			
			public func post(characters: [Int], cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
				do {
					
					
					let body = try JSONEncoder().encode(characters)
					
					var headers = HTTPHeaders()
					headers["Accept"] = "application/json"
					headers["Content-Type"] = "application/json"
					
					var query = [URLQueryItem]()
					query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
					
					
					let url = try route.asURL()
					var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
					components.queryItems = query
					
					return esi.session.publisher(components,
					method: .post,
					encoding: BodyDataEncoding(data: body),
					headers: headers,
					interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
					.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
					.eraseToAnyPublisher()
					
				}
				catch {
					return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
				}
			}
			
			
			
			
			
			
			public struct Success: Codable, Hashable {
				
				
				public let allianceID: Int?
				public let characterID: Int
				public let corporationID: Int
				public let factionID: Int?
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case allianceID = "alliance_id"
					case characterID = "character_id"
					case corporationID = "corporation_id"
					case factionID = "faction_id"
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
		}
		
		public struct CharacterID {
			let esi: ESI
			let route: APIRoute
			
			
			public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Success, AFError> {
				do {
					
					
					
					
					var headers = HTTPHeaders()
					headers["Accept"] = "application/json"
					
					
					var query = [URLQueryItem]()
					query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
					
					
					let url = try route.asURL()
					var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
					components.queryItems = query
					
					return esi.session.publisher(components,
					method: .get,
					encoding: URLEncoding.default,
					headers: headers,
					interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
					.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
					.eraseToAnyPublisher()
					
				}
				catch {
					return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
				}
			}
			
			
			public func agentsResearch() -> AgentsResearch {
				AgentsResearch(esi: esi, route: .path("agents_research", next: route))
			}
			public func assets() -> Assets {
				Assets(esi: esi, route: .path("assets", next: route))
			}
			public func attributes() -> Attributes {
				Attributes(esi: esi, route: .path("attributes", next: route))
			}
			public func blueprints() -> Blueprints {
				Blueprints(esi: esi, route: .path("blueprints", next: route))
			}
			public func bookmarks() -> Bookmarks {
				Bookmarks(esi: esi, route: .path("bookmarks", next: route))
			}
			public func calendar() -> Calendar {
				Calendar(esi: esi, route: .path("calendar", next: route))
			}
			public func clones() -> Clones {
				Clones(esi: esi, route: .path("clones", next: route))
			}
			public func contacts() -> Contacts {
				Contacts(esi: esi, route: .path("contacts", next: route))
			}
			public func contracts() -> Contracts {
				Contracts(esi: esi, route: .path("contracts", next: route))
			}
			public func corporationhistory() -> Corporationhistory {
				Corporationhistory(esi: esi, route: .path("corporationhistory", next: route))
			}
			public func cspa() -> Cspa {
				Cspa(esi: esi, route: .path("cspa", next: route))
			}
			public func fatigue() -> Fatigue {
				Fatigue(esi: esi, route: .path("fatigue", next: route))
			}
			public func fittings() -> Fittings {
				Fittings(esi: esi, route: .path("fittings", next: route))
			}
			public func fleet() -> Fleet {
				Fleet(esi: esi, route: .path("fleet", next: route))
			}
			public func fw() -> Fw {
				Fw(esi: esi, route: .path("fw", next: route))
			}
			public func implants() -> Implants {
				Implants(esi: esi, route: .path("implants", next: route))
			}
			public func industry() -> Industry {
				Industry(esi: esi, route: .path("industry", next: route))
			}
			public func killmails() -> Killmails {
				Killmails(esi: esi, route: .path("killmails", next: route))
			}
			public func location() -> Location {
				Location(esi: esi, route: .path("location", next: route))
			}
			public func loyalty() -> Loyalty {
				Loyalty(esi: esi, route: .path("loyalty", next: route))
			}
			public func mail() -> Mail {
				Mail(esi: esi, route: .path("mail", next: route))
			}
			public func medals() -> Medals {
				Medals(esi: esi, route: .path("medals", next: route))
			}
			public func mining() -> Mining {
				Mining(esi: esi, route: .path("mining", next: route))
			}
			public func notifications() -> Notifications {
				Notifications(esi: esi, route: .path("notifications", next: route))
			}
			public func online() -> Online {
				Online(esi: esi, route: .path("online", next: route))
			}
			public func opportunities() -> Opportunities {
				Opportunities(esi: esi, route: .path("opportunities", next: route))
			}
			public func orders() -> Orders {
				Orders(esi: esi, route: .path("orders", next: route))
			}
			public func planets() -> Planets {
				Planets(esi: esi, route: .path("planets", next: route))
			}
			public func portrait() -> Portrait {
				Portrait(esi: esi, route: .path("portrait", next: route))
			}
			public func roles() -> Roles {
				Roles(esi: esi, route: .path("roles", next: route))
			}
			public func search() -> Search {
				Search(esi: esi, route: .path("search", next: route))
			}
			public func ship() -> Ship {
				Ship(esi: esi, route: .path("ship", next: route))
			}
			public func skillqueue() -> Skillqueue {
				Skillqueue(esi: esi, route: .path("skillqueue", next: route))
			}
			public func skills() -> Skills {
				Skills(esi: esi, route: .path("skills", next: route))
			}
			public func standings() -> Standings {
				Standings(esi: esi, route: .path("standings", next: route))
			}
			public func stats() -> Stats {
				Stats(esi: esi, route: .path("stats", next: route))
			}
			public func titles() -> Titles {
				Titles(esi: esi, route: .path("titles", next: route))
			}
			public func wallet() -> Wallet {
				Wallet(esi: esi, route: .path("wallet", next: route))
			}
			
			public struct AgentsResearch {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-characters.read_agents_research.v1") else {throw ESIError.forbidden}
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public let agentID: Int
					public let pointsPerDay: Double
					public let remainderPoints: Double
					public let skillTypeID: Int
					public let startedAt: Date
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case agentID = "agent_id"
						case pointsPerDay = "points_per_day"
						case remainderPoints = "remainder_points"
						case skillTypeID = "skill_type_id"
						case startedAt = "started_at"
						
						var dateFormatter: DateFormatter? {
							switch self {
								case .startedAt:
								return DateFormatter.esiDateTimeFormatter
								default:
								return nil
							}
						}
					}
				}
				
			}
			
			public struct Assets {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-assets.read_assets.v1") else {throw ESIError.forbidden}
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						if let page = page {
							query.append(URLQueryItem(name: "page", value: page.description))
						}
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				public func locations() -> Locations {
					Locations(esi: esi, route: .path("locations", next: route))
				}
				public func names() -> Names {
					Names(esi: esi, route: .path("names", next: route))
				}
				
				public struct Locations {
					let esi: ESI
					let route: APIRoute
					
					
					public func post(itemIds: [Int64], cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-assets.read_assets.v1") else {throw ESIError.forbidden}
							let body = try JSONEncoder().encode(itemIds)
							
							var headers = HTTPHeaders()
							headers["Accept"] = "application/json"
							headers["Content-Type"] = "application/json"
							
							var query = [URLQueryItem]()
							query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
							
							
							let url = try route.asURL()
							var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
							components.queryItems = query
							
							return esi.session.publisher(components,
							method: .post,
							encoding: BodyDataEncoding(data: body),
							headers: headers,
							interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
							
						}
						catch {
							return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
						}
					}
					
					
					
					
					
					
					public struct Success: Codable, Hashable {
						
						
						public let itemID: Int64
						public let position: ESI.Characters.Position
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case itemID = "item_id"
							case position
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
				}
				
				public struct Names {
					let esi: ESI
					let route: APIRoute
					
					
					public func post(itemIds: [Int64], cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-assets.read_assets.v1") else {throw ESIError.forbidden}
							let body = try JSONEncoder().encode(itemIds)
							
							var headers = HTTPHeaders()
							headers["Accept"] = "application/json"
							headers["Content-Type"] = "application/json"
							
							var query = [URLQueryItem]()
							query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
							
							
							let url = try route.asURL()
							var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
							components.queryItems = query
							
							return esi.session.publisher(components,
							method: .post,
							encoding: BodyDataEncoding(data: body),
							headers: headers,
							interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
							
						}
						catch {
							return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
						}
					}
					
					
					
					
					
					
					public struct Success: Codable, Hashable {
						
						
						public let itemID: Int64
						public let name: String
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case itemID = "item_id"
							case name
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
				}
				
				
				public enum LocationFlag: String, Codable, CustomStringConvertible {
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
					
					public var description: String {
						return rawValue
					}
					
				}
				
				public struct Success: Codable, Hashable {
					
					
					public let isBlueprintCopy: Bool?
					public let isSingleton: Bool
					public let itemID: Int64
					public let locationFlag: ESI.Characters.CharacterID.Assets.LocationFlag
					public let locationID: Int64
					public let locationType: ESI.Characters.LocationType
					public let quantity: Int
					public let typeID: Int
					
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
							return nil
						}
					}
				}
				
			}
			
			public struct Attributes {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Success, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-skills.read_skills.v1") else {throw ESIError.forbidden}
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public let accruedRemapCooldownDate: Date?
					public let bonusRemaps: Int?
					public let charisma: Int
					public let intelligence: Int
					public let lastRemapDate: Date?
					public let memory: Int
					public let perception: Int
					public let willpower: Int
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case accruedRemapCooldownDate = "accrued_remap_cooldown_date"
						case bonusRemaps = "bonus_remaps"
						case charisma
						case intelligence
						case lastRemapDate = "last_remap_date"
						case memory
						case perception
						case willpower
						
						var dateFormatter: DateFormatter? {
							switch self {
								case .accruedRemapCooldownDate:
								return DateFormatter.esiDateTimeFormatter
								case .lastRemapDate:
								return DateFormatter.esiDateTimeFormatter
								default:
								return nil
							}
						}
					}
				}
				
			}
			
			public struct Blueprints {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-characters.read_blueprints.v1") else {throw ESIError.forbidden}
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						if let page = page {
							query.append(URLQueryItem(name: "page", value: page.description))
						}
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public let itemID: Int64
					public let locationFlag: ESI.Characters.CharacterID.Blueprints.LocationFlag
					public let locationID: Int64
					public let materialEfficiency: Int
					public let quantity: Int
					public let runs: Int
					public let timeEfficiency: Int
					public let typeID: Int
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case itemID = "item_id"
						case locationFlag = "location_flag"
						case locationID = "location_id"
						case materialEfficiency = "material_efficiency"
						case quantity
						case runs
						case timeEfficiency = "time_efficiency"
						case typeID = "type_id"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public enum LocationFlag: String, Codable, CustomStringConvertible {
					case autoFit = "AutoFit"
					case cargo = "Cargo"
					case corpseBay = "CorpseBay"
					case droneBay = "DroneBay"
					case fleetHangar = "FleetHangar"
					case deliveries = "Deliveries"
					case hiddenModifiers = "HiddenModifiers"
					case hangar = "Hangar"
					case hangarAll = "HangarAll"
					case loSlot0 = "LoSlot0"
					case loSlot1 = "LoSlot1"
					case loSlot2 = "LoSlot2"
					case loSlot3 = "LoSlot3"
					case loSlot4 = "LoSlot4"
					case loSlot5 = "LoSlot5"
					case loSlot6 = "LoSlot6"
					case loSlot7 = "LoSlot7"
					case medSlot0 = "MedSlot0"
					case medSlot1 = "MedSlot1"
					case medSlot2 = "MedSlot2"
					case medSlot3 = "MedSlot3"
					case medSlot4 = "MedSlot4"
					case medSlot5 = "MedSlot5"
					case medSlot6 = "MedSlot6"
					case medSlot7 = "MedSlot7"
					case hiSlot0 = "HiSlot0"
					case hiSlot1 = "HiSlot1"
					case hiSlot2 = "HiSlot2"
					case hiSlot3 = "HiSlot3"
					case hiSlot4 = "HiSlot4"
					case hiSlot5 = "HiSlot5"
					case hiSlot6 = "HiSlot6"
					case hiSlot7 = "HiSlot7"
					case assetSafety = "AssetSafety"
					case locked = "Locked"
					case unlocked = "Unlocked"
					case implant = "Implant"
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
					case specializedFuelBay = "SpecializedFuelBay"
					case specializedOreHold = "SpecializedOreHold"
					case specializedGasHold = "SpecializedGasHold"
					case specializedMineralHold = "SpecializedMineralHold"
					case specializedSalvageHold = "SpecializedSalvageHold"
					case specializedShipHold = "SpecializedShipHold"
					case specializedSmallShipHold = "SpecializedSmallShipHold"
					case specializedMediumShipHold = "SpecializedMediumShipHold"
					case specializedLargeShipHold = "SpecializedLargeShipHold"
					case specializedIndustrialShipHold = "SpecializedIndustrialShipHold"
					case specializedAmmoHold = "SpecializedAmmoHold"
					case specializedCommandCenterHold = "SpecializedCommandCenterHold"
					case specializedPlanetaryCommoditiesHold = "SpecializedPlanetaryCommoditiesHold"
					case specializedMaterialBay = "SpecializedMaterialBay"
					case subSystemSlot0 = "SubSystemSlot0"
					case subSystemSlot1 = "SubSystemSlot1"
					case subSystemSlot2 = "SubSystemSlot2"
					case subSystemSlot3 = "SubSystemSlot3"
					case subSystemSlot4 = "SubSystemSlot4"
					case subSystemSlot5 = "SubSystemSlot5"
					case subSystemSlot6 = "SubSystemSlot6"
					case subSystemSlot7 = "SubSystemSlot7"
					case fighterBay = "FighterBay"
					case fighterTube0 = "FighterTube0"
					case fighterTube1 = "FighterTube1"
					case fighterTube2 = "FighterTube2"
					case fighterTube3 = "FighterTube3"
					case fighterTube4 = "FighterTube4"
					case module = "Module"
					
					public var description: String {
						return rawValue
					}
					
				}
				
			}
			
			public struct Bookmarks {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-bookmarks.read_character_bookmarks.v1") else {throw ESIError.forbidden}
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						if let page = page {
							query.append(URLQueryItem(name: "page", value: page.description))
						}
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				public func folders() -> Folders {
					Folders(esi: esi, route: .path("folders", next: route))
				}
				
				public struct Folders {
					let esi: ESI
					let route: APIRoute
					
					
					public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-bookmarks.read_character_bookmarks.v1") else {throw ESIError.forbidden}
							
							
							var headers = HTTPHeaders()
							headers["Accept"] = "application/json"
							
							
							var query = [URLQueryItem]()
							query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
							if let page = page {
								query.append(URLQueryItem(name: "page", value: page.description))
							}
							
							let url = try route.asURL()
							var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
							components.queryItems = query
							
							return esi.session.publisher(components,
							method: .get,
							encoding: URLEncoding.default,
							headers: headers,
							interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
							
						}
						catch {
							return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
						}
					}
					
					
					
					
					
					
					public struct Success: Codable, Hashable {
						
						
						public let folderID: Int
						public let name: String
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case folderID = "folder_id"
							case name
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
				}
				
				
				public struct Success: Codable, Hashable {
					
					
					public let bookmarkID: Int
					public let coordinates: ESI.Characters.Coordinates?
					public let created: Date
					public let creatorID: Int
					public let folderID: Int?
					public let item: ESI.Characters.Item?
					public let label: String
					public let locationID: Int
					public let notes: String
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case bookmarkID = "bookmark_id"
						case coordinates
						case created
						case creatorID = "creator_id"
						case folderID = "folder_id"
						case item
						case label
						case locationID = "location_id"
						case notes
						
						var dateFormatter: DateFormatter? {
							switch self {
								case .created:
								return DateFormatter.esiDateTimeFormatter
								default:
								return nil
							}
						}
					}
				}
				
			}
			
			public struct Calendar {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(fromEvent: Int?, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-calendar.read_calendar_events.v1") else {throw ESIError.forbidden}
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						if let fromEvent = fromEvent {
							query.append(URLQueryItem(name: "from_event", value: fromEvent.description))
						}
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				public func eventID(_ value: Int) -> EventID {
					EventID(esi: esi, route: .parameter(value, next: route))
				}
				
				public struct EventID {
					let esi: ESI
					let route: APIRoute
					
					
					public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Success, AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-calendar.read_calendar_events.v1") else {throw ESIError.forbidden}
							
							
							var headers = HTTPHeaders()
							headers["Accept"] = "application/json"
							
							
							var query = [URLQueryItem]()
							query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
							
							
							let url = try route.asURL()
							var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
							components.queryItems = query
							
							return esi.session.publisher(components,
							method: .get,
							encoding: URLEncoding.default,
							headers: headers,
							interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
							
						}
						catch {
							return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
						}
					}
					
					
					public func put(response: ESI.Characters.CharacterID.Calendar.EventID.Response, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Void, AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-calendar.respond_calendar_events.v1") else {throw ESIError.forbidden}
							let body = try JSONEncoder().encode(response)
							
							var headers = HTTPHeaders()
							headers["Accept"] = "application/json"
							headers["Content-Type"] = "application/json"
							
							var query = [URLQueryItem]()
							query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
							
							
							let url = try route.asURL()
							var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
							components.queryItems = query
							
							return esi.session.publisher(components,
							method: .put,
							encoding: BodyDataEncoding(data: body),
							headers: headers,
							interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
							.responseVoid(queue: esi.session.serializationQueue)
							.eraseToAnyPublisher()
							
						}
						catch {
							return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
						}
					}
					
					
					public func attendees() -> Attendees {
						Attendees(esi: esi, route: .path("attendees", next: route))
					}
					
					public struct Attendees {
						let esi: ESI
						let route: APIRoute
						
						
						public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
							do {
								
								let scopes = esi.token?.scopes ?? []
								guard scopes.contains("esi-calendar.read_calendar_events.v1") else {throw ESIError.forbidden}
								
								
								var headers = HTTPHeaders()
								headers["Accept"] = "application/json"
								
								
								var query = [URLQueryItem]()
								query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
								
								
								let url = try route.asURL()
								var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
								components.queryItems = query
								
								return esi.session.publisher(components,
								method: .get,
								encoding: URLEncoding.default,
								headers: headers,
								interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
								.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
								.eraseToAnyPublisher()
								
							}
							catch {
								return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
							}
						}
						
						
						
						
						
						
						public struct Success: Codable, Hashable {
							
							
							public let characterID: Int?
							public let eventResponse: ESI.Characters.CharacterID.Calendar.EventResponse?
							
							enum CodingKeys: String, CodingKey, DateFormatted {
								case characterID = "character_id"
								case eventResponse = "event_response"
								
								var dateFormatter: DateFormatter? {
									return nil
								}
							}
						}
						
					}
					
					
					public struct Success: Codable, Hashable {
						
						
						public let date: Date
						public let duration: Int
						public let eventID: Int
						public let importance: Int
						public let ownerID: Int
						public let ownerName: String
						public let ownerType: ESI.Characters.CharacterID.Calendar.EventID.OwnerType
						public let response: String
						public let text: String
						public let title: String
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case date
							case duration
							case eventID = "event_id"
							case importance
							case ownerID = "owner_id"
							case ownerName = "owner_name"
							case ownerType = "owner_type"
							case response
							case text
							case title
							
							var dateFormatter: DateFormatter? {
								switch self {
									case .date:
									return DateFormatter.esiDateTimeFormatter
									default:
									return nil
								}
							}
						}
					}
					
					public struct Response: Codable, Hashable {
						
						public enum ResponseResponse: String, Codable, CustomStringConvertible {
							case accepted
							case declined
							case tentative
							
							public var description: String {
								return rawValue
							}
							
						}
						
						public let response: ESI.Characters.CharacterID.Calendar.EventID.Response.ResponseResponse
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case response
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
					public enum OwnerType: String, Codable, CustomStringConvertible {
						case eveServer = "eve_server"
						case corporation
						case faction
						case character
						case alliance
						
						public var description: String {
							return rawValue
						}
						
					}
					
				}
				
				
				public enum EventResponse: String, Codable, CustomStringConvertible {
					case declined
					case notResponded = "not_responded"
					case accepted
					case tentative
					
					public var description: String {
						return rawValue
					}
					
				}
				
				public struct Success: Codable, Hashable {
					
					
					public let eventDate: Date?
					public let eventID: Int?
					public let eventResponse: ESI.Characters.CharacterID.Calendar.EventResponse?
					public let importance: Int?
					public let title: String?
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case eventDate = "event_date"
						case eventID = "event_id"
						case eventResponse = "event_response"
						case importance
						case title
						
						var dateFormatter: DateFormatter? {
							switch self {
								case .eventDate:
								return DateFormatter.esiDateTimeFormatter
								default:
								return nil
							}
						}
					}
				}
				
			}
			
			public struct Clones {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Success, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-clones.read_clones.v1") else {throw ESIError.forbidden}
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct JumpClone: Codable, Hashable {
					
					public enum JumpCloneLocationType: String, Codable, CustomStringConvertible {
						case station
						case structure
						
						public var description: String {
							return rawValue
						}
						
					}
					
					public let implants: [Int]
					public let jumpCloneID: Int
					public let locationID: Int64
					public let locationType: ESI.Characters.CharacterID.Clones.JumpClone.JumpCloneLocationType
					public let name: String?
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case implants
						case jumpCloneID = "jump_clone_id"
						case locationID = "location_id"
						case locationType = "location_type"
						case name
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct HomeLocation: Codable, Hashable {
					
					public enum LocationType: String, Codable, CustomStringConvertible {
						case station
						case structure
						
						public var description: String {
							return rawValue
						}
						
					}
					
					public let locationID: Int64?
					public let locationType: ESI.Characters.CharacterID.Clones.HomeLocation.LocationType?
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case locationID = "location_id"
						case locationType = "location_type"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct Success: Codable, Hashable {
					
					
					public let homeLocation: ESI.Characters.CharacterID.Clones.HomeLocation?
					public let jumpClones: [ESI.Characters.CharacterID.Clones.JumpClone]
					public let lastCloneJumpDate: Date?
					public let lastStationChangeDate: Date?
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case homeLocation = "home_location"
						case jumpClones = "jump_clones"
						case lastCloneJumpDate = "last_clone_jump_date"
						case lastStationChangeDate = "last_station_change_date"
						
						var dateFormatter: DateFormatter? {
							switch self {
								case .lastCloneJumpDate:
								return DateFormatter.esiDateTimeFormatter
								case .lastStationChangeDate:
								return DateFormatter.esiDateTimeFormatter
								default:
								return nil
							}
						}
					}
				}
				
			}
			
			public struct Contacts {
				let esi: ESI
				let route: APIRoute
				
				
				public func delete(contactIds: [Int], cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Void, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-characters.write_contacts.v1") else {throw ESIError.forbidden}
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						headers["Content-Type"] = "application/json"
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						if !contactIds.isEmpty {
							query.append(URLQueryItem(name: "contact_ids", value: contactIds.lazy.map{$0.description}.joined(separator: ",")))
						}
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .delete,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseVoid(queue: esi.session.serializationQueue)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-characters.read_contacts.v1") else {throw ESIError.forbidden}
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						if let page = page {
							query.append(URLQueryItem(name: "page", value: page.description))
						}
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				public func post(contactIds: [Int], labelIds: [Int64]?, standing: Double, watched: Bool? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Int], AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-characters.write_contacts.v1") else {throw ESIError.forbidden}
						let body = try JSONEncoder().encode(contactIds)
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						headers["Content-Type"] = "application/json"
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						if let labelIds = labelIds {
							if !labelIds.isEmpty {
								query.append(URLQueryItem(name: "label_ids", value: labelIds.lazy.map{$0.description}.joined(separator: ",")))
							}
						}
						query.append(URLQueryItem(name: "standing", value: standing.description))
						if let watched = watched {
							query.append(URLQueryItem(name: "watched", value: watched.description))
						}
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .post,
						encoding: BodyDataEncoding(data: body),
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				public func put(contactIds: [Int], labelIds: [Int64]?, standing: Double, watched: Bool? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Void, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-characters.write_contacts.v1") else {throw ESIError.forbidden}
						let body = try JSONEncoder().encode(contactIds)
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						headers["Content-Type"] = "application/json"
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						if let labelIds = labelIds {
							if !labelIds.isEmpty {
								query.append(URLQueryItem(name: "label_ids", value: labelIds.lazy.map{$0.description}.joined(separator: ",")))
							}
						}
						query.append(URLQueryItem(name: "standing", value: standing.description))
						if let watched = watched {
							query.append(URLQueryItem(name: "watched", value: watched.description))
						}
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .put,
						encoding: BodyDataEncoding(data: body),
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseVoid(queue: esi.session.serializationQueue)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				public func labels() -> Labels {
					Labels(esi: esi, route: .path("labels", next: route))
				}
				
				public struct Labels {
					let esi: ESI
					let route: APIRoute
					
					
					public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-characters.read_contacts.v1") else {throw ESIError.forbidden}
							
							
							var headers = HTTPHeaders()
							headers["Accept"] = "application/json"
							
							
							var query = [URLQueryItem]()
							query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
							
							
							let url = try route.asURL()
							var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
							components.queryItems = query
							
							return esi.session.publisher(components,
							method: .get,
							encoding: URLEncoding.default,
							headers: headers,
							interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
							
						}
						catch {
							return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
						}
					}
					
					
					
					
					
					
					public struct Success: Codable, Hashable {
						
						
						public let labelID: Int64
						public let labelName: String
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case labelID = "label_id"
							case labelName = "label_name"
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
				}
				
				
				public struct Success: Codable, Hashable {
					
					
					public let contactID: Int
					public let contactType: ESI.Characters.ContactType
					public let isBlocked: Bool?
					public let isWatched: Bool?
					public let labelIds: [Int64]?
					public let standing: Double
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case contactID = "contact_id"
						case contactType = "contact_type"
						case isBlocked = "is_blocked"
						case isWatched = "is_watched"
						case labelIds = "label_ids"
						case standing
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
			}
			
			public struct Contracts {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-contracts.read_character_contracts.v1") else {throw ESIError.forbidden}
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						if let page = page {
							query.append(URLQueryItem(name: "page", value: page.description))
						}
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				public func contractID(_ value: Int) -> ContractID {
					ContractID(esi: esi, route: .parameter(value, next: route))
				}
				
				public struct ContractID {
					let esi: ESI
					let route: APIRoute
					
					
					
					public func bids() -> Bids {
						Bids(esi: esi, route: .path("bids", next: route))
					}
					public func items() -> Items {
						Items(esi: esi, route: .path("items", next: route))
					}
					
					public struct Bids {
						let esi: ESI
						let route: APIRoute
						
						
						public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
							do {
								
								let scopes = esi.token?.scopes ?? []
								guard scopes.contains("esi-contracts.read_character_contracts.v1") else {throw ESIError.forbidden}
								
								
								var headers = HTTPHeaders()
								headers["Accept"] = "application/json"
								
								
								var query = [URLQueryItem]()
								query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
								
								
								let url = try route.asURL()
								var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
								components.queryItems = query
								
								return esi.session.publisher(components,
								method: .get,
								encoding: URLEncoding.default,
								headers: headers,
								interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
								.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
								.eraseToAnyPublisher()
								
							}
							catch {
								return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
							}
						}
						
						
						
						
						
						
						public struct Success: Codable, Hashable {
							
							
							public let amount: Double
							public let bidID: Int
							public let bidderID: Int
							public let dateBid: Date
							
							enum CodingKeys: String, CodingKey, DateFormatted {
								case amount
								case bidID = "bid_id"
								case bidderID = "bidder_id"
								case dateBid = "date_bid"
								
								var dateFormatter: DateFormatter? {
									switch self {
										case .dateBid:
										return DateFormatter.esiDateTimeFormatter
										default:
										return nil
									}
								}
							}
						}
						
					}
					
					public struct Items {
						let esi: ESI
						let route: APIRoute
						
						
						public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
							do {
								
								let scopes = esi.token?.scopes ?? []
								guard scopes.contains("esi-contracts.read_character_contracts.v1") else {throw ESIError.forbidden}
								
								
								var headers = HTTPHeaders()
								headers["Accept"] = "application/json"
								
								
								var query = [URLQueryItem]()
								query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
								
								
								let url = try route.asURL()
								var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
								components.queryItems = query
								
								return esi.session.publisher(components,
								method: .get,
								encoding: URLEncoding.default,
								headers: headers,
								interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
								.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
								.eraseToAnyPublisher()
								
							}
							catch {
								return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
							}
						}
						
						
						
						
						
						
						public struct Success: Codable, Hashable {
							
							
							public let isIncluded: Bool
							public let isSingleton: Bool
							public let quantity: Int
							public let rawQuantity: Int?
							public let recordID: Int64
							public let typeID: Int
							
							enum CodingKeys: String, CodingKey, DateFormatted {
								case isIncluded = "is_included"
								case isSingleton = "is_singleton"
								case quantity
								case rawQuantity = "raw_quantity"
								case recordID = "record_id"
								case typeID = "type_id"
								
								var dateFormatter: DateFormatter? {
									return nil
								}
							}
						}
						
					}
					
					
					
				}
				
				
				public enum Status: String, Codable, CustomStringConvertible {
					case outstanding
					case inProgress = "in_progress"
					case finishedIssuer = "finished_issuer"
					case finishedContractor = "finished_contractor"
					case finished
					case cancelled
					case rejected
					case failed
					case deleted
					case reversed
					
					public var description: String {
						return rawValue
					}
					
				}
				
				public struct Success: Codable, Hashable {
					
					
					public let acceptorID: Int
					public let assigneeID: Int
					public let availability: ESI.Characters.Availability
					public let buyout: Double?
					public let collateral: Double?
					public let contractID: Int
					public let dateAccepted: Date?
					public let dateCompleted: Date?
					public let dateExpired: Date
					public let dateIssued: Date
					public let daysToComplete: Int?
					public let endLocationID: Int64?
					public let forCorporation: Bool
					public let issuerCorporationID: Int
					public let issuerID: Int
					public let price: Double?
					public let reward: Double?
					public let startLocationID: Int64?
					public let status: ESI.Characters.CharacterID.Contracts.Status
					public let title: String?
					public let type: ESI.Contracts.ValueType
					public let volume: Double?
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case acceptorID = "acceptor_id"
						case assigneeID = "assignee_id"
						case availability
						case buyout
						case collateral
						case contractID = "contract_id"
						case dateAccepted = "date_accepted"
						case dateCompleted = "date_completed"
						case dateExpired = "date_expired"
						case dateIssued = "date_issued"
						case daysToComplete = "days_to_complete"
						case endLocationID = "end_location_id"
						case forCorporation = "for_corporation"
						case issuerCorporationID = "issuer_corporation_id"
						case issuerID = "issuer_id"
						case price
						case reward
						case startLocationID = "start_location_id"
						case status
						case title
						case type
						case volume
						
						var dateFormatter: DateFormatter? {
							switch self {
								case .dateAccepted:
								return DateFormatter.esiDateTimeFormatter
								case .dateCompleted:
								return DateFormatter.esiDateTimeFormatter
								case .dateExpired:
								return DateFormatter.esiDateTimeFormatter
								case .dateIssued:
								return DateFormatter.esiDateTimeFormatter
								default:
								return nil
							}
						}
					}
				}
				
			}
			
			public struct Corporationhistory {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
					do {
						
						
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public let corporationID: Int
					public let isDeleted: Bool?
					public let recordID: Int
					public let startDate: Date
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case corporationID = "corporation_id"
						case isDeleted = "is_deleted"
						case recordID = "record_id"
						case startDate = "start_date"
						
						var dateFormatter: DateFormatter? {
							switch self {
								case .startDate:
								return DateFormatter.esiDateTimeFormatter
								default:
								return nil
							}
						}
					}
				}
				
			}
			
			public struct Cspa {
				let esi: ESI
				let route: APIRoute
				
				
				public func post(characters: [Int], cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Double, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-characters.read_contacts.v1") else {throw ESIError.forbidden}
						let body = try JSONEncoder().encode(characters)
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						headers["Content-Type"] = "application/json"
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .post,
						encoding: BodyDataEncoding(data: body),
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				
			}
			
			public struct Fatigue {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Success, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-characters.read_fatigue.v1") else {throw ESIError.forbidden}
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public let jumpFatigueExpireDate: Date?
					public let lastJumpDate: Date?
					public let lastUpdateDate: Date?
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case jumpFatigueExpireDate = "jump_fatigue_expire_date"
						case lastJumpDate = "last_jump_date"
						case lastUpdateDate = "last_update_date"
						
						var dateFormatter: DateFormatter? {
							switch self {
								case .jumpFatigueExpireDate:
								return DateFormatter.esiDateTimeFormatter
								case .lastJumpDate:
								return DateFormatter.esiDateTimeFormatter
								case .lastUpdateDate:
								return DateFormatter.esiDateTimeFormatter
								default:
								return nil
							}
						}
					}
				}
				
			}
			
			public struct Fittings {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-fittings.read_fittings.v1") else {throw ESIError.forbidden}
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				public func post(fitting: ESI.Characters.CharacterID.Fittings.Fitting, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Created, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-fittings.write_fittings.v1") else {throw ESIError.forbidden}
						let body = try JSONEncoder().encode(fitting)
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						headers["Content-Type"] = "application/json"
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .post,
						encoding: BodyDataEncoding(data: body),
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				public func fittingID(_ value: Int) -> FittingID {
					FittingID(esi: esi, route: .parameter(value, next: route))
				}
				
				public struct FittingID {
					let esi: ESI
					let route: APIRoute
					
					
					public func delete(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Void, AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-fittings.write_fittings.v1") else {throw ESIError.forbidden}
							
							
							var headers = HTTPHeaders()
							headers["Accept"] = "application/json"
							headers["Content-Type"] = "application/json"
							
							var query = [URLQueryItem]()
							query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
							
							
							let url = try route.asURL()
							var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
							components.queryItems = query
							
							return esi.session.publisher(components,
							method: .delete,
							encoding: URLEncoding.default,
							headers: headers,
							interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
							.responseVoid(queue: esi.session.serializationQueue)
							.eraseToAnyPublisher()
							
						}
						catch {
							return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
						}
					}
					
					
					
					
					
					
					
				}
				
				
				public struct Fitting: Codable, Hashable {
					
					
					public let localizedDescription: String
					public let items: [ESI.Characters.CharacterID.Fittings.Item]
					public let name: String
					public let shipTypeID: Int
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case localizedDescription = "description"
						case items
						case name
						case shipTypeID = "ship_type_id"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct Success: Codable, Hashable {
					
					
					public let localizedDescription: String
					public let fittingID: Int
					public let items: [ESI.Characters.CharacterID.Fittings.Item]
					public let name: String
					public let shipTypeID: Int
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case localizedDescription = "description"
						case fittingID = "fitting_id"
						case items
						case name
						case shipTypeID = "ship_type_id"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public enum Flag: String, Codable, CustomStringConvertible {
					case cargo = "Cargo"
					case droneBay = "DroneBay"
					case fighterBay = "FighterBay"
					case hiSlot0 = "HiSlot0"
					case hiSlot1 = "HiSlot1"
					case hiSlot2 = "HiSlot2"
					case hiSlot3 = "HiSlot3"
					case hiSlot4 = "HiSlot4"
					case hiSlot5 = "HiSlot5"
					case hiSlot6 = "HiSlot6"
					case hiSlot7 = "HiSlot7"
					case invalid = "Invalid"
					case loSlot0 = "LoSlot0"
					case loSlot1 = "LoSlot1"
					case loSlot2 = "LoSlot2"
					case loSlot3 = "LoSlot3"
					case loSlot4 = "LoSlot4"
					case loSlot5 = "LoSlot5"
					case loSlot6 = "LoSlot6"
					case loSlot7 = "LoSlot7"
					case medSlot0 = "MedSlot0"
					case medSlot1 = "MedSlot1"
					case medSlot2 = "MedSlot2"
					case medSlot3 = "MedSlot3"
					case medSlot4 = "MedSlot4"
					case medSlot5 = "MedSlot5"
					case medSlot6 = "MedSlot6"
					case medSlot7 = "MedSlot7"
					case rigSlot0 = "RigSlot0"
					case rigSlot1 = "RigSlot1"
					case rigSlot2 = "RigSlot2"
					case serviceSlot0 = "ServiceSlot0"
					case serviceSlot1 = "ServiceSlot1"
					case serviceSlot2 = "ServiceSlot2"
					case serviceSlot3 = "ServiceSlot3"
					case serviceSlot4 = "ServiceSlot4"
					case serviceSlot5 = "ServiceSlot5"
					case serviceSlot6 = "ServiceSlot6"
					case serviceSlot7 = "ServiceSlot7"
					case subSystemSlot0 = "SubSystemSlot0"
					case subSystemSlot1 = "SubSystemSlot1"
					case subSystemSlot2 = "SubSystemSlot2"
					case subSystemSlot3 = "SubSystemSlot3"
					
					public var description: String {
						return rawValue
					}
					
				}
				
				public struct Item: Codable, Hashable {
					
					
					public let flag: ESI.Characters.CharacterID.Fittings.Flag
					public let quantity: Int
					public let typeID: Int
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case flag
						case quantity
						case typeID = "type_id"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct Created: Codable, Hashable {
					
					
					public let fittingID: Int
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case fittingID = "fitting_id"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
			}
			
			public struct Fleet {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Success, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-fleets.read_fleet.v1") else {throw ESIError.forbidden}
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public enum Role: String, Codable, CustomStringConvertible {
					case fleetCommander = "fleet_commander"
					case squadCommander = "squad_commander"
					case squadMember = "squad_member"
					case wingCommander = "wing_commander"
					
					public var description: String {
						return rawValue
					}
					
				}
				
				public struct Success: Codable, Hashable {
					
					
					public let fleetID: Int64
					public let role: ESI.Characters.CharacterID.Fleet.Role
					public let squadID: Int64
					public let wingID: Int64
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case fleetID = "fleet_id"
						case role
						case squadID = "squad_id"
						case wingID = "wing_id"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
			}
			
			public struct Fw {
				let esi: ESI
				let route: APIRoute
				
				
				
				public func stats() -> Stats {
					Stats(esi: esi, route: .path("stats", next: route))
				}
				
				public struct Stats {
					let esi: ESI
					let route: APIRoute
					
					
					public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Success, AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-characters.read_fw_stats.v1") else {throw ESIError.forbidden}
							
							
							var headers = HTTPHeaders()
							headers["Accept"] = "application/json"
							
							
							var query = [URLQueryItem]()
							query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
							
							
							let url = try route.asURL()
							var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
							components.queryItems = query
							
							return esi.session.publisher(components,
							method: .get,
							encoding: URLEncoding.default,
							headers: headers,
							interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
							
						}
						catch {
							return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
						}
					}
					
					
					
					
					
					
					public struct Success: Codable, Hashable {
						
						
						public let currentRank: Int?
						public let enlistedOn: Date?
						public let factionID: Int?
						public let highestRank: Int?
						public let kills: ESI.Fw.Kills
						public let victoryPoints: ESI.Fw.VictoryPoints
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case currentRank = "current_rank"
							case enlistedOn = "enlisted_on"
							case factionID = "faction_id"
							case highestRank = "highest_rank"
							case kills
							case victoryPoints = "victory_points"
							
							var dateFormatter: DateFormatter? {
								switch self {
									case .enlistedOn:
									return DateFormatter.esiDateTimeFormatter
									default:
									return nil
								}
							}
						}
					}
					
				}
				
				
				
			}
			
			public struct Implants {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Int], AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-clones.read_implants.v1") else {throw ESIError.forbidden}
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				
			}
			
			public struct Industry {
				let esi: ESI
				let route: APIRoute
				
				
				
				public func jobs() -> Jobs {
					Jobs(esi: esi, route: .path("jobs", next: route))
				}
				
				public struct Jobs {
					let esi: ESI
					let route: APIRoute
					
					
					public func get(includeCompleted: Bool?, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-industry.read_character_jobs.v1") else {throw ESIError.forbidden}
							
							
							var headers = HTTPHeaders()
							headers["Accept"] = "application/json"
							
							
							var query = [URLQueryItem]()
							query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
							if let includeCompleted = includeCompleted {
								query.append(URLQueryItem(name: "include_completed", value: includeCompleted.description))
							}
							
							let url = try route.asURL()
							var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
							components.queryItems = query
							
							return esi.session.publisher(components,
							method: .get,
							encoding: URLEncoding.default,
							headers: headers,
							interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
							
						}
						catch {
							return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
						}
					}
					
					
					
					
					
					
					public enum Status: String, Codable, CustomStringConvertible {
						case active
						case cancelled
						case delivered
						case paused
						case ready
						case reverted
						
						public var description: String {
							return rawValue
						}
						
					}
					
					public struct Success: Codable, Hashable {
						
						
						public let activityID: Int
						public let blueprintID: Int64
						public let blueprintLocationID: Int64
						public let blueprintTypeID: Int
						public let completedCharacterID: Int?
						public let completedDate: Date?
						public let cost: Double?
						public let duration: Int
						public let endDate: Date
						public let facilityID: Int64
						public let installerID: Int
						public let jobID: Int
						public let licensedRuns: Int?
						public let outputLocationID: Int64
						public let pauseDate: Date?
						public let probability: Double?
						public let productTypeID: Int?
						public let runs: Int
						public let startDate: Date
						public let stationID: Int64
						public let status: ESI.Characters.CharacterID.Industry.Jobs.Status
						public let successfulRuns: Int?
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case activityID = "activity_id"
							case blueprintID = "blueprint_id"
							case blueprintLocationID = "blueprint_location_id"
							case blueprintTypeID = "blueprint_type_id"
							case completedCharacterID = "completed_character_id"
							case completedDate = "completed_date"
							case cost
							case duration
							case endDate = "end_date"
							case facilityID = "facility_id"
							case installerID = "installer_id"
							case jobID = "job_id"
							case licensedRuns = "licensed_runs"
							case outputLocationID = "output_location_id"
							case pauseDate = "pause_date"
							case probability
							case productTypeID = "product_type_id"
							case runs
							case startDate = "start_date"
							case stationID = "station_id"
							case status
							case successfulRuns = "successful_runs"
							
							var dateFormatter: DateFormatter? {
								switch self {
									case .completedDate:
									return DateFormatter.esiDateTimeFormatter
									case .endDate:
									return DateFormatter.esiDateTimeFormatter
									case .pauseDate:
									return DateFormatter.esiDateTimeFormatter
									case .startDate:
									return DateFormatter.esiDateTimeFormatter
									default:
									return nil
								}
							}
						}
					}
					
				}
				
				
				
			}
			
			public struct Killmails {
				let esi: ESI
				let route: APIRoute
				
				
				
				public func recent() -> Recent {
					Recent(esi: esi, route: .path("recent", next: route))
				}
				
				public struct Recent {
					let esi: ESI
					let route: APIRoute
					
					
					public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-killmails.read_killmails.v1") else {throw ESIError.forbidden}
							
							
							var headers = HTTPHeaders()
							headers["Accept"] = "application/json"
							
							
							var query = [URLQueryItem]()
							query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
							if let page = page {
								query.append(URLQueryItem(name: "page", value: page.description))
							}
							
							let url = try route.asURL()
							var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
							components.queryItems = query
							
							return esi.session.publisher(components,
							method: .get,
							encoding: URLEncoding.default,
							headers: headers,
							interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
							
						}
						catch {
							return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
						}
					}
					
					
					
					
					
					
					public struct Success: Codable, Hashable {
						
						
						public let killmailHash: String
						public let killmailID: Int
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case killmailHash = "killmail_hash"
							case killmailID = "killmail_id"
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
				}
				
				
				
			}
			
			public struct Location {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Success, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-location.read_location.v1") else {throw ESIError.forbidden}
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public let solarSystemID: Int
					public let stationID: Int?
					public let structureID: Int64?
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case solarSystemID = "solar_system_id"
						case stationID = "station_id"
						case structureID = "structure_id"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
			}
			
			public struct Loyalty {
				let esi: ESI
				let route: APIRoute
				
				
				
				public func points() -> Points {
					Points(esi: esi, route: .path("points", next: route))
				}
				
				public struct Points {
					let esi: ESI
					let route: APIRoute
					
					
					public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-characters.read_loyalty.v1") else {throw ESIError.forbidden}
							
							
							var headers = HTTPHeaders()
							headers["Accept"] = "application/json"
							
							
							var query = [URLQueryItem]()
							query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
							
							
							let url = try route.asURL()
							var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
							components.queryItems = query
							
							return esi.session.publisher(components,
							method: .get,
							encoding: URLEncoding.default,
							headers: headers,
							interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
							
						}
						catch {
							return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
						}
					}
					
					
					
					
					
					
					public struct Success: Codable, Hashable {
						
						
						public let corporationID: Int
						public let loyaltyPoints: Int
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case corporationID = "corporation_id"
							case loyaltyPoints = "loyalty_points"
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
				}
				
				
				
			}
			
			public struct Mail {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(labels: [Int]?, lastMailID: Int?, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-mail.read_mail.v1") else {throw ESIError.forbidden}
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						if let labels = labels {
							if !labels.isEmpty {
								query.append(URLQueryItem(name: "labels", value: labels.lazy.map{$0.description}.joined(separator: ",")))
							}
						}
						if let lastMailID = lastMailID {
							query.append(URLQueryItem(name: "last_mail_id", value: lastMailID.description))
						}
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				public func post(mail: ESI.Characters.CharacterID.Mail.Mail, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Int, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-mail.send_mail.v1") else {throw ESIError.forbidden}
						let body = try JSONEncoder().encode(mail)
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						headers["Content-Type"] = "application/json"
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .post,
						encoding: BodyDataEncoding(data: body),
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				public func labels() -> Labels {
					Labels(esi: esi, route: .path("labels", next: route))
				}
				public func lists() -> Lists {
					Lists(esi: esi, route: .path("lists", next: route))
				}
				public func mailID(_ value: Int) -> MailID {
					MailID(esi: esi, route: .parameter(value, next: route))
				}
				
				public struct Labels {
					let esi: ESI
					let route: APIRoute
					
					
					public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Success, AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-mail.read_mail.v1") else {throw ESIError.forbidden}
							
							
							var headers = HTTPHeaders()
							headers["Accept"] = "application/json"
							
							
							var query = [URLQueryItem]()
							query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
							
							
							let url = try route.asURL()
							var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
							components.queryItems = query
							
							return esi.session.publisher(components,
							method: .get,
							encoding: URLEncoding.default,
							headers: headers,
							interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
							
						}
						catch {
							return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
						}
					}
					
					
					public func post(label: ESI.Characters.CharacterID.Mail.Labels.PostLabel, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Int, AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-mail.organize_mail.v1") else {throw ESIError.forbidden}
							let body = try JSONEncoder().encode(label)
							
							var headers = HTTPHeaders()
							headers["Accept"] = "application/json"
							headers["Content-Type"] = "application/json"
							
							var query = [URLQueryItem]()
							query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
							
							
							let url = try route.asURL()
							var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
							components.queryItems = query
							
							return esi.session.publisher(components,
							method: .post,
							encoding: BodyDataEncoding(data: body),
							headers: headers,
							interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
							
						}
						catch {
							return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
						}
					}
					
					
					public func labelID(_ value: Int) -> LabelID {
						LabelID(esi: esi, route: .parameter(value, next: route))
					}
					
					public struct LabelID {
						let esi: ESI
						let route: APIRoute
						
						
						public func delete(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Void, AFError> {
							do {
								
								let scopes = esi.token?.scopes ?? []
								guard scopes.contains("esi-mail.organize_mail.v1") else {throw ESIError.forbidden}
								
								
								var headers = HTTPHeaders()
								headers["Accept"] = "application/json"
								headers["Content-Type"] = "application/json"
								
								var query = [URLQueryItem]()
								query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
								
								
								let url = try route.asURL()
								var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
								components.queryItems = query
								
								return esi.session.publisher(components,
								method: .delete,
								encoding: URLEncoding.default,
								headers: headers,
								interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
								.responseVoid(queue: esi.session.serializationQueue)
								.eraseToAnyPublisher()
								
							}
							catch {
								return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
							}
						}
						
						
						
						
						
						
						
					}
					
					
					public enum Color: String, Codable, CustomStringConvertible {
						case h0000fe = "#0000fe"
						case h006634 = "#006634"
						case h0099ff = "#0099ff"
						case h00ff33 = "#00ff33"
						case h01ffff = "#01ffff"
						case h349800 = "#349800"
						case h660066 = "#660066"
						case h666666 = "#666666"
						case h999999 = "#999999"
						case h99ffff = "#99ffff"
						case h9a0000 = "#9a0000"
						case hccff9a = "#ccff9a"
						case he6e6e6 = "#e6e6e6"
						case hfe0000 = "#fe0000"
						case hff6600 = "#ff6600"
						case hffff01 = "#ffff01"
						case hffffcd = "#ffffcd"
						case hffffff = "#ffffff"
						
						public var description: String {
							return rawValue
						}
						
					}
					
					public struct Success: Codable, Hashable {
						
						
						public let labels: [ESI.Characters.CharacterID.Mail.Labels.Label]?
						public let totalUnreadCount: Int?
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case labels
							case totalUnreadCount = "total_unread_count"
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
					public struct PostLabel: Codable, Hashable {
						
						
						public let color: ESI.Characters.CharacterID.Mail.Labels.Color?
						public let name: String
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case color
							case name
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
					public struct Label: Codable, Hashable {
						
						
						public let color: ESI.Characters.CharacterID.Mail.Labels.Color?
						public let labelID: Int?
						public let name: String?
						public let unreadCount: Int?
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case color
							case labelID = "label_id"
							case name
							case unreadCount = "unread_count"
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
				}
				
				public struct Lists {
					let esi: ESI
					let route: APIRoute
					
					
					public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-mail.read_mail.v1") else {throw ESIError.forbidden}
							
							
							var headers = HTTPHeaders()
							headers["Accept"] = "application/json"
							
							
							var query = [URLQueryItem]()
							query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
							
							
							let url = try route.asURL()
							var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
							components.queryItems = query
							
							return esi.session.publisher(components,
							method: .get,
							encoding: URLEncoding.default,
							headers: headers,
							interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
							
						}
						catch {
							return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
						}
					}
					
					
					
					
					
					
					public struct Success: Codable, Hashable {
						
						
						public let mailingListID: Int
						public let name: String
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case mailingListID = "mailing_list_id"
							case name
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
				}
				
				public struct MailID {
					let esi: ESI
					let route: APIRoute
					
					
					public func delete(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Void, AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-mail.organize_mail.v1") else {throw ESIError.forbidden}
							
							
							var headers = HTTPHeaders()
							headers["Accept"] = "application/json"
							headers["Content-Type"] = "application/json"
							
							var query = [URLQueryItem]()
							query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
							
							
							let url = try route.asURL()
							var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
							components.queryItems = query
							
							return esi.session.publisher(components,
							method: .delete,
							encoding: URLEncoding.default,
							headers: headers,
							interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
							.responseVoid(queue: esi.session.serializationQueue)
							.eraseToAnyPublisher()
							
						}
						catch {
							return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
						}
					}
					
					
					public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Success, AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-mail.read_mail.v1") else {throw ESIError.forbidden}
							
							
							var headers = HTTPHeaders()
							headers["Accept"] = "application/json"
							
							
							var query = [URLQueryItem]()
							query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
							
							
							let url = try route.asURL()
							var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
							components.queryItems = query
							
							return esi.session.publisher(components,
							method: .get,
							encoding: URLEncoding.default,
							headers: headers,
							interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
							
						}
						catch {
							return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
						}
					}
					
					
					public func put(contents: ESI.Characters.CharacterID.Mail.MailID.Contents, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Void, AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-mail.organize_mail.v1") else {throw ESIError.forbidden}
							let body = try JSONEncoder().encode(contents)
							
							var headers = HTTPHeaders()
							headers["Accept"] = "application/json"
							headers["Content-Type"] = "application/json"
							
							var query = [URLQueryItem]()
							query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
							
							
							let url = try route.asURL()
							var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
							components.queryItems = query
							
							return esi.session.publisher(components,
							method: .put,
							encoding: BodyDataEncoding(data: body),
							headers: headers,
							interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
							.responseVoid(queue: esi.session.serializationQueue)
							.eraseToAnyPublisher()
							
						}
						catch {
							return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
						}
					}
					
					
					
					
					
					
					public struct Contents: Codable, Hashable {
						
						
						public let labels: [Int]?
						public let read: Bool?
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case labels
							case read
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
					public struct Success: Codable, Hashable {
						
						
						public let body: String?
						public let from: Int?
						public let labels: [Int]?
						public let read: Bool?
						public let recipients: [ESI.Characters.CharacterID.Mail.Recipient]?
						public let subject: String?
						public let timestamp: Date?
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case body
							case from
							case labels
							case read
							case recipients
							case subject
							case timestamp
							
							var dateFormatter: DateFormatter? {
								switch self {
									case .timestamp:
									return DateFormatter.esiDateTimeFormatter
									default:
									return nil
								}
							}
						}
					}
					
				}
				
				
				public struct Recipient: Codable, Hashable {
					
					
					public let recipientID: Int
					public let recipientType: ESI.Characters.CharacterID.Mail.RecipientType
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case recipientID = "recipient_id"
						case recipientType = "recipient_type"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct Success: Codable, Hashable {
					
					
					public let from: Int?
					public let isRead: Bool?
					public let labels: [Int]?
					public let mailID: Int?
					public let recipients: [ESI.Characters.CharacterID.Mail.Recipient]?
					public let subject: String?
					public let timestamp: Date?
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case from
						case isRead = "is_read"
						case labels
						case mailID = "mail_id"
						case recipients
						case subject
						case timestamp
						
						var dateFormatter: DateFormatter? {
							switch self {
								case .timestamp:
								return DateFormatter.esiDateTimeFormatter
								default:
								return nil
							}
						}
					}
				}
				
				public enum RecipientType: String, Codable, CustomStringConvertible {
					case alliance
					case character
					case corporation
					case mailingList = "mailing_list"
					
					public var description: String {
						return rawValue
					}
					
				}
				
				public struct Mail: Codable, Hashable {
					
					
					public let approvedCost: Int64?
					public let body: String
					public let recipients: [ESI.Characters.CharacterID.Mail.Recipient]
					public let subject: String
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case approvedCost = "approved_cost"
						case body
						case recipients
						case subject
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
			}
			
			public struct Medals {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-characters.read_medals.v1") else {throw ESIError.forbidden}
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Graphic: Codable, Hashable {
					
					
					public let color: Int?
					public let graphic: String
					public let layer: Int
					public let part: Int
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case color
						case graphic
						case layer
						case part
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct Success: Codable, Hashable {
					
					
					public let corporationID: Int
					public let date: Date
					public let localizedDescription: String
					public let graphics: [ESI.Characters.CharacterID.Medals.Graphic]
					public let issuerID: Int
					public let medalID: Int
					public let reason: String
					public let status: ESI.Characters.CharacterID.Medals.Status
					public let title: String
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case corporationID = "corporation_id"
						case date
						case localizedDescription = "description"
						case graphics
						case issuerID = "issuer_id"
						case medalID = "medal_id"
						case reason
						case status
						case title
						
						var dateFormatter: DateFormatter? {
							switch self {
								case .date:
								return DateFormatter.esiDateTimeFormatter
								default:
								return nil
							}
						}
					}
				}
				
				public enum Status: String, Codable, CustomStringConvertible {
					case `public` = "public"
					case `private` = "private"
					
					public var description: String {
						return rawValue
					}
					
				}
				
			}
			
			public struct Mining {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-industry.read_character_mining.v1") else {throw ESIError.forbidden}
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						if let page = page {
							query.append(URLQueryItem(name: "page", value: page.description))
						}
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public let date: Date
					public let quantity: Int64
					public let solarSystemID: Int
					public let typeID: Int
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case date
						case quantity
						case solarSystemID = "solar_system_id"
						case typeID = "type_id"
						
						var dateFormatter: DateFormatter? {
							switch self {
								case .date:
								return DateFormatter.esiDateFormatter
								default:
								return nil
							}
						}
					}
				}
				
			}
			
			public struct Notifications {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-characters.read_notifications.v1") else {throw ESIError.forbidden}
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				public func contacts() -> Contacts {
					Contacts(esi: esi, route: .path("contacts", next: route))
				}
				
				public struct Contacts {
					let esi: ESI
					let route: APIRoute
					
					
					public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-characters.read_notifications.v1") else {throw ESIError.forbidden}
							
							
							var headers = HTTPHeaders()
							headers["Accept"] = "application/json"
							
							
							var query = [URLQueryItem]()
							query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
							
							
							let url = try route.asURL()
							var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
							components.queryItems = query
							
							return esi.session.publisher(components,
							method: .get,
							encoding: URLEncoding.default,
							headers: headers,
							interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
							
						}
						catch {
							return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
						}
					}
					
					
					
					
					
					
					public struct Success: Codable, Hashable {
						
						
						public let message: String
						public let notificationID: Int
						public let sendDate: Date
						public let senderCharacterID: Int
						public let standingLevel: Double
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case message
							case notificationID = "notification_id"
							case sendDate = "send_date"
							case senderCharacterID = "sender_character_id"
							case standingLevel = "standing_level"
							
							var dateFormatter: DateFormatter? {
								switch self {
									case .sendDate:
									return DateFormatter.esiDateTimeFormatter
									default:
									return nil
								}
							}
						}
					}
					
				}
				
				
				public struct Success: Codable, Hashable {
					
					
					public let isRead: Bool?
					public let notificationID: Int64
					public let senderID: Int
					public let senderType: ESI.Characters.CharacterID.Notifications.SenderType
					public let text: String?
					public let timestamp: Date
					public let type: ESI.Characters.CharacterID.Notifications.ValueType
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case isRead = "is_read"
						case notificationID = "notification_id"
						case senderID = "sender_id"
						case senderType = "sender_type"
						case text
						case timestamp
						case type
						
						var dateFormatter: DateFormatter? {
							switch self {
								case .timestamp:
								return DateFormatter.esiDateTimeFormatter
								default:
								return nil
							}
						}
					}
				}
				
				public enum ValueType: String, Codable, CustomStringConvertible {
					case acceptedAlly = "AcceptedAlly"
					case acceptedSurrender = "AcceptedSurrender"
					case allAnchoringMsg = "AllAnchoringMsg"
					case allMaintenanceBillMsg = "AllMaintenanceBillMsg"
					case allStrucInvulnerableMsg = "AllStrucInvulnerableMsg"
					case allStructVulnerableMsg = "AllStructVulnerableMsg"
					case allWarCorpJoinedAllianceMsg = "AllWarCorpJoinedAllianceMsg"
					case allWarDeclaredMsg = "AllWarDeclaredMsg"
					case allWarInvalidatedMsg = "AllWarInvalidatedMsg"
					case allWarRetractedMsg = "AllWarRetractedMsg"
					case allWarSurrenderMsg = "AllWarSurrenderMsg"
					case allianceCapitalChanged = "AllianceCapitalChanged"
					case allianceWarDeclaredV2 = "AllianceWarDeclaredV2"
					case allyContractCancelled = "AllyContractCancelled"
					case allyJoinedWarAggressorMsg = "AllyJoinedWarAggressorMsg"
					case allyJoinedWarAllyMsg = "AllyJoinedWarAllyMsg"
					case allyJoinedWarDefenderMsg = "AllyJoinedWarDefenderMsg"
					case battlePunishFriendlyFire = "BattlePunishFriendlyFire"
					case billOutOfMoneyMsg = "BillOutOfMoneyMsg"
					case billPaidCorpAllMsg = "BillPaidCorpAllMsg"
					case bountyClaimMsg = "BountyClaimMsg"
					case bountyESSShared = "BountyESSShared"
					case bountyESSTaken = "BountyESSTaken"
					case bountyPlacedAlliance = "BountyPlacedAlliance"
					case bountyPlacedChar = "BountyPlacedChar"
					case bountyPlacedCorp = "BountyPlacedCorp"
					case bountyYourBountyClaimed = "BountyYourBountyClaimed"
					case buddyConnectContactAdd = "BuddyConnectContactAdd"
					case charAppAcceptMsg = "CharAppAcceptMsg"
					case charAppRejectMsg = "CharAppRejectMsg"
					case charAppWithdrawMsg = "CharAppWithdrawMsg"
					case charLeftCorpMsg = "CharLeftCorpMsg"
					case charMedalMsg = "CharMedalMsg"
					case charTerminationMsg = "CharTerminationMsg"
					case cloneActivationMsg = "CloneActivationMsg"
					case cloneActivationMsg2 = "CloneActivationMsg2"
					case cloneMovedMsg = "CloneMovedMsg"
					case cloneRevokedMsg1 = "CloneRevokedMsg1"
					case cloneRevokedMsg2 = "CloneRevokedMsg2"
					case combatOperationFinished = "CombatOperationFinished"
					case contactAdd = "ContactAdd"
					case contactEdit = "ContactEdit"
					case containerPasswordMsg = "ContainerPasswordMsg"
					case corpAllBillMsg = "CorpAllBillMsg"
					case corpAppAcceptMsg = "CorpAppAcceptMsg"
					case corpAppInvitedMsg = "CorpAppInvitedMsg"
					case corpAppNewMsg = "CorpAppNewMsg"
					case corpAppRejectCustomMsg = "CorpAppRejectCustomMsg"
					case corpAppRejectMsg = "CorpAppRejectMsg"
					case corpBecameWarEligible = "CorpBecameWarEligible"
					case corpDividendMsg = "CorpDividendMsg"
					case corpFriendlyFireDisableTimerCompleted = "CorpFriendlyFireDisableTimerCompleted"
					case corpFriendlyFireDisableTimerStarted = "CorpFriendlyFireDisableTimerStarted"
					case corpFriendlyFireEnableTimerCompleted = "CorpFriendlyFireEnableTimerCompleted"
					case corpFriendlyFireEnableTimerStarted = "CorpFriendlyFireEnableTimerStarted"
					case corpKicked = "CorpKicked"
					case corpLiquidationMsg = "CorpLiquidationMsg"
					case corpNewCEOMsg = "CorpNewCEOMsg"
					case corpNewsMsg = "CorpNewsMsg"
					case corpNoLongerWarEligible = "CorpNoLongerWarEligible"
					case corpOfficeExpirationMsg = "CorpOfficeExpirationMsg"
					case corpStructLostMsg = "CorpStructLostMsg"
					case corpTaxChangeMsg = "CorpTaxChangeMsg"
					case corpVoteCEORevokedMsg = "CorpVoteCEORevokedMsg"
					case corpVoteMsg = "CorpVoteMsg"
					case corpWarDeclaredMsg = "CorpWarDeclaredMsg"
					case corpWarDeclaredV2 = "CorpWarDeclaredV2"
					case corpWarFightingLegalMsg = "CorpWarFightingLegalMsg"
					case corpWarInvalidatedMsg = "CorpWarInvalidatedMsg"
					case corpWarRetractedMsg = "CorpWarRetractedMsg"
					case corpWarSurrenderMsg = "CorpWarSurrenderMsg"
					case customsMsg = "CustomsMsg"
					case declareWar = "DeclareWar"
					case districtAttacked = "DistrictAttacked"
					case dustAppAcceptedMsg = "DustAppAcceptedMsg"
					case entosisCaptureStarted = "EntosisCaptureStarted"
					case fWAllianceKickMsg = "FWAllianceKickMsg"
					case fWAllianceWarningMsg = "FWAllianceWarningMsg"
					case fWCharKickMsg = "FWCharKickMsg"
					case fWCharRankGainMsg = "FWCharRankGainMsg"
					case fWCharRankLossMsg = "FWCharRankLossMsg"
					case fWCharWarningMsg = "FWCharWarningMsg"
					case fWCorpJoinMsg = "FWCorpJoinMsg"
					case fWCorpKickMsg = "FWCorpKickMsg"
					case fWCorpLeaveMsg = "FWCorpLeaveMsg"
					case fWCorpWarningMsg = "FWCorpWarningMsg"
					case facWarCorpJoinRequestMsg = "FacWarCorpJoinRequestMsg"
					case facWarCorpJoinWithdrawMsg = "FacWarCorpJoinWithdrawMsg"
					case facWarCorpLeaveRequestMsg = "FacWarCorpLeaveRequestMsg"
					case facWarCorpLeaveWithdrawMsg = "FacWarCorpLeaveWithdrawMsg"
					case facWarLPDisqualifiedEvent = "FacWarLPDisqualifiedEvent"
					case facWarLPDisqualifiedKill = "FacWarLPDisqualifiedKill"
					case facWarLPPayoutEvent = "FacWarLPPayoutEvent"
					case facWarLPPayoutKill = "FacWarLPPayoutKill"
					case gameTimeAdded = "GameTimeAdded"
					case gameTimeReceived = "GameTimeReceived"
					case gameTimeSent = "GameTimeSent"
					case giftReceived = "GiftReceived"
					case iHubDestroyedByBillFailure = "IHubDestroyedByBillFailure"
					case incursionCompletedMsg = "IncursionCompletedMsg"
					case industryOperationFinished = "IndustryOperationFinished"
					case industryTeamAuctionLost = "IndustryTeamAuctionLost"
					case industryTeamAuctionWon = "IndustryTeamAuctionWon"
					case infrastructureHubBillAboutToExpire = "InfrastructureHubBillAboutToExpire"
					case insuranceExpirationMsg = "InsuranceExpirationMsg"
					case insuranceFirstShipMsg = "InsuranceFirstShipMsg"
					case insuranceInvalidatedMsg = "InsuranceInvalidatedMsg"
					case insuranceIssuedMsg = "InsuranceIssuedMsg"
					case insurancePayoutMsg = "InsurancePayoutMsg"
					case invasionSystemLogin = "InvasionSystemLogin"
					case jumpCloneDeletedMsg1 = "JumpCloneDeletedMsg1"
					case jumpCloneDeletedMsg2 = "JumpCloneDeletedMsg2"
					case killReportFinalBlow = "KillReportFinalBlow"
					case killReportVictim = "KillReportVictim"
					case killRightAvailable = "KillRightAvailable"
					case killRightAvailableOpen = "KillRightAvailableOpen"
					case killRightEarned = "KillRightEarned"
					case killRightUnavailable = "KillRightUnavailable"
					case killRightUnavailableOpen = "KillRightUnavailableOpen"
					case killRightUsed = "KillRightUsed"
					case locateCharMsg = "LocateCharMsg"
					case madeWarMutual = "MadeWarMutual"
					case mercOfferRetractedMsg = "MercOfferRetractedMsg"
					case mercOfferedNegotiationMsg = "MercOfferedNegotiationMsg"
					case missionOfferExpirationMsg = "MissionOfferExpirationMsg"
					case missionTimeoutMsg = "MissionTimeoutMsg"
					case moonminingAutomaticFracture = "MoonminingAutomaticFracture"
					case moonminingExtractionCancelled = "MoonminingExtractionCancelled"
					case moonminingExtractionFinished = "MoonminingExtractionFinished"
					case moonminingExtractionStarted = "MoonminingExtractionStarted"
					case moonminingLaserFired = "MoonminingLaserFired"
					case mutualWarExpired = "MutualWarExpired"
					case mutualWarInviteAccepted = "MutualWarInviteAccepted"
					case mutualWarInviteRejected = "MutualWarInviteRejected"
					case mutualWarInviteSent = "MutualWarInviteSent"
					case nPCStandingsGained = "NPCStandingsGained"
					case nPCStandingsLost = "NPCStandingsLost"
					case offerToAllyRetracted = "OfferToAllyRetracted"
					case offeredSurrender = "OfferedSurrender"
					case offeredToAlly = "OfferedToAlly"
					case oldLscMessages = "OldLscMessages"
					case operationFinished = "OperationFinished"
					case orbitalAttacked = "OrbitalAttacked"
					case orbitalReinforced = "OrbitalReinforced"
					case ownershipTransferred = "OwnershipTransferred"
					case reimbursementMsg = "ReimbursementMsg"
					case researchMissionAvailableMsg = "ResearchMissionAvailableMsg"
					case retractsWar = "RetractsWar"
					case seasonalChallengeCompleted = "SeasonalChallengeCompleted"
					case sovAllClaimAquiredMsg = "SovAllClaimAquiredMsg"
					case sovAllClaimLostMsg = "SovAllClaimLostMsg"
					case sovCommandNodeEventStarted = "SovCommandNodeEventStarted"
					case sovCorpBillLateMsg = "SovCorpBillLateMsg"
					case sovCorpClaimFailMsg = "SovCorpClaimFailMsg"
					case sovDisruptorMsg = "SovDisruptorMsg"
					case sovStationEnteredFreeport = "SovStationEnteredFreeport"
					case sovStructureDestroyed = "SovStructureDestroyed"
					case sovStructureReinforced = "SovStructureReinforced"
					case sovStructureSelfDestructCancel = "SovStructureSelfDestructCancel"
					case sovStructureSelfDestructFinished = "SovStructureSelfDestructFinished"
					case sovStructureSelfDestructRequested = "SovStructureSelfDestructRequested"
					case sovereigntyIHDamageMsg = "SovereigntyIHDamageMsg"
					case sovereigntySBUDamageMsg = "SovereigntySBUDamageMsg"
					case sovereigntyTCUDamageMsg = "SovereigntyTCUDamageMsg"
					case stationAggressionMsg1 = "StationAggressionMsg1"
					case stationAggressionMsg2 = "StationAggressionMsg2"
					case stationConquerMsg = "StationConquerMsg"
					case stationServiceDisabled = "StationServiceDisabled"
					case stationServiceEnabled = "StationServiceEnabled"
					case stationStateChangeMsg = "StationStateChangeMsg"
					case storyLineMissionAvailableMsg = "StoryLineMissionAvailableMsg"
					case structureAnchoring = "StructureAnchoring"
					case structureCourierContractChanged = "StructureCourierContractChanged"
					case structureDestroyed = "StructureDestroyed"
					case structureFuelAlert = "StructureFuelAlert"
					case structureItemsDelivered = "StructureItemsDelivered"
					case structureItemsMovedToSafety = "StructureItemsMovedToSafety"
					case structureLostArmor = "StructureLostArmor"
					case structureLostShields = "StructureLostShields"
					case structureOnline = "StructureOnline"
					case structureServicesOffline = "StructureServicesOffline"
					case structureUnanchoring = "StructureUnanchoring"
					case structureUnderAttack = "StructureUnderAttack"
					case structureWentHighPower = "StructureWentHighPower"
					case structureWentLowPower = "StructureWentLowPower"
					case structuresJobsCancelled = "StructuresJobsCancelled"
					case structuresJobsPaused = "StructuresJobsPaused"
					case structuresReinforcementChanged = "StructuresReinforcementChanged"
					case towerAlertMsg = "TowerAlertMsg"
					case towerResourceAlertMsg = "TowerResourceAlertMsg"
					case transactionReversalMsg = "TransactionReversalMsg"
					case tutorialMsg = "TutorialMsg"
					case warAdopted = "WarAdopted "
					case warAllyInherited = "WarAllyInherited"
					case warAllyOfferDeclinedMsg = "WarAllyOfferDeclinedMsg"
					case warConcordInvalidates = "WarConcordInvalidates"
					case warDeclared = "WarDeclared"
					case warHQRemovedFromSpace = "WarHQRemovedFromSpace"
					case warInherited = "WarInherited"
					case warInvalid = "WarInvalid"
					case warRetracted = "WarRetracted"
					case warRetractedByConcord = "WarRetractedByConcord"
					case warSurrenderDeclinedMsg = "WarSurrenderDeclinedMsg"
					case warSurrenderOfferMsg = "WarSurrenderOfferMsg"
					
					public var description: String {
						return rawValue
					}
					
				}
				
				public enum SenderType: String, Codable, CustomStringConvertible {
					case character
					case corporation
					case alliance
					case faction
					case other
					
					public var description: String {
						return rawValue
					}
					
				}
				
			}
			
			public struct Online {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Success, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-location.read_online.v1") else {throw ESIError.forbidden}
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public let lastLogin: Date?
					public let lastLogout: Date?
					public let logins: Int?
					public let online: Bool
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case lastLogin = "last_login"
						case lastLogout = "last_logout"
						case logins
						case online
						
						var dateFormatter: DateFormatter? {
							switch self {
								case .lastLogin:
								return DateFormatter.esiDateTimeFormatter
								case .lastLogout:
								return DateFormatter.esiDateTimeFormatter
								default:
								return nil
							}
						}
					}
				}
				
			}
			
			public struct Opportunities {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-characters.read_opportunities.v1") else {throw ESIError.forbidden}
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public let completedAt: Date
					public let taskID: Int
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case completedAt = "completed_at"
						case taskID = "task_id"
						
						var dateFormatter: DateFormatter? {
							switch self {
								case .completedAt:
								return DateFormatter.esiDateTimeFormatter
								default:
								return nil
							}
						}
					}
				}
				
			}
			
			public struct Orders {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-markets.read_character_orders.v1") else {throw ESIError.forbidden}
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				public func history() -> History {
					History(esi: esi, route: .path("history", next: route))
				}
				
				public struct History {
					let esi: ESI
					let route: APIRoute
					
					
					public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-markets.read_character_orders.v1") else {throw ESIError.forbidden}
							
							
							var headers = HTTPHeaders()
							headers["Accept"] = "application/json"
							
							
							var query = [URLQueryItem]()
							query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
							if let page = page {
								query.append(URLQueryItem(name: "page", value: page.description))
							}
							
							let url = try route.asURL()
							var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
							components.queryItems = query
							
							return esi.session.publisher(components,
							method: .get,
							encoding: URLEncoding.default,
							headers: headers,
							interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
							
						}
						catch {
							return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
						}
					}
					
					
					
					
					
					
					public struct Success: Codable, Hashable {
						
						
						public let duration: Int
						public let escrow: Double?
						public let isBuyOrder: Bool?
						public let isCorporation: Bool
						public let issued: Date
						public let locationID: Int64
						public let minVolume: Int?
						public let orderID: Int64
						public let price: Double
						public let range: ESI.Characters.Range
						public let regionID: Int
						public let state: ESI.Characters.State
						public let typeID: Int
						public let volumeRemain: Int
						public let volumeTotal: Int
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case duration
							case escrow
							case isBuyOrder = "is_buy_order"
							case isCorporation = "is_corporation"
							case issued
							case locationID = "location_id"
							case minVolume = "min_volume"
							case orderID = "order_id"
							case price
							case range
							case regionID = "region_id"
							case state
							case typeID = "type_id"
							case volumeRemain = "volume_remain"
							case volumeTotal = "volume_total"
							
							var dateFormatter: DateFormatter? {
								switch self {
									case .issued:
									return DateFormatter.esiDateTimeFormatter
									default:
									return nil
								}
							}
						}
					}
					
				}
				
				
				public struct Success: Codable, Hashable {
					
					
					public let duration: Int
					public let escrow: Double?
					public let isBuyOrder: Bool?
					public let isCorporation: Bool
					public let issued: Date
					public let locationID: Int64
					public let minVolume: Int?
					public let orderID: Int64
					public let price: Double
					public let range: ESI.Characters.Range
					public let regionID: Int
					public let typeID: Int
					public let volumeRemain: Int
					public let volumeTotal: Int
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case duration
						case escrow
						case isBuyOrder = "is_buy_order"
						case isCorporation = "is_corporation"
						case issued
						case locationID = "location_id"
						case minVolume = "min_volume"
						case orderID = "order_id"
						case price
						case range
						case regionID = "region_id"
						case typeID = "type_id"
						case volumeRemain = "volume_remain"
						case volumeTotal = "volume_total"
						
						var dateFormatter: DateFormatter? {
							switch self {
								case .issued:
								return DateFormatter.esiDateTimeFormatter
								default:
								return nil
							}
						}
					}
				}
				
			}
			
			public struct Planets {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-planets.manage_planets.v1") else {throw ESIError.forbidden}
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				public func planetID(_ value: Int) -> PlanetID {
					PlanetID(esi: esi, route: .parameter(value, next: route))
				}
				
				public struct PlanetID {
					let esi: ESI
					let route: APIRoute
					
					
					public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Success, AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-planets.manage_planets.v1") else {throw ESIError.forbidden}
							
							
							var headers = HTTPHeaders()
							headers["Accept"] = "application/json"
							
							
							var query = [URLQueryItem]()
							query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
							
							
							let url = try route.asURL()
							var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
							components.queryItems = query
							
							return esi.session.publisher(components,
							method: .get,
							encoding: URLEncoding.default,
							headers: headers,
							interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
							
						}
						catch {
							return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
						}
					}
					
					
					
					
					
					
					public struct Link: Codable, Hashable {
						
						
						public let destinationPinID: Int64
						public let linkLevel: Int
						public let sourcePinID: Int64
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case destinationPinID = "destination_pin_id"
							case linkLevel = "link_level"
							case sourcePinID = "source_pin_id"
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
					public struct Pin: Codable, Hashable {
						
						public struct Content: Codable, Hashable {
							
							
							public let amount: Int64
							public let typeID: Int
							
							enum CodingKeys: String, CodingKey, DateFormatted {
								case amount
								case typeID = "type_id"
								
								var dateFormatter: DateFormatter? {
									return nil
								}
							}
						}
						
						public struct FactoryDetails: Codable, Hashable {
							
							
							public let schematicID: Int
							
							enum CodingKeys: String, CodingKey, DateFormatted {
								case schematicID = "schematic_id"
								
								var dateFormatter: DateFormatter? {
									return nil
								}
							}
						}
						
						public struct ExtractorDetails: Codable, Hashable {
							
							public struct Head: Codable, Hashable {
								
								
								public let headID: Int
								public let latitude: Double
								public let longitude: Double
								
								enum CodingKeys: String, CodingKey, DateFormatted {
									case headID = "head_id"
									case latitude
									case longitude
									
									var dateFormatter: DateFormatter? {
										return nil
									}
								}
							}
							
							public let cycleTime: Int?
							public let headRadius: Double?
							public let heads: [ESI.Characters.CharacterID.Planets.PlanetID.Pin.ExtractorDetails.Head]
							public let productTypeID: Int?
							public let qtyPerCycle: Int?
							
							enum CodingKeys: String, CodingKey, DateFormatted {
								case cycleTime = "cycle_time"
								case headRadius = "head_radius"
								case heads
								case productTypeID = "product_type_id"
								case qtyPerCycle = "qty_per_cycle"
								
								var dateFormatter: DateFormatter? {
									return nil
								}
							}
						}
						
						public let contents: [ESI.Characters.CharacterID.Planets.PlanetID.Pin.Content]?
						public let expiryTime: Date?
						public let extractorDetails: ESI.Characters.CharacterID.Planets.PlanetID.Pin.ExtractorDetails?
						public let factoryDetails: ESI.Characters.CharacterID.Planets.PlanetID.Pin.FactoryDetails?
						public let installTime: Date?
						public let lastCycleStart: Date?
						public let latitude: Double
						public let longitude: Double
						public let pinID: Int64
						public let schematicID: Int?
						public let typeID: Int
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case contents
							case expiryTime = "expiry_time"
							case extractorDetails = "extractor_details"
							case factoryDetails = "factory_details"
							case installTime = "install_time"
							case lastCycleStart = "last_cycle_start"
							case latitude
							case longitude
							case pinID = "pin_id"
							case schematicID = "schematic_id"
							case typeID = "type_id"
							
							var dateFormatter: DateFormatter? {
								switch self {
									case .expiryTime:
									return DateFormatter.esiDateTimeFormatter
									case .installTime:
									return DateFormatter.esiDateTimeFormatter
									case .lastCycleStart:
									return DateFormatter.esiDateTimeFormatter
									default:
									return nil
								}
							}
						}
					}
					
					public struct Success: Codable, Hashable {
						
						
						public let links: [ESI.Characters.CharacterID.Planets.PlanetID.Link]
						public let pins: [ESI.Characters.CharacterID.Planets.PlanetID.Pin]
						public let routes: [ESI.Characters.CharacterID.Planets.PlanetID.Route]
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case links
							case pins
							case routes
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
					public struct Route: Codable, Hashable {
						
						
						public let contentTypeID: Int
						public let destinationPinID: Int64
						public let quantity: Double
						public let routeID: Int64
						public let sourcePinID: Int64
						public let waypoints: [Int64]?
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case contentTypeID = "content_type_id"
							case destinationPinID = "destination_pin_id"
							case quantity
							case routeID = "route_id"
							case sourcePinID = "source_pin_id"
							case waypoints
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
				}
				
				
				public struct Success: Codable, Hashable {
					
					
					public let lastUpdate: Date
					public let numPins: Int
					public let ownerID: Int
					public let planetID: Int
					public let planetType: ESI.Characters.CharacterID.Planets.PlanetType
					public let solarSystemID: Int
					public let upgradeLevel: Int
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case lastUpdate = "last_update"
						case numPins = "num_pins"
						case ownerID = "owner_id"
						case planetID = "planet_id"
						case planetType = "planet_type"
						case solarSystemID = "solar_system_id"
						case upgradeLevel = "upgrade_level"
						
						var dateFormatter: DateFormatter? {
							switch self {
								case .lastUpdate:
								return DateFormatter.esiDateTimeFormatter
								default:
								return nil
							}
						}
					}
				}
				
				public enum PlanetType: String, Codable, CustomStringConvertible {
					case temperate
					case barren
					case oceanic
					case ice
					case gas
					case lava
					case storm
					case plasma
					
					public var description: String {
						return rawValue
					}
					
				}
				
			}
			
			public struct Portrait {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Success, AFError> {
					do {
						
						
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public let px128x128: String?
					public let px256x256: String?
					public let px512x512: String?
					public let px64x64: String?
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case px128x128
						case px256x256
						case px512x512
						case px64x64
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
			}
			
			public struct Roles {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Success, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-characters.read_corporation_roles.v1") else {throw ESIError.forbidden}
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public let roles: [ESI.Characters.Role]?
					public let rolesAtBase: [ESI.Characters.RolesAtBaseRolesAtBase]?
					public let rolesAtHq: [ESI.Characters.RolesAtHqRolesAtHq]?
					public let rolesAtOther: [ESI.Characters.RolesAtOtherRolesAtOther]?
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case roles
						case rolesAtBase = "roles_at_base"
						case rolesAtHq = "roles_at_hq"
						case rolesAtOther = "roles_at_other"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
			}
			
			public struct Search {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(categories: [ESI.Characters.CharacterID.Search.Categories], language: ESI.Markets.Language? = nil, search: String, strict: Bool? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Success, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-search.search_structures.v1") else {throw ESIError.forbidden}
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						if !categories.isEmpty {
							query.append(URLQueryItem(name: "categories", value: categories.lazy.map{$0.description}.joined(separator: ",")))
						}
						if let language = language {
							query.append(URLQueryItem(name: "language", value: language.description))
						}
						query.append(URLQueryItem(name: "search", value: search.description))
						if let strict = strict {
							query.append(URLQueryItem(name: "strict", value: strict.description))
						}
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public enum Categories: String, Codable, CustomStringConvertible {
					case agent
					case alliance
					case character
					case constellation
					case corporation
					case faction
					case inventoryType = "inventory_type"
					case region
					case solarSystem = "solar_system"
					case station
					case structure
					
					public var description: String {
						return rawValue
					}
					
				}
				
				public struct Success: Codable, Hashable {
					
					
					public let agent: [Int]?
					public let alliance: [Int]?
					public let character: [Int]?
					public let constellation: [Int]?
					public let corporation: [Int]?
					public let faction: [Int]?
					public let inventoryType: [Int]?
					public let region: [Int]?
					public let solarSystem: [Int]?
					public let station: [Int]?
					public let structure: [Int64]?
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case agent
						case alliance
						case character
						case constellation
						case corporation
						case faction
						case inventoryType = "inventory_type"
						case region
						case solarSystem = "solar_system"
						case station
						case structure
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
			}
			
			public struct Ship {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Success, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-location.read_ship_type.v1") else {throw ESIError.forbidden}
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public let shipItemID: Int64
					public let shipName: String
					public let shipTypeID: Int
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case shipItemID = "ship_item_id"
						case shipName = "ship_name"
						case shipTypeID = "ship_type_id"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
			}
			
			public struct Skillqueue {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-skills.read_skillqueue.v1") else {throw ESIError.forbidden}
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public let finishDate: Date?
					public let finishedLevel: Int
					public let levelEndSP: Int?
					public let levelStartSP: Int?
					public let queuePosition: Int
					public let skillID: Int
					public let startDate: Date?
					public let trainingStartSP: Int?
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case finishDate = "finish_date"
						case finishedLevel = "finished_level"
						case levelEndSP = "level_end_sp"
						case levelStartSP = "level_start_sp"
						case queuePosition = "queue_position"
						case skillID = "skill_id"
						case startDate = "start_date"
						case trainingStartSP = "training_start_sp"
						
						var dateFormatter: DateFormatter? {
							switch self {
								case .finishDate:
								return DateFormatter.esiDateTimeFormatter
								case .startDate:
								return DateFormatter.esiDateTimeFormatter
								default:
								return nil
							}
						}
					}
				}
				
			}
			
			public struct Skills {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Success, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-skills.read_skills.v1") else {throw ESIError.forbidden}
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Skill: Codable, Hashable {
					
					
					public let activeSkillLevel: Int
					public let skillID: Int
					public let skillpointsInSkill: Int64
					public let trainedSkillLevel: Int
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case activeSkillLevel = "active_skill_level"
						case skillID = "skill_id"
						case skillpointsInSkill = "skillpoints_in_skill"
						case trainedSkillLevel = "trained_skill_level"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct Success: Codable, Hashable {
					
					
					public let skills: [ESI.Characters.CharacterID.Skills.Skill]
					public let totalSP: Int64
					public let unallocatedSP: Int?
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case skills
						case totalSP = "total_sp"
						case unallocatedSP = "unallocated_sp"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
			}
			
			public struct Standings {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-characters.read_standings.v1") else {throw ESIError.forbidden}
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public let fromID: Int
					public let fromType: ESI.Characters.FromType
					public let standing: Double
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case fromID = "from_id"
						case fromType = "from_type"
						case standing
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
			}
			
			public struct Stats {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-characterstats.read.v1") else {throw ESIError.forbidden}
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Industry: Codable, Hashable {
					
					
					public let hackingSuccesses: Int64?
					public let jobsCancelled: Int64?
					public let jobsCompletedCopyBlueprint: Int64?
					public let jobsCompletedInvention: Int64?
					public let jobsCompletedManufacture: Int64?
					public let jobsCompletedManufactureAsteroid: Int64?
					public let jobsCompletedManufactureAsteroidQuantity: Int64?
					public let jobsCompletedManufactureCharge: Int64?
					public let jobsCompletedManufactureChargeQuantity: Int64?
					public let jobsCompletedManufactureCommodity: Int64?
					public let jobsCompletedManufactureCommodityQuantity: Int64?
					public let jobsCompletedManufactureDeployable: Int64?
					public let jobsCompletedManufactureDeployableQuantity: Int64?
					public let jobsCompletedManufactureDrone: Int64?
					public let jobsCompletedManufactureDroneQuantity: Int64?
					public let jobsCompletedManufactureImplant: Int64?
					public let jobsCompletedManufactureImplantQuantity: Int64?
					public let jobsCompletedManufactureModule: Int64?
					public let jobsCompletedManufactureModuleQuantity: Int64?
					public let jobsCompletedManufactureOther: Int64?
					public let jobsCompletedManufactureOtherQuantity: Int64?
					public let jobsCompletedManufactureShip: Int64?
					public let jobsCompletedManufactureShipQuantity: Int64?
					public let jobsCompletedManufactureStructure: Int64?
					public let jobsCompletedManufactureStructureQuantity: Int64?
					public let jobsCompletedManufactureSubsystem: Int64?
					public let jobsCompletedManufactureSubsystemQuantity: Int64?
					public let jobsCompletedMaterialProductivity: Int64?
					public let jobsCompletedTimeProductivity: Int64?
					public let jobsStartedCopyBlueprint: Int64?
					public let jobsStartedInvention: Int64?
					public let jobsStartedManufacture: Int64?
					public let jobsStartedMaterialProductivity: Int64?
					public let jobsStartedTimeProductivity: Int64?
					public let reprocessItem: Int64?
					public let reprocessItemQuantity: Int64?
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case hackingSuccesses = "hacking_successes"
						case jobsCancelled = "jobs_cancelled"
						case jobsCompletedCopyBlueprint = "jobs_completed_copy_blueprint"
						case jobsCompletedInvention = "jobs_completed_invention"
						case jobsCompletedManufacture = "jobs_completed_manufacture"
						case jobsCompletedManufactureAsteroid = "jobs_completed_manufacture_asteroid"
						case jobsCompletedManufactureAsteroidQuantity = "jobs_completed_manufacture_asteroid_quantity"
						case jobsCompletedManufactureCharge = "jobs_completed_manufacture_charge"
						case jobsCompletedManufactureChargeQuantity = "jobs_completed_manufacture_charge_quantity"
						case jobsCompletedManufactureCommodity = "jobs_completed_manufacture_commodity"
						case jobsCompletedManufactureCommodityQuantity = "jobs_completed_manufacture_commodity_quantity"
						case jobsCompletedManufactureDeployable = "jobs_completed_manufacture_deployable"
						case jobsCompletedManufactureDeployableQuantity = "jobs_completed_manufacture_deployable_quantity"
						case jobsCompletedManufactureDrone = "jobs_completed_manufacture_drone"
						case jobsCompletedManufactureDroneQuantity = "jobs_completed_manufacture_drone_quantity"
						case jobsCompletedManufactureImplant = "jobs_completed_manufacture_implant"
						case jobsCompletedManufactureImplantQuantity = "jobs_completed_manufacture_implant_quantity"
						case jobsCompletedManufactureModule = "jobs_completed_manufacture_module"
						case jobsCompletedManufactureModuleQuantity = "jobs_completed_manufacture_module_quantity"
						case jobsCompletedManufactureOther = "jobs_completed_manufacture_other"
						case jobsCompletedManufactureOtherQuantity = "jobs_completed_manufacture_other_quantity"
						case jobsCompletedManufactureShip = "jobs_completed_manufacture_ship"
						case jobsCompletedManufactureShipQuantity = "jobs_completed_manufacture_ship_quantity"
						case jobsCompletedManufactureStructure = "jobs_completed_manufacture_structure"
						case jobsCompletedManufactureStructureQuantity = "jobs_completed_manufacture_structure_quantity"
						case jobsCompletedManufactureSubsystem = "jobs_completed_manufacture_subsystem"
						case jobsCompletedManufactureSubsystemQuantity = "jobs_completed_manufacture_subsystem_quantity"
						case jobsCompletedMaterialProductivity = "jobs_completed_material_productivity"
						case jobsCompletedTimeProductivity = "jobs_completed_time_productivity"
						case jobsStartedCopyBlueprint = "jobs_started_copy_blueprint"
						case jobsStartedInvention = "jobs_started_invention"
						case jobsStartedManufacture = "jobs_started_manufacture"
						case jobsStartedMaterialProductivity = "jobs_started_material_productivity"
						case jobsStartedTimeProductivity = "jobs_started_time_productivity"
						case reprocessItem = "reprocess_item"
						case reprocessItemQuantity = "reprocess_item_quantity"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct Travel: Codable, Hashable {
					
					
					public let accelerationGateActivations: Int64?
					public let alignTo: Int64?
					public let distanceWarpedHighSec: Int64?
					public let distanceWarpedLowSec: Int64?
					public let distanceWarpedNullSec: Int64?
					public let distanceWarpedWormhole: Int64?
					public let docksHighSec: Int64?
					public let docksLowSec: Int64?
					public let docksNullSec: Int64?
					public let jumpsStargateHighSec: Int64?
					public let jumpsStargateLowSec: Int64?
					public let jumpsStargateNullSec: Int64?
					public let jumpsWormhole: Int64?
					public let warpsHighSec: Int64?
					public let warpsLowSec: Int64?
					public let warpsNullSec: Int64?
					public let warpsToBookmark: Int64?
					public let warpsToCelestial: Int64?
					public let warpsToFleetMember: Int64?
					public let warpsToScanResult: Int64?
					public let warpsWormhole: Int64?
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case accelerationGateActivations = "acceleration_gate_activations"
						case alignTo = "align_to"
						case distanceWarpedHighSec = "distance_warped_high_sec"
						case distanceWarpedLowSec = "distance_warped_low_sec"
						case distanceWarpedNullSec = "distance_warped_null_sec"
						case distanceWarpedWormhole = "distance_warped_wormhole"
						case docksHighSec = "docks_high_sec"
						case docksLowSec = "docks_low_sec"
						case docksNullSec = "docks_null_sec"
						case jumpsStargateHighSec = "jumps_stargate_high_sec"
						case jumpsStargateLowSec = "jumps_stargate_low_sec"
						case jumpsStargateNullSec = "jumps_stargate_null_sec"
						case jumpsWormhole = "jumps_wormhole"
						case warpsHighSec = "warps_high_sec"
						case warpsLowSec = "warps_low_sec"
						case warpsNullSec = "warps_null_sec"
						case warpsToBookmark = "warps_to_bookmark"
						case warpsToCelestial = "warps_to_celestial"
						case warpsToFleetMember = "warps_to_fleet_member"
						case warpsToScanResult = "warps_to_scan_result"
						case warpsWormhole = "warps_wormhole"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct Combat: Codable, Hashable {
					
					
					public let capDrainedbyNpc: Int64?
					public let capDrainedbyPc: Int64?
					public let capDrainingPc: Int64?
					public let criminalFlagSet: Int64?
					public let damageFromNpCsAmount: Int64?
					public let damageFromNpCsNumShots: Int64?
					public let damageFromPlayersBombAmount: Int64?
					public let damageFromPlayersBombNumShots: Int64?
					public let damageFromPlayersCombatDroneAmount: Int64?
					public let damageFromPlayersCombatDroneNumShots: Int64?
					public let damageFromPlayersEnergyAmount: Int64?
					public let damageFromPlayersEnergyNumShots: Int64?
					public let damageFromPlayersFighterBomberAmount: Int64?
					public let damageFromPlayersFighterBomberNumShots: Int64?
					public let damageFromPlayersFighterDroneAmount: Int64?
					public let damageFromPlayersFighterDroneNumShots: Int64?
					public let damageFromPlayersHybridAmount: Int64?
					public let damageFromPlayersHybridNumShots: Int64?
					public let damageFromPlayersMissileAmount: Int64?
					public let damageFromPlayersMissileNumShots: Int64?
					public let damageFromPlayersProjectileAmount: Int64?
					public let damageFromPlayersProjectileNumShots: Int64?
					public let damageFromPlayersSmartBombAmount: Int64?
					public let damageFromPlayersSmartBombNumShots: Int64?
					public let damageFromPlayersSuperAmount: Int64?
					public let damageFromPlayersSuperNumShots: Int64?
					public let damageFromStructuresTotalAmount: Int64?
					public let damageFromStructuresTotalNumShots: Int64?
					public let damageToPlayersBombAmount: Int64?
					public let damageToPlayersBombNumShots: Int64?
					public let damageToPlayersCombatDroneAmount: Int64?
					public let damageToPlayersCombatDroneNumShots: Int64?
					public let damageToPlayersEnergyAmount: Int64?
					public let damageToPlayersEnergyNumShots: Int64?
					public let damageToPlayersFighterBomberAmount: Int64?
					public let damageToPlayersFighterBomberNumShots: Int64?
					public let damageToPlayersFighterDroneAmount: Int64?
					public let damageToPlayersFighterDroneNumShots: Int64?
					public let damageToPlayersHybridAmount: Int64?
					public let damageToPlayersHybridNumShots: Int64?
					public let damageToPlayersMissileAmount: Int64?
					public let damageToPlayersMissileNumShots: Int64?
					public let damageToPlayersProjectileAmount: Int64?
					public let damageToPlayersProjectileNumShots: Int64?
					public let damageToPlayersSmartBombAmount: Int64?
					public let damageToPlayersSmartBombNumShots: Int64?
					public let damageToPlayersSuperAmount: Int64?
					public let damageToPlayersSuperNumShots: Int64?
					public let damageToStructuresTotalAmount: Int64?
					public let damageToStructuresTotalNumShots: Int64?
					public let deathsHighSec: Int64?
					public let deathsLowSec: Int64?
					public let deathsNullSec: Int64?
					public let deathsPodHighSec: Int64?
					public let deathsPodLowSec: Int64?
					public let deathsPodNullSec: Int64?
					public let deathsPodWormhole: Int64?
					public let deathsWormhole: Int64?
					public let droneEngage: Int64?
					public let dscans: Int64?
					public let duelRequested: Int64?
					public let engagementRegister: Int64?
					public let killsAssists: Int64?
					public let killsHighSec: Int64?
					public let killsLowSec: Int64?
					public let killsNullSec: Int64?
					public let killsPodHighSec: Int64?
					public let killsPodLowSec: Int64?
					public let killsPodNullSec: Int64?
					public let killsPodWormhole: Int64?
					public let killsWormhole: Int64?
					public let npcFlagSet: Int64?
					public let probeScans: Int64?
					public let pvpFlagSet: Int64?
					public let repairArmorByRemoteAmount: Int64?
					public let repairArmorRemoteAmount: Int64?
					public let repairArmorSelfAmount: Int64?
					public let repairCapacitorByRemoteAmount: Int64?
					public let repairCapacitorRemoteAmount: Int64?
					public let repairCapacitorSelfAmount: Int64?
					public let repairHullByRemoteAmount: Int64?
					public let repairHullRemoteAmount: Int64?
					public let repairHullSelfAmount: Int64?
					public let repairShieldByRemoteAmount: Int64?
					public let repairShieldRemoteAmount: Int64?
					public let repairShieldSelfAmount: Int64?
					public let selfDestructs: Int64?
					public let warpScramblePc: Int64?
					public let warpScrambledbyNpc: Int64?
					public let warpScrambledbyPc: Int64?
					public let weaponFlagSet: Int64?
					public let webifiedbyNpc: Int64?
					public let webifiedbyPc: Int64?
					public let webifyingPc: Int64?
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case capDrainedbyNpc = "cap_drainedby_npc"
						case capDrainedbyPc = "cap_drainedby_pc"
						case capDrainingPc = "cap_draining_pc"
						case criminalFlagSet = "criminal_flag_set"
						case damageFromNpCsAmount = "damage_from_np_cs_amount"
						case damageFromNpCsNumShots = "damage_from_np_cs_num_shots"
						case damageFromPlayersBombAmount = "damage_from_players_bomb_amount"
						case damageFromPlayersBombNumShots = "damage_from_players_bomb_num_shots"
						case damageFromPlayersCombatDroneAmount = "damage_from_players_combat_drone_amount"
						case damageFromPlayersCombatDroneNumShots = "damage_from_players_combat_drone_num_shots"
						case damageFromPlayersEnergyAmount = "damage_from_players_energy_amount"
						case damageFromPlayersEnergyNumShots = "damage_from_players_energy_num_shots"
						case damageFromPlayersFighterBomberAmount = "damage_from_players_fighter_bomber_amount"
						case damageFromPlayersFighterBomberNumShots = "damage_from_players_fighter_bomber_num_shots"
						case damageFromPlayersFighterDroneAmount = "damage_from_players_fighter_drone_amount"
						case damageFromPlayersFighterDroneNumShots = "damage_from_players_fighter_drone_num_shots"
						case damageFromPlayersHybridAmount = "damage_from_players_hybrid_amount"
						case damageFromPlayersHybridNumShots = "damage_from_players_hybrid_num_shots"
						case damageFromPlayersMissileAmount = "damage_from_players_missile_amount"
						case damageFromPlayersMissileNumShots = "damage_from_players_missile_num_shots"
						case damageFromPlayersProjectileAmount = "damage_from_players_projectile_amount"
						case damageFromPlayersProjectileNumShots = "damage_from_players_projectile_num_shots"
						case damageFromPlayersSmartBombAmount = "damage_from_players_smart_bomb_amount"
						case damageFromPlayersSmartBombNumShots = "damage_from_players_smart_bomb_num_shots"
						case damageFromPlayersSuperAmount = "damage_from_players_super_amount"
						case damageFromPlayersSuperNumShots = "damage_from_players_super_num_shots"
						case damageFromStructuresTotalAmount = "damage_from_structures_total_amount"
						case damageFromStructuresTotalNumShots = "damage_from_structures_total_num_shots"
						case damageToPlayersBombAmount = "damage_to_players_bomb_amount"
						case damageToPlayersBombNumShots = "damage_to_players_bomb_num_shots"
						case damageToPlayersCombatDroneAmount = "damage_to_players_combat_drone_amount"
						case damageToPlayersCombatDroneNumShots = "damage_to_players_combat_drone_num_shots"
						case damageToPlayersEnergyAmount = "damage_to_players_energy_amount"
						case damageToPlayersEnergyNumShots = "damage_to_players_energy_num_shots"
						case damageToPlayersFighterBomberAmount = "damage_to_players_fighter_bomber_amount"
						case damageToPlayersFighterBomberNumShots = "damage_to_players_fighter_bomber_num_shots"
						case damageToPlayersFighterDroneAmount = "damage_to_players_fighter_drone_amount"
						case damageToPlayersFighterDroneNumShots = "damage_to_players_fighter_drone_num_shots"
						case damageToPlayersHybridAmount = "damage_to_players_hybrid_amount"
						case damageToPlayersHybridNumShots = "damage_to_players_hybrid_num_shots"
						case damageToPlayersMissileAmount = "damage_to_players_missile_amount"
						case damageToPlayersMissileNumShots = "damage_to_players_missile_num_shots"
						case damageToPlayersProjectileAmount = "damage_to_players_projectile_amount"
						case damageToPlayersProjectileNumShots = "damage_to_players_projectile_num_shots"
						case damageToPlayersSmartBombAmount = "damage_to_players_smart_bomb_amount"
						case damageToPlayersSmartBombNumShots = "damage_to_players_smart_bomb_num_shots"
						case damageToPlayersSuperAmount = "damage_to_players_super_amount"
						case damageToPlayersSuperNumShots = "damage_to_players_super_num_shots"
						case damageToStructuresTotalAmount = "damage_to_structures_total_amount"
						case damageToStructuresTotalNumShots = "damage_to_structures_total_num_shots"
						case deathsHighSec = "deaths_high_sec"
						case deathsLowSec = "deaths_low_sec"
						case deathsNullSec = "deaths_null_sec"
						case deathsPodHighSec = "deaths_pod_high_sec"
						case deathsPodLowSec = "deaths_pod_low_sec"
						case deathsPodNullSec = "deaths_pod_null_sec"
						case deathsPodWormhole = "deaths_pod_wormhole"
						case deathsWormhole = "deaths_wormhole"
						case droneEngage = "drone_engage"
						case dscans
						case duelRequested = "duel_requested"
						case engagementRegister = "engagement_register"
						case killsAssists = "kills_assists"
						case killsHighSec = "kills_high_sec"
						case killsLowSec = "kills_low_sec"
						case killsNullSec = "kills_null_sec"
						case killsPodHighSec = "kills_pod_high_sec"
						case killsPodLowSec = "kills_pod_low_sec"
						case killsPodNullSec = "kills_pod_null_sec"
						case killsPodWormhole = "kills_pod_wormhole"
						case killsWormhole = "kills_wormhole"
						case npcFlagSet = "npc_flag_set"
						case probeScans = "probe_scans"
						case pvpFlagSet = "pvp_flag_set"
						case repairArmorByRemoteAmount = "repair_armor_by_remote_amount"
						case repairArmorRemoteAmount = "repair_armor_remote_amount"
						case repairArmorSelfAmount = "repair_armor_self_amount"
						case repairCapacitorByRemoteAmount = "repair_capacitor_by_remote_amount"
						case repairCapacitorRemoteAmount = "repair_capacitor_remote_amount"
						case repairCapacitorSelfAmount = "repair_capacitor_self_amount"
						case repairHullByRemoteAmount = "repair_hull_by_remote_amount"
						case repairHullRemoteAmount = "repair_hull_remote_amount"
						case repairHullSelfAmount = "repair_hull_self_amount"
						case repairShieldByRemoteAmount = "repair_shield_by_remote_amount"
						case repairShieldRemoteAmount = "repair_shield_remote_amount"
						case repairShieldSelfAmount = "repair_shield_self_amount"
						case selfDestructs = "self_destructs"
						case warpScramblePc = "warp_scramble_pc"
						case warpScrambledbyNpc = "warp_scrambledby_npc"
						case warpScrambledbyPc = "warp_scrambledby_pc"
						case weaponFlagSet = "weapon_flag_set"
						case webifiedbyNpc = "webifiedby_npc"
						case webifiedbyPc = "webifiedby_pc"
						case webifyingPc = "webifying_pc"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct Success: Codable, Hashable {
					
					
					public let character: ESI.Characters.CharacterID.Stats.Character?
					public let combat: ESI.Characters.CharacterID.Stats.Combat?
					public let industry: ESI.Characters.CharacterID.Stats.Industry?
					public let inventory: ESI.Characters.CharacterID.Stats.Inventory?
					public let isk: ESI.Characters.CharacterID.Stats.Isk?
					public let market: ESI.Characters.CharacterID.Stats.Market?
					public let mining: ESI.Characters.CharacterID.Stats.Mining?
					public let module: ESI.Characters.CharacterID.Stats.Module?
					public let orbital: ESI.Characters.CharacterID.Stats.Orbital?
					public let pve: ESI.Characters.CharacterID.Stats.Pve?
					public let social: ESI.Characters.CharacterID.Stats.Social?
					public let travel: ESI.Characters.CharacterID.Stats.Travel?
					public let year: Int
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case character
						case combat
						case industry
						case inventory
						case isk
						case market
						case mining
						case module
						case orbital
						case pve
						case social
						case travel
						case year
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct Inventory: Codable, Hashable {
					
					
					public let abandonLootQuantity: Int64?
					public let trashItemQuantity: Int64?
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case abandonLootQuantity = "abandon_loot_quantity"
						case trashItemQuantity = "trash_item_quantity"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct Mining: Codable, Hashable {
					
					
					public let droneMine: Int64?
					public let oreArkonor: Int64?
					public let oreBistot: Int64?
					public let oreCrokite: Int64?
					public let oreDarkOchre: Int64?
					public let oreGneiss: Int64?
					public let oreHarvestableCloud: Int64?
					public let oreHedbergite: Int64?
					public let oreHemorphite: Int64?
					public let oreIce: Int64?
					public let oreJaspet: Int64?
					public let oreKernite: Int64?
					public let oreMercoxit: Int64?
					public let oreOmber: Int64?
					public let orePlagioclase: Int64?
					public let orePyroxeres: Int64?
					public let oreScordite: Int64?
					public let oreSpodumain: Int64?
					public let oreVeldspar: Int64?
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case droneMine = "drone_mine"
						case oreArkonor = "ore_arkonor"
						case oreBistot = "ore_bistot"
						case oreCrokite = "ore_crokite"
						case oreDarkOchre = "ore_dark_ochre"
						case oreGneiss = "ore_gneiss"
						case oreHarvestableCloud = "ore_harvestable_cloud"
						case oreHedbergite = "ore_hedbergite"
						case oreHemorphite = "ore_hemorphite"
						case oreIce = "ore_ice"
						case oreJaspet = "ore_jaspet"
						case oreKernite = "ore_kernite"
						case oreMercoxit = "ore_mercoxit"
						case oreOmber = "ore_omber"
						case orePlagioclase = "ore_plagioclase"
						case orePyroxeres = "ore_pyroxeres"
						case oreScordite = "ore_scordite"
						case oreSpodumain = "ore_spodumain"
						case oreVeldspar = "ore_veldspar"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct Social: Codable, Hashable {
					
					
					public let addContactBad: Int64?
					public let addContactGood: Int64?
					public let addContactHigh: Int64?
					public let addContactHorrible: Int64?
					public let addContactNeutral: Int64?
					public let addNote: Int64?
					public let addedAsContactBad: Int64?
					public let addedAsContactGood: Int64?
					public let addedAsContactHigh: Int64?
					public let addedAsContactHorrible: Int64?
					public let addedAsContactNeutral: Int64?
					public let calendarEventCreated: Int64?
					public let chatMessagesAlliance: Int64?
					public let chatMessagesConstellation: Int64?
					public let chatMessagesCorporation: Int64?
					public let chatMessagesFleet: Int64?
					public let chatMessagesRegion: Int64?
					public let chatMessagesSolarsystem: Int64?
					public let chatMessagesWarfaction: Int64?
					public let chatTotalMessageLength: Int64?
					public let directTrades: Int64?
					public let fleetBroadcasts: Int64?
					public let fleetJoins: Int64?
					public let mailsReceived: Int64?
					public let mailsSent: Int64?
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case addContactBad = "add_contact_bad"
						case addContactGood = "add_contact_good"
						case addContactHigh = "add_contact_high"
						case addContactHorrible = "add_contact_horrible"
						case addContactNeutral = "add_contact_neutral"
						case addNote = "add_note"
						case addedAsContactBad = "added_as_contact_bad"
						case addedAsContactGood = "added_as_contact_good"
						case addedAsContactHigh = "added_as_contact_high"
						case addedAsContactHorrible = "added_as_contact_horrible"
						case addedAsContactNeutral = "added_as_contact_neutral"
						case calendarEventCreated = "calendar_event_created"
						case chatMessagesAlliance = "chat_messages_alliance"
						case chatMessagesConstellation = "chat_messages_constellation"
						case chatMessagesCorporation = "chat_messages_corporation"
						case chatMessagesFleet = "chat_messages_fleet"
						case chatMessagesRegion = "chat_messages_region"
						case chatMessagesSolarsystem = "chat_messages_solarsystem"
						case chatMessagesWarfaction = "chat_messages_warfaction"
						case chatTotalMessageLength = "chat_total_message_length"
						case directTrades = "direct_trades"
						case fleetBroadcasts = "fleet_broadcasts"
						case fleetJoins = "fleet_joins"
						case mailsReceived = "mails_received"
						case mailsSent = "mails_sent"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct Module: Codable, Hashable {
					
					
					public let activationsArmorHardener: Int64?
					public let activationsArmorRepairUnit: Int64?
					public let activationsArmorResistanceShiftHardener: Int64?
					public let activationsAutomatedTargetingSystem: Int64?
					public let activationsBastion: Int64?
					public let activationsBombLauncher: Int64?
					public let activationsCapacitorBooster: Int64?
					public let activationsCargoScanner: Int64?
					public let activationsCloakingDevice: Int64?
					public let activationsCloneVatBay: Int64?
					public let activationsCynosuralField: Int64?
					public let activationsDamageControl: Int64?
					public let activationsDataMiners: Int64?
					public let activationsDroneControlUnit: Int64?
					public let activationsDroneTrackingModules: Int64?
					public let activationsEccm: Int64?
					public let activationsEcm: Int64?
					public let activationsEcmBurst: Int64?
					public let activationsEnergyDestabilizer: Int64?
					public let activationsEnergyVampire: Int64?
					public let activationsEnergyWeapon: Int64?
					public let activationsFestivalLauncher: Int64?
					public let activationsFrequencyMiningLaser: Int64?
					public let activationsFueledArmorRepairer: Int64?
					public let activationsFueledShieldBooster: Int64?
					public let activationsGangCoordinator: Int64?
					public let activationsGasCloudHarvester: Int64?
					public let activationsHullRepairUnit: Int64?
					public let activationsHybridWeapon: Int64?
					public let activationsIndustrialCore: Int64?
					public let activationsInterdictionSphereLauncher: Int64?
					public let activationsMicroJumpDrive: Int64?
					public let activationsMiningLaser: Int64?
					public let activationsMissileLauncher: Int64?
					public let activationsPassiveTargetingSystem: Int64?
					public let activationsProbeLauncher: Int64?
					public let activationsProjectedEccm: Int64?
					public let activationsProjectileWeapon: Int64?
					public let activationsPropulsionModule: Int64?
					public let activationsRemoteArmorRepairer: Int64?
					public let activationsRemoteCapacitorTransmitter: Int64?
					public let activationsRemoteEcmBurst: Int64?
					public let activationsRemoteHullRepairer: Int64?
					public let activationsRemoteSensorBooster: Int64?
					public let activationsRemoteSensorDamper: Int64?
					public let activationsRemoteShieldBooster: Int64?
					public let activationsRemoteTrackingComputer: Int64?
					public let activationsSalvager: Int64?
					public let activationsSensorBooster: Int64?
					public let activationsShieldBooster: Int64?
					public let activationsShieldHardener: Int64?
					public let activationsShipScanner: Int64?
					public let activationsSiege: Int64?
					public let activationsSmartBomb: Int64?
					public let activationsStasisWeb: Int64?
					public let activationsStripMiner: Int64?
					public let activationsSuperWeapon: Int64?
					public let activationsSurveyScanner: Int64?
					public let activationsTargetBreaker: Int64?
					public let activationsTargetPainter: Int64?
					public let activationsTrackingComputer: Int64?
					public let activationsTrackingDisruptor: Int64?
					public let activationsTractorBeam: Int64?
					public let activationsTriage: Int64?
					public let activationsWarpDisruptFieldGenerator: Int64?
					public let activationsWarpScrambler: Int64?
					public let linkWeapons: Int64?
					public let overload: Int64?
					public let repairs: Int64?
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case activationsArmorHardener = "activations_armor_hardener"
						case activationsArmorRepairUnit = "activations_armor_repair_unit"
						case activationsArmorResistanceShiftHardener = "activations_armor_resistance_shift_hardener"
						case activationsAutomatedTargetingSystem = "activations_automated_targeting_system"
						case activationsBastion = "activations_bastion"
						case activationsBombLauncher = "activations_bomb_launcher"
						case activationsCapacitorBooster = "activations_capacitor_booster"
						case activationsCargoScanner = "activations_cargo_scanner"
						case activationsCloakingDevice = "activations_cloaking_device"
						case activationsCloneVatBay = "activations_clone_vat_bay"
						case activationsCynosuralField = "activations_cynosural_field"
						case activationsDamageControl = "activations_damage_control"
						case activationsDataMiners = "activations_data_miners"
						case activationsDroneControlUnit = "activations_drone_control_unit"
						case activationsDroneTrackingModules = "activations_drone_tracking_modules"
						case activationsEccm = "activations_eccm"
						case activationsEcm = "activations_ecm"
						case activationsEcmBurst = "activations_ecm_burst"
						case activationsEnergyDestabilizer = "activations_energy_destabilizer"
						case activationsEnergyVampire = "activations_energy_vampire"
						case activationsEnergyWeapon = "activations_energy_weapon"
						case activationsFestivalLauncher = "activations_festival_launcher"
						case activationsFrequencyMiningLaser = "activations_frequency_mining_laser"
						case activationsFueledArmorRepairer = "activations_fueled_armor_repairer"
						case activationsFueledShieldBooster = "activations_fueled_shield_booster"
						case activationsGangCoordinator = "activations_gang_coordinator"
						case activationsGasCloudHarvester = "activations_gas_cloud_harvester"
						case activationsHullRepairUnit = "activations_hull_repair_unit"
						case activationsHybridWeapon = "activations_hybrid_weapon"
						case activationsIndustrialCore = "activations_industrial_core"
						case activationsInterdictionSphereLauncher = "activations_interdiction_sphere_launcher"
						case activationsMicroJumpDrive = "activations_micro_jump_drive"
						case activationsMiningLaser = "activations_mining_laser"
						case activationsMissileLauncher = "activations_missile_launcher"
						case activationsPassiveTargetingSystem = "activations_passive_targeting_system"
						case activationsProbeLauncher = "activations_probe_launcher"
						case activationsProjectedEccm = "activations_projected_eccm"
						case activationsProjectileWeapon = "activations_projectile_weapon"
						case activationsPropulsionModule = "activations_propulsion_module"
						case activationsRemoteArmorRepairer = "activations_remote_armor_repairer"
						case activationsRemoteCapacitorTransmitter = "activations_remote_capacitor_transmitter"
						case activationsRemoteEcmBurst = "activations_remote_ecm_burst"
						case activationsRemoteHullRepairer = "activations_remote_hull_repairer"
						case activationsRemoteSensorBooster = "activations_remote_sensor_booster"
						case activationsRemoteSensorDamper = "activations_remote_sensor_damper"
						case activationsRemoteShieldBooster = "activations_remote_shield_booster"
						case activationsRemoteTrackingComputer = "activations_remote_tracking_computer"
						case activationsSalvager = "activations_salvager"
						case activationsSensorBooster = "activations_sensor_booster"
						case activationsShieldBooster = "activations_shield_booster"
						case activationsShieldHardener = "activations_shield_hardener"
						case activationsShipScanner = "activations_ship_scanner"
						case activationsSiege = "activations_siege"
						case activationsSmartBomb = "activations_smart_bomb"
						case activationsStasisWeb = "activations_stasis_web"
						case activationsStripMiner = "activations_strip_miner"
						case activationsSuperWeapon = "activations_super_weapon"
						case activationsSurveyScanner = "activations_survey_scanner"
						case activationsTargetBreaker = "activations_target_breaker"
						case activationsTargetPainter = "activations_target_painter"
						case activationsTrackingComputer = "activations_tracking_computer"
						case activationsTrackingDisruptor = "activations_tracking_disruptor"
						case activationsTractorBeam = "activations_tractor_beam"
						case activationsTriage = "activations_triage"
						case activationsWarpDisruptFieldGenerator = "activations_warp_disrupt_field_generator"
						case activationsWarpScrambler = "activations_warp_scrambler"
						case linkWeapons = "link_weapons"
						case overload
						case repairs
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct Market: Codable, Hashable {
					
					
					public let acceptContractsCourier: Int64?
					public let acceptContractsItemExchange: Int64?
					public let buyOrdersPlaced: Int64?
					public let cancelMarketOrder: Int64?
					public let createContractsAuction: Int64?
					public let createContractsCourier: Int64?
					public let createContractsItemExchange: Int64?
					public let deliverCourierContract: Int64?
					public let iskGained: Int64?
					public let iskSpent: Int64?
					public let modifyMarketOrder: Int64?
					public let searchContracts: Int64?
					public let sellOrdersPlaced: Int64?
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case acceptContractsCourier = "accept_contracts_courier"
						case acceptContractsItemExchange = "accept_contracts_item_exchange"
						case buyOrdersPlaced = "buy_orders_placed"
						case cancelMarketOrder = "cancel_market_order"
						case createContractsAuction = "create_contracts_auction"
						case createContractsCourier = "create_contracts_courier"
						case createContractsItemExchange = "create_contracts_item_exchange"
						case deliverCourierContract = "deliver_courier_contract"
						case iskGained = "isk_gained"
						case iskSpent = "isk_spent"
						case modifyMarketOrder = "modify_market_order"
						case searchContracts = "search_contracts"
						case sellOrdersPlaced = "sell_orders_placed"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct Pve: Codable, Hashable {
					
					
					public let dungeonsCompletedAgent: Int64?
					public let dungeonsCompletedDistribution: Int64?
					public let missionsSucceeded: Int64?
					public let missionsSucceededEpicArc: Int64?
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case dungeonsCompletedAgent = "dungeons_completed_agent"
						case dungeonsCompletedDistribution = "dungeons_completed_distribution"
						case missionsSucceeded = "missions_succeeded"
						case missionsSucceededEpicArc = "missions_succeeded_epic_arc"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct Isk: Codable, Hashable {
					
					
					public let `in`: Int64?
					public let out: Int64?
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case `in` = "in"
						case out
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct Character: Codable, Hashable {
					
					
					public let daysOfActivity: Int64?
					public let minutes: Int64?
					public let sessionsStarted: Int64?
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case daysOfActivity = "days_of_activity"
						case minutes
						case sessionsStarted = "sessions_started"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct Orbital: Codable, Hashable {
					
					
					public let strikeCharactersKilled: Int64?
					public let strikeDamageToPlayersArmorAmount: Int64?
					public let strikeDamageToPlayersShieldAmount: Int64?
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case strikeCharactersKilled = "strike_characters_killed"
						case strikeDamageToPlayersArmorAmount = "strike_damage_to_players_armor_amount"
						case strikeDamageToPlayersShieldAmount = "strike_damage_to_players_shield_amount"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
			}
			
			public struct Titles {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-characters.read_titles.v1") else {throw ESIError.forbidden}
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public let name: String?
					public let titleID: Int?
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case name
						case titleID = "title_id"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
			}
			
			public struct Wallet {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Double, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-wallet.read_character_wallet.v1") else {throw ESIError.forbidden}
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				public func journal() -> Journal {
					Journal(esi: esi, route: .path("journal", next: route))
				}
				public func transactions() -> Transactions {
					Transactions(esi: esi, route: .path("transactions", next: route))
				}
				
				public struct Journal {
					let esi: ESI
					let route: APIRoute
					
					
					public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-wallet.read_character_wallet.v1") else {throw ESIError.forbidden}
							
							
							var headers = HTTPHeaders()
							headers["Accept"] = "application/json"
							
							
							var query = [URLQueryItem]()
							query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
							if let page = page {
								query.append(URLQueryItem(name: "page", value: page.description))
							}
							
							let url = try route.asURL()
							var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
							components.queryItems = query
							
							return esi.session.publisher(components,
							method: .get,
							encoding: URLEncoding.default,
							headers: headers,
							interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
							
						}
						catch {
							return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
						}
					}
					
					
					
					
					
					
					public enum RefType: String, Codable, CustomStringConvertible {
						case accelerationGateFee = "acceleration_gate_fee"
						case advertisementListingFee = "advertisement_listing_fee"
						case agentDonation = "agent_donation"
						case agentLocationServices = "agent_location_services"
						case agentMiscellaneous = "agent_miscellaneous"
						case agentMissionCollateralPaid = "agent_mission_collateral_paid"
						case agentMissionCollateralRefunded = "agent_mission_collateral_refunded"
						case agentMissionReward = "agent_mission_reward"
						case agentMissionRewardCorporationTax = "agent_mission_reward_corporation_tax"
						case agentMissionTimeBonusReward = "agent_mission_time_bonus_reward"
						case agentMissionTimeBonusRewardCorporationTax = "agent_mission_time_bonus_reward_corporation_tax"
						case agentSecurityServices = "agent_security_services"
						case agentServicesRendered = "agent_services_rendered"
						case agentsPreward = "agents_preward"
						case allianceMaintainanceFee = "alliance_maintainance_fee"
						case allianceRegistrationFee = "alliance_registration_fee"
						case assetSafetyRecoveryTax = "asset_safety_recovery_tax"
						case bounty
						case bountyPrize = "bounty_prize"
						case bountyPrizeCorporationTax = "bounty_prize_corporation_tax"
						case bountyPrizes = "bounty_prizes"
						case bountyReimbursement = "bounty_reimbursement"
						case bountySurcharge = "bounty_surcharge"
						case brokersFee = "brokers_fee"
						case cloneActivation = "clone_activation"
						case cloneTransfer = "clone_transfer"
						case contrabandFine = "contraband_fine"
						case contractAuctionBid = "contract_auction_bid"
						case contractAuctionBidCorp = "contract_auction_bid_corp"
						case contractAuctionBidRefund = "contract_auction_bid_refund"
						case contractAuctionSold = "contract_auction_sold"
						case contractBrokersFee = "contract_brokers_fee"
						case contractBrokersFeeCorp = "contract_brokers_fee_corp"
						case contractCollateral = "contract_collateral"
						case contractCollateralDepositedCorp = "contract_collateral_deposited_corp"
						case contractCollateralPayout = "contract_collateral_payout"
						case contractCollateralRefund = "contract_collateral_refund"
						case contractDeposit = "contract_deposit"
						case contractDepositCorp = "contract_deposit_corp"
						case contractDepositRefund = "contract_deposit_refund"
						case contractDepositSalesTax = "contract_deposit_sales_tax"
						case contractPrice = "contract_price"
						case contractPricePaymentCorp = "contract_price_payment_corp"
						case contractReversal = "contract_reversal"
						case contractReward = "contract_reward"
						case contractRewardDeposited = "contract_reward_deposited"
						case contractRewardDepositedCorp = "contract_reward_deposited_corp"
						case contractRewardRefund = "contract_reward_refund"
						case contractSalesTax = "contract_sales_tax"
						case copying
						case corporateRewardPayout = "corporate_reward_payout"
						case corporateRewardTax = "corporate_reward_tax"
						case corporationAccountWithdrawal = "corporation_account_withdrawal"
						case corporationBulkPayment = "corporation_bulk_payment"
						case corporationDividendPayment = "corporation_dividend_payment"
						case corporationLiquidation = "corporation_liquidation"
						case corporationLogoChangeCost = "corporation_logo_change_cost"
						case corporationPayment = "corporation_payment"
						case corporationRegistrationFee = "corporation_registration_fee"
						case courierMissionEscrow = "courier_mission_escrow"
						case cspa
						case cspaofflinerefund
						case datacoreFee = "datacore_fee"
						case dnaModificationFee = "dna_modification_fee"
						case dockingFee = "docking_fee"
						case duelWagerEscrow = "duel_wager_escrow"
						case duelWagerPayment = "duel_wager_payment"
						case duelWagerRefund = "duel_wager_refund"
						case factorySlotRentalFee = "factory_slot_rental_fee"
						case gmCashTransfer = "gm_cash_transfer"
						case industryJobTax = "industry_job_tax"
						case infrastructureHubMaintenance = "infrastructure_hub_maintenance"
						case inheritance
						case insurance
						case itemTraderPayment = "item_trader_payment"
						case jumpCloneActivationFee = "jump_clone_activation_fee"
						case jumpCloneInstallationFee = "jump_clone_installation_fee"
						case killRightFee = "kill_right_fee"
						case lpStore = "lp_store"
						case manufacturing
						case marketEscrow = "market_escrow"
						case marketFinePaid = "market_fine_paid"
						case marketTransaction = "market_transaction"
						case medalCreation = "medal_creation"
						case medalIssued = "medal_issued"
						case missionCompletion = "mission_completion"
						case missionCost = "mission_cost"
						case missionExpiration = "mission_expiration"
						case missionReward = "mission_reward"
						case officeRentalFee = "office_rental_fee"
						case operationBonus = "operation_bonus"
						case opportunityReward = "opportunity_reward"
						case planetaryConstruction = "planetary_construction"
						case planetaryExportTax = "planetary_export_tax"
						case planetaryImportTax = "planetary_import_tax"
						case playerDonation = "player_donation"
						case playerTrading = "player_trading"
						case projectDiscoveryReward = "project_discovery_reward"
						case projectDiscoveryTax = "project_discovery_tax"
						case reaction
						case releaseOfImpoundedProperty = "release_of_impounded_property"
						case repairBill = "repair_bill"
						case reprocessingTax = "reprocessing_tax"
						case researchingMaterialProductivity = "researching_material_productivity"
						case researchingTechnology = "researching_technology"
						case researchingTimeProductivity = "researching_time_productivity"
						case resourceWarsReward = "resource_wars_reward"
						case reverseEngineering = "reverse_engineering"
						case securityProcessingFee = "security_processing_fee"
						case shares
						case skillPurchase = "skill_purchase"
						case sovereignityBill = "sovereignity_bill"
						case storePurchase = "store_purchase"
						case storePurchaseRefund = "store_purchase_refund"
						case structureGateJump = "structure_gate_jump"
						case transactionTax = "transaction_tax"
						case upkeepAdjustmentFee = "upkeep_adjustment_fee"
						case warAllyContract = "war_ally_contract"
						case warFee = "war_fee"
						case warFeeSurrender = "war_fee_surrender"
						
						public var description: String {
							return rawValue
						}
						
					}
					
					public struct Success: Codable, Hashable {
						
						
						public let amount: Double?
						public let balance: Double?
						public let contextID: Int64?
						public let contextIDType: ESI.Characters.ContextIDType?
						public let date: Date
						public let localizedDescription: String
						public let firstPartyID: Int?
						public let id: Int64
						public let reason: String?
						public let refType: ESI.Characters.CharacterID.Wallet.Journal.RefType
						public let secondPartyID: Int?
						public let tax: Double?
						public let taxReceiverID: Int?
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case amount
							case balance
							case contextID = "context_id"
							case contextIDType = "context_id_type"
							case date
							case localizedDescription = "description"
							case firstPartyID = "first_party_id"
							case id
							case reason
							case refType = "ref_type"
							case secondPartyID = "second_party_id"
							case tax
							case taxReceiverID = "tax_receiver_id"
							
							var dateFormatter: DateFormatter? {
								switch self {
									case .date:
									return DateFormatter.esiDateTimeFormatter
									default:
									return nil
								}
							}
						}
					}
					
				}
				
				public struct Transactions {
					let esi: ESI
					let route: APIRoute
					
					
					public func get(fromID: Int64?, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-wallet.read_character_wallet.v1") else {throw ESIError.forbidden}
							
							
							var headers = HTTPHeaders()
							headers["Accept"] = "application/json"
							
							
							var query = [URLQueryItem]()
							query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
							if let fromID = fromID {
								query.append(URLQueryItem(name: "from_id", value: fromID.description))
							}
							
							let url = try route.asURL()
							var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
							components.queryItems = query
							
							return esi.session.publisher(components,
							method: .get,
							encoding: URLEncoding.default,
							headers: headers,
							interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
							
						}
						catch {
							return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
						}
					}
					
					
					
					
					
					
					public struct Success: Codable, Hashable {
						
						
						public let clientID: Int
						public let date: Date
						public let isBuy: Bool
						public let isPersonal: Bool
						public let journalRefID: Int64
						public let locationID: Int64
						public let quantity: Int
						public let transactionID: Int64
						public let typeID: Int
						public let unitPrice: Double
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case clientID = "client_id"
							case date
							case isBuy = "is_buy"
							case isPersonal = "is_personal"
							case journalRefID = "journal_ref_id"
							case locationID = "location_id"
							case quantity
							case transactionID = "transaction_id"
							case typeID = "type_id"
							case unitPrice = "unit_price"
							
							var dateFormatter: DateFormatter? {
								switch self {
									case .date:
									return DateFormatter.esiDateTimeFormatter
									default:
									return nil
								}
							}
						}
					}
					
				}
				
				
				
			}
			
			
			public struct Success: Codable, Hashable {
				
				
				public let allianceID: Int?
				public let ancestryID: Int?
				public let birthday: Date
				public let bloodlineID: Int
				public let corporationID: Int
				public let localizedDescription: String?
				public let factionID: Int?
				public let gender: ESI.Characters.CharacterID.Gender
				public let name: String
				public let raceID: Int
				public let securityStatus: Double?
				public let title: String?
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case allianceID = "alliance_id"
					case ancestryID = "ancestry_id"
					case birthday
					case bloodlineID = "bloodline_id"
					case corporationID = "corporation_id"
					case localizedDescription = "description"
					case factionID = "faction_id"
					case gender
					case name
					case raceID = "race_id"
					case securityStatus = "security_status"
					case title
					
					var dateFormatter: DateFormatter? {
						switch self {
							case .birthday:
							return DateFormatter.esiDateTimeFormatter
							default:
							return nil
						}
					}
				}
			}
			
			public enum Gender: String, Codable, CustomStringConvertible {
				case female
				case male
				
				public var description: String {
					return rawValue
				}
				
			}
			
		}
		
		
		public enum FromType: String, Codable, CustomStringConvertible {
			case agent
			case npcCorp = "npc_corp"
			case faction
			
			public var description: String {
				return rawValue
			}
			
		}
		
		public struct Coordinates: Codable, Hashable {
			
			
			public let x: Double
			public let y: Double
			public let z: Double
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case x
				case y
				case z
				
				var dateFormatter: DateFormatter? {
					return nil
				}
			}
		}
		
		public enum Role: String, Codable, CustomStringConvertible {
			case accountTake1 = "Account_Take_1"
			case accountTake2 = "Account_Take_2"
			case accountTake3 = "Account_Take_3"
			case accountTake4 = "Account_Take_4"
			case accountTake5 = "Account_Take_5"
			case accountTake6 = "Account_Take_6"
			case accountTake7 = "Account_Take_7"
			case accountant = "Accountant"
			case auditor = "Auditor"
			case communicationsOfficer = "Communications_Officer"
			case configEquipment = "Config_Equipment"
			case configStarbaseEquipment = "Config_Starbase_Equipment"
			case containerTake1 = "Container_Take_1"
			case containerTake2 = "Container_Take_2"
			case containerTake3 = "Container_Take_3"
			case containerTake4 = "Container_Take_4"
			case containerTake5 = "Container_Take_5"
			case containerTake6 = "Container_Take_6"
			case containerTake7 = "Container_Take_7"
			case contractManager = "Contract_Manager"
			case diplomat = "Diplomat"
			case director = "Director"
			case factoryManager = "Factory_Manager"
			case fittingManager = "Fitting_Manager"
			case hangarQuery1 = "Hangar_Query_1"
			case hangarQuery2 = "Hangar_Query_2"
			case hangarQuery3 = "Hangar_Query_3"
			case hangarQuery4 = "Hangar_Query_4"
			case hangarQuery5 = "Hangar_Query_5"
			case hangarQuery6 = "Hangar_Query_6"
			case hangarQuery7 = "Hangar_Query_7"
			case hangarTake1 = "Hangar_Take_1"
			case hangarTake2 = "Hangar_Take_2"
			case hangarTake3 = "Hangar_Take_3"
			case hangarTake4 = "Hangar_Take_4"
			case hangarTake5 = "Hangar_Take_5"
			case hangarTake6 = "Hangar_Take_6"
			case hangarTake7 = "Hangar_Take_7"
			case juniorAccountant = "Junior_Accountant"
			case personnelManager = "Personnel_Manager"
			case rentFactoryFacility = "Rent_Factory_Facility"
			case rentOffice = "Rent_Office"
			case rentResearchFacility = "Rent_Research_Facility"
			case securityOfficer = "Security_Officer"
			case starbaseDefenseOperator = "Starbase_Defense_Operator"
			case starbaseFuelTechnician = "Starbase_Fuel_Technician"
			case stationManager = "Station_Manager"
			case trader = "Trader"
			
			public var description: String {
				return rawValue
			}
			
		}
		
		public enum ContactType: String, Codable, CustomStringConvertible {
			case character
			case corporation
			case alliance
			case faction
			
			public var description: String {
				return rawValue
			}
			
		}
		
		public enum LocationType: String, Codable, CustomStringConvertible {
			case station
			case solarSystem = "solar_system"
			case other
			
			public var description: String {
				return rawValue
			}
			
		}
		
		public struct Position: Codable, Hashable {
			
			
			public let x: Double
			public let y: Double
			public let z: Double
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case x
				case y
				case z
				
				var dateFormatter: DateFormatter? {
					return nil
				}
			}
		}
		
		public enum RolesAtOtherRolesAtOther: String, Codable, CustomStringConvertible {
			case accountTake1 = "Account_Take_1"
			case accountTake2 = "Account_Take_2"
			case accountTake3 = "Account_Take_3"
			case accountTake4 = "Account_Take_4"
			case accountTake5 = "Account_Take_5"
			case accountTake6 = "Account_Take_6"
			case accountTake7 = "Account_Take_7"
			case accountant = "Accountant"
			case auditor = "Auditor"
			case communicationsOfficer = "Communications_Officer"
			case configEquipment = "Config_Equipment"
			case configStarbaseEquipment = "Config_Starbase_Equipment"
			case containerTake1 = "Container_Take_1"
			case containerTake2 = "Container_Take_2"
			case containerTake3 = "Container_Take_3"
			case containerTake4 = "Container_Take_4"
			case containerTake5 = "Container_Take_5"
			case containerTake6 = "Container_Take_6"
			case containerTake7 = "Container_Take_7"
			case contractManager = "Contract_Manager"
			case diplomat = "Diplomat"
			case director = "Director"
			case factoryManager = "Factory_Manager"
			case fittingManager = "Fitting_Manager"
			case hangarQuery1 = "Hangar_Query_1"
			case hangarQuery2 = "Hangar_Query_2"
			case hangarQuery3 = "Hangar_Query_3"
			case hangarQuery4 = "Hangar_Query_4"
			case hangarQuery5 = "Hangar_Query_5"
			case hangarQuery6 = "Hangar_Query_6"
			case hangarQuery7 = "Hangar_Query_7"
			case hangarTake1 = "Hangar_Take_1"
			case hangarTake2 = "Hangar_Take_2"
			case hangarTake3 = "Hangar_Take_3"
			case hangarTake4 = "Hangar_Take_4"
			case hangarTake5 = "Hangar_Take_5"
			case hangarTake6 = "Hangar_Take_6"
			case hangarTake7 = "Hangar_Take_7"
			case juniorAccountant = "Junior_Accountant"
			case personnelManager = "Personnel_Manager"
			case rentFactoryFacility = "Rent_Factory_Facility"
			case rentOffice = "Rent_Office"
			case rentResearchFacility = "Rent_Research_Facility"
			case securityOfficer = "Security_Officer"
			case starbaseDefenseOperator = "Starbase_Defense_Operator"
			case starbaseFuelTechnician = "Starbase_Fuel_Technician"
			case stationManager = "Station_Manager"
			case trader = "Trader"
			
			public var description: String {
				return rawValue
			}
			
		}
		
		public struct Item: Codable, Hashable {
			
			
			public let itemID: Int64
			public let typeID: Int
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case itemID = "item_id"
				case typeID = "type_id"
				
				var dateFormatter: DateFormatter? {
					return nil
				}
			}
		}
		
		public enum State: String, Codable, CustomStringConvertible {
			case cancelled
			case expired
			
			public var description: String {
				return rawValue
			}
			
		}
		
		public enum RolesAtHqRolesAtHq: String, Codable, CustomStringConvertible {
			case accountTake1 = "Account_Take_1"
			case accountTake2 = "Account_Take_2"
			case accountTake3 = "Account_Take_3"
			case accountTake4 = "Account_Take_4"
			case accountTake5 = "Account_Take_5"
			case accountTake6 = "Account_Take_6"
			case accountTake7 = "Account_Take_7"
			case accountant = "Accountant"
			case auditor = "Auditor"
			case communicationsOfficer = "Communications_Officer"
			case configEquipment = "Config_Equipment"
			case configStarbaseEquipment = "Config_Starbase_Equipment"
			case containerTake1 = "Container_Take_1"
			case containerTake2 = "Container_Take_2"
			case containerTake3 = "Container_Take_3"
			case containerTake4 = "Container_Take_4"
			case containerTake5 = "Container_Take_5"
			case containerTake6 = "Container_Take_6"
			case containerTake7 = "Container_Take_7"
			case contractManager = "Contract_Manager"
			case diplomat = "Diplomat"
			case director = "Director"
			case factoryManager = "Factory_Manager"
			case fittingManager = "Fitting_Manager"
			case hangarQuery1 = "Hangar_Query_1"
			case hangarQuery2 = "Hangar_Query_2"
			case hangarQuery3 = "Hangar_Query_3"
			case hangarQuery4 = "Hangar_Query_4"
			case hangarQuery5 = "Hangar_Query_5"
			case hangarQuery6 = "Hangar_Query_6"
			case hangarQuery7 = "Hangar_Query_7"
			case hangarTake1 = "Hangar_Take_1"
			case hangarTake2 = "Hangar_Take_2"
			case hangarTake3 = "Hangar_Take_3"
			case hangarTake4 = "Hangar_Take_4"
			case hangarTake5 = "Hangar_Take_5"
			case hangarTake6 = "Hangar_Take_6"
			case hangarTake7 = "Hangar_Take_7"
			case juniorAccountant = "Junior_Accountant"
			case personnelManager = "Personnel_Manager"
			case rentFactoryFacility = "Rent_Factory_Facility"
			case rentOffice = "Rent_Office"
			case rentResearchFacility = "Rent_Research_Facility"
			case securityOfficer = "Security_Officer"
			case starbaseDefenseOperator = "Starbase_Defense_Operator"
			case starbaseFuelTechnician = "Starbase_Fuel_Technician"
			case stationManager = "Station_Manager"
			case trader = "Trader"
			
			public var description: String {
				return rawValue
			}
			
		}
		
		public enum ContextIDType: String, Codable, CustomStringConvertible {
			case structureID = "structure_id"
			case stationID = "station_id"
			case marketTransactionID = "market_transaction_id"
			case characterID = "character_id"
			case corporationID = "corporation_id"
			case allianceID = "alliance_id"
			case eveSystem = "eve_system"
			case industryJobID = "industry_job_id"
			case contractID = "contract_id"
			case planetID = "planet_id"
			case systemID = "system_id"
			case typeID = "type_id"
			
			public var description: String {
				return rawValue
			}
			
		}
		
		public enum RolesAtBaseRolesAtBase: String, Codable, CustomStringConvertible {
			case accountTake1 = "Account_Take_1"
			case accountTake2 = "Account_Take_2"
			case accountTake3 = "Account_Take_3"
			case accountTake4 = "Account_Take_4"
			case accountTake5 = "Account_Take_5"
			case accountTake6 = "Account_Take_6"
			case accountTake7 = "Account_Take_7"
			case accountant = "Accountant"
			case auditor = "Auditor"
			case communicationsOfficer = "Communications_Officer"
			case configEquipment = "Config_Equipment"
			case configStarbaseEquipment = "Config_Starbase_Equipment"
			case containerTake1 = "Container_Take_1"
			case containerTake2 = "Container_Take_2"
			case containerTake3 = "Container_Take_3"
			case containerTake4 = "Container_Take_4"
			case containerTake5 = "Container_Take_5"
			case containerTake6 = "Container_Take_6"
			case containerTake7 = "Container_Take_7"
			case contractManager = "Contract_Manager"
			case diplomat = "Diplomat"
			case director = "Director"
			case factoryManager = "Factory_Manager"
			case fittingManager = "Fitting_Manager"
			case hangarQuery1 = "Hangar_Query_1"
			case hangarQuery2 = "Hangar_Query_2"
			case hangarQuery3 = "Hangar_Query_3"
			case hangarQuery4 = "Hangar_Query_4"
			case hangarQuery5 = "Hangar_Query_5"
			case hangarQuery6 = "Hangar_Query_6"
			case hangarQuery7 = "Hangar_Query_7"
			case hangarTake1 = "Hangar_Take_1"
			case hangarTake2 = "Hangar_Take_2"
			case hangarTake3 = "Hangar_Take_3"
			case hangarTake4 = "Hangar_Take_4"
			case hangarTake5 = "Hangar_Take_5"
			case hangarTake6 = "Hangar_Take_6"
			case hangarTake7 = "Hangar_Take_7"
			case juniorAccountant = "Junior_Accountant"
			case personnelManager = "Personnel_Manager"
			case rentFactoryFacility = "Rent_Factory_Facility"
			case rentOffice = "Rent_Office"
			case rentResearchFacility = "Rent_Research_Facility"
			case securityOfficer = "Security_Officer"
			case starbaseDefenseOperator = "Starbase_Defense_Operator"
			case starbaseFuelTechnician = "Starbase_Fuel_Technician"
			case stationManager = "Station_Manager"
			case trader = "Trader"
			
			public var description: String {
				return rawValue
			}
			
		}
		
		public enum Availability: String, Codable, CustomStringConvertible {
			case `public` = "public"
			case personal
			case corporation
			case alliance
			
			public var description: String {
				return rawValue
			}
			
		}
		
		public enum Range: String, Codable, CustomStringConvertible {
			case i1 = "1"
			case i10 = "10"
			case i2 = "2"
			case i20 = "20"
			case i3 = "3"
			case i30 = "30"
			case i4 = "4"
			case i40 = "40"
			case i5 = "5"
			case region
			case solarsystem
			case station
			
			public var description: String {
				return rawValue
			}
			
		}
		
	}
	
}
