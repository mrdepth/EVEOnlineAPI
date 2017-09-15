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
		
		public func ownershipOfFactionWarfareSystems(completionBlock:((Result<[FactionWarfare.System]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/fw/systems/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[FactionWarfare.System]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func listOfTheTopPilotsInFactionWarfare(completionBlock:((Result<FactionWarfare.Characters>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/fw/leaderboards/characters/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<FactionWarfare.Characters>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func listOfTheTopCorporationsInFactionWarfare(completionBlock:((Result<FactionWarfare.Corporations>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/fw/leaderboards/corporations/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<FactionWarfare.Corporations>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func dataAboutWhichNPCFactionsAreAtWar(completionBlock:((Result<[FactionWarfare.FactionWar]>) -> Void)?) {
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
			}.validateESI().responseESI { (response: DataResponse<[FactionWarfare.FactionWar]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func anOverviewOfStatisticsAboutFactionsInvolvedInFactionWarfare(completionBlock:((Result<[FactionWarfare.FactionStats]>) -> Void)?) {
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
			}.validateESI().responseESI { (response: DataResponse<[FactionWarfare.FactionStats]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func listOfTheTopFactionsInFactionWarfare(completionBlock:((Result<FactionWarfare.Leaderboards>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/fw/leaderboards/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<FactionWarfare.Leaderboards>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		@objc(ESIFactionWarfareCharacters) public class Characters: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			@objc(ESIFactionWarfareCharactersGetFwLeaderboardsCharactersYesterday) public class GetFwLeaderboardsCharactersYesterday: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var amount: Int? = nil
				public var characterID: Int? = nil
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					amount = dictionary["amount"] as? Int
					characterID = dictionary["character_id"] as? Int
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init?(coder aDecoder: NSCoder) {
					amount = aDecoder.containsValue(forKey: "amount") ? aDecoder.decodeInteger(forKey: "amount") : nil
					characterID = aDecoder.containsValue(forKey: "character_id") ? aDecoder.decodeInteger(forKey: "character_id") : nil
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					if let v = amount {
						aCoder.encode(v, forKey: "amount")
					}
					if let v = characterID {
						aCoder.encode(v, forKey: "character_id")
					}
				}
				
				public var json: Any {
					var json = [String: Any]()
					if let v = amount?.json {
						json["amount"] = v
					}
					if let v = characterID?.json {
						json["character_id"] = v
					}
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.amount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.characterID?.hashValue ?? 0)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: FactionWarfare.Characters.GetFwLeaderboardsCharactersYesterday, rhs: FactionWarfare.Characters.GetFwLeaderboardsCharactersYesterday) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: FactionWarfare.Characters.GetFwLeaderboardsCharactersYesterday) {
					amount = other.amount
					characterID = other.characterID
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return FactionWarfare.Characters.GetFwLeaderboardsCharactersYesterday(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetFwLeaderboardsCharactersYesterday)?.hashValue == hashValue
				}
				
			}
			
			@objc(ESIFactionWarfareCharactersGetFwLeaderboardsCharactersVictoryPoints) public class GetFwLeaderboardsCharactersVictoryPoints: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var activeTotal: [FactionWarfare.Characters.GetFwLeaderboardsCharactersActiveTotal] = []
				public var lastWeek: [FactionWarfare.Characters.GetFwLeaderboardsCharactersLastWeek] = []
				public var yesterday: [FactionWarfare.Characters.GetFwLeaderboardsCharactersYesterday] = []
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					activeTotal = try (dictionary["active_total"] as? [Any])?.map {try FactionWarfare.Characters.GetFwLeaderboardsCharactersActiveTotal(json: $0)} ?? []
					lastWeek = try (dictionary["last_week"] as? [Any])?.map {try FactionWarfare.Characters.GetFwLeaderboardsCharactersLastWeek(json: $0)} ?? []
					yesterday = try (dictionary["yesterday"] as? [Any])?.map {try FactionWarfare.Characters.GetFwLeaderboardsCharactersYesterday(json: $0)} ?? []
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init?(coder aDecoder: NSCoder) {
					activeTotal = aDecoder.decodeObject(of: [FactionWarfare.Characters.GetFwLeaderboardsCharactersActiveTotal.self], forKey: "active_total") as? [FactionWarfare.Characters.GetFwLeaderboardsCharactersActiveTotal] ?? []
					lastWeek = aDecoder.decodeObject(of: [FactionWarfare.Characters.GetFwLeaderboardsCharactersLastWeek.self], forKey: "last_week") as? [FactionWarfare.Characters.GetFwLeaderboardsCharactersLastWeek] ?? []
					yesterday = aDecoder.decodeObject(of: [FactionWarfare.Characters.GetFwLeaderboardsCharactersYesterday.self], forKey: "yesterday") as? [FactionWarfare.Characters.GetFwLeaderboardsCharactersYesterday] ?? []
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(activeTotal, forKey: "active_total")
					aCoder.encode(lastWeek, forKey: "last_week")
					aCoder.encode(yesterday, forKey: "yesterday")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["active_total"] = activeTotal.json
					json["last_week"] = lastWeek.json
					json["yesterday"] = yesterday.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					self.activeTotal.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					self.lastWeek.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					self.yesterday.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: FactionWarfare.Characters.GetFwLeaderboardsCharactersVictoryPoints, rhs: FactionWarfare.Characters.GetFwLeaderboardsCharactersVictoryPoints) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: FactionWarfare.Characters.GetFwLeaderboardsCharactersVictoryPoints) {
					activeTotal = other.activeTotal.flatMap { FactionWarfare.Characters.GetFwLeaderboardsCharactersActiveTotal($0) }
					lastWeek = other.lastWeek.flatMap { FactionWarfare.Characters.GetFwLeaderboardsCharactersLastWeek($0) }
					yesterday = other.yesterday.flatMap { FactionWarfare.Characters.GetFwLeaderboardsCharactersYesterday($0) }
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return FactionWarfare.Characters.GetFwLeaderboardsCharactersVictoryPoints(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetFwLeaderboardsCharactersVictoryPoints)?.hashValue == hashValue
				}
				
			}
			
			@objc(ESIFactionWarfareCharactersGetFwLeaderboardsCharactersLastWeek) public class GetFwLeaderboardsCharactersLastWeek: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var amount: Int? = nil
				public var characterID: Int? = nil
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					amount = dictionary["amount"] as? Int
					characterID = dictionary["character_id"] as? Int
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init?(coder aDecoder: NSCoder) {
					amount = aDecoder.containsValue(forKey: "amount") ? aDecoder.decodeInteger(forKey: "amount") : nil
					characterID = aDecoder.containsValue(forKey: "character_id") ? aDecoder.decodeInteger(forKey: "character_id") : nil
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					if let v = amount {
						aCoder.encode(v, forKey: "amount")
					}
					if let v = characterID {
						aCoder.encode(v, forKey: "character_id")
					}
				}
				
				public var json: Any {
					var json = [String: Any]()
					if let v = amount?.json {
						json["amount"] = v
					}
					if let v = characterID?.json {
						json["character_id"] = v
					}
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.amount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.characterID?.hashValue ?? 0)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: FactionWarfare.Characters.GetFwLeaderboardsCharactersLastWeek, rhs: FactionWarfare.Characters.GetFwLeaderboardsCharactersLastWeek) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: FactionWarfare.Characters.GetFwLeaderboardsCharactersLastWeek) {
					amount = other.amount
					characterID = other.characterID
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return FactionWarfare.Characters.GetFwLeaderboardsCharactersLastWeek(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetFwLeaderboardsCharactersLastWeek)?.hashValue == hashValue
				}
				
			}
			
			@objc(ESIFactionWarfareCharactersGetFwLeaderboardsCharactersKills) public class GetFwLeaderboardsCharactersKills: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var activeTotal: [FactionWarfare.Characters.GetFwLeaderboardsCharactersActiveTotal] = []
				public var lastWeek: [FactionWarfare.Characters.GetFwLeaderboardsCharactersLastWeek] = []
				public var yesterday: [FactionWarfare.Characters.GetFwLeaderboardsCharactersYesterday] = []
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					activeTotal = try (dictionary["active_total"] as? [Any])?.map {try FactionWarfare.Characters.GetFwLeaderboardsCharactersActiveTotal(json: $0)} ?? []
					lastWeek = try (dictionary["last_week"] as? [Any])?.map {try FactionWarfare.Characters.GetFwLeaderboardsCharactersLastWeek(json: $0)} ?? []
					yesterday = try (dictionary["yesterday"] as? [Any])?.map {try FactionWarfare.Characters.GetFwLeaderboardsCharactersYesterday(json: $0)} ?? []
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init?(coder aDecoder: NSCoder) {
					activeTotal = aDecoder.decodeObject(of: [FactionWarfare.Characters.GetFwLeaderboardsCharactersActiveTotal.self], forKey: "active_total") as? [FactionWarfare.Characters.GetFwLeaderboardsCharactersActiveTotal] ?? []
					lastWeek = aDecoder.decodeObject(of: [FactionWarfare.Characters.GetFwLeaderboardsCharactersLastWeek.self], forKey: "last_week") as? [FactionWarfare.Characters.GetFwLeaderboardsCharactersLastWeek] ?? []
					yesterday = aDecoder.decodeObject(of: [FactionWarfare.Characters.GetFwLeaderboardsCharactersYesterday.self], forKey: "yesterday") as? [FactionWarfare.Characters.GetFwLeaderboardsCharactersYesterday] ?? []
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(activeTotal, forKey: "active_total")
					aCoder.encode(lastWeek, forKey: "last_week")
					aCoder.encode(yesterday, forKey: "yesterday")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["active_total"] = activeTotal.json
					json["last_week"] = lastWeek.json
					json["yesterday"] = yesterday.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					self.activeTotal.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					self.lastWeek.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					self.yesterday.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: FactionWarfare.Characters.GetFwLeaderboardsCharactersKills, rhs: FactionWarfare.Characters.GetFwLeaderboardsCharactersKills) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: FactionWarfare.Characters.GetFwLeaderboardsCharactersKills) {
					activeTotal = other.activeTotal.flatMap { FactionWarfare.Characters.GetFwLeaderboardsCharactersActiveTotal($0) }
					lastWeek = other.lastWeek.flatMap { FactionWarfare.Characters.GetFwLeaderboardsCharactersLastWeek($0) }
					yesterday = other.yesterday.flatMap { FactionWarfare.Characters.GetFwLeaderboardsCharactersYesterday($0) }
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return FactionWarfare.Characters.GetFwLeaderboardsCharactersKills(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetFwLeaderboardsCharactersKills)?.hashValue == hashValue
				}
				
			}
			
			@objc(ESIFactionWarfareCharactersGetFwLeaderboardsCharactersActiveTotal) public class GetFwLeaderboardsCharactersActiveTotal: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var amount: Int? = nil
				public var characterID: Int? = nil
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					amount = dictionary["amount"] as? Int
					characterID = dictionary["character_id"] as? Int
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init?(coder aDecoder: NSCoder) {
					amount = aDecoder.containsValue(forKey: "amount") ? aDecoder.decodeInteger(forKey: "amount") : nil
					characterID = aDecoder.containsValue(forKey: "character_id") ? aDecoder.decodeInteger(forKey: "character_id") : nil
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					if let v = amount {
						aCoder.encode(v, forKey: "amount")
					}
					if let v = characterID {
						aCoder.encode(v, forKey: "character_id")
					}
				}
				
				public var json: Any {
					var json = [String: Any]()
					if let v = amount?.json {
						json["amount"] = v
					}
					if let v = characterID?.json {
						json["character_id"] = v
					}
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.amount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.characterID?.hashValue ?? 0)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: FactionWarfare.Characters.GetFwLeaderboardsCharactersActiveTotal, rhs: FactionWarfare.Characters.GetFwLeaderboardsCharactersActiveTotal) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: FactionWarfare.Characters.GetFwLeaderboardsCharactersActiveTotal) {
					amount = other.amount
					characterID = other.characterID
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return FactionWarfare.Characters.GetFwLeaderboardsCharactersActiveTotal(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetFwLeaderboardsCharactersActiveTotal)?.hashValue == hashValue
				}
				
			}
			
			public var kills: FactionWarfare.Characters.GetFwLeaderboardsCharactersKills = FactionWarfare.Characters.GetFwLeaderboardsCharactersKills()
			public var victoryPoints: FactionWarfare.Characters.GetFwLeaderboardsCharactersVictoryPoints = FactionWarfare.Characters.GetFwLeaderboardsCharactersVictoryPoints()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				kills = try FactionWarfare.Characters.GetFwLeaderboardsCharactersKills(json: dictionary["kills"] as? [String: Any] ?? [:])
				victoryPoints = try FactionWarfare.Characters.GetFwLeaderboardsCharactersVictoryPoints(json: dictionary["victory_points"] as? [String: Any] ?? [:])
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				kills = aDecoder.decodeObject(of: FactionWarfare.Characters.GetFwLeaderboardsCharactersKills.self, forKey: "kills")  ?? FactionWarfare.Characters.GetFwLeaderboardsCharactersKills()
				victoryPoints = aDecoder.decodeObject(of: FactionWarfare.Characters.GetFwLeaderboardsCharactersVictoryPoints.self, forKey: "victory_points")  ?? FactionWarfare.Characters.GetFwLeaderboardsCharactersVictoryPoints()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(kills, forKey: "kills")
				aCoder.encode(victoryPoints, forKey: "victory_points")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["kills"] = kills.json
				json["victory_points"] = victoryPoints.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.kills.hashValue)
				hashCombine(seed: &hash, value: self.victoryPoints.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: FactionWarfare.Characters, rhs: FactionWarfare.Characters) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: FactionWarfare.Characters) {
				kills = FactionWarfare.Characters.GetFwLeaderboardsCharactersKills(other.kills)
				victoryPoints = FactionWarfare.Characters.GetFwLeaderboardsCharactersVictoryPoints(other.victoryPoints)
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return FactionWarfare.Characters(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Characters)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIFactionWarfareFactionStats) public class FactionStats: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			@objc(ESIFactionWarfareFactionStatsGetFwStatsVictoryPoints) public class GetFwStatsVictoryPoints: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var lastWeek: Int = Int()
				public var total: Int = Int()
				public var yesterday: Int = Int()
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let lastWeek = dictionary["last_week"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.lastWeek = lastWeek
					guard let total = dictionary["total"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.total = total
					guard let yesterday = dictionary["yesterday"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.yesterday = yesterday
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
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
				
				public static func ==(lhs: FactionWarfare.FactionStats.GetFwStatsVictoryPoints, rhs: FactionWarfare.FactionStats.GetFwStatsVictoryPoints) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: FactionWarfare.FactionStats.GetFwStatsVictoryPoints) {
					lastWeek = other.lastWeek
					total = other.total
					yesterday = other.yesterday
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return FactionWarfare.FactionStats.GetFwStatsVictoryPoints(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetFwStatsVictoryPoints)?.hashValue == hashValue
				}
				
			}
			
			@objc(ESIFactionWarfareFactionStatsGetFwStatsKills) public class GetFwStatsKills: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var lastWeek: Int = Int()
				public var total: Int = Int()
				public var yesterday: Int = Int()
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let lastWeek = dictionary["last_week"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.lastWeek = lastWeek
					guard let total = dictionary["total"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.total = total
					guard let yesterday = dictionary["yesterday"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.yesterday = yesterday
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
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
				
				public static func ==(lhs: FactionWarfare.FactionStats.GetFwStatsKills, rhs: FactionWarfare.FactionStats.GetFwStatsKills) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: FactionWarfare.FactionStats.GetFwStatsKills) {
					lastWeek = other.lastWeek
					total = other.total
					yesterday = other.yesterday
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return FactionWarfare.FactionStats.GetFwStatsKills(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetFwStatsKills)?.hashValue == hashValue
				}
				
			}
			
			public var factionID: Int = Int()
			public var kills: FactionWarfare.FactionStats.GetFwStatsKills = FactionWarfare.FactionStats.GetFwStatsKills()
			public var pilots: Int = Int()
			public var systemsControlled: Int = Int()
			public var victoryPoints: FactionWarfare.FactionStats.GetFwStatsVictoryPoints = FactionWarfare.FactionStats.GetFwStatsVictoryPoints()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let factionID = dictionary["faction_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.factionID = factionID
				kills = try FactionWarfare.FactionStats.GetFwStatsKills(json: dictionary["kills"] as? [String: Any] ?? [:])
				guard let pilots = dictionary["pilots"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.pilots = pilots
				guard let systemsControlled = dictionary["systems_controlled"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.systemsControlled = systemsControlled
				victoryPoints = try FactionWarfare.FactionStats.GetFwStatsVictoryPoints(json: dictionary["victory_points"] as? [String: Any] ?? [:])
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				factionID = aDecoder.decodeInteger(forKey: "faction_id")
				kills = aDecoder.decodeObject(of: FactionWarfare.FactionStats.GetFwStatsKills.self, forKey: "kills")  ?? FactionWarfare.FactionStats.GetFwStatsKills()
				pilots = aDecoder.decodeInteger(forKey: "pilots")
				systemsControlled = aDecoder.decodeInteger(forKey: "systems_controlled")
				victoryPoints = aDecoder.decodeObject(of: FactionWarfare.FactionStats.GetFwStatsVictoryPoints.self, forKey: "victory_points")  ?? FactionWarfare.FactionStats.GetFwStatsVictoryPoints()
				
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
			
			public static func ==(lhs: FactionWarfare.FactionStats, rhs: FactionWarfare.FactionStats) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: FactionWarfare.FactionStats) {
				factionID = other.factionID
				kills = FactionWarfare.FactionStats.GetFwStatsKills(other.kills)
				pilots = other.pilots
				systemsControlled = other.systemsControlled
				victoryPoints = FactionWarfare.FactionStats.GetFwStatsVictoryPoints(other.victoryPoints)
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return FactionWarfare.FactionStats(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? FactionStats)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIFactionWarfareCorporations) public class Corporations: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			@objc(ESIFactionWarfareCorporationsGetFwLeaderboardsCorporationsActiveTotal) public class GetFwLeaderboardsCorporationsActiveTotal: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var amount: Int? = nil
				public var corporationID: Int? = nil
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					amount = dictionary["amount"] as? Int
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
					amount = aDecoder.containsValue(forKey: "amount") ? aDecoder.decodeInteger(forKey: "amount") : nil
					corporationID = aDecoder.containsValue(forKey: "corporation_id") ? aDecoder.decodeInteger(forKey: "corporation_id") : nil
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					if let v = amount {
						aCoder.encode(v, forKey: "amount")
					}
					if let v = corporationID {
						aCoder.encode(v, forKey: "corporation_id")
					}
				}
				
				public var json: Any {
					var json = [String: Any]()
					if let v = amount?.json {
						json["amount"] = v
					}
					if let v = corporationID?.json {
						json["corporation_id"] = v
					}
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.amount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.corporationID?.hashValue ?? 0)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsActiveTotal, rhs: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsActiveTotal) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsActiveTotal) {
					amount = other.amount
					corporationID = other.corporationID
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return FactionWarfare.Corporations.GetFwLeaderboardsCorporationsActiveTotal(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetFwLeaderboardsCorporationsActiveTotal)?.hashValue == hashValue
				}
				
			}
			
			@objc(ESIFactionWarfareCorporationsGetFwLeaderboardsCorporationsKills) public class GetFwLeaderboardsCorporationsKills: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var activeTotal: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsActiveTotal] = []
				public var lastWeek: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsLastWeek] = []
				public var yesterday: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsYesterday] = []
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					activeTotal = try (dictionary["active_total"] as? [Any])?.map {try FactionWarfare.Corporations.GetFwLeaderboardsCorporationsActiveTotal(json: $0)} ?? []
					lastWeek = try (dictionary["last_week"] as? [Any])?.map {try FactionWarfare.Corporations.GetFwLeaderboardsCorporationsLastWeek(json: $0)} ?? []
					yesterday = try (dictionary["yesterday"] as? [Any])?.map {try FactionWarfare.Corporations.GetFwLeaderboardsCorporationsYesterday(json: $0)} ?? []
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init?(coder aDecoder: NSCoder) {
					activeTotal = aDecoder.decodeObject(of: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsActiveTotal.self], forKey: "active_total") as? [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsActiveTotal] ?? []
					lastWeek = aDecoder.decodeObject(of: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsLastWeek.self], forKey: "last_week") as? [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsLastWeek] ?? []
					yesterday = aDecoder.decodeObject(of: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsYesterday.self], forKey: "yesterday") as? [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsYesterday] ?? []
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(activeTotal, forKey: "active_total")
					aCoder.encode(lastWeek, forKey: "last_week")
					aCoder.encode(yesterday, forKey: "yesterday")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["active_total"] = activeTotal.json
					json["last_week"] = lastWeek.json
					json["yesterday"] = yesterday.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					self.activeTotal.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					self.lastWeek.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					self.yesterday.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsKills, rhs: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsKills) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsKills) {
					activeTotal = other.activeTotal.flatMap { FactionWarfare.Corporations.GetFwLeaderboardsCorporationsActiveTotal($0) }
					lastWeek = other.lastWeek.flatMap { FactionWarfare.Corporations.GetFwLeaderboardsCorporationsLastWeek($0) }
					yesterday = other.yesterday.flatMap { FactionWarfare.Corporations.GetFwLeaderboardsCorporationsYesterday($0) }
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return FactionWarfare.Corporations.GetFwLeaderboardsCorporationsKills(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetFwLeaderboardsCorporationsKills)?.hashValue == hashValue
				}
				
			}
			
			@objc(ESIFactionWarfareCorporationsGetFwLeaderboardsCorporationsYesterday) public class GetFwLeaderboardsCorporationsYesterday: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var amount: Int? = nil
				public var corporationID: Int? = nil
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					amount = dictionary["amount"] as? Int
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
					amount = aDecoder.containsValue(forKey: "amount") ? aDecoder.decodeInteger(forKey: "amount") : nil
					corporationID = aDecoder.containsValue(forKey: "corporation_id") ? aDecoder.decodeInteger(forKey: "corporation_id") : nil
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					if let v = amount {
						aCoder.encode(v, forKey: "amount")
					}
					if let v = corporationID {
						aCoder.encode(v, forKey: "corporation_id")
					}
				}
				
				public var json: Any {
					var json = [String: Any]()
					if let v = amount?.json {
						json["amount"] = v
					}
					if let v = corporationID?.json {
						json["corporation_id"] = v
					}
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.amount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.corporationID?.hashValue ?? 0)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsYesterday, rhs: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsYesterday) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsYesterday) {
					amount = other.amount
					corporationID = other.corporationID
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return FactionWarfare.Corporations.GetFwLeaderboardsCorporationsYesterday(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetFwLeaderboardsCorporationsYesterday)?.hashValue == hashValue
				}
				
			}
			
			@objc(ESIFactionWarfareCorporationsGetFwLeaderboardsCorporationsVictoryPoints) public class GetFwLeaderboardsCorporationsVictoryPoints: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var activeTotal: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsActiveTotal] = []
				public var lastWeek: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsLastWeek] = []
				public var yesterday: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsYesterday] = []
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					activeTotal = try (dictionary["active_total"] as? [Any])?.map {try FactionWarfare.Corporations.GetFwLeaderboardsCorporationsActiveTotal(json: $0)} ?? []
					lastWeek = try (dictionary["last_week"] as? [Any])?.map {try FactionWarfare.Corporations.GetFwLeaderboardsCorporationsLastWeek(json: $0)} ?? []
					yesterday = try (dictionary["yesterday"] as? [Any])?.map {try FactionWarfare.Corporations.GetFwLeaderboardsCorporationsYesterday(json: $0)} ?? []
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init?(coder aDecoder: NSCoder) {
					activeTotal = aDecoder.decodeObject(of: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsActiveTotal.self], forKey: "active_total") as? [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsActiveTotal] ?? []
					lastWeek = aDecoder.decodeObject(of: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsLastWeek.self], forKey: "last_week") as? [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsLastWeek] ?? []
					yesterday = aDecoder.decodeObject(of: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsYesterday.self], forKey: "yesterday") as? [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsYesterday] ?? []
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(activeTotal, forKey: "active_total")
					aCoder.encode(lastWeek, forKey: "last_week")
					aCoder.encode(yesterday, forKey: "yesterday")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["active_total"] = activeTotal.json
					json["last_week"] = lastWeek.json
					json["yesterday"] = yesterday.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					self.activeTotal.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					self.lastWeek.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					self.yesterday.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsVictoryPoints, rhs: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsVictoryPoints) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsVictoryPoints) {
					activeTotal = other.activeTotal.flatMap { FactionWarfare.Corporations.GetFwLeaderboardsCorporationsActiveTotal($0) }
					lastWeek = other.lastWeek.flatMap { FactionWarfare.Corporations.GetFwLeaderboardsCorporationsLastWeek($0) }
					yesterday = other.yesterday.flatMap { FactionWarfare.Corporations.GetFwLeaderboardsCorporationsYesterday($0) }
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return FactionWarfare.Corporations.GetFwLeaderboardsCorporationsVictoryPoints(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetFwLeaderboardsCorporationsVictoryPoints)?.hashValue == hashValue
				}
				
			}
			
			@objc(ESIFactionWarfareCorporationsGetFwLeaderboardsCorporationsLastWeek) public class GetFwLeaderboardsCorporationsLastWeek: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var amount: Int? = nil
				public var corporationID: Int? = nil
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					amount = dictionary["amount"] as? Int
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
					amount = aDecoder.containsValue(forKey: "amount") ? aDecoder.decodeInteger(forKey: "amount") : nil
					corporationID = aDecoder.containsValue(forKey: "corporation_id") ? aDecoder.decodeInteger(forKey: "corporation_id") : nil
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					if let v = amount {
						aCoder.encode(v, forKey: "amount")
					}
					if let v = corporationID {
						aCoder.encode(v, forKey: "corporation_id")
					}
				}
				
				public var json: Any {
					var json = [String: Any]()
					if let v = amount?.json {
						json["amount"] = v
					}
					if let v = corporationID?.json {
						json["corporation_id"] = v
					}
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.amount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.corporationID?.hashValue ?? 0)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsLastWeek, rhs: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsLastWeek) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsLastWeek) {
					amount = other.amount
					corporationID = other.corporationID
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return FactionWarfare.Corporations.GetFwLeaderboardsCorporationsLastWeek(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetFwLeaderboardsCorporationsLastWeek)?.hashValue == hashValue
				}
				
			}
			
			public var kills: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsKills = FactionWarfare.Corporations.GetFwLeaderboardsCorporationsKills()
			public var victoryPoints: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsVictoryPoints = FactionWarfare.Corporations.GetFwLeaderboardsCorporationsVictoryPoints()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				kills = try FactionWarfare.Corporations.GetFwLeaderboardsCorporationsKills(json: dictionary["kills"] as? [String: Any] ?? [:])
				victoryPoints = try FactionWarfare.Corporations.GetFwLeaderboardsCorporationsVictoryPoints(json: dictionary["victory_points"] as? [String: Any] ?? [:])
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				kills = aDecoder.decodeObject(of: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsKills.self, forKey: "kills")  ?? FactionWarfare.Corporations.GetFwLeaderboardsCorporationsKills()
				victoryPoints = aDecoder.decodeObject(of: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsVictoryPoints.self, forKey: "victory_points")  ?? FactionWarfare.Corporations.GetFwLeaderboardsCorporationsVictoryPoints()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(kills, forKey: "kills")
				aCoder.encode(victoryPoints, forKey: "victory_points")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["kills"] = kills.json
				json["victory_points"] = victoryPoints.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.kills.hashValue)
				hashCombine(seed: &hash, value: self.victoryPoints.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: FactionWarfare.Corporations, rhs: FactionWarfare.Corporations) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: FactionWarfare.Corporations) {
				kills = FactionWarfare.Corporations.GetFwLeaderboardsCorporationsKills(other.kills)
				victoryPoints = FactionWarfare.Corporations.GetFwLeaderboardsCorporationsVictoryPoints(other.victoryPoints)
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return FactionWarfare.Corporations(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Corporations)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIFactionWarfareSystem) public class System: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var contested: Bool = Bool()
			public var occupierFactionID: Int = Int()
			public var ownerFactionID: Int = Int()
			public var solarSystemID: Int = Int()
			public var victoryPoints: Int = Int()
			public var victoryPointsThreshold: Int = Int()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let contested = dictionary["contested"] as? Bool else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.contested = contested
				guard let occupierFactionID = dictionary["occupier_faction_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.occupierFactionID = occupierFactionID
				guard let ownerFactionID = dictionary["owner_faction_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.ownerFactionID = ownerFactionID
				guard let solarSystemID = dictionary["solar_system_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.solarSystemID = solarSystemID
				guard let victoryPoints = dictionary["victory_points"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.victoryPoints = victoryPoints
				guard let victoryPointsThreshold = dictionary["victory_points_threshold"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.victoryPointsThreshold = victoryPointsThreshold
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				contested = aDecoder.decodeBool(forKey: "contested")
				occupierFactionID = aDecoder.decodeInteger(forKey: "occupier_faction_id")
				ownerFactionID = aDecoder.decodeInteger(forKey: "owner_faction_id")
				solarSystemID = aDecoder.decodeInteger(forKey: "solar_system_id")
				victoryPoints = aDecoder.decodeInteger(forKey: "victory_points")
				victoryPointsThreshold = aDecoder.decodeInteger(forKey: "victory_points_threshold")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(contested, forKey: "contested")
				aCoder.encode(occupierFactionID, forKey: "occupier_faction_id")
				aCoder.encode(ownerFactionID, forKey: "owner_faction_id")
				aCoder.encode(solarSystemID, forKey: "solar_system_id")
				aCoder.encode(victoryPoints, forKey: "victory_points")
				aCoder.encode(victoryPointsThreshold, forKey: "victory_points_threshold")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["contested"] = contested.json
				json["occupier_faction_id"] = occupierFactionID.json
				json["owner_faction_id"] = ownerFactionID.json
				json["solar_system_id"] = solarSystemID.json
				json["victory_points"] = victoryPoints.json
				json["victory_points_threshold"] = victoryPointsThreshold.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.contested.hashValue)
				hashCombine(seed: &hash, value: self.occupierFactionID.hashValue)
				hashCombine(seed: &hash, value: self.ownerFactionID.hashValue)
				hashCombine(seed: &hash, value: self.solarSystemID.hashValue)
				hashCombine(seed: &hash, value: self.victoryPoints.hashValue)
				hashCombine(seed: &hash, value: self.victoryPointsThreshold.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: FactionWarfare.System, rhs: FactionWarfare.System) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: FactionWarfare.System) {
				contested = other.contested
				occupierFactionID = other.occupierFactionID
				ownerFactionID = other.ownerFactionID
				solarSystemID = other.solarSystemID
				victoryPoints = other.victoryPoints
				victoryPointsThreshold = other.victoryPointsThreshold
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return FactionWarfare.System(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? System)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIFactionWarfareFactionWar) public class FactionWar: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var againstID: Int = Int()
			public var factionID: Int = Int()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let againstID = dictionary["against_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.againstID = againstID
				guard let factionID = dictionary["faction_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.factionID = factionID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
			
			public static func ==(lhs: FactionWarfare.FactionWar, rhs: FactionWarfare.FactionWar) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: FactionWarfare.FactionWar) {
				againstID = other.againstID
				factionID = other.factionID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return FactionWarfare.FactionWar(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? FactionWar)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIFactionWarfareLeaderboards) public class Leaderboards: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			@objc(ESIFactionWarfareLeaderboardsGetFwLeaderboardsYesterday) public class GetFwLeaderboardsYesterday: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var amount: Int? = nil
				public var factionID: Int? = nil
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					amount = dictionary["amount"] as? Int
					factionID = dictionary["faction_id"] as? Int
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init?(coder aDecoder: NSCoder) {
					amount = aDecoder.containsValue(forKey: "amount") ? aDecoder.decodeInteger(forKey: "amount") : nil
					factionID = aDecoder.containsValue(forKey: "faction_id") ? aDecoder.decodeInteger(forKey: "faction_id") : nil
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					if let v = amount {
						aCoder.encode(v, forKey: "amount")
					}
					if let v = factionID {
						aCoder.encode(v, forKey: "faction_id")
					}
				}
				
				public var json: Any {
					var json = [String: Any]()
					if let v = amount?.json {
						json["amount"] = v
					}
					if let v = factionID?.json {
						json["faction_id"] = v
					}
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.amount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.factionID?.hashValue ?? 0)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: FactionWarfare.Leaderboards.GetFwLeaderboardsYesterday, rhs: FactionWarfare.Leaderboards.GetFwLeaderboardsYesterday) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: FactionWarfare.Leaderboards.GetFwLeaderboardsYesterday) {
					amount = other.amount
					factionID = other.factionID
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return FactionWarfare.Leaderboards.GetFwLeaderboardsYesterday(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetFwLeaderboardsYesterday)?.hashValue == hashValue
				}
				
			}
			
			@objc(ESIFactionWarfareLeaderboardsGetFwLeaderboardsVictoryPoints) public class GetFwLeaderboardsVictoryPoints: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var activeTotal: [FactionWarfare.Leaderboards.GetFwLeaderboardsActiveTotal] = []
				public var lastWeek: [FactionWarfare.Leaderboards.GetFwLeaderboardsLastWeek] = []
				public var yesterday: [FactionWarfare.Leaderboards.GetFwLeaderboardsYesterday] = []
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					activeTotal = try (dictionary["active_total"] as? [Any])?.map {try FactionWarfare.Leaderboards.GetFwLeaderboardsActiveTotal(json: $0)} ?? []
					lastWeek = try (dictionary["last_week"] as? [Any])?.map {try FactionWarfare.Leaderboards.GetFwLeaderboardsLastWeek(json: $0)} ?? []
					yesterday = try (dictionary["yesterday"] as? [Any])?.map {try FactionWarfare.Leaderboards.GetFwLeaderboardsYesterday(json: $0)} ?? []
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init?(coder aDecoder: NSCoder) {
					activeTotal = aDecoder.decodeObject(of: [FactionWarfare.Leaderboards.GetFwLeaderboardsActiveTotal.self], forKey: "active_total") as? [FactionWarfare.Leaderboards.GetFwLeaderboardsActiveTotal] ?? []
					lastWeek = aDecoder.decodeObject(of: [FactionWarfare.Leaderboards.GetFwLeaderboardsLastWeek.self], forKey: "last_week") as? [FactionWarfare.Leaderboards.GetFwLeaderboardsLastWeek] ?? []
					yesterday = aDecoder.decodeObject(of: [FactionWarfare.Leaderboards.GetFwLeaderboardsYesterday.self], forKey: "yesterday") as? [FactionWarfare.Leaderboards.GetFwLeaderboardsYesterday] ?? []
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(activeTotal, forKey: "active_total")
					aCoder.encode(lastWeek, forKey: "last_week")
					aCoder.encode(yesterday, forKey: "yesterday")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["active_total"] = activeTotal.json
					json["last_week"] = lastWeek.json
					json["yesterday"] = yesterday.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					self.activeTotal.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					self.lastWeek.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					self.yesterday.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: FactionWarfare.Leaderboards.GetFwLeaderboardsVictoryPoints, rhs: FactionWarfare.Leaderboards.GetFwLeaderboardsVictoryPoints) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: FactionWarfare.Leaderboards.GetFwLeaderboardsVictoryPoints) {
					activeTotal = other.activeTotal.flatMap { FactionWarfare.Leaderboards.GetFwLeaderboardsActiveTotal($0) }
					lastWeek = other.lastWeek.flatMap { FactionWarfare.Leaderboards.GetFwLeaderboardsLastWeek($0) }
					yesterday = other.yesterday.flatMap { FactionWarfare.Leaderboards.GetFwLeaderboardsYesterday($0) }
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return FactionWarfare.Leaderboards.GetFwLeaderboardsVictoryPoints(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetFwLeaderboardsVictoryPoints)?.hashValue == hashValue
				}
				
			}
			
			@objc(ESIFactionWarfareLeaderboardsGetFwLeaderboardsKills) public class GetFwLeaderboardsKills: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var activeTotal: [FactionWarfare.Leaderboards.GetFwLeaderboardsActiveTotal] = []
				public var lastWeek: [FactionWarfare.Leaderboards.GetFwLeaderboardsLastWeek] = []
				public var yesterday: [FactionWarfare.Leaderboards.GetFwLeaderboardsYesterday] = []
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					activeTotal = try (dictionary["active_total"] as? [Any])?.map {try FactionWarfare.Leaderboards.GetFwLeaderboardsActiveTotal(json: $0)} ?? []
					lastWeek = try (dictionary["last_week"] as? [Any])?.map {try FactionWarfare.Leaderboards.GetFwLeaderboardsLastWeek(json: $0)} ?? []
					yesterday = try (dictionary["yesterday"] as? [Any])?.map {try FactionWarfare.Leaderboards.GetFwLeaderboardsYesterday(json: $0)} ?? []
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init?(coder aDecoder: NSCoder) {
					activeTotal = aDecoder.decodeObject(of: [FactionWarfare.Leaderboards.GetFwLeaderboardsActiveTotal.self], forKey: "active_total") as? [FactionWarfare.Leaderboards.GetFwLeaderboardsActiveTotal] ?? []
					lastWeek = aDecoder.decodeObject(of: [FactionWarfare.Leaderboards.GetFwLeaderboardsLastWeek.self], forKey: "last_week") as? [FactionWarfare.Leaderboards.GetFwLeaderboardsLastWeek] ?? []
					yesterday = aDecoder.decodeObject(of: [FactionWarfare.Leaderboards.GetFwLeaderboardsYesterday.self], forKey: "yesterday") as? [FactionWarfare.Leaderboards.GetFwLeaderboardsYesterday] ?? []
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(activeTotal, forKey: "active_total")
					aCoder.encode(lastWeek, forKey: "last_week")
					aCoder.encode(yesterday, forKey: "yesterday")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["active_total"] = activeTotal.json
					json["last_week"] = lastWeek.json
					json["yesterday"] = yesterday.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					self.activeTotal.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					self.lastWeek.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					self.yesterday.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: FactionWarfare.Leaderboards.GetFwLeaderboardsKills, rhs: FactionWarfare.Leaderboards.GetFwLeaderboardsKills) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: FactionWarfare.Leaderboards.GetFwLeaderboardsKills) {
					activeTotal = other.activeTotal.flatMap { FactionWarfare.Leaderboards.GetFwLeaderboardsActiveTotal($0) }
					lastWeek = other.lastWeek.flatMap { FactionWarfare.Leaderboards.GetFwLeaderboardsLastWeek($0) }
					yesterday = other.yesterday.flatMap { FactionWarfare.Leaderboards.GetFwLeaderboardsYesterday($0) }
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return FactionWarfare.Leaderboards.GetFwLeaderboardsKills(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetFwLeaderboardsKills)?.hashValue == hashValue
				}
				
			}
			
			@objc(ESIFactionWarfareLeaderboardsGetFwLeaderboardsActiveTotal) public class GetFwLeaderboardsActiveTotal: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var amount: Int? = nil
				public var factionID: Int? = nil
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					amount = dictionary["amount"] as? Int
					factionID = dictionary["faction_id"] as? Int
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init?(coder aDecoder: NSCoder) {
					amount = aDecoder.containsValue(forKey: "amount") ? aDecoder.decodeInteger(forKey: "amount") : nil
					factionID = aDecoder.containsValue(forKey: "faction_id") ? aDecoder.decodeInteger(forKey: "faction_id") : nil
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					if let v = amount {
						aCoder.encode(v, forKey: "amount")
					}
					if let v = factionID {
						aCoder.encode(v, forKey: "faction_id")
					}
				}
				
				public var json: Any {
					var json = [String: Any]()
					if let v = amount?.json {
						json["amount"] = v
					}
					if let v = factionID?.json {
						json["faction_id"] = v
					}
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.amount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.factionID?.hashValue ?? 0)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: FactionWarfare.Leaderboards.GetFwLeaderboardsActiveTotal, rhs: FactionWarfare.Leaderboards.GetFwLeaderboardsActiveTotal) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: FactionWarfare.Leaderboards.GetFwLeaderboardsActiveTotal) {
					amount = other.amount
					factionID = other.factionID
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return FactionWarfare.Leaderboards.GetFwLeaderboardsActiveTotal(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetFwLeaderboardsActiveTotal)?.hashValue == hashValue
				}
				
			}
			
			@objc(ESIFactionWarfareLeaderboardsGetFwLeaderboardsLastWeek) public class GetFwLeaderboardsLastWeek: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var amount: Int? = nil
				public var factionID: Int? = nil
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					amount = dictionary["amount"] as? Int
					factionID = dictionary["faction_id"] as? Int
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init?(coder aDecoder: NSCoder) {
					amount = aDecoder.containsValue(forKey: "amount") ? aDecoder.decodeInteger(forKey: "amount") : nil
					factionID = aDecoder.containsValue(forKey: "faction_id") ? aDecoder.decodeInteger(forKey: "faction_id") : nil
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					if let v = amount {
						aCoder.encode(v, forKey: "amount")
					}
					if let v = factionID {
						aCoder.encode(v, forKey: "faction_id")
					}
				}
				
				public var json: Any {
					var json = [String: Any]()
					if let v = amount?.json {
						json["amount"] = v
					}
					if let v = factionID?.json {
						json["faction_id"] = v
					}
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.amount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.factionID?.hashValue ?? 0)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: FactionWarfare.Leaderboards.GetFwLeaderboardsLastWeek, rhs: FactionWarfare.Leaderboards.GetFwLeaderboardsLastWeek) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: FactionWarfare.Leaderboards.GetFwLeaderboardsLastWeek) {
					amount = other.amount
					factionID = other.factionID
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return FactionWarfare.Leaderboards.GetFwLeaderboardsLastWeek(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetFwLeaderboardsLastWeek)?.hashValue == hashValue
				}
				
			}
			
			public var kills: FactionWarfare.Leaderboards.GetFwLeaderboardsKills = FactionWarfare.Leaderboards.GetFwLeaderboardsKills()
			public var victoryPoints: FactionWarfare.Leaderboards.GetFwLeaderboardsVictoryPoints = FactionWarfare.Leaderboards.GetFwLeaderboardsVictoryPoints()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				kills = try FactionWarfare.Leaderboards.GetFwLeaderboardsKills(json: dictionary["kills"] as? [String: Any] ?? [:])
				victoryPoints = try FactionWarfare.Leaderboards.GetFwLeaderboardsVictoryPoints(json: dictionary["victory_points"] as? [String: Any] ?? [:])
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				kills = aDecoder.decodeObject(of: FactionWarfare.Leaderboards.GetFwLeaderboardsKills.self, forKey: "kills")  ?? FactionWarfare.Leaderboards.GetFwLeaderboardsKills()
				victoryPoints = aDecoder.decodeObject(of: FactionWarfare.Leaderboards.GetFwLeaderboardsVictoryPoints.self, forKey: "victory_points")  ?? FactionWarfare.Leaderboards.GetFwLeaderboardsVictoryPoints()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(kills, forKey: "kills")
				aCoder.encode(victoryPoints, forKey: "victory_points")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["kills"] = kills.json
				json["victory_points"] = victoryPoints.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.kills.hashValue)
				hashCombine(seed: &hash, value: self.victoryPoints.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: FactionWarfare.Leaderboards, rhs: FactionWarfare.Leaderboards) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: FactionWarfare.Leaderboards) {
				kills = FactionWarfare.Leaderboards.GetFwLeaderboardsKills(other.kills)
				victoryPoints = FactionWarfare.Leaderboards.GetFwLeaderboardsVictoryPoints(other.victoryPoints)
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return FactionWarfare.Leaderboards(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Leaderboards)?.hashValue == hashValue
			}
			
		}
		
		
	}
	
}
