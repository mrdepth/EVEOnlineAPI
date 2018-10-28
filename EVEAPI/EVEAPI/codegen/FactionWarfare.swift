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
		
		@discardableResult
		public func anOverviewOfStatisticsAboutFactionsInvolvedInFactionWarfare(ifNoneMatch: String? = nil) -> Future<ESI.Result<[FactionWarfare.FactionStats]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[FactionWarfare.FactionStats]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(describing: v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/fw/stats/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[FactionWarfare.FactionStats]>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func listOfTheTopPilotsInFactionWarfare(ifNoneMatch: String? = nil) -> Future<ESI.Result<FactionWarfare.Characters>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<FactionWarfare.Characters>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(describing: v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/fw/leaderboards/characters/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<FactionWarfare.Characters>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func ownershipOfFactionWarfareSystems(ifNoneMatch: String? = nil) -> Future<ESI.Result<[FactionWarfare.System]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[FactionWarfare.System]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(describing: v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v2/fw/systems/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[FactionWarfare.System]>) in
					promise.set(result: response.result, cached: 1800.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func overviewOfCorporationInvolvedInFactionWarfare(corporationID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<FactionWarfare.GetCorporationsCorporationIDFwStatsOk>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<FactionWarfare.GetCorporationsCorporationIDFwStatsOk>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.read_fw_stats.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(describing: v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/fw/stats/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<FactionWarfare.GetCorporationsCorporationIDFwStatsOk>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func listOfTheTopCorporationsInFactionWarfare(ifNoneMatch: String? = nil) -> Future<ESI.Result<FactionWarfare.Corporations>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<FactionWarfare.Corporations>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(describing: v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/fw/leaderboards/corporations/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<FactionWarfare.Corporations>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func dataAboutWhichNPCFactionsAreAtWar(ifNoneMatch: String? = nil) -> Future<ESI.Result<[FactionWarfare.FactionWar]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[FactionWarfare.FactionWar]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(describing: v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/fw/wars/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[FactionWarfare.FactionWar]>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func listOfTheTopFactionsInFactionWarfare(ifNoneMatch: String? = nil) -> Future<ESI.Result<FactionWarfare.Leaderboards>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<FactionWarfare.Leaderboards>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(describing: v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/fw/leaderboards/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<FactionWarfare.Leaderboards>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func overviewOfCharacterInvolvedInFactionWarfare(characterID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<FactionWarfare.GetCharactersCharacterIDFwStatsOk>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<FactionWarfare.GetCharactersCharacterIDFwStatsOk>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-characters.read_fw_stats.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(describing: v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/fw/stats/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<FactionWarfare.GetCharactersCharacterIDFwStatsOk>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
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
		
		
		public struct Characters: Codable, Hashable {
			
			public struct GetFwLeaderboardsCharactersKills: Codable, Hashable {
				
				public struct GetFwLeaderboardsCharactersLastWeek: Codable, Hashable {
					
					
					public var amount: Int?
					public var characterID: Int?
					
					public init(amount: Int?, characterID: Int?) {
						self.amount = amount
						self.characterID = characterID
					}
					
					public var hashValue: Int {
						var hash: Int = 0
						hashCombine(seed: &hash, value: amount?.hashValue ?? 0)
						hashCombine(seed: &hash, value: characterID?.hashValue ?? 0)
						return hash
					}
					
					public static func ==(lhs: FactionWarfare.Characters.GetFwLeaderboardsCharactersKills.GetFwLeaderboardsCharactersLastWeek, rhs: FactionWarfare.Characters.GetFwLeaderboardsCharactersKills.GetFwLeaderboardsCharactersLastWeek) -> Bool {
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
				
				public struct GetFwLeaderboardsCharactersYesterday: Codable, Hashable {
					
					
					public var amount: Int?
					public var characterID: Int?
					
					public init(amount: Int?, characterID: Int?) {
						self.amount = amount
						self.characterID = characterID
					}
					
					public var hashValue: Int {
						var hash: Int = 0
						hashCombine(seed: &hash, value: amount?.hashValue ?? 0)
						hashCombine(seed: &hash, value: characterID?.hashValue ?? 0)
						return hash
					}
					
					public static func ==(lhs: FactionWarfare.Characters.GetFwLeaderboardsCharactersKills.GetFwLeaderboardsCharactersYesterday, rhs: FactionWarfare.Characters.GetFwLeaderboardsCharactersKills.GetFwLeaderboardsCharactersYesterday) -> Bool {
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
				
				public struct GetFwLeaderboardsCharactersActiveTotal: Codable, Hashable {
					
					
					public var amount: Int?
					public var characterID: Int?
					
					public init(amount: Int?, characterID: Int?) {
						self.amount = amount
						self.characterID = characterID
					}
					
					public var hashValue: Int {
						var hash: Int = 0
						hashCombine(seed: &hash, value: amount?.hashValue ?? 0)
						hashCombine(seed: &hash, value: characterID?.hashValue ?? 0)
						return hash
					}
					
					public static func ==(lhs: FactionWarfare.Characters.GetFwLeaderboardsCharactersKills.GetFwLeaderboardsCharactersActiveTotal, rhs: FactionWarfare.Characters.GetFwLeaderboardsCharactersKills.GetFwLeaderboardsCharactersActiveTotal) -> Bool {
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
				
				public var activeTotal: [FactionWarfare.Characters.GetFwLeaderboardsCharactersKills.GetFwLeaderboardsCharactersActiveTotal]
				public var lastWeek: [FactionWarfare.Characters.GetFwLeaderboardsCharactersKills.GetFwLeaderboardsCharactersLastWeek]
				public var yesterday: [FactionWarfare.Characters.GetFwLeaderboardsCharactersKills.GetFwLeaderboardsCharactersYesterday]
				
				public init(activeTotal: [FactionWarfare.Characters.GetFwLeaderboardsCharactersKills.GetFwLeaderboardsCharactersActiveTotal], lastWeek: [FactionWarfare.Characters.GetFwLeaderboardsCharactersKills.GetFwLeaderboardsCharactersLastWeek], yesterday: [FactionWarfare.Characters.GetFwLeaderboardsCharactersKills.GetFwLeaderboardsCharactersYesterday]) {
					self.activeTotal = activeTotal
					self.lastWeek = lastWeek
					self.yesterday = yesterday
				}
				
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
			
			public struct GetFwLeaderboardsCharactersVictoryPoints: Codable, Hashable {
				
				public struct GetFwLeaderboardsCharactersVictoryPointsYesterday: Codable, Hashable {
					
					
					public var amount: Int?
					public var characterID: Int?
					
					public init(amount: Int?, characterID: Int?) {
						self.amount = amount
						self.characterID = characterID
					}
					
					public var hashValue: Int {
						var hash: Int = 0
						hashCombine(seed: &hash, value: amount?.hashValue ?? 0)
						hashCombine(seed: &hash, value: characterID?.hashValue ?? 0)
						return hash
					}
					
					public static func ==(lhs: FactionWarfare.Characters.GetFwLeaderboardsCharactersVictoryPoints.GetFwLeaderboardsCharactersVictoryPointsYesterday, rhs: FactionWarfare.Characters.GetFwLeaderboardsCharactersVictoryPoints.GetFwLeaderboardsCharactersVictoryPointsYesterday) -> Bool {
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
				
				public struct GetFwLeaderboardsCharactersVictoryPointsLastWeek: Codable, Hashable {
					
					
					public var amount: Int?
					public var characterID: Int?
					
					public init(amount: Int?, characterID: Int?) {
						self.amount = amount
						self.characterID = characterID
					}
					
					public var hashValue: Int {
						var hash: Int = 0
						hashCombine(seed: &hash, value: amount?.hashValue ?? 0)
						hashCombine(seed: &hash, value: characterID?.hashValue ?? 0)
						return hash
					}
					
					public static func ==(lhs: FactionWarfare.Characters.GetFwLeaderboardsCharactersVictoryPoints.GetFwLeaderboardsCharactersVictoryPointsLastWeek, rhs: FactionWarfare.Characters.GetFwLeaderboardsCharactersVictoryPoints.GetFwLeaderboardsCharactersVictoryPointsLastWeek) -> Bool {
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
				
				public struct GetFwLeaderboardsCharactersVictoryPointsActiveTotal: Codable, Hashable {
					
					
					public var amount: Int?
					public var characterID: Int?
					
					public init(amount: Int?, characterID: Int?) {
						self.amount = amount
						self.characterID = characterID
					}
					
					public var hashValue: Int {
						var hash: Int = 0
						hashCombine(seed: &hash, value: amount?.hashValue ?? 0)
						hashCombine(seed: &hash, value: characterID?.hashValue ?? 0)
						return hash
					}
					
					public static func ==(lhs: FactionWarfare.Characters.GetFwLeaderboardsCharactersVictoryPoints.GetFwLeaderboardsCharactersVictoryPointsActiveTotal, rhs: FactionWarfare.Characters.GetFwLeaderboardsCharactersVictoryPoints.GetFwLeaderboardsCharactersVictoryPointsActiveTotal) -> Bool {
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
				
				public var activeTotal: [FactionWarfare.Characters.GetFwLeaderboardsCharactersVictoryPoints.GetFwLeaderboardsCharactersVictoryPointsActiveTotal]
				public var lastWeek: [FactionWarfare.Characters.GetFwLeaderboardsCharactersVictoryPoints.GetFwLeaderboardsCharactersVictoryPointsLastWeek]
				public var yesterday: [FactionWarfare.Characters.GetFwLeaderboardsCharactersVictoryPoints.GetFwLeaderboardsCharactersVictoryPointsYesterday]
				
				public init(activeTotal: [FactionWarfare.Characters.GetFwLeaderboardsCharactersVictoryPoints.GetFwLeaderboardsCharactersVictoryPointsActiveTotal], lastWeek: [FactionWarfare.Characters.GetFwLeaderboardsCharactersVictoryPoints.GetFwLeaderboardsCharactersVictoryPointsLastWeek], yesterday: [FactionWarfare.Characters.GetFwLeaderboardsCharactersVictoryPoints.GetFwLeaderboardsCharactersVictoryPointsYesterday]) {
					self.activeTotal = activeTotal
					self.lastWeek = lastWeek
					self.yesterday = yesterday
				}
				
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
			
			public var kills: FactionWarfare.Characters.GetFwLeaderboardsCharactersKills
			public var victoryPoints: FactionWarfare.Characters.GetFwLeaderboardsCharactersVictoryPoints
			
			public init(kills: FactionWarfare.Characters.GetFwLeaderboardsCharactersKills, victoryPoints: FactionWarfare.Characters.GetFwLeaderboardsCharactersVictoryPoints) {
				self.kills = kills
				self.victoryPoints = victoryPoints
			}
			
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
		
		
		public struct Leaderboards: Codable, Hashable {
			
			public struct GetFwLeaderboardsKills: Codable, Hashable {
				
				public struct GetFwLeaderboardsActiveTotal: Codable, Hashable {
					
					
					public var amount: Int?
					public var factionID: Int?
					
					public init(amount: Int?, factionID: Int?) {
						self.amount = amount
						self.factionID = factionID
					}
					
					public var hashValue: Int {
						var hash: Int = 0
						hashCombine(seed: &hash, value: amount?.hashValue ?? 0)
						hashCombine(seed: &hash, value: factionID?.hashValue ?? 0)
						return hash
					}
					
					public static func ==(lhs: FactionWarfare.Leaderboards.GetFwLeaderboardsKills.GetFwLeaderboardsActiveTotal, rhs: FactionWarfare.Leaderboards.GetFwLeaderboardsKills.GetFwLeaderboardsActiveTotal) -> Bool {
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
					
					
					public var amount: Int?
					public var factionID: Int?
					
					public init(amount: Int?, factionID: Int?) {
						self.amount = amount
						self.factionID = factionID
					}
					
					public var hashValue: Int {
						var hash: Int = 0
						hashCombine(seed: &hash, value: amount?.hashValue ?? 0)
						hashCombine(seed: &hash, value: factionID?.hashValue ?? 0)
						return hash
					}
					
					public static func ==(lhs: FactionWarfare.Leaderboards.GetFwLeaderboardsKills.GetFwLeaderboardsLastWeek, rhs: FactionWarfare.Leaderboards.GetFwLeaderboardsKills.GetFwLeaderboardsLastWeek) -> Bool {
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
				
				public struct GetFwLeaderboardsYesterday: Codable, Hashable {
					
					
					public var amount: Int?
					public var factionID: Int?
					
					public init(amount: Int?, factionID: Int?) {
						self.amount = amount
						self.factionID = factionID
					}
					
					public var hashValue: Int {
						var hash: Int = 0
						hashCombine(seed: &hash, value: amount?.hashValue ?? 0)
						hashCombine(seed: &hash, value: factionID?.hashValue ?? 0)
						return hash
					}
					
					public static func ==(lhs: FactionWarfare.Leaderboards.GetFwLeaderboardsKills.GetFwLeaderboardsYesterday, rhs: FactionWarfare.Leaderboards.GetFwLeaderboardsKills.GetFwLeaderboardsYesterday) -> Bool {
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
				
				public var activeTotal: [FactionWarfare.Leaderboards.GetFwLeaderboardsKills.GetFwLeaderboardsActiveTotal]
				public var lastWeek: [FactionWarfare.Leaderboards.GetFwLeaderboardsKills.GetFwLeaderboardsLastWeek]
				public var yesterday: [FactionWarfare.Leaderboards.GetFwLeaderboardsKills.GetFwLeaderboardsYesterday]
				
				public init(activeTotal: [FactionWarfare.Leaderboards.GetFwLeaderboardsKills.GetFwLeaderboardsActiveTotal], lastWeek: [FactionWarfare.Leaderboards.GetFwLeaderboardsKills.GetFwLeaderboardsLastWeek], yesterday: [FactionWarfare.Leaderboards.GetFwLeaderboardsKills.GetFwLeaderboardsYesterday]) {
					self.activeTotal = activeTotal
					self.lastWeek = lastWeek
					self.yesterday = yesterday
				}
				
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
			
			public struct GetFwLeaderboardsVictoryPoints: Codable, Hashable {
				
				public struct GetFwLeaderboardsVictoryPointsYesterday: Codable, Hashable {
					
					
					public var amount: Int?
					public var factionID: Int?
					
					public init(amount: Int?, factionID: Int?) {
						self.amount = amount
						self.factionID = factionID
					}
					
					public var hashValue: Int {
						var hash: Int = 0
						hashCombine(seed: &hash, value: amount?.hashValue ?? 0)
						hashCombine(seed: &hash, value: factionID?.hashValue ?? 0)
						return hash
					}
					
					public static func ==(lhs: FactionWarfare.Leaderboards.GetFwLeaderboardsVictoryPoints.GetFwLeaderboardsVictoryPointsYesterday, rhs: FactionWarfare.Leaderboards.GetFwLeaderboardsVictoryPoints.GetFwLeaderboardsVictoryPointsYesterday) -> Bool {
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
				
				public struct GetFwLeaderboardsVictoryPointsLastWeek: Codable, Hashable {
					
					
					public var amount: Int?
					public var factionID: Int?
					
					public init(amount: Int?, factionID: Int?) {
						self.amount = amount
						self.factionID = factionID
					}
					
					public var hashValue: Int {
						var hash: Int = 0
						hashCombine(seed: &hash, value: amount?.hashValue ?? 0)
						hashCombine(seed: &hash, value: factionID?.hashValue ?? 0)
						return hash
					}
					
					public static func ==(lhs: FactionWarfare.Leaderboards.GetFwLeaderboardsVictoryPoints.GetFwLeaderboardsVictoryPointsLastWeek, rhs: FactionWarfare.Leaderboards.GetFwLeaderboardsVictoryPoints.GetFwLeaderboardsVictoryPointsLastWeek) -> Bool {
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
				
				public struct GetFwLeaderboardsVictoryPointsActiveTotal: Codable, Hashable {
					
					
					public var amount: Int?
					public var factionID: Int?
					
					public init(amount: Int?, factionID: Int?) {
						self.amount = amount
						self.factionID = factionID
					}
					
					public var hashValue: Int {
						var hash: Int = 0
						hashCombine(seed: &hash, value: amount?.hashValue ?? 0)
						hashCombine(seed: &hash, value: factionID?.hashValue ?? 0)
						return hash
					}
					
					public static func ==(lhs: FactionWarfare.Leaderboards.GetFwLeaderboardsVictoryPoints.GetFwLeaderboardsVictoryPointsActiveTotal, rhs: FactionWarfare.Leaderboards.GetFwLeaderboardsVictoryPoints.GetFwLeaderboardsVictoryPointsActiveTotal) -> Bool {
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
				
				public var activeTotal: [FactionWarfare.Leaderboards.GetFwLeaderboardsVictoryPoints.GetFwLeaderboardsVictoryPointsActiveTotal]
				public var lastWeek: [FactionWarfare.Leaderboards.GetFwLeaderboardsVictoryPoints.GetFwLeaderboardsVictoryPointsLastWeek]
				public var yesterday: [FactionWarfare.Leaderboards.GetFwLeaderboardsVictoryPoints.GetFwLeaderboardsVictoryPointsYesterday]
				
				public init(activeTotal: [FactionWarfare.Leaderboards.GetFwLeaderboardsVictoryPoints.GetFwLeaderboardsVictoryPointsActiveTotal], lastWeek: [FactionWarfare.Leaderboards.GetFwLeaderboardsVictoryPoints.GetFwLeaderboardsVictoryPointsLastWeek], yesterday: [FactionWarfare.Leaderboards.GetFwLeaderboardsVictoryPoints.GetFwLeaderboardsVictoryPointsYesterday]) {
					self.activeTotal = activeTotal
					self.lastWeek = lastWeek
					self.yesterday = yesterday
				}
				
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
			
			public var kills: FactionWarfare.Leaderboards.GetFwLeaderboardsKills
			public var victoryPoints: FactionWarfare.Leaderboards.GetFwLeaderboardsVictoryPoints
			
			public init(kills: FactionWarfare.Leaderboards.GetFwLeaderboardsKills, victoryPoints: FactionWarfare.Leaderboards.GetFwLeaderboardsVictoryPoints) {
				self.kills = kills
				self.victoryPoints = victoryPoints
			}
			
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
				
				
				public var lastWeek: Int
				public var total: Int
				public var yesterday: Int
				
				public init(lastWeek: Int, total: Int, yesterday: Int) {
					self.lastWeek = lastWeek
					self.total = total
					self.yesterday = yesterday
				}
				
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
			
			public struct GetFwStatsVictoryPoints: Codable, Hashable {
				
				
				public var lastWeek: Int
				public var total: Int
				public var yesterday: Int
				
				public init(lastWeek: Int, total: Int, yesterday: Int) {
					self.lastWeek = lastWeek
					self.total = total
					self.yesterday = yesterday
				}
				
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
		
		
		public struct Corporations: Codable, Hashable {
			
			public struct GetFwLeaderboardsCorporationsKills: Codable, Hashable {
				
				public struct GetFwLeaderboardsCorporationsActiveTotal: Codable, Hashable {
					
					
					public var amount: Int?
					public var corporationID: Int?
					
					public init(amount: Int?, corporationID: Int?) {
						self.amount = amount
						self.corporationID = corporationID
					}
					
					public var hashValue: Int {
						var hash: Int = 0
						hashCombine(seed: &hash, value: amount?.hashValue ?? 0)
						hashCombine(seed: &hash, value: corporationID?.hashValue ?? 0)
						return hash
					}
					
					public static func ==(lhs: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsKills.GetFwLeaderboardsCorporationsActiveTotal, rhs: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsKills.GetFwLeaderboardsCorporationsActiveTotal) -> Bool {
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
				
				public struct GetFwLeaderboardsCorporationsYesterday: Codable, Hashable {
					
					
					public var amount: Int?
					public var corporationID: Int?
					
					public init(amount: Int?, corporationID: Int?) {
						self.amount = amount
						self.corporationID = corporationID
					}
					
					public var hashValue: Int {
						var hash: Int = 0
						hashCombine(seed: &hash, value: amount?.hashValue ?? 0)
						hashCombine(seed: &hash, value: corporationID?.hashValue ?? 0)
						return hash
					}
					
					public static func ==(lhs: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsKills.GetFwLeaderboardsCorporationsYesterday, rhs: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsKills.GetFwLeaderboardsCorporationsYesterday) -> Bool {
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
				
				public struct GetFwLeaderboardsCorporationsLastWeek: Codable, Hashable {
					
					
					public var amount: Int?
					public var corporationID: Int?
					
					public init(amount: Int?, corporationID: Int?) {
						self.amount = amount
						self.corporationID = corporationID
					}
					
					public var hashValue: Int {
						var hash: Int = 0
						hashCombine(seed: &hash, value: amount?.hashValue ?? 0)
						hashCombine(seed: &hash, value: corporationID?.hashValue ?? 0)
						return hash
					}
					
					public static func ==(lhs: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsKills.GetFwLeaderboardsCorporationsLastWeek, rhs: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsKills.GetFwLeaderboardsCorporationsLastWeek) -> Bool {
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
				
				public var activeTotal: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsKills.GetFwLeaderboardsCorporationsActiveTotal]
				public var lastWeek: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsKills.GetFwLeaderboardsCorporationsLastWeek]
				public var yesterday: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsKills.GetFwLeaderboardsCorporationsYesterday]
				
				public init(activeTotal: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsKills.GetFwLeaderboardsCorporationsActiveTotal], lastWeek: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsKills.GetFwLeaderboardsCorporationsLastWeek], yesterday: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsKills.GetFwLeaderboardsCorporationsYesterday]) {
					self.activeTotal = activeTotal
					self.lastWeek = lastWeek
					self.yesterday = yesterday
				}
				
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
			
			public struct GetFwLeaderboardsCorporationsVictoryPoints: Codable, Hashable {
				
				public struct GetFwLeaderboardsCorporationsVictoryPointsActiveTotal: Codable, Hashable {
					
					
					public var amount: Int?
					public var corporationID: Int?
					
					public init(amount: Int?, corporationID: Int?) {
						self.amount = amount
						self.corporationID = corporationID
					}
					
					public var hashValue: Int {
						var hash: Int = 0
						hashCombine(seed: &hash, value: amount?.hashValue ?? 0)
						hashCombine(seed: &hash, value: corporationID?.hashValue ?? 0)
						return hash
					}
					
					public static func ==(lhs: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsVictoryPoints.GetFwLeaderboardsCorporationsVictoryPointsActiveTotal, rhs: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsVictoryPoints.GetFwLeaderboardsCorporationsVictoryPointsActiveTotal) -> Bool {
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
				
				public struct GetFwLeaderboardsCorporationsVictoryPointsLastWeek: Codable, Hashable {
					
					
					public var amount: Int?
					public var corporationID: Int?
					
					public init(amount: Int?, corporationID: Int?) {
						self.amount = amount
						self.corporationID = corporationID
					}
					
					public var hashValue: Int {
						var hash: Int = 0
						hashCombine(seed: &hash, value: amount?.hashValue ?? 0)
						hashCombine(seed: &hash, value: corporationID?.hashValue ?? 0)
						return hash
					}
					
					public static func ==(lhs: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsVictoryPoints.GetFwLeaderboardsCorporationsVictoryPointsLastWeek, rhs: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsVictoryPoints.GetFwLeaderboardsCorporationsVictoryPointsLastWeek) -> Bool {
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
				
				public struct GetFwLeaderboardsCorporationsVictoryPointsYesterday: Codable, Hashable {
					
					
					public var amount: Int?
					public var corporationID: Int?
					
					public init(amount: Int?, corporationID: Int?) {
						self.amount = amount
						self.corporationID = corporationID
					}
					
					public var hashValue: Int {
						var hash: Int = 0
						hashCombine(seed: &hash, value: amount?.hashValue ?? 0)
						hashCombine(seed: &hash, value: corporationID?.hashValue ?? 0)
						return hash
					}
					
					public static func ==(lhs: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsVictoryPoints.GetFwLeaderboardsCorporationsVictoryPointsYesterday, rhs: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsVictoryPoints.GetFwLeaderboardsCorporationsVictoryPointsYesterday) -> Bool {
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
				
				public var activeTotal: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsVictoryPoints.GetFwLeaderboardsCorporationsVictoryPointsActiveTotal]
				public var lastWeek: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsVictoryPoints.GetFwLeaderboardsCorporationsVictoryPointsLastWeek]
				public var yesterday: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsVictoryPoints.GetFwLeaderboardsCorporationsVictoryPointsYesterday]
				
				public init(activeTotal: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsVictoryPoints.GetFwLeaderboardsCorporationsVictoryPointsActiveTotal], lastWeek: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsVictoryPoints.GetFwLeaderboardsCorporationsVictoryPointsLastWeek], yesterday: [FactionWarfare.Corporations.GetFwLeaderboardsCorporationsVictoryPoints.GetFwLeaderboardsCorporationsVictoryPointsYesterday]) {
					self.activeTotal = activeTotal
					self.lastWeek = lastWeek
					self.yesterday = yesterday
				}
				
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
			
			public var kills: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsKills
			public var victoryPoints: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsVictoryPoints
			
			public init(kills: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsKills, victoryPoints: FactionWarfare.Corporations.GetFwLeaderboardsCorporationsVictoryPoints) {
				self.kills = kills
				self.victoryPoints = victoryPoints
			}
			
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
		
		
		public struct GetCorporationsCorporationIDFwStatsOk: Codable, Hashable {
			
			public struct GetCorporationsCorporationIDFwStatsVictoryPoints: Codable, Hashable {
				
				
				public var lastWeek: Int
				public var total: Int
				public var yesterday: Int
				
				public init(lastWeek: Int, total: Int, yesterday: Int) {
					self.lastWeek = lastWeek
					self.total = total
					self.yesterday = yesterday
				}
				
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
				
				
				public var lastWeek: Int
				public var total: Int
				public var yesterday: Int
				
				public init(lastWeek: Int, total: Int, yesterday: Int) {
					self.lastWeek = lastWeek
					self.total = total
					self.yesterday = yesterday
				}
				
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
		
		
	}
	
}
