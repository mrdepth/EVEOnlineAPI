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
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Search.SearchResult>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func characterSearch(categories: [Search.SearchCategories], characterID: Int, language: Language? = nil, search: String, strict: Bool? = nil, completionBlock:((Result<Search.CharacterSearchResult>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
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
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Search.CharacterSearchResult>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		@objc(ESISearchCharacterSearchResult) public class CharacterSearchResult: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var agent: [Int]? = nil
			public var alliance: [Int]? = nil
			public var character: [Int]? = nil
			public var constellation: [Int]? = nil
			public var corporation: [Int]? = nil
			public var faction: [Int]? = nil
			public var inventoryType: [Int]? = nil
			public var region: [Int]? = nil
			public var solarSystem: [Int]? = nil
			public var station: [Int]? = nil
			public var structure: [Int64]? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				agent = try (dictionary["agent"] as? [Any])?.map {try Int(json: $0)}
				alliance = try (dictionary["alliance"] as? [Any])?.map {try Int(json: $0)}
				character = try (dictionary["character"] as? [Any])?.map {try Int(json: $0)}
				constellation = try (dictionary["constellation"] as? [Any])?.map {try Int(json: $0)}
				corporation = try (dictionary["corporation"] as? [Any])?.map {try Int(json: $0)}
				faction = try (dictionary["faction"] as? [Any])?.map {try Int(json: $0)}
				inventoryType = try (dictionary["inventory_type"] as? [Any])?.map {try Int(json: $0)}
				region = try (dictionary["region"] as? [Any])?.map {try Int(json: $0)}
				solarSystem = try (dictionary["solar_system"] as? [Any])?.map {try Int(json: $0)}
				station = try (dictionary["station"] as? [Any])?.map {try Int(json: $0)}
				structure = try (dictionary["structure"] as? [Any])?.map {try Int64(json: $0)}
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				agent = aDecoder.decodeObject(forKey: "agent") as? [Int]
				alliance = aDecoder.decodeObject(forKey: "alliance") as? [Int]
				character = aDecoder.decodeObject(forKey: "character") as? [Int]
				constellation = aDecoder.decodeObject(forKey: "constellation") as? [Int]
				corporation = aDecoder.decodeObject(forKey: "corporation") as? [Int]
				faction = aDecoder.decodeObject(forKey: "faction") as? [Int]
				inventoryType = aDecoder.decodeObject(forKey: "inventory_type") as? [Int]
				region = aDecoder.decodeObject(forKey: "region") as? [Int]
				solarSystem = aDecoder.decodeObject(forKey: "solar_system") as? [Int]
				station = aDecoder.decodeObject(forKey: "station") as? [Int]
				structure = aDecoder.decodeObject(forKey: "structure") as? [Int64]
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = agent {
					aCoder.encode(v, forKey: "agent")
				}
				if let v = alliance {
					aCoder.encode(v, forKey: "alliance")
				}
				if let v = character {
					aCoder.encode(v, forKey: "character")
				}
				if let v = constellation {
					aCoder.encode(v, forKey: "constellation")
				}
				if let v = corporation {
					aCoder.encode(v, forKey: "corporation")
				}
				if let v = faction {
					aCoder.encode(v, forKey: "faction")
				}
				if let v = inventoryType {
					aCoder.encode(v, forKey: "inventory_type")
				}
				if let v = region {
					aCoder.encode(v, forKey: "region")
				}
				if let v = solarSystem {
					aCoder.encode(v, forKey: "solar_system")
				}
				if let v = station {
					aCoder.encode(v, forKey: "station")
				}
				if let v = structure {
					aCoder.encode(v, forKey: "structure")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = agent?.json {
					json["agent"] = v
				}
				if let v = alliance?.json {
					json["alliance"] = v
				}
				if let v = character?.json {
					json["character"] = v
				}
				if let v = constellation?.json {
					json["constellation"] = v
				}
				if let v = corporation?.json {
					json["corporation"] = v
				}
				if let v = faction?.json {
					json["faction"] = v
				}
				if let v = inventoryType?.json {
					json["inventory_type"] = v
				}
				if let v = region?.json {
					json["region"] = v
				}
				if let v = solarSystem?.json {
					json["solar_system"] = v
				}
				if let v = station?.json {
					json["station"] = v
				}
				if let v = structure?.json {
					json["structure"] = v
				}
				return json
			}
			
			private lazy var _hashValue: Int = {
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
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Search.CharacterSearchResult, rhs: Search.CharacterSearchResult) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Search.CharacterSearchResult) {
				agent = other.agent?.flatMap { $0 }
				alliance = other.alliance?.flatMap { $0 }
				character = other.character?.flatMap { $0 }
				constellation = other.constellation?.flatMap { $0 }
				corporation = other.corporation?.flatMap { $0 }
				faction = other.faction?.flatMap { $0 }
				inventoryType = other.inventoryType?.flatMap { $0 }
				region = other.region?.flatMap { $0 }
				solarSystem = other.solarSystem?.flatMap { $0 }
				station = other.station?.flatMap { $0 }
				structure = other.structure?.flatMap { $0 }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Search.CharacterSearchResult(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? CharacterSearchResult)?.hashValue == hashValue
			}
			
		}
		
		
		public enum SearchCategories: String, JSONCoding, HTTPQueryable {
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
			
			public init() {
				self = .agent
			}
			
			public var json: Any {
				return self.rawValue
			}
			
			public init(json: Any) throws {
				guard let s = json as? String, let v = SearchCategories(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				self = v
			}
			
			public var httpQuery: String? {
				return rawValue
			}
			
		}
		
		
		@objc(ESISearchSearchResult) public class SearchResult: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var agent: [Int]? = nil
			public var alliance: [Int]? = nil
			public var character: [Int]? = nil
			public var constellation: [Int]? = nil
			public var corporation: [Int]? = nil
			public var faction: [Int]? = nil
			public var inventoryType: [Int]? = nil
			public var region: [Int]? = nil
			public var solarSystem: [Int]? = nil
			public var station: [Int]? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				agent = try (dictionary["agent"] as? [Any])?.map {try Int(json: $0)}
				alliance = try (dictionary["alliance"] as? [Any])?.map {try Int(json: $0)}
				character = try (dictionary["character"] as? [Any])?.map {try Int(json: $0)}
				constellation = try (dictionary["constellation"] as? [Any])?.map {try Int(json: $0)}
				corporation = try (dictionary["corporation"] as? [Any])?.map {try Int(json: $0)}
				faction = try (dictionary["faction"] as? [Any])?.map {try Int(json: $0)}
				inventoryType = try (dictionary["inventory_type"] as? [Any])?.map {try Int(json: $0)}
				region = try (dictionary["region"] as? [Any])?.map {try Int(json: $0)}
				solarSystem = try (dictionary["solar_system"] as? [Any])?.map {try Int(json: $0)}
				station = try (dictionary["station"] as? [Any])?.map {try Int(json: $0)}
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				agent = aDecoder.decodeObject(forKey: "agent") as? [Int]
				alliance = aDecoder.decodeObject(forKey: "alliance") as? [Int]
				character = aDecoder.decodeObject(forKey: "character") as? [Int]
				constellation = aDecoder.decodeObject(forKey: "constellation") as? [Int]
				corporation = aDecoder.decodeObject(forKey: "corporation") as? [Int]
				faction = aDecoder.decodeObject(forKey: "faction") as? [Int]
				inventoryType = aDecoder.decodeObject(forKey: "inventory_type") as? [Int]
				region = aDecoder.decodeObject(forKey: "region") as? [Int]
				solarSystem = aDecoder.decodeObject(forKey: "solar_system") as? [Int]
				station = aDecoder.decodeObject(forKey: "station") as? [Int]
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = agent {
					aCoder.encode(v, forKey: "agent")
				}
				if let v = alliance {
					aCoder.encode(v, forKey: "alliance")
				}
				if let v = character {
					aCoder.encode(v, forKey: "character")
				}
				if let v = constellation {
					aCoder.encode(v, forKey: "constellation")
				}
				if let v = corporation {
					aCoder.encode(v, forKey: "corporation")
				}
				if let v = faction {
					aCoder.encode(v, forKey: "faction")
				}
				if let v = inventoryType {
					aCoder.encode(v, forKey: "inventory_type")
				}
				if let v = region {
					aCoder.encode(v, forKey: "region")
				}
				if let v = solarSystem {
					aCoder.encode(v, forKey: "solar_system")
				}
				if let v = station {
					aCoder.encode(v, forKey: "station")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = agent?.json {
					json["agent"] = v
				}
				if let v = alliance?.json {
					json["alliance"] = v
				}
				if let v = character?.json {
					json["character"] = v
				}
				if let v = constellation?.json {
					json["constellation"] = v
				}
				if let v = corporation?.json {
					json["corporation"] = v
				}
				if let v = faction?.json {
					json["faction"] = v
				}
				if let v = inventoryType?.json {
					json["inventory_type"] = v
				}
				if let v = region?.json {
					json["region"] = v
				}
				if let v = solarSystem?.json {
					json["solar_system"] = v
				}
				if let v = station?.json {
					json["station"] = v
				}
				return json
			}
			
			private lazy var _hashValue: Int = {
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
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Search.SearchResult, rhs: Search.SearchResult) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Search.SearchResult) {
				agent = other.agent?.flatMap { $0 }
				alliance = other.alliance?.flatMap { $0 }
				character = other.character?.flatMap { $0 }
				constellation = other.constellation?.flatMap { $0 }
				corporation = other.corporation?.flatMap { $0 }
				faction = other.faction?.flatMap { $0 }
				inventoryType = other.inventoryType?.flatMap { $0 }
				region = other.region?.flatMap { $0 }
				solarSystem = other.solarSystem?.flatMap { $0 }
				station = other.station?.flatMap { $0 }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Search.SearchResult(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? SearchResult)?.hashValue == hashValue
			}
			
		}
		
		
		public enum Categories: String, JSONCoding, HTTPQueryable {
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
			
			public init() {
				self = .agent
			}
			
			public var json: Any {
				return self.rawValue
			}
			
			public init(json: Any) throws {
				guard let s = json as? String, let v = Categories(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				self = v
			}
			
			public var httpQuery: String? {
				return rawValue
			}
			
		}
		
		
	}
	
}
