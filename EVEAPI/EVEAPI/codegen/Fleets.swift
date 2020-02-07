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
			
			
			public func put(newSettings: ESI.Fleets.FleetID.NewSettings, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<Void>, AFError> {
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
				
				
				public func get(language: ESI.Search.Language? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<[Success]>, AFError> {
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
				
				
				public func post(invitation: ESI.Fleets.FleetID.Members.Invitation, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<Void>, AFError> {
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
					
					
					public func delete(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<Void>, AFError> {
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
					
					
					public func put(movement: ESI.Fleets.FleetID.Members.MemberID.Movement, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<Void>, AFError> {
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
						
						
						public var role: ESI.Fleets.FleetID.Members.Role
						public var squadID: Int64?
						public var wingID: Int64?
						public init(role: ESI.Fleets.FleetID.Members.Role, squadID: Int64?, wingID: Int64?) {
							self.role = role
							self.squadID = squadID
							self.wingID = wingID
						}
						
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
					
					
					public var characterID: Int
					public var joinTime: Date
					public var role: ESI.Fleets.FleetID.Members.Role
					public var roleName: String
					public var shipTypeID: Int
					public var solarSystemID: Int
					public var squadID: Int64
					public var stationID: Int64?
					public var takesFleetWarp: Bool
					public var wingID: Int64
					public init(characterID: Int, joinTime: Date, role: ESI.Fleets.FleetID.Members.Role, roleName: String, shipTypeID: Int, solarSystemID: Int, squadID: Int64, stationID: Int64?, takesFleetWarp: Bool, wingID: Int64) {
						self.characterID = characterID
						self.joinTime = joinTime
						self.role = role
						self.roleName = roleName
						self.shipTypeID = shipTypeID
						self.solarSystemID = solarSystemID
						self.squadID = squadID
						self.stationID = stationID
						self.takesFleetWarp = takesFleetWarp
						self.wingID = wingID
					}
					
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
					
					
					public var characterID: Int
					public var role: ESI.Fleets.FleetID.Members.Role
					public var squadID: Int64?
					public var wingID: Int64?
					public init(characterID: Int, role: ESI.Fleets.FleetID.Members.Role, squadID: Int64?, wingID: Int64?) {
						self.characterID = characterID
						self.role = role
						self.squadID = squadID
						self.wingID = wingID
					}
					
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
					
					
					public func delete(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<Void>, AFError> {
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
					
					
					public func put(naming: ESI.Fleets.FleetID.Naming, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<Void>, AFError> {
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
				
				
				public func get(language: ESI.Search.Language? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<[Success]>, AFError> {
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
				
				
				public func post(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<Created>, AFError> {
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
					
					
					public func delete(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<Void>, AFError> {
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
					
					
					public func put(naming: ESI.Fleets.FleetID.Naming, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<Void>, AFError> {
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
						
						
						public func post(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<Created>, AFError> {
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
							
							
							public var squadID: Int64
							public init(squadID: Int64) {
								self.squadID = squadID
							}
							
							enum CodingKeys: String, CodingKey, DateFormatted {
								case squadID = "squad_id"
								
								var dateFormatter: DateFormatter? {
									return nil
								}
							}
						}
						
					}
					
					
					
				}
				
				
				public struct Created: Codable, Hashable {
					
					
					public var wingID: Int64
					public init(wingID: Int64) {
						self.wingID = wingID
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case wingID = "wing_id"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct Success: Codable, Hashable {
					
					
					public var id: Int64
					public var name: String
					public var squads: [ESI.Fleets.FleetID.Wings.Squad]
					public init(id: Int64, name: String, squads: [ESI.Fleets.FleetID.Wings.Squad]) {
						self.id = id
						self.name = name
						self.squads = squads
					}
					
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
					
					
					public var id: Int64
					public var name: String
					public init(id: Int64, name: String) {
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
			
			
			public struct NewSettings: Codable, Hashable {
				
				
				public var isFreeMove: Bool?
				public var motd: String?
				public init(isFreeMove: Bool?, motd: String?) {
					self.isFreeMove = isFreeMove
					self.motd = motd
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case isFreeMove = "is_free_move"
					case motd
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
			public struct Success: Codable, Hashable {
				
				
				public var isFreeMove: Bool
				public var isRegistered: Bool
				public var isVoiceEnabled: Bool
				public var motd: String
				public init(isFreeMove: Bool, isRegistered: Bool, isVoiceEnabled: Bool, motd: String) {
					self.isFreeMove = isFreeMove
					self.isRegistered = isRegistered
					self.isVoiceEnabled = isVoiceEnabled
					self.motd = motd
				}
				
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
				
				
				public var name: String
				public init(name: String) {
					self.name = name
				}
				
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
