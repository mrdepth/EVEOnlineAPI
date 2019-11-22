import Foundation
import Alamofire
import Combine


extension ESI {
	public var universe: Universe {
		return Universe(esi: self, route: .path("universe", next: .root(ESI.apiURL)))
	}
	
	public struct Universe {
		let esi: ESI
		let route: APIRoute
		
		
		
		public func ancestries() -> Ancestries {
			Ancestries(esi: esi, route: .path("ancestries", next: route))
		}
		public func asteroidBelts() -> AsteroidBelts {
			AsteroidBelts(esi: esi, route: .path("asteroid_belts", next: route))
		}
		public func bloodlines() -> Bloodlines {
			Bloodlines(esi: esi, route: .path("bloodlines", next: route))
		}
		public func categories() -> Categories {
			Categories(esi: esi, route: .path("categories", next: route))
		}
		public func constellations() -> Constellations {
			Constellations(esi: esi, route: .path("constellations", next: route))
		}
		public func factions() -> Factions {
			Factions(esi: esi, route: .path("factions", next: route))
		}
		public func graphics() -> Graphics {
			Graphics(esi: esi, route: .path("graphics", next: route))
		}
		public func groups() -> Groups {
			Groups(esi: esi, route: .path("groups", next: route))
		}
		public func ids() -> Ids {
			Ids(esi: esi, route: .path("ids", next: route))
		}
		public func moons() -> Moons {
			Moons(esi: esi, route: .path("moons", next: route))
		}
		public func names() -> Names {
			Names(esi: esi, route: .path("names", next: route))
		}
		public func planets() -> Planets {
			Planets(esi: esi, route: .path("planets", next: route))
		}
		public func races() -> Races {
			Races(esi: esi, route: .path("races", next: route))
		}
		public func regions() -> Regions {
			Regions(esi: esi, route: .path("regions", next: route))
		}
		public func schematics() -> Schematics {
			Schematics(esi: esi, route: .path("schematics", next: route))
		}
		public func stargates() -> Stargates {
			Stargates(esi: esi, route: .path("stargates", next: route))
		}
		public func stars() -> Stars {
			Stars(esi: esi, route: .path("stars", next: route))
		}
		public func stations() -> Stations {
			Stations(esi: esi, route: .path("stations", next: route))
		}
		public func structures() -> Structures {
			Structures(esi: esi, route: .path("structures", next: route))
		}
		public func systemJumps() -> SystemJumps {
			SystemJumps(esi: esi, route: .path("system_jumps", next: route))
		}
		public func systemKills() -> SystemKills {
			SystemKills(esi: esi, route: .path("system_kills", next: route))
		}
		public func systems() -> Systems {
			Systems(esi: esi, route: .path("systems", next: route))
		}
		public func types() -> Types {
			Types(esi: esi, route: .path("types", next: route))
		}
		
