import Foundation
import Alamofire
import Futures


public extension ESI {
	var factionWarfare: FactionWarfare {
		return FactionWarfare(esi: self)
	}
	
	struct FactionWarfare {
		let esi: ESI
		
		@discardableResult
		public func listOfTheTopFactionsInFactionWarfare(ifNoneMatch: String? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<FactionWarfare.Leaderboards>> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/fw/leaderboards/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<FactionWarfare.Leaderboards>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<FactionWarfare.Leaderboards>) in
				promise.set(response: response, cached: nil)
			}
			return promise.future
		}
		
		@discardableResult
		public func listOfTheTopCorporationsInFactionWarfare(ifNoneMatch: String? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<FactionWarfare.Corporations>> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/fw/leaderboards/corporations/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<FactionWarfare.Corporations>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<FactionWarfare.Corporations>) in
				promise.set(response: response, cached: nil)
			}
			return promise.future
		}
		
		@discardableResult
		public func overviewOfCharacterInvolvedInFactionWarfare(characterID: Int, ifNoneMatch: String? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<FactionWarfare.GetCharactersCharacterIDFwStatsOk>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-characters.read_fw_stats.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/characters/\(characterID)/fw/stats/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<FactionWarfare.GetCharactersCharacterIDFwStatsOk>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<FactionWarfare.GetCharactersCharacterIDFwStatsOk>) in
				promise.set(response: response, cached: nil)
			}
			return promise.future
		}
		
		@discardableResult
		public func ownershipOfFactionWarfareSystems(ifNoneMatch: String? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[FactionWarfare.System]>> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v2/fw/systems/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<[FactionWarfare.System]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<[FactionWarfare.System]>) in
				promise.set(response: response, cached: 1800.0)
			}
			return promise.future
		}
		
		@discardableResult
		public func dataAboutWhichNPCFactionsAreAtWar(ifNoneMatch: String? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[FactionWarfare.FactionWar]>> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/fw/wars/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<[FactionWarfare.FactionWar]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<[FactionWarfare.FactionWar]>) in
				promise.set(response: response, cached: nil)
			}
			return promise.future
		}
		
		@discardableResult
		public func listOfTheTopPilotsInFactionWarfare(ifNoneMatch: String? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<FactionWarfare.Characters>> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/fw/leaderboards/characters/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<FactionWarfare.Characters>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<FactionWarfare.Characters>) in
				promise.set(response: response, cached: nil)
			}
			return promise.future
		}
		
		@discardableResult
		public func overviewOfCorporationInvolvedInFactionWarfare(corporationID: Int, ifNoneMatch: String? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<FactionWarfare.GetCorporationsCorporationIDFwStatsOk>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-corporations.read_fw_stats.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/corporations/\(corporationID)/fw/stats/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<FactionWarfare.GetCorporationsCorporationIDFwStatsOk>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<FactionWarfare.GetCorporationsCorporationIDFwStatsOk>) in
				promise.set(response: response, cached: nil)
			}
			return promise.future
		}
		
		@discardableResult
		public func anOverviewOfStatisticsAboutFactionsInvolvedInFactionWarfare(ifNoneMatch: String? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[FactionWarfare.FactionStats]>> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/fw/stats/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<[FactionWarfare.FactionStats]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<[FactionWarfare.FactionStats]>) in
				promise.set(response: response, cached: nil)
			}
			return promise.future
		}
		
		
		public struct FactionWar: Codable, Hashable {
			
			
			public var againstID: Int
			public var factionID: Int
			
			public init(againstID: Int, factionID: Int) {
				self.againstID = againstID
				self.factionID = factionID
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
		
		
		public struct GetCharactersCharacterIDFwStatsOk: Codable, Hashable {
			
			public struct GetCharactersCharacterIDFwStatsVictoryPoints: Codable, Hashable {
				
				
				public var lastWeek: Int
				public var total: Int
				public var yesterday: Int
				
				public init(lastWeek: Int, total: Int, yesterday: Int) {
					self.lastWeek = lastWeek
					self.total = total
					self.yesterday = yesterday
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
				
				
				public var lastWeek: Int
				public var total: Int
				public var yesterday: Int
				
				public init(lastWeek: Int, total: Int, yesterday: Int) {
					self.lastWeek = lastWeek
					self.total = total
					self.yesterday = yesterday
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
			
			public var currentRank: Int?
			public var enlistedOn: Date?
			public var factionID: Int?
			public var highestRank: Int?
			public var kills: FactionWarfare.GetCharactersCharacterIDFwStatsOk.GetCharactersCharacterIDFwStatsKills
			public var victoryPoints: FactionWarfare.GetCharactersCharacterIDFwStatsOk.GetCharactersCharacterIDFwStatsVictoryPoints
			
			public init(currentRank: Int?, enlistedOn: Date?, factionID: Int?, highestRank: Int?, kills: FactionWarfare.GetCharactersCharacterIDFwStatsOk.GetCharactersCharacterIDFwStatsKills, victoryPoints: FactionWarfare.GetCharactersCharacterIDFwStatsOk.GetCharactersCharacterIDFwStatsVictoryPoints) {
				self.currentRank = currentRank
				self.enlistedOn = enlistedOn
				self.factionID = factionID
				self.highestRank = highestRank
				self.kills = kills
				self.victoryPoints = victoryPoints
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
		
		
		public struct Corporations: Codable, Hashable {
			
			public struct GetFwLeaderboardsCorporationsKills: Codable, Hashable {
				
				public struct GetFwLeaderboardsCorporationsLastWeek: Codable, Hashable {
					
					
					public var amount: Int?
					public var corporationID: Int?
					
					public init(amount: Int?, corporationID: Int?) {
						self.amount = amount
						self.corporationID = corporationID
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
				
				public struct GetFwLeaderboardsCorporationsActiveTotal: Codable, Hashable {
					
					
					public var amount: Int?
					public var corporationID: Int?
					
					public init(amount: Int?, corporationID: Int?) {
						self.amount = amount
						self.corporationID = corporationID
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
				
				public struct GetFwLeaderboardsCorporationsYesterday: Codable, Hashable {
					
					
					public var amount: Int?
					public var corporationID: Int?
					
					public init(amount: Int?, corporationID: Int?) {
						self.amount = amount
						self.corporationID = corporationID
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
				
				public var activeTotal: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsKills.GetFwLeaderboardsCorporationsActiveTotal]
				public var lastWeek: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsKills.GetFwLeaderboardsCorporationsLastWeek]
				public var yesterday: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsKills.GetFwLeaderboardsCorporationsYesterday]
				
				public init(activeTotal: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsKills.GetFwLeaderboardsCorporationsActiveTotal], lastWeek: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsKills.GetFwLeaderboardsCorporationsLastWeek], yesterday: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsKills.GetFwLeaderboardsCorporationsYesterday]) {
					self.activeTotal = activeTotal
					self.lastWeek = lastWeek
					self.yesterday = yesterday
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
			
			public struct GetFwLeaderboardsCorporationsVictoryPoints: Codable, Hashable {
				
				public struct GetFwLeaderboardsCorporationsVictoryPointsYesterday: Codable, Hashable {
					
					
					public var amount: Int?
					public var corporationID: Int?
					
					public init(amount: Int?, corporationID: Int?) {
						self.amount = amount
						self.corporationID = corporationID
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
				
				public struct GetFwLeaderboardsCorporationsVictoryPointsLastWeek: Codable, Hashable {
					
					
					public var amount: Int?
					public var corporationID: Int?
					
					public init(amount: Int?, corporationID: Int?) {
						self.amount = amount
						self.corporationID = corporationID
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
				
				public struct GetFwLeaderboardsCorporationsVictoryPointsActiveTotal: Codable, Hashable {
					
					
					public var amount: Int?
					public var corporationID: Int?
					
					public init(amount: Int?, corporationID: Int?) {
						self.amount = amount
						self.corporationID = corporationID
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
				
				public var activeTotal: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsVictoryPoints.GetFwLeaderboardsCorporationsVictoryPointsActiveTotal]
				public var lastWeek: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsVictoryPoints.GetFwLeaderboardsCorporationsVictoryPointsLastWeek]
				public var yesterday: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsVictoryPoints.GetFwLeaderboardsCorporationsVictoryPointsYesterday]
				
				public init(activeTotal: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsVictoryPoints.GetFwLeaderboardsCorporationsVictoryPointsActiveTotal], lastWeek: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsVictoryPoints.GetFwLeaderboardsCorporationsVictoryPointsLastWeek], yesterday: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsVictoryPoints.GetFwLeaderboardsCorporationsVictoryPointsYesterday]) {
					self.activeTotal = activeTotal
					self.lastWeek = lastWeek
					self.yesterday = yesterday
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
			
			public var kills: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsKills
			public var victoryPoints: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsVictoryPoints
			
			public init(kills: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsKills, victoryPoints: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsVictoryPoints) {
				self.kills = kills
				self.victoryPoints = victoryPoints
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
		
		
		public struct GetCorporationsCorporationIDFwStatsOk: Codable, Hashable {
			
			public struct GetCorporationsCorporationIDFwStatsKills: Codable, Hashable {
				
				
				public var lastWeek: Int
				public var total: Int
				public var yesterday: Int
				
				public init(lastWeek: Int, total: Int, yesterday: Int) {
					self.lastWeek = lastWeek
					self.total = total
					self.yesterday = yesterday
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
			
			public struct GetCorporationsCorporationIDFwStatsVictoryPoints: Codable, Hashable {
				
				
				public var lastWeek: Int
				public var total: Int
				public var yesterday: Int
				
				public init(lastWeek: Int, total: Int, yesterday: Int) {
					self.lastWeek = lastWeek
					self.total = total
					self.yesterday = yesterday
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
			
			public var enlistedOn: Date?
			public var factionID: Int?
			public var kills: FactionWarfare.GetCorporationsCorporationIDFwStatsOk.GetCorporationsCorporationIDFwStatsKills
			public var pilots: Int?
			public var victoryPoints: FactionWarfare.GetCorporationsCorporationIDFwStatsOk.GetCorporationsCorporationIDFwStatsVictoryPoints
			
			public init(enlistedOn: Date?, factionID: Int?, kills: FactionWarfare.GetCorporationsCorporationIDFwStatsOk.GetCorporationsCorporationIDFwStatsKills, pilots: Int?, victoryPoints: FactionWarfare.GetCorporationsCorporationIDFwStatsOk.GetCorporationsCorporationIDFwStatsVictoryPoints) {
				self.enlistedOn = enlistedOn
				self.factionID = factionID
				self.kills = kills
				self.pilots = pilots
				self.victoryPoints = victoryPoints
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
		
		
		public struct Leaderboards: Codable, Hashable {
			
			public struct GetFwLeaderboardsKills: Codable, Hashable {
				
				public struct GetFwLeaderboardsLastWeek: Codable, Hashable {
					
					
					public var amount: Int?
					public var factionID: Int?
					
					public init(amount: Int?, factionID: Int?) {
						self.amount = amount
						self.factionID = factionID
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
				
				public struct GetFwLeaderboardsYesterday: Codable, Hashable {
					
					
					public var amount: Int?
					public var factionID: Int?
					
					public init(amount: Int?, factionID: Int?) {
						self.amount = amount
						self.factionID = factionID
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
				
				public struct GetFwLeaderboardsActiveTotal: Codable, Hashable {
					
					
					public var amount: Int?
					public var factionID: Int?
					
					public init(amount: Int?, factionID: Int?) {
						self.amount = amount
						self.factionID = factionID
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
				
				public var activeTotal: [FactionWarfare.Leaderboards.GetFwLeaderboardsKills.GetFwLeaderboardsActiveTotal]
				public var lastWeek: [FactionWarfare.Leaderboards.GetFwLeaderboardsKills.GetFwLeaderboardsLastWeek]
				public var yesterday: [FactionWarfare.Leaderboards.GetFwLeaderboardsKills.GetFwLeaderboardsYesterday]
				
				public init(activeTotal: [FactionWarfare.Leaderboards.GetFwLeaderboardsKills.GetFwLeaderboardsActiveTotal], lastWeek: [FactionWarfare.Leaderboards.GetFwLeaderboardsKills.GetFwLeaderboardsLastWeek], yesterday: [FactionWarfare.Leaderboards.GetFwLeaderboardsKills.GetFwLeaderboardsYesterday]) {
					self.activeTotal = activeTotal
					self.lastWeek = lastWeek
					self.yesterday = yesterday
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
			
			public struct GetFwLeaderboardsVictoryPoints: Codable, Hashable {
				
				public struct GetFwLeaderboardsVictoryPointsYesterday: Codable, Hashable {
					
					
					public var amount: Int?
					public var factionID: Int?
					
					public init(amount: Int?, factionID: Int?) {
						self.amount = amount
						self.factionID = factionID
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
				
				public struct GetFwLeaderboardsVictoryPointsActiveTotal: Codable, Hashable {
					
					
					public var amount: Int?
					public var factionID: Int?
					
					public init(amount: Int?, factionID: Int?) {
						self.amount = amount
						self.factionID = factionID
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
				
				public struct GetFwLeaderboardsVictoryPointsLastWeek: Codable, Hashable {
					
					
					public var amount: Int?
					public var factionID: Int?
					
					public init(amount: Int?, factionID: Int?) {
						self.amount = amount
						self.factionID = factionID
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
				
				public var activeTotal: [FactionWarfare.Leaderboards.GetFwLeaderboardsVictoryPoints.GetFwLeaderboardsVictoryPointsActiveTotal]
				public var lastWeek: [FactionWarfare.Leaderboards.GetFwLeaderboardsVictoryPoints.GetFwLeaderboardsVictoryPointsLastWeek]
				public var yesterday: [FactionWarfare.Leaderboards.GetFwLeaderboardsVictoryPoints.GetFwLeaderboardsVictoryPointsYesterday]
				
				public init(activeTotal: [FactionWarfare.Leaderboards.GetFwLeaderboardsVictoryPoints.GetFwLeaderboardsVictoryPointsActiveTotal], lastWeek: [FactionWarfare.Leaderboards.GetFwLeaderboardsVictoryPoints.GetFwLeaderboardsVictoryPointsLastWeek], yesterday: [FactionWarfare.Leaderboards.GetFwLeaderboardsVictoryPoints.GetFwLeaderboardsVictoryPointsYesterday]) {
					self.activeTotal = activeTotal
					self.lastWeek = lastWeek
					self.yesterday = yesterday
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
			
			public var kills: FactionWarfare.Leaderboards.GetFwLeaderboardsKills
			public var victoryPoints: FactionWarfare.Leaderboards.GetFwLeaderboardsVictoryPoints
			
			public init(kills: FactionWarfare.Leaderboards.GetFwLeaderboardsKills, victoryPoints: FactionWarfare.Leaderboards.GetFwLeaderboardsVictoryPoints) {
				self.kills = kills
				self.victoryPoints = victoryPoints
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
		
		
		public struct FactionStats: Codable, Hashable {
			
			public struct GetFwStatsKills: Codable, Hashable {
				
				
				public var lastWeek: Int
				public var total: Int
				public var yesterday: Int
				
				public init(lastWeek: Int, total: Int, yesterday: Int) {
					self.lastWeek = lastWeek
					self.total = total
					self.yesterday = yesterday
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
			
			public struct GetFwStatsVictoryPoints: Codable, Hashable {
				
				
				public var lastWeek: Int
				public var total: Int
				public var yesterday: Int
				
				public init(lastWeek: Int, total: Int, yesterday: Int) {
					self.lastWeek = lastWeek
					self.total = total
					self.yesterday = yesterday
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
			
			public var factionID: Int
			public var kills: FactionWarfare.FactionStats.GetFwStatsKills
			public var pilots: Int
			public var systemsControlled: Int
			public var victoryPoints: FactionWarfare.FactionStats.GetFwStatsVictoryPoints
			
			public init(factionID: Int, kills: FactionWarfare.FactionStats.GetFwStatsKills, pilots: Int, systemsControlled: Int, victoryPoints: FactionWarfare.FactionStats.GetFwStatsVictoryPoints) {
				self.factionID = factionID
				self.kills = kills
				self.pilots = pilots
				self.systemsControlled = systemsControlled
				self.victoryPoints = victoryPoints
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
			
			public struct GetFwLeaderboardsCharactersVictoryPoints: Codable, Hashable {
				
				public struct GetFwLeaderboardsCharactersVictoryPointsLastWeek: Codable, Hashable {
					
					
					public var amount: Int?
					public var characterID: Int?
					
					public init(amount: Int?, characterID: Int?) {
						self.amount = amount
						self.characterID = characterID
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
				
				public struct GetFwLeaderboardsCharactersVictoryPointsYesterday: Codable, Hashable {
					
					
					public var amount: Int?
					public var characterID: Int?
					
					public init(amount: Int?, characterID: Int?) {
						self.amount = amount
						self.characterID = characterID
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
				
				public struct GetFwLeaderboardsCharactersVictoryPointsActiveTotal: Codable, Hashable {
					
					
					public var amount: Int?
					public var characterID: Int?
					
					public init(amount: Int?, characterID: Int?) {
						self.amount = amount
						self.characterID = characterID
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
				
				public var activeTotal: [FactionWarfare.Characters.GetFwLeaderboardsCharactersVictoryPoints.GetFwLeaderboardsCharactersVictoryPointsActiveTotal]
				public var lastWeek: [FactionWarfare.Characters.GetFwLeaderboardsCharactersVictoryPoints.GetFwLeaderboardsCharactersVictoryPointsLastWeek]
				public var yesterday: [FactionWarfare.Characters.GetFwLeaderboardsCharactersVictoryPoints.GetFwLeaderboardsCharactersVictoryPointsYesterday]
				
				public init(activeTotal: [FactionWarfare.Characters.GetFwLeaderboardsCharactersVictoryPoints.GetFwLeaderboardsCharactersVictoryPointsActiveTotal], lastWeek: [FactionWarfare.Characters.GetFwLeaderboardsCharactersVictoryPoints.GetFwLeaderboardsCharactersVictoryPointsLastWeek], yesterday: [FactionWarfare.Characters.GetFwLeaderboardsCharactersVictoryPoints.GetFwLeaderboardsCharactersVictoryPointsYesterday]) {
					self.activeTotal = activeTotal
					self.lastWeek = lastWeek
					self.yesterday = yesterday
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
			
			public struct GetFwLeaderboardsCharactersKills: Codable, Hashable {
				
				public struct GetFwLeaderboardsCharactersLastWeek: Codable, Hashable {
					
					
					public var amount: Int?
					public var characterID: Int?
					
					public init(amount: Int?, characterID: Int?) {
						self.amount = amount
						self.characterID = characterID
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
				
				public struct GetFwLeaderboardsCharactersActiveTotal: Codable, Hashable {
					
					
					public var amount: Int?
					public var characterID: Int?
					
					public init(amount: Int?, characterID: Int?) {
						self.amount = amount
						self.characterID = characterID
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
				
				public struct GetFwLeaderboardsCharactersYesterday: Codable, Hashable {
					
					
					public var amount: Int?
					public var characterID: Int?
					
					public init(amount: Int?, characterID: Int?) {
						self.amount = amount
						self.characterID = characterID
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
				
				public var activeTotal: [FactionWarfare.Characters.GetFwLeaderboardsCharactersKills.GetFwLeaderboardsCharactersActiveTotal]
				public var lastWeek: [FactionWarfare.Characters.GetFwLeaderboardsCharactersKills.GetFwLeaderboardsCharactersLastWeek]
				public var yesterday: [FactionWarfare.Characters.GetFwLeaderboardsCharactersKills.GetFwLeaderboardsCharactersYesterday]
				
				public init(activeTotal: [FactionWarfare.Characters.GetFwLeaderboardsCharactersKills.GetFwLeaderboardsCharactersActiveTotal], lastWeek: [FactionWarfare.Characters.GetFwLeaderboardsCharactersKills.GetFwLeaderboardsCharactersLastWeek], yesterday: [FactionWarfare.Characters.GetFwLeaderboardsCharactersKills.GetFwLeaderboardsCharactersYesterday]) {
					self.activeTotal = activeTotal
					self.lastWeek = lastWeek
					self.yesterday = yesterday
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
			
			public var kills: FactionWarfare.Characters.GetFwLeaderboardsCharactersKills
			public var victoryPoints: FactionWarfare.Characters.GetFwLeaderboardsCharactersVictoryPoints
			
			public init(kills: FactionWarfare.Characters.GetFwLeaderboardsCharactersKills, victoryPoints: FactionWarfare.Characters.GetFwLeaderboardsCharactersVictoryPoints) {
				self.kills = kills
				self.victoryPoints = victoryPoints
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
			
			public enum GetFwSystemsContested: String, Codable, HTTPQueryable {
				case captured = "captured"
				case contested = "contested"
				case uncontested = "uncontested"
				case vulnerable = "vulnerable"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var contested: FactionWarfare.System.GetFwSystemsContested
			public var occupierFactionID: Int
			public var ownerFactionID: Int
			public var solarSystemID: Int
			public var victoryPoints: Int
			public var victoryPointsThreshold: Int
			
			public init(contested: FactionWarfare.System.GetFwSystemsContested, occupierFactionID: Int, ownerFactionID: Int, solarSystemID: Int, victoryPoints: Int, victoryPointsThreshold: Int) {
				self.contested = contested
				self.occupierFactionID = occupierFactionID
				self.ownerFactionID = ownerFactionID
				self.solarSystemID = solarSystemID
				self.victoryPoints = victoryPoints
				self.victoryPointsThreshold = victoryPointsThreshold
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
		
		
	}
	
}
