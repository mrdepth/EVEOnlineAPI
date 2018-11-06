import Foundation
import Alamofire
import Futures


public extension ESI {
	public var sovereignty: Sovereignty {
		return Sovereignty(esi: self)
	}
	
	struct Sovereignty {
		let esi: ESI
		
		@discardableResult
		public func listSovereigntyCampaigns(ifNoneMatch: String? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Sovereignty.Campaign]>> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/sovereignty/campaigns/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Sovereignty.Campaign]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Sovereignty.Campaign]>) in
				promise.set(response: response, cached: 5.0)
			}
			return promise.future
		}
		
		@discardableResult
		public func listSovereigntyOfSystems(ifNoneMatch: String? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Sovereignty.System]>> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/sovereignty/map/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Sovereignty.System]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Sovereignty.System]>) in
				promise.set(response: response, cached: 3600.0)
			}
			return promise.future
		}
		
		@discardableResult
		public func listSovereigntyStructures(ifNoneMatch: String? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Sovereignty.Structure]>> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/sovereignty/structures/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Sovereignty.Structure]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Sovereignty.Structure]>) in
				promise.set(response: response, cached: 120.0)
			}
			return promise.future
		}
		
		
		public struct Structure: Codable, Hashable {
			
			
			public var allianceID: Int
			public var solarSystemID: Int
			public var structureID: Int64
			public var structureTypeID: Int
			public var vulnerabilityOccupancyLevel: Float?
			public var vulnerableEndTime: Date?
			public var vulnerableStartTime: Date?
			
			public init(allianceID: Int, solarSystemID: Int, structureID: Int64, structureTypeID: Int, vulnerabilityOccupancyLevel: Float?, vulnerableEndTime: Date?, vulnerableStartTime: Date?) {
				self.allianceID = allianceID
				self.solarSystemID = solarSystemID
				self.structureID = structureID
				self.structureTypeID = structureTypeID
				self.vulnerabilityOccupancyLevel = vulnerabilityOccupancyLevel
				self.vulnerableEndTime = vulnerableEndTime
				self.vulnerableStartTime = vulnerableStartTime
			}
			
			public static func ==(lhs: Sovereignty.Structure, rhs: Sovereignty.Structure) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
						case .vulnerableEndTime: return DateFormatter.esiDateTimeFormatter
						case .vulnerableStartTime: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct System: Codable, Hashable {
			
			
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
			
			public static func ==(lhs: Sovereignty.System, rhs: Sovereignty.System) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case allianceID = "alliance_id"
				case corporationID = "corporation_id"
				case factionID = "faction_id"
				case systemID = "system_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct Campaign: Codable, Hashable {
			
			public struct GetSovereigntyCampaignsParticipants: Codable, Hashable {
				
				
				public var allianceID: Int
				public var score: Float
				
				public init(allianceID: Int, score: Float) {
					self.allianceID = allianceID
					self.score = score
				}
				
				public static func ==(lhs: Sovereignty.Campaign.GetSovereigntyCampaignsParticipants, rhs: Sovereignty.Campaign.GetSovereigntyCampaignsParticipants) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case allianceID = "alliance_id"
					case score
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public enum GetSovereigntyCampaignsEventType: String, Codable, HTTPQueryable {
				case ihubDefense = "ihub_defense"
				case stationDefense = "station_defense"
				case stationFreeport = "station_freeport"
				case tcuDefense = "tcu_defense"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var attackersScore: Float?
			public var campaignID: Int
			public var constellationID: Int
			public var defenderID: Int?
			public var defenderScore: Float?
			public var eventType: Sovereignty.Campaign.GetSovereigntyCampaignsEventType
			public var participants: [Sovereignty.Campaign.GetSovereigntyCampaignsParticipants]?
			public var solarSystemID: Int
			public var startTime: Date
			public var structureID: Int64
			
			public init(attackersScore: Float?, campaignID: Int, constellationID: Int, defenderID: Int?, defenderScore: Float?, eventType: Sovereignty.Campaign.GetSovereigntyCampaignsEventType, participants: [Sovereignty.Campaign.GetSovereigntyCampaignsParticipants]?, solarSystemID: Int, startTime: Date, structureID: Int64) {
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
			
			public static func ==(lhs: Sovereignty.Campaign, rhs: Sovereignty.Campaign) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
						case .startTime: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
	}
	
}
