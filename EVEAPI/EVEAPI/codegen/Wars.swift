import Foundation
import Alamofire


public extension ESI {
	public var wars: Wars {
		return Wars(sessionManager: self)
	}
	
	class Wars {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		public func listWars(maxWarID: Int? = nil, completionBlock:((Result<[Int]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = maxWarID?.httpQuery {
				query.append(URLQueryItem(name: "max_war_id", value: v))
			}
			
			let url = session!.baseURL + "/v1/wars/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Int]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getWarInformation(warID: Int, completionBlock:((Result<Wars.WarInformation>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/wars/\(warID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Wars.WarInformation>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func listKillsForWar(page: Int? = nil, warID: Int, completionBlock:((Result<[Wars.Kills]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v1/wars/\(warID)/killmails/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Wars.Kills]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		public struct Kills: Codable, Hashable {
			
			
			public let killmailHash: String
			public let killmailID: Int
			
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
				
				
				public let allianceID: Int?
				public let corporationID: Int?
				public let iskDestroyed: Float
				public let shipsKilled: Int
				
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
				
				
				public let allianceID: Int?
				public let corporationID: Int?
				
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
				
				
				public let allianceID: Int?
				public let corporationID: Int?
				public let iskDestroyed: Float
				public let shipsKilled: Int
				
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
			
			public let aggressor: Wars.WarInformation.GetWarsWarIDAggressor
			public let allies: [Wars.WarInformation.GetWarsWarIDAllies]?
			public let declared: Date
			public let defender: Wars.WarInformation.GetWarsWarIDDefender
			public let finished: Date?
			public let id: Int
			public let mutual: Bool
			public let openForAllies: Bool
			public let retracted: Date?
			public let started: Date?
			
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
			
			
			public let error: String?
			
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
			
			
			public let error: String?
			
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
