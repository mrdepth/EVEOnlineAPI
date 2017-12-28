import Foundation
import Alamofire


public extension ESI {
	public var wars: Wars {
		return Wars(sessionManager: self)
	}
	
	class Wars {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		public func listWars(maxWarID: Int? = nil, completionBlock:((Result<[Int]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = maxWarID?.httpQuery {
				query.append(URLQueryItem(name: "max_war_id", value: v))
			}
			
			let url = session!.baseURL + "/v1/wars/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Int]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getWarInformation(warID: Int, completionBlock:((Result<Wars.WarInformation>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/wars/\(warID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Wars.WarInformation>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func listKillsForWar(page: Int? = nil, warID: Int, completionBlock:((Result<[Wars.Kills]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v1/wars/\(warID)/killmails/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Wars.Kills]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		@objc(ESIWarsKills) public class Kills: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var killmailHash: String = String()
			public var killmailID: Int = Int()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let killmailHash = dictionary["killmail_hash"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.killmailHash = killmailHash
				guard let killmailID = dictionary["killmail_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.killmailID = killmailID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				killmailHash = aDecoder.decodeObject(forKey: "killmail_hash") as? String ?? String()
				killmailID = aDecoder.decodeInteger(forKey: "killmail_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(killmailHash, forKey: "killmail_hash")
				aCoder.encode(killmailID, forKey: "killmail_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["killmail_hash"] = killmailHash.json
				json["killmail_id"] = killmailID.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.killmailHash.hashValue)
				hashCombine(seed: &hash, value: self.killmailID.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Wars.Kills, rhs: Wars.Kills) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Wars.Kills) {
				killmailHash = other.killmailHash
				killmailID = other.killmailID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Wars.Kills(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Kills)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIWarsWarInformation) public class WarInformation: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			@objc(ESIWarsWarInformationGetWarsWarIDDefender) public class GetWarsWarIDDefender: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var allianceID: Int? = nil
				public var corporationID: Int? = nil
				public var iskDestroyed: Float = Float()
				public var shipsKilled: Int = Int()
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					allianceID = dictionary["alliance_id"] as? Int
					corporationID = dictionary["corporation_id"] as? Int
					guard let iskDestroyed = dictionary["isk_destroyed"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.iskDestroyed = iskDestroyed
					guard let shipsKilled = dictionary["ships_killed"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.shipsKilled = shipsKilled
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init?(coder aDecoder: NSCoder) {
					allianceID = aDecoder.containsValue(forKey: "alliance_id") ? aDecoder.decodeInteger(forKey: "alliance_id") : nil
					corporationID = aDecoder.containsValue(forKey: "corporation_id") ? aDecoder.decodeInteger(forKey: "corporation_id") : nil
					iskDestroyed = aDecoder.decodeFloat(forKey: "isk_destroyed")
					shipsKilled = aDecoder.decodeInteger(forKey: "ships_killed")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					if let v = allianceID {
						aCoder.encode(v, forKey: "alliance_id")
					}
					if let v = corporationID {
						aCoder.encode(v, forKey: "corporation_id")
					}
					aCoder.encode(iskDestroyed, forKey: "isk_destroyed")
					aCoder.encode(shipsKilled, forKey: "ships_killed")
				}
				
				public var json: Any {
					var json = [String: Any]()
					if let v = allianceID?.json {
						json["alliance_id"] = v
					}
					if let v = corporationID?.json {
						json["corporation_id"] = v
					}
					json["isk_destroyed"] = iskDestroyed.json
					json["ships_killed"] = shipsKilled.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.allianceID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.corporationID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.iskDestroyed.hashValue)
					hashCombine(seed: &hash, value: self.shipsKilled.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: Wars.WarInformation.GetWarsWarIDDefender, rhs: Wars.WarInformation.GetWarsWarIDDefender) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Wars.WarInformation.GetWarsWarIDDefender) {
					allianceID = other.allianceID
					corporationID = other.corporationID
					iskDestroyed = other.iskDestroyed
					shipsKilled = other.shipsKilled
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Wars.WarInformation.GetWarsWarIDDefender(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetWarsWarIDDefender)?.hashValue == hashValue
				}
				
			}
			
			@objc(ESIWarsWarInformationGetWarsWarIDAllies) public class GetWarsWarIDAllies: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var allianceID: Int? = nil
				public var corporationID: Int? = nil
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					allianceID = dictionary["alliance_id"] as? Int
					corporationID = dictionary["corporation_id"] as? Int
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init?(coder aDecoder: NSCoder) {
					allianceID = aDecoder.containsValue(forKey: "alliance_id") ? aDecoder.decodeInteger(forKey: "alliance_id") : nil
					corporationID = aDecoder.containsValue(forKey: "corporation_id") ? aDecoder.decodeInteger(forKey: "corporation_id") : nil
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					if let v = allianceID {
						aCoder.encode(v, forKey: "alliance_id")
					}
					if let v = corporationID {
						aCoder.encode(v, forKey: "corporation_id")
					}
				}
				
				public var json: Any {
					var json = [String: Any]()
					if let v = allianceID?.json {
						json["alliance_id"] = v
					}
					if let v = corporationID?.json {
						json["corporation_id"] = v
					}
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.allianceID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.corporationID?.hashValue ?? 0)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: Wars.WarInformation.GetWarsWarIDAllies, rhs: Wars.WarInformation.GetWarsWarIDAllies) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Wars.WarInformation.GetWarsWarIDAllies) {
					allianceID = other.allianceID
					corporationID = other.corporationID
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Wars.WarInformation.GetWarsWarIDAllies(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetWarsWarIDAllies)?.hashValue == hashValue
				}
				
			}
			
			@objc(ESIWarsWarInformationGetWarsWarIDAggressor) public class GetWarsWarIDAggressor: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var allianceID: Int? = nil
				public var corporationID: Int? = nil
				public var iskDestroyed: Float = Float()
				public var shipsKilled: Int = Int()
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					allianceID = dictionary["alliance_id"] as? Int
					corporationID = dictionary["corporation_id"] as? Int
					guard let iskDestroyed = dictionary["isk_destroyed"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.iskDestroyed = iskDestroyed
					guard let shipsKilled = dictionary["ships_killed"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.shipsKilled = shipsKilled
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init?(coder aDecoder: NSCoder) {
					allianceID = aDecoder.containsValue(forKey: "alliance_id") ? aDecoder.decodeInteger(forKey: "alliance_id") : nil
					corporationID = aDecoder.containsValue(forKey: "corporation_id") ? aDecoder.decodeInteger(forKey: "corporation_id") : nil
					iskDestroyed = aDecoder.decodeFloat(forKey: "isk_destroyed")
					shipsKilled = aDecoder.decodeInteger(forKey: "ships_killed")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					if let v = allianceID {
						aCoder.encode(v, forKey: "alliance_id")
					}
					if let v = corporationID {
						aCoder.encode(v, forKey: "corporation_id")
					}
					aCoder.encode(iskDestroyed, forKey: "isk_destroyed")
					aCoder.encode(shipsKilled, forKey: "ships_killed")
				}
				
				public var json: Any {
					var json = [String: Any]()
					if let v = allianceID?.json {
						json["alliance_id"] = v
					}
					if let v = corporationID?.json {
						json["corporation_id"] = v
					}
					json["isk_destroyed"] = iskDestroyed.json
					json["ships_killed"] = shipsKilled.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.allianceID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.corporationID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.iskDestroyed.hashValue)
					hashCombine(seed: &hash, value: self.shipsKilled.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: Wars.WarInformation.GetWarsWarIDAggressor, rhs: Wars.WarInformation.GetWarsWarIDAggressor) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Wars.WarInformation.GetWarsWarIDAggressor) {
					allianceID = other.allianceID
					corporationID = other.corporationID
					iskDestroyed = other.iskDestroyed
					shipsKilled = other.shipsKilled
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Wars.WarInformation.GetWarsWarIDAggressor(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetWarsWarIDAggressor)?.hashValue == hashValue
				}
				
			}
			
			public var aggressor: Wars.WarInformation.GetWarsWarIDAggressor = Wars.WarInformation.GetWarsWarIDAggressor()
			public var allies: [Wars.WarInformation.GetWarsWarIDAllies]? = nil
			public var declared: Date = Date()
			public var defender: Wars.WarInformation.GetWarsWarIDDefender = Wars.WarInformation.GetWarsWarIDDefender()
			public var finished: Date? = nil
			public var id: Int = Int()
			public var mutual: Bool = Bool()
			public var openForAllies: Bool = Bool()
			public var retracted: Date? = nil
			public var started: Date? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				aggressor = try Wars.WarInformation.GetWarsWarIDAggressor(json: dictionary["aggressor"] as? [String: Any] ?? [:])
				allies = try (dictionary["allies"] as? [Any])?.map {try Wars.WarInformation.GetWarsWarIDAllies(json: $0)}
				guard let declared = DateFormatter.esiDateTimeFormatter.date(from: dictionary["declared"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.declared = declared
				defender = try Wars.WarInformation.GetWarsWarIDDefender(json: dictionary["defender"] as? [String: Any] ?? [:])
				finished = DateFormatter.esiDateTimeFormatter.date(from: dictionary["finished"] as? String ?? "")
				guard let id = dictionary["id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.id = id
				guard let mutual = dictionary["mutual"] as? Bool else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.mutual = mutual
				guard let openForAllies = dictionary["open_for_allies"] as? Bool else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.openForAllies = openForAllies
				retracted = DateFormatter.esiDateTimeFormatter.date(from: dictionary["retracted"] as? String ?? "")
				started = DateFormatter.esiDateTimeFormatter.date(from: dictionary["started"] as? String ?? "")
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				aggressor = aDecoder.decodeObject(of: Wars.WarInformation.GetWarsWarIDAggressor.self, forKey: "aggressor")  ?? Wars.WarInformation.GetWarsWarIDAggressor()
				allies = aDecoder.decodeObject(of: [Wars.WarInformation.GetWarsWarIDAllies.self], forKey: "allies") as? [Wars.WarInformation.GetWarsWarIDAllies]
				declared = aDecoder.decodeObject(forKey: "declared") as? Date ?? Date()
				defender = aDecoder.decodeObject(of: Wars.WarInformation.GetWarsWarIDDefender.self, forKey: "defender")  ?? Wars.WarInformation.GetWarsWarIDDefender()
				finished = aDecoder.decodeObject(forKey: "finished") as? Date
				id = aDecoder.decodeInteger(forKey: "id")
				mutual = aDecoder.decodeBool(forKey: "mutual")
				openForAllies = aDecoder.decodeBool(forKey: "open_for_allies")
				retracted = aDecoder.decodeObject(forKey: "retracted") as? Date
				started = aDecoder.decodeObject(forKey: "started") as? Date
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(aggressor, forKey: "aggressor")
				if let v = allies {
					aCoder.encode(v, forKey: "allies")
				}
				aCoder.encode(declared, forKey: "declared")
				aCoder.encode(defender, forKey: "defender")
				if let v = finished {
					aCoder.encode(v, forKey: "finished")
				}
				aCoder.encode(id, forKey: "id")
				aCoder.encode(mutual, forKey: "mutual")
				aCoder.encode(openForAllies, forKey: "open_for_allies")
				if let v = retracted {
					aCoder.encode(v, forKey: "retracted")
				}
				if let v = started {
					aCoder.encode(v, forKey: "started")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["aggressor"] = aggressor.json
				if let v = allies?.json {
					json["allies"] = v
				}
				json["declared"] = declared.json
				json["defender"] = defender.json
				if let v = finished?.json {
					json["finished"] = v
				}
				json["id"] = id.json
				json["mutual"] = mutual.json
				json["open_for_allies"] = openForAllies.json
				if let v = retracted?.json {
					json["retracted"] = v
				}
				if let v = started?.json {
					json["started"] = v
				}
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.aggressor.hashValue)
				self.allies?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: self.declared.hashValue)
				hashCombine(seed: &hash, value: self.defender.hashValue)
				hashCombine(seed: &hash, value: self.finished?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.id.hashValue)
				hashCombine(seed: &hash, value: self.mutual.hashValue)
				hashCombine(seed: &hash, value: self.openForAllies.hashValue)
				hashCombine(seed: &hash, value: self.retracted?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.started?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Wars.WarInformation, rhs: Wars.WarInformation) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Wars.WarInformation) {
				aggressor = Wars.WarInformation.GetWarsWarIDAggressor(other.aggressor)
				allies = other.allies?.flatMap { Wars.WarInformation.GetWarsWarIDAllies($0) }
				declared = other.declared
				defender = Wars.WarInformation.GetWarsWarIDDefender(other.defender)
				finished = other.finished
				id = other.id
				mutual = other.mutual
				openForAllies = other.openForAllies
				retracted = other.retracted
				started = other.started
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Wars.WarInformation(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? WarInformation)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIWarsGetWarsWarIDUnprocessableEntity) public class GetWarsWarIDUnprocessableEntity: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			public static func ==(lhs: Wars.GetWarsWarIDUnprocessableEntity, rhs: Wars.GetWarsWarIDUnprocessableEntity) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Wars.GetWarsWarIDUnprocessableEntity) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Wars.GetWarsWarIDUnprocessableEntity(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetWarsWarIDUnprocessableEntity)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIWarsGetWarsWarIDKillmailsUnprocessableEntity) public class GetWarsWarIDKillmailsUnprocessableEntity: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			public static func ==(lhs: Wars.GetWarsWarIDKillmailsUnprocessableEntity, rhs: Wars.GetWarsWarIDKillmailsUnprocessableEntity) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Wars.GetWarsWarIDKillmailsUnprocessableEntity) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Wars.GetWarsWarIDKillmailsUnprocessableEntity(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetWarsWarIDKillmailsUnprocessableEntity)?.hashValue == hashValue
			}
			
		}
		
		
	}
	
}
