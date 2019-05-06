import Foundation
import Alamofire
import Futures


public extension ESI {
	var fleets: Fleets {
		return Fleets(esi: self)
	}
	
	struct Fleets {
		let esi: ESI
		
		@discardableResult
		public func createFleetInvitation(fleetID: Int64, invitation: Fleets.Invitation, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<String>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {return .init(.failure(ESIError.forbidden))}
			let body = try? JSONEncoder().encode(invitation)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/fleets/\(fleetID)/members/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<String>>()
			esi.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<String>) in
				promise.set(response: response, cached: nil)
			}
			return promise.future
		}
		
		@discardableResult
		public func getFleetMembers(acceptLanguage: AcceptLanguage? = nil, fleetID: Int64, ifNoneMatch: String? = nil, language: Language? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Fleets.Member]>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-fleets.read_fleet.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = acceptLanguage?.httpQuery {
				headers["Accept-Language"] = v
			}
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = language?.httpQuery {
				query.append(URLQueryItem(name: "language", value: v))
			}
			
			let url = esi.baseURL + "/v1/fleets/\(fleetID)/members/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<[Fleets.Member]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<[Fleets.Member]>) in
				promise.set(response: response, cached: 5.0)
			}
			return promise.future
		}
		
		@discardableResult
		public func renameFleetWing(fleetID: Int64, naming: Fleets.Naming, wingID: Int64, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<String>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {return .init(.failure(ESIError.forbidden))}
			let body = try? JSONEncoder().encode(naming)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/fleets/\(fleetID)/wings/\(wingID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<String>>()
			esi.request(components.url!, method: .put, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<String>) in
				promise.set(response: response, cached: nil)
			}
			return promise.future
		}
		
		@discardableResult
		public func deleteFleetWing(fleetID: Int64, wingID: Int64, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<String>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/fleets/\(fleetID)/wings/\(wingID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<String>>()
			esi.request(components.url!, method: .delete, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<String>) in
				promise.set(response: response, cached: nil)
			}
			return promise.future
		}
		
		@discardableResult
		public func moveFleetMember(fleetID: Int64, memberID: Int, movement: Fleets.Movement, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<String>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {return .init(.failure(ESIError.forbidden))}
			let body = try? JSONEncoder().encode(movement)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/fleets/\(fleetID)/members/\(memberID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<String>>()
			esi.request(components.url!, method: .put, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<String>) in
				promise.set(response: response, cached: nil)
			}
			return promise.future
		}
		
		@discardableResult
		public func kickFleetMember(fleetID: Int64, memberID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<String>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/fleets/\(fleetID)/members/\(memberID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<String>>()
			esi.request(components.url!, method: .delete, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<String>) in
				promise.set(response: response, cached: nil)
			}
			return promise.future
		}
		
		@discardableResult
		public func getCharacterFleetInfo(characterID: Int, ifNoneMatch: String? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<Fleets.GetCharactersCharacterIDFleetOk>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-fleets.read_fleet.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/characters/\(characterID)/fleet/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<Fleets.GetCharactersCharacterIDFleetOk>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<Fleets.GetCharactersCharacterIDFleetOk>) in
				promise.set(response: response, cached: 60.0)
			}
			return promise.future
		}
		
		@discardableResult
		public func updateFleet(fleetID: Int64, newSettings: Fleets.FleetUpdate, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<String>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {return .init(.failure(ESIError.forbidden))}
			let body = try? JSONEncoder().encode(newSettings)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/fleets/\(fleetID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<String>>()
			esi.request(components.url!, method: .put, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<String>) in
				promise.set(response: response, cached: nil)
			}
			return promise.future
		}
		
		@discardableResult
		public func getFleetInformation(fleetID: Int64, ifNoneMatch: String? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<Fleets.Information>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-fleets.read_fleet.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/fleets/\(fleetID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<Fleets.Information>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<Fleets.Information>) in
				promise.set(response: response, cached: 5.0)
			}
			return promise.future
		}
		
		@discardableResult
		public func createFleetSquad(fleetID: Int64, wingID: Int64, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<Fleets.SquadCreated>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/fleets/\(fleetID)/wings/\(wingID)/squads/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<Fleets.SquadCreated>>()
			esi.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<Fleets.SquadCreated>) in
				promise.set(response: response, cached: nil)
			}
			return promise.future
		}
		
		@discardableResult
		public func getFleetWings(acceptLanguage: AcceptLanguage? = nil, fleetID: Int64, ifNoneMatch: String? = nil, language: Language? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Fleets.GetFleetsFleetIDWingsOk]>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-fleets.read_fleet.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = acceptLanguage?.httpQuery {
				headers["Accept-Language"] = v
			}
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = language?.httpQuery {
				query.append(URLQueryItem(name: "language", value: v))
			}
			
			let url = esi.baseURL + "/v1/fleets/\(fleetID)/wings/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<[Fleets.GetFleetsFleetIDWingsOk]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<[Fleets.GetFleetsFleetIDWingsOk]>) in
				promise.set(response: response, cached: 5.0)
			}
			return promise.future
		}
		
		@discardableResult
		public func createFleetWing(fleetID: Int64, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<Fleets.WingCreated>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/fleets/\(fleetID)/wings/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<Fleets.WingCreated>>()
			esi.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<Fleets.WingCreated>) in
				promise.set(response: response, cached: nil)
			}
			return promise.future
		}
		
		@discardableResult
		public func deleteFleetSquad(fleetID: Int64, squadID: Int64, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<String>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/fleets/\(fleetID)/squads/\(squadID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<String>>()
			esi.request(components.url!, method: .delete, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<String>) in
				promise.set(response: response, cached: nil)
			}
			return promise.future
		}
		
		@discardableResult
		public func renameFleetSquad(fleetID: Int64, naming: Fleets.Naming, squadID: Int64, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<String>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {return .init(.failure(ESIError.forbidden))}
			let body = try? JSONEncoder().encode(naming)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/fleets/\(fleetID)/squads/\(squadID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<String>>()
			esi.request(components.url!, method: .put, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<String>) in
				promise.set(response: response, cached: nil)
			}
			return promise.future
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
		
		
		public struct GetCharactersCharacterIDFleetOk: Codable, Hashable {
			
			public enum GetCharactersCharacterIDFleetRole: String, Codable, HTTPQueryable {
				case fleetCommander = "fleet_commander"
				case squadCommander = "squad_commander"
				case squadMember = "squad_member"
				case wingCommander = "wing_commander"
				
				public var httpQuery: String? {
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
		
		
		public struct Invitation: Codable, Hashable {
			
			public enum PostFleetsFleetIDMembersRole: String, Codable, HTTPQueryable {
				case fleetCommander = "fleet_commander"
				case squadCommander = "squad_commander"
				case squadMember = "squad_member"
				case wingCommander = "wing_commander"
				
				public var httpQuery: String? {
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
		
		
		public struct Member: Codable, Hashable {
			
			public enum GetFleetsFleetIDMembersRole: String, Codable, HTTPQueryable {
				case fleetCommander = "fleet_commander"
				case squadCommander = "squad_commander"
				case squadMember = "squad_member"
				case wingCommander = "wing_commander"
				
				public var httpQuery: String? {
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
		
		
		public struct Movement: Codable, Hashable {
			
			public enum PutFleetsFleetIDMembersMemberIDRole: String, Codable, HTTPQueryable {
				case fleetCommander = "fleet_commander"
				case squadCommander = "squad_commander"
				case squadMember = "squad_member"
				case wingCommander = "wing_commander"
				
				public var httpQuery: String? {
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
		
		
	}
	
}
