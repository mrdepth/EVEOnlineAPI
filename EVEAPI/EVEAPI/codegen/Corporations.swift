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
			
			
			
			
			
			
			
		}
		
		public struct CorporationID {
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
					
					
					public let allianceID: Int?
					public let isDeleted: Bool?
					public let recordID: Int
					public let startDate: Date
					
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
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
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
				
				public struct Names {
					let esi: ESI
					let route: APIRoute
					
					
					public func post(itemIds: [Int64], cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
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
				
				
				public struct Success: Codable, Hashable {
					
					
					public let isBlueprintCopy: Bool?
					public let isSingleton: Bool
					public let itemID: Int64
					public let locationFlag: ESI.Corporations.CorporationID.LocationFlag
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
			
			public struct Blueprints {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
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
					public let locationFlag: ESI.Corporations.CorporationID.LocationFlag
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
				
			}
			
			public struct Bookmarks {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
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
						
						
						public let creatorID: Int?
						public let folderID: Int
						public let name: String
						
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
				
				
				
			}
			
			public struct Contacts {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
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
				
				
				public func labels() -> Labels {
					Labels(esi: esi, route: .path("labels", next: route))
				}
				
				public struct Labels {
					let esi: ESI
					let route: APIRoute
					
					
					public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
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
				
				
				public struct Success: Codable, Hashable {
					
					
					public let contactID: Int
					public let contactType: ESI.Characters.ContactType
					public let isWatched: Bool?
					public let labelIds: [Int64]?
					public let standing: Double
					
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
					
					
					public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
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
						
						
						public let action: ESI.Corporations.CorporationID.Containers.Logs.Action
						public let characterID: Int
						public let containerID: Int64
						public let containerTypeID: Int
						public let locationFlag: ESI.Corporations.CorporationID.LocationFlag
						public let locationID: Int64
						public let loggedAt: Date
						public let newConfigBitmask: Int?
						public let oldConfigBitmask: Int?
						public let passwordType: ESI.Corporations.CorporationID.Containers.Logs.PasswordType?
						public let quantity: Int?
						public let typeID: Int?
						
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
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
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
						
						
						public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
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
					
					public struct Items {
						let esi: ESI
						let route: APIRoute
						
						
						public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
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
					
					
					
				}
				
				
				
			}
			
			public struct CustomsOffices {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
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
					
					
					public let allianceTaxRate: Double?
					public let allowAccessWithStandings: Bool
					public let allowAllianceAccess: Bool
					public let badStandingTaxRate: Double?
					public let corporationTaxRate: Double?
					public let excellentStandingTaxRate: Double?
					public let goodStandingTaxRate: Double?
					public let neutralStandingTaxRate: Double?
					public let officeID: Int64
					public let reinforceExitEnd: Int
					public let reinforceExitStart: Int
					public let standingLevel: ESI.Corporations.CorporationID.CustomsOffices.StandingLevel?
					public let systemID: Int
					public let terribleStandingTaxRate: Double?
					
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
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Success, AFError> {
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
					
					
					public let hangar: [ESI.Corporations.CorporationID.Divisions.HangarHangar]?
					public let wallet: [ESI.Corporations.CorporationID.Divisions.WalletWallet]?
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case hangar
						case wallet
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct HangarHangar: Codable, Hashable {
					
					
					public let division: Int?
					public let name: String?
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case division
						case name
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct WalletWallet: Codable, Hashable {
					
					
					public let division: Int?
					public let name: String?
					
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
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
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
					
					
					public let facilityID: Int64
					public let systemID: Int
					public let typeID: Int
					
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
					
					
					public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Success, AFError> {
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
						
						
						public let enlistedOn: Date?
						public let factionID: Int?
						public let kills: ESI.Fw.Kills
						public let pilots: Int?
						public let victoryPoints: ESI.Fw.VictoryPoints
						
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
					public let px64x64: String?
					
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
					
					
					public func get(includeCompleted: Bool? = nil, page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
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
						public let locationID: Int64
						public let outputLocationID: Int64
						public let pauseDate: Date?
						public let probability: Double?
						public let productTypeID: Int?
						public let runs: Int
						public let startDate: Date
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
				
				
				
			}
			
			public struct Medals {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
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
				
				
				public func issued() -> Issued {
					Issued(esi: esi, route: .path("issued", next: route))
				}
				
				public struct Issued {
					let esi: ESI
					let route: APIRoute
					
					
					public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
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
						
						
						public let characterID: Int
						public let issuedAt: Date
						public let issuerID: Int
						public let medalID: Int
						public let reason: String
						public let status: ESI.Corporations.CorporationID.Medals.Issued.Status
						
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
					
					public enum Status: String, Codable, CustomStringConvertible {
						case `private` = "private"
						case `public` = "public"
						
						public var description: String {
							return rawValue
						}
						
					}
					
				}
				
				
				public struct Success: Codable, Hashable {
					
					
					public let createdAt: Date
					public let creatorID: Int
					public let localizedDescription: String
					public let medalID: Int
					public let title: String
					
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
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Int], AFError> {
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
				
				
				public func limit() -> Limit {
					Limit(esi: esi, route: .path("limit", next: route))
				}
				public func titles() -> Titles {
					Titles(esi: esi, route: .path("titles", next: route))
				}
				
				public struct Limit {
					let esi: ESI
					let route: APIRoute
					
					
					public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Int, AFError> {
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
				
				public struct Titles {
					let esi: ESI
					let route: APIRoute
					
					
					public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
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
						
						
						public let characterID: Int
						public let titles: [Int]
						
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
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
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
					
					
					public let baseID: Int?
					public let characterID: Int
					public let locationID: Int64?
					public let logoffDate: Date?
					public let logonDate: Date?
					public let shipTypeID: Int?
					public let startDate: Date?
					
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
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
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
						public let issued: Date
						public let issuedBy: Int?
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
						public let walletDivision: Int
						
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
					
					
					public let duration: Int
					public let escrow: Double?
					public let isBuyOrder: Bool?
					public let issued: Date
					public let issuedBy: Int
					public let locationID: Int64
					public let minVolume: Int?
					public let orderID: Int64
					public let price: Double
					public let range: ESI.Characters.Range
					public let regionID: Int
					public let typeID: Int
					public let volumeRemain: Int
					public let volumeTotal: Int
					public let walletDivision: Int
					
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
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
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
					
					public struct Success: Codable, Hashable {
						
						
						public let changedAt: Date
						public let characterID: Int
						public let issuerID: Int
						public let newRoles: [ESI.Corporations.CorporationID.Roles.History.NewRole]
						public let oldRoles: [ESI.Corporations.CorporationID.Roles.History.OldRole]
						public let roleType: ESI.Corporations.CorporationID.Roles.History.RoleType
						
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
					
				}
				
				
				public struct Success: Codable, Hashable {
					
					
					public let characterID: Int
					public let grantableRoles: [ESI.Corporations.CorporationID.GrantableRole]?
					public let grantableRolesAtBase: [ESI.Corporations.CorporationID.GrantableRolesAtBaseGrantableRolesAtBase]?
					public let grantableRolesAtHq: [ESI.Corporations.CorporationID.GrantableRolesAtHqGrantableRolesAtHq]?
					public let grantableRolesAtOther: [ESI.Corporations.CorporationID.GrantableRolesAtOtherGrantableRolesAtOther]?
					public let roles: [ESI.Characters.Role]?
					public let rolesAtBase: [ESI.Characters.RolesAtBaseRolesAtBase]?
					public let rolesAtHq: [ESI.Characters.RolesAtHqRolesAtHq]?
					public let rolesAtOther: [ESI.Characters.RolesAtOtherRolesAtOther]?
					
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
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
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
					
					
					public let shareCount: Int64
					public let shareholderID: Int
					public let shareholderType: ESI.Corporations.CorporationID.Shareholders.ShareholderType
					
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
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
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
			
			public struct Starbases {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
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
				
				
				public func starbaseID(_ value: Int64) -> StarbaseID {
					StarbaseID(esi: esi, route: .parameter(value, next: route))
				}
				
				public struct StarbaseID {
					let esi: ESI
					let route: APIRoute
					
					
					public func get(systemID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Success, AFError> {
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
					
					
					
					
					
					
					public enum Offline: String, Codable, CustomStringConvertible {
						case allianceMember = "alliance_member"
						case configStarbaseEquipmentRole = "config_starbase_equipment_role"
						case corporationMember = "corporation_member"
						case starbaseFuelTechnicianRole = "starbase_fuel_technician_role"
						
						public var description: String {
							return rawValue
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
					
					public enum FuelBayView: String, Codable, CustomStringConvertible {
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
					
					public struct Success: Codable, Hashable {
						
						
						public let allowAllianceMembers: Bool
						public let allowCorporationMembers: Bool
						public let anchor: ESI.Corporations.CorporationID.Starbases.StarbaseID.Anchor
						public let attackIfAtWar: Bool
						public let attackIfOtherSecurityStatusDropping: Bool
						public let attackSecurityStatusThreshold: Double?
						public let attackStandingThreshold: Double?
						public let fuelBayTake: ESI.Corporations.CorporationID.Starbases.StarbaseID.FuelBayTake
						public let fuelBayView: ESI.Corporations.CorporationID.Starbases.StarbaseID.FuelBayView
						public let fuels: [ESI.Corporations.CorporationID.Starbases.StarbaseID.Fuel]?
						public let offline: ESI.Corporations.CorporationID.Starbases.StarbaseID.Offline
						public let online: ESI.Corporations.CorporationID.Starbases.StarbaseID.Online
						public let unanchor: ESI.Corporations.CorporationID.Starbases.StarbaseID.Unanchor
						public let useAllianceStandings: Bool
						
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
					
					public enum Unanchor: String, Codable, CustomStringConvertible {
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
					
					public struct Fuel: Codable, Hashable {
						
						
						public let quantity: Int
						public let typeID: Int
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case quantity
							case typeID = "type_id"
							
							var dateFormatter: DateFormatter? {
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
				
				public struct Success: Codable, Hashable {
					
					
					public let moonID: Int?
					public let onlinedSince: Date?
					public let reinforcedUntil: Date?
					public let starbaseID: Int64
					public let state: ESI.Corporations.CorporationID.Starbases.State?
					public let systemID: Int
					public let typeID: Int
					public let unanchorAt: Date?
					
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
				
			}
			
			public struct Structures {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(language: ESI.Markets.Language? = nil, page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
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
				
				
				
				
				
				
				public struct Service: Codable, Hashable {
					
					public enum ServiceState: String, Codable, CustomStringConvertible {
						case online
						case offline
						case cleanup
						
						public var description: String {
							return rawValue
						}
						
					}
					
					public let name: String
					public let state: ESI.Corporations.CorporationID.Structures.Service.ServiceState
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case name
						case state
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct Success: Codable, Hashable {
					
					
					public let corporationID: Int
					public let fuelExpires: Date?
					public let nextReinforceApply: Date?
					public let nextReinforceHour: Int?
					public let nextReinforceWeekday: Int?
					public let profileID: Int
					public let reinforceHour: Int
					public let reinforceWeekday: Int?
					public let services: [ESI.Corporations.CorporationID.Structures.Service]?
					public let state: ESI.Corporations.CorporationID.Structures.State
					public let stateTimerEnd: Date?
					public let stateTimerStart: Date?
					public let structureID: Int64
					public let systemID: Int
					public let typeID: Int
					public let unanchorsAt: Date?
					
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
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
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
					
					
					public let grantableRoles: [ESI.Corporations.CorporationID.GrantableRole]?
					public let grantableRolesAtBase: [ESI.Corporations.CorporationID.GrantableRolesAtBaseGrantableRolesAtBase]?
					public let grantableRolesAtHq: [ESI.Corporations.CorporationID.GrantableRolesAtHqGrantableRolesAtHq]?
					public let grantableRolesAtOther: [ESI.Corporations.CorporationID.GrantableRolesAtOtherGrantableRolesAtOther]?
					public let name: String?
					public let roles: [ESI.Characters.Role]?
					public let rolesAtBase: [ESI.Characters.RolesAtBaseRolesAtBase]?
					public let rolesAtHq: [ESI.Characters.RolesAtHqRolesAtHq]?
					public let rolesAtOther: [ESI.Characters.RolesAtOtherRolesAtOther]?
					public let titleID: Int?
					
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
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
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
						
						
						public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
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
							
							
							public let amount: Double?
							public let balance: Double?
							public let contextID: Int64?
							public let contextIDType: ESI.Characters.ContextIDType?
							public let date: Date
							public let localizedDescription: String
							public let firstPartyID: Int?
							public let id: Int64
							public let reason: String?
							public let refType: ESI.Corporations.CorporationID.Wallets.Division.Journal.RefType
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
					
					
					public let balance: Double
					public let division: Int
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case balance
						case division
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
			}
			
			
			public struct Success: Codable, Hashable {
				
				
				public let allianceID: Int?
				public let ceoID: Int
				public let creatorID: Int
				public let dateFounded: Date?
				public let localizedDescription: String?
				public let factionID: Int?
				public let homeStationID: Int?
				public let memberCount: Int
				public let name: String
				public let shares: Int64?
				public let taxRate: Double
				public let ticker: String
				public let url: String?
				public let warEligible: Bool?
				
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
			
		}
		
		
		
	}
	
}
