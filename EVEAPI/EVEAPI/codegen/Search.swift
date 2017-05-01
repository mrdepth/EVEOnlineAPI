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
		
		public func characterSearch(categories: [Search.Categories], characterID: Int, language: Language? = nil, search: String, strict: Bool? = nil, completionBlock:((Result<Search.CharacterSearchResult>) -> Void)?) {
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
			
			let url = session!.baseURL + "latest/characters/\(characterID)/search/"
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
		
		public func search(categories: [Search.SearchCategories], language: Language? = nil, search: String, strict: Bool? = nil, completionBlock:((Result<Search.SearchResult>) -> Void)?) {
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
			
			let url = session!.baseURL + "latest/search/"
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
		
		
		public class CharacterSearchResult: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var agent: [Int]? = nil
			public var alliance: [Int]? = nil
			public var character: [Int]? = nil
			public var constellation: [Int]? = nil
			public var corporation: [Int]? = nil
			public var faction: [Int]? = nil
			public var inventorytype: [Int]? = nil
			public var region: [Int]? = nil
			public var solarsystem: [Int]? = nil
			public var station: [Int]? = nil
			public var structure: [Int64]? = nil
			public var wormhole: [Int]? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				agent = try (dictionary["agent"] as? [Any])?.map {try Int(json: $0)}
				alliance = try (dictionary["alliance"] as? [Any])?.map {try Int(json: $0)}
				character = try (dictionary["character"] as? [Any])?.map {try Int(json: $0)}
				constellation = try (dictionary["constellation"] as? [Any])?.map {try Int(json: $0)}
				corporation = try (dictionary["corporation"] as? [Any])?.map {try Int(json: $0)}
				faction = try (dictionary["faction"] as? [Any])?.map {try Int(json: $0)}
				inventorytype = try (dictionary["inventorytype"] as? [Any])?.map {try Int(json: $0)}
				region = try (dictionary["region"] as? [Any])?.map {try Int(json: $0)}
				solarsystem = try (dictionary["solarsystem"] as? [Any])?.map {try Int(json: $0)}
				station = try (dictionary["station"] as? [Any])?.map {try Int(json: $0)}
				structure = try (dictionary["structure"] as? [Any])?.map {try Int64(json: $0)}
				wormhole = try (dictionary["wormhole"] as? [Any])?.map {try Int(json: $0)}
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				agent = aDecoder.decodeObject(forKey: "agent") as? [Int]
				alliance = aDecoder.decodeObject(forKey: "alliance") as? [Int]
				character = aDecoder.decodeObject(forKey: "character") as? [Int]
				constellation = aDecoder.decodeObject(forKey: "constellation") as? [Int]
				corporation = aDecoder.decodeObject(forKey: "corporation") as? [Int]
				faction = aDecoder.decodeObject(forKey: "faction") as? [Int]
				inventorytype = aDecoder.decodeObject(forKey: "inventorytype") as? [Int]
				region = aDecoder.decodeObject(forKey: "region") as? [Int]
				solarsystem = aDecoder.decodeObject(forKey: "solarsystem") as? [Int]
				station = aDecoder.decodeObject(forKey: "station") as? [Int]
				structure = aDecoder.decodeObject(forKey: "structure") as? [Int64]
				wormhole = aDecoder.decodeObject(forKey: "wormhole") as? [Int]
				
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
				if let v = inventorytype {
					aCoder.encode(v, forKey: "inventorytype")
				}
				if let v = region {
					aCoder.encode(v, forKey: "region")
				}
				if let v = solarsystem {
					aCoder.encode(v, forKey: "solarsystem")
				}
				if let v = station {
					aCoder.encode(v, forKey: "station")
				}
				if let v = structure {
					aCoder.encode(v, forKey: "structure")
				}
				if let v = wormhole {
					aCoder.encode(v, forKey: "wormhole")
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
				if let v = inventorytype?.json {
					json["inventorytype"] = v
				}
				if let v = region?.json {
					json["region"] = v
				}
				if let v = solarsystem?.json {
					json["solarsystem"] = v
				}
				if let v = station?.json {
					json["station"] = v
				}
				if let v = structure?.json {
					json["structure"] = v
				}
				if let v = wormhole?.json {
					json["wormhole"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				agent?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				alliance?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				character?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				constellation?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				corporation?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				faction?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				inventorytype?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				region?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				solarsystem?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				station?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				structure?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				wormhole?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
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
				inventorytype = other.inventorytype?.flatMap { $0 }
				region = other.region?.flatMap { $0 }
				solarsystem = other.solarsystem?.flatMap { $0 }
				station = other.station?.flatMap { $0 }
				structure = other.structure?.flatMap { $0 }
				wormhole = other.wormhole?.flatMap { $0 }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Search.CharacterSearchResult(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? CharacterSearchResult)?.hashValue == hashValue
			}
			
		}
		
		
		public class GetSearchInternalServerError: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Search.GetSearchInternalServerError, rhs: Search.GetSearchInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Search.GetSearchInternalServerError) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Search.GetSearchInternalServerError(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetSearchInternalServerError)?.hashValue == hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDSearchForbidden: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Search.GetCharactersCharacterIDSearchForbidden, rhs: Search.GetCharactersCharacterIDSearchForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Search.GetCharactersCharacterIDSearchForbidden) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Search.GetCharactersCharacterIDSearchForbidden(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCharactersCharacterIDSearchForbidden)?.hashValue == hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDSearchInternalServerError: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Search.GetCharactersCharacterIDSearchInternalServerError, rhs: Search.GetCharactersCharacterIDSearchInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Search.GetCharactersCharacterIDSearchInternalServerError) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Search.GetCharactersCharacterIDSearchInternalServerError(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCharactersCharacterIDSearchInternalServerError)?.hashValue == hashValue
			}
			
		}
		
		
		public class SearchResult: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var agent: [Int]? = nil
			public var alliance: [Int]? = nil
			public var character: [Int]? = nil
			public var constellation: [Int]? = nil
			public var corporation: [Int]? = nil
			public var faction: [Int]? = nil
			public var inventorytype: [Int]? = nil
			public var region: [Int]? = nil
			public var solarsystem: [Int]? = nil
			public var station: [Int]? = nil
			public var wormhole: [Int]? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				agent = try (dictionary["agent"] as? [Any])?.map {try Int(json: $0)}
				alliance = try (dictionary["alliance"] as? [Any])?.map {try Int(json: $0)}
				character = try (dictionary["character"] as? [Any])?.map {try Int(json: $0)}
				constellation = try (dictionary["constellation"] as? [Any])?.map {try Int(json: $0)}
				corporation = try (dictionary["corporation"] as? [Any])?.map {try Int(json: $0)}
				faction = try (dictionary["faction"] as? [Any])?.map {try Int(json: $0)}
				inventorytype = try (dictionary["inventorytype"] as? [Any])?.map {try Int(json: $0)}
				region = try (dictionary["region"] as? [Any])?.map {try Int(json: $0)}
				solarsystem = try (dictionary["solarsystem"] as? [Any])?.map {try Int(json: $0)}
				station = try (dictionary["station"] as? [Any])?.map {try Int(json: $0)}
				wormhole = try (dictionary["wormhole"] as? [Any])?.map {try Int(json: $0)}
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				agent = aDecoder.decodeObject(forKey: "agent") as? [Int]
				alliance = aDecoder.decodeObject(forKey: "alliance") as? [Int]
				character = aDecoder.decodeObject(forKey: "character") as? [Int]
				constellation = aDecoder.decodeObject(forKey: "constellation") as? [Int]
				corporation = aDecoder.decodeObject(forKey: "corporation") as? [Int]
				faction = aDecoder.decodeObject(forKey: "faction") as? [Int]
				inventorytype = aDecoder.decodeObject(forKey: "inventorytype") as? [Int]
				region = aDecoder.decodeObject(forKey: "region") as? [Int]
				solarsystem = aDecoder.decodeObject(forKey: "solarsystem") as? [Int]
				station = aDecoder.decodeObject(forKey: "station") as? [Int]
				wormhole = aDecoder.decodeObject(forKey: "wormhole") as? [Int]
				
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
				if let v = inventorytype {
					aCoder.encode(v, forKey: "inventorytype")
				}
				if let v = region {
					aCoder.encode(v, forKey: "region")
				}
				if let v = solarsystem {
					aCoder.encode(v, forKey: "solarsystem")
				}
				if let v = station {
					aCoder.encode(v, forKey: "station")
				}
				if let v = wormhole {
					aCoder.encode(v, forKey: "wormhole")
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
				if let v = inventorytype?.json {
					json["inventorytype"] = v
				}
				if let v = region?.json {
					json["region"] = v
				}
				if let v = solarsystem?.json {
					json["solarsystem"] = v
				}
				if let v = station?.json {
					json["station"] = v
				}
				if let v = wormhole?.json {
					json["wormhole"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				agent?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				alliance?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				character?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				constellation?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				corporation?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				faction?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				inventorytype?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				region?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				solarsystem?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				station?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				wormhole?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
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
				inventorytype = other.inventorytype?.flatMap { $0 }
				region = other.region?.flatMap { $0 }
				solarsystem = other.solarsystem?.flatMap { $0 }
				station = other.station?.flatMap { $0 }
				wormhole = other.wormhole?.flatMap { $0 }
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
			case inventorytype = "inventorytype"
			case region = "region"
			case solarsystem = "solarsystem"
			case station = "station"
			case structure = "structure"
			case wormhole = "wormhole"
			
			public init() {
				self = .agent
			}
			
			public var json: Any {
				return self.rawValue
			}
			
			public init(json: Any) throws {
				guard let s = json as? String, let v = Categories(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
				self = v
			}
			
			public var httpQuery: String? {
				return rawValue
			}
			
		}
		
		
		public enum SearchCategories: String, JSONCoding, HTTPQueryable {
			case agent = "agent"
			case alliance = "alliance"
			case character = "character"
			case constellation = "constellation"
			case corporation = "corporation"
			case faction = "faction"
			case inventorytype = "inventorytype"
			case region = "region"
			case solarsystem = "solarsystem"
			case station = "station"
			case wormhole = "wormhole"
			
			public init() {
				self = .agent
			}
			
			public var json: Any {
				return self.rawValue
			}
			
			public init(json: Any) throws {
				guard let s = json as? String, let v = SearchCategories(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
				self = v
			}
			
			public var httpQuery: String? {
				return rawValue
			}
			
		}
		
		
	}
	
}
