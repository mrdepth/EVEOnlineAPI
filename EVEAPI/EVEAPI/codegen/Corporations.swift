import Foundation
import Alamofire
import Combine


extension ESI {
	public var corporations: Corporations {
		return Corporations(esi: self, route: .path("corporations", next: .root(ESI.apiURL)))
	}
	
	public struct Corporations {
		let esi: ESI
		let route: APIRoute
		
		
		
		public func npccorps() -> Npccorps {
			Npccorps(esi: esi, route: .path("npccorps", next: route))
		}
		public func corporationID(_ value: Int) -> CorporationID {
			CorporationID(esi: esi, route: .parameter(value, next: route))
		}
		
		public struct Npccorps {
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
			
			
			
			
			
			
			
		}
		
		public struct CorporationID {
			let esi: ESI
			let route: APIRoute
			
			
			public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<ESI.Corporations.CorporationID.Success>, AFError> {
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
			
			
			public func alliancehistory() -> Alliancehistory {
				Alliancehistory(esi: esi, route: .path("alliancehistory", next: route))
			}
			public func assets() -> Assets {
				Assets(esi: esi, route: .path("assets", next: route))
			}
			public func blueprints() -> Blueprints {
				Blueprints(esi: esi, route: .path("blueprints", next: route))
			}
			public func bookmarks() -> Bookmarks {
				Bookmarks(esi: esi, route: .path("bookmarks", next: route))
			}
			public func contacts() -> Contacts {
				Contacts(esi: esi, route: .path("contacts", next: route))
			}
			public func containers() -> Containers {
				Containers(esi: esi, route: .path("containers", next: route))
			}
			public func contracts() -> Contracts {
				Contracts(esi: esi, route: .path("contracts", next: route))
			}
			public func customsOffices() -> CustomsOffices {
				CustomsOffices(esi: esi, route: .path("customs_offices", next: route))
			}
			public func divisions() -> Divisions {
				Divisions(esi: esi, route: .path("divisions", next: route))
			}
			public func facilities() -> Facilities {
				Facilities(esi: esi, route: .path("facilities", next: route))
			}
			public func fw() -> Fw {
				Fw(esi: esi, route: .path("fw", next: route))
			}
			public func icons() -> Icons {
				Icons(esi: esi, route: .path("icons", next: route))
			}
			public func industry() -> Industry {
				Industry(esi: esi, route: .path("industry", next: route))
			}
			public func killmails() -> Killmails {
				Killmails(esi: esi, route: .path("killmails", next: route))
			}
			public func medals() -> Medals {
				Medals(esi: esi, route: .path("medals", next: route))
			}
			public func members() -> Members {
				Members(esi: esi, route: .path("members", next: route))
			}
			public func membertracking() -> Membertracking {
				Membertracking(esi: esi, route: .path("membertracking", next: route))
			}
			public func orders() -> Orders {
				Orders(esi: esi, route: .path("orders", next: route))
			}
			public func roles() -> Roles {
				Roles(esi: esi, route: .path("roles", next: route))
			}
			public func shareholders() -> Shareholders {
				Shareholders(esi: esi, route: .path("shareholders", next: route))
			}
			public func standings() -> Standings {
				Standings(esi: esi, route: .path("standings", next: route))
			}
			public func starbases() -> Starbases {
				Starbases(esi: esi, route: .path("starbases", next: route))
			}
			public func structures() -> Structures {
				Structures(esi: esi, route: .path("structures", next: route))
			}
			public func titles() -> Titles {
				Titles(esi: esi, route: .path("titles", next: route))
			}
			public func wallets() -> Wallets {
				Wallets(esi: esi, route: .path("wallets", next: route))
			}
			
			public struct Alliancehistory {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Corporations.CorporationID.Alliancehistory.Success]>, AFError> {
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
					
					
					public var allianceID: Int?
					public var isDeleted: Bool?
					public var recordID: Int
					public var startDate: Date
					public init(allianceID: Int?, isDeleted: Bool?, recordID: Int, startDate: Date) {
						self.allianceID = allianceID
						self.isDeleted = isDeleted
						self.recordID = recordID
						self.startDate = startDate
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case allianceID = "alliance_id"
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
			
			public struct Assets {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Corporations.CorporationID.Assets.Success]>, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-assets.read_corporation_assets.v1") else {throw ESIError.forbidden}
						
						
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
				
				
				public func locations() -> Locations {
					Locations(esi: esi, route: .path("locations", next: route))
				}
				public func names() -> Names {
					Names(esi: esi, route: .path("names", next: route))
				}
				
				public struct Locations {
					let esi: ESI
					let route: APIRoute
					
					
					public func post(itemIds: [Int64], cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Corporations.CorporationID.Assets.Locations.Success]>, AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-assets.read_corporation_assets.v1") else {throw ESIError.forbidden}
							let body = try JSONEncoder().encode(itemIds)
							
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
					
					
					
					
					
					
					public struct Success: Codable, Hashable {
						
						
						public var itemID: Int64
						public var position: ESI.Universe.Position
						public init(itemID: Int64, position: ESI.Universe.Position) {
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
					
					
					public func post(itemIds: [Int64], cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Corporations.CorporationID.Assets.Names.Success]>, AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-assets.read_corporation_assets.v1") else {throw ESIError.forbidden}
							let body = try JSONEncoder().encode(itemIds)
							
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
				
				
				public struct Success: Codable, Hashable {
					
					
					public var isBlueprintCopy: Bool?
					public var isSingleton: Bool
					public var itemID: Int64
					public var locationFlag: ESI.Corporations.CorporationID.LocationFlag
					public var locationID: Int64
					public var locationType: ESI.Corporations.LocationType
					public var quantity: Int
					public var typeID: Int
					public init(isBlueprintCopy: Bool?, isSingleton: Bool, itemID: Int64, locationFlag: ESI.Corporations.CorporationID.LocationFlag, locationID: Int64, locationType: ESI.Corporations.LocationType, quantity: Int, typeID: Int) {
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
			
			public struct Blueprints {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Corporations.CorporationID.Blueprints.Success]>, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-corporations.read_blueprints.v1") else {throw ESIError.forbidden}
						
						
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
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public var itemID: Int64
					public var locationFlag: ESI.Corporations.CorporationID.LocationFlag
					public var locationID: Int64
					public var materialEfficiency: Int
					public var quantity: Int
					public var runs: Int
					public var timeEfficiency: Int
					public var typeID: Int
					public init(itemID: Int64, locationFlag: ESI.Corporations.CorporationID.LocationFlag, locationID: Int64, materialEfficiency: Int, quantity: Int, runs: Int, timeEfficiency: Int, typeID: Int) {
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
				
			}
			
			public struct Bookmarks {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Corporations.CorporationID.Bookmarks.Success]>, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-bookmarks.read_corporation_bookmarks.v1") else {throw ESIError.forbidden}
						
						
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
				
				
				public func folders() -> Folders {
					Folders(esi: esi, route: .path("folders", next: route))
				}
				
				public struct Folders {
					let esi: ESI
					let route: APIRoute
					
					
					public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Corporations.CorporationID.Bookmarks.Folders.Success]>, AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-bookmarks.read_corporation_bookmarks.v1") else {throw ESIError.forbidden}
							
							
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
					
					
					
					
					
					
					public struct Success: Codable, Hashable {
						
						
						public var creatorID: Int?
						public var folderID: Int
						public var name: String
						public init(creatorID: Int?, folderID: Int, name: String) {
							self.creatorID = creatorID
							self.folderID = folderID
							self.name = name
						}
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case creatorID = "creator_id"
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
					public var coordinates: ESI.Corporations.Coordinates?
					public var created: Date
					public var creatorID: Int
					public var folderID: Int?
					public var item: ESI.Corporations.Item?
					public var label: String
					public var locationID: Int
					public var notes: String
					public init(bookmarkID: Int, coordinates: ESI.Corporations.Coordinates?, created: Date, creatorID: Int, folderID: Int?, item: ESI.Corporations.Item?, label: String, locationID: Int, notes: String) {
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
			
			public struct Contacts {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Corporations.CorporationID.Contacts.Success]>, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-corporations.read_contacts.v1") else {throw ESIError.forbidden}
						
						
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
				
				
				public func labels() -> Labels {
					Labels(esi: esi, route: .path("labels", next: route))
				}
				
				public struct Labels {
					let esi: ESI
					let route: APIRoute
					
					
					public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Corporations.CorporationID.Contacts.Labels.Success]>, AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-corporations.read_contacts.v1") else {throw ESIError.forbidden}
							
							
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
					public var contactType: ESI.Corporations.ContactType
					public var isWatched: Bool?
					public var labelIds: [Int64]?
					public var standing: Double
					public init(contactID: Int, contactType: ESI.Corporations.ContactType, isWatched: Bool?, labelIds: [Int64]?, standing: Double) {
						self.contactID = contactID
						self.contactType = contactType
						self.isWatched = isWatched
						self.labelIds = labelIds
						self.standing = standing
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case contactID = "contact_id"
						case contactType = "contact_type"
						case isWatched = "is_watched"
						case labelIds = "label_ids"
						case standing
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
			}
			
			public struct Containers {
				let esi: ESI
				let route: APIRoute
				
				
				
				public func logs() -> Logs {
					Logs(esi: esi, route: .path("logs", next: route))
				}
				
				public struct Logs {
					let esi: ESI
					let route: APIRoute
					
					
					public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Corporations.CorporationID.Containers.Logs.Success]>, AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-corporations.read_container_logs.v1") else {throw ESIError.forbidden}
							
							
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
					
					
					
					
					
					
					public enum Action: String, Codable, CustomStringConvertible {
						case add
						case assemble
						case configure
						case enterPassword = "enter_password"
						case lock
						case move
						case repackage
						case setName = "set_name"
						case setPassword = "set_password"
						case unlock
						
						public var description: String {
							return rawValue
						}
						
					}
					
					public struct Success: Codable, Hashable {
						
						
						public var action: ESI.Corporations.CorporationID.Containers.Logs.Action
						public var characterID: Int
						public var containerID: Int64
						public var containerTypeID: Int
						public var locationFlag: ESI.Corporations.CorporationID.LocationFlag
						public var locationID: Int64
						public var loggedAt: Date
						public var newConfigBitmask: Int?
						public var oldConfigBitmask: Int?
						public var passwordType: ESI.Corporations.CorporationID.Containers.Logs.PasswordType?
						public var quantity: Int?
						public var typeID: Int?
						public init(action: ESI.Corporations.CorporationID.Containers.Logs.Action, characterID: Int, containerID: Int64, containerTypeID: Int, locationFlag: ESI.Corporations.CorporationID.LocationFlag, locationID: Int64, loggedAt: Date, newConfigBitmask: Int?, oldConfigBitmask: Int?, passwordType: ESI.Corporations.CorporationID.Containers.Logs.PasswordType?, quantity: Int?, typeID: Int?) {
							self.action = action
							self.characterID = characterID
							self.containerID = containerID
							self.containerTypeID = containerTypeID
							self.locationFlag = locationFlag
							self.locationID = locationID
							self.loggedAt = loggedAt
							self.newConfigBitmask = newConfigBitmask
							self.oldConfigBitmask = oldConfigBitmask
							self.passwordType = passwordType
							self.quantity = quantity
							self.typeID = typeID
						}
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case action
							case characterID = "character_id"
							case containerID = "container_id"
							case containerTypeID = "container_type_id"
							case locationFlag = "location_flag"
							case locationID = "location_id"
							case loggedAt = "logged_at"
							case newConfigBitmask = "new_config_bitmask"
							case oldConfigBitmask = "old_config_bitmask"
							case passwordType = "password_type"
							case quantity
							case typeID = "type_id"
							
							var dateFormatter: DateFormatter? {
								switch self {
									case .loggedAt:
									return DateFormatter.esiDateTimeFormatter
									default:
									return nil
								}
							}
						}
					}
					
					public enum PasswordType: String, Codable, CustomStringConvertible {
						case config
						case general
						
						public var description: String {
							return rawValue
						}
						
					}
					
				}
				
				
				
			}
			
			public struct Contracts {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Corporations.CorporationID.Contracts.Success]>, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-contracts.read_corporation_contracts.v1") else {throw ESIError.forbidden}
						
						
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
						
						
						public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Corporations.CorporationID.Contracts.ContractID.Bids.Success]>, AFError> {
							do {
								
								let scopes = esi.token?.scopes ?? []
								guard scopes.contains("esi-contracts.read_corporation_contracts.v1") else {throw ESIError.forbidden}
								
								
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
						
						
						public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Corporations.CorporationID.Contracts.ContractID.Items.Success]>, AFError> {
							do {
								
								let scopes = esi.token?.scopes ?? []
								guard scopes.contains("esi-contracts.read_corporation_contracts.v1") else {throw ESIError.forbidden}
								
								
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
					public var availability: ESI.Corporations.Availability
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
					public var status: ESI.Corporations.CorporationID.Contracts.Status
					public var title: String?
					public var type: ESI.Contracts.ValueType
					public var volume: Double?
					public init(acceptorID: Int, assigneeID: Int, availability: ESI.Corporations.Availability, buyout: Double?, collateral: Double?, contractID: Int, dateAccepted: Date?, dateCompleted: Date?, dateExpired: Date, dateIssued: Date, daysToComplete: Int?, endLocationID: Int64?, forCorporation: Bool, issuerCorporationID: Int, issuerID: Int, price: Double?, reward: Double?, startLocationID: Int64?, status: ESI.Corporations.CorporationID.Contracts.Status, title: String?, type: ESI.Contracts.ValueType, volume: Double?) {
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
			
			public struct CustomsOffices {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Corporations.CorporationID.CustomsOffices.Success]>, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-planets.read_customs_offices.v1") else {throw ESIError.forbidden}
						
						
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
				
				
				
				
				
				
				public enum StandingLevel: String, Codable, CustomStringConvertible {
					case bad
					case excellent
					case good
					case neutral
					case terrible
					
					public var description: String {
						return rawValue
					}
					
				}
				
				public struct Success: Codable, Hashable {
					
					
					public var allianceTaxRate: Double?
					public var allowAccessWithStandings: Bool
					public var allowAllianceAccess: Bool
					public var badStandingTaxRate: Double?
					public var corporationTaxRate: Double?
					public var excellentStandingTaxRate: Double?
					public var goodStandingTaxRate: Double?
					public var neutralStandingTaxRate: Double?
					public var officeID: Int64
					public var reinforceExitEnd: Int
					public var reinforceExitStart: Int
					public var standingLevel: ESI.Corporations.CorporationID.CustomsOffices.StandingLevel?
					public var systemID: Int
					public var terribleStandingTaxRate: Double?
					public init(allianceTaxRate: Double?, allowAccessWithStandings: Bool, allowAllianceAccess: Bool, badStandingTaxRate: Double?, corporationTaxRate: Double?, excellentStandingTaxRate: Double?, goodStandingTaxRate: Double?, neutralStandingTaxRate: Double?, officeID: Int64, reinforceExitEnd: Int, reinforceExitStart: Int, standingLevel: ESI.Corporations.CorporationID.CustomsOffices.StandingLevel?, systemID: Int, terribleStandingTaxRate: Double?) {
						self.allianceTaxRate = allianceTaxRate
						self.allowAccessWithStandings = allowAccessWithStandings
						self.allowAllianceAccess = allowAllianceAccess
						self.badStandingTaxRate = badStandingTaxRate
						self.corporationTaxRate = corporationTaxRate
						self.excellentStandingTaxRate = excellentStandingTaxRate
						self.goodStandingTaxRate = goodStandingTaxRate
						self.neutralStandingTaxRate = neutralStandingTaxRate
						self.officeID = officeID
						self.reinforceExitEnd = reinforceExitEnd
						self.reinforceExitStart = reinforceExitStart
						self.standingLevel = standingLevel
						self.systemID = systemID
						self.terribleStandingTaxRate = terribleStandingTaxRate
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case allianceTaxRate = "alliance_tax_rate"
						case allowAccessWithStandings = "allow_access_with_standings"
						case allowAllianceAccess = "allow_alliance_access"
						case badStandingTaxRate = "bad_standing_tax_rate"
						case corporationTaxRate = "corporation_tax_rate"
						case excellentStandingTaxRate = "excellent_standing_tax_rate"
						case goodStandingTaxRate = "good_standing_tax_rate"
						case neutralStandingTaxRate = "neutral_standing_tax_rate"
						case officeID = "office_id"
						case reinforceExitEnd = "reinforce_exit_end"
						case reinforceExitStart = "reinforce_exit_start"
						case standingLevel = "standing_level"
						case systemID = "system_id"
						case terribleStandingTaxRate = "terrible_standing_tax_rate"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
			}
			
			public struct Divisions {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<ESI.Corporations.CorporationID.Divisions.Success>, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-corporations.read_divisions.v1") else {throw ESIError.forbidden}
						
						
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
					
					
					public var hangar: [ESI.Corporations.CorporationID.Divisions.HangarHangar]?
					public var wallet: [ESI.Corporations.CorporationID.Divisions.WalletWallet]?
					public init(hangar: [ESI.Corporations.CorporationID.Divisions.HangarHangar]?, wallet: [ESI.Corporations.CorporationID.Divisions.WalletWallet]?) {
						self.hangar = hangar
						self.wallet = wallet
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case hangar
						case wallet
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct HangarHangar: Codable, Hashable {
					
					
					public var division: Int?
					public var name: String?
					public init(division: Int?, name: String?) {
						self.division = division
						self.name = name
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case division
						case name
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct WalletWallet: Codable, Hashable {
					
					
					public var division: Int?
					public var name: String?
					public init(division: Int?, name: String?) {
						self.division = division
						self.name = name
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case division
						case name
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
			}
			
			public struct Facilities {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Corporations.CorporationID.Facilities.Success]>, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-corporations.read_facilities.v1") else {throw ESIError.forbidden}
						
						
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
					
					
					public var facilityID: Int64
					public var systemID: Int
					public var typeID: Int
					public init(facilityID: Int64, systemID: Int, typeID: Int) {
						self.facilityID = facilityID
						self.systemID = systemID
						self.typeID = typeID
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case facilityID = "facility_id"
						case systemID = "system_id"
						case typeID = "type_id"
						
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
					
					
					public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<ESI.Corporations.CorporationID.Fw.Stats.Success>, AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-corporations.read_fw_stats.v1") else {throw ESIError.forbidden}
							
							
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
						
						
						public var enlistedOn: Date?
						public var factionID: Int?
						public var kills: ESI.Fw.Kills
						public var pilots: Int?
						public var victoryPoints: ESI.Fw.VictoryPoints
						public init(enlistedOn: Date?, factionID: Int?, kills: ESI.Fw.Kills, pilots: Int?, victoryPoints: ESI.Fw.VictoryPoints) {
							self.enlistedOn = enlistedOn
							self.factionID = factionID
							self.kills = kills
							self.pilots = pilots
							self.victoryPoints = victoryPoints
						}
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case enlistedOn = "enlisted_on"
							case factionID = "faction_id"
							case kills
							case pilots
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
			
			public struct Icons {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<ESI.Corporations.CorporationID.Icons.Success>, AFError> {
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
					
					
					public var px128x128: String?
					public var px256x256: String?
					public var px64x64: String?
					public init(px128x128: String?, px256x256: String?, px64x64: String?) {
						self.px128x128 = px128x128
						self.px256x256 = px256x256
						self.px64x64 = px64x64
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case px128x128
						case px256x256
						case px64x64
						
						var dateFormatter: DateFormatter? {
							return nil
						}
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
					
					
					public func get(includeCompleted: Bool? = nil, page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Corporations.CorporationID.Industry.Jobs.Success]>, AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-industry.read_corporation_jobs.v1") else {throw ESIError.forbidden}
							
							
							var headers = HTTPHeaders()
							headers["Accept"] = "application/json"
							
							
							var query = [URLQueryItem]()
							query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
							if let includeCompleted = includeCompleted {
								query.append(URLQueryItem(name: "include_completed", value: includeCompleted.description))
							}
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
						public var locationID: Int64
						public var outputLocationID: Int64
						public var pauseDate: Date?
						public var probability: Double?
						public var productTypeID: Int?
						public var runs: Int
						public var startDate: Date
						public var status: ESI.Corporations.CorporationID.Industry.Jobs.Status
						public var successfulRuns: Int?
						public init(activityID: Int, blueprintID: Int64, blueprintLocationID: Int64, blueprintTypeID: Int, completedCharacterID: Int?, completedDate: Date?, cost: Double?, duration: Int, endDate: Date, facilityID: Int64, installerID: Int, jobID: Int, licensedRuns: Int?, locationID: Int64, outputLocationID: Int64, pauseDate: Date?, probability: Double?, productTypeID: Int?, runs: Int, startDate: Date, status: ESI.Corporations.CorporationID.Industry.Jobs.Status, successfulRuns: Int?) {
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
							self.locationID = locationID
							self.outputLocationID = outputLocationID
							self.pauseDate = pauseDate
							self.probability = probability
							self.productTypeID = productTypeID
							self.runs = runs
							self.startDate = startDate
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
							case locationID = "location_id"
							case outputLocationID = "output_location_id"
							case pauseDate = "pause_date"
							case probability
							case productTypeID = "product_type_id"
							case runs
							case startDate = "start_date"
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
					
					
					public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Wars.Success]>, AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-killmails.read_corporation_killmails.v1") else {throw ESIError.forbidden}
							
							
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
					
					
					
					
					
					
					
				}
				
				
				
			}
			
			public struct Medals {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Corporations.CorporationID.Medals.Success]>, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-corporations.read_medals.v1") else {throw ESIError.forbidden}
						
						
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
				
				
				public func issued() -> Issued {
					Issued(esi: esi, route: .path("issued", next: route))
				}
				
				public struct Issued {
					let esi: ESI
					let route: APIRoute
					
					
					public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Corporations.CorporationID.Medals.Issued.Success]>, AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-corporations.read_medals.v1") else {throw ESIError.forbidden}
							
							
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
					
					
					
					
					
					
					public enum Status: String, Codable, CustomStringConvertible {
						case `private` = "private"
						case `public` = "public"
						
						public var description: String {
							return rawValue
						}
						
					}
					
					public struct Success: Codable, Hashable {
						
						
						public var characterID: Int
						public var issuedAt: Date
						public var issuerID: Int
						public var medalID: Int
						public var reason: String
						public var status: ESI.Corporations.CorporationID.Medals.Issued.Status
						public init(characterID: Int, issuedAt: Date, issuerID: Int, medalID: Int, reason: String, status: ESI.Corporations.CorporationID.Medals.Issued.Status) {
							self.characterID = characterID
							self.issuedAt = issuedAt
							self.issuerID = issuerID
							self.medalID = medalID
							self.reason = reason
							self.status = status
						}
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case characterID = "character_id"
							case issuedAt = "issued_at"
							case issuerID = "issuer_id"
							case medalID = "medal_id"
							case reason
							case status
							
							var dateFormatter: DateFormatter? {
								switch self {
									case .issuedAt:
									return DateFormatter.esiDateTimeFormatter
									default:
									return nil
								}
							}
						}
					}
					
				}
				
				
				public struct Success: Codable, Hashable {
					
					
					public var createdAt: Date
					public var creatorID: Int
					public var localizedDescription: String
					public var medalID: Int
					public var title: String
					public init(createdAt: Date, creatorID: Int, localizedDescription: String, medalID: Int, title: String) {
						self.createdAt = createdAt
						self.creatorID = creatorID
						self.localizedDescription = localizedDescription
						self.medalID = medalID
						self.title = title
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case createdAt = "created_at"
						case creatorID = "creator_id"
						case localizedDescription = "description"
						case medalID = "medal_id"
						case title
						
						var dateFormatter: DateFormatter? {
							switch self {
								case .createdAt:
								return DateFormatter.esiDateTimeFormatter
								default:
								return nil
							}
						}
					}
				}
				
			}
			
			public struct Members {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[Int]>, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-corporations.read_corporation_membership.v1") else {throw ESIError.forbidden}
						
						
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
				
				
				public func limit() -> Limit {
					Limit(esi: esi, route: .path("limit", next: route))
				}
				public func titles() -> Titles {
					Titles(esi: esi, route: .path("titles", next: route))
				}
				
				public struct Limit {
					let esi: ESI
					let route: APIRoute
					
					
					public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<Int>, AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-corporations.track_members.v1") else {throw ESIError.forbidden}
							
							
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
					
					
					
					
					
					
					
				}
				
				public struct Titles {
					let esi: ESI
					let route: APIRoute
					
					
					public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Corporations.CorporationID.Members.Titles.Success]>, AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-corporations.read_titles.v1") else {throw ESIError.forbidden}
							
							
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
						
						
						public var characterID: Int
						public var titles: [Int]
						public init(characterID: Int, titles: [Int]) {
							self.characterID = characterID
							self.titles = titles
						}
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case characterID = "character_id"
							case titles
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
				}
				
				
				
			}
			
			public struct Membertracking {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Corporations.CorporationID.Membertracking.Success]>, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-corporations.track_members.v1") else {throw ESIError.forbidden}
						
						
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
					
					
					public var baseID: Int?
					public var characterID: Int
					public var locationID: Int64?
					public var logoffDate: Date?
					public var logonDate: Date?
					public var shipTypeID: Int?
					public var startDate: Date?
					public init(baseID: Int?, characterID: Int, locationID: Int64?, logoffDate: Date?, logonDate: Date?, shipTypeID: Int?, startDate: Date?) {
						self.baseID = baseID
						self.characterID = characterID
						self.locationID = locationID
						self.logoffDate = logoffDate
						self.logonDate = logonDate
						self.shipTypeID = shipTypeID
						self.startDate = startDate
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case baseID = "base_id"
						case characterID = "character_id"
						case locationID = "location_id"
						case logoffDate = "logoff_date"
						case logonDate = "logon_date"
						case shipTypeID = "ship_type_id"
						case startDate = "start_date"
						
						var dateFormatter: DateFormatter? {
							switch self {
								case .logoffDate:
								return DateFormatter.esiDateTimeFormatter
								case .logonDate:
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
			
			public struct Orders {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Corporations.CorporationID.Orders.Success]>, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-markets.read_corporation_orders.v1") else {throw ESIError.forbidden}
						
						
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
				
				
				public func history() -> History {
					History(esi: esi, route: .path("history", next: route))
				}
				
				public struct History {
					let esi: ESI
					let route: APIRoute
					
					
					public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Corporations.CorporationID.Orders.History.Success]>, AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-markets.read_corporation_orders.v1") else {throw ESIError.forbidden}
							
							
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
					
					
					
					
					
					
					public struct Success: Codable, Hashable {
						
						
						public var duration: Int
						public var escrow: Double?
						public var isBuyOrder: Bool?
						public var issued: Date
						public var issuedBy: Int?
						public var locationID: Int64
						public var minVolume: Int?
						public var orderID: Int64
						public var price: Double
						public var range: ESI.Corporations.Range
						public var regionID: Int
						public var state: ESI.Corporations.State
						public var typeID: Int
						public var volumeRemain: Int
						public var volumeTotal: Int
						public var walletDivision: Int
						public init(duration: Int, escrow: Double?, isBuyOrder: Bool?, issued: Date, issuedBy: Int?, locationID: Int64, minVolume: Int?, orderID: Int64, price: Double, range: ESI.Corporations.Range, regionID: Int, state: ESI.Corporations.State, typeID: Int, volumeRemain: Int, volumeTotal: Int, walletDivision: Int) {
							self.duration = duration
							self.escrow = escrow
							self.isBuyOrder = isBuyOrder
							self.issued = issued
							self.issuedBy = issuedBy
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
							self.walletDivision = walletDivision
						}
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case duration
							case escrow
							case isBuyOrder = "is_buy_order"
							case issued
							case issuedBy = "issued_by"
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
							case walletDivision = "wallet_division"
							
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
					public var issued: Date
					public var issuedBy: Int
					public var locationID: Int64
					public var minVolume: Int?
					public var orderID: Int64
					public var price: Double
					public var range: ESI.Corporations.Range
					public var regionID: Int
					public var typeID: Int
					public var volumeRemain: Int
					public var volumeTotal: Int
					public var walletDivision: Int
					public init(duration: Int, escrow: Double?, isBuyOrder: Bool?, issued: Date, issuedBy: Int, locationID: Int64, minVolume: Int?, orderID: Int64, price: Double, range: ESI.Corporations.Range, regionID: Int, typeID: Int, volumeRemain: Int, volumeTotal: Int, walletDivision: Int) {
						self.duration = duration
						self.escrow = escrow
						self.isBuyOrder = isBuyOrder
						self.issued = issued
						self.issuedBy = issuedBy
						self.locationID = locationID
						self.minVolume = minVolume
						self.orderID = orderID
						self.price = price
						self.range = range
						self.regionID = regionID
						self.typeID = typeID
						self.volumeRemain = volumeRemain
						self.volumeTotal = volumeTotal
						self.walletDivision = walletDivision
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case duration
						case escrow
						case isBuyOrder = "is_buy_order"
						case issued
						case issuedBy = "issued_by"
						case locationID = "location_id"
						case minVolume = "min_volume"
						case orderID = "order_id"
						case price
						case range
						case regionID = "region_id"
						case typeID = "type_id"
						case volumeRemain = "volume_remain"
						case volumeTotal = "volume_total"
						case walletDivision = "wallet_division"
						
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
			
			public struct Roles {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Corporations.CorporationID.Roles.Success]>, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-corporations.read_corporation_membership.v1") else {throw ESIError.forbidden}
						
						
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
				
				
				public func history() -> History {
					History(esi: esi, route: .path("history", next: route))
				}
				
				public struct History {
					let esi: ESI
					let route: APIRoute
					
					
					public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Corporations.CorporationID.Roles.History.Success]>, AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-corporations.read_corporation_membership.v1") else {throw ESIError.forbidden}
							
							
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
					
					
					
					
					
					
					public struct Success: Codable, Hashable {
						
						
						public var changedAt: Date
						public var characterID: Int
						public var issuerID: Int
						public var newRoles: [ESI.Corporations.CorporationID.Roles.History.NewRole]
						public var oldRoles: [ESI.Corporations.CorporationID.Roles.History.OldRole]
						public var roleType: ESI.Corporations.CorporationID.Roles.History.RoleType
						public init(changedAt: Date, characterID: Int, issuerID: Int, newRoles: [ESI.Corporations.CorporationID.Roles.History.NewRole], oldRoles: [ESI.Corporations.CorporationID.Roles.History.OldRole], roleType: ESI.Corporations.CorporationID.Roles.History.RoleType) {
							self.changedAt = changedAt
							self.characterID = characterID
							self.issuerID = issuerID
							self.newRoles = newRoles
							self.oldRoles = oldRoles
							self.roleType = roleType
						}
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case changedAt = "changed_at"
							case characterID = "character_id"
							case issuerID = "issuer_id"
							case newRoles = "new_roles"
							case oldRoles = "old_roles"
							case roleType = "role_type"
							
							var dateFormatter: DateFormatter? {
								switch self {
									case .changedAt:
									return DateFormatter.esiDateTimeFormatter
									default:
									return nil
								}
							}
						}
					}
					
					public enum RoleType: String, Codable, CustomStringConvertible {
						case grantableRoles = "grantable_roles"
						case grantableRolesAtBase = "grantable_roles_at_base"
						case grantableRolesAtHq = "grantable_roles_at_hq"
						case grantableRolesAtOther = "grantable_roles_at_other"
						case roles
						case rolesAtBase = "roles_at_base"
						case rolesAtHq = "roles_at_hq"
						case rolesAtOther = "roles_at_other"
						
						public var description: String {
							return rawValue
						}
						
					}
					
					public enum NewRole: String, Codable, CustomStringConvertible {
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
					
					public enum OldRole: String, Codable, CustomStringConvertible {
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
					
				}
				
				
				public struct Success: Codable, Hashable {
					
					
					public var characterID: Int
					public var grantableRoles: [ESI.Corporations.CorporationID.GrantableRole]?
					public var grantableRolesAtBase: [ESI.Corporations.CorporationID.GrantableRolesAtBaseGrantableRolesAtBase]?
					public var grantableRolesAtHq: [ESI.Corporations.CorporationID.GrantableRolesAtHqGrantableRolesAtHq]?
					public var grantableRolesAtOther: [ESI.Corporations.CorporationID.GrantableRolesAtOtherGrantableRolesAtOther]?
					public var roles: [ESI.Corporations.Role]?
					public var rolesAtBase: [ESI.Corporations.RolesAtBaseRolesAtBase]?
					public var rolesAtHq: [ESI.Corporations.RolesAtHqRolesAtHq]?
					public var rolesAtOther: [ESI.Corporations.RolesAtOtherRolesAtOther]?
					public init(characterID: Int, grantableRoles: [ESI.Corporations.CorporationID.GrantableRole]?, grantableRolesAtBase: [ESI.Corporations.CorporationID.GrantableRolesAtBaseGrantableRolesAtBase]?, grantableRolesAtHq: [ESI.Corporations.CorporationID.GrantableRolesAtHqGrantableRolesAtHq]?, grantableRolesAtOther: [ESI.Corporations.CorporationID.GrantableRolesAtOtherGrantableRolesAtOther]?, roles: [ESI.Corporations.Role]?, rolesAtBase: [ESI.Corporations.RolesAtBaseRolesAtBase]?, rolesAtHq: [ESI.Corporations.RolesAtHqRolesAtHq]?, rolesAtOther: [ESI.Corporations.RolesAtOtherRolesAtOther]?) {
						self.characterID = characterID
						self.grantableRoles = grantableRoles
						self.grantableRolesAtBase = grantableRolesAtBase
						self.grantableRolesAtHq = grantableRolesAtHq
						self.grantableRolesAtOther = grantableRolesAtOther
						self.roles = roles
						self.rolesAtBase = rolesAtBase
						self.rolesAtHq = rolesAtHq
						self.rolesAtOther = rolesAtOther
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case characterID = "character_id"
						case grantableRoles = "grantable_roles"
						case grantableRolesAtBase = "grantable_roles_at_base"
						case grantableRolesAtHq = "grantable_roles_at_hq"
						case grantableRolesAtOther = "grantable_roles_at_other"
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
			
			public struct Shareholders {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Corporations.CorporationID.Shareholders.Success]>, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-wallet.read_corporation_wallets.v1") else {throw ESIError.forbidden}
						
						
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
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public var shareCount: Int64
					public var shareholderID: Int
					public var shareholderType: ESI.Corporations.CorporationID.Shareholders.ShareholderType
					public init(shareCount: Int64, shareholderID: Int, shareholderType: ESI.Corporations.CorporationID.Shareholders.ShareholderType) {
						self.shareCount = shareCount
						self.shareholderID = shareholderID
						self.shareholderType = shareholderType
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case shareCount = "share_count"
						case shareholderID = "shareholder_id"
						case shareholderType = "shareholder_type"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public enum ShareholderType: String, Codable, CustomStringConvertible {
					case character
					case corporation
					
					public var description: String {
						return rawValue
					}
					
				}
				
			}
			
			public struct Standings {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Corporations.CorporationID.Standings.Success]>, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-corporations.read_standings.v1") else {throw ESIError.forbidden}
						
						
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
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public var fromID: Int
					public var fromType: ESI.Corporations.FromType
					public var standing: Double
					public init(fromID: Int, fromType: ESI.Corporations.FromType, standing: Double) {
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
			
			public struct Starbases {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Corporations.CorporationID.Starbases.Success]>, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-corporations.read_starbases.v1") else {throw ESIError.forbidden}
						
						
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
				
				
				public func starbaseID(_ value: Int64) -> StarbaseID {
					StarbaseID(esi: esi, route: .parameter(value, next: route))
				}
				
				public struct StarbaseID {
					let esi: ESI
					let route: APIRoute
					
					
					public func get(systemID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<ESI.Corporations.CorporationID.Starbases.StarbaseID.Success>, AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-corporations.read_starbases.v1") else {throw ESIError.forbidden}
							
							
							var headers = HTTPHeaders()
							headers["Accept"] = "application/json"
							
							
							var query = [URLQueryItem]()
							query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
							query.append(URLQueryItem(name: "system_id", value: systemID.description))
							
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
					
					
					
					
					
					
					public enum Unanchor: String, Codable, CustomStringConvertible {
						case allianceMember = "alliance_member"
						case configStarbaseEquipmentRole = "config_starbase_equipment_role"
						case corporationMember = "corporation_member"
						case starbaseFuelTechnicianRole = "starbase_fuel_technician_role"
						
						public var description: String {
							return rawValue
						}
						
					}
					
					public enum FuelBayView: String, Codable, CustomStringConvertible {
						case allianceMember = "alliance_member"
						case configStarbaseEquipmentRole = "config_starbase_equipment_role"
						case corporationMember = "corporation_member"
						case starbaseFuelTechnicianRole = "starbase_fuel_technician_role"
						
						public var description: String {
							return rawValue
						}
						
					}
					
					public enum Offline: String, Codable, CustomStringConvertible {
						case allianceMember = "alliance_member"
						case configStarbaseEquipmentRole = "config_starbase_equipment_role"
						case corporationMember = "corporation_member"
						case starbaseFuelTechnicianRole = "starbase_fuel_technician_role"
						
						public var description: String {
							return rawValue
						}
						
					}
					
					public struct Fuel: Codable, Hashable {
						
						
						public var quantity: Int
						public var typeID: Int
						public init(quantity: Int, typeID: Int) {
							self.quantity = quantity
							self.typeID = typeID
						}
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case quantity
							case typeID = "type_id"
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
					public struct Success: Codable, Hashable {
						
						
						public var allowAllianceMembers: Bool
						public var allowCorporationMembers: Bool
						public var anchor: ESI.Corporations.CorporationID.Starbases.StarbaseID.Anchor
						public var attackIfAtWar: Bool
						public var attackIfOtherSecurityStatusDropping: Bool
						public var attackSecurityStatusThreshold: Double?
						public var attackStandingThreshold: Double?
						public var fuelBayTake: ESI.Corporations.CorporationID.Starbases.StarbaseID.FuelBayTake
						public var fuelBayView: ESI.Corporations.CorporationID.Starbases.StarbaseID.FuelBayView
						public var fuels: [ESI.Corporations.CorporationID.Starbases.StarbaseID.Fuel]?
						public var offline: ESI.Corporations.CorporationID.Starbases.StarbaseID.Offline
						public var online: ESI.Corporations.CorporationID.Starbases.StarbaseID.Online
						public var unanchor: ESI.Corporations.CorporationID.Starbases.StarbaseID.Unanchor
						public var useAllianceStandings: Bool
						public init(allowAllianceMembers: Bool, allowCorporationMembers: Bool, anchor: ESI.Corporations.CorporationID.Starbases.StarbaseID.Anchor, attackIfAtWar: Bool, attackIfOtherSecurityStatusDropping: Bool, attackSecurityStatusThreshold: Double?, attackStandingThreshold: Double?, fuelBayTake: ESI.Corporations.CorporationID.Starbases.StarbaseID.FuelBayTake, fuelBayView: ESI.Corporations.CorporationID.Starbases.StarbaseID.FuelBayView, fuels: [ESI.Corporations.CorporationID.Starbases.StarbaseID.Fuel]?, offline: ESI.Corporations.CorporationID.Starbases.StarbaseID.Offline, online: ESI.Corporations.CorporationID.Starbases.StarbaseID.Online, unanchor: ESI.Corporations.CorporationID.Starbases.StarbaseID.Unanchor, useAllianceStandings: Bool) {
							self.allowAllianceMembers = allowAllianceMembers
							self.allowCorporationMembers = allowCorporationMembers
							self.anchor = anchor
							self.attackIfAtWar = attackIfAtWar
							self.attackIfOtherSecurityStatusDropping = attackIfOtherSecurityStatusDropping
							self.attackSecurityStatusThreshold = attackSecurityStatusThreshold
							self.attackStandingThreshold = attackStandingThreshold
							self.fuelBayTake = fuelBayTake
							self.fuelBayView = fuelBayView
							self.fuels = fuels
							self.offline = offline
							self.online = online
							self.unanchor = unanchor
							self.useAllianceStandings = useAllianceStandings
						}
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case allowAllianceMembers = "allow_alliance_members"
							case allowCorporationMembers = "allow_corporation_members"
							case anchor
							case attackIfAtWar = "attack_if_at_war"
							case attackIfOtherSecurityStatusDropping = "attack_if_other_security_status_dropping"
							case attackSecurityStatusThreshold = "attack_security_status_threshold"
							case attackStandingThreshold = "attack_standing_threshold"
							case fuelBayTake = "fuel_bay_take"
							case fuelBayView = "fuel_bay_view"
							case fuels
							case offline
							case online
							case unanchor
							case useAllianceStandings = "use_alliance_standings"
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
					public enum FuelBayTake: String, Codable, CustomStringConvertible {
						case allianceMember = "alliance_member"
						case configStarbaseEquipmentRole = "config_starbase_equipment_role"
						case corporationMember = "corporation_member"
						case starbaseFuelTechnicianRole = "starbase_fuel_technician_role"
						
						public var description: String {
							return rawValue
						}
						
					}
					
					public enum Online: String, Codable, CustomStringConvertible {
						case allianceMember = "alliance_member"
						case configStarbaseEquipmentRole = "config_starbase_equipment_role"
						case corporationMember = "corporation_member"
						case starbaseFuelTechnicianRole = "starbase_fuel_technician_role"
						
						public var description: String {
							return rawValue
						}
						
					}
					
					public enum Anchor: String, Codable, CustomStringConvertible {
						case allianceMember = "alliance_member"
						case configStarbaseEquipmentRole = "config_starbase_equipment_role"
						case corporationMember = "corporation_member"
						case starbaseFuelTechnicianRole = "starbase_fuel_technician_role"
						
						public var description: String {
							return rawValue
						}
						
					}
					
				}
				
				
				public struct Success: Codable, Hashable {
					
					
					public var moonID: Int?
					public var onlinedSince: Date?
					public var reinforcedUntil: Date?
					public var starbaseID: Int64
					public var state: ESI.Corporations.CorporationID.Starbases.State?
					public var systemID: Int
					public var typeID: Int
					public var unanchorAt: Date?
					public init(moonID: Int?, onlinedSince: Date?, reinforcedUntil: Date?, starbaseID: Int64, state: ESI.Corporations.CorporationID.Starbases.State?, systemID: Int, typeID: Int, unanchorAt: Date?) {
						self.moonID = moonID
						self.onlinedSince = onlinedSince
						self.reinforcedUntil = reinforcedUntil
						self.starbaseID = starbaseID
						self.state = state
						self.systemID = systemID
						self.typeID = typeID
						self.unanchorAt = unanchorAt
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case moonID = "moon_id"
						case onlinedSince = "onlined_since"
						case reinforcedUntil = "reinforced_until"
						case starbaseID = "starbase_id"
						case state
						case systemID = "system_id"
						case typeID = "type_id"
						case unanchorAt = "unanchor_at"
						
						var dateFormatter: DateFormatter? {
							switch self {
								case .onlinedSince:
								return DateFormatter.esiDateTimeFormatter
								case .reinforcedUntil:
								return DateFormatter.esiDateTimeFormatter
								case .unanchorAt:
								return DateFormatter.esiDateTimeFormatter
								default:
								return nil
							}
						}
					}
				}
				
				public enum State: String, Codable, CustomStringConvertible {
					case offline
					case online
					case onlining
					case reinforced
					case unanchoring
					
					public var description: String {
						return rawValue
					}
					
				}
				
			}
			
			public struct Structures {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(language: ESI.Markets.Language? = nil, page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Corporations.CorporationID.Structures.Success]>, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-corporations.read_structures.v1") else {throw ESIError.forbidden}
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						if let language = language {
							query.append(URLQueryItem(name: "language", value: language.description))
						}
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
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public var corporationID: Int
					public var fuelExpires: Date?
					public var nextReinforceApply: Date?
					public var nextReinforceHour: Int?
					public var nextReinforceWeekday: Int?
					public var profileID: Int
					public var reinforceHour: Int
					public var reinforceWeekday: Int?
					public var services: [ESI.Corporations.CorporationID.Structures.Service]?
					public var state: ESI.Corporations.CorporationID.Structures.State
					public var stateTimerEnd: Date?
					public var stateTimerStart: Date?
					public var structureID: Int64
					public var systemID: Int
					public var typeID: Int
					public var unanchorsAt: Date?
					public init(corporationID: Int, fuelExpires: Date?, nextReinforceApply: Date?, nextReinforceHour: Int?, nextReinforceWeekday: Int?, profileID: Int, reinforceHour: Int, reinforceWeekday: Int?, services: [ESI.Corporations.CorporationID.Structures.Service]?, state: ESI.Corporations.CorporationID.Structures.State, stateTimerEnd: Date?, stateTimerStart: Date?, structureID: Int64, systemID: Int, typeID: Int, unanchorsAt: Date?) {
						self.corporationID = corporationID
						self.fuelExpires = fuelExpires
						self.nextReinforceApply = nextReinforceApply
						self.nextReinforceHour = nextReinforceHour
						self.nextReinforceWeekday = nextReinforceWeekday
						self.profileID = profileID
						self.reinforceHour = reinforceHour
						self.reinforceWeekday = reinforceWeekday
						self.services = services
						self.state = state
						self.stateTimerEnd = stateTimerEnd
						self.stateTimerStart = stateTimerStart
						self.structureID = structureID
						self.systemID = systemID
						self.typeID = typeID
						self.unanchorsAt = unanchorsAt
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case corporationID = "corporation_id"
						case fuelExpires = "fuel_expires"
						case nextReinforceApply = "next_reinforce_apply"
						case nextReinforceHour = "next_reinforce_hour"
						case nextReinforceWeekday = "next_reinforce_weekday"
						case profileID = "profile_id"
						case reinforceHour = "reinforce_hour"
						case reinforceWeekday = "reinforce_weekday"
						case services
						case state
						case stateTimerEnd = "state_timer_end"
						case stateTimerStart = "state_timer_start"
						case structureID = "structure_id"
						case systemID = "system_id"
						case typeID = "type_id"
						case unanchorsAt = "unanchors_at"
						
						var dateFormatter: DateFormatter? {
							switch self {
								case .fuelExpires:
								return DateFormatter.esiDateTimeFormatter
								case .nextReinforceApply:
								return DateFormatter.esiDateTimeFormatter
								case .stateTimerEnd:
								return DateFormatter.esiDateTimeFormatter
								case .stateTimerStart:
								return DateFormatter.esiDateTimeFormatter
								case .unanchorsAt:
								return DateFormatter.esiDateTimeFormatter
								default:
								return nil
							}
						}
					}
				}
				
				public struct Service: Codable, Hashable {
					
					public enum ServiceState: String, Codable, CustomStringConvertible {
						case online
						case offline
						case cleanup
						
						public var description: String {
							return rawValue
						}
						
					}
					
					public var name: String
					public var state: ESI.Corporations.CorporationID.Structures.Service.ServiceState
					public init(name: String, state: ESI.Corporations.CorporationID.Structures.Service.ServiceState) {
						self.name = name
						self.state = state
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case name
						case state
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public enum State: String, Codable, CustomStringConvertible {
					case anchorVulnerable = "anchor_vulnerable"
					case anchoring
					case armorReinforce = "armor_reinforce"
					case armorVulnerable = "armor_vulnerable"
					case deployVulnerable = "deploy_vulnerable"
					case fittingInvulnerable = "fitting_invulnerable"
					case hullReinforce = "hull_reinforce"
					case hullVulnerable = "hull_vulnerable"
					case onlineDeprecated = "online_deprecated"
					case onliningVulnerable = "onlining_vulnerable"
					case shieldVulnerable = "shield_vulnerable"
					case unanchored
					case unknown
					
					public var description: String {
						return rawValue
					}
					
				}
				
			}
			
			public struct Titles {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Corporations.CorporationID.Titles.Success]>, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-corporations.read_titles.v1") else {throw ESIError.forbidden}
						
						
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
					
					
					public var grantableRoles: [ESI.Corporations.CorporationID.GrantableRole]?
					public var grantableRolesAtBase: [ESI.Corporations.CorporationID.GrantableRolesAtBaseGrantableRolesAtBase]?
					public var grantableRolesAtHq: [ESI.Corporations.CorporationID.GrantableRolesAtHqGrantableRolesAtHq]?
					public var grantableRolesAtOther: [ESI.Corporations.CorporationID.GrantableRolesAtOtherGrantableRolesAtOther]?
					public var name: String?
					public var roles: [ESI.Corporations.Role]?
					public var rolesAtBase: [ESI.Corporations.RolesAtBaseRolesAtBase]?
					public var rolesAtHq: [ESI.Corporations.RolesAtHqRolesAtHq]?
					public var rolesAtOther: [ESI.Corporations.RolesAtOtherRolesAtOther]?
					public var titleID: Int?
					public init(grantableRoles: [ESI.Corporations.CorporationID.GrantableRole]?, grantableRolesAtBase: [ESI.Corporations.CorporationID.GrantableRolesAtBaseGrantableRolesAtBase]?, grantableRolesAtHq: [ESI.Corporations.CorporationID.GrantableRolesAtHqGrantableRolesAtHq]?, grantableRolesAtOther: [ESI.Corporations.CorporationID.GrantableRolesAtOtherGrantableRolesAtOther]?, name: String?, roles: [ESI.Corporations.Role]?, rolesAtBase: [ESI.Corporations.RolesAtBaseRolesAtBase]?, rolesAtHq: [ESI.Corporations.RolesAtHqRolesAtHq]?, rolesAtOther: [ESI.Corporations.RolesAtOtherRolesAtOther]?, titleID: Int?) {
						self.grantableRoles = grantableRoles
						self.grantableRolesAtBase = grantableRolesAtBase
						self.grantableRolesAtHq = grantableRolesAtHq
						self.grantableRolesAtOther = grantableRolesAtOther
						self.name = name
						self.roles = roles
						self.rolesAtBase = rolesAtBase
						self.rolesAtHq = rolesAtHq
						self.rolesAtOther = rolesAtOther
						self.titleID = titleID
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case grantableRoles = "grantable_roles"
						case grantableRolesAtBase = "grantable_roles_at_base"
						case grantableRolesAtHq = "grantable_roles_at_hq"
						case grantableRolesAtOther = "grantable_roles_at_other"
						case name
						case roles
						case rolesAtBase = "roles_at_base"
						case rolesAtHq = "roles_at_hq"
						case rolesAtOther = "roles_at_other"
						case titleID = "title_id"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
			}
			
			public struct Wallets {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Corporations.CorporationID.Wallets.Success]>, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-wallet.read_corporation_wallets.v1") else {throw ESIError.forbidden}
						
						
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
				
				
				public func division(_ value: Int) -> Division {
					Division(esi: esi, route: .parameter(value, next: route))
				}
				
				public struct Division {
					let esi: ESI
					let route: APIRoute
					
					
					
					public func journal() -> Journal {
						Journal(esi: esi, route: .path("journal", next: route))
					}
					public func transactions() -> Transactions {
						Transactions(esi: esi, route: .path("transactions", next: route))
					}
					
					public struct Journal {
						let esi: ESI
						let route: APIRoute
						
						
						public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Corporations.CorporationID.Wallets.Division.Journal.Success]>, AFError> {
							do {
								
								let scopes = esi.token?.scopes ?? []
								guard scopes.contains("esi-wallet.read_corporation_wallets.v1") else {throw ESIError.forbidden}
								
								
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
							
							
							public var amount: Double?
							public var balance: Double?
							public var contextID: Int64?
							public var contextIDType: ESI.Corporations.ContextIDType?
							public var date: Date
							public var localizedDescription: String
							public var firstPartyID: Int?
							public var id: Int64
							public var reason: String?
							public var refType: ESI.Corporations.CorporationID.Wallets.Division.Journal.RefType
							public var secondPartyID: Int?
							public var tax: Double?
							public var taxReceiverID: Int?
							public init(amount: Double?, balance: Double?, contextID: Int64?, contextIDType: ESI.Corporations.ContextIDType?, date: Date, localizedDescription: String, firstPartyID: Int?, id: Int64, reason: String?, refType: ESI.Corporations.CorporationID.Wallets.Division.Journal.RefType, secondPartyID: Int?, tax: Double?, taxReceiverID: Int?) {
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
						
					}
					
					public struct Transactions {
						let esi: ESI
						let route: APIRoute
						
						
						public func get(fromID: Int64?, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Corporations.CorporationID.Wallets.Division.Transactions.Success]>, AFError> {
							do {
								
								let scopes = esi.token?.scopes ?? []
								guard scopes.contains("esi-wallet.read_corporation_wallets.v1") else {throw ESIError.forbidden}
								
								
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
							
							
							public var clientID: Int
							public var date: Date
							public var isBuy: Bool
							public var journalRefID: Int64
							public var locationID: Int64
							public var quantity: Int
							public var transactionID: Int64
							public var typeID: Int
							public var unitPrice: Double
							public init(clientID: Int, date: Date, isBuy: Bool, journalRefID: Int64, locationID: Int64, quantity: Int, transactionID: Int64, typeID: Int, unitPrice: Double) {
								self.clientID = clientID
								self.date = date
								self.isBuy = isBuy
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
					
					
					public var balance: Double
					public var division: Int
					public init(balance: Double, division: Int) {
						self.balance = balance
						self.division = division
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case balance
						case division
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
			}
			
			
			public enum GrantableRole: String, Codable, CustomStringConvertible {
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
			
			public enum GrantableRolesAtHqGrantableRolesAtHq: String, Codable, CustomStringConvertible {
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
			
			public struct Success: Codable, Hashable {
				
				
				public var allianceID: Int?
				public var ceoID: Int
				public var creatorID: Int
				public var dateFounded: Date?
				public var localizedDescription: String?
				public var factionID: Int?
				public var homeStationID: Int?
				public var memberCount: Int
				public var name: String
				public var shares: Int64?
				public var taxRate: Double
				public var ticker: String
				public var url: String?
				public var warEligible: Bool?
				public init(allianceID: Int?, ceoID: Int, creatorID: Int, dateFounded: Date?, localizedDescription: String?, factionID: Int?, homeStationID: Int?, memberCount: Int, name: String, shares: Int64?, taxRate: Double, ticker: String, url: String?, warEligible: Bool?) {
					self.allianceID = allianceID
					self.ceoID = ceoID
					self.creatorID = creatorID
					self.dateFounded = dateFounded
					self.localizedDescription = localizedDescription
					self.factionID = factionID
					self.homeStationID = homeStationID
					self.memberCount = memberCount
					self.name = name
					self.shares = shares
					self.taxRate = taxRate
					self.ticker = ticker
					self.url = url
					self.warEligible = warEligible
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case allianceID = "alliance_id"
					case ceoID = "ceo_id"
					case creatorID = "creator_id"
					case dateFounded = "date_founded"
					case localizedDescription = "description"
					case factionID = "faction_id"
					case homeStationID = "home_station_id"
					case memberCount = "member_count"
					case name
					case shares
					case taxRate = "tax_rate"
					case ticker
					case url
					case warEligible = "war_eligible"
					
					var dateFormatter: DateFormatter? {
						switch self {
							case .dateFounded:
							return DateFormatter.esiDateTimeFormatter
							default:
							return nil
						}
					}
				}
			}
			
			public enum LocationFlag: String, Codable, CustomStringConvertible {
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
				
				public var description: String {
					return rawValue
				}
				
			}
			
			public enum GrantableRolesAtOtherGrantableRolesAtOther: String, Codable, CustomStringConvertible {
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
			
			public enum GrantableRolesAtBaseGrantableRolesAtBase: String, Codable, CustomStringConvertible {
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
		
		public enum State: String, Codable, CustomStringConvertible {
			case cancelled
			case expired
			
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
		
		public enum ContactType: String, Codable, CustomStringConvertible {
			case character
			case corporation
			case alliance
			case faction
			
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
		
		public enum Availability: String, Codable, CustomStringConvertible {
			case `public` = "public"
			case personal
			case corporation
			case alliance
			
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
		
		public enum LocationType: String, Codable, CustomStringConvertible {
			case station
			case solarSystem = "solar_system"
			case other
			
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
		
	}
	
}
