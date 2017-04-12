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
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/skills/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).downloadProgress { p in
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
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/skillqueue/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Skills.SkillQueueItem]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		public class SkillQueueItem: NSObject, NSCoding , JSONCoding {
			
			
			public var finishDate: Date?
			public var finishedLevel: Int
			public var levelEndSP: Int?
			public var levelStartSP: Int?
			public var queuePosition: Int
			public var skillID: Int
			public var startDate: Date?
			public var trainingStartSP: Int?
			
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
				finishDate = nil
				finishedLevel = Int()
				levelEndSP = nil
				levelStartSP = nil
				queuePosition = Int()
				skillID = Int()
				startDate = nil
				trainingStartSP = nil
				
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
			
		}
		
		
		public class GetCharactersCharacterIDSkillqueueForbidden: NSObject, NSCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Skills.GetCharactersCharacterIDSkillqueueForbidden, rhs: Skills.GetCharactersCharacterIDSkillqueueForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDSkillqueueInternalServerError: NSObject, NSCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Skills.GetCharactersCharacterIDSkillqueueInternalServerError, rhs: Skills.GetCharactersCharacterIDSkillqueueInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDSkillsForbidden: NSObject, NSCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Skills.GetCharactersCharacterIDSkillsForbidden, rhs: Skills.GetCharactersCharacterIDSkillsForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDSkillsInternalServerError: NSObject, NSCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Skills.GetCharactersCharacterIDSkillsInternalServerError, rhs: Skills.GetCharactersCharacterIDSkillsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class CharacterSkills: NSObject, NSCoding , JSONCoding {
			
			public class Skill: NSObject, NSCoding , JSONCoding {
				
				
				public var currentSkillLevel: Int?
				public var skillID: Int?
				public var skillpointsInSkill: Int64?
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					currentSkillLevel = dictionary["current_skill_level"] as? Int
					skillID = dictionary["skill_id"] as? Int
					skillpointsInSkill = dictionary["skillpoints_in_skill"] as? Int64
					
					super.init()
				}
				
				override public init() {
					currentSkillLevel = nil
					skillID = nil
					skillpointsInSkill = nil
					
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
				
			}
			
			public var skills: [Skills.CharacterSkills.Skill]?
			public var totalSP: Int64?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				skills = try (dictionary["skills"] as? [Any])?.map {try Skills.CharacterSkills.Skill(json: $0)}
				totalSP = dictionary["total_sp"] as? Int64
				
				super.init()
			}
			
			override public init() {
				skills = nil
				totalSP = nil
				
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				skills = aDecoder.decodeObject(forKey: "skills") as? [Skills.CharacterSkills.Skill]
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
			
		}
		
		
	}
	
}
