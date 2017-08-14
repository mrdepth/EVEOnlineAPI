import Foundation
import Alamofire


public extension ESI {
	public var factionWarfare: FactionWarfare {
		return FactionWarfare(sessionManager: self)
	}
	
	class FactionWarfare {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		public func dataAboutWhichNPCFactionsAreAtWar(completionBlock:((Result<[FactionWarfare.GetFwWarsOk]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/fw/wars/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[FactionWarfare.GetFwWarsOk]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func anOverviewOfStatisticsAboutFactionsInvolvedInFactionWarfare(completionBlock:((Result<[FactionWarfare.GetFwStatsOk]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/fw/stats/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[FactionWarfare.GetFwStatsOk]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		public class GetFwStatsOk: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class GetFwStatsVictoryPoints: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var lastWeek: Int = Int()
				public var total: Int = Int()
				public var yesterday: Int = Int()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let lastWeek = dictionary["last_week"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.lastWeek = lastWeek
					guard let total = dictionary["total"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.total = total
					guard let yesterday = dictionary["yesterday"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.yesterday = yesterday
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					lastWeek = aDecoder.decodeInteger(forKey: "last_week")
					total = aDecoder.decodeInteger(forKey: "total")
					yesterday = aDecoder.decodeInteger(forKey: "yesterday")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(lastWeek, forKey: "last_week")
					aCoder.encode(total, forKey: "total")
					aCoder.encode(yesterday, forKey: "yesterday")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["last_week"] = lastWeek.json
					json["total"] = total.json
					json["yesterday"] = yesterday.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.lastWeek.hashValue)
					hashCombine(seed: &hash, value: self.total.hashValue)
					hashCombine(seed: &hash, value: self.yesterday.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: FactionWarfare.GetFwStatsOk.GetFwStatsVictoryPoints, rhs: FactionWarfare.GetFwStatsOk.GetFwStatsVictoryPoints) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: FactionWarfare.GetFwStatsOk.GetFwStatsVictoryPoints) {
					lastWeek = other.lastWeek
					total = other.total
					yesterday = other.yesterday
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return FactionWarfare.GetFwStatsOk.GetFwStatsVictoryPoints(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetFwStatsVictoryPoints)?.hashValue == hashValue
				}
				
			}
			
			public class GetFwStatsKills: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var lastWeek: Int = Int()
				public var total: Int = Int()
				public var yesterday: Int = Int()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let lastWeek = dictionary["last_week"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.lastWeek = lastWeek
					guard let total = dictionary["total"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.total = total
					guard let yesterday = dictionary["yesterday"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.yesterday = yesterday
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					lastWeek = aDecoder.decodeInteger(forKey: "last_week")
					total = aDecoder.decodeInteger(forKey: "total")
					yesterday = aDecoder.decodeInteger(forKey: "yesterday")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(lastWeek, forKey: "last_week")
					aCoder.encode(total, forKey: "total")
					aCoder.encode(yesterday, forKey: "yesterday")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["last_week"] = lastWeek.json
					json["total"] = total.json
					json["yesterday"] = yesterday.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.lastWeek.hashValue)
					hashCombine(seed: &hash, value: self.total.hashValue)
					hashCombine(seed: &hash, value: self.yesterday.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: FactionWarfare.GetFwStatsOk.GetFwStatsKills, rhs: FactionWarfare.GetFwStatsOk.GetFwStatsKills) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: FactionWarfare.GetFwStatsOk.GetFwStatsKills) {
					lastWeek = other.lastWeek
					total = other.total
					yesterday = other.yesterday
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return FactionWarfare.GetFwStatsOk.GetFwStatsKills(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetFwStatsKills)?.hashValue == hashValue
				}
				
			}
			
			public var factionID: Int = Int()
			public var kills: FactionWarfare.GetFwStatsOk.GetFwStatsKills = FactionWarfare.GetFwStatsOk.GetFwStatsKills()
			public var pilots: Int = Int()
			public var systemsControlled: Int = Int()
			public var victoryPoints: FactionWarfare.GetFwStatsOk.GetFwStatsVictoryPoints = FactionWarfare.GetFwStatsOk.GetFwStatsVictoryPoints()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let factionID = dictionary["faction_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.factionID = factionID
				kills = try FactionWarfare.GetFwStatsOk.GetFwStatsKills(json: dictionary["kills"] as? [String: Any] ?? [:])
				guard let pilots = dictionary["pilots"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.pilots = pilots
				guard let systemsControlled = dictionary["systems_controlled"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.systemsControlled = systemsControlled
				victoryPoints = try FactionWarfare.GetFwStatsOk.GetFwStatsVictoryPoints(json: dictionary["victory_points"] as? [String: Any] ?? [:])
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				factionID = aDecoder.decodeInteger(forKey: "faction_id")
				kills = aDecoder.decodeObject(of: FactionWarfare.GetFwStatsOk.GetFwStatsKills.self, forKey: "kills")  ?? FactionWarfare.GetFwStatsOk.GetFwStatsKills()
				pilots = aDecoder.decodeInteger(forKey: "pilots")
				systemsControlled = aDecoder.decodeInteger(forKey: "systems_controlled")
				victoryPoints = aDecoder.decodeObject(of: FactionWarfare.GetFwStatsOk.GetFwStatsVictoryPoints.self, forKey: "victory_points")  ?? FactionWarfare.GetFwStatsOk.GetFwStatsVictoryPoints()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(factionID, forKey: "faction_id")
				aCoder.encode(kills, forKey: "kills")
				aCoder.encode(pilots, forKey: "pilots")
				aCoder.encode(systemsControlled, forKey: "systems_controlled")
				aCoder.encode(victoryPoints, forKey: "victory_points")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["faction_id"] = factionID.json
				json["kills"] = kills.json
				json["pilots"] = pilots.json
				json["systems_controlled"] = systemsControlled.json
				json["victory_points"] = victoryPoints.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.factionID.hashValue)
				hashCombine(seed: &hash, value: self.kills.hashValue)
				hashCombine(seed: &hash, value: self.pilots.hashValue)
				hashCombine(seed: &hash, value: self.systemsControlled.hashValue)
				hashCombine(seed: &hash, value: self.victoryPoints.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: FactionWarfare.GetFwStatsOk, rhs: FactionWarfare.GetFwStatsOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: FactionWarfare.GetFwStatsOk) {
				factionID = other.factionID
				kills = FactionWarfare.GetFwStatsOk.GetFwStatsKills(other.kills)
				pilots = other.pilots
				systemsControlled = other.systemsControlled
				victoryPoints = FactionWarfare.GetFwStatsOk.GetFwStatsVictoryPoints(other.victoryPoints)
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return FactionWarfare.GetFwStatsOk(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetFwStatsOk)?.hashValue == hashValue
			}
			
		}
		
		
		public class GetFwWarsOk: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var againstID: Int = Int()
			public var factionID: Int = Int()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let againstID = dictionary["against_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.againstID = againstID
				guard let factionID = dictionary["faction_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.factionID = factionID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				againstID = aDecoder.decodeInteger(forKey: "against_id")
				factionID = aDecoder.decodeInteger(forKey: "faction_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(againstID, forKey: "against_id")
				aCoder.encode(factionID, forKey: "faction_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["against_id"] = againstID.json
				json["faction_id"] = factionID.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.againstID.hashValue)
				hashCombine(seed: &hash, value: self.factionID.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: FactionWarfare.GetFwWarsOk, rhs: FactionWarfare.GetFwWarsOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: FactionWarfare.GetFwWarsOk) {
				againstID = other.againstID
				factionID = other.factionID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return FactionWarfare.GetFwWarsOk(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetFwWarsOk)?.hashValue == hashValue
			}
			
		}
		
		
	}
	
}
