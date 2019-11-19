import Foundation
import Alamofire
import Combine


extension ESI {
	public var skills: Skills {
		return Skills(esi: self)
	}
	
	public struct Skills {
		let esi: ESI
		
		
		public func getCharacterAttributes(characterID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Skills.CharacterAttributes, AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-skills.read_skills.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/characters/\(characterID)/attributes/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .get,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
			            .eraseToAnyPublisher()
		}
		
		
		public func getCharactersSkillQueue(characterID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Skills.SkillQueueItem], AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-skills.read_skillqueue.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/characters/\(characterID)/skillqueue/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .get,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
			            .eraseToAnyPublisher()
		}
		
		
		public func getCharacterSkills(characterID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Skills.CharacterSkills, AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-skills.read_skills.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/characters/\(characterID)/skills/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .get,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
			            .eraseToAnyPublisher()
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
		
		
	}
	
}
