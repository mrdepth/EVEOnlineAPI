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
		
		@discardableResult
		public func getCharacterAttributes(characterID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<Skills.CharacterAttributes>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<Skills.CharacterAttributes>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-skills.read_skills.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/attributes/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Skills.CharacterAttributes>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCharactersSkillQueue(characterID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<[Skills.SkillQueueItem]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Skills.SkillQueueItem]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-skills.read_skillqueue.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v2/characters/\(characterID)/skillqueue/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Skills.SkillQueueItem]>) in
					promise.set(result: response.result, cached: 120.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCharacterSkills(characterID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<Skills.CharacterSkills>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<Skills.CharacterSkills>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-skills.read_skills.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v4/characters/\(characterID)/skills/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Skills.CharacterSkills>) in
					promise.set(result: response.result, cached: 120.0)
					session = nil
				}
			}
			return promise.future
		}
		
		
		public struct CharacterSkills: Codable, Hashable {
			
			public struct Skill: Codable, Hashable {
				
				
				public var activeSkillLevel: Int
				public var skillID: Int
				public var skillpointsInSkill: Int64
				public var trainedSkillLevel: Int
				
				public init(activeSkillLevel: Int, skillID: Int, skillpointsInSkill: Int64, trainedSkillLevel: Int) {
					self.activeSkillLevel = activeSkillLevel
					self.skillID = skillID
					self.skillpointsInSkill = skillpointsInSkill
					self.trainedSkillLevel = trainedSkillLevel
				}
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: activeSkillLevel.hashValue)
					hashCombine(seed: &hash, value: skillID.hashValue)
					hashCombine(seed: &hash, value: skillpointsInSkill.hashValue)
					hashCombine(seed: &hash, value: trainedSkillLevel.hashValue)
					return hash
				}
				
				public static func ==(lhs: Skills.CharacterSkills.Skill, rhs: Skills.CharacterSkills.Skill) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case activeSkillLevel = "active_skill_level"
					case skillID = "skill_id"
					case skillpointsInSkill = "skillpoints_in_skill"
					case trainedSkillLevel = "trained_skill_level"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public var skills: [Skills.CharacterSkills.Skill]
			public var totalSP: Int64
			public var unallocatedSP: Int?
			
			public init(skills: [Skills.CharacterSkills.Skill], totalSP: Int64, unallocatedSP: Int?) {
				self.skills = skills
				self.totalSP = totalSP
				self.unallocatedSP = unallocatedSP
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				self.skills.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: totalSP.hashValue)
				hashCombine(seed: &hash, value: unallocatedSP?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Skills.CharacterSkills, rhs: Skills.CharacterSkills) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case skills
				case totalSP = "total_sp"
				case unallocatedSP = "unallocated_sp"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct CharacterAttributes: Codable, Hashable {
			
			
			public var accruedRemapCooldownDate: Date?
			public var bonusRemaps: Int?
			public var charisma: Int
			public var intelligence: Int
			public var lastRemapDate: Date?
			public var memory: Int
			public var perception: Int
			public var willpower: Int
			
			public init(accruedRemapCooldownDate: Date?, bonusRemaps: Int?, charisma: Int, intelligence: Int, lastRemapDate: Date?, memory: Int, perception: Int, willpower: Int) {
				self.accruedRemapCooldownDate = accruedRemapCooldownDate
				self.bonusRemaps = bonusRemaps
				self.charisma = charisma
				self.intelligence = intelligence
				self.lastRemapDate = lastRemapDate
				self.memory = memory
				self.perception = perception
				self.willpower = willpower
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: accruedRemapCooldownDate?.hashValue ?? 0)
				hashCombine(seed: &hash, value: bonusRemaps?.hashValue ?? 0)
				hashCombine(seed: &hash, value: charisma.hashValue)
				hashCombine(seed: &hash, value: intelligence.hashValue)
				hashCombine(seed: &hash, value: lastRemapDate?.hashValue ?? 0)
				hashCombine(seed: &hash, value: memory.hashValue)
				hashCombine(seed: &hash, value: perception.hashValue)
				hashCombine(seed: &hash, value: willpower.hashValue)
				return hash
			}
			
			public static func ==(lhs: Skills.CharacterAttributes, rhs: Skills.CharacterAttributes) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case accruedRemapCooldownDate = "accrued_remap_cooldown_date"
				case bonusRemaps = "bonus_remaps"
				case charisma
				case intelligence
				case lastRemapDate = "last_remap_date"
				case memory
				case perception
				case willpower
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .accruedRemapCooldownDate: return DateFormatter.esiDateTimeFormatter
						case .lastRemapDate: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct SkillQueueItem: Codable, Hashable {
			
			
			public var finishDate: Date?
			public var finishedLevel: Int
			public var levelEndSP: Int?
			public var levelStartSP: Int?
			public var queuePosition: Int
			public var skillID: Int
			public var startDate: Date?
			public var trainingStartSP: Int?
			
			public init(finishDate: Date?, finishedLevel: Int, levelEndSP: Int?, levelStartSP: Int?, queuePosition: Int, skillID: Int, startDate: Date?, trainingStartSP: Int?) {
				self.finishDate = finishDate
				self.finishedLevel = finishedLevel
				self.levelEndSP = levelEndSP
				self.levelStartSP = levelStartSP
				self.queuePosition = queuePosition
				self.skillID = skillID
				self.startDate = startDate
				self.trainingStartSP = trainingStartSP
			}
			
			public var hashValue: Int {
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
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case finishDate = "finish_date"
				case finishedLevel = "finished_level"
				case levelEndSP = "level_end_sp"
				case levelStartSP = "level_start_sp"
				case queuePosition = "queue_position"
				case skillID = "skill_id"
				case startDate = "start_date"
				case trainingStartSP = "training_start_sp"
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .finishDate: return DateFormatter.esiDateTimeFormatter
						case .startDate: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
	}
	
}
