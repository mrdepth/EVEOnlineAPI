import Foundation
import Alamofire
import Futures


public extension ESI {
	var wars: Wars {
		return Wars(esi: self)
	}
	
	struct Wars {
		let esi: ESI
		
		@discardableResult
		public func listKillsForWar(ifNoneMatch: String? = nil, page: Int? = nil, warID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Wars.Kills]>> {
			
			
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
			
			let url = esi.baseURL + "/v1/wars/\(warID)/killmails/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<[Wars.Kills]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<[Wars.Kills]>) in
				promise.set(response: response, cached: 3600.0)
			}
			return promise.future
		}
		
		@discardableResult
		public func getWarInformation(ifNoneMatch: String? = nil, warID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<Wars.WarInformation>> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/wars/\(warID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<Wars.WarInformation>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<Wars.WarInformation>) in
				promise.set(response: response, cached: 3600.0)
			}
			return promise.future
		}
		
		@discardableResult
		public func listWars(ifNoneMatch: String? = nil, maxWarID: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Int]>> {
			
			
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
			
			let url = esi.baseURL + "/v1/wars/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<[Int]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<[Int]>) in
				promise.set(response: response, cached: 3600.0)
			}
			return promise.future
		}
		
		
		public struct GetWarsWarIDUnprocessableEntity: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
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
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case error
				
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
		
		
		public struct Kills: Codable, Hashable {
			
			
			public var killmailHash: String
			public var killmailID: Int
			
			public init(killmailHash: String, killmailID: Int) {
				self.killmailHash = killmailHash
				self.killmailID = killmailID
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
		
		
	}
	
}
