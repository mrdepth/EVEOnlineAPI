import Foundation
import Alamofire
import Futures


public extension ESI {
	var search: Search {
		return Search(esi: self)
	}
	
	struct Search {
		let esi: ESI
		
		@discardableResult
		public func search(acceptLanguage: AcceptLanguage? = nil, categories: [Search.Categories], ifNoneMatch: String? = nil, language: Language? = nil, search: String, strict: Bool? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<Search.SearchResult>> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = acceptLanguage?.httpQuery {
				headers["Accept-Language"] = v
			}
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
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
			
			let url = esi.baseURL + "/search/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<Search.SearchResult>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<Search.SearchResult>) in
				promise.set(response: response, cached: 3600.0)
			}
			return promise.future
		}
		
		@discardableResult
		public func characterSearch(acceptLanguage: AcceptLanguage? = nil, categories: [Search.Categories], characterID: Int, ifNoneMatch: String? = nil, language: Language? = nil, search: String, strict: Bool? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<Search.CharacterSearchResult>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-search.search_structures.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = acceptLanguage?.httpQuery {
				headers["Accept-Language"] = v
			}
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
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
			
			let url = esi.baseURL + "/characters/\(characterID)/search/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<Search.CharacterSearchResult>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<Search.CharacterSearchResult>) in
				promise.set(response: response, cached: 3600.0)
			}
			return promise.future
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
