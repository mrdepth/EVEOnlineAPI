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
		
		public func getCharacterAttributes(characterID: Int, completionBlock:((Result<Skills.CharacterAttributes>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-skills.read_skills.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/attributes/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Skills.CharacterAttributes>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getCharactersSkillQueue(characterID: Int, completionBlock:((Result<[Skills.SkillQueueItem]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-skills.read_skillqueue.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v2/characters/\(characterID)/skillqueue/"
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
		
		public func getCharacterSkills(characterID: Int, completionBlock:((Result<Skills.CharacterSkills>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-skills.read_skills.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v4/characters/\(characterID)/skills/"
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
		
		
		public struct CharacterSkills: Codable, Hashable {
			
			public struct Skill: Codable, Hashable {
				
				
				public let activeSkillLevel: Int
				public let skillID: Int
				public let skillpointsInSkill: Int64
				public let trainedSkillLevel: Int
				
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
			
			public let skills: [Skills.CharacterSkills.Skill]
			public let totalSP: Int64
			public let unallocatedSP: Int?
			
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
			
			
			public let accruedRemapCooldownDate: Date?
			public let bonusRemaps: Int?
			public let charisma: Int
			public let intelligence: Int
			public let lastRemapDate: Date?
			public let memory: Int
			public let perception: Int
			public let willpower: Int
			
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
			
			
			public let finishDate: Date?
			public let finishedLevel: Int
			public let levelEndSP: Int?
			public let levelStartSP: Int?
			public let queuePosition: Int
			public let skillID: Int
			public let startDate: Date?
			public let trainingStartSP: Int?
			
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
