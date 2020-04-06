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
			
			
			public func get(language: ESI.Universe.Language? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Universe.Ancestries.Success]>, AFError> {
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
					
					let publisher = esi.publisher(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
					if let progress = progress {
						return publisher
						.downloadProgress(closure: progress)
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
					else {
						return publisher
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
				}
				catch {
					return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
				}
			}
			
			
			
			
			
			
			public struct Success: Codable, Hashable {
				
				
				public var bloodlineID: Int
				public var localizedDescription: String
				public var iconID: Int?
				public var id: Int
				public var name: String
				public var shortDescription: String?
				public init(bloodlineID: Int, localizedDescription: String, iconID: Int?, id: Int, name: String, shortDescription: String?) {
					self.bloodlineID = bloodlineID
					self.localizedDescription = localizedDescription
					self.iconID = iconID
					self.id = id
					self.name = name
					self.shortDescription = shortDescription
				}
				
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
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<ESI.Universe.AsteroidBelts.AsteroidBeltID.Success>, AFError> {
					do {
						
						
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						let publisher = esi.publisher(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						if let progress = progress {
							return publisher
							.downloadProgress(closure: progress)
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
						}
						else {
							return publisher
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
						}
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public var name: String
					public var position: ESI.Universe.Position
					public var systemID: Int
					public init(name: String, position: ESI.Universe.Position, systemID: Int) {
						self.name = name
						self.position = position
						self.systemID = systemID
					}
					
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
			
			
			public func get(language: ESI.Universe.Language? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Universe.Bloodlines.Success]>, AFError> {
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
					
					let publisher = esi.publisher(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
					if let progress = progress {
						return publisher
						.downloadProgress(closure: progress)
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
					else {
						return publisher
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
				}
				catch {
					return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
				}
			}
			
			
			
			
			
			
			public struct Success: Codable, Hashable {
				
				
				public var bloodlineID: Int
				public var charisma: Int
				public var corporationID: Int
				public var localizedDescription: String
				public var intelligence: Int
				public var memory: Int
				public var name: String
				public var perception: Int
				public var raceID: Int
				public var shipTypeID: Int
				public var willpower: Int
				public init(bloodlineID: Int, charisma: Int, corporationID: Int, localizedDescription: String, intelligence: Int, memory: Int, name: String, perception: Int, raceID: Int, shipTypeID: Int, willpower: Int) {
					self.bloodlineID = bloodlineID
					self.charisma = charisma
					self.corporationID = corporationID
					self.localizedDescription = localizedDescription
					self.intelligence = intelligence
					self.memory = memory
					self.name = name
					self.perception = perception
					self.raceID = raceID
					self.shipTypeID = shipTypeID
					self.willpower = willpower
				}
				
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
			
			
			public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[Int]>, AFError> {
				do {
					
					
					
					
					var headers = HTTPHeaders()
					headers["Accept"] = "application/json"
					
					
					var query = [URLQueryItem]()
					query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
					
					
					let url = try route.asURL()
					var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
					components.queryItems = query
					
					let publisher = esi.publisher(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
					if let progress = progress {
						return publisher
						.downloadProgress(closure: progress)
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
					else {
						return publisher
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
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
				
				
				public func get(language: ESI.Universe.Language? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<ESI.Universe.Categories.CategoryID.Success>, AFError> {
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
						
						let publisher = esi.publisher(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						if let progress = progress {
							return publisher
							.downloadProgress(closure: progress)
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
						}
						else {
							return publisher
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
						}
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public var categoryID: Int
					public var groups: [Int]
					public var name: String
					public var published: Bool
					public init(categoryID: Int, groups: [Int], name: String, published: Bool) {
						self.categoryID = categoryID
						self.groups = groups
						self.name = name
						self.published = published
					}
					
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
			
			
			public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[Int]>, AFError> {
				do {
					
					
					
					
					var headers = HTTPHeaders()
					headers["Accept"] = "application/json"
					
					
					var query = [URLQueryItem]()
					query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
					
					
					let url = try route.asURL()
					var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
					components.queryItems = query
					
					let publisher = esi.publisher(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
					if let progress = progress {
						return publisher
						.downloadProgress(closure: progress)
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
					else {
						return publisher
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
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
				
				
				public func get(language: ESI.Universe.Language? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<ESI.Universe.Constellations.ConstellationID.Success>, AFError> {
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
						
						let publisher = esi.publisher(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						if let progress = progress {
							return publisher
							.downloadProgress(closure: progress)
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
						}
						else {
							return publisher
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
						}
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public var constellationID: Int
					public var name: String
					public var position: ESI.Universe.Position
					public var regionID: Int
					public var systems: [Int]
					public init(constellationID: Int, name: String, position: ESI.Universe.Position, regionID: Int, systems: [Int]) {
						self.constellationID = constellationID
						self.name = name
						self.position = position
						self.regionID = regionID
						self.systems = systems
					}
					
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
			
			
			public func get(language: ESI.Universe.Language? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Universe.Factions.Success]>, AFError> {
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
					
					let publisher = esi.publisher(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
					if let progress = progress {
						return publisher
						.downloadProgress(closure: progress)
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
					else {
						return publisher
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
				}
				catch {
					return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
				}
			}
			
			
			
			
			
			
			public struct Success: Codable, Hashable {
				
				
				public var corporationID: Int?
				public var localizedDescription: String
				public var factionID: Int
				public var isUnique: Bool
				public var militiaCorporationID: Int?
				public var name: String
				public var sizeFactor: Double
				public var solarSystemID: Int?
				public var stationCount: Int
				public var stationSystemCount: Int
				public init(corporationID: Int?, localizedDescription: String, factionID: Int, isUnique: Bool, militiaCorporationID: Int?, name: String, sizeFactor: Double, solarSystemID: Int?, stationCount: Int, stationSystemCount: Int) {
					self.corporationID = corporationID
					self.localizedDescription = localizedDescription
					self.factionID = factionID
					self.isUnique = isUnique
					self.militiaCorporationID = militiaCorporationID
					self.name = name
					self.sizeFactor = sizeFactor
					self.solarSystemID = solarSystemID
					self.stationCount = stationCount
					self.stationSystemCount = stationSystemCount
				}
				
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
			
			
			public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[Int]>, AFError> {
				do {
					
					
					
					
					var headers = HTTPHeaders()
					headers["Accept"] = "application/json"
					
					
					var query = [URLQueryItem]()
					query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
					
					
					let url = try route.asURL()
					var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
					components.queryItems = query
					
					let publisher = esi.publisher(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
					if let progress = progress {
						return publisher
						.downloadProgress(closure: progress)
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
					else {
						return publisher
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
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
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<ESI.Universe.Graphics.GraphicID.Success>, AFError> {
					do {
						
						
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						let publisher = esi.publisher(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						if let progress = progress {
							return publisher
							.downloadProgress(closure: progress)
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
						}
						else {
							return publisher
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
						}
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public var collisionFile: String?
					public var graphicFile: String?
					public var graphicID: Int
					public var iconFolder: String?
					public var sofDna: String?
					public var sofFationName: String?
					public var sofHullName: String?
					public var sofRaceName: String?
					public init(collisionFile: String?, graphicFile: String?, graphicID: Int, iconFolder: String?, sofDna: String?, sofFationName: String?, sofHullName: String?, sofRaceName: String?) {
						self.collisionFile = collisionFile
						self.graphicFile = graphicFile
						self.graphicID = graphicID
						self.iconFolder = iconFolder
						self.sofDna = sofDna
						self.sofFationName = sofFationName
						self.sofHullName = sofHullName
						self.sofRaceName = sofRaceName
					}
					
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
			
			
			public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[Int]>, AFError> {
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
					
					let publisher = esi.publisher(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
					if let progress = progress {
						return publisher
						.downloadProgress(closure: progress)
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
					else {
						return publisher
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
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
				
				
				public func get(language: ESI.Universe.Language? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<ESI.Universe.Groups.GroupID.Success>, AFError> {
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
						
						let publisher = esi.publisher(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						if let progress = progress {
							return publisher
							.downloadProgress(closure: progress)
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
						}
						else {
							return publisher
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
						}
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public var categoryID: Int
					public var groupID: Int
					public var name: String
					public var published: Bool
					public var types: [Int]
					public init(categoryID: Int, groupID: Int, name: String, published: Bool, types: [Int]) {
						self.categoryID = categoryID
						self.groupID = groupID
						self.name = name
						self.published = published
						self.types = types
					}
					
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
			
			
			public func post(language: ESI.Universe.Language? = nil, names: [String], cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<ESI.Universe.Ids.Success>, AFError> {
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
					
					let publisher = esi.publisher(components, method: .post, encoding: BodyDataEncoding(data: body), headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
					if let progress = progress {
						return publisher
						.downloadProgress(closure: progress)
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
					else {
						return publisher
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
				}
				catch {
					return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
				}
			}
			
			
			
			
			
			
			public struct Faction: Codable, Hashable {
				
				
				public var id: Int?
				public var name: String?
				public init(id: Int?, name: String?) {
					self.id = id
					self.name = name
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case id
					case name
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
			public struct Region: Codable, Hashable {
				
				
				public var id: Int?
				public var name: String?
				public init(id: Int?, name: String?) {
					self.id = id
					self.name = name
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case id
					case name
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
			public struct InventoryType: Codable, Hashable {
				
				
				public var id: Int?
				public var name: String?
				public init(id: Int?, name: String?) {
					self.id = id
					self.name = name
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case id
					case name
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
			public struct Alliance: Codable, Hashable {
				
				
				public var id: Int?
				public var name: String?
				public init(id: Int?, name: String?) {
					self.id = id
					self.name = name
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case id
					case name
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
			public struct Success: Codable, Hashable {
				
				
				public var agents: [ESI.Universe.Ids.Agent]?
				public var alliances: [ESI.Universe.Ids.Alliance]?
				public var characters: [ESI.Universe.Ids.Character]?
				public var constellations: [ESI.Universe.Ids.Constellation]?
				public var corporations: [ESI.Universe.Ids.Corporation]?
				public var factions: [ESI.Universe.Ids.Faction]?
				public var inventoryTypes: [ESI.Universe.Ids.InventoryType]?
				public var regions: [ESI.Universe.Ids.Region]?
				public var stations: [ESI.Universe.Ids.Station]?
				public var systems: [ESI.Universe.Ids.System]?
				public init(agents: [ESI.Universe.Ids.Agent]?, alliances: [ESI.Universe.Ids.Alliance]?, characters: [ESI.Universe.Ids.Character]?, constellations: [ESI.Universe.Ids.Constellation]?, corporations: [ESI.Universe.Ids.Corporation]?, factions: [ESI.Universe.Ids.Faction]?, inventoryTypes: [ESI.Universe.Ids.InventoryType]?, regions: [ESI.Universe.Ids.Region]?, stations: [ESI.Universe.Ids.Station]?, systems: [ESI.Universe.Ids.System]?) {
					self.agents = agents
					self.alliances = alliances
					self.characters = characters
					self.constellations = constellations
					self.corporations = corporations
					self.factions = factions
					self.inventoryTypes = inventoryTypes
					self.regions = regions
					self.stations = stations
					self.systems = systems
				}
				
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
			
			public struct Agent: Codable, Hashable {
				
				
				public var id: Int?
				public var name: String?
				public init(id: Int?, name: String?) {
					self.id = id
					self.name = name
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case id
					case name
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
			public struct Constellation: Codable, Hashable {
				
				
				public var id: Int?
				public var name: String?
				public init(id: Int?, name: String?) {
					self.id = id
					self.name = name
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case id
					case name
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
			public struct Character: Codable, Hashable {
				
				
				public var id: Int?
				public var name: String?
				public init(id: Int?, name: String?) {
					self.id = id
					self.name = name
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case id
					case name
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
			public struct Station: Codable, Hashable {
				
				
				public var id: Int?
				public var name: String?
				public init(id: Int?, name: String?) {
					self.id = id
					self.name = name
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case id
					case name
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
			public struct System: Codable, Hashable {
				
				
				public var id: Int?
				public var name: String?
				public init(id: Int?, name: String?) {
					self.id = id
					self.name = name
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case id
					case name
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
			public struct Corporation: Codable, Hashable {
				
				
				public var id: Int?
				public var name: String?
				public init(id: Int?, name: String?) {
					self.id = id
					self.name = name
				}
				
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
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<ESI.Universe.Moons.MoonID.Success>, AFError> {
					do {
						
						
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						let publisher = esi.publisher(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						if let progress = progress {
							return publisher
							.downloadProgress(closure: progress)
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
						}
						else {
							return publisher
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
						}
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public var moonID: Int
					public var name: String
					public var position: ESI.Universe.Position
					public var systemID: Int
					public init(moonID: Int, name: String, position: ESI.Universe.Position, systemID: Int) {
						self.moonID = moonID
						self.name = name
						self.position = position
						self.systemID = systemID
					}
					
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
			
			
			public func post(ids: [Int], cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Universe.Names.Success]>, AFError> {
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
					
					let publisher = esi.publisher(components, method: .post, encoding: BodyDataEncoding(data: body), headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
					if let progress = progress {
						return publisher
						.downloadProgress(closure: progress)
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
					else {
						return publisher
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
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
				
				
				public var category: ESI.Universe.Names.Category
				public var id: Int
				public var name: String
				public init(category: ESI.Universe.Names.Category, id: Int, name: String) {
					self.category = category
					self.id = id
					self.name = name
				}
				
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
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<ESI.Universe.Planets.PlanetID.Success>, AFError> {
					do {
						
						
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						let publisher = esi.publisher(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						if let progress = progress {
							return publisher
							.downloadProgress(closure: progress)
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
						}
						else {
							return publisher
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
						}
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public var name: String
					public var planetID: Int
					public var position: ESI.Universe.Position
					public var systemID: Int
					public var typeID: Int
					public init(name: String, planetID: Int, position: ESI.Universe.Position, systemID: Int, typeID: Int) {
						self.name = name
						self.planetID = planetID
						self.position = position
						self.systemID = systemID
						self.typeID = typeID
					}
					
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
			
			
			public func get(language: ESI.Universe.Language? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Universe.Races.Success]>, AFError> {
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
					
					let publisher = esi.publisher(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
					if let progress = progress {
						return publisher
						.downloadProgress(closure: progress)
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
					else {
						return publisher
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
				}
				catch {
					return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
				}
			}
			
			
			
			
			
			
			public struct Success: Codable, Hashable {
				
				
				public var allianceID: Int
				public var localizedDescription: String
				public var name: String
				public var raceID: Int
				public init(allianceID: Int, localizedDescription: String, name: String, raceID: Int) {
					self.allianceID = allianceID
					self.localizedDescription = localizedDescription
					self.name = name
					self.raceID = raceID
				}
				
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
			
			
			public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[Int]>, AFError> {
				do {
					
					
					
					
					var headers = HTTPHeaders()
					headers["Accept"] = "application/json"
					
					
					var query = [URLQueryItem]()
					query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
					
					
					let url = try route.asURL()
					var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
					components.queryItems = query
					
					let publisher = esi.publisher(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
					if let progress = progress {
						return publisher
						.downloadProgress(closure: progress)
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
					else {
						return publisher
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
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
				
				
				public func get(language: ESI.Universe.Language? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<ESI.Universe.Regions.RegionID.Success>, AFError> {
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
						
						let publisher = esi.publisher(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						if let progress = progress {
							return publisher
							.downloadProgress(closure: progress)
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
						}
						else {
							return publisher
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
						}
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public var constellations: [Int]
					public var localizedDescription: String?
					public var name: String
					public var regionID: Int
					public init(constellations: [Int], localizedDescription: String?, name: String, regionID: Int) {
						self.constellations = constellations
						self.localizedDescription = localizedDescription
						self.name = name
						self.regionID = regionID
					}
					
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
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<ESI.Universe.Schematics.SchematicID.Success>, AFError> {
					do {
						
						
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						let publisher = esi.publisher(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						if let progress = progress {
							return publisher
							.downloadProgress(closure: progress)
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
						}
						else {
							return publisher
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
						}
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public var cycleTime: Int
					public var schematicName: String
					public init(cycleTime: Int, schematicName: String) {
						self.cycleTime = cycleTime
						self.schematicName = schematicName
					}
					
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
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<ESI.Universe.Stargates.StargateID.Success>, AFError> {
					do {
						
						
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						let publisher = esi.publisher(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						if let progress = progress {
							return publisher
							.downloadProgress(closure: progress)
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
						}
						else {
							return publisher
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
						}
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public var destination: ESI.Universe.Stargates.StargateID.Destination
					public var name: String
					public var position: ESI.Universe.Position
					public var stargateID: Int
					public var systemID: Int
					public var typeID: Int
					public init(destination: ESI.Universe.Stargates.StargateID.Destination, name: String, position: ESI.Universe.Position, stargateID: Int, systemID: Int, typeID: Int) {
						self.destination = destination
						self.name = name
						self.position = position
						self.stargateID = stargateID
						self.systemID = systemID
						self.typeID = typeID
					}
					
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
				
				public struct Destination: Codable, Hashable {
					
					
					public var stargateID: Int
					public var systemID: Int
					public init(stargateID: Int, systemID: Int) {
						self.stargateID = stargateID
						self.systemID = systemID
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case stargateID = "stargate_id"
						case systemID = "system_id"
						
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
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<ESI.Universe.Stars.StarID.Success>, AFError> {
					do {
						
						
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						let publisher = esi.publisher(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						if let progress = progress {
							return publisher
							.downloadProgress(closure: progress)
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
						}
						else {
							return publisher
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
						}
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
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
				
				public struct Success: Codable, Hashable {
					
					
					public var age: Int64
					public var luminosity: Double
					public var name: String
					public var radius: Int64
					public var solarSystemID: Int
					public var spectralClass: ESI.Universe.Stars.StarID.SpectralClass
					public var temperature: Int
					public var typeID: Int
					public init(age: Int64, luminosity: Double, name: String, radius: Int64, solarSystemID: Int, spectralClass: ESI.Universe.Stars.StarID.SpectralClass, temperature: Int, typeID: Int) {
						self.age = age
						self.luminosity = luminosity
						self.name = name
						self.radius = radius
						self.solarSystemID = solarSystemID
						self.spectralClass = spectralClass
						self.temperature = temperature
						self.typeID = typeID
					}
					
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
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<ESI.Universe.Stations.StationID.Success>, AFError> {
					do {
						
						
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						let publisher = esi.publisher(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						if let progress = progress {
							return publisher
							.downloadProgress(closure: progress)
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
						}
						else {
							return publisher
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
						}
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public var maxDockableShipVolume: Double
					public var name: String
					public var officeRentalCost: Double
					public var owner: Int?
					public var position: ESI.Universe.Position
					public var raceID: Int?
					public var reprocessingEfficiency: Double
					public var reprocessingStationsTake: Double
					public var services: [ESI.Universe.Stations.StationID.Service]
					public var stationID: Int
					public var systemID: Int
					public var typeID: Int
					public init(maxDockableShipVolume: Double, name: String, officeRentalCost: Double, owner: Int?, position: ESI.Universe.Position, raceID: Int?, reprocessingEfficiency: Double, reprocessingStationsTake: Double, services: [ESI.Universe.Stations.StationID.Service], stationID: Int, systemID: Int, typeID: Int) {
						self.maxDockableShipVolume = maxDockableShipVolume
						self.name = name
						self.officeRentalCost = officeRentalCost
						self.owner = owner
						self.position = position
						self.raceID = raceID
						self.reprocessingEfficiency = reprocessingEfficiency
						self.reprocessingStationsTake = reprocessingStationsTake
						self.services = services
						self.stationID = stationID
						self.systemID = systemID
						self.typeID = typeID
					}
					
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
				
			}
			
			
			
		}
		
		public struct Structures {
			let esi: ESI
			let route: APIRoute
			
			
			public func get(filter: ESI.Universe.Structures.Filter?, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[Int64]>, AFError> {
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
					
					let publisher = esi.publisher(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
					if let progress = progress {
						return publisher
						.downloadProgress(closure: progress)
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
					else {
						return publisher
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
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
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<ESI.Universe.Structures.StructureID.Success>, AFError> {
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
						
						let publisher = esi.publisher(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						if let progress = progress {
							return publisher
							.downloadProgress(closure: progress)
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
						}
						else {
							return publisher
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
						}
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public var name: String
					public var ownerID: Int
					public var position: ESI.Universe.Position?
					public var solarSystemID: Int
					public var typeID: Int?
					public init(name: String, ownerID: Int, position: ESI.Universe.Position?, solarSystemID: Int, typeID: Int?) {
						self.name = name
						self.ownerID = ownerID
						self.position = position
						self.solarSystemID = solarSystemID
						self.typeID = typeID
					}
					
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
			
			
			public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Universe.SystemJumps.Success]>, AFError> {
				do {
					
					
					
					
					var headers = HTTPHeaders()
					headers["Accept"] = "application/json"
					
					
					var query = [URLQueryItem]()
					query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
					
					
					let url = try route.asURL()
					var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
					components.queryItems = query
					
					let publisher = esi.publisher(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
					if let progress = progress {
						return publisher
						.downloadProgress(closure: progress)
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
					else {
						return publisher
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
				}
				catch {
					return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
				}
			}
			
			
			
			
			
			
			public struct Success: Codable, Hashable {
				
				
				public var shipJumps: Int
				public var systemID: Int
				public init(shipJumps: Int, systemID: Int) {
					self.shipJumps = shipJumps
					self.systemID = systemID
				}
				
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
			
			
			public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Universe.SystemKills.Success]>, AFError> {
				do {
					
					
					
					
					var headers = HTTPHeaders()
					headers["Accept"] = "application/json"
					
					
					var query = [URLQueryItem]()
					query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
					
					
					let url = try route.asURL()
					var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
					components.queryItems = query
					
					let publisher = esi.publisher(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
					if let progress = progress {
						return publisher
						.downloadProgress(closure: progress)
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
					else {
						return publisher
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
				}
				catch {
					return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
				}
			}
			
			
			
			
			
			
			public struct Success: Codable, Hashable {
				
				
				public var npcKills: Int
				public var podKills: Int
				public var shipKills: Int
				public var systemID: Int
				public init(npcKills: Int, podKills: Int, shipKills: Int, systemID: Int) {
					self.npcKills = npcKills
					self.podKills = podKills
					self.shipKills = shipKills
					self.systemID = systemID
				}
				
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
			
			
			public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[Int]>, AFError> {
				do {
					
					
					
					
					var headers = HTTPHeaders()
					headers["Accept"] = "application/json"
					
					
					var query = [URLQueryItem]()
					query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
					
					
					let url = try route.asURL()
					var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
					components.queryItems = query
					
					let publisher = esi.publisher(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
					if let progress = progress {
						return publisher
						.downloadProgress(closure: progress)
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
					else {
						return publisher
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
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
				
				
				public func get(language: ESI.Universe.Language? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<ESI.Universe.Systems.SystemID.Success>, AFError> {
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
						
						let publisher = esi.publisher(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						if let progress = progress {
							return publisher
							.downloadProgress(closure: progress)
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
						}
						else {
							return publisher
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
						}
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public var constellationID: Int
					public var name: String
					public var planets: [ESI.Universe.Systems.SystemID.Planet]?
					public var position: ESI.Universe.Position
					public var securityClass: String?
					public var securityStatus: Double
					public var starID: Int?
					public var stargates: [Int]?
					public var stations: [Int]?
					public var systemID: Int
					public init(constellationID: Int, name: String, planets: [ESI.Universe.Systems.SystemID.Planet]?, position: ESI.Universe.Position, securityClass: String?, securityStatus: Double, starID: Int?, stargates: [Int]?, stations: [Int]?, systemID: Int) {
						self.constellationID = constellationID
						self.name = name
						self.planets = planets
						self.position = position
						self.securityClass = securityClass
						self.securityStatus = securityStatus
						self.starID = starID
						self.stargates = stargates
						self.stations = stations
						self.systemID = systemID
					}
					
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
					
					
					public var asteroidBelts: [Int]?
					public var moons: [Int]?
					public var planetID: Int
					public init(asteroidBelts: [Int]?, moons: [Int]?, planetID: Int) {
						self.asteroidBelts = asteroidBelts
						self.moons = moons
						self.planetID = planetID
					}
					
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
			
			
			public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[Int]>, AFError> {
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
					
					let publisher = esi.publisher(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
					if let progress = progress {
						return publisher
						.downloadProgress(closure: progress)
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
					else {
						return publisher
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
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
				
				
				public func get(language: ESI.Universe.Language? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<ESI.Universe.Types.TypeID.Success>, AFError> {
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
						
						let publisher = esi.publisher(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						if let progress = progress {
							return publisher
							.downloadProgress(closure: progress)
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
						}
						else {
							return publisher
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
						}
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public var capacity: Double?
					public var localizedDescription: String
					public var dogmaAttributes: [ESI.Universe.DogmaAttribute]?
					public var dogmaEffects: [ESI.Universe.DogmaEffect]?
					public var graphicID: Int?
					public var groupID: Int
					public var iconID: Int?
					public var marketGroupID: Int?
					public var mass: Double?
					public var name: String
					public var packagedVolume: Double?
					public var portionSize: Int?
					public var published: Bool
					public var radius: Double?
					public var typeID: Int
					public var volume: Double?
					public init(capacity: Double?, localizedDescription: String, dogmaAttributes: [ESI.Universe.DogmaAttribute]?, dogmaEffects: [ESI.Universe.DogmaEffect]?, graphicID: Int?, groupID: Int, iconID: Int?, marketGroupID: Int?, mass: Double?, name: String, packagedVolume: Double?, portionSize: Int?, published: Bool, radius: Double?, typeID: Int, volume: Double?) {
						self.capacity = capacity
						self.localizedDescription = localizedDescription
						self.dogmaAttributes = dogmaAttributes
						self.dogmaEffects = dogmaEffects
						self.graphicID = graphicID
						self.groupID = groupID
						self.iconID = iconID
						self.marketGroupID = marketGroupID
						self.mass = mass
						self.name = name
						self.packagedVolume = packagedVolume
						self.portionSize = portionSize
						self.published = published
						self.radius = radius
						self.typeID = typeID
						self.volume = volume
					}
					
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
		
		
		public enum Language: String, Codable, CustomStringConvertible {
			case de
			case enUS = "en-us"
			case fr
			case ja
			case ru
			case zh
			case ko
			
			public var description: String {
				return rawValue
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
		
		public struct DogmaAttribute: Codable, Hashable {
			
			
			public var attributeID: Int
			public var value: Double
			public init(attributeID: Int, value: Double) {
				self.attributeID = attributeID
				self.value = value
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case attributeID = "attribute_id"
				case value
				
				var dateFormatter: DateFormatter? {
					return nil
				}
			}
		}
		
		public struct DogmaEffect: Codable, Hashable {
			
			
			public var effectID: Int
			public var isDefault: Bool
			public init(effectID: Int, isDefault: Bool) {
				self.effectID = effectID
				self.isDefault = isDefault
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case effectID = "effect_id"
				case isDefault = "is_default"
				
				var dateFormatter: DateFormatter? {
					return nil
				}
			}
		}
		
		public enum AcceptLanguage: String, Codable, CustomStringConvertible {
			case de
			case enUS = "en-us"
			case fr
			case ja
			case ru
			case zh
			case ko
			
			public var description: String {
				return rawValue
			}
			
		}
		
	}
	
}