		public struct Ancestries {
			let esi: ESI
			let route: APIRoute
			
			
			public func get(language: ESI.Markets.Language? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
				do {
					
					
					
					
					var headers = HTTPHeaders()
					headers["Accept"] = "application/json"
					
					
					var query = [URLQueryItem]()
					query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
					if let language = language {
						query.append(URLQueryItem(name: "language", value: language.description))
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
				
				
				public let bloodlineID: Int
				public let localizedDescription: String
				public let iconID: Int?
				public let id: Int
				public let name: String
				public let shortDescription: String?
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case bloodlineID = "bloodline_id"
					case localizedDescription = "description"
					case iconID = "icon_id"
					case id
					case name
					case shortDescription = "short_description"
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
		}
		
		public struct AsteroidBelts {
			let esi: ESI
			let route: APIRoute
			
			
			
			public func asteroidBeltID(_ value: Int) -> AsteroidBeltID {
				AsteroidBeltID(esi: esi, route: .parameter(value, next: route))
			}
			
			public struct AsteroidBeltID {
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
					
					
					public let name: String
					public let position: ESI.Characters.Position
					public let systemID: Int
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case name
						case position
						case systemID = "system_id"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
			}
			
			
			
		}
		
		public struct Bloodlines {
			let esi: ESI
			let route: APIRoute
			
			
			public func get(language: ESI.Markets.Language? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
				do {
					
					
					
					
					var headers = HTTPHeaders()
					headers["Accept"] = "application/json"
					
					
					var query = [URLQueryItem]()
					query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
					if let language = language {
						query.append(URLQueryItem(name: "language", value: language.description))
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
				
				
				public let bloodlineID: Int
				public let charisma: Int
				public let corporationID: Int
				public let localizedDescription: String
				public let intelligence: Int
				public let memory: Int
				public let name: String
				public let perception: Int
				public let raceID: Int
				public let shipTypeID: Int
				public let willpower: Int
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case bloodlineID = "bloodline_id"
					case charisma
					case corporationID = "corporation_id"
					case localizedDescription = "description"
					case intelligence
					case memory
					case name
					case perception
					case raceID = "race_id"
					case shipTypeID = "ship_type_id"
					case willpower
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
		}
		
		public struct Categories {
			let esi: ESI
			let route: APIRoute
			
			
			public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Int], AFError> {
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
			
			
			public func categoryID(_ value: Int) -> CategoryID {
				CategoryID(esi: esi, route: .parameter(value, next: route))
			}
			
			public struct CategoryID {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(language: ESI.Markets.Language? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Success, AFError> {
					do {
						
						
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						if let language = language {
							query.append(URLQueryItem(name: "language", value: language.description))
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
					
					
					public let categoryID: Int
					public let groups: [Int]
					public let name: String
					public let published: Bool
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case categoryID = "category_id"
						case groups
						case name
						case published
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
			}
			
			
			
		}
		
		public struct Constellations {
			let esi: ESI
			let route: APIRoute
			
			
			public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Int], AFError> {
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
			
			
			public func constellationID(_ value: Int) -> ConstellationID {
				ConstellationID(esi: esi, route: .parameter(value, next: route))
			}
			
			public struct ConstellationID {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(language: ESI.Markets.Language? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Success, AFError> {
					do {
						
						
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						if let language = language {
							query.append(URLQueryItem(name: "language", value: language.description))
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
					
					
					public let constellationID: Int
					public let name: String
					public let position: ESI.Characters.Position
					public let regionID: Int
					public let systems: [Int]
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case constellationID = "constellation_id"
						case name
						case position
						case regionID = "region_id"
						case systems
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
			}
			
			
			
		}
		
		public struct Factions {
			let esi: ESI
			let route: APIRoute
			
			
			public func get(language: ESI.Markets.Language? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
				do {
					
					
					
					
					var headers = HTTPHeaders()
					headers["Accept"] = "application/json"
					
					
					var query = [URLQueryItem]()
					query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
					if let language = language {
						query.append(URLQueryItem(name: "language", value: language.description))
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
				
				
				public let corporationID: Int?
				public let localizedDescription: String
				public let factionID: Int
				public let isUnique: Bool
				public let militiaCorporationID: Int?
				public let name: String
				public let sizeFactor: Double
				public let solarSystemID: Int?
				public let stationCount: Int
				public let stationSystemCount: Int
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case corporationID = "corporation_id"
					case localizedDescription = "description"
					case factionID = "faction_id"
					case isUnique = "is_unique"
					case militiaCorporationID = "militia_corporation_id"
					case name
					case sizeFactor = "size_factor"
					case solarSystemID = "solar_system_id"
					case stationCount = "station_count"
					case stationSystemCount = "station_system_count"
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
		}
		
		public struct Graphics {
			let esi: ESI
			let route: APIRoute
			
			
			public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Int], AFError> {
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
			
			
			public func graphicID(_ value: Int) -> GraphicID {
				GraphicID(esi: esi, route: .parameter(value, next: route))
			}
			
			public struct GraphicID {
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
					
					
					public let collisionFile: String?
					public let graphicFile: String?
					public let graphicID: Int
					public let iconFolder: String?
					public let sofDna: String?
					public let sofFationName: String?
					public let sofHullName: String?
					public let sofRaceName: String?
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case collisionFile = "collision_file"
						case graphicFile = "graphic_file"
						case graphicID = "graphic_id"
						case iconFolder = "icon_folder"
						case sofDna = "sof_dna"
						case sofFationName = "sof_fation_name"
						case sofHullName = "sof_hull_name"
						case sofRaceName = "sof_race_name"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
			}
			
			
			
		}
		
		public struct Groups {
			let esi: ESI
			let route: APIRoute
			
			
			public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Int], AFError> {
				do {
					
					
					
					
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
			
			
			public func groupID(_ value: Int) -> GroupID {
				GroupID(esi: esi, route: .parameter(value, next: route))
			}
			
			public struct GroupID {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(language: ESI.Markets.Language? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Success, AFError> {
					do {
						
						
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						if let language = language {
							query.append(URLQueryItem(name: "language", value: language.description))
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
					
					
					public let categoryID: Int
					public let groupID: Int
					public let name: String
					public let published: Bool
					public let types: [Int]
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case categoryID = "category_id"
						case groupID = "group_id"
						case name
						case published
						case types
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
			}
			
			
			
		}
		
		public struct Ids {
			let esi: ESI
			let route: APIRoute
			
			
			public func post(language: ESI.Markets.Language? = nil, names: [String], cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Success, AFError> {
				do {
					
					
					let body = try JSONEncoder().encode(names)
					
					var headers = HTTPHeaders()
					headers["Accept"] = "application/json"
					headers["Content-Type"] = "application/json"
					
					var query = [URLQueryItem]()
					query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
					if let language = language {
						query.append(URLQueryItem(name: "language", value: language.description))
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
			
			
			
			
			
			
			public struct Constellation: Codable, Hashable {
				
				
				public let id: Int?
				public let name: String?
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case id
					case name
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
			public struct Character: Codable, Hashable {
				
				
				public let id: Int?
				public let name: String?
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case id
					case name
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
			public struct Agent: Codable, Hashable {
				
				
				public let id: Int?
				public let name: String?
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case id
					case name
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
			public struct Corporation: Codable, Hashable {
				
				
				public let id: Int?
				public let name: String?
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case id
					case name
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
			public struct Region: Codable, Hashable {
				
				
				public let id: Int?
				public let name: String?
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case id
					case name
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
			public struct Alliance: Codable, Hashable {
				
				
				public let id: Int?
				public let name: String?
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case id
					case name
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
			public struct Success: Codable, Hashable {
				
				
				public let agents: [ESI.Universe.Ids.Agent]?
				public let alliances: [ESI.Universe.Ids.Alliance]?
				public let characters: [ESI.Universe.Ids.Character]?
				public let constellations: [ESI.Universe.Ids.Constellation]?
				public let corporations: [ESI.Universe.Ids.Corporation]?
				public let factions: [ESI.Universe.Ids.Faction]?
				public let inventoryTypes: [ESI.Universe.Ids.InventoryType]?
				public let regions: [ESI.Universe.Ids.Region]?
				public let stations: [ESI.Universe.Ids.Station]?
				public let systems: [ESI.Universe.Ids.System]?
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case agents
					case alliances
					case characters
					case constellations
					case corporations
					case factions
					case inventoryTypes = "inventory_types"
					case regions
					case stations
					case systems
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
			public struct System: Codable, Hashable {
				
				
				public let id: Int?
				public let name: String?
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case id
					case name
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
			public struct Station: Codable, Hashable {
				
				
				public let id: Int?
				public let name: String?
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case id
					case name
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
			public struct Faction: Codable, Hashable {
				
				
				public let id: Int?
				public let name: String?
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case id
					case name
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
			public struct InventoryType: Codable, Hashable {
				
				
				public let id: Int?
				public let name: String?
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case id
					case name
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
		}
		
		public struct Moons {
			let esi: ESI
			let route: APIRoute
			
			
			
			public func moonID(_ value: Int) -> MoonID {
				MoonID(esi: esi, route: .parameter(value, next: route))
			}
			
			public struct MoonID {
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
					
					
					public let moonID: Int
					public let name: String
					public let position: ESI.Characters.Position
					public let systemID: Int
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case moonID = "moon_id"
						case name
						case position
						case systemID = "system_id"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
			}
			
			
			
		}
		
		public struct Names {
			let esi: ESI
			let route: APIRoute
			
			
			public func post(ids: [Int], cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
				do {
					
					
					let body = try JSONEncoder().encode(ids)
					
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
			
			
			
			
			
			
			public enum Category: String, Codable, CustomStringConvertible {
				case alliance
				case character
				case constellation
				case corporation
				case inventoryType = "inventory_type"
				case region
				case solarSystem = "solar_system"
				case station
				case faction
				
				public var description: String {
					return rawValue
				}
				
			}
			
			public struct Success: Codable, Hashable {
				
				
				public let category: ESI.Universe.Names.Category
				public let id: Int
				public let name: String
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case category
					case id
					case name
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
		}
		
		public struct Planets {
			let esi: ESI
			let route: APIRoute
			
			
			
			public func planetID(_ value: Int) -> PlanetID {
				PlanetID(esi: esi, route: .parameter(value, next: route))
			}
			
			public struct PlanetID {
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
					
					
					public let name: String
					public let planetID: Int
					public let position: ESI.Characters.Position
					public let systemID: Int
					public let typeID: Int
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case name
						case planetID = "planet_id"
						case position
						case systemID = "system_id"
						case typeID = "type_id"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
			}
			
			
			
		}
		
		public struct Races {
			let esi: ESI
			let route: APIRoute
			
			
			public func get(language: ESI.Markets.Language? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
				do {
					
					
					
					
					var headers = HTTPHeaders()
					headers["Accept"] = "application/json"
					
					
					var query = [URLQueryItem]()
					query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
					if let language = language {
						query.append(URLQueryItem(name: "language", value: language.description))
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
				
				
				public let allianceID: Int
				public let localizedDescription: String
				public let name: String
				public let raceID: Int
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case allianceID = "alliance_id"
					case localizedDescription = "description"
					case name
					case raceID = "race_id"
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
		}
		
		public struct Regions {
			let esi: ESI
			let route: APIRoute
			
			
			public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Int], AFError> {
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
			
			
			public func regionID(_ value: Int) -> RegionID {
				RegionID(esi: esi, route: .parameter(value, next: route))
			}
			
			public struct RegionID {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(language: ESI.Markets.Language? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Success, AFError> {
					do {
						
						
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						if let language = language {
							query.append(URLQueryItem(name: "language", value: language.description))
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
					
					
					public let constellations: [Int]
					public let localizedDescription: String?
					public let name: String
					public let regionID: Int
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case constellations
						case localizedDescription = "description"
						case name
						case regionID = "region_id"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
			}
			
			
			
		}
		
		public struct Schematics {
			let esi: ESI
			let route: APIRoute
			
			
			
			public func schematicID(_ value: Int) -> SchematicID {
				SchematicID(esi: esi, route: .parameter(value, next: route))
			}
			
			public struct SchematicID {
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
					
					
					public let cycleTime: Int
					public let schematicName: String
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case cycleTime = "cycle_time"
						case schematicName = "schematic_name"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
			}
			
			
			
		}
		
		public struct Stargates {
			let esi: ESI
			let route: APIRoute
			
			
			
			public func stargateID(_ value: Int) -> StargateID {
				StargateID(esi: esi, route: .parameter(value, next: route))
			}
			
			public struct StargateID {
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
				
				
				
				
				
				
				public struct Destination: Codable, Hashable {
					
					
					public let stargateID: Int
					public let systemID: Int
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case stargateID = "stargate_id"
						case systemID = "system_id"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct Success: Codable, Hashable {
					
					
					public let destination: ESI.Universe.Stargates.StargateID.Destination
					public let name: String
					public let position: ESI.Characters.Position
					public let stargateID: Int
					public let systemID: Int
					public let typeID: Int
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case destination
						case name
						case position
						case stargateID = "stargate_id"
						case systemID = "system_id"
						case typeID = "type_id"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
			}
			
			
			
		}
		
		public struct Stars {
			let esi: ESI
			let route: APIRoute
			
			
			
			public func starID(_ value: Int) -> StarID {
				StarID(esi: esi, route: .parameter(value, next: route))
			}
			
			public struct StarID {
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
					
					
					public let age: Int64
					public let luminosity: Double
					public let name: String
					public let radius: Int64
					public let solarSystemID: Int
					public let spectralClass: ESI.Universe.Stars.StarID.SpectralClass
					public let temperature: Int
					public let typeID: Int
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case age
						case luminosity
						case name
						case radius
						case solarSystemID = "solar_system_id"
						case spectralClass = "spectral_class"
						case temperature
						case typeID = "type_id"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public enum SpectralClass: String, Codable, CustomStringConvertible {
					case k2V = "K2 V"
					case k4V = "K4 V"
					case g2V = "G2 V"
					case g8V = "G8 V"
					case m7V = "M7 V"
					case k7V = "K7 V"
					case m2V = "M2 V"
					case k5V = "K5 V"
					case m3V = "M3 V"
					case g0V = "G0 V"
					case g7V = "G7 V"
					case g3V = "G3 V"
					case f9V = "F9 V"
					case g5V = "G5 V"
					case f6V = "F6 V"
					case k8V = "K8 V"
					case k9V = "K9 V"
					case k6V = "K6 V"
					case g9V = "G9 V"
					case g6V = "G6 V"
					case g4VI = "G4 VI"
					case g4V = "G4 V"
					case f8V = "F8 V"
					case f2V = "F2 V"
					case f1V = "F1 V"
					case k3V = "K3 V"
					case f0VI = "F0 VI"
					case g1VI = "G1 VI"
					case g0VI = "G0 VI"
					case k1V = "K1 V"
					case m4V = "M4 V"
					case m1V = "M1 V"
					case m6V = "M6 V"
					case m0V = "M0 V"
					case k2IV = "K2 IV"
					case g2VI = "G2 VI"
					case k0V = "K0 V"
					case k5IV = "K5 IV"
					case f5VI = "F5 VI"
					case g6VI = "G6 VI"
					case f6VI = "F6 VI"
					case f2IV = "F2 IV"
					case g3VI = "G3 VI"
					case m8V = "M8 V"
					case f1VI = "F1 VI"
					case k1IV = "K1 IV"
					case f7V = "F7 V"
					case g5VI = "G5 VI"
					case m5V = "M5 V"
					case g7VI = "G7 VI"
					case f5V = "F5 V"
					case f4VI = "F4 VI"
					case f8VI = "F8 VI"
					case k3IV = "K3 IV"
					case f4IV = "F4 IV"
					case f0V = "F0 V"
					case g7IV = "G7 IV"
					case g8VI = "G8 VI"
					case f2VI = "F2 VI"
					case f4V = "F4 V"
					case f7VI = "F7 VI"
					case f3V = "F3 V"
					case g1V = "G1 V"
					case g9VI = "G9 VI"
					case f3IV = "F3 IV"
					case f9VI = "F9 VI"
					case m9V = "M9 V"
					case k0IV = "K0 IV"
					case f1IV = "F1 IV"
					case g4IV = "G4 IV"
					case f3VI = "F3 VI"
					case k4IV = "K4 IV"
					case g5IV = "G5 IV"
					case g3IV = "G3 IV"
					case g1IV = "G1 IV"
					case k7IV = "K7 IV"
					case g0IV = "G0 IV"
					case k6IV = "K6 IV"
					case k9IV = "K9 IV"
					case g2IV = "G2 IV"
					case f9IV = "F9 IV"
					case f0IV = "F0 IV"
					case k8IV = "K8 IV"
					case g8IV = "G8 IV"
					case f6IV = "F6 IV"
					case f5IV = "F5 IV"
					case a0 = "A0"
					case a0IV = "A0IV"
					case a0IV2 = "A0IV2"
					
					public var description: String {
						return rawValue
					}
					
				}
				
			}
			
			
			
		}
		
		public struct Stations {
			let esi: ESI
			let route: APIRoute
			
			
			
			public func stationID(_ value: Int) -> StationID {
				StationID(esi: esi, route: .parameter(value, next: route))
			}
			
			public struct StationID {
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
				
				
				
				
				
				
				public enum Service: String, Codable, CustomStringConvertible {
					case bountyMissions = "bounty-missions"
					case assasinationMissions = "assasination-missions"
					case courierMissions = "courier-missions"
					case interbus
					case reprocessingPlant = "reprocessing-plant"
					case refinery
					case market
					case blackMarket = "black-market"
					case stockExchange = "stock-exchange"
					case cloning
					case surgery
					case dnaTherapy = "dna-therapy"
					case repairFacilities = "repair-facilities"
					case factory
					case labratory
					case gambling
					case fitting
					case paintshop
					case news
					case storage
					case insurance
					case docking
					case officeRental = "office-rental"
					case jumpCloneFacility = "jump-clone-facility"
					case loyaltyPointStore = "loyalty-point-store"
					case navyOffices = "navy-offices"
					case securityOffices = "security-offices"
					
					public var description: String {
						return rawValue
					}
					
				}
				
				public struct Success: Codable, Hashable {
					
					
					public let maxDockableShipVolume: Double
					public let name: String
					public let officeRentalCost: Double
					public let owner: Int?
					public let position: ESI.Characters.Position
					public let raceID: Int?
					public let reprocessingEfficiency: Double
					public let reprocessingStationsTake: Double
					public let services: [ESI.Universe.Stations.StationID.Service]
					public let stationID: Int
					public let systemID: Int
					public let typeID: Int
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case maxDockableShipVolume = "max_dockable_ship_volume"
						case name
						case officeRentalCost = "office_rental_cost"
						case owner
						case position
						case raceID = "race_id"
						case reprocessingEfficiency = "reprocessing_efficiency"
						case reprocessingStationsTake = "reprocessing_stations_take"
						case services
						case stationID = "station_id"
						case systemID = "system_id"
						case typeID = "type_id"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
			}
			
			
			
		}
		
		public struct Structures {
			let esi: ESI
			let route: APIRoute
			
			
			public func get(filter: ESI.Universe.Structures.Filter?, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Int64], AFError> {
				do {
					
					
					
					
					var headers = HTTPHeaders()
					headers["Accept"] = "application/json"
					
					
					var query = [URLQueryItem]()
					query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
					if let filter = filter {
						query.append(URLQueryItem(name: "filter", value: filter.description))
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
			
			
			public func structureID(_ value: Int64) -> StructureID {
				StructureID(esi: esi, route: .parameter(value, next: route))
			}
			
			public struct StructureID {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Success, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-universe.read_structures.v1") else {throw ESIError.forbidden}
						
						
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
					
					
					public let name: String
					public let ownerID: Int
					public let position: ESI.Characters.Position?
					public let solarSystemID: Int
					public let typeID: Int?
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case name
						case ownerID = "owner_id"
						case position
						case solarSystemID = "solar_system_id"
						case typeID = "type_id"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
			}
			
			
			public enum Filter: String, Codable, CustomStringConvertible {
				case market
				case manufacturingBasic = "manufacturing_basic"
				
				public var description: String {
					return rawValue
				}
				
			}
			
		}
		
		public struct SystemJumps {
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
				
				
				public let shipJumps: Int
				public let systemID: Int
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case shipJumps = "ship_jumps"
					case systemID = "system_id"
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
		}
		
		public struct SystemKills {
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
				
				
				public let npcKills: Int
				public let podKills: Int
				public let shipKills: Int
				public let systemID: Int
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case npcKills = "npc_kills"
					case podKills = "pod_kills"
					case shipKills = "ship_kills"
					case systemID = "system_id"
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
		}
		
		public struct Systems {
			let esi: ESI
			let route: APIRoute
			
			
			public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Int], AFError> {
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
			
			
			public func systemID(_ value: Int) -> SystemID {
				SystemID(esi: esi, route: .parameter(value, next: route))
			}
			
			public struct SystemID {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(language: ESI.Markets.Language? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Success, AFError> {
					do {
						
						
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						if let language = language {
							query.append(URLQueryItem(name: "language", value: language.description))
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
					
					
					public let constellationID: Int
					public let name: String
					public let planets: [ESI.Universe.Systems.SystemID.Planet]?
					public let position: ESI.Characters.Position
					public let securityClass: String?
					public let securityStatus: Double
					public let starID: Int?
					public let stargates: [Int]?
					public let stations: [Int]?
					public let systemID: Int
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case constellationID = "constellation_id"
						case name
						case planets
						case position
						case securityClass = "security_class"
						case securityStatus = "security_status"
						case starID = "star_id"
						case stargates
						case stations
						case systemID = "system_id"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct Planet: Codable, Hashable {
					
					
					public let asteroidBelts: [Int]?
					public let moons: [Int]?
					public let planetID: Int
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case asteroidBelts = "asteroid_belts"
						case moons
						case planetID = "planet_id"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
			}
			
			
			
		}
		
		public struct Types {
			let esi: ESI
			let route: APIRoute
			
			
			public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Int], AFError> {
				do {
					
					
					
					
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
			
			
			public func typeID(_ value: Int) -> TypeID {
				TypeID(esi: esi, route: .parameter(value, next: route))
			}
			
			public struct TypeID {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(language: ESI.Markets.Language? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Success, AFError> {
					do {
						
						
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						if let language = language {
							query.append(URLQueryItem(name: "language", value: language.description))
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
					
					
					public let capacity: Double?
					public let localizedDescription: String
					public let dogmaAttributes: [ESI.Dogma.DogmaAttribute]?
					public let dogmaEffects: [ESI.Dogma.DogmaEffect]?
					public let graphicID: Int?
					public let groupID: Int
					public let iconID: Int?
					public let marketGroupID: Int?
					public let mass: Double?
					public let name: String
					public let packagedVolume: Double?
					public let portionSize: Int?
					public let published: Bool
					public let radius: Double?
					public let typeID: Int
					public let volume: Double?
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case capacity
						case localizedDescription = "description"
						case dogmaAttributes = "dogma_attributes"
						case dogmaEffects = "dogma_effects"
						case graphicID = "graphic_id"
						case groupID = "group_id"
						case iconID = "icon_id"
						case marketGroupID = "market_group_id"
						case mass
						case name
						case packagedVolume = "packaged_volume"
						case portionSize = "portion_size"
						case published
						case radius
						case typeID = "type_id"
						case volume
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
			}
			
			
			
		}
		
		
		
	}
	
}
