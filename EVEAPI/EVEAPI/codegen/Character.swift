import Foundation
import Alamofire


public extension ESI {
	public var character: Character {
		return Character(sessionManager: self)
	}
	
	class Character {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		public func getMedals(characterID: Int, completionBlock:((Result<[Character.Medal]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-characters.read_medals.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/medals/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Character.Medal]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getStandings(characterID: Int, completionBlock:((Result<[Character.Standing]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-characters.read_standings.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/standings/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Character.Standing]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getBlueprints(characterID: Int, completionBlock:((Result<[Character.Blueprint]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-characters.read_blueprints.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/blueprints/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Character.Blueprint]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func calculateCSPAChargeCost(characterID: Int, characters: Character.Characters, completionBlock:((Result<Character.CSPAChargeCost>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-characters.read_contacts.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body = try? JSONSerialization.data(withJSONObject: characters.json, options: [])
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/cspa/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Character.CSPAChargeCost>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getCharacterNames(characterIds: [Int64], completionBlock:((Result<[Character.Name]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = characterIds.httpQuery {
				query.append(URLQueryItem(name: "character_ids", value: v))
			}
			
			let url = session!.baseURL + "latest/characters/names/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Character.Name]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getAgentsResearch(characterID: Int, completionBlock:((Result<[Character.Research]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-characters.read_agents_research.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/agents_research/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Character.Research]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getCharacterCorporationRoles(characterID: Int, completionBlock:((Result<[Character.Role]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-characters.read_corporation_roles.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/roles/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Character.Role]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func characterAffiliation(characters: [Int], completionBlock:((Result<[Character.Affiliation]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body = try? JSONSerialization.data(withJSONObject: characters.json, options: [])
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/characters/affiliation/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Character.Affiliation]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getChatChannels(characterID: Int, completionBlock:((Result<[Character.ChatChannel]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-characters.read_chat_channels.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/chat_channels/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Character.ChatChannel]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getCharacterPortraits(characterID: Int, completionBlock:((Result<Character.Portrait>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/portrait/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Character.Portrait>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getCorporationHistory(characterID: Int, completionBlock:((Result<[Character.CorporationHistory]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/corporationhistory/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Character.CorporationHistory]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getCharactersPublicInformation(characterID: Int, completionBlock:((Result<Character.Information>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Character.Information>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getJumpFatigue(characterID: Int, completionBlock:((Result<Character.Fatigue>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-characters.read_fatigue.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/fatigue/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Character.Fatigue>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		public class PostCharactersAffiliationUnprocessableEntity: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.error?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Character.PostCharactersAffiliationUnprocessableEntity, rhs: Character.PostCharactersAffiliationUnprocessableEntity) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Character.PostCharactersAffiliationUnprocessableEntity) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Character.PostCharactersAffiliationUnprocessableEntity(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? PostCharactersAffiliationUnprocessableEntity)?.hashValue == hashValue
			}
			
		}
		
		
		public class Portrait: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var px128x128: String? = nil
			public var px256x256: String? = nil
			public var px512x512: String? = nil
			public var px64x64: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				px128x128 = dictionary["px128x128"] as? String
				px256x256 = dictionary["px256x256"] as? String
				px512x512 = dictionary["px512x512"] as? String
				px64x64 = dictionary["px64x64"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				px128x128 = aDecoder.decodeObject(forKey: "px128x128") as? String
				px256x256 = aDecoder.decodeObject(forKey: "px256x256") as? String
				px512x512 = aDecoder.decodeObject(forKey: "px512x512") as? String
				px64x64 = aDecoder.decodeObject(forKey: "px64x64") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = px128x128 {
					aCoder.encode(v, forKey: "px128x128")
				}
				if let v = px256x256 {
					aCoder.encode(v, forKey: "px256x256")
				}
				if let v = px512x512 {
					aCoder.encode(v, forKey: "px512x512")
				}
				if let v = px64x64 {
					aCoder.encode(v, forKey: "px64x64")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = px128x128?.json {
					json["px128x128"] = v
				}
				if let v = px256x256?.json {
					json["px256x256"] = v
				}
				if let v = px512x512?.json {
					json["px512x512"] = v
				}
				if let v = px64x64?.json {
					json["px64x64"] = v
				}
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.px128x128?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.px256x256?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.px512x512?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.px64x64?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Character.Portrait, rhs: Character.Portrait) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Character.Portrait) {
				px128x128 = other.px128x128
				px256x256 = other.px256x256
				px512x512 = other.px512x512
				px64x64 = other.px64x64
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Character.Portrait(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Portrait)?.hashValue == hashValue
			}
			
		}
		
		
		public class CSPAChargeCost: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var cost: Int64? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				cost = dictionary["cost"] as? Int64
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				cost = aDecoder.containsValue(forKey: "cost") ? aDecoder.decodeInt64(forKey: "cost") : nil
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = cost {
					aCoder.encode(v, forKey: "cost")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = cost?.json {
					json["cost"] = v
				}
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.cost?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Character.CSPAChargeCost, rhs: Character.CSPAChargeCost) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Character.CSPAChargeCost) {
				cost = other.cost
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Character.CSPAChargeCost(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? CSPAChargeCost)?.hashValue == hashValue
			}
			
		}
		
		
		public class Fatigue: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var jumpFatigueExpireDate: Date? = nil
			public var lastJumpDate: Date? = nil
			public var lastUpdateDate: Date? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				jumpFatigueExpireDate = DateFormatter.esiDateTimeFormatter.date(from: dictionary["jump_fatigue_expire_date"] as? String ?? "")
				lastJumpDate = DateFormatter.esiDateTimeFormatter.date(from: dictionary["last_jump_date"] as? String ?? "")
				lastUpdateDate = DateFormatter.esiDateTimeFormatter.date(from: dictionary["last_update_date"] as? String ?? "")
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				jumpFatigueExpireDate = aDecoder.decodeObject(forKey: "jump_fatigue_expire_date") as? Date
				lastJumpDate = aDecoder.decodeObject(forKey: "last_jump_date") as? Date
				lastUpdateDate = aDecoder.decodeObject(forKey: "last_update_date") as? Date
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = jumpFatigueExpireDate {
					aCoder.encode(v, forKey: "jump_fatigue_expire_date")
				}
				if let v = lastJumpDate {
					aCoder.encode(v, forKey: "last_jump_date")
				}
				if let v = lastUpdateDate {
					aCoder.encode(v, forKey: "last_update_date")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = jumpFatigueExpireDate?.json {
					json["jump_fatigue_expire_date"] = v
				}
				if let v = lastJumpDate?.json {
					json["last_jump_date"] = v
				}
				if let v = lastUpdateDate?.json {
					json["last_update_date"] = v
				}
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.jumpFatigueExpireDate?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.lastJumpDate?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.lastUpdateDate?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Character.Fatigue, rhs: Character.Fatigue) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Character.Fatigue) {
				jumpFatigueExpireDate = other.jumpFatigueExpireDate
				lastJumpDate = other.lastJumpDate
				lastUpdateDate = other.lastUpdateDate
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Character.Fatigue(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Fatigue)?.hashValue == hashValue
			}
			
		}
		
		
		public class Characters: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var characters: [Int] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				characters = try (dictionary["characters"] as? [Any])?.map {try Int(json: $0)} ?? []
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				characters = aDecoder.decodeObject(forKey: "characters") as? [Int] ?? []
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(characters, forKey: "characters")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["characters"] = characters.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.characters.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Character.Characters, rhs: Character.Characters) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Character.Characters) {
				characters = other.characters.flatMap { $0 }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Character.Characters(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Characters)?.hashValue == hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDNotFound: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.error?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Character.GetCharactersCharacterIDNotFound, rhs: Character.GetCharactersCharacterIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Character.GetCharactersCharacterIDNotFound) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Character.GetCharactersCharacterIDNotFound(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCharactersCharacterIDNotFound)?.hashValue == hashValue
			}
			
		}
		
		
		public class ChatChannel: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public enum GetCharactersCharacterIDChatChannelsAccessorType: String, JSONCoding, HTTPQueryable {
				case alliance = "alliance"
				case character = "character"
				case corporation = "corporation"
				
				public init() {
					self = .character
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCharactersCharacterIDChatChannelsAccessorType(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public class GetCharactersCharacterIDChatChannelsBlocked: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var accessorID: Int = Int()
				public var accessorType: Character.ChatChannel.GetCharactersCharacterIDChatChannelsAccessorType = Character.ChatChannel.GetCharactersCharacterIDChatChannelsAccessorType()
				public var endAt: Date? = nil
				public var reason: String? = nil
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let accessorID = dictionary["accessor_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.accessorID = accessorID
					guard let accessorType = Character.ChatChannel.GetCharactersCharacterIDChatChannelsAccessorType(rawValue: dictionary["accessor_type"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.accessorType = accessorType
					endAt = DateFormatter.esiDateTimeFormatter.date(from: dictionary["end_at"] as? String ?? "")
					reason = dictionary["reason"] as? String
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					accessorID = aDecoder.decodeInteger(forKey: "accessor_id")
					accessorType = Character.ChatChannel.GetCharactersCharacterIDChatChannelsAccessorType(rawValue: aDecoder.decodeObject(forKey: "accessor_type") as? String ?? "") ?? Character.ChatChannel.GetCharactersCharacterIDChatChannelsAccessorType()
					endAt = aDecoder.decodeObject(forKey: "end_at") as? Date
					reason = aDecoder.decodeObject(forKey: "reason") as? String
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(accessorID, forKey: "accessor_id")
					aCoder.encode(accessorType.rawValue, forKey: "accessor_type")
					if let v = endAt {
						aCoder.encode(v, forKey: "end_at")
					}
					if let v = reason {
						aCoder.encode(v, forKey: "reason")
					}
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["accessor_id"] = accessorID.json
					json["accessor_type"] = accessorType.json
					if let v = endAt?.json {
						json["end_at"] = v
					}
					if let v = reason?.json {
						json["reason"] = v
					}
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.accessorID.hashValue)
					hashCombine(seed: &hash, value: self.accessorType.hashValue)
					hashCombine(seed: &hash, value: self.endAt?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.reason?.hashValue ?? 0)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: Character.ChatChannel.GetCharactersCharacterIDChatChannelsBlocked, rhs: Character.ChatChannel.GetCharactersCharacterIDChatChannelsBlocked) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Character.ChatChannel.GetCharactersCharacterIDChatChannelsBlocked) {
					accessorID = other.accessorID
					accessorType = other.accessorType
					endAt = other.endAt
					reason = other.reason
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Character.ChatChannel.GetCharactersCharacterIDChatChannelsBlocked(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetCharactersCharacterIDChatChannelsBlocked)?.hashValue == hashValue
				}
				
			}
			
			public class GetCharactersCharacterIDChatChannelsOperators: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var accessorID: Int = Int()
				public var accessorType: Character.ChatChannel.GetCharactersCharacterIDChatChannelsAccessorType = Character.ChatChannel.GetCharactersCharacterIDChatChannelsAccessorType()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let accessorID = dictionary["accessor_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.accessorID = accessorID
					guard let accessorType = Character.ChatChannel.GetCharactersCharacterIDChatChannelsAccessorType(rawValue: dictionary["accessor_type"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.accessorType = accessorType
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					accessorID = aDecoder.decodeInteger(forKey: "accessor_id")
					accessorType = Character.ChatChannel.GetCharactersCharacterIDChatChannelsAccessorType(rawValue: aDecoder.decodeObject(forKey: "accessor_type") as? String ?? "") ?? Character.ChatChannel.GetCharactersCharacterIDChatChannelsAccessorType()
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(accessorID, forKey: "accessor_id")
					aCoder.encode(accessorType.rawValue, forKey: "accessor_type")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["accessor_id"] = accessorID.json
					json["accessor_type"] = accessorType.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.accessorID.hashValue)
					hashCombine(seed: &hash, value: self.accessorType.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: Character.ChatChannel.GetCharactersCharacterIDChatChannelsOperators, rhs: Character.ChatChannel.GetCharactersCharacterIDChatChannelsOperators) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Character.ChatChannel.GetCharactersCharacterIDChatChannelsOperators) {
					accessorID = other.accessorID
					accessorType = other.accessorType
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Character.ChatChannel.GetCharactersCharacterIDChatChannelsOperators(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetCharactersCharacterIDChatChannelsOperators)?.hashValue == hashValue
				}
				
			}
			
			public class GetCharactersCharacterIDChatChannelsAllowed: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var accessorID: Int = Int()
				public var accessorType: Character.ChatChannel.GetCharactersCharacterIDChatChannelsAccessorType = Character.ChatChannel.GetCharactersCharacterIDChatChannelsAccessorType()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let accessorID = dictionary["accessor_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.accessorID = accessorID
					guard let accessorType = Character.ChatChannel.GetCharactersCharacterIDChatChannelsAccessorType(rawValue: dictionary["accessor_type"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.accessorType = accessorType
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					accessorID = aDecoder.decodeInteger(forKey: "accessor_id")
					accessorType = Character.ChatChannel.GetCharactersCharacterIDChatChannelsAccessorType(rawValue: aDecoder.decodeObject(forKey: "accessor_type") as? String ?? "") ?? Character.ChatChannel.GetCharactersCharacterIDChatChannelsAccessorType()
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(accessorID, forKey: "accessor_id")
					aCoder.encode(accessorType.rawValue, forKey: "accessor_type")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["accessor_id"] = accessorID.json
					json["accessor_type"] = accessorType.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.accessorID.hashValue)
					hashCombine(seed: &hash, value: self.accessorType.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: Character.ChatChannel.GetCharactersCharacterIDChatChannelsAllowed, rhs: Character.ChatChannel.GetCharactersCharacterIDChatChannelsAllowed) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Character.ChatChannel.GetCharactersCharacterIDChatChannelsAllowed) {
					accessorID = other.accessorID
					accessorType = other.accessorType
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Character.ChatChannel.GetCharactersCharacterIDChatChannelsAllowed(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetCharactersCharacterIDChatChannelsAllowed)?.hashValue == hashValue
				}
				
			}
			
			public class GetCharactersCharacterIDChatChannelsMuted: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var accessorID: Int = Int()
				public var accessorType: Character.ChatChannel.GetCharactersCharacterIDChatChannelsAccessorType = Character.ChatChannel.GetCharactersCharacterIDChatChannelsAccessorType()
				public var endAt: Date? = nil
				public var reason: String? = nil
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let accessorID = dictionary["accessor_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.accessorID = accessorID
					guard let accessorType = Character.ChatChannel.GetCharactersCharacterIDChatChannelsAccessorType(rawValue: dictionary["accessor_type"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.accessorType = accessorType
					endAt = DateFormatter.esiDateTimeFormatter.date(from: dictionary["end_at"] as? String ?? "")
					reason = dictionary["reason"] as? String
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					accessorID = aDecoder.decodeInteger(forKey: "accessor_id")
					accessorType = Character.ChatChannel.GetCharactersCharacterIDChatChannelsAccessorType(rawValue: aDecoder.decodeObject(forKey: "accessor_type") as? String ?? "") ?? Character.ChatChannel.GetCharactersCharacterIDChatChannelsAccessorType()
					endAt = aDecoder.decodeObject(forKey: "end_at") as? Date
					reason = aDecoder.decodeObject(forKey: "reason") as? String
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(accessorID, forKey: "accessor_id")
					aCoder.encode(accessorType.rawValue, forKey: "accessor_type")
					if let v = endAt {
						aCoder.encode(v, forKey: "end_at")
					}
					if let v = reason {
						aCoder.encode(v, forKey: "reason")
					}
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["accessor_id"] = accessorID.json
					json["accessor_type"] = accessorType.json
					if let v = endAt?.json {
						json["end_at"] = v
					}
					if let v = reason?.json {
						json["reason"] = v
					}
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.accessorID.hashValue)
					hashCombine(seed: &hash, value: self.accessorType.hashValue)
					hashCombine(seed: &hash, value: self.endAt?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.reason?.hashValue ?? 0)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: Character.ChatChannel.GetCharactersCharacterIDChatChannelsMuted, rhs: Character.ChatChannel.GetCharactersCharacterIDChatChannelsMuted) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Character.ChatChannel.GetCharactersCharacterIDChatChannelsMuted) {
					accessorID = other.accessorID
					accessorType = other.accessorType
					endAt = other.endAt
					reason = other.reason
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Character.ChatChannel.GetCharactersCharacterIDChatChannelsMuted(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetCharactersCharacterIDChatChannelsMuted)?.hashValue == hashValue
				}
				
			}
			
			public var allowed: [Character.ChatChannel.GetCharactersCharacterIDChatChannelsAllowed] = []
			public var blocked: [Character.ChatChannel.GetCharactersCharacterIDChatChannelsBlocked] = []
			public var channelID: Int = Int()
			public var comparisonKey: String = String()
			public var hasPassword: Bool = Bool()
			public var motd: String = String()
			public var muted: [Character.ChatChannel.GetCharactersCharacterIDChatChannelsMuted] = []
			public var name: String = String()
			public var operators: [Character.ChatChannel.GetCharactersCharacterIDChatChannelsOperators] = []
			public var ownerID: Int = Int()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				allowed = try (dictionary["allowed"] as? [Any])?.map {try Character.ChatChannel.GetCharactersCharacterIDChatChannelsAllowed(json: $0)} ?? []
				blocked = try (dictionary["blocked"] as? [Any])?.map {try Character.ChatChannel.GetCharactersCharacterIDChatChannelsBlocked(json: $0)} ?? []
				guard let channelID = dictionary["channel_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.channelID = channelID
				guard let comparisonKey = dictionary["comparison_key"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.comparisonKey = comparisonKey
				guard let hasPassword = dictionary["has_password"] as? Bool else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.hasPassword = hasPassword
				guard let motd = dictionary["motd"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.motd = motd
				muted = try (dictionary["muted"] as? [Any])?.map {try Character.ChatChannel.GetCharactersCharacterIDChatChannelsMuted(json: $0)} ?? []
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.name = name
				operators = try (dictionary["operators"] as? [Any])?.map {try Character.ChatChannel.GetCharactersCharacterIDChatChannelsOperators(json: $0)} ?? []
				guard let ownerID = dictionary["owner_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.ownerID = ownerID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				allowed = aDecoder.decodeObject(of: [Character.ChatChannel.GetCharactersCharacterIDChatChannelsAllowed.self], forKey: "allowed") as? [Character.ChatChannel.GetCharactersCharacterIDChatChannelsAllowed] ?? []
				blocked = aDecoder.decodeObject(of: [Character.ChatChannel.GetCharactersCharacterIDChatChannelsBlocked.self], forKey: "blocked") as? [Character.ChatChannel.GetCharactersCharacterIDChatChannelsBlocked] ?? []
				channelID = aDecoder.decodeInteger(forKey: "channel_id")
				comparisonKey = aDecoder.decodeObject(forKey: "comparison_key") as? String ?? String()
				hasPassword = aDecoder.decodeBool(forKey: "has_password")
				motd = aDecoder.decodeObject(forKey: "motd") as? String ?? String()
				muted = aDecoder.decodeObject(of: [Character.ChatChannel.GetCharactersCharacterIDChatChannelsMuted.self], forKey: "muted") as? [Character.ChatChannel.GetCharactersCharacterIDChatChannelsMuted] ?? []
				name = aDecoder.decodeObject(forKey: "name") as? String ?? String()
				operators = aDecoder.decodeObject(of: [Character.ChatChannel.GetCharactersCharacterIDChatChannelsOperators.self], forKey: "operators") as? [Character.ChatChannel.GetCharactersCharacterIDChatChannelsOperators] ?? []
				ownerID = aDecoder.decodeInteger(forKey: "owner_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(allowed, forKey: "allowed")
				aCoder.encode(blocked, forKey: "blocked")
				aCoder.encode(channelID, forKey: "channel_id")
				aCoder.encode(comparisonKey, forKey: "comparison_key")
				aCoder.encode(hasPassword, forKey: "has_password")
				aCoder.encode(motd, forKey: "motd")
				aCoder.encode(muted, forKey: "muted")
				aCoder.encode(name, forKey: "name")
				aCoder.encode(operators, forKey: "operators")
				aCoder.encode(ownerID, forKey: "owner_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["allowed"] = allowed.json
				json["blocked"] = blocked.json
				json["channel_id"] = channelID.json
				json["comparison_key"] = comparisonKey.json
				json["has_password"] = hasPassword.json
				json["motd"] = motd.json
				json["muted"] = muted.json
				json["name"] = name.json
				json["operators"] = operators.json
				json["owner_id"] = ownerID.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.allowed.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.blocked.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: self.channelID.hashValue)
				hashCombine(seed: &hash, value: self.comparisonKey.hashValue)
				hashCombine(seed: &hash, value: self.hasPassword.hashValue)
				hashCombine(seed: &hash, value: self.motd.hashValue)
				self.muted.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: self.name.hashValue)
				self.operators.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: self.ownerID.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Character.ChatChannel, rhs: Character.ChatChannel) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Character.ChatChannel) {
				allowed = other.allowed.flatMap { Character.ChatChannel.GetCharactersCharacterIDChatChannelsAllowed($0) }
				blocked = other.blocked.flatMap { Character.ChatChannel.GetCharactersCharacterIDChatChannelsBlocked($0) }
				channelID = other.channelID
				comparisonKey = other.comparisonKey
				hasPassword = other.hasPassword
				motd = other.motd
				muted = other.muted.flatMap { Character.ChatChannel.GetCharactersCharacterIDChatChannelsMuted($0) }
				name = other.name
				operators = other.operators.flatMap { Character.ChatChannel.GetCharactersCharacterIDChatChannelsOperators($0) }
				ownerID = other.ownerID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Character.ChatChannel(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? ChatChannel)?.hashValue == hashValue
			}
			
		}
		
		
		public class Standing: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public enum GetCharactersCharacterIDStandingsFromType: String, JSONCoding, HTTPQueryable {
				case agent = "agent"
				case faction = "faction"
				case npcCorp = "npc_corp"
				
				public init() {
					self = .agent
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCharactersCharacterIDStandingsFromType(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var fromID: Int = Int()
			public var fromType: Character.Standing.GetCharactersCharacterIDStandingsFromType = Character.Standing.GetCharactersCharacterIDStandingsFromType()
			public var standing: Float = Float()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let fromID = dictionary["from_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.fromID = fromID
				guard let fromType = Character.Standing.GetCharactersCharacterIDStandingsFromType(rawValue: dictionary["from_type"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.fromType = fromType
				guard let standing = dictionary["standing"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.standing = standing
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				fromID = aDecoder.decodeInteger(forKey: "from_id")
				fromType = Character.Standing.GetCharactersCharacterIDStandingsFromType(rawValue: aDecoder.decodeObject(forKey: "from_type") as? String ?? "") ?? Character.Standing.GetCharactersCharacterIDStandingsFromType()
				standing = aDecoder.decodeFloat(forKey: "standing")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(fromID, forKey: "from_id")
				aCoder.encode(fromType.rawValue, forKey: "from_type")
				aCoder.encode(standing, forKey: "standing")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["from_id"] = fromID.json
				json["from_type"] = fromType.json
				json["standing"] = standing.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.fromID.hashValue)
				hashCombine(seed: &hash, value: self.fromType.hashValue)
				hashCombine(seed: &hash, value: self.standing.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Character.Standing, rhs: Character.Standing) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Character.Standing) {
				fromID = other.fromID
				fromType = other.fromType
				standing = other.standing
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Character.Standing(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Standing)?.hashValue == hashValue
			}
			
		}
		
		
		public class Information: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public enum GetCharactersCharacterIDGender: String, JSONCoding, HTTPQueryable {
				case female = "female"
				case male = "male"
				
				public init() {
					self = .female
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCharactersCharacterIDGender(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var allianceID: Int? = nil
			public var ancestryID: Int? = nil
			public var birthday: Date = Date()
			public var bloodlineID: Int = Int()
			public var corporationID: Int = Int()
			public var localizedDescription: String? = nil
			public var gender: Character.Information.GetCharactersCharacterIDGender = Character.Information.GetCharactersCharacterIDGender()
			public var name: String = String()
			public var raceID: Int = Int()
			public var securityStatus: Float? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				allianceID = dictionary["alliance_id"] as? Int
				ancestryID = dictionary["ancestry_id"] as? Int
				guard let birthday = DateFormatter.esiDateTimeFormatter.date(from: dictionary["birthday"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.birthday = birthday
				guard let bloodlineID = dictionary["bloodline_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.bloodlineID = bloodlineID
				guard let corporationID = dictionary["corporation_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.corporationID = corporationID
				localizedDescription = dictionary["description"] as? String
				guard let gender = Character.Information.GetCharactersCharacterIDGender(rawValue: dictionary["gender"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.gender = gender
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.name = name
				guard let raceID = dictionary["race_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.raceID = raceID
				securityStatus = dictionary["security_status"] as? Float
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				allianceID = aDecoder.containsValue(forKey: "alliance_id") ? aDecoder.decodeInteger(forKey: "alliance_id") : nil
				ancestryID = aDecoder.containsValue(forKey: "ancestry_id") ? aDecoder.decodeInteger(forKey: "ancestry_id") : nil
				birthday = aDecoder.decodeObject(forKey: "birthday") as? Date ?? Date()
				bloodlineID = aDecoder.decodeInteger(forKey: "bloodline_id")
				corporationID = aDecoder.decodeInteger(forKey: "corporation_id")
				localizedDescription = aDecoder.decodeObject(forKey: "description") as? String
				gender = Character.Information.GetCharactersCharacterIDGender(rawValue: aDecoder.decodeObject(forKey: "gender") as? String ?? "") ?? Character.Information.GetCharactersCharacterIDGender()
				name = aDecoder.decodeObject(forKey: "name") as? String ?? String()
				raceID = aDecoder.decodeInteger(forKey: "race_id")
				securityStatus = aDecoder.containsValue(forKey: "security_status") ? aDecoder.decodeFloat(forKey: "security_status") : nil
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = allianceID {
					aCoder.encode(v, forKey: "alliance_id")
				}
				if let v = ancestryID {
					aCoder.encode(v, forKey: "ancestry_id")
				}
				aCoder.encode(birthday, forKey: "birthday")
				aCoder.encode(bloodlineID, forKey: "bloodline_id")
				aCoder.encode(corporationID, forKey: "corporation_id")
				if let v = localizedDescription {
					aCoder.encode(v, forKey: "description")
				}
				aCoder.encode(gender.rawValue, forKey: "gender")
				aCoder.encode(name, forKey: "name")
				aCoder.encode(raceID, forKey: "race_id")
				if let v = securityStatus {
					aCoder.encode(v, forKey: "security_status")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = allianceID?.json {
					json["alliance_id"] = v
				}
				if let v = ancestryID?.json {
					json["ancestry_id"] = v
				}
				json["birthday"] = birthday.json
				json["bloodline_id"] = bloodlineID.json
				json["corporation_id"] = corporationID.json
				if let v = localizedDescription?.json {
					json["description"] = v
				}
				json["gender"] = gender.json
				json["name"] = name.json
				json["race_id"] = raceID.json
				if let v = securityStatus?.json {
					json["security_status"] = v
				}
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.allianceID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.ancestryID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.birthday.hashValue)
				hashCombine(seed: &hash, value: self.bloodlineID.hashValue)
				hashCombine(seed: &hash, value: self.corporationID.hashValue)
				hashCombine(seed: &hash, value: self.localizedDescription?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.gender.hashValue)
				hashCombine(seed: &hash, value: self.name.hashValue)
				hashCombine(seed: &hash, value: self.raceID.hashValue)
				hashCombine(seed: &hash, value: self.securityStatus?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Character.Information, rhs: Character.Information) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Character.Information) {
				allianceID = other.allianceID
				ancestryID = other.ancestryID
				birthday = other.birthday
				bloodlineID = other.bloodlineID
				corporationID = other.corporationID
				localizedDescription = other.localizedDescription
				gender = other.gender
				name = other.name
				raceID = other.raceID
				securityStatus = other.securityStatus
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Character.Information(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Information)?.hashValue == hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDPortraitNotFound: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.error?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Character.GetCharactersCharacterIDPortraitNotFound, rhs: Character.GetCharactersCharacterIDPortraitNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Character.GetCharactersCharacterIDPortraitNotFound) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Character.GetCharactersCharacterIDPortraitNotFound(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCharactersCharacterIDPortraitNotFound)?.hashValue == hashValue
			}
			
		}
		
		
		public class Research: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var agentID: Int = Int()
			public var pointsPerDay: Float = Float()
			public var remainderPoints: Float = Float()
			public var skillTypeID: Int = Int()
			public var startedAt: Date = Date()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let agentID = dictionary["agent_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.agentID = agentID
				guard let pointsPerDay = dictionary["points_per_day"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.pointsPerDay = pointsPerDay
				guard let remainderPoints = dictionary["remainder_points"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.remainderPoints = remainderPoints
				guard let skillTypeID = dictionary["skill_type_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.skillTypeID = skillTypeID
				guard let startedAt = DateFormatter.esiDateTimeFormatter.date(from: dictionary["started_at"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.startedAt = startedAt
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				agentID = aDecoder.decodeInteger(forKey: "agent_id")
				pointsPerDay = aDecoder.decodeFloat(forKey: "points_per_day")
				remainderPoints = aDecoder.decodeFloat(forKey: "remainder_points")
				skillTypeID = aDecoder.decodeInteger(forKey: "skill_type_id")
				startedAt = aDecoder.decodeObject(forKey: "started_at") as? Date ?? Date()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(agentID, forKey: "agent_id")
				aCoder.encode(pointsPerDay, forKey: "points_per_day")
				aCoder.encode(remainderPoints, forKey: "remainder_points")
				aCoder.encode(skillTypeID, forKey: "skill_type_id")
				aCoder.encode(startedAt, forKey: "started_at")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["agent_id"] = agentID.json
				json["points_per_day"] = pointsPerDay.json
				json["remainder_points"] = remainderPoints.json
				json["skill_type_id"] = skillTypeID.json
				json["started_at"] = startedAt.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.agentID.hashValue)
				hashCombine(seed: &hash, value: self.pointsPerDay.hashValue)
				hashCombine(seed: &hash, value: self.remainderPoints.hashValue)
				hashCombine(seed: &hash, value: self.skillTypeID.hashValue)
				hashCombine(seed: &hash, value: self.startedAt.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Character.Research, rhs: Character.Research) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Character.Research) {
				agentID = other.agentID
				pointsPerDay = other.pointsPerDay
				remainderPoints = other.remainderPoints
				skillTypeID = other.skillTypeID
				startedAt = other.startedAt
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Character.Research(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Research)?.hashValue == hashValue
			}
			
		}
		
		
		public class Medal: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public enum GetCharactersCharacterIDMedalsStatus: String, JSONCoding, HTTPQueryable {
				case `private` = "private"
				case `public` = "public"
				
				public init() {
					self = .`public`
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCharactersCharacterIDMedalsStatus(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public class GetCharactersCharacterIDMedalsGraphics: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var color: Int? = nil
				public var graphic: String = String()
				public var layer: Int = Int()
				public var part: Int = Int()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					color = dictionary["color"] as? Int
					guard let graphic = dictionary["graphic"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.graphic = graphic
					guard let layer = dictionary["layer"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.layer = layer
					guard let part = dictionary["part"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.part = part
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					color = aDecoder.containsValue(forKey: "color") ? aDecoder.decodeInteger(forKey: "color") : nil
					graphic = aDecoder.decodeObject(forKey: "graphic") as? String ?? String()
					layer = aDecoder.decodeInteger(forKey: "layer")
					part = aDecoder.decodeInteger(forKey: "part")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					if let v = color {
						aCoder.encode(v, forKey: "color")
					}
					aCoder.encode(graphic, forKey: "graphic")
					aCoder.encode(layer, forKey: "layer")
					aCoder.encode(part, forKey: "part")
				}
				
				public var json: Any {
					var json = [String: Any]()
					if let v = color?.json {
						json["color"] = v
					}
					json["graphic"] = graphic.json
					json["layer"] = layer.json
					json["part"] = part.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.color?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.graphic.hashValue)
					hashCombine(seed: &hash, value: self.layer.hashValue)
					hashCombine(seed: &hash, value: self.part.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: Character.Medal.GetCharactersCharacterIDMedalsGraphics, rhs: Character.Medal.GetCharactersCharacterIDMedalsGraphics) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Character.Medal.GetCharactersCharacterIDMedalsGraphics) {
					color = other.color
					graphic = other.graphic
					layer = other.layer
					part = other.part
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Character.Medal.GetCharactersCharacterIDMedalsGraphics(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetCharactersCharacterIDMedalsGraphics)?.hashValue == hashValue
				}
				
			}
			
			public var corporationID: Int = Int()
			public var date: Date = Date()
			public var localizedDescription: String = String()
			public var graphics: [Character.Medal.GetCharactersCharacterIDMedalsGraphics] = []
			public var issuerID: Int = Int()
			public var medalID: Int = Int()
			public var reason: String = String()
			public var status: Character.Medal.GetCharactersCharacterIDMedalsStatus = Character.Medal.GetCharactersCharacterIDMedalsStatus()
			public var title: String = String()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let corporationID = dictionary["corporation_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.corporationID = corporationID
				guard let date = DateFormatter.esiDateTimeFormatter.date(from: dictionary["date"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.date = date
				guard let localizedDescription = dictionary["description"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.localizedDescription = localizedDescription
				graphics = try (dictionary["graphics"] as? [Any])?.map {try Character.Medal.GetCharactersCharacterIDMedalsGraphics(json: $0)} ?? []
				guard let issuerID = dictionary["issuer_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.issuerID = issuerID
				guard let medalID = dictionary["medal_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.medalID = medalID
				guard let reason = dictionary["reason"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.reason = reason
				guard let status = Character.Medal.GetCharactersCharacterIDMedalsStatus(rawValue: dictionary["status"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.status = status
				guard let title = dictionary["title"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.title = title
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				corporationID = aDecoder.decodeInteger(forKey: "corporation_id")
				date = aDecoder.decodeObject(forKey: "date") as? Date ?? Date()
				localizedDescription = aDecoder.decodeObject(forKey: "description") as? String ?? String()
				graphics = aDecoder.decodeObject(of: [Character.Medal.GetCharactersCharacterIDMedalsGraphics.self], forKey: "graphics") as? [Character.Medal.GetCharactersCharacterIDMedalsGraphics] ?? []
				issuerID = aDecoder.decodeInteger(forKey: "issuer_id")
				medalID = aDecoder.decodeInteger(forKey: "medal_id")
				reason = aDecoder.decodeObject(forKey: "reason") as? String ?? String()
				status = Character.Medal.GetCharactersCharacterIDMedalsStatus(rawValue: aDecoder.decodeObject(forKey: "status") as? String ?? "") ?? Character.Medal.GetCharactersCharacterIDMedalsStatus()
				title = aDecoder.decodeObject(forKey: "title") as? String ?? String()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(corporationID, forKey: "corporation_id")
				aCoder.encode(date, forKey: "date")
				aCoder.encode(localizedDescription, forKey: "description")
				aCoder.encode(graphics, forKey: "graphics")
				aCoder.encode(issuerID, forKey: "issuer_id")
				aCoder.encode(medalID, forKey: "medal_id")
				aCoder.encode(reason, forKey: "reason")
				aCoder.encode(status.rawValue, forKey: "status")
				aCoder.encode(title, forKey: "title")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["corporation_id"] = corporationID.json
				json["date"] = date.json
				json["description"] = localizedDescription.json
				json["graphics"] = graphics.json
				json["issuer_id"] = issuerID.json
				json["medal_id"] = medalID.json
				json["reason"] = reason.json
				json["status"] = status.json
				json["title"] = title.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.corporationID.hashValue)
				hashCombine(seed: &hash, value: self.date.hashValue)
				hashCombine(seed: &hash, value: self.localizedDescription.hashValue)
				self.graphics.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: self.issuerID.hashValue)
				hashCombine(seed: &hash, value: self.medalID.hashValue)
				hashCombine(seed: &hash, value: self.reason.hashValue)
				hashCombine(seed: &hash, value: self.status.hashValue)
				hashCombine(seed: &hash, value: self.title.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Character.Medal, rhs: Character.Medal) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Character.Medal) {
				corporationID = other.corporationID
				date = other.date
				localizedDescription = other.localizedDescription
				graphics = other.graphics.flatMap { Character.Medal.GetCharactersCharacterIDMedalsGraphics($0) }
				issuerID = other.issuerID
				medalID = other.medalID
				reason = other.reason
				status = other.status
				title = other.title
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Character.Medal(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Medal)?.hashValue == hashValue
			}
			
		}
		
		
		public class CorporationHistory: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var corporationID: Int = Int()
			public var isDeleted: Bool? = nil
			public var recordID: Int = Int()
			public var startDate: Date = Date()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let corporationID = dictionary["corporation_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.corporationID = corporationID
				isDeleted = dictionary["is_deleted"] as? Bool
				guard let recordID = dictionary["record_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.recordID = recordID
				guard let startDate = DateFormatter.esiDateTimeFormatter.date(from: dictionary["start_date"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.startDate = startDate
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				corporationID = aDecoder.decodeInteger(forKey: "corporation_id")
				isDeleted = aDecoder.containsValue(forKey: "is_deleted") ? aDecoder.decodeBool(forKey: "is_deleted") : nil
				recordID = aDecoder.decodeInteger(forKey: "record_id")
				startDate = aDecoder.decodeObject(forKey: "start_date") as? Date ?? Date()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(corporationID, forKey: "corporation_id")
				if let v = isDeleted {
					aCoder.encode(v, forKey: "is_deleted")
				}
				aCoder.encode(recordID, forKey: "record_id")
				aCoder.encode(startDate, forKey: "start_date")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["corporation_id"] = corporationID.json
				if let v = isDeleted?.json {
					json["is_deleted"] = v
				}
				json["record_id"] = recordID.json
				json["start_date"] = startDate.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.corporationID.hashValue)
				hashCombine(seed: &hash, value: self.isDeleted?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.recordID.hashValue)
				hashCombine(seed: &hash, value: self.startDate.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Character.CorporationHistory, rhs: Character.CorporationHistory) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Character.CorporationHistory) {
				corporationID = other.corporationID
				isDeleted = other.isDeleted
				recordID = other.recordID
				startDate = other.startDate
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Character.CorporationHistory(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? CorporationHistory)?.hashValue == hashValue
			}
			
		}
		
		
		public class Name: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var characterID: Int64 = Int64()
			public var characterName: String = String()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let characterID = dictionary["character_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.characterID = characterID
				guard let characterName = dictionary["character_name"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.characterName = characterName
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				characterID = aDecoder.decodeInt64(forKey: "character_id")
				characterName = aDecoder.decodeObject(forKey: "character_name") as? String ?? String()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(characterID, forKey: "character_id")
				aCoder.encode(characterName, forKey: "character_name")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["character_id"] = characterID.json
				json["character_name"] = characterName.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.characterID.hashValue)
				hashCombine(seed: &hash, value: self.characterName.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Character.Name, rhs: Character.Name) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Character.Name) {
				characterID = other.characterID
				characterName = other.characterName
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Character.Name(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Name)?.hashValue == hashValue
			}
			
		}
		
		
		public enum Role: String, JSONCoding, HTTPQueryable {
			case accountTake1 = "Account_Take_1"
			case accountTake2 = "Account_Take_2"
			case accountTake3 = "Account_Take_3"
			case accountTake4 = "Account_Take_4"
			case accountTake5 = "Account_Take_5"
			case accountTake6 = "Account_Take_6"
			case accountTake7 = "Account_Take_7"
			case accountant = "Accountant"
			case auditor = "Auditor"
			case communicationsOfficer = "Communications_Officer"
			case configEquipment = "Config_Equipment"
			case configStarbaseEquipment = "Config_Starbase_Equipment"
			case containerTake1 = "Container_Take_1"
			case containerTake2 = "Container_Take_2"
			case containerTake3 = "Container_Take_3"
			case containerTake4 = "Container_Take_4"
			case containerTake5 = "Container_Take_5"
			case containerTake6 = "Container_Take_6"
			case containerTake7 = "Container_Take_7"
			case contractManager = "Contract_Manager"
			case diplomat = "Diplomat"
			case director = "Director"
			case factoryManager = "Factory_Manager"
			case fittingManager = "Fitting_Manager"
			case hangarQuery1 = "Hangar_Query_1"
			case hangarQuery2 = "Hangar_Query_2"
			case hangarQuery3 = "Hangar_Query_3"
			case hangarQuery4 = "Hangar_Query_4"
			case hangarQuery5 = "Hangar_Query_5"
			case hangarQuery6 = "Hangar_Query_6"
			case hangarQuery7 = "Hangar_Query_7"
			case hangarTake1 = "Hangar_Take_1"
			case hangarTake2 = "Hangar_Take_2"
			case hangarTake3 = "Hangar_Take_3"
			case hangarTake4 = "Hangar_Take_4"
			case hangarTake5 = "Hangar_Take_5"
			case hangarTake6 = "Hangar_Take_6"
			case hangarTake7 = "Hangar_Take_7"
			case juniorAccountant = "Junior_Accountant"
			case personnelManager = "Personnel_Manager"
			case rentFactoryFacility = "Rent_Factory_Facility"
			case rentOffice = "Rent_Office"
			case rentResearchFacility = "Rent_Research_Facility"
			case securityOfficer = "Security_Officer"
			case starbaseDefenseOperator = "Starbase_Defense_Operator"
			case starbaseFuelTechnician = "Starbase_Fuel_Technician"
			case stationManager = "Station_Manager"
			case terrestrialCombatOfficer = "Terrestrial_Combat_Officer"
			case terrestrialLogisticsOfficer = "Terrestrial_Logistics_Officer"
			case trader = "Trader"
			
			public init() {
				self = .director
			}
			
			public var json: Any {
				return self.rawValue
			}
			
			public init(json: Any) throws {
				guard let s = json as? String, let v = Role(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
				self = v
			}
			
			public var httpQuery: String? {
				return rawValue
			}
			
		}
		
		
		public class Affiliation: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var allianceID: Int? = nil
			public var characterID: Int = Int()
			public var corporationID: Int = Int()
			public var factionID: Int? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				allianceID = dictionary["alliance_id"] as? Int
				guard let characterID = dictionary["character_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.characterID = characterID
				guard let corporationID = dictionary["corporation_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.corporationID = corporationID
				factionID = dictionary["faction_id"] as? Int
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				allianceID = aDecoder.containsValue(forKey: "alliance_id") ? aDecoder.decodeInteger(forKey: "alliance_id") : nil
				characterID = aDecoder.decodeInteger(forKey: "character_id")
				corporationID = aDecoder.decodeInteger(forKey: "corporation_id")
				factionID = aDecoder.containsValue(forKey: "faction_id") ? aDecoder.decodeInteger(forKey: "faction_id") : nil
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = allianceID {
					aCoder.encode(v, forKey: "alliance_id")
				}
				aCoder.encode(characterID, forKey: "character_id")
				aCoder.encode(corporationID, forKey: "corporation_id")
				if let v = factionID {
					aCoder.encode(v, forKey: "faction_id")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = allianceID?.json {
					json["alliance_id"] = v
				}
				json["character_id"] = characterID.json
				json["corporation_id"] = corporationID.json
				if let v = factionID?.json {
					json["faction_id"] = v
				}
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.allianceID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.characterID.hashValue)
				hashCombine(seed: &hash, value: self.corporationID.hashValue)
				hashCombine(seed: &hash, value: self.factionID?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Character.Affiliation, rhs: Character.Affiliation) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Character.Affiliation) {
				allianceID = other.allianceID
				characterID = other.characterID
				corporationID = other.corporationID
				factionID = other.factionID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Character.Affiliation(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Affiliation)?.hashValue == hashValue
			}
			
		}
		
		
		public class Blueprint: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public enum GetCharactersCharacterIDBlueprintsLocationFlag: String, JSONCoding, HTTPQueryable {
				case assetSafety = "AssetSafety"
				case autoFit = "AutoFit"
				case cargo = "Cargo"
				case corpseBay = "CorpseBay"
				case deliveries = "Deliveries"
				case droneBay = "DroneBay"
				case fighterBay = "FighterBay"
				case fighterTube0 = "FighterTube0"
				case fighterTube1 = "FighterTube1"
				case fighterTube2 = "FighterTube2"
				case fighterTube3 = "FighterTube3"
				case fighterTube4 = "FighterTube4"
				case fleetHangar = "FleetHangar"
				case hangar = "Hangar"
				case hangarAll = "HangarAll"
				case hiSlot0 = "HiSlot0"
				case hiSlot1 = "HiSlot1"
				case hiSlot2 = "HiSlot2"
				case hiSlot3 = "HiSlot3"
				case hiSlot4 = "HiSlot4"
				case hiSlot5 = "HiSlot5"
				case hiSlot6 = "HiSlot6"
				case hiSlot7 = "HiSlot7"
				case hiddenModifiers = "HiddenModifiers"
				case implant = "Implant"
				case loSlot0 = "LoSlot0"
				case loSlot1 = "LoSlot1"
				case loSlot2 = "LoSlot2"
				case loSlot3 = "LoSlot3"
				case loSlot4 = "LoSlot4"
				case loSlot5 = "LoSlot5"
				case loSlot6 = "LoSlot6"
				case loSlot7 = "LoSlot7"
				case locked = "Locked"
				case medSlot0 = "MedSlot0"
				case medSlot1 = "MedSlot1"
				case medSlot2 = "MedSlot2"
				case medSlot3 = "MedSlot3"
				case medSlot4 = "MedSlot4"
				case medSlot5 = "MedSlot5"
				case medSlot6 = "MedSlot6"
				case medSlot7 = "MedSlot7"
				case module = "Module"
				case quafeBay = "QuafeBay"
				case rigSlot0 = "RigSlot0"
				case rigSlot1 = "RigSlot1"
				case rigSlot2 = "RigSlot2"
				case rigSlot3 = "RigSlot3"
				case rigSlot4 = "RigSlot4"
				case rigSlot5 = "RigSlot5"
				case rigSlot6 = "RigSlot6"
				case rigSlot7 = "RigSlot7"
				case shipHangar = "ShipHangar"
				case specializedAmmoHold = "SpecializedAmmoHold"
				case specializedCommandCenterHold = "SpecializedCommandCenterHold"
				case specializedFuelBay = "SpecializedFuelBay"
				case specializedGasHold = "SpecializedGasHold"
				case specializedIndustrialShipHold = "SpecializedIndustrialShipHold"
				case specializedLargeShipHold = "SpecializedLargeShipHold"
				case specializedMaterialBay = "SpecializedMaterialBay"
				case specializedMediumShipHold = "SpecializedMediumShipHold"
				case specializedMineralHold = "SpecializedMineralHold"
				case specializedOreHold = "SpecializedOreHold"
				case specializedPlanetaryCommoditiesHold = "SpecializedPlanetaryCommoditiesHold"
				case specializedSalvageHold = "SpecializedSalvageHold"
				case specializedShipHold = "SpecializedShipHold"
				case specializedSmallShipHold = "SpecializedSmallShipHold"
				case subSystemSlot0 = "SubSystemSlot0"
				case subSystemSlot1 = "SubSystemSlot1"
				case subSystemSlot2 = "SubSystemSlot2"
				case subSystemSlot3 = "SubSystemSlot3"
				case subSystemSlot4 = "SubSystemSlot4"
				case subSystemSlot5 = "SubSystemSlot5"
				case subSystemSlot6 = "SubSystemSlot6"
				case subSystemSlot7 = "SubSystemSlot7"
				case unlocked = "Unlocked"
				
				public init() {
					self = .autoFit
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCharactersCharacterIDBlueprintsLocationFlag(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var itemID: Int64 = Int64()
			public var locationFlag: Character.Blueprint.GetCharactersCharacterIDBlueprintsLocationFlag = Character.Blueprint.GetCharactersCharacterIDBlueprintsLocationFlag()
			public var locationID: Int64 = Int64()
			public var materialEfficiency: Int = Int()
			public var quantity: Int = Int()
			public var runs: Int = Int()
			public var timeEfficiency: Int = Int()
			public var typeID: Int = Int()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let itemID = dictionary["item_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.itemID = itemID
				guard let locationFlag = Character.Blueprint.GetCharactersCharacterIDBlueprintsLocationFlag(rawValue: dictionary["location_flag"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.locationFlag = locationFlag
				guard let locationID = dictionary["location_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.locationID = locationID
				guard let materialEfficiency = dictionary["material_efficiency"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.materialEfficiency = materialEfficiency
				guard let quantity = dictionary["quantity"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.quantity = quantity
				guard let runs = dictionary["runs"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.runs = runs
				guard let timeEfficiency = dictionary["time_efficiency"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.timeEfficiency = timeEfficiency
				guard let typeID = dictionary["type_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.typeID = typeID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				itemID = aDecoder.decodeInt64(forKey: "item_id")
				locationFlag = Character.Blueprint.GetCharactersCharacterIDBlueprintsLocationFlag(rawValue: aDecoder.decodeObject(forKey: "location_flag") as? String ?? "") ?? Character.Blueprint.GetCharactersCharacterIDBlueprintsLocationFlag()
				locationID = aDecoder.decodeInt64(forKey: "location_id")
				materialEfficiency = aDecoder.decodeInteger(forKey: "material_efficiency")
				quantity = aDecoder.decodeInteger(forKey: "quantity")
				runs = aDecoder.decodeInteger(forKey: "runs")
				timeEfficiency = aDecoder.decodeInteger(forKey: "time_efficiency")
				typeID = aDecoder.decodeInteger(forKey: "type_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(itemID, forKey: "item_id")
				aCoder.encode(locationFlag.rawValue, forKey: "location_flag")
				aCoder.encode(locationID, forKey: "location_id")
				aCoder.encode(materialEfficiency, forKey: "material_efficiency")
				aCoder.encode(quantity, forKey: "quantity")
				aCoder.encode(runs, forKey: "runs")
				aCoder.encode(timeEfficiency, forKey: "time_efficiency")
				aCoder.encode(typeID, forKey: "type_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["item_id"] = itemID.json
				json["location_flag"] = locationFlag.json
				json["location_id"] = locationID.json
				json["material_efficiency"] = materialEfficiency.json
				json["quantity"] = quantity.json
				json["runs"] = runs.json
				json["time_efficiency"] = timeEfficiency.json
				json["type_id"] = typeID.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.itemID.hashValue)
				hashCombine(seed: &hash, value: self.locationFlag.hashValue)
				hashCombine(seed: &hash, value: self.locationID.hashValue)
				hashCombine(seed: &hash, value: self.materialEfficiency.hashValue)
				hashCombine(seed: &hash, value: self.quantity.hashValue)
				hashCombine(seed: &hash, value: self.runs.hashValue)
				hashCombine(seed: &hash, value: self.timeEfficiency.hashValue)
				hashCombine(seed: &hash, value: self.typeID.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Character.Blueprint, rhs: Character.Blueprint) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Character.Blueprint) {
				itemID = other.itemID
				locationFlag = other.locationFlag
				locationID = other.locationID
				materialEfficiency = other.materialEfficiency
				quantity = other.quantity
				runs = other.runs
				timeEfficiency = other.timeEfficiency
				typeID = other.typeID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Character.Blueprint(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Blueprint)?.hashValue == hashValue
			}
			
		}
		
		
	}
	
}
