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
			
			
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			if let v = maxWarID {
				parameters["max_war_id"] = v.json
			}
			
			let url = session!.baseURL + "latest/wars/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Int]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getWarInformation(warID: Int, completionBlock:((Result<Wars.WarInformation>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			
			
			let url = session!.baseURL + "latest/wars/\(warID)/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Wars.WarInformation>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func listKillsForWar(page: Int? = nil, warID: Int, completionBlock:((Result<[Wars.Kills]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			if let v = page {
				parameters["page"] = v.json
			}
			
			let url = session!.baseURL + "latest/wars/\(warID)/killmails/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Wars.Kills]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		public class Kills: NSObject, NSCoding , JSONCoding {
			
			
			public var killmailHash: String
			public var killmailID: Int
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let killmailHash = dictionary["killmail_hash"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.killmailHash = killmailHash
				guard let killmailID = dictionary["killmail_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.killmailID = killmailID
				
				super.init()
			}
			
			override public init() {
				killmailHash = String()
				killmailID = Int()
				
				super.init()
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: killmailHash.hashValue)
				hashCombine(seed: &hash, value: killmailID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Wars.Kills, rhs: Wars.Kills) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetWarsWarIDUnprocessableEntity: NSObject, NSCoding , JSONCoding {
			
			
			public var error: String?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				error = nil
				
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
			
			public static func ==(lhs: Wars.GetWarsWarIDUnprocessableEntity, rhs: Wars.GetWarsWarIDUnprocessableEntity) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetWarsWarIDKillmailsUnprocessableEntity: NSObject, NSCoding , JSONCoding {
			
			
			public var error: String?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				error = nil
				
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
			
			public static func ==(lhs: Wars.GetWarsWarIDKillmailsUnprocessableEntity, rhs: Wars.GetWarsWarIDKillmailsUnprocessableEntity) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetWarsWarIDKillmailsInternalServerError: NSObject, NSCoding , JSONCoding {
			
			
			public var error: String?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				error = nil
				
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
			
			public static func ==(lhs: Wars.GetWarsWarIDKillmailsInternalServerError, rhs: Wars.GetWarsWarIDKillmailsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class WarInformation: NSObject, NSCoding , JSONCoding {
			
			public class GetWarsWarIDAggressor: NSObject, NSCoding , JSONCoding {
				
				
				public var allianceID: Int?
				public var corporationID: Int?
				public var iskDestroyed: Float
				public var shipsKilled: Int
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					allianceID = dictionary["alliance_id"] as? Int
					corporationID = dictionary["corporation_id"] as? Int
					guard let iskDestroyed = dictionary["isk_destroyed"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.iskDestroyed = iskDestroyed
					guard let shipsKilled = dictionary["ships_killed"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.shipsKilled = shipsKilled
					
					super.init()
				}
				
				override public init() {
					allianceID = nil
					corporationID = nil
					iskDestroyed = Float()
					shipsKilled = Int()
					
					super.init()
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: allianceID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: corporationID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: iskDestroyed.hashValue)
					hashCombine(seed: &hash, value: shipsKilled.hashValue)
					return hash
				}
				
				public static func ==(lhs: Wars.WarInformation.GetWarsWarIDAggressor, rhs: Wars.WarInformation.GetWarsWarIDAggressor) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
			}
			
			public class GetWarsWarIDAllies: NSObject, NSCoding , JSONCoding {
				
				
				public var allianceID: Int?
				public var corporationID: Int?
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					allianceID = dictionary["alliance_id"] as? Int
					corporationID = dictionary["corporation_id"] as? Int
					
					super.init()
				}
				
				override public init() {
					allianceID = nil
					corporationID = nil
					
					super.init()
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: allianceID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: corporationID?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: Wars.WarInformation.GetWarsWarIDAllies, rhs: Wars.WarInformation.GetWarsWarIDAllies) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
			}
			
			public class GetWarsWarIDDefender: NSObject, NSCoding , JSONCoding {
				
				
				public var allianceID: Int?
				public var corporationID: Int?
				public var iskDestroyed: Float
				public var shipsKilled: Int
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					allianceID = dictionary["alliance_id"] as? Int
					corporationID = dictionary["corporation_id"] as? Int
					guard let iskDestroyed = dictionary["isk_destroyed"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.iskDestroyed = iskDestroyed
					guard let shipsKilled = dictionary["ships_killed"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.shipsKilled = shipsKilled
					
					super.init()
				}
				
				override public init() {
					allianceID = nil
					corporationID = nil
					iskDestroyed = Float()
					shipsKilled = Int()
					
					super.init()
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: allianceID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: corporationID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: iskDestroyed.hashValue)
					hashCombine(seed: &hash, value: shipsKilled.hashValue)
					return hash
				}
				
				public static func ==(lhs: Wars.WarInformation.GetWarsWarIDDefender, rhs: Wars.WarInformation.GetWarsWarIDDefender) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
			}
			
			public var aggressor: Wars.WarInformation.GetWarsWarIDAggressor
			public var allies: [Wars.WarInformation.GetWarsWarIDAllies]?
			public var declared: Date
			public var defender: Wars.WarInformation.GetWarsWarIDDefender
			public var finished: Date?
			public var id: Int
			public var mutual: Bool
			public var openForAllies: Bool
			public var retracted: Date?
			public var started: Date?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				aggressor = try Wars.WarInformation.GetWarsWarIDAggressor(json: dictionary["aggressor"] as? [String: Any] ?? [:])
				allies = try (dictionary["allies"] as? [Any])?.map {try Wars.WarInformation.GetWarsWarIDAllies(json: $0)}
				guard let declared = DateFormatter.esiDateFormatter.date(from: dictionary["declared"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.declared = declared
				defender = try Wars.WarInformation.GetWarsWarIDDefender(json: dictionary["defender"] as? [String: Any] ?? [:])
				finished = DateFormatter.esiDateFormatter.date(from: dictionary["finished"] as? String ?? "")
				guard let id = dictionary["id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.id = id
				guard let mutual = dictionary["mutual"] as? Bool else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.mutual = mutual
				guard let openForAllies = dictionary["open_for_allies"] as? Bool else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.openForAllies = openForAllies
				retracted = DateFormatter.esiDateFormatter.date(from: dictionary["retracted"] as? String ?? "")
				started = DateFormatter.esiDateFormatter.date(from: dictionary["started"] as? String ?? "")
				
				super.init()
			}
			
			override public init() {
				aggressor = Wars.WarInformation.GetWarsWarIDAggressor()
				allies = nil
				declared = Date()
				defender = Wars.WarInformation.GetWarsWarIDDefender()
				finished = nil
				id = Int()
				mutual = Bool()
				openForAllies = Bool()
				retracted = nil
				started = nil
				
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				aggressor = aDecoder.decodeObject(of: [Wars.WarInformation.GetWarsWarIDAggressor.self], forKey: "aggressor") as? Wars.WarInformation.GetWarsWarIDAggressor ?? Wars.WarInformation.GetWarsWarIDAggressor()
				allies = aDecoder.decodeObject(forKey: "allies") as? [Wars.WarInformation.GetWarsWarIDAllies]
				declared = aDecoder.decodeObject(forKey: "declared") as? Date ?? Date()
				defender = aDecoder.decodeObject(of: [Wars.WarInformation.GetWarsWarIDDefender.self], forKey: "defender") as? Wars.WarInformation.GetWarsWarIDDefender ?? Wars.WarInformation.GetWarsWarIDDefender()
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: aggressor.hashValue)
				allies?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: declared.hashValue)
				hashCombine(seed: &hash, value: defender.hashValue)
				hashCombine(seed: &hash, value: finished?.hashValue ?? 0)
				hashCombine(seed: &hash, value: id.hashValue)
				hashCombine(seed: &hash, value: mutual.hashValue)
				hashCombine(seed: &hash, value: openForAllies.hashValue)
				hashCombine(seed: &hash, value: retracted?.hashValue ?? 0)
				hashCombine(seed: &hash, value: started?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Wars.WarInformation, rhs: Wars.WarInformation) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetWarsWarIDInternalServerError: NSObject, NSCoding , JSONCoding {
			
			
			public var error: String?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				error = nil
				
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
			
			public static func ==(lhs: Wars.GetWarsWarIDInternalServerError, rhs: Wars.GetWarsWarIDInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetWarsInternalServerError: NSObject, NSCoding , JSONCoding {
			
			
			public var error: String?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				error = nil
				
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
			
			public static func ==(lhs: Wars.GetWarsInternalServerError, rhs: Wars.GetWarsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
	}
	
}
