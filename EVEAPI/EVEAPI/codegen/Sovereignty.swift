import Foundation
import Alamofire
import Combine


extension ESI {
	public var sovereignty: Sovereignty {
		return Sovereignty(esi: self, route: .path("sovereignty", next: .root(ESI.apiURL)))
	}
	
	public struct Sovereignty {
		let esi: ESI
		let route: APIRoute
		
		
		
		public func campaigns() -> Campaigns {
			Campaigns(esi: esi, route: .path("campaigns", next: route))
		}
		public func map() -> Map {
			Map(esi: esi, route: .path("map", next: route))
		}
		public func structures() -> Structures {
			Structures(esi: esi, route: .path("structures", next: route))
		}
		
		public struct Campaigns {
			let esi: ESI
			let route: APIRoute
			
			
			public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Sovereignty.Campaigns.Success]>, AFError> {
				do {
					
					
					
					
					var headers = HTTPHeaders()
					headers["Accept"] = "application/json"
					
					
					var query = [URLQueryItem]()
					query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
					
					
					let url = try route.asURL()
					var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
					components.queryItems = query
					
					let publisher = esi.publisher(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
					if let progress = progress {
						return publisher
						.downloadProgress(closure: progress)
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
					else {
						return publisher
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
				}
				catch {
					return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
				}
			}
			
			
			
			
			
			
			public struct Participant: Codable, Hashable {
				
				
				public var allianceID: Int
				public var score: Double
				public init(allianceID: Int, score: Double) {
					self.allianceID = allianceID
					self.score = score
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case allianceID = "alliance_id"
					case score
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
			public struct Success: Codable, Hashable {
				
				
				public var attackersScore: Double?
				public var campaignID: Int
				public var constellationID: Int
				public var defenderID: Int?
				public var defenderScore: Double?
				public var eventType: ESI.Sovereignty.Campaigns.EventType
				public var participants: [ESI.Sovereignty.Campaigns.Participant]?
				public var solarSystemID: Int
				public var startTime: Date
				public var structureID: Int64
				public init(attackersScore: Double?, campaignID: Int, constellationID: Int, defenderID: Int?, defenderScore: Double?, eventType: ESI.Sovereignty.Campaigns.EventType, participants: [ESI.Sovereignty.Campaigns.Participant]?, solarSystemID: Int, startTime: Date, structureID: Int64) {
					self.attackersScore = attackersScore
					self.campaignID = campaignID
					self.constellationID = constellationID
					self.defenderID = defenderID
					self.defenderScore = defenderScore
					self.eventType = eventType
					self.participants = participants
					self.solarSystemID = solarSystemID
					self.startTime = startTime
					self.structureID = structureID
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case attackersScore = "attackers_score"
					case campaignID = "campaign_id"
					case constellationID = "constellation_id"
					case defenderID = "defender_id"
					case defenderScore = "defender_score"
					case eventType = "event_type"
					case participants
					case solarSystemID = "solar_system_id"
					case startTime = "start_time"
					case structureID = "structure_id"
					
					var dateFormatter: DateFormatter? {
						switch self {
							case .startTime:
							return DateFormatter.esiDateTimeFormatter
							default:
							return nil
						}
					}
				}
			}
			
			public enum EventType: String, Codable, CustomStringConvertible {
				case tcuDefense = "tcu_defense"
				case ihubDefense = "ihub_defense"
				case stationDefense = "station_defense"
				case stationFreeport = "station_freeport"
				
				public var description: String {
					return rawValue
				}
				
			}
			
		}
		
		public struct Map {
			let esi: ESI
			let route: APIRoute
			
			
			public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Sovereignty.Map.Success]>, AFError> {
				do {
					
					
					
					
					var headers = HTTPHeaders()
					headers["Accept"] = "application/json"
					
					
					var query = [URLQueryItem]()
					query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
					
					
					let url = try route.asURL()
					var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
					components.queryItems = query
					
					let publisher = esi.publisher(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
					if let progress = progress {
						return publisher
						.downloadProgress(closure: progress)
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
					else {
						return publisher
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
				}
				catch {
					return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
				}
			}
			
			
			
			
			
			
			public struct Success: Codable, Hashable {
				
				
				public var allianceID: Int?
				public var corporationID: Int?
				public var factionID: Int?
				public var systemID: Int
				public init(allianceID: Int?, corporationID: Int?, factionID: Int?, systemID: Int) {
					self.allianceID = allianceID
					self.corporationID = corporationID
					self.factionID = factionID
					self.systemID = systemID
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case allianceID = "alliance_id"
					case corporationID = "corporation_id"
					case factionID = "faction_id"
					case systemID = "system_id"
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
		}
		
		public struct Structures {
			let esi: ESI
			let route: APIRoute
			
			
			public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Sovereignty.Structures.Success]>, AFError> {
				do {
					
					
					
					
					var headers = HTTPHeaders()
					headers["Accept"] = "application/json"
					
					
					var query = [URLQueryItem]()
					query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
					
					
					let url = try route.asURL()
					var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
					components.queryItems = query
					
					let publisher = esi.publisher(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
					if let progress = progress {
						return publisher
						.downloadProgress(closure: progress)
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
					else {
						return publisher
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
				}
				catch {
					return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
				}
			}
			
			
			
			
			
			
			public struct Success: Codable, Hashable {
				
				
				public var allianceID: Int
				public var solarSystemID: Int
				public var structureID: Int64
				public var structureTypeID: Int
				public var vulnerabilityOccupancyLevel: Double?
				public var vulnerableEndTime: Date?
				public var vulnerableStartTime: Date?
				public init(allianceID: Int, solarSystemID: Int, structureID: Int64, structureTypeID: Int, vulnerabilityOccupancyLevel: Double?, vulnerableEndTime: Date?, vulnerableStartTime: Date?) {
					self.allianceID = allianceID
					self.solarSystemID = solarSystemID
					self.structureID = structureID
					self.structureTypeID = structureTypeID
					self.vulnerabilityOccupancyLevel = vulnerabilityOccupancyLevel
					self.vulnerableEndTime = vulnerableEndTime
					self.vulnerableStartTime = vulnerableStartTime
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case allianceID = "alliance_id"
					case solarSystemID = "solar_system_id"
					case structureID = "structure_id"
					case structureTypeID = "structure_type_id"
					case vulnerabilityOccupancyLevel = "vulnerability_occupancy_level"
					case vulnerableEndTime = "vulnerable_end_time"
					case vulnerableStartTime = "vulnerable_start_time"
					
					var dateFormatter: DateFormatter? {
						switch self {
							case .vulnerableEndTime:
							return DateFormatter.esiDateTimeFormatter
							case .vulnerableStartTime:
							return DateFormatter.esiDateTimeFormatter
							default:
							return nil
						}
					}
				}
			}
			
		}
		
		
		
	}
	
}
