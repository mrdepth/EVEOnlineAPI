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
		
		public func anOverviewOfStatisticsAboutFactionsInvolvedInFactionWarfare(completionBlock:((Result<[FactionWarfare.FactionStats]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/fw/stats/"
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
		
		public func overviewOfCharacterInvolvedInFactionWarfare(characterID: Int, completionBlock:((Result<FactionWarfare.GetCharactersCharacterIDFwStatsOk>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-characters.read_fw_stats.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/fw/stats/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<FactionWarfare.GetCharactersCharacterIDFwStatsOk>) in
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
			
			
			
			let url = session!.baseURL + "/v1/fw/leaderboards/"
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
		
		public func dataAboutWhichNPCFactionsAreAtWar(completionBlock:((Result<[FactionWarfare.FactionWar]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/fw/wars/"
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
		
		public func ownershipOfFactionWarfareSystems(completionBlock:((Result<[FactionWarfare.System]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/fw/systems/"
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
			
			
			
			let url = session!.baseURL + "/v1/fw/leaderboards/characters/"
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
		
		public func overviewOfCorporationInvolvedInFactionWarfare(corporationID: Int, completionBlock:((Result<FactionWarfare.GetCorporationsCorporationIDFwStatsOk>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.read_fw_stats.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/fw/stats/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<FactionWarfare.GetCorporationsCorporationIDFwStatsOk>) in
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
			
			
			
			let url = session!.baseURL + "/v1/fw/leaderboards/corporations/"
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
		
		
		public struct GetCharactersCharacterIDFwStatsOk: Codable, Hashable {
			
			public struct GetCharactersCharacterIDFwStatsVictoryPoints: Codable, Hashable {
				
				
				public let lastWeek: Int
				public let total: Int
				public let yesterday: Int
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: lastWeek.hashValue)
					hashCombine(seed: &hash, value: total.hashValue)
					hashCombine(seed: &hash, value: yesterday.hashValue)
					return hash
				}
				
				public static func ==(lhs: FactionWarfare.GetCharactersCharacterIDFwStatsOk.GetCharactersCharacterIDFwStatsVictoryPoints, rhs: FactionWarfare.GetCharactersCharacterIDFwStatsOk.GetCharactersCharacterIDFwStatsVictoryPoints) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case lastWeek = "last_week"
					case total
					case yesterday
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct GetCharactersCharacterIDFwStatsKills: Codable, Hashable {
				
				
				public let lastWeek: Int
				public let total: Int
				public let yesterday: Int
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: lastWeek.hashValue)
					hashCombine(seed: &hash, value: total.hashValue)
					hashCombine(seed: &hash, value: yesterday.hashValue)
					return hash
				}
				
				public static func ==(lhs: FactionWarfare.GetCharactersCharacterIDFwStatsOk.GetCharactersCharacterIDFwStatsKills, rhs: FactionWarfare.GetCharactersCharacterIDFwStatsOk.GetCharactersCharacterIDFwStatsKills) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case lastWeek = "last_week"
					case total
					case yesterday
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public let currentRank: Int?
			public let enlistedOn: Date?
			public let factionID: Int?
			public let highestRank: Int?
			public let kills: FactionWarfare.GetCharactersCharacterIDFwStatsOk.GetCharactersCharacterIDFwStatsKills
			public let victoryPoints: FactionWarfare.GetCharactersCharacterIDFwStatsOk.GetCharactersCharacterIDFwStatsVictoryPoints
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: currentRank?.hashValue ?? 0)
				hashCombine(seed: &hash, value: enlistedOn?.hashValue ?? 0)
				hashCombine(seed: &hash, value: factionID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: highestRank?.hashValue ?? 0)
				hashCombine(seed: &hash, value: kills.hashValue)
				hashCombine(seed: &hash, value: victoryPoints.hashValue)
				return hash
			}
			
			public static func ==(lhs: FactionWarfare.GetCharactersCharacterIDFwStatsOk, rhs: FactionWarfare.GetCharactersCharacterIDFwStatsOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case currentRank = "current_rank"
				case enlistedOn = "enlisted_on"
				case factionID = "faction_id"
				case highestRank = "highest_rank"
				case kills
				case victoryPoints = "victory_points"
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .enlistedOn: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCorporationsCorporationIDFwStatsOk: Codable, Hashable {
			
			public struct GetCorporationsCorporationIDFwStatsVictoryPoints: Codable, Hashable {
				
				
				public let lastWeek: Int
				public let total: Int
				public let yesterday: Int
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: lastWeek.hashValue)
					hashCombine(seed: &hash, value: total.hashValue)
					hashCombine(seed: &hash, value: yesterday.hashValue)
					return hash
				}
				
				public static func ==(lhs: FactionWarfare.GetCorporationsCorporationIDFwStatsOk.GetCorporationsCorporationIDFwStatsVictoryPoints, rhs: FactionWarfare.GetCorporationsCorporationIDFwStatsOk.GetCorporationsCorporationIDFwStatsVictoryPoints) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case lastWeek = "last_week"
					case total
					case yesterday
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct GetCorporationsCorporationIDFwStatsKills: Codable, Hashable {
				
				
				public let lastWeek: Int
				public let total: Int
				public let yesterday: Int
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: lastWeek.hashValue)
					hashCombine(seed: &hash, value: total.hashValue)
					hashCombine(seed: &hash, value: yesterday.hashValue)
					return hash
				}
				
				public static func ==(lhs: FactionWarfare.GetCorporationsCorporationIDFwStatsOk.GetCorporationsCorporationIDFwStatsKills, rhs: FactionWarfare.GetCorporationsCorporationIDFwStatsOk.GetCorporationsCorporationIDFwStatsKills) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case lastWeek = "last_week"
					case total
					case yesterday
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public let enlistedOn: Date?
			public let factionID: Int?
			public let kills: FactionWarfare.GetCorporationsCorporationIDFwStatsOk.GetCorporationsCorporationIDFwStatsKills
			public let pilots: Int?
			public let victoryPoints: FactionWarfare.GetCorporationsCorporationIDFwStatsOk.GetCorporationsCorporationIDFwStatsVictoryPoints
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: enlistedOn?.hashValue ?? 0)
				hashCombine(seed: &hash, value: factionID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: kills.hashValue)
				hashCombine(seed: &hash, value: pilots?.hashValue ?? 0)
				hashCombine(seed: &hash, value: victoryPoints.hashValue)
				return hash
			}
			
			public static func ==(lhs: FactionWarfare.GetCorporationsCorporationIDFwStatsOk, rhs: FactionWarfare.GetCorporationsCorporationIDFwStatsOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case enlistedOn = "enlisted_on"
				case factionID = "faction_id"
				case kills
				case pilots
				case victoryPoints = "victory_points"
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .enlistedOn: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct FactionWar: Codable, Hashable {
			
			
			public let againstID: Int
			public let factionID: Int
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: againstID.hashValue)
				hashCombine(seed: &hash, value: factionID.hashValue)
				return hash
			}
			
			public static func ==(lhs: FactionWarfare.FactionWar, rhs: FactionWarfare.FactionWar) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case againstID = "against_id"
				case factionID = "faction_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct FactionStats: Codable, Hashable {
			
			public struct GetFwStatsVictoryPoints: Codable, Hashable {
				
				
				public let lastWeek: Int
				public let total: Int
				public let yesterday: Int
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: lastWeek.hashValue)
					hashCombine(seed: &hash, value: total.hashValue)
					hashCombine(seed: &hash, value: yesterday.hashValue)
					return hash
				}
				
				public static func ==(lhs: FactionWarfare.FactionStats.GetFwStatsVictoryPoints, rhs: FactionWarfare.FactionStats.GetFwStatsVictoryPoints) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case lastWeek = "last_week"
					case total
					case yesterday
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct GetFwStatsKills: Codable, Hashable {
				
				
				public let lastWeek: Int
				public let total: Int
				public let yesterday: Int
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: lastWeek.hashValue)
					hashCombine(seed: &hash, value: total.hashValue)
					hashCombine(seed: &hash, value: yesterday.hashValue)
					return hash
				}
				
				public static func ==(lhs: FactionWarfare.FactionStats.GetFwStatsKills, rhs: FactionWarfare.FactionStats.GetFwStatsKills) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case lastWeek = "last_week"
					case total
					case yesterday
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public let factionID: Int
			public let kills: FactionWarfare.FactionStats.GetFwStatsKills
			public let pilots: Int
			public let systemsControlled: Int
			public let victoryPoints: FactionWarfare.FactionStats.GetFwStatsVictoryPoints
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: factionID.hashValue)
				hashCombine(seed: &hash, value: kills.hashValue)
				hashCombine(seed: &hash, value: pilots.hashValue)
				hashCombine(seed: &hash, value: systemsControlled.hashValue)
				hashCombine(seed: &hash, value: victoryPoints.hashValue)
				return hash
			}
			
			public static func ==(lhs: FactionWarfare.FactionStats, rhs: FactionWarfare.FactionStats) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case factionID = "faction_id"
				case kills
				case pilots
				case systemsControlled = "systems_controlled"
				case victoryPoints = "victory_points"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct Characters: Codable, Hashable {
			
			public struct GetFwLeaderboardsCharactersYesterday: Codable, Hashable {
				
				
				public let amount: Int?
				public let characterID: Int?
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: amount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: characterID?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: FactionWarfare.Characters.GetFwLeaderboardsCharactersYesterday, rhs: FactionWarfare.Characters.GetFwLeaderboardsCharactersYesterday) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case amount
					case characterID = "character_id"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct GetFwLeaderboardsCharactersVictoryPoints: Codable, Hashable {
				
				
				public let activeTotal: [FactionWarfare.Characters.GetFwLeaderboardsCharactersActiveTotal]
				public let lastWeek: [FactionWarfare.Characters.GetFwLeaderboardsCharactersLastWeek]
				public let yesterday: [FactionWarfare.Characters.GetFwLeaderboardsCharactersYesterday]
				
				public var hashValue: Int {
					var hash: Int = 0
					self.activeTotal.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					self.lastWeek.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					self.yesterday.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					return hash
				}
				
				public static func ==(lhs: FactionWarfare.Characters.GetFwLeaderboardsCharactersVictoryPoints, rhs: FactionWarfare.Characters.GetFwLeaderboardsCharactersVictoryPoints) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case activeTotal = "active_total"
					case lastWeek = "last_week"
					case yesterday
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct GetFwLeaderboardsCharactersLastWeek: Codable, Hashable {
				
				
				public let amount: Int?
				public let characterID: Int?
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: amount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: characterID?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: FactionWarfare.Characters.GetFwLeaderboardsCharactersLastWeek, rhs: FactionWarfare.Characters.GetFwLeaderboardsCharactersLastWeek) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case amount
					case characterID = "character_id"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct GetFwLeaderboardsCharactersKills: Codable, Hashable {
				
				
				public let activeTotal: [FactionWarfare.Characters.GetFwLeaderboardsCharactersActiveTotal]
				public let lastWeek: [FactionWarfare.Characters.GetFwLeaderboardsCharactersLastWeek]
				public let yesterday: [FactionWarfare.Characters.GetFwLeaderboardsCharactersYesterday]
				
				public var hashValue: Int {
					var hash: Int = 0
					self.activeTotal.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					self.lastWeek.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					self.yesterday.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					return hash
				}
				
				public static func ==(lhs: FactionWarfare.Characters.GetFwLeaderboardsCharactersKills, rhs: FactionWarfare.Characters.GetFwLeaderboardsCharactersKills) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case activeTotal = "active_total"
					case lastWeek = "last_week"
					case yesterday
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct GetFwLeaderboardsCharactersActiveTotal: Codable, Hashable {
				
				
				public let amount: Int?
				public let characterID: Int?
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: amount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: characterID?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: FactionWarfare.Characters.GetFwLeaderboardsCharactersActiveTotal, rhs: FactionWarfare.Characters.GetFwLeaderboardsCharactersActiveTotal) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case amount
					case characterID = "character_id"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public let kills: FactionWarfare.Characters.GetFwLeaderboardsCharactersKills
			public let victoryPoints: FactionWarfare.Characters.GetFwLeaderboardsCharactersVictoryPoints
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: kills.hashValue)
				hashCombine(seed: &hash, value: victoryPoints.hashValue)
				return hash
			}
			
			public static func ==(lhs: FactionWarfare.Characters, rhs: FactionWarfare.Characters) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case kills
				case victoryPoints = "victory_points"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct Corporations: Codable, Hashable {
			
			public struct GetFwLeaderboardsCorporationsActiveTotal: Codable, Hashable {
				
				
				public let amount: Int?
				public let corporationID: Int?
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: amount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: corporationID?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsActiveTotal, rhs: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsActiveTotal) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case amount
					case corporationID = "corporation_id"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct GetFwLeaderboardsCorporationsKills: Codable, Hashable {
				
				
				public let activeTotal: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsActiveTotal]
				public let lastWeek: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsLastWeek]
				public let yesterday: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsYesterday]
				
				public var hashValue: Int {
					var hash: Int = 0
					self.activeTotal.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					self.lastWeek.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					self.yesterday.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					return hash
				}
				
				public static func ==(lhs: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsKills, rhs: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsKills) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case activeTotal = "active_total"
					case lastWeek = "last_week"
					case yesterday
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct GetFwLeaderboardsCorporationsYesterday: Codable, Hashable {
				
				
				public let amount: Int?
				public let corporationID: Int?
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: amount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: corporationID?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsYesterday, rhs: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsYesterday) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case amount
					case corporationID = "corporation_id"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct GetFwLeaderboardsCorporationsVictoryPoints: Codable, Hashable {
				
				
				public let activeTotal: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsActiveTotal]
				public let lastWeek: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsLastWeek]
				public let yesterday: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsYesterday]
				
				public var hashValue: Int {
					var hash: Int = 0
					self.activeTotal.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					self.lastWeek.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					self.yesterday.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					return hash
				}
				
				public static func ==(lhs: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsVictoryPoints, rhs: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsVictoryPoints) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case activeTotal = "active_total"
					case lastWeek = "last_week"
					case yesterday
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct GetFwLeaderboardsCorporationsLastWeek: Codable, Hashable {
				
				
				public let amount: Int?
				public let corporationID: Int?
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: amount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: corporationID?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsLastWeek, rhs: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsLastWeek) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case amount
					case corporationID = "corporation_id"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public let kills: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsKills
			public let victoryPoints: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsVictoryPoints
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: kills.hashValue)
				hashCombine(seed: &hash, value: victoryPoints.hashValue)
				return hash
			}
			
			public static func ==(lhs: FactionWarfare.Corporations, rhs: FactionWarfare.Corporations) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case kills
				case victoryPoints = "victory_points"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct System: Codable, Hashable {
			
			
			public let contested: Bool
			public let occupierFactionID: Int
			public let ownerFactionID: Int
			public let solarSystemID: Int
			public let victoryPoints: Int
			public let victoryPointsThreshold: Int
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: contested.hashValue)
				hashCombine(seed: &hash, value: occupierFactionID.hashValue)
				hashCombine(seed: &hash, value: ownerFactionID.hashValue)
				hashCombine(seed: &hash, value: solarSystemID.hashValue)
				hashCombine(seed: &hash, value: victoryPoints.hashValue)
				hashCombine(seed: &hash, value: victoryPointsThreshold.hashValue)
				return hash
			}
			
			public static func ==(lhs: FactionWarfare.System, rhs: FactionWarfare.System) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case contested
				case occupierFactionID = "occupier_faction_id"
				case ownerFactionID = "owner_faction_id"
				case solarSystemID = "solar_system_id"
				case victoryPoints = "victory_points"
				case victoryPointsThreshold = "victory_points_threshold"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct Leaderboards: Codable, Hashable {
			
			public struct GetFwLeaderboardsYesterday: Codable, Hashable {
				
				
				public let amount: Int?
				public let factionID: Int?
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: amount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: factionID?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: FactionWarfare.Leaderboards.GetFwLeaderboardsYesterday, rhs: FactionWarfare.Leaderboards.GetFwLeaderboardsYesterday) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case amount
					case factionID = "faction_id"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct GetFwLeaderboardsVictoryPoints: Codable, Hashable {
				
				
				public let activeTotal: [FactionWarfare.Leaderboards.GetFwLeaderboardsActiveTotal]
				public let lastWeek: [FactionWarfare.Leaderboards.GetFwLeaderboardsLastWeek]
				public let yesterday: [FactionWarfare.Leaderboards.GetFwLeaderboardsYesterday]
				
				public var hashValue: Int {
					var hash: Int = 0
					self.activeTotal.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					self.lastWeek.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					self.yesterday.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					return hash
				}
				
				public static func ==(lhs: FactionWarfare.Leaderboards.GetFwLeaderboardsVictoryPoints, rhs: FactionWarfare.Leaderboards.GetFwLeaderboardsVictoryPoints) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case activeTotal = "active_total"
					case lastWeek = "last_week"
					case yesterday
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct GetFwLeaderboardsKills: Codable, Hashable {
				
				
				public let activeTotal: [FactionWarfare.Leaderboards.GetFwLeaderboardsActiveTotal]
				public let lastWeek: [FactionWarfare.Leaderboards.GetFwLeaderboardsLastWeek]
				public let yesterday: [FactionWarfare.Leaderboards.GetFwLeaderboardsYesterday]
				
				public var hashValue: Int {
					var hash: Int = 0
					self.activeTotal.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					self.lastWeek.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					self.yesterday.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					return hash
				}
				
				public static func ==(lhs: FactionWarfare.Leaderboards.GetFwLeaderboardsKills, rhs: FactionWarfare.Leaderboards.GetFwLeaderboardsKills) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case activeTotal = "active_total"
					case lastWeek = "last_week"
					case yesterday
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct GetFwLeaderboardsActiveTotal: Codable, Hashable {
				
				
				public let amount: Int?
				public let factionID: Int?
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: amount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: factionID?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: FactionWarfare.Leaderboards.GetFwLeaderboardsActiveTotal, rhs: FactionWarfare.Leaderboards.GetFwLeaderboardsActiveTotal) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case amount
					case factionID = "faction_id"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct GetFwLeaderboardsLastWeek: Codable, Hashable {
				
				
				public let amount: Int?
				public let factionID: Int?
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: amount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: factionID?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: FactionWarfare.Leaderboards.GetFwLeaderboardsLastWeek, rhs: FactionWarfare.Leaderboards.GetFwLeaderboardsLastWeek) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case amount
					case factionID = "faction_id"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public let kills: FactionWarfare.Leaderboards.GetFwLeaderboardsKills
			public let victoryPoints: FactionWarfare.Leaderboards.GetFwLeaderboardsVictoryPoints
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: kills.hashValue)
				hashCombine(seed: &hash, value: victoryPoints.hashValue)
				return hash
			}
			
			public static func ==(lhs: FactionWarfare.Leaderboards, rhs: FactionWarfare.Leaderboards) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case kills
				case victoryPoints = "victory_points"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
	}
	
}
