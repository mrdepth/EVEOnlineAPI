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
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-characters.read_medals.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/medals/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Character.Medal]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getStandings(characterID: Int, completionBlock:((Result<[Character.Standing]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-characters.read_standings.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/standings/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Character.Standing]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func calculateCSPAChargeCost(characterID: Int, characters: Character.Characters, completionBlock:((Result<Character.CSPAChargeCost>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-characters.read_contacts.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			parameters["characters"] = characters.json
			
			let url = session!.baseURL + "latest/characters/\(characterID)/cspa/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Character.CSPAChargeCost>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getCharacterNames(characterIds: [Int64], completionBlock:((Result<[Character.Name]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			parameters["character_ids"] = characterIds.json
			
			let url = session!.baseURL + "latest/characters/names/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Character.Name]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getAgentsResearch(characterID: Int, completionBlock:((Result<[Character.Research]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-characters.read_agents_research.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/agents_research/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Character.Research]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func characterAffiliation(characters: [Int], completionBlock:((Result<[Character.Affiliation]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			parameters["characters"] = characters.json
			
			let url = session!.baseURL + "latest/characters/affiliation/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Character.Affiliation]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getChatChannels(characterID: Int, completionBlock:((Result<[Character.ChatChannel]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-characters.read_chat_channels.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/chat_channels/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Character.ChatChannel]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getCharacterPortraits(characterID: Int, completionBlock:((Result<Character.Portrait>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/portrait/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Character.Portrait>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getCorporationHistory(characterID: Int, completionBlock:((Result<[Character.CorporationHistory]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/corporationhistory/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Character.CorporationHistory]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getCharactersPublicInformation(characterID: Int, completionBlock:((Result<Character.Information>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Character.Information>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		public class PostCharactersAffiliationUnprocessableEntity: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Character.PostCharactersAffiliationUnprocessableEntity, rhs: Character.PostCharactersAffiliationUnprocessableEntity) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class Portrait: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: px128x128?.hashValue ?? 0)
				hashCombine(seed: &hash, value: px256x256?.hashValue ?? 0)
				hashCombine(seed: &hash, value: px512x512?.hashValue ?? 0)
				hashCombine(seed: &hash, value: px64x64?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Character.Portrait, rhs: Character.Portrait) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDStandingsForbidden: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Character.GetCharactersCharacterIDStandingsForbidden, rhs: Character.GetCharactersCharacterIDStandingsForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDAgentsResearchForbidden: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Character.GetCharactersCharacterIDAgentsResearchForbidden, rhs: Character.GetCharactersCharacterIDAgentsResearchForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDChatChannelsForbidden: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Character.GetCharactersCharacterIDChatChannelsForbidden, rhs: Character.GetCharactersCharacterIDChatChannelsForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetCharactersNamesInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Character.GetCharactersNamesInternalServerError, rhs: Character.GetCharactersNamesInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDCorporationhistoryInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Character.GetCharactersCharacterIDCorporationhistoryInternalServerError, rhs: Character.GetCharactersCharacterIDCorporationhistoryInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDNotFound: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Character.GetCharactersCharacterIDNotFound, rhs: Character.GetCharactersCharacterIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class Standing: NSObject, NSSecureCoding , JSONCoding {
			
			public enum GetCharactersCharacterIDStandingsFromType: String, JSONCoding {
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: fromID.hashValue)
				hashCombine(seed: &hash, value: fromType.hashValue)
				hashCombine(seed: &hash, value: standing.hashValue)
				return hash
			}
			
			public static func ==(lhs: Character.Standing, rhs: Character.Standing) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDMedalsInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Character.GetCharactersCharacterIDMedalsInternalServerError, rhs: Character.GetCharactersCharacterIDMedalsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class ChatChannel: NSObject, NSSecureCoding , JSONCoding {
			
			public enum GetCharactersCharacterIDChatChannelsAccessorType: String, JSONCoding {
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
				
			}
			
			public class GetCharactersCharacterIDChatChannelsOperators: NSObject, NSSecureCoding , JSONCoding {
				
				
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: accessorID.hashValue)
					hashCombine(seed: &hash, value: accessorType.hashValue)
					return hash
				}
				
				public static func ==(lhs: Character.ChatChannel.GetCharactersCharacterIDChatChannelsOperators, rhs: Character.ChatChannel.GetCharactersCharacterIDChatChannelsOperators) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
			}
			
			public class GetCharactersCharacterIDChatChannelsBlocked: NSObject, NSSecureCoding , JSONCoding {
				
				
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
					endAt = DateFormatter.esiDateFormatter.date(from: dictionary["end_at"] as? String ?? "")
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: accessorID.hashValue)
					hashCombine(seed: &hash, value: accessorType.hashValue)
					hashCombine(seed: &hash, value: endAt?.hashValue ?? 0)
					hashCombine(seed: &hash, value: reason?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: Character.ChatChannel.GetCharactersCharacterIDChatChannelsBlocked, rhs: Character.ChatChannel.GetCharactersCharacterIDChatChannelsBlocked) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
			}
			
			public class GetCharactersCharacterIDChatChannelsAllowed: NSObject, NSSecureCoding , JSONCoding {
				
				
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: accessorID.hashValue)
					hashCombine(seed: &hash, value: accessorType.hashValue)
					return hash
				}
				
				public static func ==(lhs: Character.ChatChannel.GetCharactersCharacterIDChatChannelsAllowed, rhs: Character.ChatChannel.GetCharactersCharacterIDChatChannelsAllowed) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
			}
			
			public class GetCharactersCharacterIDChatChannelsMuted: NSObject, NSSecureCoding , JSONCoding {
				
				
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
					endAt = DateFormatter.esiDateFormatter.date(from: dictionary["end_at"] as? String ?? "")
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: accessorID.hashValue)
					hashCombine(seed: &hash, value: accessorType.hashValue)
					hashCombine(seed: &hash, value: endAt?.hashValue ?? 0)
					hashCombine(seed: &hash, value: reason?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: Character.ChatChannel.GetCharactersCharacterIDChatChannelsMuted, rhs: Character.ChatChannel.GetCharactersCharacterIDChatChannelsMuted) -> Bool {
					return lhs.hashValue == rhs.hashValue
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				allowed.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				blocked.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: channelID.hashValue)
				hashCombine(seed: &hash, value: comparisonKey.hashValue)
				hashCombine(seed: &hash, value: hasPassword.hashValue)
				hashCombine(seed: &hash, value: motd.hashValue)
				muted.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: name.hashValue)
				operators.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: ownerID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Character.ChatChannel, rhs: Character.ChatChannel) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDChatChannelsInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Character.GetCharactersCharacterIDChatChannelsInternalServerError, rhs: Character.GetCharactersCharacterIDChatChannelsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class Medal: NSObject, NSSecureCoding , JSONCoding {
			
			public enum GetCharactersCharacterIDMedalsStatus: String, JSONCoding {
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
				
			}
			
			public class GetCharactersCharacterIDMedalsGraphics: NSObject, NSSecureCoding , JSONCoding {
				
				
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: color?.hashValue ?? 0)
					hashCombine(seed: &hash, value: graphic.hashValue)
					hashCombine(seed: &hash, value: layer.hashValue)
					hashCombine(seed: &hash, value: part.hashValue)
					return hash
				}
				
				public static func ==(lhs: Character.Medal.GetCharactersCharacterIDMedalsGraphics, rhs: Character.Medal.GetCharactersCharacterIDMedalsGraphics) -> Bool {
					return lhs.hashValue == rhs.hashValue
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
				guard let date = DateFormatter.esiDateFormatter.date(from: dictionary["date"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: corporationID.hashValue)
				hashCombine(seed: &hash, value: date.hashValue)
				hashCombine(seed: &hash, value: localizedDescription.hashValue)
				graphics.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: issuerID.hashValue)
				hashCombine(seed: &hash, value: medalID.hashValue)
				hashCombine(seed: &hash, value: reason.hashValue)
				hashCombine(seed: &hash, value: status.hashValue)
				hashCombine(seed: &hash, value: title.hashValue)
				return hash
			}
			
			public static func ==(lhs: Character.Medal, rhs: Character.Medal) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class Research: NSObject, NSSecureCoding , JSONCoding {
			
			
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
				guard let startedAt = DateFormatter.esiDateFormatter.date(from: dictionary["started_at"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: agentID.hashValue)
				hashCombine(seed: &hash, value: pointsPerDay.hashValue)
				hashCombine(seed: &hash, value: remainderPoints.hashValue)
				hashCombine(seed: &hash, value: skillTypeID.hashValue)
				hashCombine(seed: &hash, value: startedAt.hashValue)
				return hash
			}
			
			public static func ==(lhs: Character.Research, rhs: Character.Research) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class Name: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: characterID.hashValue)
				hashCombine(seed: &hash, value: characterName.hashValue)
				return hash
			}
			
			public static func ==(lhs: Character.Name, rhs: Character.Name) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PostCharactersCharacterIDCspaForbidden: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Character.PostCharactersCharacterIDCspaForbidden, rhs: Character.PostCharactersCharacterIDCspaForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDPortraitInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Character.GetCharactersCharacterIDPortraitInternalServerError, rhs: Character.GetCharactersCharacterIDPortraitInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class Affiliation: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: allianceID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: characterID.hashValue)
				hashCombine(seed: &hash, value: corporationID.hashValue)
				hashCombine(seed: &hash, value: factionID?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Character.Affiliation, rhs: Character.Affiliation) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class CSPAChargeCost: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: cost?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Character.CSPAChargeCost, rhs: Character.CSPAChargeCost) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class Characters: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				characters.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}
			
			public static func ==(lhs: Character.Characters, rhs: Character.Characters) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Character.GetCharactersCharacterIDInternalServerError, rhs: Character.GetCharactersCharacterIDInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class Information: NSObject, NSSecureCoding , JSONCoding {
			
			public enum GetCharactersCharacterIDGender: String, JSONCoding {
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
				guard let birthday = DateFormatter.esiDateFormatter.date(from: dictionary["birthday"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: allianceID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: ancestryID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: birthday.hashValue)
				hashCombine(seed: &hash, value: bloodlineID.hashValue)
				hashCombine(seed: &hash, value: corporationID.hashValue)
				hashCombine(seed: &hash, value: localizedDescription?.hashValue ?? 0)
				hashCombine(seed: &hash, value: gender.hashValue)
				hashCombine(seed: &hash, value: name.hashValue)
				hashCombine(seed: &hash, value: raceID.hashValue)
				hashCombine(seed: &hash, value: securityStatus?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Character.Information, rhs: Character.Information) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDPortraitNotFound: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Character.GetCharactersCharacterIDPortraitNotFound, rhs: Character.GetCharactersCharacterIDPortraitNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class CorporationHistory: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var corporationID: Int? = nil
			public var isDeleted: Bool? = nil
			public var recordID: Int? = nil
			public var startDate: Date? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				corporationID = dictionary["corporation_id"] as? Int
				isDeleted = dictionary["is_deleted"] as? Bool
				recordID = dictionary["record_id"] as? Int
				startDate = DateFormatter.esiDateFormatter.date(from: dictionary["start_date"] as? String ?? "")
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				corporationID = aDecoder.containsValue(forKey: "corporation_id") ? aDecoder.decodeInteger(forKey: "corporation_id") : nil
				isDeleted = aDecoder.containsValue(forKey: "is_deleted") ? aDecoder.decodeBool(forKey: "is_deleted") : nil
				recordID = aDecoder.containsValue(forKey: "record_id") ? aDecoder.decodeInteger(forKey: "record_id") : nil
				startDate = aDecoder.decodeObject(forKey: "start_date") as? Date
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = corporationID {
					aCoder.encode(v, forKey: "corporation_id")
				}
				if let v = isDeleted {
					aCoder.encode(v, forKey: "is_deleted")
				}
				if let v = recordID {
					aCoder.encode(v, forKey: "record_id")
				}
				if let v = startDate {
					aCoder.encode(v, forKey: "start_date")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = corporationID?.json {
					json["corporation_id"] = v
				}
				if let v = isDeleted?.json {
					json["is_deleted"] = v
				}
				if let v = recordID?.json {
					json["record_id"] = v
				}
				if let v = startDate?.json {
					json["start_date"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: corporationID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: isDeleted?.hashValue ?? 0)
				hashCombine(seed: &hash, value: recordID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: startDate?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Character.CorporationHistory, rhs: Character.CorporationHistory) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDMedalsForbidden: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Character.GetCharactersCharacterIDMedalsForbidden, rhs: Character.GetCharactersCharacterIDMedalsForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PostCharactersCharacterIDCspaInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Character.PostCharactersCharacterIDCspaInternalServerError, rhs: Character.PostCharactersCharacterIDCspaInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PostCharactersAffiliationInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Character.PostCharactersAffiliationInternalServerError, rhs: Character.PostCharactersAffiliationInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDAgentsResearchInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Character.GetCharactersCharacterIDAgentsResearchInternalServerError, rhs: Character.GetCharactersCharacterIDAgentsResearchInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDStandingsInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Character.GetCharactersCharacterIDStandingsInternalServerError, rhs: Character.GetCharactersCharacterIDStandingsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
	}
	
}
