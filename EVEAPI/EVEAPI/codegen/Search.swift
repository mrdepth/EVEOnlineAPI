import Foundation
import Alamofire


public extension ESI {
	public var search: Search {
		return Search(sessionManager: self)
	}
	
	class Search {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		public func search(categories: [Search.Categories], language: Language? = nil, search: String, strict: Bool? = nil, completionBlock:((Result<Search.SearchResult>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = categories.httpQuery {
				query.append(URLQueryItem(name: "categories", value: v))
			}
			if let v = language?.httpQuery {
				query.append(URLQueryItem(name: "language", value: v))
			}
			if let v = search.httpQuery {
				query.append(URLQueryItem(name: "search", value: v))
			}
			if let v = strict?.httpQuery {
				query.append(URLQueryItem(name: "strict", value: v))
			}
			
			let url = session!.baseURL + "/v2/search/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Search.SearchResult>) in
					completionBlock?(response.result)
					session = nil
				}
			}
		}
		
		public func characterSearch(categories: [Search.SearchCategories], characterID: Int, language: Language? = nil, search: String, strict: Bool? = nil, completionBlock:((Result<Search.CharacterSearchResult>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-search.search_structures.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = categories.httpQuery {
				query.append(URLQueryItem(name: "categories", value: v))
			}
			if let v = language?.httpQuery {
				query.append(URLQueryItem(name: "language", value: v))
			}
			if let v = search.httpQuery {
				query.append(URLQueryItem(name: "search", value: v))
			}
			if let v = strict?.httpQuery {
				query.append(URLQueryItem(name: "strict", value: v))
			}
			
			let url = session!.baseURL + "/v3/characters/\(characterID)/search/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Search.CharacterSearchResult>) in
					completionBlock?(response.result)
					session = nil
				}
			}
		}
		
		
		public struct CharacterSearchResult: Codable, Hashable {
			
			
			public var agent: [Int]?
			public var alliance: [Int]?
			public var character: [Int]?
			public var constellation: [Int]?
			public var corporation: [Int]?
			public var faction: [Int]?
			public var inventoryType: [Int]?
			public var region: [Int]?
			public var solarSystem: [Int]?
			public var station: [Int]?
			public var structure: [Int64]?
			
			public init(agent: [Int]?, alliance: [Int]?, character: [Int]?, constellation: [Int]?, corporation: [Int]?, faction: [Int]?, inventoryType: [Int]?, region: [Int]?, solarSystem: [Int]?, station: [Int]?, structure: [Int64]?) {
				self.agent = agent
				self.alliance = alliance
				self.character = character
				self.constellation = constellation
				self.corporation = corporation
				self.faction = faction
				self.inventoryType = inventoryType
				self.region = region
				self.solarSystem = solarSystem
				self.station = station
				self.structure = structure
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				self.agent?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.alliance?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.character?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.constellation?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.corporation?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.faction?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.inventoryType?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.region?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.solarSystem?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.station?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.structure?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}
			
			public static func ==(lhs: Search.CharacterSearchResult, rhs: Search.CharacterSearchResult) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case agent
				case alliance
				case character
				case constellation
				case corporation
				case faction
				case inventoryType = "inventory_type"
				case region
				case solarSystem = "solar_system"
				case station
				case structure
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public enum SearchCategories: String, Codable, HTTPQueryable {
			case agent = "agent"
			case alliance = "alliance"
			case character = "character"
			case constellation = "constellation"
			case corporation = "corporation"
			case faction = "faction"
			case inventoryType = "inventory_type"
			case region = "region"
			case solarSystem = "solar_system"
			case station = "station"
			case structure = "structure"
			
			public var httpQuery: String? {
				return rawValue
			}
			
		}
		
		
		public struct SearchResult: Codable, Hashable {
			
			
			public var agent: [Int]?
			public var alliance: [Int]?
			public var character: [Int]?
			public var constellation: [Int]?
			public var corporation: [Int]?
			public var faction: [Int]?
			public var inventoryType: [Int]?
			public var region: [Int]?
			public var solarSystem: [Int]?
			public var station: [Int]?
			
			public init(agent: [Int]?, alliance: [Int]?, character: [Int]?, constellation: [Int]?, corporation: [Int]?, faction: [Int]?, inventoryType: [Int]?, region: [Int]?, solarSystem: [Int]?, station: [Int]?) {
				self.agent = agent
				self.alliance = alliance
				self.character = character
				self.constellation = constellation
				self.corporation = corporation
				self.faction = faction
				self.inventoryType = inventoryType
				self.region = region
				self.solarSystem = solarSystem
				self.station = station
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				self.agent?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.alliance?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.character?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.constellation?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.corporation?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.faction?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.inventoryType?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.region?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.solarSystem?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.station?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}
			
			public static func ==(lhs: Search.SearchResult, rhs: Search.SearchResult) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case agent
				case alliance
				case character
				case constellation
				case corporation
				case faction
				case inventoryType = "inventory_type"
				case region
				case solarSystem = "solar_system"
				case station
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public enum Categories: String, Codable, HTTPQueryable {
			case agent = "agent"
			case alliance = "alliance"
			case character = "character"
			case constellation = "constellation"
			case corporation = "corporation"
			case faction = "faction"
			case inventoryType = "inventory_type"
			case region = "region"
			case solarSystem = "solar_system"
			case station = "station"
			
			public var httpQuery: String? {
				return rawValue
			}
			
		}
		
		
	}
	
}
