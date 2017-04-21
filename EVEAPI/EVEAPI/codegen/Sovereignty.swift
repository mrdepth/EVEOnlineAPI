import Foundation
import Alamofire


public extension ESI {
	public var sovereignty: Sovereignty {
		return Sovereignty(sessionManager: self)
	}
	
	class Sovereignty {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		public func listSovereigntyOfSystems(completionBlock:((Result<[Sovereignty.System]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/sovereignty/map/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Sovereignty.System]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func listSovereigntyCampaigns(completionBlock:((Result<[Sovereignty.Campaign]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/sovereignty/campaigns/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Sovereignty.Campaign]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func listSovereigntyStructures(completionBlock:((Result<[Sovereignty.Structure]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/sovereignty/structures/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Sovereignty.Structure]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		public class GetSovereigntyCampaignsInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Sovereignty.GetSovereigntyCampaignsInternalServerError, rhs: Sovereignty.GetSovereigntyCampaignsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetSovereigntyStructuresInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Sovereignty.GetSovereigntyStructuresInternalServerError, rhs: Sovereignty.GetSovereigntyStructuresInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class Campaign: NSObject, NSSecureCoding , JSONCoding {
			
			public class GetSovereigntyCampaignsParticipants: NSObject, NSSecureCoding , JSONCoding {
				
				
				public var allianceID: Int = Int()
				public var score: Float = Float()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let allianceID = dictionary["alliance_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.allianceID = allianceID
					guard let score = dictionary["score"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.score = score
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					allianceID = aDecoder.decodeInteger(forKey: "alliance_id")
					score = aDecoder.decodeFloat(forKey: "score")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(allianceID, forKey: "alliance_id")
					aCoder.encode(score, forKey: "score")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["alliance_id"] = allianceID.json
					json["score"] = score.json
					return json
				}
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: allianceID.hashValue)
					hashCombine(seed: &hash, value: score.hashValue)
					return hash
				}
				
				public static func ==(lhs: Sovereignty.Campaign.GetSovereigntyCampaignsParticipants, rhs: Sovereignty.Campaign.GetSovereigntyCampaignsParticipants) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
			}
			
			public enum GetSovereigntyCampaignsEventType: String, JSONCoding, HTTPQueryable {
				case ihubDefense = "ihub_defense"
				case stationDefense = "station_defense"
				case stationFreeport = "station_freeport"
				case tcuDefense = "tcu_defense"
				
				public init() {
					self = .tcuDefense
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetSovereigntyCampaignsEventType(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var attackersScore: Float? = nil
			public var campaignID: Int = Int()
			public var constellationID: Int = Int()
			public var defenderID: Int? = nil
			public var defenderScore: Float? = nil
			public var eventType: Sovereignty.Campaign.GetSovereigntyCampaignsEventType = Sovereignty.Campaign.GetSovereigntyCampaignsEventType()
			public var participants: [Sovereignty.Campaign.GetSovereigntyCampaignsParticipants]? = nil
			public var solarSystemID: Int = Int()
			public var startTime: Date = Date()
			public var structureID: Int64 = Int64()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				attackersScore = dictionary["attackers_score"] as? Float
				guard let campaignID = dictionary["campaign_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.campaignID = campaignID
				guard let constellationID = dictionary["constellation_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.constellationID = constellationID
				defenderID = dictionary["defender_id"] as? Int
				defenderScore = dictionary["defender_score"] as? Float
				guard let eventType = Sovereignty.Campaign.GetSovereigntyCampaignsEventType(rawValue: dictionary["event_type"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.eventType = eventType
				participants = try (dictionary["participants"] as? [Any])?.map {try Sovereignty.Campaign.GetSovereigntyCampaignsParticipants(json: $0)}
				guard let solarSystemID = dictionary["solar_system_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.solarSystemID = solarSystemID
				guard let startTime = DateFormatter.esiDateFormatter.date(from: dictionary["start_time"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.startTime = startTime
				guard let structureID = dictionary["structure_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.structureID = structureID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				attackersScore = aDecoder.containsValue(forKey: "attackers_score") ? aDecoder.decodeFloat(forKey: "attackers_score") : nil
				campaignID = aDecoder.decodeInteger(forKey: "campaign_id")
				constellationID = aDecoder.decodeInteger(forKey: "constellation_id")
				defenderID = aDecoder.containsValue(forKey: "defender_id") ? aDecoder.decodeInteger(forKey: "defender_id") : nil
				defenderScore = aDecoder.containsValue(forKey: "defender_score") ? aDecoder.decodeFloat(forKey: "defender_score") : nil
				eventType = Sovereignty.Campaign.GetSovereigntyCampaignsEventType(rawValue: aDecoder.decodeObject(forKey: "event_type") as? String ?? "") ?? Sovereignty.Campaign.GetSovereigntyCampaignsEventType()
				participants = aDecoder.decodeObject(of: [Sovereignty.Campaign.GetSovereigntyCampaignsParticipants.self], forKey: "participants") as? [Sovereignty.Campaign.GetSovereigntyCampaignsParticipants]
				solarSystemID = aDecoder.decodeInteger(forKey: "solar_system_id")
				startTime = aDecoder.decodeObject(forKey: "start_time") as? Date ?? Date()
				structureID = aDecoder.decodeInt64(forKey: "structure_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = attackersScore {
					aCoder.encode(v, forKey: "attackers_score")
				}
				aCoder.encode(campaignID, forKey: "campaign_id")
				aCoder.encode(constellationID, forKey: "constellation_id")
				if let v = defenderID {
					aCoder.encode(v, forKey: "defender_id")
				}
				if let v = defenderScore {
					aCoder.encode(v, forKey: "defender_score")
				}
				aCoder.encode(eventType.rawValue, forKey: "event_type")
				if let v = participants {
					aCoder.encode(v, forKey: "participants")
				}
				aCoder.encode(solarSystemID, forKey: "solar_system_id")
				aCoder.encode(startTime, forKey: "start_time")
				aCoder.encode(structureID, forKey: "structure_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = attackersScore?.json {
					json["attackers_score"] = v
				}
				json["campaign_id"] = campaignID.json
				json["constellation_id"] = constellationID.json
				if let v = defenderID?.json {
					json["defender_id"] = v
				}
				if let v = defenderScore?.json {
					json["defender_score"] = v
				}
				json["event_type"] = eventType.json
				if let v = participants?.json {
					json["participants"] = v
				}
				json["solar_system_id"] = solarSystemID.json
				json["start_time"] = startTime.json
				json["structure_id"] = structureID.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: attackersScore?.hashValue ?? 0)
				hashCombine(seed: &hash, value: campaignID.hashValue)
				hashCombine(seed: &hash, value: constellationID.hashValue)
				hashCombine(seed: &hash, value: defenderID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: defenderScore?.hashValue ?? 0)
				hashCombine(seed: &hash, value: eventType.hashValue)
				participants?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: solarSystemID.hashValue)
				hashCombine(seed: &hash, value: startTime.hashValue)
				hashCombine(seed: &hash, value: structureID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Sovereignty.Campaign, rhs: Sovereignty.Campaign) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class System: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var allianceID: Int? = nil
			public var corporationID: Int? = nil
			public var factionID: Int? = nil
			public var systemID: Int = Int()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				allianceID = dictionary["alliance_id"] as? Int
				corporationID = dictionary["corporation_id"] as? Int
				factionID = dictionary["faction_id"] as? Int
				guard let systemID = dictionary["system_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.systemID = systemID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				allianceID = aDecoder.containsValue(forKey: "alliance_id") ? aDecoder.decodeInteger(forKey: "alliance_id") : nil
				corporationID = aDecoder.containsValue(forKey: "corporation_id") ? aDecoder.decodeInteger(forKey: "corporation_id") : nil
				factionID = aDecoder.containsValue(forKey: "faction_id") ? aDecoder.decodeInteger(forKey: "faction_id") : nil
				systemID = aDecoder.decodeInteger(forKey: "system_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = allianceID {
					aCoder.encode(v, forKey: "alliance_id")
				}
				if let v = corporationID {
					aCoder.encode(v, forKey: "corporation_id")
				}
				if let v = factionID {
					aCoder.encode(v, forKey: "faction_id")
				}
				aCoder.encode(systemID, forKey: "system_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = allianceID?.json {
					json["alliance_id"] = v
				}
				if let v = corporationID?.json {
					json["corporation_id"] = v
				}
				if let v = factionID?.json {
					json["faction_id"] = v
				}
				json["system_id"] = systemID.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: allianceID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: corporationID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: factionID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: systemID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Sovereignty.System, rhs: Sovereignty.System) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class Structure: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var allianceID: Int = Int()
			public var solarSystemID: Int = Int()
			public var structureID: Int64 = Int64()
			public var structureTypeID: Int = Int()
			public var vulnerabilityOccupancyLevel: Float? = nil
			public var vulnerableEndTime: Date? = nil
			public var vulnerableStartTime: Date? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let allianceID = dictionary["alliance_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.allianceID = allianceID
				guard let solarSystemID = dictionary["solar_system_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.solarSystemID = solarSystemID
				guard let structureID = dictionary["structure_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.structureID = structureID
				guard let structureTypeID = dictionary["structure_type_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.structureTypeID = structureTypeID
				vulnerabilityOccupancyLevel = dictionary["vulnerability_occupancy_level"] as? Float
				vulnerableEndTime = DateFormatter.esiDateFormatter.date(from: dictionary["vulnerable_end_time"] as? String ?? "")
				vulnerableStartTime = DateFormatter.esiDateFormatter.date(from: dictionary["vulnerable_start_time"] as? String ?? "")
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				allianceID = aDecoder.decodeInteger(forKey: "alliance_id")
				solarSystemID = aDecoder.decodeInteger(forKey: "solar_system_id")
				structureID = aDecoder.decodeInt64(forKey: "structure_id")
				structureTypeID = aDecoder.decodeInteger(forKey: "structure_type_id")
				vulnerabilityOccupancyLevel = aDecoder.containsValue(forKey: "vulnerability_occupancy_level") ? aDecoder.decodeFloat(forKey: "vulnerability_occupancy_level") : nil
				vulnerableEndTime = aDecoder.decodeObject(forKey: "vulnerable_end_time") as? Date
				vulnerableStartTime = aDecoder.decodeObject(forKey: "vulnerable_start_time") as? Date
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(allianceID, forKey: "alliance_id")
				aCoder.encode(solarSystemID, forKey: "solar_system_id")
				aCoder.encode(structureID, forKey: "structure_id")
				aCoder.encode(structureTypeID, forKey: "structure_type_id")
				if let v = vulnerabilityOccupancyLevel {
					aCoder.encode(v, forKey: "vulnerability_occupancy_level")
				}
				if let v = vulnerableEndTime {
					aCoder.encode(v, forKey: "vulnerable_end_time")
				}
				if let v = vulnerableStartTime {
					aCoder.encode(v, forKey: "vulnerable_start_time")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["alliance_id"] = allianceID.json
				json["solar_system_id"] = solarSystemID.json
				json["structure_id"] = structureID.json
				json["structure_type_id"] = structureTypeID.json
				if let v = vulnerabilityOccupancyLevel?.json {
					json["vulnerability_occupancy_level"] = v
				}
				if let v = vulnerableEndTime?.json {
					json["vulnerable_end_time"] = v
				}
				if let v = vulnerableStartTime?.json {
					json["vulnerable_start_time"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: allianceID.hashValue)
				hashCombine(seed: &hash, value: solarSystemID.hashValue)
				hashCombine(seed: &hash, value: structureID.hashValue)
				hashCombine(seed: &hash, value: structureTypeID.hashValue)
				hashCombine(seed: &hash, value: vulnerabilityOccupancyLevel?.hashValue ?? 0)
				hashCombine(seed: &hash, value: vulnerableEndTime?.hashValue ?? 0)
				hashCombine(seed: &hash, value: vulnerableStartTime?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Sovereignty.Structure, rhs: Sovereignty.Structure) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetSovereigntyMapInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Sovereignty.GetSovereigntyMapInternalServerError, rhs: Sovereignty.GetSovereigntyMapInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
	}
	
}
