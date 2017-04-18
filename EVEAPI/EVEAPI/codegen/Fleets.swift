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
		
		public func updateFleet(fleetID: Int64, newSettings: Fleets.FleetUpdate, completionBlock:((Result<String>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body = try? JSONSerialization.data(withJSONObject: newSettings.json, options: [])
			
			let headers = HTTPHeaders()
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/fleets/\(fleetID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .put, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<String>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getFleetInformation(fleetID: Int64, completionBlock:((Result<Fleets.Information>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-fleets.read_fleet.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			let headers = HTTPHeaders()
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/fleets/\(fleetID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Fleets.Information>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func createFleetSquad(fleetID: Int64, wingID: Int64, completionBlock:((Result<Fleets.SquadCreated>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			let headers = HTTPHeaders()
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/fleets/\(fleetID)/wings/\(wingID)/squads/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Fleets.SquadCreated>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func kickFleetMember(fleetID: Int64, memberID: Int, completionBlock:((Result<String>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			let headers = HTTPHeaders()
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/fleets/\(fleetID)/members/\(memberID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .delete, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<String>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func moveFleetMember(fleetID: Int64, memberID: Int, movement: Fleets.Movement, completionBlock:((Result<String>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body = try? JSONSerialization.data(withJSONObject: movement.json, options: [])
			
			let headers = HTTPHeaders()
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/fleets/\(fleetID)/members/\(memberID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .put, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<String>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func deleteFleetSquad(fleetID: Int64, squadID: Int64, completionBlock:((Result<String>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			let headers = HTTPHeaders()
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/fleets/\(fleetID)/squads/\(squadID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .delete, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<String>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func renameFleetSquad(fleetID: Int64, naming: Fleets.Naming, squadID: Int64, completionBlock:((Result<String>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body = try? JSONSerialization.data(withJSONObject: naming.json, options: [])
			
			let headers = HTTPHeaders()
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/fleets/\(fleetID)/squads/\(squadID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .put, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<String>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func deleteFleetWing(fleetID: Int64, wingID: Int64, completionBlock:((Result<String>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			let headers = HTTPHeaders()
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/fleets/\(fleetID)/wings/\(wingID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .delete, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<String>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func renameFleetWing(fleetID: Int64, naming: Fleets.Naming, wingID: Int64, completionBlock:((Result<String>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body = try? JSONSerialization.data(withJSONObject: naming.json, options: [])
			
			let headers = HTTPHeaders()
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/fleets/\(fleetID)/wings/\(wingID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .put, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<String>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func createFleetWing(fleetID: Int64, completionBlock:((Result<Fleets.WingCreated>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			let headers = HTTPHeaders()
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/fleets/\(fleetID)/wings/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Fleets.WingCreated>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getFleetWings(fleetID: Int64, language: Language? = nil, completionBlock:((Result<[Fleets.GetFleetsFleetIDWingsOk]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-fleets.read_fleet.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			let headers = HTTPHeaders()
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = language?.httpQuery {
				query.append(URLQueryItem(name: "language", value: v))
			}
			
			let url = session!.baseURL + "latest/fleets/\(fleetID)/wings/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Fleets.GetFleetsFleetIDWingsOk]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func createFleetInvitation(fleetID: Int64, invitation: Fleets.Invitation, completionBlock:((Result<String>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body = try? JSONSerialization.data(withJSONObject: invitation.json, options: [])
			
			let headers = HTTPHeaders()
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/fleets/\(fleetID)/members/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<String>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getFleetMembers(fleetID: Int64, language: Language? = nil, completionBlock:((Result<[Fleets.Member]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-fleets.read_fleet.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			let headers = HTTPHeaders()
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = language?.httpQuery {
				query.append(URLQueryItem(name: "language", value: v))
			}
			
			let url = session!.baseURL + "latest/fleets/\(fleetID)/members/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Fleets.Member]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		public class PutFleetsFleetIDSquadsSquadIDForbidden: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.PutFleetsFleetIDSquadsSquadIDForbidden, rhs: Fleets.PutFleetsFleetIDSquadsSquadIDForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class Invitation: NSObject, NSSecureCoding , JSONCoding {
			
			public enum PostFleetsFleetIDMembersRole: String, JSONCoding, HTTPQueryable {
				case fleetCommander = "fleet_commander"
				case squadCommander = "squad_commander"
				case squadMember = "squad_member"
				case wingCommander = "wing_commander"
				
				public init() {
					self = .fleetCommander
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = PostFleetsFleetIDMembersRole(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var characterID: Int = Int()
			public var role: Fleets.Invitation.PostFleetsFleetIDMembersRole = Fleets.Invitation.PostFleetsFleetIDMembersRole()
			public var squadID: Int64? = nil
			public var wingID: Int64? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let characterID = dictionary["character_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.characterID = characterID
				guard let role = Fleets.Invitation.PostFleetsFleetIDMembersRole(rawValue: dictionary["role"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.role = role
				squadID = dictionary["squad_id"] as? Int64
				wingID = dictionary["wing_id"] as? Int64
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				characterID = aDecoder.decodeInteger(forKey: "character_id")
				role = Fleets.Invitation.PostFleetsFleetIDMembersRole(rawValue: aDecoder.decodeObject(forKey: "role") as? String ?? "") ?? Fleets.Invitation.PostFleetsFleetIDMembersRole()
				squadID = aDecoder.containsValue(forKey: "squad_id") ? aDecoder.decodeInt64(forKey: "squad_id") : nil
				wingID = aDecoder.containsValue(forKey: "wing_id") ? aDecoder.decodeInt64(forKey: "wing_id") : nil
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(characterID, forKey: "character_id")
				aCoder.encode(role.rawValue, forKey: "role")
				if let v = squadID {
					aCoder.encode(v, forKey: "squad_id")
				}
				if let v = wingID {
					aCoder.encode(v, forKey: "wing_id")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["character_id"] = characterID.json
				json["role"] = role.json
				if let v = squadID?.json {
					json["squad_id"] = v
				}
				if let v = wingID?.json {
					json["wing_id"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
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
			
		}
		
		
		public class GetFleetsFleetIDMembersInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.GetFleetsFleetIDMembersInternalServerError, rhs: Fleets.GetFleetsFleetIDMembersInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PostFleetsFleetIDWingsInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.PostFleetsFleetIDWingsInternalServerError, rhs: Fleets.PostFleetsFleetIDWingsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class DeleteFleetsFleetIDMembersMemberIDInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.DeleteFleetsFleetIDMembersMemberIDInternalServerError, rhs: Fleets.DeleteFleetsFleetIDMembersMemberIDInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PutFleetsFleetIDMembersMemberIDForbidden: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.PutFleetsFleetIDMembersMemberIDForbidden, rhs: Fleets.PutFleetsFleetIDMembersMemberIDForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PutFleetsFleetIDSquadsSquadIDInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.PutFleetsFleetIDSquadsSquadIDInternalServerError, rhs: Fleets.PutFleetsFleetIDSquadsSquadIDInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PutFleetsFleetIDBadRequest: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.PutFleetsFleetIDBadRequest, rhs: Fleets.PutFleetsFleetIDBadRequest) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PostFleetsFleetIDMembersForbidden: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.PostFleetsFleetIDMembersForbidden, rhs: Fleets.PostFleetsFleetIDMembersForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PostFleetsFleetIDWingsWingIDSquadsForbidden: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.PostFleetsFleetIDWingsWingIDSquadsForbidden, rhs: Fleets.PostFleetsFleetIDWingsWingIDSquadsForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class Naming: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var name: String = String()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.name = name
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				name = aDecoder.decodeObject(forKey: "name") as? String ?? String()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(name, forKey: "name")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["name"] = name.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: name.hashValue)
				return hash
			}
			
			public static func ==(lhs: Fleets.Naming, rhs: Fleets.Naming) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PostFleetsFleetIDWingsNotFound: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.PostFleetsFleetIDWingsNotFound, rhs: Fleets.PostFleetsFleetIDWingsNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PostFleetsFleetIDMembersInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.PostFleetsFleetIDMembersInternalServerError, rhs: Fleets.PostFleetsFleetIDMembersInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PutFleetsFleetIDForbidden: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.PutFleetsFleetIDForbidden, rhs: Fleets.PutFleetsFleetIDForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PutFleetsFleetIDMembersMemberIDInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.PutFleetsFleetIDMembersMemberIDInternalServerError, rhs: Fleets.PutFleetsFleetIDMembersMemberIDInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetFleetsFleetIDInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.GetFleetsFleetIDInternalServerError, rhs: Fleets.GetFleetsFleetIDInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PutFleetsFleetIDInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.PutFleetsFleetIDInternalServerError, rhs: Fleets.PutFleetsFleetIDInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PutFleetsFleetIDSquadsSquadIDNotFound: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.PutFleetsFleetIDSquadsSquadIDNotFound, rhs: Fleets.PutFleetsFleetIDSquadsSquadIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetFleetsFleetIDWingsOk: NSObject, NSSecureCoding , JSONCoding {
			
			public class GetFleetsFleetIDWingsSquads: NSObject, NSSecureCoding , JSONCoding {
				
				
				public var id: Int64 = Int64()
				public var name: String = String()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let id = dictionary["id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.id = id
					guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.name = name
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					id = aDecoder.decodeInt64(forKey: "id")
					name = aDecoder.decodeObject(forKey: "name") as? String ?? String()
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(id, forKey: "id")
					aCoder.encode(name, forKey: "name")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["id"] = id.json
					json["name"] = name.json
					return json
				}
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: id.hashValue)
					hashCombine(seed: &hash, value: name.hashValue)
					return hash
				}
				
				public static func ==(lhs: Fleets.GetFleetsFleetIDWingsOk.GetFleetsFleetIDWingsSquads, rhs: Fleets.GetFleetsFleetIDWingsOk.GetFleetsFleetIDWingsSquads) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
			}
			
			public var id: Int64 = Int64()
			public var name: String = String()
			public var squads: [Fleets.GetFleetsFleetIDWingsOk.GetFleetsFleetIDWingsSquads] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let id = dictionary["id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.id = id
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.name = name
				squads = try (dictionary["squads"] as? [Any])?.map {try Fleets.GetFleetsFleetIDWingsOk.GetFleetsFleetIDWingsSquads(json: $0)} ?? []
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				id = aDecoder.decodeInt64(forKey: "id")
				name = aDecoder.decodeObject(forKey: "name") as? String ?? String()
				squads = aDecoder.decodeObject(of: [Fleets.GetFleetsFleetIDWingsOk.GetFleetsFleetIDWingsSquads.self], forKey: "squads") as? [Fleets.GetFleetsFleetIDWingsOk.GetFleetsFleetIDWingsSquads] ?? []
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(id, forKey: "id")
				aCoder.encode(name, forKey: "name")
				aCoder.encode(squads, forKey: "squads")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["id"] = id.json
				json["name"] = name.json
				json["squads"] = squads.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: id.hashValue)
				hashCombine(seed: &hash, value: name.hashValue)
				squads.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}
			
			public static func ==(lhs: Fleets.GetFleetsFleetIDWingsOk, rhs: Fleets.GetFleetsFleetIDWingsOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class DeleteFleetsFleetIDSquadsSquadIDNotFound: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.DeleteFleetsFleetIDSquadsSquadIDNotFound, rhs: Fleets.DeleteFleetsFleetIDSquadsSquadIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class DeleteFleetsFleetIDWingsWingIDNotFound: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.DeleteFleetsFleetIDWingsWingIDNotFound, rhs: Fleets.DeleteFleetsFleetIDWingsWingIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetFleetsFleetIDWingsInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.GetFleetsFleetIDWingsInternalServerError, rhs: Fleets.GetFleetsFleetIDWingsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class DeleteFleetsFleetIDWingsWingIDInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.DeleteFleetsFleetIDWingsWingIDInternalServerError, rhs: Fleets.DeleteFleetsFleetIDWingsWingIDInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PostFleetsFleetIDMembersUnprocessableEntity: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.PostFleetsFleetIDMembersUnprocessableEntity, rhs: Fleets.PostFleetsFleetIDMembersUnprocessableEntity) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PutFleetsFleetIDWingsWingIDInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.PutFleetsFleetIDWingsWingIDInternalServerError, rhs: Fleets.PutFleetsFleetIDWingsWingIDInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PutFleetsFleetIDMembersMemberIDUnprocessableEntity: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.PutFleetsFleetIDMembersMemberIDUnprocessableEntity, rhs: Fleets.PutFleetsFleetIDMembersMemberIDUnprocessableEntity) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class WingCreated: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var wingID: Int64 = Int64()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let wingID = dictionary["wing_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.wingID = wingID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				wingID = aDecoder.decodeInt64(forKey: "wing_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(wingID, forKey: "wing_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["wing_id"] = wingID.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: wingID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Fleets.WingCreated, rhs: Fleets.WingCreated) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PutFleetsFleetIDMembersMemberIDNotFound: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.PutFleetsFleetIDMembersMemberIDNotFound, rhs: Fleets.PutFleetsFleetIDMembersMemberIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class DeleteFleetsFleetIDSquadsSquadIDInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.DeleteFleetsFleetIDSquadsSquadIDInternalServerError, rhs: Fleets.DeleteFleetsFleetIDSquadsSquadIDInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetFleetsFleetIDNotFound: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.GetFleetsFleetIDNotFound, rhs: Fleets.GetFleetsFleetIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class DeleteFleetsFleetIDMembersMemberIDForbidden: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.DeleteFleetsFleetIDMembersMemberIDForbidden, rhs: Fleets.DeleteFleetsFleetIDMembersMemberIDForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class DeleteFleetsFleetIDWingsWingIDForbidden: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.DeleteFleetsFleetIDWingsWingIDForbidden, rhs: Fleets.DeleteFleetsFleetIDWingsWingIDForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class SquadCreated: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var squadID: Int64 = Int64()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let squadID = dictionary["squad_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.squadID = squadID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				squadID = aDecoder.decodeInt64(forKey: "squad_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(squadID, forKey: "squad_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["squad_id"] = squadID.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: squadID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Fleets.SquadCreated, rhs: Fleets.SquadCreated) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class FleetUpdate: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var isFreeMove: Bool? = nil
			public var motd: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				isFreeMove = dictionary["is_free_move"] as? Bool
				motd = dictionary["motd"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				isFreeMove = aDecoder.containsValue(forKey: "is_free_move") ? aDecoder.decodeBool(forKey: "is_free_move") : nil
				motd = aDecoder.decodeObject(forKey: "motd") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = isFreeMove {
					aCoder.encode(v, forKey: "is_free_move")
				}
				if let v = motd {
					aCoder.encode(v, forKey: "motd")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = isFreeMove?.json {
					json["is_free_move"] = v
				}
				if let v = motd?.json {
					json["motd"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: isFreeMove?.hashValue ?? 0)
				hashCombine(seed: &hash, value: motd?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.FleetUpdate, rhs: Fleets.FleetUpdate) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class DeleteFleetsFleetIDMembersMemberIDNotFound: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.DeleteFleetsFleetIDMembersMemberIDNotFound, rhs: Fleets.DeleteFleetsFleetIDMembersMemberIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetFleetsFleetIDForbidden: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.GetFleetsFleetIDForbidden, rhs: Fleets.GetFleetsFleetIDForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class Movement: NSObject, NSSecureCoding , JSONCoding {
			
			public enum PutFleetsFleetIDMembersMemberIDRole: String, JSONCoding, HTTPQueryable {
				case fleetCommander = "fleet_commander"
				case squadCommander = "squad_commander"
				case squadMember = "squad_member"
				case wingCommander = "wing_commander"
				
				public init() {
					self = .fleetCommander
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = PutFleetsFleetIDMembersMemberIDRole(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var role: Fleets.Movement.PutFleetsFleetIDMembersMemberIDRole = Fleets.Movement.PutFleetsFleetIDMembersMemberIDRole()
			public var squadID: Int64? = nil
			public var wingID: Int64? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let role = Fleets.Movement.PutFleetsFleetIDMembersMemberIDRole(rawValue: dictionary["role"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.role = role
				squadID = dictionary["squad_id"] as? Int64
				wingID = dictionary["wing_id"] as? Int64
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				role = Fleets.Movement.PutFleetsFleetIDMembersMemberIDRole(rawValue: aDecoder.decodeObject(forKey: "role") as? String ?? "") ?? Fleets.Movement.PutFleetsFleetIDMembersMemberIDRole()
				squadID = aDecoder.containsValue(forKey: "squad_id") ? aDecoder.decodeInt64(forKey: "squad_id") : nil
				wingID = aDecoder.containsValue(forKey: "wing_id") ? aDecoder.decodeInt64(forKey: "wing_id") : nil
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(role.rawValue, forKey: "role")
				if let v = squadID {
					aCoder.encode(v, forKey: "squad_id")
				}
				if let v = wingID {
					aCoder.encode(v, forKey: "wing_id")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["role"] = role.json
				if let v = squadID?.json {
					json["squad_id"] = v
				}
				if let v = wingID?.json {
					json["wing_id"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: role.hashValue)
				hashCombine(seed: &hash, value: squadID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: wingID?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.Movement, rhs: Fleets.Movement) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PostFleetsFleetIDWingsWingIDSquadsInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.PostFleetsFleetIDWingsWingIDSquadsInternalServerError, rhs: Fleets.PostFleetsFleetIDWingsWingIDSquadsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetFleetsFleetIDWingsForbidden: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.GetFleetsFleetIDWingsForbidden, rhs: Fleets.GetFleetsFleetIDWingsForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class Information: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var isFreeMove: Bool = Bool()
			public var isRegistered: Bool = Bool()
			public var isVoiceEnabled: Bool = Bool()
			public var motd: String = String()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let isFreeMove = dictionary["is_free_move"] as? Bool else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.isFreeMove = isFreeMove
				guard let isRegistered = dictionary["is_registered"] as? Bool else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.isRegistered = isRegistered
				guard let isVoiceEnabled = dictionary["is_voice_enabled"] as? Bool else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.isVoiceEnabled = isVoiceEnabled
				guard let motd = dictionary["motd"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.motd = motd
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				isFreeMove = aDecoder.decodeBool(forKey: "is_free_move")
				isRegistered = aDecoder.decodeBool(forKey: "is_registered")
				isVoiceEnabled = aDecoder.decodeBool(forKey: "is_voice_enabled")
				motd = aDecoder.decodeObject(forKey: "motd") as? String ?? String()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(isFreeMove, forKey: "is_free_move")
				aCoder.encode(isRegistered, forKey: "is_registered")
				aCoder.encode(isVoiceEnabled, forKey: "is_voice_enabled")
				aCoder.encode(motd, forKey: "motd")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["is_free_move"] = isFreeMove.json
				json["is_registered"] = isRegistered.json
				json["is_voice_enabled"] = isVoiceEnabled.json
				json["motd"] = motd.json
				return json
			}
			
			override public var hashValue: Int {
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
			
		}
		
		
		public class GetFleetsFleetIDWingsNotFound: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.GetFleetsFleetIDWingsNotFound, rhs: Fleets.GetFleetsFleetIDWingsNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PutFleetsFleetIDWingsWingIDNotFound: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.PutFleetsFleetIDWingsWingIDNotFound, rhs: Fleets.PutFleetsFleetIDWingsWingIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class Member: NSObject, NSSecureCoding , JSONCoding {
			
			public enum GetFleetsFleetIDMembersRole: String, JSONCoding, HTTPQueryable {
				case fleetCommander = "fleet_commander"
				case squadCommander = "squad_commander"
				case squadMember = "squad_member"
				case wingCommander = "wing_commander"
				
				public init() {
					self = .fleetCommander
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetFleetsFleetIDMembersRole(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var characterID: Int = Int()
			public var joinTime: Date = Date()
			public var role: Fleets.Member.GetFleetsFleetIDMembersRole = Fleets.Member.GetFleetsFleetIDMembersRole()
			public var roleName: String = String()
			public var shipTypeID: Int = Int()
			public var solarSystemID: Int = Int()
			public var squadID: Int64 = Int64()
			public var stationID: Int64? = nil
			public var takesFleetWarp: Bool = Bool()
			public var wingID: Int64 = Int64()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let characterID = dictionary["character_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.characterID = characterID
				guard let joinTime = DateFormatter.esiDateFormatter.date(from: dictionary["join_time"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.joinTime = joinTime
				guard let role = Fleets.Member.GetFleetsFleetIDMembersRole(rawValue: dictionary["role"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.role = role
				guard let roleName = dictionary["role_name"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.roleName = roleName
				guard let shipTypeID = dictionary["ship_type_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.shipTypeID = shipTypeID
				guard let solarSystemID = dictionary["solar_system_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.solarSystemID = solarSystemID
				guard let squadID = dictionary["squad_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.squadID = squadID
				stationID = dictionary["station_id"] as? Int64
				guard let takesFleetWarp = dictionary["takes_fleet_warp"] as? Bool else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.takesFleetWarp = takesFleetWarp
				guard let wingID = dictionary["wing_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.wingID = wingID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				characterID = aDecoder.decodeInteger(forKey: "character_id")
				joinTime = aDecoder.decodeObject(forKey: "join_time") as? Date ?? Date()
				role = Fleets.Member.GetFleetsFleetIDMembersRole(rawValue: aDecoder.decodeObject(forKey: "role") as? String ?? "") ?? Fleets.Member.GetFleetsFleetIDMembersRole()
				roleName = aDecoder.decodeObject(forKey: "role_name") as? String ?? String()
				shipTypeID = aDecoder.decodeInteger(forKey: "ship_type_id")
				solarSystemID = aDecoder.decodeInteger(forKey: "solar_system_id")
				squadID = aDecoder.decodeInt64(forKey: "squad_id")
				stationID = aDecoder.containsValue(forKey: "station_id") ? aDecoder.decodeInt64(forKey: "station_id") : nil
				takesFleetWarp = aDecoder.decodeBool(forKey: "takes_fleet_warp")
				wingID = aDecoder.decodeInt64(forKey: "wing_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(characterID, forKey: "character_id")
				aCoder.encode(joinTime, forKey: "join_time")
				aCoder.encode(role.rawValue, forKey: "role")
				aCoder.encode(roleName, forKey: "role_name")
				aCoder.encode(shipTypeID, forKey: "ship_type_id")
				aCoder.encode(solarSystemID, forKey: "solar_system_id")
				aCoder.encode(squadID, forKey: "squad_id")
				if let v = stationID {
					aCoder.encode(v, forKey: "station_id")
				}
				aCoder.encode(takesFleetWarp, forKey: "takes_fleet_warp")
				aCoder.encode(wingID, forKey: "wing_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["character_id"] = characterID.json
				json["join_time"] = joinTime.json
				json["role"] = role.json
				json["role_name"] = roleName.json
				json["ship_type_id"] = shipTypeID.json
				json["solar_system_id"] = solarSystemID.json
				json["squad_id"] = squadID.json
				if let v = stationID?.json {
					json["station_id"] = v
				}
				json["takes_fleet_warp"] = takesFleetWarp.json
				json["wing_id"] = wingID.json
				return json
			}
			
			override public var hashValue: Int {
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
			
		}
		
		
		public class PutFleetsFleetIDNotFound: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.PutFleetsFleetIDNotFound, rhs: Fleets.PutFleetsFleetIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetFleetsFleetIDMembersNotFound: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.GetFleetsFleetIDMembersNotFound, rhs: Fleets.GetFleetsFleetIDMembersNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PostFleetsFleetIDWingsForbidden: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.PostFleetsFleetIDWingsForbidden, rhs: Fleets.PostFleetsFleetIDWingsForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PutFleetsFleetIDWingsWingIDForbidden: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.PutFleetsFleetIDWingsWingIDForbidden, rhs: Fleets.PutFleetsFleetIDWingsWingIDForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class DeleteFleetsFleetIDSquadsSquadIDForbidden: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.DeleteFleetsFleetIDSquadsSquadIDForbidden, rhs: Fleets.DeleteFleetsFleetIDSquadsSquadIDForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PostFleetsFleetIDWingsWingIDSquadsNotFound: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.PostFleetsFleetIDWingsWingIDSquadsNotFound, rhs: Fleets.PostFleetsFleetIDWingsWingIDSquadsNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetFleetsFleetIDMembersForbidden: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.GetFleetsFleetIDMembersForbidden, rhs: Fleets.GetFleetsFleetIDMembersForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PostFleetsFleetIDMembersNotFound: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Fleets.PostFleetsFleetIDMembersNotFound, rhs: Fleets.PostFleetsFleetIDMembersNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
	}
	
}
