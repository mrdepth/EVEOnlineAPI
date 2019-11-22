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
			
			
			public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
				do {
					
					
					
					
					var headers = HTTPHeaders()
					headers["Accept"] = "application/json"
					
					
					var query = [URLQueryItem]()
					query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
					
					
					let url = try route.asURL()
					var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
					components.queryItems = query
					
					return esi.session.publisher(components,
					method: .get,
					encoding: URLEncoding.default,
					headers: headers,
					interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
					.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
					.eraseToAnyPublisher()
					
				}
				catch {
					return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
				}
			}
			
			
			
			
			
			
			public struct Participant: Codable, Hashable {
				
				
				public let allianceID: Int
				public let score: Double
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case allianceID = "alliance_id"
					case score
					
					var dateFormatter: DateFormatter? {
						return nil
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
			
			public struct Success: Codable, Hashable {
				
				
				public let attackersScore: Double?
				public let campaignID: Int
				public let constellationID: Int
				public let defenderID: Int?
				public let defenderScore: Double?
				public let eventType: ESI.Sovereignty.Campaigns.EventType
				public let participants: [ESI.Sovereignty.Campaigns.Participant]?
				public let solarSystemID: Int
				public let startTime: Date
				public let structureID: Int64
				
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
			
		}
		
		public struct Map {
			let esi: ESI
			let route: APIRoute
			
			
			public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
				do {
					
					
					
					
					var headers = HTTPHeaders()
					headers["Accept"] = "application/json"
					
					
					var query = [URLQueryItem]()
					query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
					
					
					let url = try route.asURL()
					var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
					components.queryItems = query
					
					return esi.session.publisher(components,
					method: .get,
					encoding: URLEncoding.default,
					headers: headers,
					interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
					.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
					.eraseToAnyPublisher()
					
				}
				catch {
					return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
				}
			}
			
			
			
			
			
			
			public struct Success: Codable, Hashable {
				
				
				public let allianceID: Int?
				public let corporationID: Int?
				public let factionID: Int?
				public let systemID: Int
				
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
			
			
			public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
				do {
					
					
					
					
					var headers = HTTPHeaders()
					headers["Accept"] = "application/json"
					
					
					var query = [URLQueryItem]()
					query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
					
					
					let url = try route.asURL()
					var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
					components.queryItems = query
					
					return esi.session.publisher(components,
					method: .get,
					encoding: URLEncoding.default,
					headers: headers,
					interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
					.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
					.eraseToAnyPublisher()
					
				}
				catch {
					return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
				}
			}
			
			
			
			
			
			
			public struct Success: Codable, Hashable {
				
				
				public let allianceID: Int
				public let solarSystemID: Int
				public let structureID: Int64
				public let structureTypeID: Int
				public let vulnerabilityOccupancyLevel: Double?
				public let vulnerableEndTime: Date?
				public let vulnerableStartTime: Date?
				
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
