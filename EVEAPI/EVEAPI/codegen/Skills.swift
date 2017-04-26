import Foundation
import Alamofire


public extension ESI {
	public var skills: Skills {
		return Skills(sessionManager: self)
	}
	
	class Skills {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		public func getCharacterSkills(characterID: Int, completionBlock:((Result<Skills.CharacterSkills>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-skills.read_skills.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/skills/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Skills.CharacterSkills>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getCharactersSkillQueue(characterID: Int, completionBlock:((Result<[Skills.SkillQueueItem]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-skills.read_skillqueue.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/skillqueue/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Skills.SkillQueueItem]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		public class SkillQueueItem: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var finishDate: Date? = nil
			public var finishedLevel: Int = Int()
			public var levelEndSP: Int? = nil
			public var levelStartSP: Int? = nil
			public var queuePosition: Int = Int()
			public var skillID: Int = Int()
			public var startDate: Date? = nil
			public var trainingStartSP: Int? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				finishDate = DateFormatter.esiDateFormatter.date(from: dictionary["finish_date"] as? String ?? "")
				guard let finishedLevel = dictionary["finished_level"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.finishedLevel = finishedLevel
				levelEndSP = dictionary["level_end_sp"] as? Int
				levelStartSP = dictionary["level_start_sp"] as? Int
				guard let queuePosition = dictionary["queue_position"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.queuePosition = queuePosition
				guard let skillID = dictionary["skill_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.skillID = skillID
				startDate = DateFormatter.esiDateFormatter.date(from: dictionary["start_date"] as? String ?? "")
				trainingStartSP = dictionary["training_start_sp"] as? Int
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				finishDate = aDecoder.decodeObject(forKey: "finish_date") as? Date
				finishedLevel = aDecoder.decodeInteger(forKey: "finished_level")
				levelEndSP = aDecoder.containsValue(forKey: "level_end_sp") ? aDecoder.decodeInteger(forKey: "level_end_sp") : nil
				levelStartSP = aDecoder.containsValue(forKey: "level_start_sp") ? aDecoder.decodeInteger(forKey: "level_start_sp") : nil
				queuePosition = aDecoder.decodeInteger(forKey: "queue_position")
				skillID = aDecoder.decodeInteger(forKey: "skill_id")
				startDate = aDecoder.decodeObject(forKey: "start_date") as? Date
				trainingStartSP = aDecoder.containsValue(forKey: "training_start_sp") ? aDecoder.decodeInteger(forKey: "training_start_sp") : nil
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = finishDate {
					aCoder.encode(v, forKey: "finish_date")
				}
				aCoder.encode(finishedLevel, forKey: "finished_level")
				if let v = levelEndSP {
					aCoder.encode(v, forKey: "level_end_sp")
				}
				if let v = levelStartSP {
					aCoder.encode(v, forKey: "level_start_sp")
				}
				aCoder.encode(queuePosition, forKey: "queue_position")
				aCoder.encode(skillID, forKey: "skill_id")
				if let v = startDate {
					aCoder.encode(v, forKey: "start_date")
				}
				if let v = trainingStartSP {
					aCoder.encode(v, forKey: "training_start_sp")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = finishDate?.json {
					json["finish_date"] = v
				}
				json["finished_level"] = finishedLevel.json
				if let v = levelEndSP?.json {
					json["level_end_sp"] = v
				}
				if let v = levelStartSP?.json {
					json["level_start_sp"] = v
				}
				json["queue_position"] = queuePosition.json
				json["skill_id"] = skillID.json
				if let v = startDate?.json {
					json["start_date"] = v
				}
				if let v = trainingStartSP?.json {
					json["training_start_sp"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: finishDate?.hashValue ?? 0)
				hashCombine(seed: &hash, value: finishedLevel.hashValue)
				hashCombine(seed: &hash, value: levelEndSP?.hashValue ?? 0)
				hashCombine(seed: &hash, value: levelStartSP?.hashValue ?? 0)
				hashCombine(seed: &hash, value: queuePosition.hashValue)
				hashCombine(seed: &hash, value: skillID.hashValue)
				hashCombine(seed: &hash, value: startDate?.hashValue ?? 0)
				hashCombine(seed: &hash, value: trainingStartSP?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Skills.SkillQueueItem, rhs: Skills.SkillQueueItem) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Skills.SkillQueueItem) {
				finishDate = other.finishDate
				finishedLevel = other.finishedLevel
				levelEndSP = other.levelEndSP
				levelStartSP = other.levelStartSP
				queuePosition = other.queuePosition
				skillID = other.skillID
				startDate = other.startDate
				trainingStartSP = other.trainingStartSP
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Skills.SkillQueueItem(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? SkillQueueItem)?.hashValue == hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDSkillqueueForbidden: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			public static func ==(lhs: Skills.GetCharactersCharacterIDSkillqueueForbidden, rhs: Skills.GetCharactersCharacterIDSkillqueueForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Skills.GetCharactersCharacterIDSkillqueueForbidden) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Skills.GetCharactersCharacterIDSkillqueueForbidden(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCharactersCharacterIDSkillqueueForbidden)?.hashValue == hashValue
			}
			
		}
		
		
		public class CharacterSkills: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class Skill: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var currentSkillLevel: Int? = nil
				public var skillID: Int? = nil
				public var skillpointsInSkill: Int64? = nil
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					currentSkillLevel = dictionary["current_skill_level"] as? Int
					skillID = dictionary["skill_id"] as? Int
					skillpointsInSkill = dictionary["skillpoints_in_skill"] as? Int64
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					currentSkillLevel = aDecoder.containsValue(forKey: "current_skill_level") ? aDecoder.decodeInteger(forKey: "current_skill_level") : nil
					skillID = aDecoder.containsValue(forKey: "skill_id") ? aDecoder.decodeInteger(forKey: "skill_id") : nil
					skillpointsInSkill = aDecoder.containsValue(forKey: "skillpoints_in_skill") ? aDecoder.decodeInt64(forKey: "skillpoints_in_skill") : nil
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					if let v = currentSkillLevel {
						aCoder.encode(v, forKey: "current_skill_level")
					}
					if let v = skillID {
						aCoder.encode(v, forKey: "skill_id")
					}
					if let v = skillpointsInSkill {
						aCoder.encode(v, forKey: "skillpoints_in_skill")
					}
				}
				
				public var json: Any {
					var json = [String: Any]()
					if let v = currentSkillLevel?.json {
						json["current_skill_level"] = v
					}
					if let v = skillID?.json {
						json["skill_id"] = v
					}
					if let v = skillpointsInSkill?.json {
						json["skillpoints_in_skill"] = v
					}
					return json
				}
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: currentSkillLevel?.hashValue ?? 0)
					hashCombine(seed: &hash, value: skillID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: skillpointsInSkill?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: Skills.CharacterSkills.Skill, rhs: Skills.CharacterSkills.Skill) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Skills.CharacterSkills.Skill) {
					currentSkillLevel = other.currentSkillLevel
					skillID = other.skillID
					skillpointsInSkill = other.skillpointsInSkill
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Skills.CharacterSkills.Skill(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? Skill)?.hashValue == hashValue
				}
				
			}
			
			public var skills: [Skills.CharacterSkills.Skill]? = nil
			public var totalSP: Int64? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				skills = try (dictionary["skills"] as? [Any])?.map {try Skills.CharacterSkills.Skill(json: $0)}
				totalSP = dictionary["total_sp"] as? Int64
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				skills = aDecoder.decodeObject(of: [Skills.CharacterSkills.Skill.self], forKey: "skills") as? [Skills.CharacterSkills.Skill]
				totalSP = aDecoder.containsValue(forKey: "total_sp") ? aDecoder.decodeInt64(forKey: "total_sp") : nil
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = skills {
					aCoder.encode(v, forKey: "skills")
				}
				if let v = totalSP {
					aCoder.encode(v, forKey: "total_sp")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = skills?.json {
					json["skills"] = v
				}
				if let v = totalSP?.json {
					json["total_sp"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				skills?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: totalSP?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Skills.CharacterSkills, rhs: Skills.CharacterSkills) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Skills.CharacterSkills) {
				skills = other.skills?.flatMap { Skills.CharacterSkills.Skill($0) }
				totalSP = other.totalSP
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Skills.CharacterSkills(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? CharacterSkills)?.hashValue == hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDSkillsForbidden: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			public static func ==(lhs: Skills.GetCharactersCharacterIDSkillsForbidden, rhs: Skills.GetCharactersCharacterIDSkillsForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Skills.GetCharactersCharacterIDSkillsForbidden) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Skills.GetCharactersCharacterIDSkillsForbidden(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCharactersCharacterIDSkillsForbidden)?.hashValue == hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDSkillqueueInternalServerError: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			public static func ==(lhs: Skills.GetCharactersCharacterIDSkillqueueInternalServerError, rhs: Skills.GetCharactersCharacterIDSkillqueueInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Skills.GetCharactersCharacterIDSkillqueueInternalServerError) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Skills.GetCharactersCharacterIDSkillqueueInternalServerError(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCharactersCharacterIDSkillqueueInternalServerError)?.hashValue == hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDSkillsInternalServerError: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			public static func ==(lhs: Skills.GetCharactersCharacterIDSkillsInternalServerError, rhs: Skills.GetCharactersCharacterIDSkillsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Skills.GetCharactersCharacterIDSkillsInternalServerError) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Skills.GetCharactersCharacterIDSkillsInternalServerError(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCharactersCharacterIDSkillsInternalServerError)?.hashValue == hashValue
			}
			
		}
		
		
	}
	
}
