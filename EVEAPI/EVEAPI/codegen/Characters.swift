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
			
			
			public func post(characters: [Int], cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<[Success]>, AFError> {
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
				
				
				public var allianceID: Int?
				public var characterID: Int
				public var corporationID: Int
				public var factionID: Int?
				public init(allianceID: Int?, characterID: Int, corporationID: Int, factionID: Int?) {
					self.allianceID = allianceID
					self.characterID = characterID
					self.corporationID = corporationID
					self.factionID = factionID
				}
				
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
			
			
			public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<Success>, AFError> {
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
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<[Success]>, AFError> {
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
					
					
					public var agentID: Int
					public var pointsPerDay: Double
					public var remainderPoints: Double
					public var skillTypeID: Int
					public var startedAt: Date
					public init(agentID: Int, pointsPerDay: Double, remainderPoints: Double, skillTypeID: Int, startedAt: Date) {
						self.agentID = agentID
						self.pointsPerDay = pointsPerDay
						self.remainderPoints = remainderPoints
						self.skillTypeID = skillTypeID
						self.startedAt = startedAt
					}
					
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
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<[Success]>, AFError> {
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
					
					
					public func post(itemIds: [Int64], cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<[Success]>, AFError> {
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
						
						
						public var itemID: Int64
						public var position: ESI.Characters.Position
						public init(itemID: Int64, position: ESI.Characters.Position) {
							self.itemID = itemID
							self.position = position
						}
						
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
					
					
					public func post(itemIds: [Int64], cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<[Success]>, AFError> {
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
						
						
						public var itemID: Int64
						public var name: String
						public init(itemID: Int64, name: String) {
							self.itemID = itemID
							self.name = name
						}
						
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
					
					
					public var isBlueprintCopy: Bool?
					public var isSingleton: Bool
					public var itemID: Int64
					public var locationFlag: ESI.Characters.CharacterID.Assets.LocationFlag
					public var locationID: Int64
					public var locationType: ESI.Characters.LocationType
					public var quantity: Int
					public var typeID: Int
					public init(isBlueprintCopy: Bool?, isSingleton: Bool, itemID: Int64, locationFlag: ESI.Characters.CharacterID.Assets.LocationFlag, locationID: Int64, locationType: ESI.Characters.LocationType, quantity: Int, typeID: Int) {
						self.isBlueprintCopy = isBlueprintCopy
						self.isSingleton = isSingleton
						self.itemID = itemID
						self.locationFlag = locationFlag
						self.locationID = locationID
						self.locationType = locationType
						self.quantity = quantity
						self.typeID = typeID
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
							return nil
						}
					}
				}
				
			}
			
			public struct Attributes {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<Success>, AFError> {
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
					
					
					public var accruedRemapCooldownDate: Date?
					public var bonusRemaps: Int?
					public var charisma: Int
					public var intelligence: Int
					public var lastRemapDate: Date?
					public var memory: Int
					public var perception: Int
					public var willpower: Int
					public init(accruedRemapCooldownDate: Date?, bonusRemaps: Int?, charisma: Int, intelligence: Int, lastRemapDate: Date?, memory: Int, perception: Int, willpower: Int) {
						self.accruedRemapCooldownDate = accruedRemapCooldownDate
						self.bonusRemaps = bonusRemaps
						self.charisma = charisma
						self.intelligence = intelligence
						self.lastRemapDate = lastRemapDate
						self.memory = memory
						self.perception = perception
						self.willpower = willpower
					}
					
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
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<[Success]>, AFError> {
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
					
					
					public var itemID: Int64
					public var locationFlag: ESI.Characters.CharacterID.Blueprints.LocationFlag
					public var locationID: Int64
					public var materialEfficiency: Int
					public var quantity: Int
					public var runs: Int
					public var timeEfficiency: Int
					public var typeID: Int
					public init(itemID: Int64, locationFlag: ESI.Characters.CharacterID.Blueprints.LocationFlag, locationID: Int64, materialEfficiency: Int, quantity: Int, runs: Int, timeEfficiency: Int, typeID: Int) {
						self.itemID = itemID
						self.locationFlag = locationFlag
						self.locationID = locationID
						self.materialEfficiency = materialEfficiency
						self.quantity = quantity
						self.runs = runs
						self.timeEfficiency = timeEfficiency
						self.typeID = typeID
					}
					
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
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<[Success]>, AFError> {
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
					
					
					public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<[Success]>, AFError> {
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
						
						
						public var folderID: Int
						public var name: String
						public init(folderID: Int, name: String) {
							self.folderID = folderID
							self.name = name
						}
						
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
					
					
					public var bookmarkID: Int
					public var coordinates: ESI.Characters.Coordinates?
					public var created: Date
					public var creatorID: Int
					public var folderID: Int?
					public var item: ESI.Characters.Item?
					public var label: String
					public var locationID: Int
					public var notes: String
					public init(bookmarkID: Int, coordinates: ESI.Characters.Coordinates?, created: Date, creatorID: Int, folderID: Int?, item: ESI.Characters.Item?, label: String, locationID: Int, notes: String) {
						self.bookmarkID = bookmarkID
						self.coordinates = coordinates
						self.created = created
						self.creatorID = creatorID
						self.folderID = folderID
						self.item = item
						self.label = label
						self.locationID = locationID
						self.notes = notes
					}
					
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
				
				
				public func get(fromEvent: Int?, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<[Success]>, AFError> {
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
					
					
					public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<Success>, AFError> {
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
					
					
					public func put(response: ESI.Characters.CharacterID.Calendar.EventID.Response, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<Void>, AFError> {
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
						
						
						public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<[Success]>, AFError> {
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
							
							
							public var characterID: Int?
							public var eventResponse: ESI.Characters.CharacterID.Calendar.EventResponse?
							public init(characterID: Int?, eventResponse: ESI.Characters.CharacterID.Calendar.EventResponse?) {
								self.characterID = characterID
								self.eventResponse = eventResponse
							}
							
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
						
						
						public var date: Date
						public var duration: Int
						public var eventID: Int
						public var importance: Int
						public var ownerID: Int
						public var ownerName: String
						public var ownerType: ESI.Characters.CharacterID.Calendar.EventID.OwnerType
						public var response: String
						public var text: String
						public var title: String
						public init(date: Date, duration: Int, eventID: Int, importance: Int, ownerID: Int, ownerName: String, ownerType: ESI.Characters.CharacterID.Calendar.EventID.OwnerType, response: String, text: String, title: String) {
							self.date = date
							self.duration = duration
							self.eventID = eventID
							self.importance = importance
							self.ownerID = ownerID
							self.ownerName = ownerName
							self.ownerType = ownerType
							self.response = response
							self.text = text
							self.title = title
						}
						
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
						
						public var response: ESI.Characters.CharacterID.Calendar.EventID.Response.ResponseResponse
						public init(response: ESI.Characters.CharacterID.Calendar.EventID.Response.ResponseResponse) {
							self.response = response
						}
						
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
				
				
				public struct Success: Codable, Hashable {
					
					
					public var eventDate: Date?
					public var eventID: Int?
					public var eventResponse: ESI.Characters.CharacterID.Calendar.EventResponse?
					public var importance: Int?
					public var title: String?
					public init(eventDate: Date?, eventID: Int?, eventResponse: ESI.Characters.CharacterID.Calendar.EventResponse?, importance: Int?, title: String?) {
						self.eventDate = eventDate
						self.eventID = eventID
						self.eventResponse = eventResponse
						self.importance = importance
						self.title = title
					}
					
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
				
				public enum EventResponse: String, Codable, CustomStringConvertible {
					case declined
					case notResponded = "not_responded"
					case accepted
					case tentative
					
					public var description: String {
						return rawValue
					}
					
				}
				
			}
			
			public struct Clones {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<Success>, AFError> {
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
				
				
				
				
				
				
				public struct HomeLocation: Codable, Hashable {
					
					public enum LocationType: String, Codable, CustomStringConvertible {
						case station
						case structure
						
						public var description: String {
							return rawValue
						}
						
					}
					
					public var locationID: Int64?
					public var locationType: ESI.Characters.CharacterID.Clones.HomeLocation.LocationType?
					public init(locationID: Int64?, locationType: ESI.Characters.CharacterID.Clones.HomeLocation.LocationType?) {
						self.locationID = locationID
						self.locationType = locationType
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case locationID = "location_id"
						case locationType = "location_type"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
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
					
					public var implants: [Int]
					public var jumpCloneID: Int
					public var locationID: Int64
					public var locationType: ESI.Characters.CharacterID.Clones.JumpClone.JumpCloneLocationType
					public var name: String?
					public init(implants: [Int], jumpCloneID: Int, locationID: Int64, locationType: ESI.Characters.CharacterID.Clones.JumpClone.JumpCloneLocationType, name: String?) {
						self.implants = implants
						self.jumpCloneID = jumpCloneID
						self.locationID = locationID
						self.locationType = locationType
						self.name = name
					}
					
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
				
				public struct Success: Codable, Hashable {
					
					
					public var homeLocation: ESI.Characters.CharacterID.Clones.HomeLocation?
					public var jumpClones: [ESI.Characters.CharacterID.Clones.JumpClone]
					public var lastCloneJumpDate: Date?
					public var lastStationChangeDate: Date?
					public init(homeLocation: ESI.Characters.CharacterID.Clones.HomeLocation?, jumpClones: [ESI.Characters.CharacterID.Clones.JumpClone], lastCloneJumpDate: Date?, lastStationChangeDate: Date?) {
						self.homeLocation = homeLocation
						self.jumpClones = jumpClones
						self.lastCloneJumpDate = lastCloneJumpDate
						self.lastStationChangeDate = lastStationChangeDate
					}
					
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
				
				
				public func delete(contactIds: [Int], cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<Void>, AFError> {
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
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<[Success]>, AFError> {
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
				
				
				public func post(contactIds: [Int], labelIds: [Int64]?, standing: Double, watched: Bool? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<[Int]>, AFError> {
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
				
				
				public func put(contactIds: [Int], labelIds: [Int64]?, standing: Double, watched: Bool? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<Void>, AFError> {
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
					
					
					public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<[Success]>, AFError> {
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
						
						
						public var labelID: Int64
						public var labelName: String
						public init(labelID: Int64, labelName: String) {
							self.labelID = labelID
							self.labelName = labelName
						}
						
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
					
					
					public var contactID: Int
					public var contactType: ESI.Characters.ContactType
					public var isBlocked: Bool?
					public var isWatched: Bool?
					public var labelIds: [Int64]?
					public var standing: Double
					public init(contactID: Int, contactType: ESI.Characters.ContactType, isBlocked: Bool?, isWatched: Bool?, labelIds: [Int64]?, standing: Double) {
						self.contactID = contactID
						self.contactType = contactType
						self.isBlocked = isBlocked
						self.isWatched = isWatched
						self.labelIds = labelIds
						self.standing = standing
					}
					
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
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<[Success]>, AFError> {
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
						
						
						public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<[Success]>, AFError> {
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
							
							
							public var amount: Double
							public var bidID: Int
							public var bidderID: Int
							public var dateBid: Date
							public init(amount: Double, bidID: Int, bidderID: Int, dateBid: Date) {
								self.amount = amount
								self.bidID = bidID
								self.bidderID = bidderID
								self.dateBid = dateBid
							}
							
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
						
						
						public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<[Success]>, AFError> {
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
							
							
							public var isIncluded: Bool
							public var isSingleton: Bool
							public var quantity: Int
							public var rawQuantity: Int?
							public var recordID: Int64
							public var typeID: Int
							public init(isIncluded: Bool, isSingleton: Bool, quantity: Int, rawQuantity: Int?, recordID: Int64, typeID: Int) {
								self.isIncluded = isIncluded
								self.isSingleton = isSingleton
								self.quantity = quantity
								self.rawQuantity = rawQuantity
								self.recordID = recordID
								self.typeID = typeID
							}
							
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
					
					
					public var acceptorID: Int
					public var assigneeID: Int
					public var availability: ESI.Characters.Availability
					public var buyout: Double?
					public var collateral: Double?
					public var contractID: Int
					public var dateAccepted: Date?
					public var dateCompleted: Date?
					public var dateExpired: Date
					public var dateIssued: Date
					public var daysToComplete: Int?
					public var endLocationID: Int64?
					public var forCorporation: Bool
					public var issuerCorporationID: Int
					public var issuerID: Int
					public var price: Double?
					public var reward: Double?
					public var startLocationID: Int64?
					public var status: ESI.Characters.CharacterID.Contracts.Status
					public var title: String?
					public var type: ESI.Contracts.ValueType
					public var volume: Double?
					public init(acceptorID: Int, assigneeID: Int, availability: ESI.Characters.Availability, buyout: Double?, collateral: Double?, contractID: Int, dateAccepted: Date?, dateCompleted: Date?, dateExpired: Date, dateIssued: Date, daysToComplete: Int?, endLocationID: Int64?, forCorporation: Bool, issuerCorporationID: Int, issuerID: Int, price: Double?, reward: Double?, startLocationID: Int64?, status: ESI.Characters.CharacterID.Contracts.Status, title: String?, type: ESI.Contracts.ValueType, volume: Double?) {
						self.acceptorID = acceptorID
						self.assigneeID = assigneeID
						self.availability = availability
						self.buyout = buyout
						self.collateral = collateral
						self.contractID = contractID
						self.dateAccepted = dateAccepted
						self.dateCompleted = dateCompleted
						self.dateExpired = dateExpired
						self.dateIssued = dateIssued
						self.daysToComplete = daysToComplete
						self.endLocationID = endLocationID
						self.forCorporation = forCorporation
						self.issuerCorporationID = issuerCorporationID
						self.issuerID = issuerID
						self.price = price
						self.reward = reward
						self.startLocationID = startLocationID
						self.status = status
						self.title = title
						self.type = type
						self.volume = volume
					}
					
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
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<[Success]>, AFError> {
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
					
					
					public var corporationID: Int
					public var isDeleted: Bool?
					public var recordID: Int
					public var startDate: Date
					public init(corporationID: Int, isDeleted: Bool?, recordID: Int, startDate: Date) {
						self.corporationID = corporationID
						self.isDeleted = isDeleted
						self.recordID = recordID
						self.startDate = startDate
					}
					
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
				
				
				public func post(characters: [Int], cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<Double>, AFError> {
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
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<Success>, AFError> {
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
					
					
					public var jumpFatigueExpireDate: Date?
					public var lastJumpDate: Date?
					public var lastUpdateDate: Date?
					public init(jumpFatigueExpireDate: Date?, lastJumpDate: Date?, lastUpdateDate: Date?) {
						self.jumpFatigueExpireDate = jumpFatigueExpireDate
						self.lastJumpDate = lastJumpDate
						self.lastUpdateDate = lastUpdateDate
					}
					
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
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<[Success]>, AFError> {
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
				
				
				public func post(fitting: ESI.Characters.CharacterID.Fittings.Fitting, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<Created>, AFError> {
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
					
					
					public func delete(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<Void>, AFError> {
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
					
					
					public var localizedDescription: String
					public var items: [ESI.Characters.CharacterID.Fittings.Item]
					public var name: String
					public var shipTypeID: Int
					public init(localizedDescription: String, items: [ESI.Characters.CharacterID.Fittings.Item], name: String, shipTypeID: Int) {
						self.localizedDescription = localizedDescription
						self.items = items
						self.name = name
						self.shipTypeID = shipTypeID
					}
					
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
				
				public struct Created: Codable, Hashable {
					
					
					public var fittingID: Int
					public init(fittingID: Int) {
						self.fittingID = fittingID
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case fittingID = "fitting_id"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct Success: Codable, Hashable {
					
					
					public var localizedDescription: String
					public var fittingID: Int
					public var items: [ESI.Characters.CharacterID.Fittings.Item]
					public var name: String
					public var shipTypeID: Int
					public init(localizedDescription: String, fittingID: Int, items: [ESI.Characters.CharacterID.Fittings.Item], name: String, shipTypeID: Int) {
						self.localizedDescription = localizedDescription
						self.fittingID = fittingID
						self.items = items
						self.name = name
						self.shipTypeID = shipTypeID
					}
					
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
				
				public struct Item: Codable, Hashable {
					
					
					public var flag: ESI.Characters.CharacterID.Fittings.Flag
					public var quantity: Int
					public var typeID: Int
					public init(flag: ESI.Characters.CharacterID.Fittings.Flag, quantity: Int, typeID: Int) {
						self.flag = flag
						self.quantity = quantity
						self.typeID = typeID
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case flag
						case quantity
						case typeID = "type_id"
						
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
				
			}
			
			public struct Fleet {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<Success>, AFError> {
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
					
					
					public var fleetID: Int64
					public var role: ESI.Characters.CharacterID.Fleet.Role
					public var squadID: Int64
					public var wingID: Int64
					public init(fleetID: Int64, role: ESI.Characters.CharacterID.Fleet.Role, squadID: Int64, wingID: Int64) {
						self.fleetID = fleetID
						self.role = role
						self.squadID = squadID
						self.wingID = wingID
					}
					
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
					
					
					public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<Success>, AFError> {
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
						
						
						public var currentRank: Int?
						public var enlistedOn: Date?
						public var factionID: Int?
						public var highestRank: Int?
						public var kills: ESI.Characters.Kills
						public var victoryPoints: ESI.Characters.VictoryPoints
						public init(currentRank: Int?, enlistedOn: Date?, factionID: Int?, highestRank: Int?, kills: ESI.Characters.Kills, victoryPoints: ESI.Characters.VictoryPoints) {
							self.currentRank = currentRank
							self.enlistedOn = enlistedOn
							self.factionID = factionID
							self.highestRank = highestRank
							self.kills = kills
							self.victoryPoints = victoryPoints
						}
						
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
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<[Int]>, AFError> {
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
					
					
					public func get(includeCompleted: Bool?, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<[Success]>, AFError> {
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
					
					
					
					
					
					
					public struct Success: Codable, Hashable {
						
						
						public var activityID: Int
						public var blueprintID: Int64
						public var blueprintLocationID: Int64
						public var blueprintTypeID: Int
						public var completedCharacterID: Int?
						public var completedDate: Date?
						public var cost: Double?
						public var duration: Int
						public var endDate: Date
						public var facilityID: Int64
						public var installerID: Int
						public var jobID: Int
						public var licensedRuns: Int?
						public var outputLocationID: Int64
						public var pauseDate: Date?
						public var probability: Double?
						public var productTypeID: Int?
						public var runs: Int
						public var startDate: Date
						public var stationID: Int64
						public var status: ESI.Characters.CharacterID.Industry.Jobs.Status
						public var successfulRuns: Int?
						public init(activityID: Int, blueprintID: Int64, blueprintLocationID: Int64, blueprintTypeID: Int, completedCharacterID: Int?, completedDate: Date?, cost: Double?, duration: Int, endDate: Date, facilityID: Int64, installerID: Int, jobID: Int, licensedRuns: Int?, outputLocationID: Int64, pauseDate: Date?, probability: Double?, productTypeID: Int?, runs: Int, startDate: Date, stationID: Int64, status: ESI.Characters.CharacterID.Industry.Jobs.Status, successfulRuns: Int?) {
							self.activityID = activityID
							self.blueprintID = blueprintID
							self.blueprintLocationID = blueprintLocationID
							self.blueprintTypeID = blueprintTypeID
							self.completedCharacterID = completedCharacterID
							self.completedDate = completedDate
							self.cost = cost
							self.duration = duration
							self.endDate = endDate
							self.facilityID = facilityID
							self.installerID = installerID
							self.jobID = jobID
							self.licensedRuns = licensedRuns
							self.outputLocationID = outputLocationID
							self.pauseDate = pauseDate
							self.probability = probability
							self.productTypeID = productTypeID
							self.runs = runs
							self.startDate = startDate
							self.stationID = stationID
							self.status = status
							self.successfulRuns = successfulRuns
						}
						
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
					
					
					public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<[Success]>, AFError> {
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
						
						
						public var killmailHash: String
						public var killmailID: Int
						public init(killmailHash: String, killmailID: Int) {
							self.killmailHash = killmailHash
							self.killmailID = killmailID
						}
						
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
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<Success>, AFError> {
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
					
					
					public var solarSystemID: Int
					public var stationID: Int?
					public var structureID: Int64?
					public init(solarSystemID: Int, stationID: Int?, structureID: Int64?) {
						self.solarSystemID = solarSystemID
						self.stationID = stationID
						self.structureID = structureID
					}
					
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
					
					
					public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<[Success]>, AFError> {
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
						
						
						public var corporationID: Int
						public var loyaltyPoints: Int
						public init(corporationID: Int, loyaltyPoints: Int) {
							self.corporationID = corporationID
							self.loyaltyPoints = loyaltyPoints
						}
						
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
				
				
				public func get(labels: [Int]?, lastMailID: Int?, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<[Success]>, AFError> {
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
				
				
				public func post(mail: ESI.Characters.CharacterID.Mail.Mail, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<Int>, AFError> {
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
					
					
					public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<Success>, AFError> {
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
					
					
					public func post(label: ESI.Characters.CharacterID.Mail.Labels.PostLabel, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<Int>, AFError> {
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
						
						
						public func delete(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<Void>, AFError> {
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
					
					public struct Label: Codable, Hashable {
						
						
						public var color: ESI.Characters.CharacterID.Mail.Labels.Color?
						public var labelID: Int?
						public var name: String?
						public var unreadCount: Int?
						public init(color: ESI.Characters.CharacterID.Mail.Labels.Color?, labelID: Int?, name: String?, unreadCount: Int?) {
							self.color = color
							self.labelID = labelID
							self.name = name
							self.unreadCount = unreadCount
						}
						
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
					
					public struct PostLabel: Codable, Hashable {
						
						
						public var color: ESI.Characters.CharacterID.Mail.Labels.Color?
						public var name: String
						public init(color: ESI.Characters.CharacterID.Mail.Labels.Color?, name: String) {
							self.color = color
							self.name = name
						}
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case color
							case name
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
					public struct Success: Codable, Hashable {
						
						
						public var labels: [ESI.Characters.CharacterID.Mail.Labels.Label]?
						public var totalUnreadCount: Int?
						public init(labels: [ESI.Characters.CharacterID.Mail.Labels.Label]?, totalUnreadCount: Int?) {
							self.labels = labels
							self.totalUnreadCount = totalUnreadCount
						}
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case labels
							case totalUnreadCount = "total_unread_count"
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
				}
				
				public struct Lists {
					let esi: ESI
					let route: APIRoute
					
					
					public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<[Success]>, AFError> {
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
						
						
						public var mailingListID: Int
						public var name: String
						public init(mailingListID: Int, name: String) {
							self.mailingListID = mailingListID
							self.name = name
						}
						
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
					
					
					public func delete(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<Void>, AFError> {
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
					
					
					public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<Success>, AFError> {
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
					
					
					public func put(contents: ESI.Characters.CharacterID.Mail.MailID.Contents, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<Void>, AFError> {
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
					
					
					
					
					
					
					public struct Success: Codable, Hashable {
						
						
						public var body: String?
						public var from: Int?
						public var labels: [Int]?
						public var read: Bool?
						public var recipients: [ESI.Characters.CharacterID.Mail.Recipient]?
						public var subject: String?
						public var timestamp: Date?
						public init(body: String?, from: Int?, labels: [Int]?, read: Bool?, recipients: [ESI.Characters.CharacterID.Mail.Recipient]?, subject: String?, timestamp: Date?) {
							self.body = body
							self.from = from
							self.labels = labels
							self.read = read
							self.recipients = recipients
							self.subject = subject
							self.timestamp = timestamp
						}
						
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
					
					public struct Contents: Codable, Hashable {
						
						
						public var labels: [Int]?
						public var read: Bool?
						public init(labels: [Int]?, read: Bool?) {
							self.labels = labels
							self.read = read
						}
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case labels
							case read
							
							var dateFormatter: DateFormatter? {
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
				
				public struct Recipient: Codable, Hashable {
					
					
					public var recipientID: Int
					public var recipientType: ESI.Characters.CharacterID.Mail.RecipientType
					public init(recipientID: Int, recipientType: ESI.Characters.CharacterID.Mail.RecipientType) {
						self.recipientID = recipientID
						self.recipientType = recipientType
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case recipientID = "recipient_id"
						case recipientType = "recipient_type"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct Success: Codable, Hashable {
					
					
					public var from: Int?
					public var isRead: Bool?
					public var labels: [Int]?
					public var mailID: Int?
					public var recipients: [ESI.Characters.CharacterID.Mail.Recipient]?
					public var subject: String?
					public var timestamp: Date?
					public init(from: Int?, isRead: Bool?, labels: [Int]?, mailID: Int?, recipients: [ESI.Characters.CharacterID.Mail.Recipient]?, subject: String?, timestamp: Date?) {
						self.from = from
						self.isRead = isRead
						self.labels = labels
						self.mailID = mailID
						self.recipients = recipients
						self.subject = subject
						self.timestamp = timestamp
					}
					
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
				
				public struct Mail: Codable, Hashable {
					
					
					public var approvedCost: Int64?
					public var body: String
					public var recipients: [ESI.Characters.CharacterID.Mail.Recipient]
					public var subject: String
					public init(approvedCost: Int64?, body: String, recipients: [ESI.Characters.CharacterID.Mail.Recipient], subject: String) {
						self.approvedCost = approvedCost
						self.body = body
						self.recipients = recipients
						self.subject = subject
					}
					
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
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<[Success]>, AFError> {
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
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public var corporationID: Int
					public var date: Date
					public var localizedDescription: String
					public var graphics: [ESI.Characters.CharacterID.Medals.Graphic]
					public var issuerID: Int
					public var medalID: Int
					public var reason: String
					public var status: ESI.Characters.CharacterID.Medals.Status
					public var title: String
					public init(corporationID: Int, date: Date, localizedDescription: String, graphics: [ESI.Characters.CharacterID.Medals.Graphic], issuerID: Int, medalID: Int, reason: String, status: ESI.Characters.CharacterID.Medals.Status, title: String) {
						self.corporationID = corporationID
						self.date = date
						self.localizedDescription = localizedDescription
						self.graphics = graphics
						self.issuerID = issuerID
						self.medalID = medalID
						self.reason = reason
						self.status = status
						self.title = title
					}
					
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
				
				public struct Graphic: Codable, Hashable {
					
					
					public var color: Int?
					public var graphic: String
					public var layer: Int
					public var part: Int
					public init(color: Int?, graphic: String, layer: Int, part: Int) {
						self.color = color
						self.graphic = graphic
						self.layer = layer
						self.part = part
					}
					
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
				
			}
			
			public struct Mining {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<[Success]>, AFError> {
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
					
					
					public var date: Date
					public var quantity: Int64
					public var solarSystemID: Int
					public var typeID: Int
					public init(date: Date, quantity: Int64, solarSystemID: Int, typeID: Int) {
						self.date = date
						self.quantity = quantity
						self.solarSystemID = solarSystemID
						self.typeID = typeID
					}
					
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
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<[Success]>, AFError> {
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
					
					
					public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<[Success]>, AFError> {
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
						
						
						public var message: String
						public var notificationID: Int
						public var sendDate: Date
						public var senderCharacterID: Int
						public var standingLevel: Double
						public init(message: String, notificationID: Int, sendDate: Date, senderCharacterID: Int, standingLevel: Double) {
							self.message = message
							self.notificationID = notificationID
							self.sendDate = sendDate
							self.senderCharacterID = senderCharacterID
							self.standingLevel = standingLevel
						}
						
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
					
					
					public var isRead: Bool?
					public var notificationID: Int64
					public var senderID: Int
					public var senderType: ESI.Characters.CharacterID.Notifications.SenderType
					public var text: String?
					public var timestamp: Date
					public var type: ESI.Characters.CharacterID.Notifications.ValueType
					public init(isRead: Bool?, notificationID: Int64, senderID: Int, senderType: ESI.Characters.CharacterID.Notifications.SenderType, text: String?, timestamp: Date, type: ESI.Characters.CharacterID.Notifications.ValueType) {
						self.isRead = isRead
						self.notificationID = notificationID
						self.senderID = senderID
						self.senderType = senderType
						self.text = text
						self.timestamp = timestamp
						self.type = type
					}
					
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
				
			}
			
			public struct Online {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<Success>, AFError> {
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
					
					
					public var lastLogin: Date?
					public var lastLogout: Date?
					public var logins: Int?
					public var online: Bool
					public init(lastLogin: Date?, lastLogout: Date?, logins: Int?, online: Bool) {
						self.lastLogin = lastLogin
						self.lastLogout = lastLogout
						self.logins = logins
						self.online = online
					}
					
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
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<[Success]>, AFError> {
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
					
					
					public var completedAt: Date
					public var taskID: Int
					public init(completedAt: Date, taskID: Int) {
						self.completedAt = completedAt
						self.taskID = taskID
					}
					
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
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<[Success]>, AFError> {
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
					
					
					public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<[Success]>, AFError> {
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
						
						
						public var duration: Int
						public var escrow: Double?
						public var isBuyOrder: Bool?
						public var isCorporation: Bool
						public var issued: Date
						public var locationID: Int64
						public var minVolume: Int?
						public var orderID: Int64
						public var price: Double
						public var range: ESI.Characters.Range
						public var regionID: Int
						public var state: ESI.Characters.State
						public var typeID: Int
						public var volumeRemain: Int
						public var volumeTotal: Int
						public init(duration: Int, escrow: Double?, isBuyOrder: Bool?, isCorporation: Bool, issued: Date, locationID: Int64, minVolume: Int?, orderID: Int64, price: Double, range: ESI.Characters.Range, regionID: Int, state: ESI.Characters.State, typeID: Int, volumeRemain: Int, volumeTotal: Int) {
							self.duration = duration
							self.escrow = escrow
							self.isBuyOrder = isBuyOrder
							self.isCorporation = isCorporation
							self.issued = issued
							self.locationID = locationID
							self.minVolume = minVolume
							self.orderID = orderID
							self.price = price
							self.range = range
							self.regionID = regionID
							self.state = state
							self.typeID = typeID
							self.volumeRemain = volumeRemain
							self.volumeTotal = volumeTotal
						}
						
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
					
					
					public var duration: Int
					public var escrow: Double?
					public var isBuyOrder: Bool?
					public var isCorporation: Bool
					public var issued: Date
					public var locationID: Int64
					public var minVolume: Int?
					public var orderID: Int64
					public var price: Double
					public var range: ESI.Characters.Range
					public var regionID: Int
					public var typeID: Int
					public var volumeRemain: Int
					public var volumeTotal: Int
					public init(duration: Int, escrow: Double?, isBuyOrder: Bool?, isCorporation: Bool, issued: Date, locationID: Int64, minVolume: Int?, orderID: Int64, price: Double, range: ESI.Characters.Range, regionID: Int, typeID: Int, volumeRemain: Int, volumeTotal: Int) {
						self.duration = duration
						self.escrow = escrow
						self.isBuyOrder = isBuyOrder
						self.isCorporation = isCorporation
						self.issued = issued
						self.locationID = locationID
						self.minVolume = minVolume
						self.orderID = orderID
						self.price = price
						self.range = range
						self.regionID = regionID
						self.typeID = typeID
						self.volumeRemain = volumeRemain
						self.volumeTotal = volumeTotal
					}
					
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
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<[Success]>, AFError> {
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
					
					
					public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<Success>, AFError> {
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
					
					
					
					
					
					
					public struct Route: Codable, Hashable {
						
						
						public var contentTypeID: Int
						public var destinationPinID: Int64
						public var quantity: Double
						public var routeID: Int64
						public var sourcePinID: Int64
						public var waypoints: [Int64]?
						public init(contentTypeID: Int, destinationPinID: Int64, quantity: Double, routeID: Int64, sourcePinID: Int64, waypoints: [Int64]?) {
							self.contentTypeID = contentTypeID
							self.destinationPinID = destinationPinID
							self.quantity = quantity
							self.routeID = routeID
							self.sourcePinID = sourcePinID
							self.waypoints = waypoints
						}
						
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
					
					public struct Success: Codable, Hashable {
						
						
						public var links: [ESI.Characters.CharacterID.Planets.PlanetID.Link]
						public var pins: [ESI.Characters.CharacterID.Planets.PlanetID.Pin]
						public var routes: [ESI.Characters.CharacterID.Planets.PlanetID.Route]
						public init(links: [ESI.Characters.CharacterID.Planets.PlanetID.Link], pins: [ESI.Characters.CharacterID.Planets.PlanetID.Pin], routes: [ESI.Characters.CharacterID.Planets.PlanetID.Route]) {
							self.links = links
							self.pins = pins
							self.routes = routes
						}
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case links
							case pins
							case routes
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
					public struct Link: Codable, Hashable {
						
						
						public var destinationPinID: Int64
						public var linkLevel: Int
						public var sourcePinID: Int64
						public init(destinationPinID: Int64, linkLevel: Int, sourcePinID: Int64) {
							self.destinationPinID = destinationPinID
							self.linkLevel = linkLevel
							self.sourcePinID = sourcePinID
						}
						
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
							
							
							public var amount: Int64
							public var typeID: Int
							public init(amount: Int64, typeID: Int) {
								self.amount = amount
								self.typeID = typeID
							}
							
							enum CodingKeys: String, CodingKey, DateFormatted {
								case amount
								case typeID = "type_id"
								
								var dateFormatter: DateFormatter? {
									return nil
								}
							}
						}
						
						public struct ExtractorDetails: Codable, Hashable {
							
							public struct Head: Codable, Hashable {
								
								
								public var headID: Int
								public var latitude: Double
								public var longitude: Double
								public init(headID: Int, latitude: Double, longitude: Double) {
									self.headID = headID
									self.latitude = latitude
									self.longitude = longitude
								}
								
								enum CodingKeys: String, CodingKey, DateFormatted {
									case headID = "head_id"
									case latitude
									case longitude
									
									var dateFormatter: DateFormatter? {
										return nil
									}
								}
							}
							
							public var cycleTime: Int?
							public var headRadius: Double?
							public var heads: [ESI.Characters.CharacterID.Planets.PlanetID.Pin.ExtractorDetails.Head]
							public var productTypeID: Int?
							public var qtyPerCycle: Int?
							public init(cycleTime: Int?, headRadius: Double?, heads: [ESI.Characters.CharacterID.Planets.PlanetID.Pin.ExtractorDetails.Head], productTypeID: Int?, qtyPerCycle: Int?) {
								self.cycleTime = cycleTime
								self.headRadius = headRadius
								self.heads = heads
								self.productTypeID = productTypeID
								self.qtyPerCycle = qtyPerCycle
							}
							
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
						
						public struct FactoryDetails: Codable, Hashable {
							
							
							public var schematicID: Int
							public init(schematicID: Int) {
								self.schematicID = schematicID
							}
							
							enum CodingKeys: String, CodingKey, DateFormatted {
								case schematicID = "schematic_id"
								
								var dateFormatter: DateFormatter? {
									return nil
								}
							}
						}
						
						public var contents: [ESI.Characters.CharacterID.Planets.PlanetID.Pin.Content]?
						public var expiryTime: Date?
						public var extractorDetails: ESI.Characters.CharacterID.Planets.PlanetID.Pin.ExtractorDetails?
						public var factoryDetails: ESI.Characters.CharacterID.Planets.PlanetID.Pin.FactoryDetails?
						public var installTime: Date?
						public var lastCycleStart: Date?
						public var latitude: Double
						public var longitude: Double
						public var pinID: Int64
						public var schematicID: Int?
						public var typeID: Int
						public init(contents: [ESI.Characters.CharacterID.Planets.PlanetID.Pin.Content]?, expiryTime: Date?, extractorDetails: ESI.Characters.CharacterID.Planets.PlanetID.Pin.ExtractorDetails?, factoryDetails: ESI.Characters.CharacterID.Planets.PlanetID.Pin.FactoryDetails?, installTime: Date?, lastCycleStart: Date?, latitude: Double, longitude: Double, pinID: Int64, schematicID: Int?, typeID: Int) {
							self.contents = contents
							self.expiryTime = expiryTime
							self.extractorDetails = extractorDetails
							self.factoryDetails = factoryDetails
							self.installTime = installTime
							self.lastCycleStart = lastCycleStart
							self.latitude = latitude
							self.longitude = longitude
							self.pinID = pinID
							self.schematicID = schematicID
							self.typeID = typeID
						}
						
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
				
				public struct Success: Codable, Hashable {
					
					
					public var lastUpdate: Date
					public var numPins: Int
					public var ownerID: Int
					public var planetID: Int
					public var planetType: ESI.Characters.CharacterID.Planets.PlanetType
					public var solarSystemID: Int
					public var upgradeLevel: Int
					public init(lastUpdate: Date, numPins: Int, ownerID: Int, planetID: Int, planetType: ESI.Characters.CharacterID.Planets.PlanetType, solarSystemID: Int, upgradeLevel: Int) {
						self.lastUpdate = lastUpdate
						self.numPins = numPins
						self.ownerID = ownerID
						self.planetID = planetID
						self.planetType = planetType
						self.solarSystemID = solarSystemID
						self.upgradeLevel = upgradeLevel
					}
					
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
				
			}
			
			public struct Portrait {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<Success>, AFError> {
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
					
					
					public var px128x128: String?
					public var px256x256: String?
					public var px512x512: String?
					public var px64x64: String?
					public init(px128x128: String?, px256x256: String?, px512x512: String?, px64x64: String?) {
						self.px128x128 = px128x128
						self.px256x256 = px256x256
						self.px512x512 = px512x512
						self.px64x64 = px64x64
					}
					
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
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<Success>, AFError> {
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
					
					
					public var roles: [ESI.Characters.Role]?
					public var rolesAtBase: [ESI.Characters.RolesAtBaseRolesAtBase]?
					public var rolesAtHq: [ESI.Characters.RolesAtHqRolesAtHq]?
					public var rolesAtOther: [ESI.Characters.RolesAtOtherRolesAtOther]?
					public init(roles: [ESI.Characters.Role]?, rolesAtBase: [ESI.Characters.RolesAtBaseRolesAtBase]?, rolesAtHq: [ESI.Characters.RolesAtHqRolesAtHq]?, rolesAtOther: [ESI.Characters.RolesAtOtherRolesAtOther]?) {
						self.roles = roles
						self.rolesAtBase = rolesAtBase
						self.rolesAtHq = rolesAtHq
						self.rolesAtOther = rolesAtOther
					}
					
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
				
				
				public func get(categories: [ESI.Characters.CharacterID.Search.Categories], language: ESI.Search.Language? = nil, search: String, strict: Bool? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<Success>, AFError> {
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
					
					
					public var agent: [Int]?
					public var alliance: [Int]?
					public var character: [Int]?
					public var constellation: [Int]?
					public var corporation: [Int]?
					public var faction: [Int]?
					public var inventoryType: [Int]?
					public var region: [Int]?
					public var solarSystem: [Int]?
					public var station: [Int]?
					public var structure: [Int64]?
					public init(agent: [Int]?, alliance: [Int]?, character: [Int]?, constellation: [Int]?, corporation: [Int]?, faction: [Int]?, inventoryType: [Int]?, region: [Int]?, solarSystem: [Int]?, station: [Int]?, structure: [Int64]?) {
						self.agent = agent
						self.alliance = alliance
						self.character = character
						self.constellation = constellation
						self.corporation = corporation
						self.faction = faction
						self.inventoryType = inventoryType
						self.region = region
						self.solarSystem = solarSystem
						self.station = station
						self.structure = structure
					}
					
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
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<Success>, AFError> {
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
					
					
					public var shipItemID: Int64
					public var shipName: String
					public var shipTypeID: Int
					public init(shipItemID: Int64, shipName: String, shipTypeID: Int) {
						self.shipItemID = shipItemID
						self.shipName = shipName
						self.shipTypeID = shipTypeID
					}
					
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
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<[Success]>, AFError> {
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
					
					
					public var finishDate: Date?
					public var finishedLevel: Int
					public var levelEndSP: Int?
					public var levelStartSP: Int?
					public var queuePosition: Int
					public var skillID: Int
					public var startDate: Date?
					public var trainingStartSP: Int?
					public init(finishDate: Date?, finishedLevel: Int, levelEndSP: Int?, levelStartSP: Int?, queuePosition: Int, skillID: Int, startDate: Date?, trainingStartSP: Int?) {
						self.finishDate = finishDate
						self.finishedLevel = finishedLevel
						self.levelEndSP = levelEndSP
						self.levelStartSP = levelStartSP
						self.queuePosition = queuePosition
						self.skillID = skillID
						self.startDate = startDate
						self.trainingStartSP = trainingStartSP
					}
					
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
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<Success>, AFError> {
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
					
					
					public var activeSkillLevel: Int
					public var skillID: Int
					public var skillpointsInSkill: Int64
					public var trainedSkillLevel: Int
					public init(activeSkillLevel: Int, skillID: Int, skillpointsInSkill: Int64, trainedSkillLevel: Int) {
						self.activeSkillLevel = activeSkillLevel
						self.skillID = skillID
						self.skillpointsInSkill = skillpointsInSkill
						self.trainedSkillLevel = trainedSkillLevel
					}
					
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
					
					
					public var skills: [ESI.Characters.CharacterID.Skills.Skill]
					public var totalSP: Int64
					public var unallocatedSP: Int?
					public init(skills: [ESI.Characters.CharacterID.Skills.Skill], totalSP: Int64, unallocatedSP: Int?) {
						self.skills = skills
						self.totalSP = totalSP
						self.unallocatedSP = unallocatedSP
					}
					
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
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<[Success]>, AFError> {
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
					
					
					public var fromID: Int
					public var fromType: ESI.Characters.FromType
					public var standing: Double
					public init(fromID: Int, fromType: ESI.Characters.FromType, standing: Double) {
						self.fromID = fromID
						self.fromType = fromType
						self.standing = standing
					}
					
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
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<[Success]>, AFError> {
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
				
				
				
				
				
				
				public struct Isk: Codable, Hashable {
					
					
					public var `in`: Int64?
					public var out: Int64?
					public init(`in`: Int64?, out: Int64?) {
						self.`in` = `in`
						self.out = out
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case `in` = "in"
						case out
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct Market: Codable, Hashable {
					
					
					public var acceptContractsCourier: Int64?
					public var acceptContractsItemExchange: Int64?
					public var buyOrdersPlaced: Int64?
					public var cancelMarketOrder: Int64?
					public var createContractsAuction: Int64?
					public var createContractsCourier: Int64?
					public var createContractsItemExchange: Int64?
					public var deliverCourierContract: Int64?
					public var iskGained: Int64?
					public var iskSpent: Int64?
					public var modifyMarketOrder: Int64?
					public var searchContracts: Int64?
					public var sellOrdersPlaced: Int64?
					public init(acceptContractsCourier: Int64?, acceptContractsItemExchange: Int64?, buyOrdersPlaced: Int64?, cancelMarketOrder: Int64?, createContractsAuction: Int64?, createContractsCourier: Int64?, createContractsItemExchange: Int64?, deliverCourierContract: Int64?, iskGained: Int64?, iskSpent: Int64?, modifyMarketOrder: Int64?, searchContracts: Int64?, sellOrdersPlaced: Int64?) {
						self.acceptContractsCourier = acceptContractsCourier
						self.acceptContractsItemExchange = acceptContractsItemExchange
						self.buyOrdersPlaced = buyOrdersPlaced
						self.cancelMarketOrder = cancelMarketOrder
						self.createContractsAuction = createContractsAuction
						self.createContractsCourier = createContractsCourier
						self.createContractsItemExchange = createContractsItemExchange
						self.deliverCourierContract = deliverCourierContract
						self.iskGained = iskGained
						self.iskSpent = iskSpent
						self.modifyMarketOrder = modifyMarketOrder
						self.searchContracts = searchContracts
						self.sellOrdersPlaced = sellOrdersPlaced
					}
					
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
				
				public struct Travel: Codable, Hashable {
					
					
					public var accelerationGateActivations: Int64?
					public var alignTo: Int64?
					public var distanceWarpedHighSec: Int64?
					public var distanceWarpedLowSec: Int64?
					public var distanceWarpedNullSec: Int64?
					public var distanceWarpedWormhole: Int64?
					public var docksHighSec: Int64?
					public var docksLowSec: Int64?
					public var docksNullSec: Int64?
					public var jumpsStargateHighSec: Int64?
					public var jumpsStargateLowSec: Int64?
					public var jumpsStargateNullSec: Int64?
					public var jumpsWormhole: Int64?
					public var warpsHighSec: Int64?
					public var warpsLowSec: Int64?
					public var warpsNullSec: Int64?
					public var warpsToBookmark: Int64?
					public var warpsToCelestial: Int64?
					public var warpsToFleetMember: Int64?
					public var warpsToScanResult: Int64?
					public var warpsWormhole: Int64?
					public init(accelerationGateActivations: Int64?, alignTo: Int64?, distanceWarpedHighSec: Int64?, distanceWarpedLowSec: Int64?, distanceWarpedNullSec: Int64?, distanceWarpedWormhole: Int64?, docksHighSec: Int64?, docksLowSec: Int64?, docksNullSec: Int64?, jumpsStargateHighSec: Int64?, jumpsStargateLowSec: Int64?, jumpsStargateNullSec: Int64?, jumpsWormhole: Int64?, warpsHighSec: Int64?, warpsLowSec: Int64?, warpsNullSec: Int64?, warpsToBookmark: Int64?, warpsToCelestial: Int64?, warpsToFleetMember: Int64?, warpsToScanResult: Int64?, warpsWormhole: Int64?) {
						self.accelerationGateActivations = accelerationGateActivations
						self.alignTo = alignTo
						self.distanceWarpedHighSec = distanceWarpedHighSec
						self.distanceWarpedLowSec = distanceWarpedLowSec
						self.distanceWarpedNullSec = distanceWarpedNullSec
						self.distanceWarpedWormhole = distanceWarpedWormhole
						self.docksHighSec = docksHighSec
						self.docksLowSec = docksLowSec
						self.docksNullSec = docksNullSec
						self.jumpsStargateHighSec = jumpsStargateHighSec
						self.jumpsStargateLowSec = jumpsStargateLowSec
						self.jumpsStargateNullSec = jumpsStargateNullSec
						self.jumpsWormhole = jumpsWormhole
						self.warpsHighSec = warpsHighSec
						self.warpsLowSec = warpsLowSec
						self.warpsNullSec = warpsNullSec
						self.warpsToBookmark = warpsToBookmark
						self.warpsToCelestial = warpsToCelestial
						self.warpsToFleetMember = warpsToFleetMember
						self.warpsToScanResult = warpsToScanResult
						self.warpsWormhole = warpsWormhole
					}
					
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
				
				public struct Orbital: Codable, Hashable {
					
					
					public var strikeCharactersKilled: Int64?
					public var strikeDamageToPlayersArmorAmount: Int64?
					public var strikeDamageToPlayersShieldAmount: Int64?
					public init(strikeCharactersKilled: Int64?, strikeDamageToPlayersArmorAmount: Int64?, strikeDamageToPlayersShieldAmount: Int64?) {
						self.strikeCharactersKilled = strikeCharactersKilled
						self.strikeDamageToPlayersArmorAmount = strikeDamageToPlayersArmorAmount
						self.strikeDamageToPlayersShieldAmount = strikeDamageToPlayersShieldAmount
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case strikeCharactersKilled = "strike_characters_killed"
						case strikeDamageToPlayersArmorAmount = "strike_damage_to_players_armor_amount"
						case strikeDamageToPlayersShieldAmount = "strike_damage_to_players_shield_amount"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct Module: Codable, Hashable {
					
					
					public var activationsArmorHardener: Int64?
					public var activationsArmorRepairUnit: Int64?
					public var activationsArmorResistanceShiftHardener: Int64?
					public var activationsAutomatedTargetingSystem: Int64?
					public var activationsBastion: Int64?
					public var activationsBombLauncher: Int64?
					public var activationsCapacitorBooster: Int64?
					public var activationsCargoScanner: Int64?
					public var activationsCloakingDevice: Int64?
					public var activationsCloneVatBay: Int64?
					public var activationsCynosuralField: Int64?
					public var activationsDamageControl: Int64?
					public var activationsDataMiners: Int64?
					public var activationsDroneControlUnit: Int64?
					public var activationsDroneTrackingModules: Int64?
					public var activationsEccm: Int64?
					public var activationsEcm: Int64?
					public var activationsEcmBurst: Int64?
					public var activationsEnergyDestabilizer: Int64?
					public var activationsEnergyVampire: Int64?
					public var activationsEnergyWeapon: Int64?
					public var activationsFestivalLauncher: Int64?
					public var activationsFrequencyMiningLaser: Int64?
					public var activationsFueledArmorRepairer: Int64?
					public var activationsFueledShieldBooster: Int64?
					public var activationsGangCoordinator: Int64?
					public var activationsGasCloudHarvester: Int64?
					public var activationsHullRepairUnit: Int64?
					public var activationsHybridWeapon: Int64?
					public var activationsIndustrialCore: Int64?
					public var activationsInterdictionSphereLauncher: Int64?
					public var activationsMicroJumpDrive: Int64?
					public var activationsMiningLaser: Int64?
					public var activationsMissileLauncher: Int64?
					public var activationsPassiveTargetingSystem: Int64?
					public var activationsProbeLauncher: Int64?
					public var activationsProjectedEccm: Int64?
					public var activationsProjectileWeapon: Int64?
					public var activationsPropulsionModule: Int64?
					public var activationsRemoteArmorRepairer: Int64?
					public var activationsRemoteCapacitorTransmitter: Int64?
					public var activationsRemoteEcmBurst: Int64?
					public var activationsRemoteHullRepairer: Int64?
					public var activationsRemoteSensorBooster: Int64?
					public var activationsRemoteSensorDamper: Int64?
					public var activationsRemoteShieldBooster: Int64?
					public var activationsRemoteTrackingComputer: Int64?
					public var activationsSalvager: Int64?
					public var activationsSensorBooster: Int64?
					public var activationsShieldBooster: Int64?
					public var activationsShieldHardener: Int64?
					public var activationsShipScanner: Int64?
					public var activationsSiege: Int64?
					public var activationsSmartBomb: Int64?
					public var activationsStasisWeb: Int64?
					public var activationsStripMiner: Int64?
					public var activationsSuperWeapon: Int64?
					public var activationsSurveyScanner: Int64?
					public var activationsTargetBreaker: Int64?
					public var activationsTargetPainter: Int64?
					public var activationsTrackingComputer: Int64?
					public var activationsTrackingDisruptor: Int64?
					public var activationsTractorBeam: Int64?
					public var activationsTriage: Int64?
					public var activationsWarpDisruptFieldGenerator: Int64?
					public var activationsWarpScrambler: Int64?
					public var linkWeapons: Int64?
					public var overload: Int64?
					public var repairs: Int64?
					public init(activationsArmorHardener: Int64?, activationsArmorRepairUnit: Int64?, activationsArmorResistanceShiftHardener: Int64?, activationsAutomatedTargetingSystem: Int64?, activationsBastion: Int64?, activationsBombLauncher: Int64?, activationsCapacitorBooster: Int64?, activationsCargoScanner: Int64?, activationsCloakingDevice: Int64?, activationsCloneVatBay: Int64?, activationsCynosuralField: Int64?, activationsDamageControl: Int64?, activationsDataMiners: Int64?, activationsDroneControlUnit: Int64?, activationsDroneTrackingModules: Int64?, activationsEccm: Int64?, activationsEcm: Int64?, activationsEcmBurst: Int64?, activationsEnergyDestabilizer: Int64?, activationsEnergyVampire: Int64?, activationsEnergyWeapon: Int64?, activationsFestivalLauncher: Int64?, activationsFrequencyMiningLaser: Int64?, activationsFueledArmorRepairer: Int64?, activationsFueledShieldBooster: Int64?, activationsGangCoordinator: Int64?, activationsGasCloudHarvester: Int64?, activationsHullRepairUnit: Int64?, activationsHybridWeapon: Int64?, activationsIndustrialCore: Int64?, activationsInterdictionSphereLauncher: Int64?, activationsMicroJumpDrive: Int64?, activationsMiningLaser: Int64?, activationsMissileLauncher: Int64?, activationsPassiveTargetingSystem: Int64?, activationsProbeLauncher: Int64?, activationsProjectedEccm: Int64?, activationsProjectileWeapon: Int64?, activationsPropulsionModule: Int64?, activationsRemoteArmorRepairer: Int64?, activationsRemoteCapacitorTransmitter: Int64?, activationsRemoteEcmBurst: Int64?, activationsRemoteHullRepairer: Int64?, activationsRemoteSensorBooster: Int64?, activationsRemoteSensorDamper: Int64?, activationsRemoteShieldBooster: Int64?, activationsRemoteTrackingComputer: Int64?, activationsSalvager: Int64?, activationsSensorBooster: Int64?, activationsShieldBooster: Int64?, activationsShieldHardener: Int64?, activationsShipScanner: Int64?, activationsSiege: Int64?, activationsSmartBomb: Int64?, activationsStasisWeb: Int64?, activationsStripMiner: Int64?, activationsSuperWeapon: Int64?, activationsSurveyScanner: Int64?, activationsTargetBreaker: Int64?, activationsTargetPainter: Int64?, activationsTrackingComputer: Int64?, activationsTrackingDisruptor: Int64?, activationsTractorBeam: Int64?, activationsTriage: Int64?, activationsWarpDisruptFieldGenerator: Int64?, activationsWarpScrambler: Int64?, linkWeapons: Int64?, overload: Int64?, repairs: Int64?) {
						self.activationsArmorHardener = activationsArmorHardener
						self.activationsArmorRepairUnit = activationsArmorRepairUnit
						self.activationsArmorResistanceShiftHardener = activationsArmorResistanceShiftHardener
						self.activationsAutomatedTargetingSystem = activationsAutomatedTargetingSystem
						self.activationsBastion = activationsBastion
						self.activationsBombLauncher = activationsBombLauncher
						self.activationsCapacitorBooster = activationsCapacitorBooster
						self.activationsCargoScanner = activationsCargoScanner
						self.activationsCloakingDevice = activationsCloakingDevice
						self.activationsCloneVatBay = activationsCloneVatBay
						self.activationsCynosuralField = activationsCynosuralField
						self.activationsDamageControl = activationsDamageControl
						self.activationsDataMiners = activationsDataMiners
						self.activationsDroneControlUnit = activationsDroneControlUnit
						self.activationsDroneTrackingModules = activationsDroneTrackingModules
						self.activationsEccm = activationsEccm
						self.activationsEcm = activationsEcm
						self.activationsEcmBurst = activationsEcmBurst
						self.activationsEnergyDestabilizer = activationsEnergyDestabilizer
						self.activationsEnergyVampire = activationsEnergyVampire
						self.activationsEnergyWeapon = activationsEnergyWeapon
						self.activationsFestivalLauncher = activationsFestivalLauncher
						self.activationsFrequencyMiningLaser = activationsFrequencyMiningLaser
						self.activationsFueledArmorRepairer = activationsFueledArmorRepairer
						self.activationsFueledShieldBooster = activationsFueledShieldBooster
						self.activationsGangCoordinator = activationsGangCoordinator
						self.activationsGasCloudHarvester = activationsGasCloudHarvester
						self.activationsHullRepairUnit = activationsHullRepairUnit
						self.activationsHybridWeapon = activationsHybridWeapon
						self.activationsIndustrialCore = activationsIndustrialCore
						self.activationsInterdictionSphereLauncher = activationsInterdictionSphereLauncher
						self.activationsMicroJumpDrive = activationsMicroJumpDrive
						self.activationsMiningLaser = activationsMiningLaser
						self.activationsMissileLauncher = activationsMissileLauncher
						self.activationsPassiveTargetingSystem = activationsPassiveTargetingSystem
						self.activationsProbeLauncher = activationsProbeLauncher
						self.activationsProjectedEccm = activationsProjectedEccm
						self.activationsProjectileWeapon = activationsProjectileWeapon
						self.activationsPropulsionModule = activationsPropulsionModule
						self.activationsRemoteArmorRepairer = activationsRemoteArmorRepairer
						self.activationsRemoteCapacitorTransmitter = activationsRemoteCapacitorTransmitter
						self.activationsRemoteEcmBurst = activationsRemoteEcmBurst
						self.activationsRemoteHullRepairer = activationsRemoteHullRepairer
						self.activationsRemoteSensorBooster = activationsRemoteSensorBooster
						self.activationsRemoteSensorDamper = activationsRemoteSensorDamper
						self.activationsRemoteShieldBooster = activationsRemoteShieldBooster
						self.activationsRemoteTrackingComputer = activationsRemoteTrackingComputer
						self.activationsSalvager = activationsSalvager
						self.activationsSensorBooster = activationsSensorBooster
						self.activationsShieldBooster = activationsShieldBooster
						self.activationsShieldHardener = activationsShieldHardener
						self.activationsShipScanner = activationsShipScanner
						self.activationsSiege = activationsSiege
						self.activationsSmartBomb = activationsSmartBomb
						self.activationsStasisWeb = activationsStasisWeb
						self.activationsStripMiner = activationsStripMiner
						self.activationsSuperWeapon = activationsSuperWeapon
						self.activationsSurveyScanner = activationsSurveyScanner
						self.activationsTargetBreaker = activationsTargetBreaker
						self.activationsTargetPainter = activationsTargetPainter
						self.activationsTrackingComputer = activationsTrackingComputer
						self.activationsTrackingDisruptor = activationsTrackingDisruptor
						self.activationsTractorBeam = activationsTractorBeam
						self.activationsTriage = activationsTriage
						self.activationsWarpDisruptFieldGenerator = activationsWarpDisruptFieldGenerator
						self.activationsWarpScrambler = activationsWarpScrambler
						self.linkWeapons = linkWeapons
						self.overload = overload
						self.repairs = repairs
					}
					
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
				
				public struct Mining: Codable, Hashable {
					
					
					public var droneMine: Int64?
					public var oreArkonor: Int64?
					public var oreBistot: Int64?
					public var oreCrokite: Int64?
					public var oreDarkOchre: Int64?
					public var oreGneiss: Int64?
					public var oreHarvestableCloud: Int64?
					public var oreHedbergite: Int64?
					public var oreHemorphite: Int64?
					public var oreIce: Int64?
					public var oreJaspet: Int64?
					public var oreKernite: Int64?
					public var oreMercoxit: Int64?
					public var oreOmber: Int64?
					public var orePlagioclase: Int64?
					public var orePyroxeres: Int64?
					public var oreScordite: Int64?
					public var oreSpodumain: Int64?
					public var oreVeldspar: Int64?
					public init(droneMine: Int64?, oreArkonor: Int64?, oreBistot: Int64?, oreCrokite: Int64?, oreDarkOchre: Int64?, oreGneiss: Int64?, oreHarvestableCloud: Int64?, oreHedbergite: Int64?, oreHemorphite: Int64?, oreIce: Int64?, oreJaspet: Int64?, oreKernite: Int64?, oreMercoxit: Int64?, oreOmber: Int64?, orePlagioclase: Int64?, orePyroxeres: Int64?, oreScordite: Int64?, oreSpodumain: Int64?, oreVeldspar: Int64?) {
						self.droneMine = droneMine
						self.oreArkonor = oreArkonor
						self.oreBistot = oreBistot
						self.oreCrokite = oreCrokite
						self.oreDarkOchre = oreDarkOchre
						self.oreGneiss = oreGneiss
						self.oreHarvestableCloud = oreHarvestableCloud
						self.oreHedbergite = oreHedbergite
						self.oreHemorphite = oreHemorphite
						self.oreIce = oreIce
						self.oreJaspet = oreJaspet
						self.oreKernite = oreKernite
						self.oreMercoxit = oreMercoxit
						self.oreOmber = oreOmber
						self.orePlagioclase = orePlagioclase
						self.orePyroxeres = orePyroxeres
						self.oreScordite = oreScordite
						self.oreSpodumain = oreSpodumain
						self.oreVeldspar = oreVeldspar
					}
					
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
				
				public struct Success: Codable, Hashable {
					
					
					public var character: ESI.Characters.CharacterID.Stats.Character?
					public var combat: ESI.Characters.CharacterID.Stats.Combat?
					public var industry: ESI.Characters.CharacterID.Stats.Industry?
					public var inventory: ESI.Characters.CharacterID.Stats.Inventory?
					public var isk: ESI.Characters.CharacterID.Stats.Isk?
					public var market: ESI.Characters.CharacterID.Stats.Market?
					public var mining: ESI.Characters.CharacterID.Stats.Mining?
					public var module: ESI.Characters.CharacterID.Stats.Module?
					public var orbital: ESI.Characters.CharacterID.Stats.Orbital?
					public var pve: ESI.Characters.CharacterID.Stats.Pve?
					public var social: ESI.Characters.CharacterID.Stats.Social?
					public var travel: ESI.Characters.CharacterID.Stats.Travel?
					public var year: Int
					public init(character: ESI.Characters.CharacterID.Stats.Character?, combat: ESI.Characters.CharacterID.Stats.Combat?, industry: ESI.Characters.CharacterID.Stats.Industry?, inventory: ESI.Characters.CharacterID.Stats.Inventory?, isk: ESI.Characters.CharacterID.Stats.Isk?, market: ESI.Characters.CharacterID.Stats.Market?, mining: ESI.Characters.CharacterID.Stats.Mining?, module: ESI.Characters.CharacterID.Stats.Module?, orbital: ESI.Characters.CharacterID.Stats.Orbital?, pve: ESI.Characters.CharacterID.Stats.Pve?, social: ESI.Characters.CharacterID.Stats.Social?, travel: ESI.Characters.CharacterID.Stats.Travel?, year: Int) {
						self.character = character
						self.combat = combat
						self.industry = industry
						self.inventory = inventory
						self.isk = isk
						self.market = market
						self.mining = mining
						self.module = module
						self.orbital = orbital
						self.pve = pve
						self.social = social
						self.travel = travel
						self.year = year
					}
					
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
				
				public struct Pve: Codable, Hashable {
					
					
					public var dungeonsCompletedAgent: Int64?
					public var dungeonsCompletedDistribution: Int64?
					public var missionsSucceeded: Int64?
					public var missionsSucceededEpicArc: Int64?
					public init(dungeonsCompletedAgent: Int64?, dungeonsCompletedDistribution: Int64?, missionsSucceeded: Int64?, missionsSucceededEpicArc: Int64?) {
						self.dungeonsCompletedAgent = dungeonsCompletedAgent
						self.dungeonsCompletedDistribution = dungeonsCompletedDistribution
						self.missionsSucceeded = missionsSucceeded
						self.missionsSucceededEpicArc = missionsSucceededEpicArc
					}
					
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
				
				public struct Combat: Codable, Hashable {
					
					
					public var capDrainedbyNpc: Int64?
					public var capDrainedbyPc: Int64?
					public var capDrainingPc: Int64?
					public var criminalFlagSet: Int64?
					public var damageFromNpCsAmount: Int64?
					public var damageFromNpCsNumShots: Int64?
					public var damageFromPlayersBombAmount: Int64?
					public var damageFromPlayersBombNumShots: Int64?
					public var damageFromPlayersCombatDroneAmount: Int64?
					public var damageFromPlayersCombatDroneNumShots: Int64?
					public var damageFromPlayersEnergyAmount: Int64?
					public var damageFromPlayersEnergyNumShots: Int64?
					public var damageFromPlayersFighterBomberAmount: Int64?
					public var damageFromPlayersFighterBomberNumShots: Int64?
					public var damageFromPlayersFighterDroneAmount: Int64?
					public var damageFromPlayersFighterDroneNumShots: Int64?
					public var damageFromPlayersHybridAmount: Int64?
					public var damageFromPlayersHybridNumShots: Int64?
					public var damageFromPlayersMissileAmount: Int64?
					public var damageFromPlayersMissileNumShots: Int64?
					public var damageFromPlayersProjectileAmount: Int64?
					public var damageFromPlayersProjectileNumShots: Int64?
					public var damageFromPlayersSmartBombAmount: Int64?
					public var damageFromPlayersSmartBombNumShots: Int64?
					public var damageFromPlayersSuperAmount: Int64?
					public var damageFromPlayersSuperNumShots: Int64?
					public var damageFromStructuresTotalAmount: Int64?
					public var damageFromStructuresTotalNumShots: Int64?
					public var damageToPlayersBombAmount: Int64?
					public var damageToPlayersBombNumShots: Int64?
					public var damageToPlayersCombatDroneAmount: Int64?
					public var damageToPlayersCombatDroneNumShots: Int64?
					public var damageToPlayersEnergyAmount: Int64?
					public var damageToPlayersEnergyNumShots: Int64?
					public var damageToPlayersFighterBomberAmount: Int64?
					public var damageToPlayersFighterBomberNumShots: Int64?
					public var damageToPlayersFighterDroneAmount: Int64?
					public var damageToPlayersFighterDroneNumShots: Int64?
					public var damageToPlayersHybridAmount: Int64?
					public var damageToPlayersHybridNumShots: Int64?
					public var damageToPlayersMissileAmount: Int64?
					public var damageToPlayersMissileNumShots: Int64?
					public var damageToPlayersProjectileAmount: Int64?
					public var damageToPlayersProjectileNumShots: Int64?
					public var damageToPlayersSmartBombAmount: Int64?
					public var damageToPlayersSmartBombNumShots: Int64?
					public var damageToPlayersSuperAmount: Int64?
					public var damageToPlayersSuperNumShots: Int64?
					public var damageToStructuresTotalAmount: Int64?
					public var damageToStructuresTotalNumShots: Int64?
					public var deathsHighSec: Int64?
					public var deathsLowSec: Int64?
					public var deathsNullSec: Int64?
					public var deathsPodHighSec: Int64?
					public var deathsPodLowSec: Int64?
					public var deathsPodNullSec: Int64?
					public var deathsPodWormhole: Int64?
					public var deathsWormhole: Int64?
					public var droneEngage: Int64?
					public var dscans: Int64?
					public var duelRequested: Int64?
					public var engagementRegister: Int64?
					public var killsAssists: Int64?
					public var killsHighSec: Int64?
					public var killsLowSec: Int64?
					public var killsNullSec: Int64?
					public var killsPodHighSec: Int64?
					public var killsPodLowSec: Int64?
					public var killsPodNullSec: Int64?
					public var killsPodWormhole: Int64?
					public var killsWormhole: Int64?
					public var npcFlagSet: Int64?
					public var probeScans: Int64?
					public var pvpFlagSet: Int64?
					public var repairArmorByRemoteAmount: Int64?
					public var repairArmorRemoteAmount: Int64?
					public var repairArmorSelfAmount: Int64?
					public var repairCapacitorByRemoteAmount: Int64?
					public var repairCapacitorRemoteAmount: Int64?
					public var repairCapacitorSelfAmount: Int64?
					public var repairHullByRemoteAmount: Int64?
					public var repairHullRemoteAmount: Int64?
					public var repairHullSelfAmount: Int64?
					public var repairShieldByRemoteAmount: Int64?
					public var repairShieldRemoteAmount: Int64?
					public var repairShieldSelfAmount: Int64?
					public var selfDestructs: Int64?
					public var warpScramblePc: Int64?
					public var warpScrambledbyNpc: Int64?
					public var warpScrambledbyPc: Int64?
					public var weaponFlagSet: Int64?
					public var webifiedbyNpc: Int64?
					public var webifiedbyPc: Int64?
					public var webifyingPc: Int64?
					public init(capDrainedbyNpc: Int64?, capDrainedbyPc: Int64?, capDrainingPc: Int64?, criminalFlagSet: Int64?, damageFromNpCsAmount: Int64?, damageFromNpCsNumShots: Int64?, damageFromPlayersBombAmount: Int64?, damageFromPlayersBombNumShots: Int64?, damageFromPlayersCombatDroneAmount: Int64?, damageFromPlayersCombatDroneNumShots: Int64?, damageFromPlayersEnergyAmount: Int64?, damageFromPlayersEnergyNumShots: Int64?, damageFromPlayersFighterBomberAmount: Int64?, damageFromPlayersFighterBomberNumShots: Int64?, damageFromPlayersFighterDroneAmount: Int64?, damageFromPlayersFighterDroneNumShots: Int64?, damageFromPlayersHybridAmount: Int64?, damageFromPlayersHybridNumShots: Int64?, damageFromPlayersMissileAmount: Int64?, damageFromPlayersMissileNumShots: Int64?, damageFromPlayersProjectileAmount: Int64?, damageFromPlayersProjectileNumShots: Int64?, damageFromPlayersSmartBombAmount: Int64?, damageFromPlayersSmartBombNumShots: Int64?, damageFromPlayersSuperAmount: Int64?, damageFromPlayersSuperNumShots: Int64?, damageFromStructuresTotalAmount: Int64?, damageFromStructuresTotalNumShots: Int64?, damageToPlayersBombAmount: Int64?, damageToPlayersBombNumShots: Int64?, damageToPlayersCombatDroneAmount: Int64?, damageToPlayersCombatDroneNumShots: Int64?, damageToPlayersEnergyAmount: Int64?, damageToPlayersEnergyNumShots: Int64?, damageToPlayersFighterBomberAmount: Int64?, damageToPlayersFighterBomberNumShots: Int64?, damageToPlayersFighterDroneAmount: Int64?, damageToPlayersFighterDroneNumShots: Int64?, damageToPlayersHybridAmount: Int64?, damageToPlayersHybridNumShots: Int64?, damageToPlayersMissileAmount: Int64?, damageToPlayersMissileNumShots: Int64?, damageToPlayersProjectileAmount: Int64?, damageToPlayersProjectileNumShots: Int64?, damageToPlayersSmartBombAmount: Int64?, damageToPlayersSmartBombNumShots: Int64?, damageToPlayersSuperAmount: Int64?, damageToPlayersSuperNumShots: Int64?, damageToStructuresTotalAmount: Int64?, damageToStructuresTotalNumShots: Int64?, deathsHighSec: Int64?, deathsLowSec: Int64?, deathsNullSec: Int64?, deathsPodHighSec: Int64?, deathsPodLowSec: Int64?, deathsPodNullSec: Int64?, deathsPodWormhole: Int64?, deathsWormhole: Int64?, droneEngage: Int64?, dscans: Int64?, duelRequested: Int64?, engagementRegister: Int64?, killsAssists: Int64?, killsHighSec: Int64?, killsLowSec: Int64?, killsNullSec: Int64?, killsPodHighSec: Int64?, killsPodLowSec: Int64?, killsPodNullSec: Int64?, killsPodWormhole: Int64?, killsWormhole: Int64?, npcFlagSet: Int64?, probeScans: Int64?, pvpFlagSet: Int64?, repairArmorByRemoteAmount: Int64?, repairArmorRemoteAmount: Int64?, repairArmorSelfAmount: Int64?, repairCapacitorByRemoteAmount: Int64?, repairCapacitorRemoteAmount: Int64?, repairCapacitorSelfAmount: Int64?, repairHullByRemoteAmount: Int64?, repairHullRemoteAmount: Int64?, repairHullSelfAmount: Int64?, repairShieldByRemoteAmount: Int64?, repairShieldRemoteAmount: Int64?, repairShieldSelfAmount: Int64?, selfDestructs: Int64?, warpScramblePc: Int64?, warpScrambledbyNpc: Int64?, warpScrambledbyPc: Int64?, weaponFlagSet: Int64?, webifiedbyNpc: Int64?, webifiedbyPc: Int64?, webifyingPc: Int64?) {
						self.capDrainedbyNpc = capDrainedbyNpc
						self.capDrainedbyPc = capDrainedbyPc
						self.capDrainingPc = capDrainingPc
						self.criminalFlagSet = criminalFlagSet
						self.damageFromNpCsAmount = damageFromNpCsAmount
						self.damageFromNpCsNumShots = damageFromNpCsNumShots
						self.damageFromPlayersBombAmount = damageFromPlayersBombAmount
						self.damageFromPlayersBombNumShots = damageFromPlayersBombNumShots
						self.damageFromPlayersCombatDroneAmount = damageFromPlayersCombatDroneAmount
						self.damageFromPlayersCombatDroneNumShots = damageFromPlayersCombatDroneNumShots
						self.damageFromPlayersEnergyAmount = damageFromPlayersEnergyAmount
						self.damageFromPlayersEnergyNumShots = damageFromPlayersEnergyNumShots
						self.damageFromPlayersFighterBomberAmount = damageFromPlayersFighterBomberAmount
						self.damageFromPlayersFighterBomberNumShots = damageFromPlayersFighterBomberNumShots
						self.damageFromPlayersFighterDroneAmount = damageFromPlayersFighterDroneAmount
						self.damageFromPlayersFighterDroneNumShots = damageFromPlayersFighterDroneNumShots
						self.damageFromPlayersHybridAmount = damageFromPlayersHybridAmount
						self.damageFromPlayersHybridNumShots = damageFromPlayersHybridNumShots
						self.damageFromPlayersMissileAmount = damageFromPlayersMissileAmount
						self.damageFromPlayersMissileNumShots = damageFromPlayersMissileNumShots
						self.damageFromPlayersProjectileAmount = damageFromPlayersProjectileAmount
						self.damageFromPlayersProjectileNumShots = damageFromPlayersProjectileNumShots
						self.damageFromPlayersSmartBombAmount = damageFromPlayersSmartBombAmount
						self.damageFromPlayersSmartBombNumShots = damageFromPlayersSmartBombNumShots
						self.damageFromPlayersSuperAmount = damageFromPlayersSuperAmount
						self.damageFromPlayersSuperNumShots = damageFromPlayersSuperNumShots
						self.damageFromStructuresTotalAmount = damageFromStructuresTotalAmount
						self.damageFromStructuresTotalNumShots = damageFromStructuresTotalNumShots
						self.damageToPlayersBombAmount = damageToPlayersBombAmount
						self.damageToPlayersBombNumShots = damageToPlayersBombNumShots
						self.damageToPlayersCombatDroneAmount = damageToPlayersCombatDroneAmount
						self.damageToPlayersCombatDroneNumShots = damageToPlayersCombatDroneNumShots
						self.damageToPlayersEnergyAmount = damageToPlayersEnergyAmount
						self.damageToPlayersEnergyNumShots = damageToPlayersEnergyNumShots
						self.damageToPlayersFighterBomberAmount = damageToPlayersFighterBomberAmount
						self.damageToPlayersFighterBomberNumShots = damageToPlayersFighterBomberNumShots
						self.damageToPlayersFighterDroneAmount = damageToPlayersFighterDroneAmount
						self.damageToPlayersFighterDroneNumShots = damageToPlayersFighterDroneNumShots
						self.damageToPlayersHybridAmount = damageToPlayersHybridAmount
						self.damageToPlayersHybridNumShots = damageToPlayersHybridNumShots
						self.damageToPlayersMissileAmount = damageToPlayersMissileAmount
						self.damageToPlayersMissileNumShots = damageToPlayersMissileNumShots
						self.damageToPlayersProjectileAmount = damageToPlayersProjectileAmount
						self.damageToPlayersProjectileNumShots = damageToPlayersProjectileNumShots
						self.damageToPlayersSmartBombAmount = damageToPlayersSmartBombAmount
						self.damageToPlayersSmartBombNumShots = damageToPlayersSmartBombNumShots
						self.damageToPlayersSuperAmount = damageToPlayersSuperAmount
						self.damageToPlayersSuperNumShots = damageToPlayersSuperNumShots
						self.damageToStructuresTotalAmount = damageToStructuresTotalAmount
						self.damageToStructuresTotalNumShots = damageToStructuresTotalNumShots
						self.deathsHighSec = deathsHighSec
						self.deathsLowSec = deathsLowSec
						self.deathsNullSec = deathsNullSec
						self.deathsPodHighSec = deathsPodHighSec
						self.deathsPodLowSec = deathsPodLowSec
						self.deathsPodNullSec = deathsPodNullSec
						self.deathsPodWormhole = deathsPodWormhole
						self.deathsWormhole = deathsWormhole
						self.droneEngage = droneEngage
						self.dscans = dscans
						self.duelRequested = duelRequested
						self.engagementRegister = engagementRegister
						self.killsAssists = killsAssists
						self.killsHighSec = killsHighSec
						self.killsLowSec = killsLowSec
						self.killsNullSec = killsNullSec
						self.killsPodHighSec = killsPodHighSec
						self.killsPodLowSec = killsPodLowSec
						self.killsPodNullSec = killsPodNullSec
						self.killsPodWormhole = killsPodWormhole
						self.killsWormhole = killsWormhole
						self.npcFlagSet = npcFlagSet
						self.probeScans = probeScans
						self.pvpFlagSet = pvpFlagSet
						self.repairArmorByRemoteAmount = repairArmorByRemoteAmount
						self.repairArmorRemoteAmount = repairArmorRemoteAmount
						self.repairArmorSelfAmount = repairArmorSelfAmount
						self.repairCapacitorByRemoteAmount = repairCapacitorByRemoteAmount
						self.repairCapacitorRemoteAmount = repairCapacitorRemoteAmount
						self.repairCapacitorSelfAmount = repairCapacitorSelfAmount
						self.repairHullByRemoteAmount = repairHullByRemoteAmount
						self.repairHullRemoteAmount = repairHullRemoteAmount
						self.repairHullSelfAmount = repairHullSelfAmount
						self.repairShieldByRemoteAmount = repairShieldByRemoteAmount
						self.repairShieldRemoteAmount = repairShieldRemoteAmount
						self.repairShieldSelfAmount = repairShieldSelfAmount
						self.selfDestructs = selfDestructs
						self.warpScramblePc = warpScramblePc
						self.warpScrambledbyNpc = warpScrambledbyNpc
						self.warpScrambledbyPc = warpScrambledbyPc
						self.weaponFlagSet = weaponFlagSet
						self.webifiedbyNpc = webifiedbyNpc
						self.webifiedbyPc = webifiedbyPc
						self.webifyingPc = webifyingPc
					}
					
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
				
				public struct Inventory: Codable, Hashable {
					
					
					public var abandonLootQuantity: Int64?
					public var trashItemQuantity: Int64?
					public init(abandonLootQuantity: Int64?, trashItemQuantity: Int64?) {
						self.abandonLootQuantity = abandonLootQuantity
						self.trashItemQuantity = trashItemQuantity
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case abandonLootQuantity = "abandon_loot_quantity"
						case trashItemQuantity = "trash_item_quantity"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct Character: Codable, Hashable {
					
					
					public var daysOfActivity: Int64?
					public var minutes: Int64?
					public var sessionsStarted: Int64?
					public init(daysOfActivity: Int64?, minutes: Int64?, sessionsStarted: Int64?) {
						self.daysOfActivity = daysOfActivity
						self.minutes = minutes
						self.sessionsStarted = sessionsStarted
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case daysOfActivity = "days_of_activity"
						case minutes
						case sessionsStarted = "sessions_started"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct Industry: Codable, Hashable {
					
					
					public var hackingSuccesses: Int64?
					public var jobsCancelled: Int64?
					public var jobsCompletedCopyBlueprint: Int64?
					public var jobsCompletedInvention: Int64?
					public var jobsCompletedManufacture: Int64?
					public var jobsCompletedManufactureAsteroid: Int64?
					public var jobsCompletedManufactureAsteroidQuantity: Int64?
					public var jobsCompletedManufactureCharge: Int64?
					public var jobsCompletedManufactureChargeQuantity: Int64?
					public var jobsCompletedManufactureCommodity: Int64?
					public var jobsCompletedManufactureCommodityQuantity: Int64?
					public var jobsCompletedManufactureDeployable: Int64?
					public var jobsCompletedManufactureDeployableQuantity: Int64?
					public var jobsCompletedManufactureDrone: Int64?
					public var jobsCompletedManufactureDroneQuantity: Int64?
					public var jobsCompletedManufactureImplant: Int64?
					public var jobsCompletedManufactureImplantQuantity: Int64?
					public var jobsCompletedManufactureModule: Int64?
					public var jobsCompletedManufactureModuleQuantity: Int64?
					public var jobsCompletedManufactureOther: Int64?
					public var jobsCompletedManufactureOtherQuantity: Int64?
					public var jobsCompletedManufactureShip: Int64?
					public var jobsCompletedManufactureShipQuantity: Int64?
					public var jobsCompletedManufactureStructure: Int64?
					public var jobsCompletedManufactureStructureQuantity: Int64?
					public var jobsCompletedManufactureSubsystem: Int64?
					public var jobsCompletedManufactureSubsystemQuantity: Int64?
					public var jobsCompletedMaterialProductivity: Int64?
					public var jobsCompletedTimeProductivity: Int64?
					public var jobsStartedCopyBlueprint: Int64?
					public var jobsStartedInvention: Int64?
					public var jobsStartedManufacture: Int64?
					public var jobsStartedMaterialProductivity: Int64?
					public var jobsStartedTimeProductivity: Int64?
					public var reprocessItem: Int64?
					public var reprocessItemQuantity: Int64?
					public init(hackingSuccesses: Int64?, jobsCancelled: Int64?, jobsCompletedCopyBlueprint: Int64?, jobsCompletedInvention: Int64?, jobsCompletedManufacture: Int64?, jobsCompletedManufactureAsteroid: Int64?, jobsCompletedManufactureAsteroidQuantity: Int64?, jobsCompletedManufactureCharge: Int64?, jobsCompletedManufactureChargeQuantity: Int64?, jobsCompletedManufactureCommodity: Int64?, jobsCompletedManufactureCommodityQuantity: Int64?, jobsCompletedManufactureDeployable: Int64?, jobsCompletedManufactureDeployableQuantity: Int64?, jobsCompletedManufactureDrone: Int64?, jobsCompletedManufactureDroneQuantity: Int64?, jobsCompletedManufactureImplant: Int64?, jobsCompletedManufactureImplantQuantity: Int64?, jobsCompletedManufactureModule: Int64?, jobsCompletedManufactureModuleQuantity: Int64?, jobsCompletedManufactureOther: Int64?, jobsCompletedManufactureOtherQuantity: Int64?, jobsCompletedManufactureShip: Int64?, jobsCompletedManufactureShipQuantity: Int64?, jobsCompletedManufactureStructure: Int64?, jobsCompletedManufactureStructureQuantity: Int64?, jobsCompletedManufactureSubsystem: Int64?, jobsCompletedManufactureSubsystemQuantity: Int64?, jobsCompletedMaterialProductivity: Int64?, jobsCompletedTimeProductivity: Int64?, jobsStartedCopyBlueprint: Int64?, jobsStartedInvention: Int64?, jobsStartedManufacture: Int64?, jobsStartedMaterialProductivity: Int64?, jobsStartedTimeProductivity: Int64?, reprocessItem: Int64?, reprocessItemQuantity: Int64?) {
						self.hackingSuccesses = hackingSuccesses
						self.jobsCancelled = jobsCancelled
						self.jobsCompletedCopyBlueprint = jobsCompletedCopyBlueprint
						self.jobsCompletedInvention = jobsCompletedInvention
						self.jobsCompletedManufacture = jobsCompletedManufacture
						self.jobsCompletedManufactureAsteroid = jobsCompletedManufactureAsteroid
						self.jobsCompletedManufactureAsteroidQuantity = jobsCompletedManufactureAsteroidQuantity
						self.jobsCompletedManufactureCharge = jobsCompletedManufactureCharge
						self.jobsCompletedManufactureChargeQuantity = jobsCompletedManufactureChargeQuantity
						self.jobsCompletedManufactureCommodity = jobsCompletedManufactureCommodity
						self.jobsCompletedManufactureCommodityQuantity = jobsCompletedManufactureCommodityQuantity
						self.jobsCompletedManufactureDeployable = jobsCompletedManufactureDeployable
						self.jobsCompletedManufactureDeployableQuantity = jobsCompletedManufactureDeployableQuantity
						self.jobsCompletedManufactureDrone = jobsCompletedManufactureDrone
						self.jobsCompletedManufactureDroneQuantity = jobsCompletedManufactureDroneQuantity
						self.jobsCompletedManufactureImplant = jobsCompletedManufactureImplant
						self.jobsCompletedManufactureImplantQuantity = jobsCompletedManufactureImplantQuantity
						self.jobsCompletedManufactureModule = jobsCompletedManufactureModule
						self.jobsCompletedManufactureModuleQuantity = jobsCompletedManufactureModuleQuantity
						self.jobsCompletedManufactureOther = jobsCompletedManufactureOther
						self.jobsCompletedManufactureOtherQuantity = jobsCompletedManufactureOtherQuantity
						self.jobsCompletedManufactureShip = jobsCompletedManufactureShip
						self.jobsCompletedManufactureShipQuantity = jobsCompletedManufactureShipQuantity
						self.jobsCompletedManufactureStructure = jobsCompletedManufactureStructure
						self.jobsCompletedManufactureStructureQuantity = jobsCompletedManufactureStructureQuantity
						self.jobsCompletedManufactureSubsystem = jobsCompletedManufactureSubsystem
						self.jobsCompletedManufactureSubsystemQuantity = jobsCompletedManufactureSubsystemQuantity
						self.jobsCompletedMaterialProductivity = jobsCompletedMaterialProductivity
						self.jobsCompletedTimeProductivity = jobsCompletedTimeProductivity
						self.jobsStartedCopyBlueprint = jobsStartedCopyBlueprint
						self.jobsStartedInvention = jobsStartedInvention
						self.jobsStartedManufacture = jobsStartedManufacture
						self.jobsStartedMaterialProductivity = jobsStartedMaterialProductivity
						self.jobsStartedTimeProductivity = jobsStartedTimeProductivity
						self.reprocessItem = reprocessItem
						self.reprocessItemQuantity = reprocessItemQuantity
					}
					
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
				
				public struct Social: Codable, Hashable {
					
					
					public var addContactBad: Int64?
					public var addContactGood: Int64?
					public var addContactHigh: Int64?
					public var addContactHorrible: Int64?
					public var addContactNeutral: Int64?
					public var addNote: Int64?
					public var addedAsContactBad: Int64?
					public var addedAsContactGood: Int64?
					public var addedAsContactHigh: Int64?
					public var addedAsContactHorrible: Int64?
					public var addedAsContactNeutral: Int64?
					public var calendarEventCreated: Int64?
					public var chatMessagesAlliance: Int64?
					public var chatMessagesConstellation: Int64?
					public var chatMessagesCorporation: Int64?
					public var chatMessagesFleet: Int64?
					public var chatMessagesRegion: Int64?
					public var chatMessagesSolarsystem: Int64?
					public var chatMessagesWarfaction: Int64?
					public var chatTotalMessageLength: Int64?
					public var directTrades: Int64?
					public var fleetBroadcasts: Int64?
					public var fleetJoins: Int64?
					public var mailsReceived: Int64?
					public var mailsSent: Int64?
					public init(addContactBad: Int64?, addContactGood: Int64?, addContactHigh: Int64?, addContactHorrible: Int64?, addContactNeutral: Int64?, addNote: Int64?, addedAsContactBad: Int64?, addedAsContactGood: Int64?, addedAsContactHigh: Int64?, addedAsContactHorrible: Int64?, addedAsContactNeutral: Int64?, calendarEventCreated: Int64?, chatMessagesAlliance: Int64?, chatMessagesConstellation: Int64?, chatMessagesCorporation: Int64?, chatMessagesFleet: Int64?, chatMessagesRegion: Int64?, chatMessagesSolarsystem: Int64?, chatMessagesWarfaction: Int64?, chatTotalMessageLength: Int64?, directTrades: Int64?, fleetBroadcasts: Int64?, fleetJoins: Int64?, mailsReceived: Int64?, mailsSent: Int64?) {
						self.addContactBad = addContactBad
						self.addContactGood = addContactGood
						self.addContactHigh = addContactHigh
						self.addContactHorrible = addContactHorrible
						self.addContactNeutral = addContactNeutral
						self.addNote = addNote
						self.addedAsContactBad = addedAsContactBad
						self.addedAsContactGood = addedAsContactGood
						self.addedAsContactHigh = addedAsContactHigh
						self.addedAsContactHorrible = addedAsContactHorrible
						self.addedAsContactNeutral = addedAsContactNeutral
						self.calendarEventCreated = calendarEventCreated
						self.chatMessagesAlliance = chatMessagesAlliance
						self.chatMessagesConstellation = chatMessagesConstellation
						self.chatMessagesCorporation = chatMessagesCorporation
						self.chatMessagesFleet = chatMessagesFleet
						self.chatMessagesRegion = chatMessagesRegion
						self.chatMessagesSolarsystem = chatMessagesSolarsystem
						self.chatMessagesWarfaction = chatMessagesWarfaction
						self.chatTotalMessageLength = chatTotalMessageLength
						self.directTrades = directTrades
						self.fleetBroadcasts = fleetBroadcasts
						self.fleetJoins = fleetJoins
						self.mailsReceived = mailsReceived
						self.mailsSent = mailsSent
					}
					
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
				
			}
			
			public struct Titles {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<[Success]>, AFError> {
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
					
					
					public var name: String?
					public var titleID: Int?
					public init(name: String?, titleID: Int?) {
						self.name = name
						self.titleID = titleID
					}
					
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
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<Double>, AFError> {
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
					
					
					public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<[Success]>, AFError> {
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
					
					
					
					
					
					
					public struct Success: Codable, Hashable {
						
						
						public var amount: Double?
						public var balance: Double?
						public var contextID: Int64?
						public var contextIDType: ESI.Characters.ContextIDType?
						public var date: Date
						public var localizedDescription: String
						public var firstPartyID: Int?
						public var id: Int64
						public var reason: String?
						public var refType: ESI.Characters.CharacterID.Wallet.Journal.RefType
						public var secondPartyID: Int?
						public var tax: Double?
						public var taxReceiverID: Int?
						public init(amount: Double?, balance: Double?, contextID: Int64?, contextIDType: ESI.Characters.ContextIDType?, date: Date, localizedDescription: String, firstPartyID: Int?, id: Int64, reason: String?, refType: ESI.Characters.CharacterID.Wallet.Journal.RefType, secondPartyID: Int?, tax: Double?, taxReceiverID: Int?) {
							self.amount = amount
							self.balance = balance
							self.contextID = contextID
							self.contextIDType = contextIDType
							self.date = date
							self.localizedDescription = localizedDescription
							self.firstPartyID = firstPartyID
							self.id = id
							self.reason = reason
							self.refType = refType
							self.secondPartyID = secondPartyID
							self.tax = tax
							self.taxReceiverID = taxReceiverID
						}
						
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
					
				}
				
				public struct Transactions {
					let esi: ESI
					let route: APIRoute
					
					
					public func get(fromID: Int64?, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<[Success]>, AFError> {
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
						
						
						public var clientID: Int
						public var date: Date
						public var isBuy: Bool
						public var isPersonal: Bool
						public var journalRefID: Int64
						public var locationID: Int64
						public var quantity: Int
						public var transactionID: Int64
						public var typeID: Int
						public var unitPrice: Double
						public init(clientID: Int, date: Date, isBuy: Bool, isPersonal: Bool, journalRefID: Int64, locationID: Int64, quantity: Int, transactionID: Int64, typeID: Int, unitPrice: Double) {
							self.clientID = clientID
							self.date = date
							self.isBuy = isBuy
							self.isPersonal = isPersonal
							self.journalRefID = journalRefID
							self.locationID = locationID
							self.quantity = quantity
							self.transactionID = transactionID
							self.typeID = typeID
							self.unitPrice = unitPrice
						}
						
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
				
				
				public var allianceID: Int?
				public var ancestryID: Int?
				public var birthday: Date
				public var bloodlineID: Int
				public var corporationID: Int
				public var localizedDescription: String?
				public var factionID: Int?
				public var gender: ESI.Characters.CharacterID.Gender
				public var name: String
				public var raceID: Int
				public var securityStatus: Double?
				public var title: String?
				public init(allianceID: Int?, ancestryID: Int?, birthday: Date, bloodlineID: Int, corporationID: Int, localizedDescription: String?, factionID: Int?, gender: ESI.Characters.CharacterID.Gender, name: String, raceID: Int, securityStatus: Double?, title: String?) {
					self.allianceID = allianceID
					self.ancestryID = ancestryID
					self.birthday = birthday
					self.bloodlineID = bloodlineID
					self.corporationID = corporationID
					self.localizedDescription = localizedDescription
					self.factionID = factionID
					self.gender = gender
					self.name = name
					self.raceID = raceID
					self.securityStatus = securityStatus
					self.title = title
				}
				
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
		
		public enum State: String, Codable, CustomStringConvertible {
			case cancelled
			case expired
			
			public var description: String {
				return rawValue
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
		
		public enum FromType: String, Codable, CustomStringConvertible {
			case agent
			case npcCorp = "npc_corp"
			case faction
			
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
		
		public enum Availability: String, Codable, CustomStringConvertible {
			case `public` = "public"
			case personal
			case corporation
			case alliance
			
			public var description: String {
				return rawValue
			}
			
		}
		
		public struct Item: Codable, Hashable {
			
			
			public var itemID: Int64
			public var typeID: Int
			public init(itemID: Int64, typeID: Int) {
				self.itemID = itemID
				self.typeID = typeID
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case itemID = "item_id"
				case typeID = "type_id"
				
				var dateFormatter: DateFormatter? {
					return nil
				}
			}
		}
		
		public struct Position: Codable, Hashable {
			
			
			public var x: Double
			public var y: Double
			public var z: Double
			public init(x: Double, y: Double, z: Double) {
				self.x = x
				self.y = y
				self.z = z
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case x
				case y
				case z
				
				var dateFormatter: DateFormatter? {
					return nil
				}
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
		
		public struct VictoryPoints: Codable, Hashable {
			
			
			public var lastWeek: Int
			public var total: Int
			public var yesterday: Int
			public init(lastWeek: Int, total: Int, yesterday: Int) {
				self.lastWeek = lastWeek
				self.total = total
				self.yesterday = yesterday
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case lastWeek = "last_week"
				case total
				case yesterday
				
				var dateFormatter: DateFormatter? {
					return nil
				}
			}
		}
		
		public struct Kills: Codable, Hashable {
			
			
			public var lastWeek: Int
			public var total: Int
			public var yesterday: Int
			public init(lastWeek: Int, total: Int, yesterday: Int) {
				self.lastWeek = lastWeek
				self.total = total
				self.yesterday = yesterday
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case lastWeek = "last_week"
				case total
				case yesterday
				
				var dateFormatter: DateFormatter? {
					return nil
				}
			}
		}
		
		public struct Coordinates: Codable, Hashable {
			
			
			public var x: Double
			public var y: Double
			public var z: Double
			public init(x: Double, y: Double, z: Double) {
				self.x = x
				self.y = y
				self.z = z
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case x
				case y
				case z
				
				var dateFormatter: DateFormatter? {
					return nil
				}
			}
		}
		
	}
	
}
