import Foundation
import Alamofire
import Combine


extension ESI {
	public var fleets: Fleets {
		return Fleets(esi: self)
	}
	
	public struct Fleets {
		let esi: ESI
		
		
		public func createFleetInvitation(fleetID: Int64, invitation: Fleets.Invitation, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<String, AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body = try? JSONEncoder().encode(invitation)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/fleets/\(fleetID)/members/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .post,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseString(queue: esi.session.serializationQueue)
			            .eraseToAnyPublisher()
		}
		
		
		public func getFleetMembers(acceptLanguage: AcceptLanguage? = nil, fleetID: Int64, language: Language? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Fleets.Member], AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-fleets.read_fleet.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = acceptLanguage?.description {
				headers["Accept-Language"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = language?.description {
				query.append(URLQueryItem(name: "language", value: v.lazy.map{$0.description}.joined(separator: ",")))
			}
			
			        let url = ESI.apiURL.appendingPathComponent("/fleets/\(fleetID)/members/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .get,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
			            .eraseToAnyPublisher()
		}
		
		
		public func getFleetWings(acceptLanguage: AcceptLanguage? = nil, fleetID: Int64, language: Language? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Fleets.GetFleetsFleetIDWingsOk], AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-fleets.read_fleet.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = acceptLanguage?.description {
				headers["Accept-Language"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = language?.description {
				query.append(URLQueryItem(name: "language", value: v.lazy.map{$0.description}.joined(separator: ",")))
			}
			
			        let url = ESI.apiURL.appendingPathComponent("/fleets/\(fleetID)/wings/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .get,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
			            .eraseToAnyPublisher()
		}
		
		
		public func createFleetWing(fleetID: Int64, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Fleets.WingCreated, AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/fleets/\(fleetID)/wings/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .post,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
			            .eraseToAnyPublisher()
		}
		
		
		public func getCharacterFleetInfo(characterID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Fleets.GetCharactersCharacterIDFleetOk, AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-fleets.read_fleet.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/characters/\(characterID)/fleet/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .get,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
			            .eraseToAnyPublisher()
		}
		
		
		public func updateFleet(fleetID: Int64, newSettings: Fleets.FleetUpdate, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<String, AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body = try? JSONEncoder().encode(newSettings)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/fleets/\(fleetID)/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .put,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseString(queue: esi.session.serializationQueue)
			            .eraseToAnyPublisher()
		}
		
		
		public func getFleetInformation(fleetID: Int64, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Fleets.Information, AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-fleets.read_fleet.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/fleets/\(fleetID)/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .get,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
			            .eraseToAnyPublisher()
		}
		
		
		public func renameFleetWing(fleetID: Int64, naming: Fleets.Naming, wingID: Int64, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<String, AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body = try? JSONEncoder().encode(naming)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/fleets/\(fleetID)/wings/\(wingID)/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .put,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseString(queue: esi.session.serializationQueue)
			            .eraseToAnyPublisher()
		}
		
		
		public func deleteFleetWing(fleetID: Int64, wingID: Int64, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<String, AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/fleets/\(fleetID)/wings/\(wingID)/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .delete,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseString(queue: esi.session.serializationQueue)
			            .eraseToAnyPublisher()
		}
		
		
		public func createFleetSquad(fleetID: Int64, wingID: Int64, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Fleets.SquadCreated, AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/fleets/\(fleetID)/wings/\(wingID)/squads/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .post,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
			            .eraseToAnyPublisher()
		}
		
		
		public func renameFleetSquad(fleetID: Int64, naming: Fleets.Naming, squadID: Int64, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<String, AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body = try? JSONEncoder().encode(naming)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/fleets/\(fleetID)/squads/\(squadID)/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .put,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseString(queue: esi.session.serializationQueue)
			            .eraseToAnyPublisher()
		}
		
		
		public func deleteFleetSquad(fleetID: Int64, squadID: Int64, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<String, AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/fleets/\(fleetID)/squads/\(squadID)/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .delete,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseString(queue: esi.session.serializationQueue)
			            .eraseToAnyPublisher()
		}
		
		
		public func moveFleetMember(fleetID: Int64, memberID: Int, movement: Fleets.Movement, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<String, AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body = try? JSONEncoder().encode(movement)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/fleets/\(fleetID)/members/\(memberID)/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .put,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseString(queue: esi.session.serializationQueue)
			            .eraseToAnyPublisher()
		}
		
		
		public func kickFleetMember(fleetID: Int64, memberID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<String, AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/fleets/\(fleetID)/members/\(memberID)/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .delete,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseString(queue: esi.session.serializationQueue)
			            .eraseToAnyPublisher()
		}
		
		
		public struct PostFleetsFleetIDMembersNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
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
		
		
		public struct PostFleetsFleetIDWingsNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
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
		
		
		public struct Naming: Codable, Hashable {
			
			
			public var name: String
			
			public init(name: String) {
				self.name = name
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case name
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct PutFleetsFleetIDMembersMemberIDUnprocessableEntity: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
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
		
		
		public struct PutFleetsFleetIDNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
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
		
		
		public struct Member: Codable, Hashable {
			
			public enum GetFleetsFleetIDMembersRole: String, Codable, CustomStringConvertible {
				case fleetCommander = "fleet_commander"
				case squadCommander = "squad_commander"
				case squadMember = "squad_member"
				case wingCommander = "wing_commander"
				
				public var description: String {
					return rawValue
				}
				
			}
			
			public var characterID: Int
			public var joinTime: Date
			public var role: Fleets.Member.GetFleetsFleetIDMembersRole
			public var roleName: String
			public var shipTypeID: Int
			public var solarSystemID: Int
			public var squadID: Int64
			public var stationID: Int64?
			public var takesFleetWarp: Bool
			public var wingID: Int64
			
			public init(characterID: Int, joinTime: Date, role: Fleets.Member.GetFleetsFleetIDMembersRole, roleName: String, shipTypeID: Int, solarSystemID: Int, squadID: Int64, stationID: Int64?, takesFleetWarp: Bool, wingID: Int64) {
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
						case .joinTime: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCharactersCharacterIDFleetOk: Codable, Hashable {
			
			public enum GetCharactersCharacterIDFleetRole: String, Codable, CustomStringConvertible {
				case fleetCommander = "fleet_commander"
				case squadCommander = "squad_commander"
				case squadMember = "squad_member"
				case wingCommander = "wing_commander"
				
				public var description: String {
					return rawValue
				}
				
			}
			
			public var fleetID: Int64
			public var role: Fleets.GetCharactersCharacterIDFleetOk.GetCharactersCharacterIDFleetRole
			public var squadID: Int64
			public var wingID: Int64
			
			public init(fleetID: Int64, role: Fleets.GetCharactersCharacterIDFleetOk.GetCharactersCharacterIDFleetRole, squadID: Int64, wingID: Int64) {
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
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetFleetsFleetIDWingsOk: Codable, Hashable {
			
			public struct GetFleetsFleetIDWingsSquads: Codable, Hashable {
				
				
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
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public var id: Int64
			public var name: String
			public var squads: [Fleets.GetFleetsFleetIDWingsOk.GetFleetsFleetIDWingsSquads]
			
			public init(id: Int64, name: String, squads: [Fleets.GetFleetsFleetIDWingsOk.GetFleetsFleetIDWingsSquads]) {
				self.id = id
				self.name = name
				self.squads = squads
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case id
				case name
				case squads
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct DeleteFleetsFleetIDSquadsSquadIDNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
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
		
		
		public struct Invitation: Codable, Hashable {
			
			public enum PostFleetsFleetIDMembersRole: String, Codable, CustomStringConvertible {
				case fleetCommander = "fleet_commander"
				case squadCommander = "squad_commander"
				case squadMember = "squad_member"
				case wingCommander = "wing_commander"
				
				public var description: String {
					return rawValue
				}
				
			}
			
			public var characterID: Int
			public var role: Fleets.Invitation.PostFleetsFleetIDMembersRole
			public var squadID: Int64?
			public var wingID: Int64?
			
			public init(characterID: Int, role: Fleets.Invitation.PostFleetsFleetIDMembersRole, squadID: Int64?, wingID: Int64?) {
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
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct PostFleetsFleetIDMembersUnprocessableEntity: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
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
		
		
		public struct GetFleetsFleetIDMembersNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
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
		
		
		public struct Movement: Codable, Hashable {
			
			public enum PutFleetsFleetIDMembersMemberIDRole: String, Codable, CustomStringConvertible {
				case fleetCommander = "fleet_commander"
				case squadCommander = "squad_commander"
				case squadMember = "squad_member"
				case wingCommander = "wing_commander"
				
				public var description: String {
					return rawValue
				}
				
			}
			
			public var role: Fleets.Movement.PutFleetsFleetIDMembersMemberIDRole
			public var squadID: Int64?
			public var wingID: Int64?
			
			public init(role: Fleets.Movement.PutFleetsFleetIDMembersMemberIDRole, squadID: Int64?, wingID: Int64?) {
				self.role = role
				self.squadID = squadID
				self.wingID = wingID
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case role
				case squadID = "squad_id"
				case wingID = "wing_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct WingCreated: Codable, Hashable {
			
			
			public var wingID: Int64
			
			public init(wingID: Int64) {
				self.wingID = wingID
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case wingID = "wing_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct PutFleetsFleetIDSquadsSquadIDNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
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
		
		
		public struct FleetUpdate: Codable, Hashable {
			
			
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
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct DeleteFleetsFleetIDMembersMemberIDNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
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
		
		
		public struct DeleteFleetsFleetIDWingsWingIDNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
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
		
		
		public struct GetCharactersCharacterIDFleetNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
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
		
		
		public struct PutFleetsFleetIDWingsWingIDNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
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
		
		
		public struct GetFleetsFleetIDNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
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
		
		
		public struct SquadCreated: Codable, Hashable {
			
			
			public var squadID: Int64
			
			public init(squadID: Int64) {
				self.squadID = squadID
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case squadID = "squad_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct PostFleetsFleetIDWingsWingIDSquadsNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
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
		
		
		public struct PutFleetsFleetIDMembersMemberIDNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
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
		
		
		public struct GetFleetsFleetIDWingsNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
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
		
		
		public struct Information: Codable, Hashable {
			
			
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
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
	}
	
}
