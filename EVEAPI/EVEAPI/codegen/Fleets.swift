import Foundation
import Alamofire
import Combine


extension ESI {
	public var fleets: Fleets {
		return Fleets(esi: self, route: .path("fleets", next: .root(ESI.apiURL)))
	}
	
	public struct Fleets {
		let esi: ESI
		let route: APIRoute
		
		
		
		public func fleetID(_ value: Int64) -> FleetID {
			FleetID(esi: esi, route: .parameter(value, next: route))
		}
		
		public struct FleetID {
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
			
			
			public func put(newSettings: ESI.Fleets.FleetID.NewSettings, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Void, AFError> {
				do {
					
					let scopes = esi.token?.scopes ?? []
					guard scopes.contains("esi-fleets.write_fleet.v1") else {throw ESIError.forbidden}
					let body = try JSONEncoder().encode(newSettings)
					
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
			
			
			public func members() -> Members {
				Members(esi: esi, route: .path("members", next: route))
			}
			public func squads() -> Squads {
				Squads(esi: esi, route: .path("squads", next: route))
			}
			public func wings() -> Wings {
				Wings(esi: esi, route: .path("wings", next: route))
			}
			
			public struct Members {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(language: ESI.Markets.Language? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-fleets.read_fleet.v1") else {throw ESIError.forbidden}
						
						
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
				
				
				public func post(invitation: ESI.Fleets.FleetID.Members.Invitation, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Void, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-fleets.write_fleet.v1") else {throw ESIError.forbidden}
						let body = try JSONEncoder().encode(invitation)
						
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
						.responseVoid(queue: esi.session.serializationQueue)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				public func memberID(_ value: Int) -> MemberID {
					MemberID(esi: esi, route: .parameter(value, next: route))
				}
				
				public struct MemberID {
					let esi: ESI
					let route: APIRoute
					
					
					public func delete(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Void, AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-fleets.write_fleet.v1") else {throw ESIError.forbidden}
							
							
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
					
					
					public func put(movement: ESI.Fleets.FleetID.Members.MemberID.Movement, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Void, AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-fleets.write_fleet.v1") else {throw ESIError.forbidden}
							let body = try JSONEncoder().encode(movement)
							
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
					
					
					
					
					
					
					public struct Movement: Codable, Hashable {
						
						
						public let role: ESI.Fleets.FleetID.Members.Role
						public let squadID: Int64?
						public let wingID: Int64?
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case role
							case squadID = "squad_id"
							case wingID = "wing_id"
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
				}
				
				
				public struct Success: Codable, Hashable {
					
					
					public let characterID: Int
					public let joinTime: Date
					public let role: ESI.Fleets.FleetID.Members.Role
					public let roleName: String
					public let shipTypeID: Int
					public let solarSystemID: Int
					public let squadID: Int64
					public let stationID: Int64?
					public let takesFleetWarp: Bool
					public let wingID: Int64
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case characterID = "character_id"
						case joinTime = "join_time"
						case role
						case roleName = "role_name"
						case shipTypeID = "ship_type_id"
						case solarSystemID = "solar_system_id"
						case squadID = "squad_id"
						case stationID = "station_id"
						case takesFleetWarp = "takes_fleet_warp"
						case wingID = "wing_id"
						
						var dateFormatter: DateFormatter? {
							switch self {
								case .joinTime:
								return DateFormatter.esiDateTimeFormatter
								default:
								return nil
							}
						}
					}
				}
				
				public enum Role: String, Codable, CustomStringConvertible {
					case fleetCommander = "fleet_commander"
					case wingCommander = "wing_commander"
					case squadCommander = "squad_commander"
					case squadMember = "squad_member"
					
					public var description: String {
						return rawValue
					}
					
				}
				
				public struct Invitation: Codable, Hashable {
					
					
					public let characterID: Int
					public let role: ESI.Fleets.FleetID.Members.Role
					public let squadID: Int64?
					public let wingID: Int64?
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case characterID = "character_id"
						case role
						case squadID = "squad_id"
						case wingID = "wing_id"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
			}
			
			public struct Squads {
				let esi: ESI
				let route: APIRoute
				
				
				
				public func squadID(_ value: Int64) -> SquadID {
					SquadID(esi: esi, route: .parameter(value, next: route))
				}
				
				public struct SquadID {
					let esi: ESI
					let route: APIRoute
					
					
					public func delete(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Void, AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-fleets.write_fleet.v1") else {throw ESIError.forbidden}
							
							
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
					
					
					public func put(naming: ESI.Fleets.FleetID.Naming, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Void, AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-fleets.write_fleet.v1") else {throw ESIError.forbidden}
							let body = try JSONEncoder().encode(naming)
							
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
					
					
					
					
					
					
					
				}
				
				
				
			}
			
			public struct Wings {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(language: ESI.Markets.Language? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-fleets.read_fleet.v1") else {throw ESIError.forbidden}
						
						
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
				
				
				public func post(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Created, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-fleets.write_fleet.v1") else {throw ESIError.forbidden}
						
						
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
				
				
				public func wingID(_ value: Int64) -> WingID {
					WingID(esi: esi, route: .parameter(value, next: route))
				}
				
				public struct WingID {
					let esi: ESI
					let route: APIRoute
					
					
					public func delete(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Void, AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-fleets.write_fleet.v1") else {throw ESIError.forbidden}
							
							
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
					
					
					public func put(naming: ESI.Fleets.FleetID.Naming, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Void, AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-fleets.write_fleet.v1") else {throw ESIError.forbidden}
							let body = try JSONEncoder().encode(naming)
							
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
					
					
					public func squads() -> Squads {
						Squads(esi: esi, route: .path("squads", next: route))
					}
					
					public struct Squads {
						let esi: ESI
						let route: APIRoute
						
						
						public func post(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Created, AFError> {
							do {
								
								let scopes = esi.token?.scopes ?? []
								guard scopes.contains("esi-fleets.write_fleet.v1") else {throw ESIError.forbidden}
								
								
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
						
						
						
						
						
						
						public struct Created: Codable, Hashable {
							
							
							public let squadID: Int64
							
							enum CodingKeys: String, CodingKey, DateFormatted {
								case squadID = "squad_id"
								
								var dateFormatter: DateFormatter? {
									return nil
								}
							}
						}
						
					}
					
					
					
				}
				
				
				public struct Success: Codable, Hashable {
					
					
					public let id: Int64
					public let name: String
					public let squads: [ESI.Fleets.FleetID.Wings.Squad]
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case id
						case name
						case squads
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct Squad: Codable, Hashable {
					
					
					public let id: Int64
					public let name: String
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case id
						case name
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct Created: Codable, Hashable {
					
					
					public let wingID: Int64
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case wingID = "wing_id"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
			}
			
			
			public struct NewSettings: Codable, Hashable {
				
				
				public let isFreeMove: Bool?
				public let motd: String?
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case isFreeMove = "is_free_move"
					case motd
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
			public struct Success: Codable, Hashable {
				
				
				public let isFreeMove: Bool
				public let isRegistered: Bool
				public let isVoiceEnabled: Bool
				public let motd: String
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case isFreeMove = "is_free_move"
					case isRegistered = "is_registered"
					case isVoiceEnabled = "is_voice_enabled"
					case motd
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
			public struct Naming: Codable, Hashable {
				
				
				public let name: String
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case name
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
		}
		
		
		
	}
	
}
