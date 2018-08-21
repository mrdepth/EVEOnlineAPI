import Foundation
import Alamofire
import Futures


public extension ESI {
	public var wars: Wars {
		return Wars(esi: self)
	}
	
	class Wars {
		weak var esi: ESI?
		
		init(esi: ESI) {
			self.esi = esi
		}
		
		@discardableResult
		public func listWars(ifNoneMatch: String? = nil, maxWarID: Int? = nil) -> Future<ESI.Result<[Int]>> {
			guard let esi = self.esi else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = maxWarID?.httpQuery {
				query.append(URLQueryItem(name: "max_war_id", value: v))
			}
			
			let url = esi.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Int]>>()
			esi.perform { [weak esi] () -> DataRequest? in
				return esi?.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Int]>) in
					promise.set(result: response.result, cached: 3600.0)
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getWarInformation(ifNoneMatch: String? = nil, warID: Int) -> Future<ESI.Result<Wars.WarInformation>> {
			guard let esi = self.esi else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<Wars.WarInformation>>()
			esi.perform { [weak esi] () -> DataRequest? in
				return esi?.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Wars.WarInformation>) in
					promise.set(result: response.result, cached: 3600.0)
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func listKillsForWar(ifNoneMatch: String? = nil, page: Int? = nil, warID: Int) -> Future<ESI.Result<[Wars.Kills]>> {
			guard let esi = self.esi else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = esi.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Wars.Kills]>>()
			esi.perform { [weak esi] () -> DataRequest? in
				return esi?.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Wars.Kills]>) in
					promise.set(result: response.result, cached: 3600.0)
				}
			}
			return promise.future
		}
		
		
		public struct Kills: Codable, Hashable {
			
			
			public var killmailHash: String
			public var killmailID: Int
			
			public init(killmailHash: String, killmailID: Int) {
				self.killmailHash = killmailHash
				self.killmailID = killmailID
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: killmailHash.hashValue)
				hashCombine(seed: &hash, value: killmailID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Wars.Kills, rhs: Wars.Kills) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case killmailHash = "killmail_hash"
				case killmailID = "killmail_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct WarInformation: Codable, Hashable {
			
			public struct GetWarsWarIDDefender: Codable, Hashable {
				
				
				public var allianceID: Int?
				public var corporationID: Int?
				public var iskDestroyed: Float
				public var shipsKilled: Int
				
				public init(allianceID: Int?, corporationID: Int?, iskDestroyed: Float, shipsKilled: Int) {
					self.allianceID = allianceID
					self.corporationID = corporationID
					self.iskDestroyed = iskDestroyed
					self.shipsKilled = shipsKilled
				}
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: allianceID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: corporationID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: iskDestroyed.hashValue)
					hashCombine(seed: &hash, value: shipsKilled.hashValue)
					return hash
				}
				
				public static func ==(lhs: Wars.WarInformation.GetWarsWarIDDefender, rhs: Wars.WarInformation.GetWarsWarIDDefender) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case allianceID = "alliance_id"
					case corporationID = "corporation_id"
					case iskDestroyed = "isk_destroyed"
					case shipsKilled = "ships_killed"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct GetWarsWarIDAllies: Codable, Hashable {
				
				
				public var allianceID: Int?
				public var corporationID: Int?
				
				public init(allianceID: Int?, corporationID: Int?) {
					self.allianceID = allianceID
					self.corporationID = corporationID
				}
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: allianceID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: corporationID?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: Wars.WarInformation.GetWarsWarIDAllies, rhs: Wars.WarInformation.GetWarsWarIDAllies) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case allianceID = "alliance_id"
					case corporationID = "corporation_id"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct GetWarsWarIDAggressor: Codable, Hashable {
				
				
				public var allianceID: Int?
				public var corporationID: Int?
				public var iskDestroyed: Float
				public var shipsKilled: Int
				
				public init(allianceID: Int?, corporationID: Int?, iskDestroyed: Float, shipsKilled: Int) {
					self.allianceID = allianceID
					self.corporationID = corporationID
					self.iskDestroyed = iskDestroyed
					self.shipsKilled = shipsKilled
				}
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: allianceID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: corporationID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: iskDestroyed.hashValue)
					hashCombine(seed: &hash, value: shipsKilled.hashValue)
					return hash
				}
				
				public static func ==(lhs: Wars.WarInformation.GetWarsWarIDAggressor, rhs: Wars.WarInformation.GetWarsWarIDAggressor) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case allianceID = "alliance_id"
					case corporationID = "corporation_id"
					case iskDestroyed = "isk_destroyed"
					case shipsKilled = "ships_killed"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public var aggressor: Wars.WarInformation.GetWarsWarIDAggressor
			public var allies: [Wars.WarInformation.GetWarsWarIDAllies]?
			public var declared: Date
			public var defender: Wars.WarInformation.GetWarsWarIDDefender
			public var finished: Date?
			public var id: Int
			public var mutual: Bool
			public var openForAllies: Bool
			public var retracted: Date?
			public var started: Date?
			
			public init(aggressor: Wars.WarInformation.GetWarsWarIDAggressor, allies: [Wars.WarInformation.GetWarsWarIDAllies]?, declared: Date, defender: Wars.WarInformation.GetWarsWarIDDefender, finished: Date?, id: Int, mutual: Bool, openForAllies: Bool, retracted: Date?, started: Date?) {
				self.aggressor = aggressor
				self.allies = allies
				self.declared = declared
				self.defender = defender
				self.finished = finished
				self.id = id
				self.mutual = mutual
				self.openForAllies = openForAllies
				self.retracted = retracted
				self.started = started
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: aggressor.hashValue)
				self.allies?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: declared.hashValue)
				hashCombine(seed: &hash, value: defender.hashValue)
				hashCombine(seed: &hash, value: finished?.hashValue ?? 0)
				hashCombine(seed: &hash, value: id.hashValue)
				hashCombine(seed: &hash, value: mutual.hashValue)
				hashCombine(seed: &hash, value: openForAllies.hashValue)
				hashCombine(seed: &hash, value: retracted?.hashValue ?? 0)
				hashCombine(seed: &hash, value: started?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Wars.WarInformation, rhs: Wars.WarInformation) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case aggressor
				case allies
				case declared
				case defender
				case finished
				case id
				case mutual
				case openForAllies = "open_for_allies"
				case retracted
				case started
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .declared: return DateFormatter.esiDateTimeFormatter
						case .finished: return DateFormatter.esiDateTimeFormatter
						case .retracted: return DateFormatter.esiDateTimeFormatter
						case .started: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetWarsWarIDUnprocessableEntity: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Wars.GetWarsWarIDUnprocessableEntity, rhs: Wars.GetWarsWarIDUnprocessableEntity) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case error
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetWarsWarIDKillmailsUnprocessableEntity: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Wars.GetWarsWarIDKillmailsUnprocessableEntity, rhs: Wars.GetWarsWarIDKillmailsUnprocessableEntity) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case error
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
	}
	
}
