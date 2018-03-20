import Foundation
import Alamofire


public extension ESI {
	public var fleets: Fleets {
		return Fleets(sessionManager: self)
	}
	
	class Fleets {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		@discardableResult
		public func createFleetSquad(fleetID: Int64, wingID: Int64) -> Future<ESI.Result<Fleets.SquadCreated>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<Fleets.SquadCreated>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/fleets/\(fleetID)/wings/\(wingID)/squads/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Fleets.SquadCreated>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func createFleetWing(fleetID: Int64) -> Future<ESI.Result<Fleets.WingCreated>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<Fleets.WingCreated>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/fleets/\(fleetID)/wings/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Fleets.WingCreated>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getFleetWings(fleetID: Int64, language: Language? = nil) -> Future<ESI.Result<[Fleets.GetFleetsFleetIDWingsOk]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Fleets.GetFleetsFleetIDWingsOk]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-fleets.read_fleet.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			if let v = language?.httpQuery {
				query.append(URLQueryItem(name: "language", value: v))
			}
			
			let url = session!.baseURL + "/v1/fleets/\(fleetID)/wings/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Fleets.GetFleetsFleetIDWingsOk]>) in
					promise.set(result: response.result, cached: 5.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func deleteFleetSquad(fleetID: Int64, squadID: Int64) -> Future<ESI.Result<String>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<String>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/fleets/\(fleetID)/squads/\(squadID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .delete, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<String>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func renameFleetSquad(fleetID: Int64, naming: Fleets.Naming, squadID: Int64) -> Future<ESI.Result<String>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<String>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body = try? JSONEncoder().encode(naming)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/fleets/\(fleetID)/squads/\(squadID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .put, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<String>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func createFleetInvitation(fleetID: Int64, invitation: Fleets.Invitation) -> Future<ESI.Result<String>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<String>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body = try? JSONEncoder().encode(invitation)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/fleets/\(fleetID)/members/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<String>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getFleetMembers(fleetID: Int64, language: Language? = nil) -> Future<ESI.Result<[Fleets.Member]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Fleets.Member]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-fleets.read_fleet.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			if let v = language?.httpQuery {
				query.append(URLQueryItem(name: "language", value: v))
			}
			
			let url = session!.baseURL + "/v1/fleets/\(fleetID)/members/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Fleets.Member]>) in
					promise.set(result: response.result, cached: 5.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func kickFleetMember(fleetID: Int64, memberID: Int) -> Future<ESI.Result<String>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<String>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/fleets/\(fleetID)/members/\(memberID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .delete, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<String>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func moveFleetMember(fleetID: Int64, memberID: Int, movement: Fleets.Movement) -> Future<ESI.Result<String>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<String>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body = try? JSONEncoder().encode(movement)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/fleets/\(fleetID)/members/\(memberID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .put, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<String>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func updateFleet(fleetID: Int64, newSettings: Fleets.FleetUpdate) -> Future<ESI.Result<String>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<String>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body = try? JSONEncoder().encode(newSettings)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/fleets/\(fleetID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .put, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<String>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getFleetInformation(fleetID: Int64) -> Future<ESI.Result<Fleets.Information>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<Fleets.Information>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-fleets.read_fleet.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/fleets/\(fleetID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Fleets.Information>) in
					promise.set(result: response.result, cached: 5.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCharacterFleetInfo(characterID: Int) -> Future<ESI.Result<Fleets.GetCharactersCharacterIDFleetOk>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<Fleets.GetCharactersCharacterIDFleetOk>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-fleets.read_fleet.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/fleet/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Fleets.GetCharactersCharacterIDFleetOk>) in
					promise.set(result: response.result, cached: 60.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func deleteFleetWing(fleetID: Int64, wingID: Int64) -> Future<ESI.Result<String>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<String>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/fleets/\(fleetID)/wings/\(wingID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .delete, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<String>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func renameFleetWing(fleetID: Int64, naming: Fleets.Naming, wingID: Int64) -> Future<ESI.Result<String>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<String>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body = try? JSONEncoder().encode(naming)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/fleets/\(fleetID)/wings/\(wingID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .put, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<String>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		
		public struct WingCreated: Codable, Hashable {
			
			
			public var wingID: Int64
			
			public init(wingID: Int64) {
				self.wingID = wingID
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: wingID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Fleets.WingCreated, rhs: Fleets.WingCreated) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
		
		
		public struct PutFleetsFleetIDMembersMemberIDNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.PutFleetsFleetIDMembersMemberIDNotFound, rhs: Fleets.PutFleetsFleetIDMembersMemberIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: characterID.hashValue)
				hashCombine(seed: &hash, value: role.hashValue)
				hashCombine(seed: &hash, value: squadID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: wingID?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.Invitation, rhs: Fleets.Invitation) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
		
		
		public struct GetFleetsFleetIDNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.GetFleetsFleetIDNotFound, rhs: Fleets.GetFleetsFleetIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
		
		
		public struct PutFleetsFleetIDBadRequest: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.PutFleetsFleetIDBadRequest, rhs: Fleets.PutFleetsFleetIDBadRequest) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: name.hashValue)
				return hash
			}
			
			public static func ==(lhs: Fleets.Naming, rhs: Fleets.Naming) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
		
		
		public struct PostFleetsFleetIDWingsNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.PostFleetsFleetIDWingsNotFound, rhs: Fleets.PostFleetsFleetIDWingsNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: squadID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Fleets.SquadCreated, rhs: Fleets.SquadCreated) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
		
		
		public struct DeleteFleetsFleetIDMembersMemberIDNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.DeleteFleetsFleetIDMembersMemberIDNotFound, rhs: Fleets.DeleteFleetsFleetIDMembersMemberIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: isFreeMove?.hashValue ?? 0)
				hashCombine(seed: &hash, value: motd?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.FleetUpdate, rhs: Fleets.FleetUpdate) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: role.hashValue)
				hashCombine(seed: &hash, value: squadID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: wingID?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.Movement, rhs: Fleets.Movement) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.PutFleetsFleetIDSquadsSquadIDNotFound, rhs: Fleets.PutFleetsFleetIDSquadsSquadIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
		
		
		public struct GetFleetsFleetIDWingsOk: Codable, Hashable {
			
			public struct GetFleetsFleetIDWingsSquads: Codable, Hashable {
				
				
				public var id: Int64
				public var name: String
				
				public init(id: Int64, name: String) {
					self.id = id
					self.name = name
				}
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: id.hashValue)
					hashCombine(seed: &hash, value: name.hashValue)
					return hash
				}
				
				public static func ==(lhs: Fleets.GetFleetsFleetIDWingsOk.GetFleetsFleetIDWingsSquads, rhs: Fleets.GetFleetsFleetIDWingsOk.GetFleetsFleetIDWingsSquads) -> Bool {
					return lhs.hashValue == rhs.hashValue
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
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: id.hashValue)
				hashCombine(seed: &hash, value: name.hashValue)
				self.squads.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}
			
			public static func ==(lhs: Fleets.GetFleetsFleetIDWingsOk, rhs: Fleets.GetFleetsFleetIDWingsOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.DeleteFleetsFleetIDSquadsSquadIDNotFound, rhs: Fleets.DeleteFleetsFleetIDSquadsSquadIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.DeleteFleetsFleetIDWingsWingIDNotFound, rhs: Fleets.DeleteFleetsFleetIDWingsWingIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: isFreeMove.hashValue)
				hashCombine(seed: &hash, value: isRegistered.hashValue)
				hashCombine(seed: &hash, value: isVoiceEnabled.hashValue)
				hashCombine(seed: &hash, value: motd.hashValue)
				return hash
			}
			
			public static func ==(lhs: Fleets.Information, rhs: Fleets.Information) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
		
		
		public struct GetFleetsFleetIDWingsNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.GetFleetsFleetIDWingsNotFound, rhs: Fleets.GetFleetsFleetIDWingsNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.PutFleetsFleetIDWingsWingIDNotFound, rhs: Fleets.PutFleetsFleetIDWingsWingIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: characterID.hashValue)
				hashCombine(seed: &hash, value: joinTime.hashValue)
				hashCombine(seed: &hash, value: role.hashValue)
				hashCombine(seed: &hash, value: roleName.hashValue)
				hashCombine(seed: &hash, value: shipTypeID.hashValue)
				hashCombine(seed: &hash, value: solarSystemID.hashValue)
				hashCombine(seed: &hash, value: squadID.hashValue)
				hashCombine(seed: &hash, value: stationID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: takesFleetWarp.hashValue)
				hashCombine(seed: &hash, value: wingID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Fleets.Member, rhs: Fleets.Member) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
		
		
		public struct PutFleetsFleetIDNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.PutFleetsFleetIDNotFound, rhs: Fleets.PutFleetsFleetIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.GetCharactersCharacterIDFleetNotFound, rhs: Fleets.GetCharactersCharacterIDFleetNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.GetFleetsFleetIDMembersNotFound, rhs: Fleets.GetFleetsFleetIDMembersNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: fleetID.hashValue)
				hashCombine(seed: &hash, value: role.hashValue)
				hashCombine(seed: &hash, value: squadID.hashValue)
				hashCombine(seed: &hash, value: wingID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Fleets.GetCharactersCharacterIDFleetOk, rhs: Fleets.GetCharactersCharacterIDFleetOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
		
		
		public struct PostFleetsFleetIDMembersUnprocessableEntity: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.PostFleetsFleetIDMembersUnprocessableEntity, rhs: Fleets.PostFleetsFleetIDMembersUnprocessableEntity) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.PostFleetsFleetIDWingsWingIDSquadsNotFound, rhs: Fleets.PostFleetsFleetIDWingsWingIDSquadsNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
		
		
		public struct PutFleetsFleetIDMembersMemberIDUnprocessableEntity: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.PutFleetsFleetIDMembersMemberIDUnprocessableEntity, rhs: Fleets.PutFleetsFleetIDMembersMemberIDUnprocessableEntity) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.PostFleetsFleetIDMembersNotFound, rhs: Fleets.PostFleetsFleetIDMembersNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
