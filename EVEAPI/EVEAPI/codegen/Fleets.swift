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
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body = try? JSONSerialization.data(withJSONObject: newSettings.json, options: [])
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			headers["Content-Type"] = "application/json"
			
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
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-fleets.read_fleet.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
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
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			headers["Content-Type"] = "application/json"
			
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
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			headers["Content-Type"] = "application/json"
			
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
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body = try? JSONSerialization.data(withJSONObject: movement.json, options: [])
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			headers["Content-Type"] = "application/json"
			
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
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			headers["Content-Type"] = "application/json"
			
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
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body = try? JSONSerialization.data(withJSONObject: naming.json, options: [])
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			headers["Content-Type"] = "application/json"
			
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
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			headers["Content-Type"] = "application/json"
			
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
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body = try? JSONSerialization.data(withJSONObject: naming.json, options: [])
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			headers["Content-Type"] = "application/json"
			
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
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			headers["Content-Type"] = "application/json"
			
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
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-fleets.read_fleet.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
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
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-fleets.write_fleet.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body = try? JSONSerialization.data(withJSONObject: invitation.json, options: [])
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			headers["Content-Type"] = "application/json"
			
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
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-fleets.read_fleet.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
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
		
		
		@objc(ESIFleetsPostFleetsFleetIDMembersNotFound) public class PostFleetsFleetIDMembersNotFound: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.error?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Fleets.PostFleetsFleetIDMembersNotFound, rhs: Fleets.PostFleetsFleetIDMembersNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Fleets.PostFleetsFleetIDMembersNotFound) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Fleets.PostFleetsFleetIDMembersNotFound(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? PostFleetsFleetIDMembersNotFound)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIFleetsPutFleetsFleetIDMembersMemberIDNotFound) public class PutFleetsFleetIDMembersMemberIDNotFound: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.error?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Fleets.PutFleetsFleetIDMembersMemberIDNotFound, rhs: Fleets.PutFleetsFleetIDMembersMemberIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Fleets.PutFleetsFleetIDMembersMemberIDNotFound) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Fleets.PutFleetsFleetIDMembersMemberIDNotFound(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? PutFleetsFleetIDMembersMemberIDNotFound)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIFleetsInvitation) public class Invitation: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
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
					guard let s = json as? String, let v = PostFleetsFleetIDMembersRole(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
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
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let characterID = dictionary["character_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.characterID = characterID
				guard let role = Fleets.Invitation.PostFleetsFleetIDMembersRole(rawValue: dictionary["role"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.role = role
				squadID = dictionary["squad_id"] as? Int64
				wingID = dictionary["wing_id"] as? Int64
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.characterID.hashValue)
				hashCombine(seed: &hash, value: self.role.hashValue)
				hashCombine(seed: &hash, value: self.squadID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.wingID?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Fleets.Invitation, rhs: Fleets.Invitation) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Fleets.Invitation) {
				characterID = other.characterID
				role = other.role
				squadID = other.squadID
				wingID = other.wingID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Fleets.Invitation(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Invitation)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIFleetsGetFleetsFleetIDNotFound) public class GetFleetsFleetIDNotFound: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.error?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Fleets.GetFleetsFleetIDNotFound, rhs: Fleets.GetFleetsFleetIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Fleets.GetFleetsFleetIDNotFound) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Fleets.GetFleetsFleetIDNotFound(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetFleetsFleetIDNotFound)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIFleetsPutFleetsFleetIDBadRequest) public class PutFleetsFleetIDBadRequest: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.error?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Fleets.PutFleetsFleetIDBadRequest, rhs: Fleets.PutFleetsFleetIDBadRequest) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Fleets.PutFleetsFleetIDBadRequest) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Fleets.PutFleetsFleetIDBadRequest(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? PutFleetsFleetIDBadRequest)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIFleetsNaming) public class Naming: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var name: String = String()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.name = name
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.name.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Fleets.Naming, rhs: Fleets.Naming) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Fleets.Naming) {
				name = other.name
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Fleets.Naming(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Naming)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIFleetsPostFleetsFleetIDWingsNotFound) public class PostFleetsFleetIDWingsNotFound: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.error?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Fleets.PostFleetsFleetIDWingsNotFound, rhs: Fleets.PostFleetsFleetIDWingsNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Fleets.PostFleetsFleetIDWingsNotFound) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Fleets.PostFleetsFleetIDWingsNotFound(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? PostFleetsFleetIDWingsNotFound)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIFleetsSquadCreated) public class SquadCreated: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var squadID: Int64 = Int64()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let squadID = dictionary["squad_id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.squadID = squadID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.squadID.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Fleets.SquadCreated, rhs: Fleets.SquadCreated) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Fleets.SquadCreated) {
				squadID = other.squadID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Fleets.SquadCreated(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? SquadCreated)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIFleetsDeleteFleetsFleetIDMembersMemberIDNotFound) public class DeleteFleetsFleetIDMembersMemberIDNotFound: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.error?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Fleets.DeleteFleetsFleetIDMembersMemberIDNotFound, rhs: Fleets.DeleteFleetsFleetIDMembersMemberIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Fleets.DeleteFleetsFleetIDMembersMemberIDNotFound) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Fleets.DeleteFleetsFleetIDMembersMemberIDNotFound(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? DeleteFleetsFleetIDMembersMemberIDNotFound)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIFleetsFleetUpdate) public class FleetUpdate: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var isFreeMove: Bool? = nil
			public var motd: String? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				isFreeMove = dictionary["is_free_move"] as? Bool
				motd = dictionary["motd"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.isFreeMove?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.motd?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Fleets.FleetUpdate, rhs: Fleets.FleetUpdate) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Fleets.FleetUpdate) {
				isFreeMove = other.isFreeMove
				motd = other.motd
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Fleets.FleetUpdate(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? FleetUpdate)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIFleetsMovement) public class Movement: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
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
					guard let s = json as? String, let v = PutFleetsFleetIDMembersMemberIDRole(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var role: Fleets.Movement.PutFleetsFleetIDMembersMemberIDRole = Fleets.Movement.PutFleetsFleetIDMembersMemberIDRole()
			public var squadID: Int64? = nil
			public var wingID: Int64? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let role = Fleets.Movement.PutFleetsFleetIDMembersMemberIDRole(rawValue: dictionary["role"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.role = role
				squadID = dictionary["squad_id"] as? Int64
				wingID = dictionary["wing_id"] as? Int64
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.role.hashValue)
				hashCombine(seed: &hash, value: self.squadID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.wingID?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Fleets.Movement, rhs: Fleets.Movement) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Fleets.Movement) {
				role = other.role
				squadID = other.squadID
				wingID = other.wingID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Fleets.Movement(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Movement)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIFleetsPutFleetsFleetIDSquadsSquadIDNotFound) public class PutFleetsFleetIDSquadsSquadIDNotFound: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.error?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Fleets.PutFleetsFleetIDSquadsSquadIDNotFound, rhs: Fleets.PutFleetsFleetIDSquadsSquadIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Fleets.PutFleetsFleetIDSquadsSquadIDNotFound) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Fleets.PutFleetsFleetIDSquadsSquadIDNotFound(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? PutFleetsFleetIDSquadsSquadIDNotFound)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIFleetsGetFleetsFleetIDWingsOk) public class GetFleetsFleetIDWingsOk: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			@objc(ESIFleetsGetFleetsFleetIDWingsOkGetFleetsFleetIDWingsSquads) public class GetFleetsFleetIDWingsSquads: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var id: Int64 = Int64()
				public var name: String = String()
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let id = dictionary["id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.id = id
					guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.name = name
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
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
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.id.hashValue)
					hashCombine(seed: &hash, value: self.name.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: Fleets.GetFleetsFleetIDWingsOk.GetFleetsFleetIDWingsSquads, rhs: Fleets.GetFleetsFleetIDWingsOk.GetFleetsFleetIDWingsSquads) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Fleets.GetFleetsFleetIDWingsOk.GetFleetsFleetIDWingsSquads) {
					id = other.id
					name = other.name
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Fleets.GetFleetsFleetIDWingsOk.GetFleetsFleetIDWingsSquads(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetFleetsFleetIDWingsSquads)?.hashValue == hashValue
				}
				
			}
			
			public var id: Int64 = Int64()
			public var name: String = String()
			public var squads: [Fleets.GetFleetsFleetIDWingsOk.GetFleetsFleetIDWingsSquads] = []
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let id = dictionary["id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.id = id
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.name = name
				squads = try (dictionary["squads"] as? [Any])?.map {try Fleets.GetFleetsFleetIDWingsOk.GetFleetsFleetIDWingsSquads(json: $0)} ?? []
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.id.hashValue)
				hashCombine(seed: &hash, value: self.name.hashValue)
				self.squads.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Fleets.GetFleetsFleetIDWingsOk, rhs: Fleets.GetFleetsFleetIDWingsOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Fleets.GetFleetsFleetIDWingsOk) {
				id = other.id
				name = other.name
				squads = other.squads.flatMap { Fleets.GetFleetsFleetIDWingsOk.GetFleetsFleetIDWingsSquads($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Fleets.GetFleetsFleetIDWingsOk(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetFleetsFleetIDWingsOk)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIFleetsDeleteFleetsFleetIDSquadsSquadIDNotFound) public class DeleteFleetsFleetIDSquadsSquadIDNotFound: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.error?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Fleets.DeleteFleetsFleetIDSquadsSquadIDNotFound, rhs: Fleets.DeleteFleetsFleetIDSquadsSquadIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Fleets.DeleteFleetsFleetIDSquadsSquadIDNotFound) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Fleets.DeleteFleetsFleetIDSquadsSquadIDNotFound(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? DeleteFleetsFleetIDSquadsSquadIDNotFound)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIFleetsDeleteFleetsFleetIDWingsWingIDNotFound) public class DeleteFleetsFleetIDWingsWingIDNotFound: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.error?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Fleets.DeleteFleetsFleetIDWingsWingIDNotFound, rhs: Fleets.DeleteFleetsFleetIDWingsWingIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Fleets.DeleteFleetsFleetIDWingsWingIDNotFound) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Fleets.DeleteFleetsFleetIDWingsWingIDNotFound(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? DeleteFleetsFleetIDWingsWingIDNotFound)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIFleetsInformation) public class Information: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var isFreeMove: Bool = Bool()
			public var isRegistered: Bool = Bool()
			public var isVoiceEnabled: Bool = Bool()
			public var motd: String = String()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let isFreeMove = dictionary["is_free_move"] as? Bool else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.isFreeMove = isFreeMove
				guard let isRegistered = dictionary["is_registered"] as? Bool else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.isRegistered = isRegistered
				guard let isVoiceEnabled = dictionary["is_voice_enabled"] as? Bool else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.isVoiceEnabled = isVoiceEnabled
				guard let motd = dictionary["motd"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.motd = motd
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.isFreeMove.hashValue)
				hashCombine(seed: &hash, value: self.isRegistered.hashValue)
				hashCombine(seed: &hash, value: self.isVoiceEnabled.hashValue)
				hashCombine(seed: &hash, value: self.motd.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Fleets.Information, rhs: Fleets.Information) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Fleets.Information) {
				isFreeMove = other.isFreeMove
				isRegistered = other.isRegistered
				isVoiceEnabled = other.isVoiceEnabled
				motd = other.motd
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Fleets.Information(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Information)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIFleetsGetFleetsFleetIDWingsNotFound) public class GetFleetsFleetIDWingsNotFound: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.error?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Fleets.GetFleetsFleetIDWingsNotFound, rhs: Fleets.GetFleetsFleetIDWingsNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Fleets.GetFleetsFleetIDWingsNotFound) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Fleets.GetFleetsFleetIDWingsNotFound(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetFleetsFleetIDWingsNotFound)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIFleetsPutFleetsFleetIDWingsWingIDNotFound) public class PutFleetsFleetIDWingsWingIDNotFound: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.error?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Fleets.PutFleetsFleetIDWingsWingIDNotFound, rhs: Fleets.PutFleetsFleetIDWingsWingIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Fleets.PutFleetsFleetIDWingsWingIDNotFound) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Fleets.PutFleetsFleetIDWingsWingIDNotFound(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? PutFleetsFleetIDWingsWingIDNotFound)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIFleetsMember) public class Member: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
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
					guard let s = json as? String, let v = GetFleetsFleetIDMembersRole(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
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
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let characterID = dictionary["character_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.characterID = characterID
				guard let joinTime = DateFormatter.esiDateTimeFormatter.date(from: dictionary["join_time"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.joinTime = joinTime
				guard let role = Fleets.Member.GetFleetsFleetIDMembersRole(rawValue: dictionary["role"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.role = role
				guard let roleName = dictionary["role_name"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.roleName = roleName
				guard let shipTypeID = dictionary["ship_type_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.shipTypeID = shipTypeID
				guard let solarSystemID = dictionary["solar_system_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.solarSystemID = solarSystemID
				guard let squadID = dictionary["squad_id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.squadID = squadID
				stationID = dictionary["station_id"] as? Int64
				guard let takesFleetWarp = dictionary["takes_fleet_warp"] as? Bool else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.takesFleetWarp = takesFleetWarp
				guard let wingID = dictionary["wing_id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.wingID = wingID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.characterID.hashValue)
				hashCombine(seed: &hash, value: self.joinTime.hashValue)
				hashCombine(seed: &hash, value: self.role.hashValue)
				hashCombine(seed: &hash, value: self.roleName.hashValue)
				hashCombine(seed: &hash, value: self.shipTypeID.hashValue)
				hashCombine(seed: &hash, value: self.solarSystemID.hashValue)
				hashCombine(seed: &hash, value: self.squadID.hashValue)
				hashCombine(seed: &hash, value: self.stationID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.takesFleetWarp.hashValue)
				hashCombine(seed: &hash, value: self.wingID.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Fleets.Member, rhs: Fleets.Member) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Fleets.Member) {
				characterID = other.characterID
				joinTime = other.joinTime
				role = other.role
				roleName = other.roleName
				shipTypeID = other.shipTypeID
				solarSystemID = other.solarSystemID
				squadID = other.squadID
				stationID = other.stationID
				takesFleetWarp = other.takesFleetWarp
				wingID = other.wingID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Fleets.Member(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Member)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIFleetsPutFleetsFleetIDNotFound) public class PutFleetsFleetIDNotFound: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.error?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Fleets.PutFleetsFleetIDNotFound, rhs: Fleets.PutFleetsFleetIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Fleets.PutFleetsFleetIDNotFound) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Fleets.PutFleetsFleetIDNotFound(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? PutFleetsFleetIDNotFound)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIFleetsGetFleetsFleetIDMembersNotFound) public class GetFleetsFleetIDMembersNotFound: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.error?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Fleets.GetFleetsFleetIDMembersNotFound, rhs: Fleets.GetFleetsFleetIDMembersNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Fleets.GetFleetsFleetIDMembersNotFound) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Fleets.GetFleetsFleetIDMembersNotFound(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetFleetsFleetIDMembersNotFound)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIFleetsPostFleetsFleetIDWingsWingIDSquadsNotFound) public class PostFleetsFleetIDWingsWingIDSquadsNotFound: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.error?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Fleets.PostFleetsFleetIDWingsWingIDSquadsNotFound, rhs: Fleets.PostFleetsFleetIDWingsWingIDSquadsNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Fleets.PostFleetsFleetIDWingsWingIDSquadsNotFound) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Fleets.PostFleetsFleetIDWingsWingIDSquadsNotFound(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? PostFleetsFleetIDWingsWingIDSquadsNotFound)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIFleetsPostFleetsFleetIDMembersUnprocessableEntity) public class PostFleetsFleetIDMembersUnprocessableEntity: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.error?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Fleets.PostFleetsFleetIDMembersUnprocessableEntity, rhs: Fleets.PostFleetsFleetIDMembersUnprocessableEntity) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Fleets.PostFleetsFleetIDMembersUnprocessableEntity) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Fleets.PostFleetsFleetIDMembersUnprocessableEntity(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? PostFleetsFleetIDMembersUnprocessableEntity)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIFleetsPutFleetsFleetIDMembersMemberIDUnprocessableEntity) public class PutFleetsFleetIDMembersMemberIDUnprocessableEntity: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.error?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Fleets.PutFleetsFleetIDMembersMemberIDUnprocessableEntity, rhs: Fleets.PutFleetsFleetIDMembersMemberIDUnprocessableEntity) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Fleets.PutFleetsFleetIDMembersMemberIDUnprocessableEntity) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Fleets.PutFleetsFleetIDMembersMemberIDUnprocessableEntity(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? PutFleetsFleetIDMembersMemberIDUnprocessableEntity)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIFleetsWingCreated) public class WingCreated: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var wingID: Int64 = Int64()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let wingID = dictionary["wing_id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.wingID = wingID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.wingID.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Fleets.WingCreated, rhs: Fleets.WingCreated) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Fleets.WingCreated) {
				wingID = other.wingID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Fleets.WingCreated(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? WingCreated)?.hashValue == hashValue
			}
			
		}
		
		
	}
	
}
