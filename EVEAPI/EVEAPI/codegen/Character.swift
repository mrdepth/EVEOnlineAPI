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
			
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/chat_channels/"
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
			
			
			
			let url = session!.baseURL + "/v2/characters/\(characterID)/portrait/"
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
		
		public func getCharacterCorporationTitles(characterID: Int, completionBlock:((Result<[Character.GetCharactersCharacterIDTitlesOk]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-characters.read_titles.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/titles/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Character.GetCharactersCharacterIDTitlesOk]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func yearlyAggregateStats(characterID: Int, completionBlock:((Result<[Character.GetCharactersCharacterIDStatsOk]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-characterstats.read.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/stats/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Character.GetCharactersCharacterIDStatsOk]>) in
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
			
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/fatigue/"
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
		
		public func getCharacterCorporationRoles(characterID: Int, completionBlock:((Result<Character.Role>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-characters.read_corporation_roles.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v2/characters/\(characterID)/roles/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Character.Role>) in
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
			
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/corporationhistory/"
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
			
			
			
			let url = session!.baseURL + "/v4/characters/\(characterID)/"
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
		
		public func getCharacterNotifications(characterID: Int, completionBlock:((Result<[Character.GetCharactersCharacterIDNotificationsOk]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-characters.read_notifications.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/notifications/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Character.GetCharactersCharacterIDNotificationsOk]>) in
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
			
			let url = session!.baseURL + "/v1/characters/names/"
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
		
		public func getNewContactNotifications(characterID: Int, completionBlock:((Result<[Character.GetCharactersCharacterIDNotificationsContactsOk]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-characters.read_notifications.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/notifications/contacts/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Character.GetCharactersCharacterIDNotificationsContactsOk]>) in
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
			
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/standings/"
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
		
		public func calculateCSPAChargeCost(characterID: Int, characters: [Int], completionBlock:((Result<Float>) -> Void)?) {
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
			
			
			
			let url = session!.baseURL + "/v4/characters/\(characterID)/cspa/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Float>) in
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
			
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/agents_research/"
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
			
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/medals/"
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
		
		public func getBlueprints(characterID: Int, page: Int? = nil, completionBlock:((Result<[Character.Blueprint]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-characters.read_blueprints.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v2/characters/\(characterID)/blueprints/"
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
		
		public func characterAffiliation(characters: [Int], completionBlock:((Result<[Character.Affiliation]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body = try? JSONSerialization.data(withJSONObject: characters.json, options: [])
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/characters/affiliation/"
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
		
		
		@objc(ESICharacterPortrait) public class Portrait: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var px128x128: String? = nil
			public var px256x256: String? = nil
			public var px512x512: String? = nil
			public var px64x64: String? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				px128x128 = dictionary["px128x128"] as? String
				px256x256 = dictionary["px256x256"] as? String
				px512x512 = dictionary["px512x512"] as? String
				px64x64 = dictionary["px64x64"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
		
		
		@objc(ESICharacterGetCharactersCharacterIDNotificationsContactsOk) public class GetCharactersCharacterIDNotificationsContactsOk: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var message: String = String()
			public var notificationID: Int = Int()
			public var sendDate: Date = Date()
			public var senderCharacterID: Int = Int()
			public var standingLevel: Float = Float()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let message = dictionary["message"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.message = message
				guard let notificationID = dictionary["notification_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.notificationID = notificationID
				guard let sendDate = DateFormatter.esiDateTimeFormatter.date(from: dictionary["send_date"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.sendDate = sendDate
				guard let senderCharacterID = dictionary["sender_character_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.senderCharacterID = senderCharacterID
				guard let standingLevel = dictionary["standing_level"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.standingLevel = standingLevel
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				message = aDecoder.decodeObject(forKey: "message") as? String ?? String()
				notificationID = aDecoder.decodeInteger(forKey: "notification_id")
				sendDate = aDecoder.decodeObject(forKey: "send_date") as? Date ?? Date()
				senderCharacterID = aDecoder.decodeInteger(forKey: "sender_character_id")
				standingLevel = aDecoder.decodeFloat(forKey: "standing_level")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(message, forKey: "message")
				aCoder.encode(notificationID, forKey: "notification_id")
				aCoder.encode(sendDate, forKey: "send_date")
				aCoder.encode(senderCharacterID, forKey: "sender_character_id")
				aCoder.encode(standingLevel, forKey: "standing_level")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["message"] = message.json
				json["notification_id"] = notificationID.json
				json["send_date"] = sendDate.json
				json["sender_character_id"] = senderCharacterID.json
				json["standing_level"] = standingLevel.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.message.hashValue)
				hashCombine(seed: &hash, value: self.notificationID.hashValue)
				hashCombine(seed: &hash, value: self.sendDate.hashValue)
				hashCombine(seed: &hash, value: self.senderCharacterID.hashValue)
				hashCombine(seed: &hash, value: self.standingLevel.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Character.GetCharactersCharacterIDNotificationsContactsOk, rhs: Character.GetCharactersCharacterIDNotificationsContactsOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Character.GetCharactersCharacterIDNotificationsContactsOk) {
				message = other.message
				notificationID = other.notificationID
				sendDate = other.sendDate
				senderCharacterID = other.senderCharacterID
				standingLevel = other.standingLevel
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Character.GetCharactersCharacterIDNotificationsContactsOk(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCharactersCharacterIDNotificationsContactsOk)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESICharacterFatigue) public class Fatigue: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var jumpFatigueExpireDate: Date? = nil
			public var lastJumpDate: Date? = nil
			public var lastUpdateDate: Date? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				jumpFatigueExpireDate = DateFormatter.esiDateTimeFormatter.date(from: dictionary["jump_fatigue_expire_date"] as? String ?? "")
				lastJumpDate = DateFormatter.esiDateTimeFormatter.date(from: dictionary["last_jump_date"] as? String ?? "")
				lastUpdateDate = DateFormatter.esiDateTimeFormatter.date(from: dictionary["last_update_date"] as? String ?? "")
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
		
		
		@objc(ESICharacterGetCharactersCharacterIDNotFound) public class GetCharactersCharacterIDNotFound: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
		
		
		@objc(ESICharacterChatChannel) public class ChatChannel: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
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
					guard let s = json as? String, let v = GetCharactersCharacterIDChatChannelsAccessorType(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			@objc(ESICharacterChatChannelGetCharactersCharacterIDChatChannelsBlocked) public class GetCharactersCharacterIDChatChannelsBlocked: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var accessorID: Int = Int()
				public var accessorType: Character.ChatChannel.GetCharactersCharacterIDChatChannelsAccessorType = Character.ChatChannel.GetCharactersCharacterIDChatChannelsAccessorType()
				public var endAt: Date? = nil
				public var reason: String? = nil
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let accessorID = dictionary["accessor_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.accessorID = accessorID
					guard let accessorType = Character.ChatChannel.GetCharactersCharacterIDChatChannelsAccessorType(rawValue: dictionary["accessor_type"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.accessorType = accessorType
					endAt = DateFormatter.esiDateTimeFormatter.date(from: dictionary["end_at"] as? String ?? "")
					reason = dictionary["reason"] as? String
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
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
			
			@objc(ESICharacterChatChannelGetCharactersCharacterIDChatChannelsOperators) public class GetCharactersCharacterIDChatChannelsOperators: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var accessorID: Int = Int()
				public var accessorType: Character.ChatChannel.GetCharactersCharacterIDChatChannelsAccessorType = Character.ChatChannel.GetCharactersCharacterIDChatChannelsAccessorType()
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let accessorID = dictionary["accessor_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.accessorID = accessorID
					guard let accessorType = Character.ChatChannel.GetCharactersCharacterIDChatChannelsAccessorType(rawValue: dictionary["accessor_type"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.accessorType = accessorType
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
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
			
			@objc(ESICharacterChatChannelGetCharactersCharacterIDChatChannelsAllowed) public class GetCharactersCharacterIDChatChannelsAllowed: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var accessorID: Int = Int()
				public var accessorType: Character.ChatChannel.GetCharactersCharacterIDChatChannelsAccessorType = Character.ChatChannel.GetCharactersCharacterIDChatChannelsAccessorType()
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let accessorID = dictionary["accessor_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.accessorID = accessorID
					guard let accessorType = Character.ChatChannel.GetCharactersCharacterIDChatChannelsAccessorType(rawValue: dictionary["accessor_type"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.accessorType = accessorType
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
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
			
			@objc(ESICharacterChatChannelGetCharactersCharacterIDChatChannelsMuted) public class GetCharactersCharacterIDChatChannelsMuted: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var accessorID: Int = Int()
				public var accessorType: Character.ChatChannel.GetCharactersCharacterIDChatChannelsAccessorType = Character.ChatChannel.GetCharactersCharacterIDChatChannelsAccessorType()
				public var endAt: Date? = nil
				public var reason: String? = nil
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let accessorID = dictionary["accessor_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.accessorID = accessorID
					guard let accessorType = Character.ChatChannel.GetCharactersCharacterIDChatChannelsAccessorType(rawValue: dictionary["accessor_type"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.accessorType = accessorType
					endAt = DateFormatter.esiDateTimeFormatter.date(from: dictionary["end_at"] as? String ?? "")
					reason = dictionary["reason"] as? String
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
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
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				allowed = try (dictionary["allowed"] as? [Any])?.map {try Character.ChatChannel.GetCharactersCharacterIDChatChannelsAllowed(json: $0)} ?? []
				blocked = try (dictionary["blocked"] as? [Any])?.map {try Character.ChatChannel.GetCharactersCharacterIDChatChannelsBlocked(json: $0)} ?? []
				guard let channelID = dictionary["channel_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.channelID = channelID
				guard let comparisonKey = dictionary["comparison_key"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.comparisonKey = comparisonKey
				guard let hasPassword = dictionary["has_password"] as? Bool else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.hasPassword = hasPassword
				guard let motd = dictionary["motd"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.motd = motd
				muted = try (dictionary["muted"] as? [Any])?.map {try Character.ChatChannel.GetCharactersCharacterIDChatChannelsMuted(json: $0)} ?? []
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.name = name
				operators = try (dictionary["operators"] as? [Any])?.map {try Character.ChatChannel.GetCharactersCharacterIDChatChannelsOperators(json: $0)} ?? []
				guard let ownerID = dictionary["owner_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.ownerID = ownerID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
		
		
		@objc(ESICharacterStanding) public class Standing: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
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
					guard let s = json as? String, let v = GetCharactersCharacterIDStandingsFromType(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var fromID: Int = Int()
			public var fromType: Character.Standing.GetCharactersCharacterIDStandingsFromType = Character.Standing.GetCharactersCharacterIDStandingsFromType()
			public var standing: Float = Float()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let fromID = dictionary["from_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.fromID = fromID
				guard let fromType = Character.Standing.GetCharactersCharacterIDStandingsFromType(rawValue: dictionary["from_type"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.fromType = fromType
				guard let standing = dictionary["standing"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.standing = standing
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
		
		
		@objc(ESICharacterInformation) public class Information: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
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
					guard let s = json as? String, let v = GetCharactersCharacterIDGender(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
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
			public var factionID: Int? = nil
			public var gender: Character.Information.GetCharactersCharacterIDGender = Character.Information.GetCharactersCharacterIDGender()
			public var name: String = String()
			public var raceID: Int = Int()
			public var securityStatus: Float? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				allianceID = dictionary["alliance_id"] as? Int
				ancestryID = dictionary["ancestry_id"] as? Int
				guard let birthday = DateFormatter.esiDateTimeFormatter.date(from: dictionary["birthday"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.birthday = birthday
				guard let bloodlineID = dictionary["bloodline_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.bloodlineID = bloodlineID
				guard let corporationID = dictionary["corporation_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.corporationID = corporationID
				localizedDescription = dictionary["description"] as? String
				factionID = dictionary["faction_id"] as? Int
				guard let gender = Character.Information.GetCharactersCharacterIDGender(rawValue: dictionary["gender"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.gender = gender
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.name = name
				guard let raceID = dictionary["race_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.raceID = raceID
				securityStatus = dictionary["security_status"] as? Float
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				allianceID = aDecoder.containsValue(forKey: "alliance_id") ? aDecoder.decodeInteger(forKey: "alliance_id") : nil
				ancestryID = aDecoder.containsValue(forKey: "ancestry_id") ? aDecoder.decodeInteger(forKey: "ancestry_id") : nil
				birthday = aDecoder.decodeObject(forKey: "birthday") as? Date ?? Date()
				bloodlineID = aDecoder.decodeInteger(forKey: "bloodline_id")
				corporationID = aDecoder.decodeInteger(forKey: "corporation_id")
				localizedDescription = aDecoder.decodeObject(forKey: "description") as? String
				factionID = aDecoder.containsValue(forKey: "faction_id") ? aDecoder.decodeInteger(forKey: "faction_id") : nil
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
				if let v = factionID {
					aCoder.encode(v, forKey: "faction_id")
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
				if let v = factionID?.json {
					json["faction_id"] = v
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
				hashCombine(seed: &hash, value: self.factionID?.hashValue ?? 0)
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
				factionID = other.factionID
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
		
		
		@objc(ESICharacterGetCharactersCharacterIDPortraitNotFound) public class GetCharactersCharacterIDPortraitNotFound: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
		
		
		@objc(ESICharacterResearch) public class Research: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var agentID: Int = Int()
			public var pointsPerDay: Float = Float()
			public var remainderPoints: Float = Float()
			public var skillTypeID: Int = Int()
			public var startedAt: Date = Date()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let agentID = dictionary["agent_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.agentID = agentID
				guard let pointsPerDay = dictionary["points_per_day"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.pointsPerDay = pointsPerDay
				guard let remainderPoints = dictionary["remainder_points"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.remainderPoints = remainderPoints
				guard let skillTypeID = dictionary["skill_type_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.skillTypeID = skillTypeID
				guard let startedAt = DateFormatter.esiDateTimeFormatter.date(from: dictionary["started_at"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.startedAt = startedAt
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
		
		
		@objc(ESICharacterMedal) public class Medal: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
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
					guard let s = json as? String, let v = GetCharactersCharacterIDMedalsStatus(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			@objc(ESICharacterMedalGetCharactersCharacterIDMedalsGraphics) public class GetCharactersCharacterIDMedalsGraphics: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var color: Int? = nil
				public var graphic: String = String()
				public var layer: Int = Int()
				public var part: Int = Int()
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					color = dictionary["color"] as? Int
					guard let graphic = dictionary["graphic"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.graphic = graphic
					guard let layer = dictionary["layer"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.layer = layer
					guard let part = dictionary["part"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.part = part
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
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
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let corporationID = dictionary["corporation_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.corporationID = corporationID
				guard let date = DateFormatter.esiDateTimeFormatter.date(from: dictionary["date"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.date = date
				guard let localizedDescription = dictionary["description"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.localizedDescription = localizedDescription
				graphics = try (dictionary["graphics"] as? [Any])?.map {try Character.Medal.GetCharactersCharacterIDMedalsGraphics(json: $0)} ?? []
				guard let issuerID = dictionary["issuer_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.issuerID = issuerID
				guard let medalID = dictionary["medal_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.medalID = medalID
				guard let reason = dictionary["reason"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.reason = reason
				guard let status = Character.Medal.GetCharactersCharacterIDMedalsStatus(rawValue: dictionary["status"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.status = status
				guard let title = dictionary["title"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.title = title
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
		
		
		@objc(ESICharacterPostCharactersAffiliationNotFound) public class PostCharactersAffiliationNotFound: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
			
			public static func ==(lhs: Character.PostCharactersAffiliationNotFound, rhs: Character.PostCharactersAffiliationNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Character.PostCharactersAffiliationNotFound) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Character.PostCharactersAffiliationNotFound(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? PostCharactersAffiliationNotFound)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESICharacterCorporationHistory) public class CorporationHistory: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var corporationID: Int = Int()
			public var isDeleted: Bool? = nil
			public var recordID: Int = Int()
			public var startDate: Date = Date()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let corporationID = dictionary["corporation_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.corporationID = corporationID
				isDeleted = dictionary["is_deleted"] as? Bool
				guard let recordID = dictionary["record_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.recordID = recordID
				guard let startDate = DateFormatter.esiDateTimeFormatter.date(from: dictionary["start_date"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.startDate = startDate
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
		
		
		@objc(ESICharacterGetCharactersCharacterIDStatsOk) public class GetCharactersCharacterIDStatsOk: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var characterMinutes: Int64? = nil
			public var characterSessionsStarted: Int64? = nil
			public var combatCapDrainedbyNpc: Int64? = nil
			public var combatCapDrainedbyPc: Int64? = nil
			public var combatCapDrainingPc: Int64? = nil
			public var combatCriminalFlagSet: Int64? = nil
			public var combatDamageFromNpCsAmount: Int64? = nil
			public var combatDamageFromNpCsNumShots: Int64? = nil
			public var combatDamageFromPlayersBombAmount: Int64? = nil
			public var combatDamageFromPlayersBombNumShots: Int64? = nil
			public var combatDamageFromPlayersCombatDroneAmount: Int64? = nil
			public var combatDamageFromPlayersCombatDroneNumShots: Int64? = nil
			public var combatDamageFromPlayersEnergyAmount: Int64? = nil
			public var combatDamageFromPlayersEnergyNumShots: Int64? = nil
			public var combatDamageFromPlayersFighterBomberAmount: Int64? = nil
			public var combatDamageFromPlayersFighterBomberNumShots: Int64? = nil
			public var combatDamageFromPlayersFighterDroneAmount: Int64? = nil
			public var combatDamageFromPlayersFighterDroneNumShots: Int64? = nil
			public var combatDamageFromPlayersHybridAmount: Int64? = nil
			public var combatDamageFromPlayersHybridNumShots: Int64? = nil
			public var combatDamageFromPlayersMissileAmount: Int64? = nil
			public var combatDamageFromPlayersMissileNumShots: Int64? = nil
			public var combatDamageFromPlayersProjectileAmount: Int64? = nil
			public var combatDamageFromPlayersProjectileNumShots: Int64? = nil
			public var combatDamageFromPlayersSmartBombAmount: Int64? = nil
			public var combatDamageFromPlayersSmartBombNumShots: Int64? = nil
			public var combatDamageFromPlayersSuperAmount: Int64? = nil
			public var combatDamageFromPlayersSuperNumShots: Int64? = nil
			public var combatDamageFromStructuresTotalAmount: Int64? = nil
			public var combatDamageFromStructuresTotalNumShots: Int64? = nil
			public var combatDamageToPlayersBombAmount: Int64? = nil
			public var combatDamageToPlayersBombNumShots: Int64? = nil
			public var combatDamageToPlayersCombatDroneAmount: Int64? = nil
			public var combatDamageToPlayersCombatDroneNumShots: Int64? = nil
			public var combatDamageToPlayersEnergyAmount: Int64? = nil
			public var combatDamageToPlayersEnergyNumShots: Int64? = nil
			public var combatDamageToPlayersFighterBomberAmount: Int64? = nil
			public var combatDamageToPlayersFighterBomberNumShots: Int64? = nil
			public var combatDamageToPlayersFighterDroneAmount: Int64? = nil
			public var combatDamageToPlayersFighterDroneNumShots: Int64? = nil
			public var combatDamageToPlayersHybridAmount: Int64? = nil
			public var combatDamageToPlayersHybridNumShots: Int64? = nil
			public var combatDamageToPlayersMissileAmount: Int64? = nil
			public var combatDamageToPlayersMissileNumShots: Int64? = nil
			public var combatDamageToPlayersProjectileAmount: Int64? = nil
			public var combatDamageToPlayersProjectileNumShots: Int64? = nil
			public var combatDamageToPlayersSmartBombAmount: Int64? = nil
			public var combatDamageToPlayersSmartBombNumShots: Int64? = nil
			public var combatDamageToPlayersSuperAmount: Int64? = nil
			public var combatDamageToPlayersSuperNumShots: Int64? = nil
			public var combatDamageToStructuresTotalAmount: Int64? = nil
			public var combatDamageToStructuresTotalNumShots: Int64? = nil
			public var combatDeathsHighSec: Int64? = nil
			public var combatDeathsLowSec: Int64? = nil
			public var combatDeathsNullSec: Int64? = nil
			public var combatDeathsPodHighSec: Int64? = nil
			public var combatDeathsPodLowSec: Int64? = nil
			public var combatDeathsPodNullSec: Int64? = nil
			public var combatDeathsPodWormhole: Int64? = nil
			public var combatDeathsWormhole: Int64? = nil
			public var combatDroneEngage: Int64? = nil
			public var combatDuelRequested: Int64? = nil
			public var combatEngagementRegister: Int64? = nil
			public var combatKillsAssists: Int64? = nil
			public var combatKillsHighSec: Int64? = nil
			public var combatKillsLowSec: Int64? = nil
			public var combatKillsNullSec: Int64? = nil
			public var combatKillsPodHighSec: Int64? = nil
			public var combatKillsPodLowSec: Int64? = nil
			public var combatKillsPodNullSec: Int64? = nil
			public var combatKillsPodWormhole: Int64? = nil
			public var combatKillsWormhole: Int64? = nil
			public var combatNpcFlagSet: Int64? = nil
			public var combatPvpFlagSet: Int64? = nil
			public var combatRepairArmorByRemoteAmount: Int64? = nil
			public var combatRepairArmorRemoteAmount: Int64? = nil
			public var combatRepairArmorSelfAmount: Int64? = nil
			public var combatRepairCapacitorByRemoteAmount: Int64? = nil
			public var combatRepairCapacitorRemoteAmount: Int64? = nil
			public var combatRepairCapacitorSelfAmount: Int64? = nil
			public var combatRepairHullByRemoteAmount: Int64? = nil
			public var combatRepairHullRemoteAmount: Int64? = nil
			public var combatRepairHullSelfAmount: Int64? = nil
			public var combatRepairShieldByRemoteAmount: Int64? = nil
			public var combatRepairShieldRemoteAmount: Int64? = nil
			public var combatRepairShieldSelfAmount: Int64? = nil
			public var combatSelfDestructs: Int64? = nil
			public var combatWarpScramblePc: Int64? = nil
			public var combatWarpScrambledbyNpc: Int64? = nil
			public var combatWarpScrambledbyPc: Int64? = nil
			public var combatWeaponFlagSet: Int64? = nil
			public var combatWebifiedbyNpc: Int64? = nil
			public var combatWebifiedbyPc: Int64? = nil
			public var combatWebifyingPc: Int64? = nil
			public var daysOfActivity: Int64? = nil
			public var genericConeScans: Int64? = nil
			public var genericRequestScans: Int64? = nil
			public var industryHackingSuccesses: Int64? = nil
			public var industryJobsCancelled: Int64? = nil
			public var industryJobsCompletedCopyBlueprint: Int64? = nil
			public var industryJobsCompletedInvention: Int64? = nil
			public var industryJobsCompletedManufacture: Int64? = nil
			public var industryJobsCompletedManufactureAsteroid: Int64? = nil
			public var industryJobsCompletedManufactureAsteroidQuantity: Int64? = nil
			public var industryJobsCompletedManufactureCharge: Int64? = nil
			public var industryJobsCompletedManufactureChargeQuantity: Int64? = nil
			public var industryJobsCompletedManufactureCommodity: Int64? = nil
			public var industryJobsCompletedManufactureCommodityQuantity: Int64? = nil
			public var industryJobsCompletedManufactureDeployable: Int64? = nil
			public var industryJobsCompletedManufactureDeployableQuantity: Int64? = nil
			public var industryJobsCompletedManufactureDrone: Int64? = nil
			public var industryJobsCompletedManufactureDroneQuantity: Int64? = nil
			public var industryJobsCompletedManufactureImplant: Int64? = nil
			public var industryJobsCompletedManufactureImplantQuantity: Int64? = nil
			public var industryJobsCompletedManufactureModule: Int64? = nil
			public var industryJobsCompletedManufactureModuleQuantity: Int64? = nil
			public var industryJobsCompletedManufactureOther: Int64? = nil
			public var industryJobsCompletedManufactureOtherQuantity: Int64? = nil
			public var industryJobsCompletedManufactureShip: Int64? = nil
			public var industryJobsCompletedManufactureShipQuantity: Int64? = nil
			public var industryJobsCompletedManufactureStructure: Int64? = nil
			public var industryJobsCompletedManufactureStructureQuantity: Int64? = nil
			public var industryJobsCompletedManufactureSubsystem: Int64? = nil
			public var industryJobsCompletedManufactureSubsystemQuantity: Int64? = nil
			public var industryJobsCompletedMaterialProductivity: Int64? = nil
			public var industryJobsCompletedTimeProductivity: Int64? = nil
			public var industryJobsStartedCopyBlueprint: Int64? = nil
			public var industryJobsStartedInvention: Int64? = nil
			public var industryJobsStartedManufacture: Int64? = nil
			public var industryJobsStartedMaterialProductivity: Int64? = nil
			public var industryJobsStartedTimeProductivity: Int64? = nil
			public var industryReprocessItem: Int64? = nil
			public var industryReprocessItemQuantity: Int64? = nil
			public var inventoryAbandonLootQuantity: Int64? = nil
			public var inventoryTrashItemQuantity: Int64? = nil
			public var iskIn: Int64? = nil
			public var iskOut: Int64? = nil
			public var marketAcceptContractsCourier: Int64? = nil
			public var marketAcceptContractsItemExchange: Int64? = nil
			public var marketBuyOrdersPlaced: Int64? = nil
			public var marketCancelMarketOrder: Int64? = nil
			public var marketCreateContractsAuction: Int64? = nil
			public var marketCreateContractsCourier: Int64? = nil
			public var marketCreateContractsItemExchange: Int64? = nil
			public var marketDeliverCourierContract: Int64? = nil
			public var marketIskGained: Int64? = nil
			public var marketIskSpent: Int64? = nil
			public var marketModifyMarketOrder: Int64? = nil
			public var marketSearchContracts: Int64? = nil
			public var marketSellOrdersPlaced: Int64? = nil
			public var miningDroneMine: Int64? = nil
			public var miningOreArkonor: Int64? = nil
			public var miningOreBistot: Int64? = nil
			public var miningOreCrokite: Int64? = nil
			public var miningOreDarkOchre: Int64? = nil
			public var miningOreGneiss: Int64? = nil
			public var miningOreHarvestableCloud: Int64? = nil
			public var miningOreHedbergite: Int64? = nil
			public var miningOreHemorphite: Int64? = nil
			public var miningOreIce: Int64? = nil
			public var miningOreJaspet: Int64? = nil
			public var miningOreKernite: Int64? = nil
			public var miningOreMercoxit: Int64? = nil
			public var miningOreOmber: Int64? = nil
			public var miningOrePlagioclase: Int64? = nil
			public var miningOrePyroxeres: Int64? = nil
			public var miningOreScordite: Int64? = nil
			public var miningOreSpodumain: Int64? = nil
			public var miningOreVeldspar: Int64? = nil
			public var moduleActivationsArmorHardener: Int64? = nil
			public var moduleActivationsArmorRepairUnit: Int64? = nil
			public var moduleActivationsArmorResistanceShiftHardener: Int64? = nil
			public var moduleActivationsAutomatedTargetingSystem: Int64? = nil
			public var moduleActivationsBastion: Int64? = nil
			public var moduleActivationsBombLauncher: Int64? = nil
			public var moduleActivationsCapacitorBooster: Int64? = nil
			public var moduleActivationsCargoScanner: Int64? = nil
			public var moduleActivationsCloakingDevice: Int64? = nil
			public var moduleActivationsCloneVatBay: Int64? = nil
			public var moduleActivationsCynosuralField: Int64? = nil
			public var moduleActivationsDamageControl: Int64? = nil
			public var moduleActivationsDataMiners: Int64? = nil
			public var moduleActivationsDroneControlUnit: Int64? = nil
			public var moduleActivationsDroneTrackingModules: Int64? = nil
			public var moduleActivationsEccm: Int64? = nil
			public var moduleActivationsEcm: Int64? = nil
			public var moduleActivationsEcmBurst: Int64? = nil
			public var moduleActivationsEnergyDestabilizer: Int64? = nil
			public var moduleActivationsEnergyVampire: Int64? = nil
			public var moduleActivationsEnergyWeapon: Int64? = nil
			public var moduleActivationsFestivalLauncher: Int64? = nil
			public var moduleActivationsFrequencyMiningLaser: Int64? = nil
			public var moduleActivationsFueledArmorRepairer: Int64? = nil
			public var moduleActivationsFueledShieldBooster: Int64? = nil
			public var moduleActivationsGangCoordinator: Int64? = nil
			public var moduleActivationsGasCloudHarvester: Int64? = nil
			public var moduleActivationsHullRepairUnit: Int64? = nil
			public var moduleActivationsHybridWeapon: Int64? = nil
			public var moduleActivationsIndustrialCore: Int64? = nil
			public var moduleActivationsInterdictionSphereLauncher: Int64? = nil
			public var moduleActivationsMicroJumpDrive: Int64? = nil
			public var moduleActivationsMiningLaser: Int64? = nil
			public var moduleActivationsMissileLauncher: Int64? = nil
			public var moduleActivationsPassiveTargetingSystem: Int64? = nil
			public var moduleActivationsProbeLauncher: Int64? = nil
			public var moduleActivationsProjectedEccm: Int64? = nil
			public var moduleActivationsProjectileWeapon: Int64? = nil
			public var moduleActivationsPropulsionModule: Int64? = nil
			public var moduleActivationsRemoteArmorRepairer: Int64? = nil
			public var moduleActivationsRemoteCapacitorTransmitter: Int64? = nil
			public var moduleActivationsRemoteEcmBurst: Int64? = nil
			public var moduleActivationsRemoteHullRepairer: Int64? = nil
			public var moduleActivationsRemoteSensorBooster: Int64? = nil
			public var moduleActivationsRemoteSensorDamper: Int64? = nil
			public var moduleActivationsRemoteShieldBooster: Int64? = nil
			public var moduleActivationsRemoteTrackingComputer: Int64? = nil
			public var moduleActivationsSalvager: Int64? = nil
			public var moduleActivationsSensorBooster: Int64? = nil
			public var moduleActivationsShieldBooster: Int64? = nil
			public var moduleActivationsShieldHardener: Int64? = nil
			public var moduleActivationsShipScanner: Int64? = nil
			public var moduleActivationsSiege: Int64? = nil
			public var moduleActivationsSmartBomb: Int64? = nil
			public var moduleActivationsStasisWeb: Int64? = nil
			public var moduleActivationsStripMiner: Int64? = nil
			public var moduleActivationsSuperWeapon: Int64? = nil
			public var moduleActivationsSurveyScanner: Int64? = nil
			public var moduleActivationsTargetBreaker: Int64? = nil
			public var moduleActivationsTargetPainter: Int64? = nil
			public var moduleActivationsTrackingComputer: Int64? = nil
			public var moduleActivationsTrackingDisruptor: Int64? = nil
			public var moduleActivationsTractorBeam: Int64? = nil
			public var moduleActivationsTriage: Int64? = nil
			public var moduleActivationsWarpDisruptFieldGenerator: Int64? = nil
			public var moduleActivationsWarpScrambler: Int64? = nil
			public var moduleLinkWeapons: Int64? = nil
			public var moduleOverload: Int64? = nil
			public var moduleRepairs: Int64? = nil
			public var orbitalStrikeCharactersKilled: Int64? = nil
			public var orbitalStrikeDamageToPlayersArmorAmount: Int64? = nil
			public var orbitalStrikeDamageToPlayersShieldAmount: Int64? = nil
			public var pveDungeonsCompletedAgent: Int64? = nil
			public var pveDungeonsCompletedDistribution: Int64? = nil
			public var pveMissionsSucceeded: Int64? = nil
			public var pveMissionsSucceededEpicArc: Int64? = nil
			public var socialAddContactBad: Int64? = nil
			public var socialAddContactGood: Int64? = nil
			public var socialAddContactHigh: Int64? = nil
			public var socialAddContactHorrible: Int64? = nil
			public var socialAddContactNeutral: Int64? = nil
			public var socialAddNote: Int64? = nil
			public var socialAddedAsContactBad: Int64? = nil
			public var socialAddedAsContactGood: Int64? = nil
			public var socialAddedAsContactHigh: Int64? = nil
			public var socialAddedAsContactHorrible: Int64? = nil
			public var socialAddedAsContactNeutral: Int64? = nil
			public var socialCalendarEventCreated: Int64? = nil
			public var socialChatMessagesAlliance: Int64? = nil
			public var socialChatMessagesConstellation: Int64? = nil
			public var socialChatMessagesCorporation: Int64? = nil
			public var socialChatMessagesFleet: Int64? = nil
			public var socialChatMessagesRegion: Int64? = nil
			public var socialChatMessagesSolarsystem: Int64? = nil
			public var socialChatMessagesWarfaction: Int64? = nil
			public var socialChatTotalMessageLength: Int64? = nil
			public var socialDirectTrades: Int64? = nil
			public var socialFleetBroadcasts: Int64? = nil
			public var socialFleetJoins: Int64? = nil
			public var socialMailsReceived: Int64? = nil
			public var socialMailsSent: Int64? = nil
			public var travelAccelerationGateActivations: Int64? = nil
			public var travelAlignTo: Int64? = nil
			public var travelDistanceWarpedHighSec: Int64? = nil
			public var travelDistanceWarpedLowSec: Int64? = nil
			public var travelDistanceWarpedNullSec: Int64? = nil
			public var travelDistanceWarpedWormhole: Int64? = nil
			public var travelDocksHighSec: Int64? = nil
			public var travelDocksLowSec: Int64? = nil
			public var travelDocksNullSec: Int64? = nil
			public var travelJumpsStargateHighSec: Int64? = nil
			public var travelJumpsStargateLowSec: Int64? = nil
			public var travelJumpsStargateNullSec: Int64? = nil
			public var travelJumpsWormhole: Int64? = nil
			public var travelWarpsHighSec: Int64? = nil
			public var travelWarpsLowSec: Int64? = nil
			public var travelWarpsNullSec: Int64? = nil
			public var travelWarpsToBookmark: Int64? = nil
			public var travelWarpsToCelestial: Int64? = nil
			public var travelWarpsToFleetMember: Int64? = nil
			public var travelWarpsToScanResult: Int64? = nil
			public var travelWarpsWormhole: Int64? = nil
			public var year: Int = Int()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				characterMinutes = dictionary["character_minutes"] as? Int64
				characterSessionsStarted = dictionary["character_sessions_started"] as? Int64
				combatCapDrainedbyNpc = dictionary["combat_cap_drainedby_npc"] as? Int64
				combatCapDrainedbyPc = dictionary["combat_cap_drainedby_pc"] as? Int64
				combatCapDrainingPc = dictionary["combat_cap_draining_pc"] as? Int64
				combatCriminalFlagSet = dictionary["combat_criminal_flag_set"] as? Int64
				combatDamageFromNpCsAmount = dictionary["combat_damage_from_np_cs_amount"] as? Int64
				combatDamageFromNpCsNumShots = dictionary["combat_damage_from_np_cs_num_shots"] as? Int64
				combatDamageFromPlayersBombAmount = dictionary["combat_damage_from_players_bomb_amount"] as? Int64
				combatDamageFromPlayersBombNumShots = dictionary["combat_damage_from_players_bomb_num_shots"] as? Int64
				combatDamageFromPlayersCombatDroneAmount = dictionary["combat_damage_from_players_combat_drone_amount"] as? Int64
				combatDamageFromPlayersCombatDroneNumShots = dictionary["combat_damage_from_players_combat_drone_num_shots"] as? Int64
				combatDamageFromPlayersEnergyAmount = dictionary["combat_damage_from_players_energy_amount"] as? Int64
				combatDamageFromPlayersEnergyNumShots = dictionary["combat_damage_from_players_energy_num_shots"] as? Int64
				combatDamageFromPlayersFighterBomberAmount = dictionary["combat_damage_from_players_fighter_bomber_amount"] as? Int64
				combatDamageFromPlayersFighterBomberNumShots = dictionary["combat_damage_from_players_fighter_bomber_num_shots"] as? Int64
				combatDamageFromPlayersFighterDroneAmount = dictionary["combat_damage_from_players_fighter_drone_amount"] as? Int64
				combatDamageFromPlayersFighterDroneNumShots = dictionary["combat_damage_from_players_fighter_drone_num_shots"] as? Int64
				combatDamageFromPlayersHybridAmount = dictionary["combat_damage_from_players_hybrid_amount"] as? Int64
				combatDamageFromPlayersHybridNumShots = dictionary["combat_damage_from_players_hybrid_num_shots"] as? Int64
				combatDamageFromPlayersMissileAmount = dictionary["combat_damage_from_players_missile_amount"] as? Int64
				combatDamageFromPlayersMissileNumShots = dictionary["combat_damage_from_players_missile_num_shots"] as? Int64
				combatDamageFromPlayersProjectileAmount = dictionary["combat_damage_from_players_projectile_amount"] as? Int64
				combatDamageFromPlayersProjectileNumShots = dictionary["combat_damage_from_players_projectile_num_shots"] as? Int64
				combatDamageFromPlayersSmartBombAmount = dictionary["combat_damage_from_players_smart_bomb_amount"] as? Int64
				combatDamageFromPlayersSmartBombNumShots = dictionary["combat_damage_from_players_smart_bomb_num_shots"] as? Int64
				combatDamageFromPlayersSuperAmount = dictionary["combat_damage_from_players_super_amount"] as? Int64
				combatDamageFromPlayersSuperNumShots = dictionary["combat_damage_from_players_super_num_shots"] as? Int64
				combatDamageFromStructuresTotalAmount = dictionary["combat_damage_from_structures_total_amount"] as? Int64
				combatDamageFromStructuresTotalNumShots = dictionary["combat_damage_from_structures_total_num_shots"] as? Int64
				combatDamageToPlayersBombAmount = dictionary["combat_damage_to_players_bomb_amount"] as? Int64
				combatDamageToPlayersBombNumShots = dictionary["combat_damage_to_players_bomb_num_shots"] as? Int64
				combatDamageToPlayersCombatDroneAmount = dictionary["combat_damage_to_players_combat_drone_amount"] as? Int64
				combatDamageToPlayersCombatDroneNumShots = dictionary["combat_damage_to_players_combat_drone_num_shots"] as? Int64
				combatDamageToPlayersEnergyAmount = dictionary["combat_damage_to_players_energy_amount"] as? Int64
				combatDamageToPlayersEnergyNumShots = dictionary["combat_damage_to_players_energy_num_shots"] as? Int64
				combatDamageToPlayersFighterBomberAmount = dictionary["combat_damage_to_players_fighter_bomber_amount"] as? Int64
				combatDamageToPlayersFighterBomberNumShots = dictionary["combat_damage_to_players_fighter_bomber_num_shots"] as? Int64
				combatDamageToPlayersFighterDroneAmount = dictionary["combat_damage_to_players_fighter_drone_amount"] as? Int64
				combatDamageToPlayersFighterDroneNumShots = dictionary["combat_damage_to_players_fighter_drone_num_shots"] as? Int64
				combatDamageToPlayersHybridAmount = dictionary["combat_damage_to_players_hybrid_amount"] as? Int64
				combatDamageToPlayersHybridNumShots = dictionary["combat_damage_to_players_hybrid_num_shots"] as? Int64
				combatDamageToPlayersMissileAmount = dictionary["combat_damage_to_players_missile_amount"] as? Int64
				combatDamageToPlayersMissileNumShots = dictionary["combat_damage_to_players_missile_num_shots"] as? Int64
				combatDamageToPlayersProjectileAmount = dictionary["combat_damage_to_players_projectile_amount"] as? Int64
				combatDamageToPlayersProjectileNumShots = dictionary["combat_damage_to_players_projectile_num_shots"] as? Int64
				combatDamageToPlayersSmartBombAmount = dictionary["combat_damage_to_players_smart_bomb_amount"] as? Int64
				combatDamageToPlayersSmartBombNumShots = dictionary["combat_damage_to_players_smart_bomb_num_shots"] as? Int64
				combatDamageToPlayersSuperAmount = dictionary["combat_damage_to_players_super_amount"] as? Int64
				combatDamageToPlayersSuperNumShots = dictionary["combat_damage_to_players_super_num_shots"] as? Int64
				combatDamageToStructuresTotalAmount = dictionary["combat_damage_to_structures_total_amount"] as? Int64
				combatDamageToStructuresTotalNumShots = dictionary["combat_damage_to_structures_total_num_shots"] as? Int64
				combatDeathsHighSec = dictionary["combat_deaths_high_sec"] as? Int64
				combatDeathsLowSec = dictionary["combat_deaths_low_sec"] as? Int64
				combatDeathsNullSec = dictionary["combat_deaths_null_sec"] as? Int64
				combatDeathsPodHighSec = dictionary["combat_deaths_pod_high_sec"] as? Int64
				combatDeathsPodLowSec = dictionary["combat_deaths_pod_low_sec"] as? Int64
				combatDeathsPodNullSec = dictionary["combat_deaths_pod_null_sec"] as? Int64
				combatDeathsPodWormhole = dictionary["combat_deaths_pod_wormhole"] as? Int64
				combatDeathsWormhole = dictionary["combat_deaths_wormhole"] as? Int64
				combatDroneEngage = dictionary["combat_drone_engage"] as? Int64
				combatDuelRequested = dictionary["combat_duel_requested"] as? Int64
				combatEngagementRegister = dictionary["combat_engagement_register"] as? Int64
				combatKillsAssists = dictionary["combat_kills_assists"] as? Int64
				combatKillsHighSec = dictionary["combat_kills_high_sec"] as? Int64
				combatKillsLowSec = dictionary["combat_kills_low_sec"] as? Int64
				combatKillsNullSec = dictionary["combat_kills_null_sec"] as? Int64
				combatKillsPodHighSec = dictionary["combat_kills_pod_high_sec"] as? Int64
				combatKillsPodLowSec = dictionary["combat_kills_pod_low_sec"] as? Int64
				combatKillsPodNullSec = dictionary["combat_kills_pod_null_sec"] as? Int64
				combatKillsPodWormhole = dictionary["combat_kills_pod_wormhole"] as? Int64
				combatKillsWormhole = dictionary["combat_kills_wormhole"] as? Int64
				combatNpcFlagSet = dictionary["combat_npc_flag_set"] as? Int64
				combatPvpFlagSet = dictionary["combat_pvp_flag_set"] as? Int64
				combatRepairArmorByRemoteAmount = dictionary["combat_repair_armor_by_remote_amount"] as? Int64
				combatRepairArmorRemoteAmount = dictionary["combat_repair_armor_remote_amount"] as? Int64
				combatRepairArmorSelfAmount = dictionary["combat_repair_armor_self_amount"] as? Int64
				combatRepairCapacitorByRemoteAmount = dictionary["combat_repair_capacitor_by_remote_amount"] as? Int64
				combatRepairCapacitorRemoteAmount = dictionary["combat_repair_capacitor_remote_amount"] as? Int64
				combatRepairCapacitorSelfAmount = dictionary["combat_repair_capacitor_self_amount"] as? Int64
				combatRepairHullByRemoteAmount = dictionary["combat_repair_hull_by_remote_amount"] as? Int64
				combatRepairHullRemoteAmount = dictionary["combat_repair_hull_remote_amount"] as? Int64
				combatRepairHullSelfAmount = dictionary["combat_repair_hull_self_amount"] as? Int64
				combatRepairShieldByRemoteAmount = dictionary["combat_repair_shield_by_remote_amount"] as? Int64
				combatRepairShieldRemoteAmount = dictionary["combat_repair_shield_remote_amount"] as? Int64
				combatRepairShieldSelfAmount = dictionary["combat_repair_shield_self_amount"] as? Int64
				combatSelfDestructs = dictionary["combat_self_destructs"] as? Int64
				combatWarpScramblePc = dictionary["combat_warp_scramble_pc"] as? Int64
				combatWarpScrambledbyNpc = dictionary["combat_warp_scrambledby_npc"] as? Int64
				combatWarpScrambledbyPc = dictionary["combat_warp_scrambledby_pc"] as? Int64
				combatWeaponFlagSet = dictionary["combat_weapon_flag_set"] as? Int64
				combatWebifiedbyNpc = dictionary["combat_webifiedby_npc"] as? Int64
				combatWebifiedbyPc = dictionary["combat_webifiedby_pc"] as? Int64
				combatWebifyingPc = dictionary["combat_webifying_pc"] as? Int64
				daysOfActivity = dictionary["days_of_activity"] as? Int64
				genericConeScans = dictionary["generic_cone_scans"] as? Int64
				genericRequestScans = dictionary["generic_request_scans"] as? Int64
				industryHackingSuccesses = dictionary["industry_hacking_successes"] as? Int64
				industryJobsCancelled = dictionary["industry_jobs_cancelled"] as? Int64
				industryJobsCompletedCopyBlueprint = dictionary["industry_jobs_completed_copy_blueprint"] as? Int64
				industryJobsCompletedInvention = dictionary["industry_jobs_completed_invention"] as? Int64
				industryJobsCompletedManufacture = dictionary["industry_jobs_completed_manufacture"] as? Int64
				industryJobsCompletedManufactureAsteroid = dictionary["industry_jobs_completed_manufacture_asteroid"] as? Int64
				industryJobsCompletedManufactureAsteroidQuantity = dictionary["industry_jobs_completed_manufacture_asteroid_quantity"] as? Int64
				industryJobsCompletedManufactureCharge = dictionary["industry_jobs_completed_manufacture_charge"] as? Int64
				industryJobsCompletedManufactureChargeQuantity = dictionary["industry_jobs_completed_manufacture_charge_quantity"] as? Int64
				industryJobsCompletedManufactureCommodity = dictionary["industry_jobs_completed_manufacture_commodity"] as? Int64
				industryJobsCompletedManufactureCommodityQuantity = dictionary["industry_jobs_completed_manufacture_commodity_quantity"] as? Int64
				industryJobsCompletedManufactureDeployable = dictionary["industry_jobs_completed_manufacture_deployable"] as? Int64
				industryJobsCompletedManufactureDeployableQuantity = dictionary["industry_jobs_completed_manufacture_deployable_quantity"] as? Int64
				industryJobsCompletedManufactureDrone = dictionary["industry_jobs_completed_manufacture_drone"] as? Int64
				industryJobsCompletedManufactureDroneQuantity = dictionary["industry_jobs_completed_manufacture_drone_quantity"] as? Int64
				industryJobsCompletedManufactureImplant = dictionary["industry_jobs_completed_manufacture_implant"] as? Int64
				industryJobsCompletedManufactureImplantQuantity = dictionary["industry_jobs_completed_manufacture_implant_quantity"] as? Int64
				industryJobsCompletedManufactureModule = dictionary["industry_jobs_completed_manufacture_module"] as? Int64
				industryJobsCompletedManufactureModuleQuantity = dictionary["industry_jobs_completed_manufacture_module_quantity"] as? Int64
				industryJobsCompletedManufactureOther = dictionary["industry_jobs_completed_manufacture_other"] as? Int64
				industryJobsCompletedManufactureOtherQuantity = dictionary["industry_jobs_completed_manufacture_other_quantity"] as? Int64
				industryJobsCompletedManufactureShip = dictionary["industry_jobs_completed_manufacture_ship"] as? Int64
				industryJobsCompletedManufactureShipQuantity = dictionary["industry_jobs_completed_manufacture_ship_quantity"] as? Int64
				industryJobsCompletedManufactureStructure = dictionary["industry_jobs_completed_manufacture_structure"] as? Int64
				industryJobsCompletedManufactureStructureQuantity = dictionary["industry_jobs_completed_manufacture_structure_quantity"] as? Int64
				industryJobsCompletedManufactureSubsystem = dictionary["industry_jobs_completed_manufacture_subsystem"] as? Int64
				industryJobsCompletedManufactureSubsystemQuantity = dictionary["industry_jobs_completed_manufacture_subsystem_quantity"] as? Int64
				industryJobsCompletedMaterialProductivity = dictionary["industry_jobs_completed_material_productivity"] as? Int64
				industryJobsCompletedTimeProductivity = dictionary["industry_jobs_completed_time_productivity"] as? Int64
				industryJobsStartedCopyBlueprint = dictionary["industry_jobs_started_copy_blueprint"] as? Int64
				industryJobsStartedInvention = dictionary["industry_jobs_started_invention"] as? Int64
				industryJobsStartedManufacture = dictionary["industry_jobs_started_manufacture"] as? Int64
				industryJobsStartedMaterialProductivity = dictionary["industry_jobs_started_material_productivity"] as? Int64
				industryJobsStartedTimeProductivity = dictionary["industry_jobs_started_time_productivity"] as? Int64
				industryReprocessItem = dictionary["industry_reprocess_item"] as? Int64
				industryReprocessItemQuantity = dictionary["industry_reprocess_item_quantity"] as? Int64
				inventoryAbandonLootQuantity = dictionary["inventory_abandon_loot_quantity"] as? Int64
				inventoryTrashItemQuantity = dictionary["inventory_trash_item_quantity"] as? Int64
				iskIn = dictionary["isk_in"] as? Int64
				iskOut = dictionary["isk_out"] as? Int64
				marketAcceptContractsCourier = dictionary["market_accept_contracts_courier"] as? Int64
				marketAcceptContractsItemExchange = dictionary["market_accept_contracts_item_exchange"] as? Int64
				marketBuyOrdersPlaced = dictionary["market_buy_orders_placed"] as? Int64
				marketCancelMarketOrder = dictionary["market_cancel_market_order"] as? Int64
				marketCreateContractsAuction = dictionary["market_create_contracts_auction"] as? Int64
				marketCreateContractsCourier = dictionary["market_create_contracts_courier"] as? Int64
				marketCreateContractsItemExchange = dictionary["market_create_contracts_item_exchange"] as? Int64
				marketDeliverCourierContract = dictionary["market_deliver_courier_contract"] as? Int64
				marketIskGained = dictionary["market_isk_gained"] as? Int64
				marketIskSpent = dictionary["market_isk_spent"] as? Int64
				marketModifyMarketOrder = dictionary["market_modify_market_order"] as? Int64
				marketSearchContracts = dictionary["market_search_contracts"] as? Int64
				marketSellOrdersPlaced = dictionary["market_sell_orders_placed"] as? Int64
				miningDroneMine = dictionary["mining_drone_mine"] as? Int64
				miningOreArkonor = dictionary["mining_ore_arkonor"] as? Int64
				miningOreBistot = dictionary["mining_ore_bistot"] as? Int64
				miningOreCrokite = dictionary["mining_ore_crokite"] as? Int64
				miningOreDarkOchre = dictionary["mining_ore_dark_ochre"] as? Int64
				miningOreGneiss = dictionary["mining_ore_gneiss"] as? Int64
				miningOreHarvestableCloud = dictionary["mining_ore_harvestable_cloud"] as? Int64
				miningOreHedbergite = dictionary["mining_ore_hedbergite"] as? Int64
				miningOreHemorphite = dictionary["mining_ore_hemorphite"] as? Int64
				miningOreIce = dictionary["mining_ore_ice"] as? Int64
				miningOreJaspet = dictionary["mining_ore_jaspet"] as? Int64
				miningOreKernite = dictionary["mining_ore_kernite"] as? Int64
				miningOreMercoxit = dictionary["mining_ore_mercoxit"] as? Int64
				miningOreOmber = dictionary["mining_ore_omber"] as? Int64
				miningOrePlagioclase = dictionary["mining_ore_plagioclase"] as? Int64
				miningOrePyroxeres = dictionary["mining_ore_pyroxeres"] as? Int64
				miningOreScordite = dictionary["mining_ore_scordite"] as? Int64
				miningOreSpodumain = dictionary["mining_ore_spodumain"] as? Int64
				miningOreVeldspar = dictionary["mining_ore_veldspar"] as? Int64
				moduleActivationsArmorHardener = dictionary["module_activations_armor_hardener"] as? Int64
				moduleActivationsArmorRepairUnit = dictionary["module_activations_armor_repair_unit"] as? Int64
				moduleActivationsArmorResistanceShiftHardener = dictionary["module_activations_armor_resistance_shift_hardener"] as? Int64
				moduleActivationsAutomatedTargetingSystem = dictionary["module_activations_automated_targeting_system"] as? Int64
				moduleActivationsBastion = dictionary["module_activations_bastion"] as? Int64
				moduleActivationsBombLauncher = dictionary["module_activations_bomb_launcher"] as? Int64
				moduleActivationsCapacitorBooster = dictionary["module_activations_capacitor_booster"] as? Int64
				moduleActivationsCargoScanner = dictionary["module_activations_cargo_scanner"] as? Int64
				moduleActivationsCloakingDevice = dictionary["module_activations_cloaking_device"] as? Int64
				moduleActivationsCloneVatBay = dictionary["module_activations_clone_vat_bay"] as? Int64
				moduleActivationsCynosuralField = dictionary["module_activations_cynosural_field"] as? Int64
				moduleActivationsDamageControl = dictionary["module_activations_damage_control"] as? Int64
				moduleActivationsDataMiners = dictionary["module_activations_data_miners"] as? Int64
				moduleActivationsDroneControlUnit = dictionary["module_activations_drone_control_unit"] as? Int64
				moduleActivationsDroneTrackingModules = dictionary["module_activations_drone_tracking_modules"] as? Int64
				moduleActivationsEccm = dictionary["module_activations_eccm"] as? Int64
				moduleActivationsEcm = dictionary["module_activations_ecm"] as? Int64
				moduleActivationsEcmBurst = dictionary["module_activations_ecm_burst"] as? Int64
				moduleActivationsEnergyDestabilizer = dictionary["module_activations_energy_destabilizer"] as? Int64
				moduleActivationsEnergyVampire = dictionary["module_activations_energy_vampire"] as? Int64
				moduleActivationsEnergyWeapon = dictionary["module_activations_energy_weapon"] as? Int64
				moduleActivationsFestivalLauncher = dictionary["module_activations_festival_launcher"] as? Int64
				moduleActivationsFrequencyMiningLaser = dictionary["module_activations_frequency_mining_laser"] as? Int64
				moduleActivationsFueledArmorRepairer = dictionary["module_activations_fueled_armor_repairer"] as? Int64
				moduleActivationsFueledShieldBooster = dictionary["module_activations_fueled_shield_booster"] as? Int64
				moduleActivationsGangCoordinator = dictionary["module_activations_gang_coordinator"] as? Int64
				moduleActivationsGasCloudHarvester = dictionary["module_activations_gas_cloud_harvester"] as? Int64
				moduleActivationsHullRepairUnit = dictionary["module_activations_hull_repair_unit"] as? Int64
				moduleActivationsHybridWeapon = dictionary["module_activations_hybrid_weapon"] as? Int64
				moduleActivationsIndustrialCore = dictionary["module_activations_industrial_core"] as? Int64
				moduleActivationsInterdictionSphereLauncher = dictionary["module_activations_interdiction_sphere_launcher"] as? Int64
				moduleActivationsMicroJumpDrive = dictionary["module_activations_micro_jump_drive"] as? Int64
				moduleActivationsMiningLaser = dictionary["module_activations_mining_laser"] as? Int64
				moduleActivationsMissileLauncher = dictionary["module_activations_missile_launcher"] as? Int64
				moduleActivationsPassiveTargetingSystem = dictionary["module_activations_passive_targeting_system"] as? Int64
				moduleActivationsProbeLauncher = dictionary["module_activations_probe_launcher"] as? Int64
				moduleActivationsProjectedEccm = dictionary["module_activations_projected_eccm"] as? Int64
				moduleActivationsProjectileWeapon = dictionary["module_activations_projectile_weapon"] as? Int64
				moduleActivationsPropulsionModule = dictionary["module_activations_propulsion_module"] as? Int64
				moduleActivationsRemoteArmorRepairer = dictionary["module_activations_remote_armor_repairer"] as? Int64
				moduleActivationsRemoteCapacitorTransmitter = dictionary["module_activations_remote_capacitor_transmitter"] as? Int64
				moduleActivationsRemoteEcmBurst = dictionary["module_activations_remote_ecm_burst"] as? Int64
				moduleActivationsRemoteHullRepairer = dictionary["module_activations_remote_hull_repairer"] as? Int64
				moduleActivationsRemoteSensorBooster = dictionary["module_activations_remote_sensor_booster"] as? Int64
				moduleActivationsRemoteSensorDamper = dictionary["module_activations_remote_sensor_damper"] as? Int64
				moduleActivationsRemoteShieldBooster = dictionary["module_activations_remote_shield_booster"] as? Int64
				moduleActivationsRemoteTrackingComputer = dictionary["module_activations_remote_tracking_computer"] as? Int64
				moduleActivationsSalvager = dictionary["module_activations_salvager"] as? Int64
				moduleActivationsSensorBooster = dictionary["module_activations_sensor_booster"] as? Int64
				moduleActivationsShieldBooster = dictionary["module_activations_shield_booster"] as? Int64
				moduleActivationsShieldHardener = dictionary["module_activations_shield_hardener"] as? Int64
				moduleActivationsShipScanner = dictionary["module_activations_ship_scanner"] as? Int64
				moduleActivationsSiege = dictionary["module_activations_siege"] as? Int64
				moduleActivationsSmartBomb = dictionary["module_activations_smart_bomb"] as? Int64
				moduleActivationsStasisWeb = dictionary["module_activations_stasis_web"] as? Int64
				moduleActivationsStripMiner = dictionary["module_activations_strip_miner"] as? Int64
				moduleActivationsSuperWeapon = dictionary["module_activations_super_weapon"] as? Int64
				moduleActivationsSurveyScanner = dictionary["module_activations_survey_scanner"] as? Int64
				moduleActivationsTargetBreaker = dictionary["module_activations_target_breaker"] as? Int64
				moduleActivationsTargetPainter = dictionary["module_activations_target_painter"] as? Int64
				moduleActivationsTrackingComputer = dictionary["module_activations_tracking_computer"] as? Int64
				moduleActivationsTrackingDisruptor = dictionary["module_activations_tracking_disruptor"] as? Int64
				moduleActivationsTractorBeam = dictionary["module_activations_tractor_beam"] as? Int64
				moduleActivationsTriage = dictionary["module_activations_triage"] as? Int64
				moduleActivationsWarpDisruptFieldGenerator = dictionary["module_activations_warp_disrupt_field_generator"] as? Int64
				moduleActivationsWarpScrambler = dictionary["module_activations_warp_scrambler"] as? Int64
				moduleLinkWeapons = dictionary["module_link_weapons"] as? Int64
				moduleOverload = dictionary["module_overload"] as? Int64
				moduleRepairs = dictionary["module_repairs"] as? Int64
				orbitalStrikeCharactersKilled = dictionary["orbital_strike_characters_killed"] as? Int64
				orbitalStrikeDamageToPlayersArmorAmount = dictionary["orbital_strike_damage_to_players_armor_amount"] as? Int64
				orbitalStrikeDamageToPlayersShieldAmount = dictionary["orbital_strike_damage_to_players_shield_amount"] as? Int64
				pveDungeonsCompletedAgent = dictionary["pve_dungeons_completed_agent"] as? Int64
				pveDungeonsCompletedDistribution = dictionary["pve_dungeons_completed_distribution"] as? Int64
				pveMissionsSucceeded = dictionary["pve_missions_succeeded"] as? Int64
				pveMissionsSucceededEpicArc = dictionary["pve_missions_succeeded_epic_arc"] as? Int64
				socialAddContactBad = dictionary["social_add_contact_bad"] as? Int64
				socialAddContactGood = dictionary["social_add_contact_good"] as? Int64
				socialAddContactHigh = dictionary["social_add_contact_high"] as? Int64
				socialAddContactHorrible = dictionary["social_add_contact_horrible"] as? Int64
				socialAddContactNeutral = dictionary["social_add_contact_neutral"] as? Int64
				socialAddNote = dictionary["social_add_note"] as? Int64
				socialAddedAsContactBad = dictionary["social_added_as_contact_bad"] as? Int64
				socialAddedAsContactGood = dictionary["social_added_as_contact_good"] as? Int64
				socialAddedAsContactHigh = dictionary["social_added_as_contact_high"] as? Int64
				socialAddedAsContactHorrible = dictionary["social_added_as_contact_horrible"] as? Int64
				socialAddedAsContactNeutral = dictionary["social_added_as_contact_neutral"] as? Int64
				socialCalendarEventCreated = dictionary["social_calendar_event_created"] as? Int64
				socialChatMessagesAlliance = dictionary["social_chat_messages_alliance"] as? Int64
				socialChatMessagesConstellation = dictionary["social_chat_messages_constellation"] as? Int64
				socialChatMessagesCorporation = dictionary["social_chat_messages_corporation"] as? Int64
				socialChatMessagesFleet = dictionary["social_chat_messages_fleet"] as? Int64
				socialChatMessagesRegion = dictionary["social_chat_messages_region"] as? Int64
				socialChatMessagesSolarsystem = dictionary["social_chat_messages_solarsystem"] as? Int64
				socialChatMessagesWarfaction = dictionary["social_chat_messages_warfaction"] as? Int64
				socialChatTotalMessageLength = dictionary["social_chat_total_message_length"] as? Int64
				socialDirectTrades = dictionary["social_direct_trades"] as? Int64
				socialFleetBroadcasts = dictionary["social_fleet_broadcasts"] as? Int64
				socialFleetJoins = dictionary["social_fleet_joins"] as? Int64
				socialMailsReceived = dictionary["social_mails_received"] as? Int64
				socialMailsSent = dictionary["social_mails_sent"] as? Int64
				travelAccelerationGateActivations = dictionary["travel_acceleration_gate_activations"] as? Int64
				travelAlignTo = dictionary["travel_align_to"] as? Int64
				travelDistanceWarpedHighSec = dictionary["travel_distance_warped_high_sec"] as? Int64
				travelDistanceWarpedLowSec = dictionary["travel_distance_warped_low_sec"] as? Int64
				travelDistanceWarpedNullSec = dictionary["travel_distance_warped_null_sec"] as? Int64
				travelDistanceWarpedWormhole = dictionary["travel_distance_warped_wormhole"] as? Int64
				travelDocksHighSec = dictionary["travel_docks_high_sec"] as? Int64
				travelDocksLowSec = dictionary["travel_docks_low_sec"] as? Int64
				travelDocksNullSec = dictionary["travel_docks_null_sec"] as? Int64
				travelJumpsStargateHighSec = dictionary["travel_jumps_stargate_high_sec"] as? Int64
				travelJumpsStargateLowSec = dictionary["travel_jumps_stargate_low_sec"] as? Int64
				travelJumpsStargateNullSec = dictionary["travel_jumps_stargate_null_sec"] as? Int64
				travelJumpsWormhole = dictionary["travel_jumps_wormhole"] as? Int64
				travelWarpsHighSec = dictionary["travel_warps_high_sec"] as? Int64
				travelWarpsLowSec = dictionary["travel_warps_low_sec"] as? Int64
				travelWarpsNullSec = dictionary["travel_warps_null_sec"] as? Int64
				travelWarpsToBookmark = dictionary["travel_warps_to_bookmark"] as? Int64
				travelWarpsToCelestial = dictionary["travel_warps_to_celestial"] as? Int64
				travelWarpsToFleetMember = dictionary["travel_warps_to_fleet_member"] as? Int64
				travelWarpsToScanResult = dictionary["travel_warps_to_scan_result"] as? Int64
				travelWarpsWormhole = dictionary["travel_warps_wormhole"] as? Int64
				guard let year = dictionary["year"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.year = year
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				characterMinutes = aDecoder.containsValue(forKey: "character_minutes") ? aDecoder.decodeInt64(forKey: "character_minutes") : nil
				characterSessionsStarted = aDecoder.containsValue(forKey: "character_sessions_started") ? aDecoder.decodeInt64(forKey: "character_sessions_started") : nil
				combatCapDrainedbyNpc = aDecoder.containsValue(forKey: "combat_cap_drainedby_npc") ? aDecoder.decodeInt64(forKey: "combat_cap_drainedby_npc") : nil
				combatCapDrainedbyPc = aDecoder.containsValue(forKey: "combat_cap_drainedby_pc") ? aDecoder.decodeInt64(forKey: "combat_cap_drainedby_pc") : nil
				combatCapDrainingPc = aDecoder.containsValue(forKey: "combat_cap_draining_pc") ? aDecoder.decodeInt64(forKey: "combat_cap_draining_pc") : nil
				combatCriminalFlagSet = aDecoder.containsValue(forKey: "combat_criminal_flag_set") ? aDecoder.decodeInt64(forKey: "combat_criminal_flag_set") : nil
				combatDamageFromNpCsAmount = aDecoder.containsValue(forKey: "combat_damage_from_np_cs_amount") ? aDecoder.decodeInt64(forKey: "combat_damage_from_np_cs_amount") : nil
				combatDamageFromNpCsNumShots = aDecoder.containsValue(forKey: "combat_damage_from_np_cs_num_shots") ? aDecoder.decodeInt64(forKey: "combat_damage_from_np_cs_num_shots") : nil
				combatDamageFromPlayersBombAmount = aDecoder.containsValue(forKey: "combat_damage_from_players_bomb_amount") ? aDecoder.decodeInt64(forKey: "combat_damage_from_players_bomb_amount") : nil
				combatDamageFromPlayersBombNumShots = aDecoder.containsValue(forKey: "combat_damage_from_players_bomb_num_shots") ? aDecoder.decodeInt64(forKey: "combat_damage_from_players_bomb_num_shots") : nil
				combatDamageFromPlayersCombatDroneAmount = aDecoder.containsValue(forKey: "combat_damage_from_players_combat_drone_amount") ? aDecoder.decodeInt64(forKey: "combat_damage_from_players_combat_drone_amount") : nil
				combatDamageFromPlayersCombatDroneNumShots = aDecoder.containsValue(forKey: "combat_damage_from_players_combat_drone_num_shots") ? aDecoder.decodeInt64(forKey: "combat_damage_from_players_combat_drone_num_shots") : nil
				combatDamageFromPlayersEnergyAmount = aDecoder.containsValue(forKey: "combat_damage_from_players_energy_amount") ? aDecoder.decodeInt64(forKey: "combat_damage_from_players_energy_amount") : nil
				combatDamageFromPlayersEnergyNumShots = aDecoder.containsValue(forKey: "combat_damage_from_players_energy_num_shots") ? aDecoder.decodeInt64(forKey: "combat_damage_from_players_energy_num_shots") : nil
				combatDamageFromPlayersFighterBomberAmount = aDecoder.containsValue(forKey: "combat_damage_from_players_fighter_bomber_amount") ? aDecoder.decodeInt64(forKey: "combat_damage_from_players_fighter_bomber_amount") : nil
				combatDamageFromPlayersFighterBomberNumShots = aDecoder.containsValue(forKey: "combat_damage_from_players_fighter_bomber_num_shots") ? aDecoder.decodeInt64(forKey: "combat_damage_from_players_fighter_bomber_num_shots") : nil
				combatDamageFromPlayersFighterDroneAmount = aDecoder.containsValue(forKey: "combat_damage_from_players_fighter_drone_amount") ? aDecoder.decodeInt64(forKey: "combat_damage_from_players_fighter_drone_amount") : nil
				combatDamageFromPlayersFighterDroneNumShots = aDecoder.containsValue(forKey: "combat_damage_from_players_fighter_drone_num_shots") ? aDecoder.decodeInt64(forKey: "combat_damage_from_players_fighter_drone_num_shots") : nil
				combatDamageFromPlayersHybridAmount = aDecoder.containsValue(forKey: "combat_damage_from_players_hybrid_amount") ? aDecoder.decodeInt64(forKey: "combat_damage_from_players_hybrid_amount") : nil
				combatDamageFromPlayersHybridNumShots = aDecoder.containsValue(forKey: "combat_damage_from_players_hybrid_num_shots") ? aDecoder.decodeInt64(forKey: "combat_damage_from_players_hybrid_num_shots") : nil
				combatDamageFromPlayersMissileAmount = aDecoder.containsValue(forKey: "combat_damage_from_players_missile_amount") ? aDecoder.decodeInt64(forKey: "combat_damage_from_players_missile_amount") : nil
				combatDamageFromPlayersMissileNumShots = aDecoder.containsValue(forKey: "combat_damage_from_players_missile_num_shots") ? aDecoder.decodeInt64(forKey: "combat_damage_from_players_missile_num_shots") : nil
				combatDamageFromPlayersProjectileAmount = aDecoder.containsValue(forKey: "combat_damage_from_players_projectile_amount") ? aDecoder.decodeInt64(forKey: "combat_damage_from_players_projectile_amount") : nil
				combatDamageFromPlayersProjectileNumShots = aDecoder.containsValue(forKey: "combat_damage_from_players_projectile_num_shots") ? aDecoder.decodeInt64(forKey: "combat_damage_from_players_projectile_num_shots") : nil
				combatDamageFromPlayersSmartBombAmount = aDecoder.containsValue(forKey: "combat_damage_from_players_smart_bomb_amount") ? aDecoder.decodeInt64(forKey: "combat_damage_from_players_smart_bomb_amount") : nil
				combatDamageFromPlayersSmartBombNumShots = aDecoder.containsValue(forKey: "combat_damage_from_players_smart_bomb_num_shots") ? aDecoder.decodeInt64(forKey: "combat_damage_from_players_smart_bomb_num_shots") : nil
				combatDamageFromPlayersSuperAmount = aDecoder.containsValue(forKey: "combat_damage_from_players_super_amount") ? aDecoder.decodeInt64(forKey: "combat_damage_from_players_super_amount") : nil
				combatDamageFromPlayersSuperNumShots = aDecoder.containsValue(forKey: "combat_damage_from_players_super_num_shots") ? aDecoder.decodeInt64(forKey: "combat_damage_from_players_super_num_shots") : nil
				combatDamageFromStructuresTotalAmount = aDecoder.containsValue(forKey: "combat_damage_from_structures_total_amount") ? aDecoder.decodeInt64(forKey: "combat_damage_from_structures_total_amount") : nil
				combatDamageFromStructuresTotalNumShots = aDecoder.containsValue(forKey: "combat_damage_from_structures_total_num_shots") ? aDecoder.decodeInt64(forKey: "combat_damage_from_structures_total_num_shots") : nil
				combatDamageToPlayersBombAmount = aDecoder.containsValue(forKey: "combat_damage_to_players_bomb_amount") ? aDecoder.decodeInt64(forKey: "combat_damage_to_players_bomb_amount") : nil
				combatDamageToPlayersBombNumShots = aDecoder.containsValue(forKey: "combat_damage_to_players_bomb_num_shots") ? aDecoder.decodeInt64(forKey: "combat_damage_to_players_bomb_num_shots") : nil
				combatDamageToPlayersCombatDroneAmount = aDecoder.containsValue(forKey: "combat_damage_to_players_combat_drone_amount") ? aDecoder.decodeInt64(forKey: "combat_damage_to_players_combat_drone_amount") : nil
				combatDamageToPlayersCombatDroneNumShots = aDecoder.containsValue(forKey: "combat_damage_to_players_combat_drone_num_shots") ? aDecoder.decodeInt64(forKey: "combat_damage_to_players_combat_drone_num_shots") : nil
				combatDamageToPlayersEnergyAmount = aDecoder.containsValue(forKey: "combat_damage_to_players_energy_amount") ? aDecoder.decodeInt64(forKey: "combat_damage_to_players_energy_amount") : nil
				combatDamageToPlayersEnergyNumShots = aDecoder.containsValue(forKey: "combat_damage_to_players_energy_num_shots") ? aDecoder.decodeInt64(forKey: "combat_damage_to_players_energy_num_shots") : nil
				combatDamageToPlayersFighterBomberAmount = aDecoder.containsValue(forKey: "combat_damage_to_players_fighter_bomber_amount") ? aDecoder.decodeInt64(forKey: "combat_damage_to_players_fighter_bomber_amount") : nil
				combatDamageToPlayersFighterBomberNumShots = aDecoder.containsValue(forKey: "combat_damage_to_players_fighter_bomber_num_shots") ? aDecoder.decodeInt64(forKey: "combat_damage_to_players_fighter_bomber_num_shots") : nil
				combatDamageToPlayersFighterDroneAmount = aDecoder.containsValue(forKey: "combat_damage_to_players_fighter_drone_amount") ? aDecoder.decodeInt64(forKey: "combat_damage_to_players_fighter_drone_amount") : nil
				combatDamageToPlayersFighterDroneNumShots = aDecoder.containsValue(forKey: "combat_damage_to_players_fighter_drone_num_shots") ? aDecoder.decodeInt64(forKey: "combat_damage_to_players_fighter_drone_num_shots") : nil
				combatDamageToPlayersHybridAmount = aDecoder.containsValue(forKey: "combat_damage_to_players_hybrid_amount") ? aDecoder.decodeInt64(forKey: "combat_damage_to_players_hybrid_amount") : nil
				combatDamageToPlayersHybridNumShots = aDecoder.containsValue(forKey: "combat_damage_to_players_hybrid_num_shots") ? aDecoder.decodeInt64(forKey: "combat_damage_to_players_hybrid_num_shots") : nil
				combatDamageToPlayersMissileAmount = aDecoder.containsValue(forKey: "combat_damage_to_players_missile_amount") ? aDecoder.decodeInt64(forKey: "combat_damage_to_players_missile_amount") : nil
				combatDamageToPlayersMissileNumShots = aDecoder.containsValue(forKey: "combat_damage_to_players_missile_num_shots") ? aDecoder.decodeInt64(forKey: "combat_damage_to_players_missile_num_shots") : nil
				combatDamageToPlayersProjectileAmount = aDecoder.containsValue(forKey: "combat_damage_to_players_projectile_amount") ? aDecoder.decodeInt64(forKey: "combat_damage_to_players_projectile_amount") : nil
				combatDamageToPlayersProjectileNumShots = aDecoder.containsValue(forKey: "combat_damage_to_players_projectile_num_shots") ? aDecoder.decodeInt64(forKey: "combat_damage_to_players_projectile_num_shots") : nil
				combatDamageToPlayersSmartBombAmount = aDecoder.containsValue(forKey: "combat_damage_to_players_smart_bomb_amount") ? aDecoder.decodeInt64(forKey: "combat_damage_to_players_smart_bomb_amount") : nil
				combatDamageToPlayersSmartBombNumShots = aDecoder.containsValue(forKey: "combat_damage_to_players_smart_bomb_num_shots") ? aDecoder.decodeInt64(forKey: "combat_damage_to_players_smart_bomb_num_shots") : nil
				combatDamageToPlayersSuperAmount = aDecoder.containsValue(forKey: "combat_damage_to_players_super_amount") ? aDecoder.decodeInt64(forKey: "combat_damage_to_players_super_amount") : nil
				combatDamageToPlayersSuperNumShots = aDecoder.containsValue(forKey: "combat_damage_to_players_super_num_shots") ? aDecoder.decodeInt64(forKey: "combat_damage_to_players_super_num_shots") : nil
				combatDamageToStructuresTotalAmount = aDecoder.containsValue(forKey: "combat_damage_to_structures_total_amount") ? aDecoder.decodeInt64(forKey: "combat_damage_to_structures_total_amount") : nil
				combatDamageToStructuresTotalNumShots = aDecoder.containsValue(forKey: "combat_damage_to_structures_total_num_shots") ? aDecoder.decodeInt64(forKey: "combat_damage_to_structures_total_num_shots") : nil
				combatDeathsHighSec = aDecoder.containsValue(forKey: "combat_deaths_high_sec") ? aDecoder.decodeInt64(forKey: "combat_deaths_high_sec") : nil
				combatDeathsLowSec = aDecoder.containsValue(forKey: "combat_deaths_low_sec") ? aDecoder.decodeInt64(forKey: "combat_deaths_low_sec") : nil
				combatDeathsNullSec = aDecoder.containsValue(forKey: "combat_deaths_null_sec") ? aDecoder.decodeInt64(forKey: "combat_deaths_null_sec") : nil
				combatDeathsPodHighSec = aDecoder.containsValue(forKey: "combat_deaths_pod_high_sec") ? aDecoder.decodeInt64(forKey: "combat_deaths_pod_high_sec") : nil
				combatDeathsPodLowSec = aDecoder.containsValue(forKey: "combat_deaths_pod_low_sec") ? aDecoder.decodeInt64(forKey: "combat_deaths_pod_low_sec") : nil
				combatDeathsPodNullSec = aDecoder.containsValue(forKey: "combat_deaths_pod_null_sec") ? aDecoder.decodeInt64(forKey: "combat_deaths_pod_null_sec") : nil
				combatDeathsPodWormhole = aDecoder.containsValue(forKey: "combat_deaths_pod_wormhole") ? aDecoder.decodeInt64(forKey: "combat_deaths_pod_wormhole") : nil
				combatDeathsWormhole = aDecoder.containsValue(forKey: "combat_deaths_wormhole") ? aDecoder.decodeInt64(forKey: "combat_deaths_wormhole") : nil
				combatDroneEngage = aDecoder.containsValue(forKey: "combat_drone_engage") ? aDecoder.decodeInt64(forKey: "combat_drone_engage") : nil
				combatDuelRequested = aDecoder.containsValue(forKey: "combat_duel_requested") ? aDecoder.decodeInt64(forKey: "combat_duel_requested") : nil
				combatEngagementRegister = aDecoder.containsValue(forKey: "combat_engagement_register") ? aDecoder.decodeInt64(forKey: "combat_engagement_register") : nil
				combatKillsAssists = aDecoder.containsValue(forKey: "combat_kills_assists") ? aDecoder.decodeInt64(forKey: "combat_kills_assists") : nil
				combatKillsHighSec = aDecoder.containsValue(forKey: "combat_kills_high_sec") ? aDecoder.decodeInt64(forKey: "combat_kills_high_sec") : nil
				combatKillsLowSec = aDecoder.containsValue(forKey: "combat_kills_low_sec") ? aDecoder.decodeInt64(forKey: "combat_kills_low_sec") : nil
				combatKillsNullSec = aDecoder.containsValue(forKey: "combat_kills_null_sec") ? aDecoder.decodeInt64(forKey: "combat_kills_null_sec") : nil
				combatKillsPodHighSec = aDecoder.containsValue(forKey: "combat_kills_pod_high_sec") ? aDecoder.decodeInt64(forKey: "combat_kills_pod_high_sec") : nil
				combatKillsPodLowSec = aDecoder.containsValue(forKey: "combat_kills_pod_low_sec") ? aDecoder.decodeInt64(forKey: "combat_kills_pod_low_sec") : nil
				combatKillsPodNullSec = aDecoder.containsValue(forKey: "combat_kills_pod_null_sec") ? aDecoder.decodeInt64(forKey: "combat_kills_pod_null_sec") : nil
				combatKillsPodWormhole = aDecoder.containsValue(forKey: "combat_kills_pod_wormhole") ? aDecoder.decodeInt64(forKey: "combat_kills_pod_wormhole") : nil
				combatKillsWormhole = aDecoder.containsValue(forKey: "combat_kills_wormhole") ? aDecoder.decodeInt64(forKey: "combat_kills_wormhole") : nil
				combatNpcFlagSet = aDecoder.containsValue(forKey: "combat_npc_flag_set") ? aDecoder.decodeInt64(forKey: "combat_npc_flag_set") : nil
				combatPvpFlagSet = aDecoder.containsValue(forKey: "combat_pvp_flag_set") ? aDecoder.decodeInt64(forKey: "combat_pvp_flag_set") : nil
				combatRepairArmorByRemoteAmount = aDecoder.containsValue(forKey: "combat_repair_armor_by_remote_amount") ? aDecoder.decodeInt64(forKey: "combat_repair_armor_by_remote_amount") : nil
				combatRepairArmorRemoteAmount = aDecoder.containsValue(forKey: "combat_repair_armor_remote_amount") ? aDecoder.decodeInt64(forKey: "combat_repair_armor_remote_amount") : nil
				combatRepairArmorSelfAmount = aDecoder.containsValue(forKey: "combat_repair_armor_self_amount") ? aDecoder.decodeInt64(forKey: "combat_repair_armor_self_amount") : nil
				combatRepairCapacitorByRemoteAmount = aDecoder.containsValue(forKey: "combat_repair_capacitor_by_remote_amount") ? aDecoder.decodeInt64(forKey: "combat_repair_capacitor_by_remote_amount") : nil
				combatRepairCapacitorRemoteAmount = aDecoder.containsValue(forKey: "combat_repair_capacitor_remote_amount") ? aDecoder.decodeInt64(forKey: "combat_repair_capacitor_remote_amount") : nil
				combatRepairCapacitorSelfAmount = aDecoder.containsValue(forKey: "combat_repair_capacitor_self_amount") ? aDecoder.decodeInt64(forKey: "combat_repair_capacitor_self_amount") : nil
				combatRepairHullByRemoteAmount = aDecoder.containsValue(forKey: "combat_repair_hull_by_remote_amount") ? aDecoder.decodeInt64(forKey: "combat_repair_hull_by_remote_amount") : nil
				combatRepairHullRemoteAmount = aDecoder.containsValue(forKey: "combat_repair_hull_remote_amount") ? aDecoder.decodeInt64(forKey: "combat_repair_hull_remote_amount") : nil
				combatRepairHullSelfAmount = aDecoder.containsValue(forKey: "combat_repair_hull_self_amount") ? aDecoder.decodeInt64(forKey: "combat_repair_hull_self_amount") : nil
				combatRepairShieldByRemoteAmount = aDecoder.containsValue(forKey: "combat_repair_shield_by_remote_amount") ? aDecoder.decodeInt64(forKey: "combat_repair_shield_by_remote_amount") : nil
				combatRepairShieldRemoteAmount = aDecoder.containsValue(forKey: "combat_repair_shield_remote_amount") ? aDecoder.decodeInt64(forKey: "combat_repair_shield_remote_amount") : nil
				combatRepairShieldSelfAmount = aDecoder.containsValue(forKey: "combat_repair_shield_self_amount") ? aDecoder.decodeInt64(forKey: "combat_repair_shield_self_amount") : nil
				combatSelfDestructs = aDecoder.containsValue(forKey: "combat_self_destructs") ? aDecoder.decodeInt64(forKey: "combat_self_destructs") : nil
				combatWarpScramblePc = aDecoder.containsValue(forKey: "combat_warp_scramble_pc") ? aDecoder.decodeInt64(forKey: "combat_warp_scramble_pc") : nil
				combatWarpScrambledbyNpc = aDecoder.containsValue(forKey: "combat_warp_scrambledby_npc") ? aDecoder.decodeInt64(forKey: "combat_warp_scrambledby_npc") : nil
				combatWarpScrambledbyPc = aDecoder.containsValue(forKey: "combat_warp_scrambledby_pc") ? aDecoder.decodeInt64(forKey: "combat_warp_scrambledby_pc") : nil
				combatWeaponFlagSet = aDecoder.containsValue(forKey: "combat_weapon_flag_set") ? aDecoder.decodeInt64(forKey: "combat_weapon_flag_set") : nil
				combatWebifiedbyNpc = aDecoder.containsValue(forKey: "combat_webifiedby_npc") ? aDecoder.decodeInt64(forKey: "combat_webifiedby_npc") : nil
				combatWebifiedbyPc = aDecoder.containsValue(forKey: "combat_webifiedby_pc") ? aDecoder.decodeInt64(forKey: "combat_webifiedby_pc") : nil
				combatWebifyingPc = aDecoder.containsValue(forKey: "combat_webifying_pc") ? aDecoder.decodeInt64(forKey: "combat_webifying_pc") : nil
				daysOfActivity = aDecoder.containsValue(forKey: "days_of_activity") ? aDecoder.decodeInt64(forKey: "days_of_activity") : nil
				genericConeScans = aDecoder.containsValue(forKey: "generic_cone_scans") ? aDecoder.decodeInt64(forKey: "generic_cone_scans") : nil
				genericRequestScans = aDecoder.containsValue(forKey: "generic_request_scans") ? aDecoder.decodeInt64(forKey: "generic_request_scans") : nil
				industryHackingSuccesses = aDecoder.containsValue(forKey: "industry_hacking_successes") ? aDecoder.decodeInt64(forKey: "industry_hacking_successes") : nil
				industryJobsCancelled = aDecoder.containsValue(forKey: "industry_jobs_cancelled") ? aDecoder.decodeInt64(forKey: "industry_jobs_cancelled") : nil
				industryJobsCompletedCopyBlueprint = aDecoder.containsValue(forKey: "industry_jobs_completed_copy_blueprint") ? aDecoder.decodeInt64(forKey: "industry_jobs_completed_copy_blueprint") : nil
				industryJobsCompletedInvention = aDecoder.containsValue(forKey: "industry_jobs_completed_invention") ? aDecoder.decodeInt64(forKey: "industry_jobs_completed_invention") : nil
				industryJobsCompletedManufacture = aDecoder.containsValue(forKey: "industry_jobs_completed_manufacture") ? aDecoder.decodeInt64(forKey: "industry_jobs_completed_manufacture") : nil
				industryJobsCompletedManufactureAsteroid = aDecoder.containsValue(forKey: "industry_jobs_completed_manufacture_asteroid") ? aDecoder.decodeInt64(forKey: "industry_jobs_completed_manufacture_asteroid") : nil
				industryJobsCompletedManufactureAsteroidQuantity = aDecoder.containsValue(forKey: "industry_jobs_completed_manufacture_asteroid_quantity") ? aDecoder.decodeInt64(forKey: "industry_jobs_completed_manufacture_asteroid_quantity") : nil
				industryJobsCompletedManufactureCharge = aDecoder.containsValue(forKey: "industry_jobs_completed_manufacture_charge") ? aDecoder.decodeInt64(forKey: "industry_jobs_completed_manufacture_charge") : nil
				industryJobsCompletedManufactureChargeQuantity = aDecoder.containsValue(forKey: "industry_jobs_completed_manufacture_charge_quantity") ? aDecoder.decodeInt64(forKey: "industry_jobs_completed_manufacture_charge_quantity") : nil
				industryJobsCompletedManufactureCommodity = aDecoder.containsValue(forKey: "industry_jobs_completed_manufacture_commodity") ? aDecoder.decodeInt64(forKey: "industry_jobs_completed_manufacture_commodity") : nil
				industryJobsCompletedManufactureCommodityQuantity = aDecoder.containsValue(forKey: "industry_jobs_completed_manufacture_commodity_quantity") ? aDecoder.decodeInt64(forKey: "industry_jobs_completed_manufacture_commodity_quantity") : nil
				industryJobsCompletedManufactureDeployable = aDecoder.containsValue(forKey: "industry_jobs_completed_manufacture_deployable") ? aDecoder.decodeInt64(forKey: "industry_jobs_completed_manufacture_deployable") : nil
				industryJobsCompletedManufactureDeployableQuantity = aDecoder.containsValue(forKey: "industry_jobs_completed_manufacture_deployable_quantity") ? aDecoder.decodeInt64(forKey: "industry_jobs_completed_manufacture_deployable_quantity") : nil
				industryJobsCompletedManufactureDrone = aDecoder.containsValue(forKey: "industry_jobs_completed_manufacture_drone") ? aDecoder.decodeInt64(forKey: "industry_jobs_completed_manufacture_drone") : nil
				industryJobsCompletedManufactureDroneQuantity = aDecoder.containsValue(forKey: "industry_jobs_completed_manufacture_drone_quantity") ? aDecoder.decodeInt64(forKey: "industry_jobs_completed_manufacture_drone_quantity") : nil
				industryJobsCompletedManufactureImplant = aDecoder.containsValue(forKey: "industry_jobs_completed_manufacture_implant") ? aDecoder.decodeInt64(forKey: "industry_jobs_completed_manufacture_implant") : nil
				industryJobsCompletedManufactureImplantQuantity = aDecoder.containsValue(forKey: "industry_jobs_completed_manufacture_implant_quantity") ? aDecoder.decodeInt64(forKey: "industry_jobs_completed_manufacture_implant_quantity") : nil
				industryJobsCompletedManufactureModule = aDecoder.containsValue(forKey: "industry_jobs_completed_manufacture_module") ? aDecoder.decodeInt64(forKey: "industry_jobs_completed_manufacture_module") : nil
				industryJobsCompletedManufactureModuleQuantity = aDecoder.containsValue(forKey: "industry_jobs_completed_manufacture_module_quantity") ? aDecoder.decodeInt64(forKey: "industry_jobs_completed_manufacture_module_quantity") : nil
				industryJobsCompletedManufactureOther = aDecoder.containsValue(forKey: "industry_jobs_completed_manufacture_other") ? aDecoder.decodeInt64(forKey: "industry_jobs_completed_manufacture_other") : nil
				industryJobsCompletedManufactureOtherQuantity = aDecoder.containsValue(forKey: "industry_jobs_completed_manufacture_other_quantity") ? aDecoder.decodeInt64(forKey: "industry_jobs_completed_manufacture_other_quantity") : nil
				industryJobsCompletedManufactureShip = aDecoder.containsValue(forKey: "industry_jobs_completed_manufacture_ship") ? aDecoder.decodeInt64(forKey: "industry_jobs_completed_manufacture_ship") : nil
				industryJobsCompletedManufactureShipQuantity = aDecoder.containsValue(forKey: "industry_jobs_completed_manufacture_ship_quantity") ? aDecoder.decodeInt64(forKey: "industry_jobs_completed_manufacture_ship_quantity") : nil
				industryJobsCompletedManufactureStructure = aDecoder.containsValue(forKey: "industry_jobs_completed_manufacture_structure") ? aDecoder.decodeInt64(forKey: "industry_jobs_completed_manufacture_structure") : nil
				industryJobsCompletedManufactureStructureQuantity = aDecoder.containsValue(forKey: "industry_jobs_completed_manufacture_structure_quantity") ? aDecoder.decodeInt64(forKey: "industry_jobs_completed_manufacture_structure_quantity") : nil
				industryJobsCompletedManufactureSubsystem = aDecoder.containsValue(forKey: "industry_jobs_completed_manufacture_subsystem") ? aDecoder.decodeInt64(forKey: "industry_jobs_completed_manufacture_subsystem") : nil
				industryJobsCompletedManufactureSubsystemQuantity = aDecoder.containsValue(forKey: "industry_jobs_completed_manufacture_subsystem_quantity") ? aDecoder.decodeInt64(forKey: "industry_jobs_completed_manufacture_subsystem_quantity") : nil
				industryJobsCompletedMaterialProductivity = aDecoder.containsValue(forKey: "industry_jobs_completed_material_productivity") ? aDecoder.decodeInt64(forKey: "industry_jobs_completed_material_productivity") : nil
				industryJobsCompletedTimeProductivity = aDecoder.containsValue(forKey: "industry_jobs_completed_time_productivity") ? aDecoder.decodeInt64(forKey: "industry_jobs_completed_time_productivity") : nil
				industryJobsStartedCopyBlueprint = aDecoder.containsValue(forKey: "industry_jobs_started_copy_blueprint") ? aDecoder.decodeInt64(forKey: "industry_jobs_started_copy_blueprint") : nil
				industryJobsStartedInvention = aDecoder.containsValue(forKey: "industry_jobs_started_invention") ? aDecoder.decodeInt64(forKey: "industry_jobs_started_invention") : nil
				industryJobsStartedManufacture = aDecoder.containsValue(forKey: "industry_jobs_started_manufacture") ? aDecoder.decodeInt64(forKey: "industry_jobs_started_manufacture") : nil
				industryJobsStartedMaterialProductivity = aDecoder.containsValue(forKey: "industry_jobs_started_material_productivity") ? aDecoder.decodeInt64(forKey: "industry_jobs_started_material_productivity") : nil
				industryJobsStartedTimeProductivity = aDecoder.containsValue(forKey: "industry_jobs_started_time_productivity") ? aDecoder.decodeInt64(forKey: "industry_jobs_started_time_productivity") : nil
				industryReprocessItem = aDecoder.containsValue(forKey: "industry_reprocess_item") ? aDecoder.decodeInt64(forKey: "industry_reprocess_item") : nil
				industryReprocessItemQuantity = aDecoder.containsValue(forKey: "industry_reprocess_item_quantity") ? aDecoder.decodeInt64(forKey: "industry_reprocess_item_quantity") : nil
				inventoryAbandonLootQuantity = aDecoder.containsValue(forKey: "inventory_abandon_loot_quantity") ? aDecoder.decodeInt64(forKey: "inventory_abandon_loot_quantity") : nil
				inventoryTrashItemQuantity = aDecoder.containsValue(forKey: "inventory_trash_item_quantity") ? aDecoder.decodeInt64(forKey: "inventory_trash_item_quantity") : nil
				iskIn = aDecoder.containsValue(forKey: "isk_in") ? aDecoder.decodeInt64(forKey: "isk_in") : nil
				iskOut = aDecoder.containsValue(forKey: "isk_out") ? aDecoder.decodeInt64(forKey: "isk_out") : nil
				marketAcceptContractsCourier = aDecoder.containsValue(forKey: "market_accept_contracts_courier") ? aDecoder.decodeInt64(forKey: "market_accept_contracts_courier") : nil
				marketAcceptContractsItemExchange = aDecoder.containsValue(forKey: "market_accept_contracts_item_exchange") ? aDecoder.decodeInt64(forKey: "market_accept_contracts_item_exchange") : nil
				marketBuyOrdersPlaced = aDecoder.containsValue(forKey: "market_buy_orders_placed") ? aDecoder.decodeInt64(forKey: "market_buy_orders_placed") : nil
				marketCancelMarketOrder = aDecoder.containsValue(forKey: "market_cancel_market_order") ? aDecoder.decodeInt64(forKey: "market_cancel_market_order") : nil
				marketCreateContractsAuction = aDecoder.containsValue(forKey: "market_create_contracts_auction") ? aDecoder.decodeInt64(forKey: "market_create_contracts_auction") : nil
				marketCreateContractsCourier = aDecoder.containsValue(forKey: "market_create_contracts_courier") ? aDecoder.decodeInt64(forKey: "market_create_contracts_courier") : nil
				marketCreateContractsItemExchange = aDecoder.containsValue(forKey: "market_create_contracts_item_exchange") ? aDecoder.decodeInt64(forKey: "market_create_contracts_item_exchange") : nil
				marketDeliverCourierContract = aDecoder.containsValue(forKey: "market_deliver_courier_contract") ? aDecoder.decodeInt64(forKey: "market_deliver_courier_contract") : nil
				marketIskGained = aDecoder.containsValue(forKey: "market_isk_gained") ? aDecoder.decodeInt64(forKey: "market_isk_gained") : nil
				marketIskSpent = aDecoder.containsValue(forKey: "market_isk_spent") ? aDecoder.decodeInt64(forKey: "market_isk_spent") : nil
				marketModifyMarketOrder = aDecoder.containsValue(forKey: "market_modify_market_order") ? aDecoder.decodeInt64(forKey: "market_modify_market_order") : nil
				marketSearchContracts = aDecoder.containsValue(forKey: "market_search_contracts") ? aDecoder.decodeInt64(forKey: "market_search_contracts") : nil
				marketSellOrdersPlaced = aDecoder.containsValue(forKey: "market_sell_orders_placed") ? aDecoder.decodeInt64(forKey: "market_sell_orders_placed") : nil
				miningDroneMine = aDecoder.containsValue(forKey: "mining_drone_mine") ? aDecoder.decodeInt64(forKey: "mining_drone_mine") : nil
				miningOreArkonor = aDecoder.containsValue(forKey: "mining_ore_arkonor") ? aDecoder.decodeInt64(forKey: "mining_ore_arkonor") : nil
				miningOreBistot = aDecoder.containsValue(forKey: "mining_ore_bistot") ? aDecoder.decodeInt64(forKey: "mining_ore_bistot") : nil
				miningOreCrokite = aDecoder.containsValue(forKey: "mining_ore_crokite") ? aDecoder.decodeInt64(forKey: "mining_ore_crokite") : nil
				miningOreDarkOchre = aDecoder.containsValue(forKey: "mining_ore_dark_ochre") ? aDecoder.decodeInt64(forKey: "mining_ore_dark_ochre") : nil
				miningOreGneiss = aDecoder.containsValue(forKey: "mining_ore_gneiss") ? aDecoder.decodeInt64(forKey: "mining_ore_gneiss") : nil
				miningOreHarvestableCloud = aDecoder.containsValue(forKey: "mining_ore_harvestable_cloud") ? aDecoder.decodeInt64(forKey: "mining_ore_harvestable_cloud") : nil
				miningOreHedbergite = aDecoder.containsValue(forKey: "mining_ore_hedbergite") ? aDecoder.decodeInt64(forKey: "mining_ore_hedbergite") : nil
				miningOreHemorphite = aDecoder.containsValue(forKey: "mining_ore_hemorphite") ? aDecoder.decodeInt64(forKey: "mining_ore_hemorphite") : nil
				miningOreIce = aDecoder.containsValue(forKey: "mining_ore_ice") ? aDecoder.decodeInt64(forKey: "mining_ore_ice") : nil
				miningOreJaspet = aDecoder.containsValue(forKey: "mining_ore_jaspet") ? aDecoder.decodeInt64(forKey: "mining_ore_jaspet") : nil
				miningOreKernite = aDecoder.containsValue(forKey: "mining_ore_kernite") ? aDecoder.decodeInt64(forKey: "mining_ore_kernite") : nil
				miningOreMercoxit = aDecoder.containsValue(forKey: "mining_ore_mercoxit") ? aDecoder.decodeInt64(forKey: "mining_ore_mercoxit") : nil
				miningOreOmber = aDecoder.containsValue(forKey: "mining_ore_omber") ? aDecoder.decodeInt64(forKey: "mining_ore_omber") : nil
				miningOrePlagioclase = aDecoder.containsValue(forKey: "mining_ore_plagioclase") ? aDecoder.decodeInt64(forKey: "mining_ore_plagioclase") : nil
				miningOrePyroxeres = aDecoder.containsValue(forKey: "mining_ore_pyroxeres") ? aDecoder.decodeInt64(forKey: "mining_ore_pyroxeres") : nil
				miningOreScordite = aDecoder.containsValue(forKey: "mining_ore_scordite") ? aDecoder.decodeInt64(forKey: "mining_ore_scordite") : nil
				miningOreSpodumain = aDecoder.containsValue(forKey: "mining_ore_spodumain") ? aDecoder.decodeInt64(forKey: "mining_ore_spodumain") : nil
				miningOreVeldspar = aDecoder.containsValue(forKey: "mining_ore_veldspar") ? aDecoder.decodeInt64(forKey: "mining_ore_veldspar") : nil
				moduleActivationsArmorHardener = aDecoder.containsValue(forKey: "module_activations_armor_hardener") ? aDecoder.decodeInt64(forKey: "module_activations_armor_hardener") : nil
				moduleActivationsArmorRepairUnit = aDecoder.containsValue(forKey: "module_activations_armor_repair_unit") ? aDecoder.decodeInt64(forKey: "module_activations_armor_repair_unit") : nil
				moduleActivationsArmorResistanceShiftHardener = aDecoder.containsValue(forKey: "module_activations_armor_resistance_shift_hardener") ? aDecoder.decodeInt64(forKey: "module_activations_armor_resistance_shift_hardener") : nil
				moduleActivationsAutomatedTargetingSystem = aDecoder.containsValue(forKey: "module_activations_automated_targeting_system") ? aDecoder.decodeInt64(forKey: "module_activations_automated_targeting_system") : nil
				moduleActivationsBastion = aDecoder.containsValue(forKey: "module_activations_bastion") ? aDecoder.decodeInt64(forKey: "module_activations_bastion") : nil
				moduleActivationsBombLauncher = aDecoder.containsValue(forKey: "module_activations_bomb_launcher") ? aDecoder.decodeInt64(forKey: "module_activations_bomb_launcher") : nil
				moduleActivationsCapacitorBooster = aDecoder.containsValue(forKey: "module_activations_capacitor_booster") ? aDecoder.decodeInt64(forKey: "module_activations_capacitor_booster") : nil
				moduleActivationsCargoScanner = aDecoder.containsValue(forKey: "module_activations_cargo_scanner") ? aDecoder.decodeInt64(forKey: "module_activations_cargo_scanner") : nil
				moduleActivationsCloakingDevice = aDecoder.containsValue(forKey: "module_activations_cloaking_device") ? aDecoder.decodeInt64(forKey: "module_activations_cloaking_device") : nil
				moduleActivationsCloneVatBay = aDecoder.containsValue(forKey: "module_activations_clone_vat_bay") ? aDecoder.decodeInt64(forKey: "module_activations_clone_vat_bay") : nil
				moduleActivationsCynosuralField = aDecoder.containsValue(forKey: "module_activations_cynosural_field") ? aDecoder.decodeInt64(forKey: "module_activations_cynosural_field") : nil
				moduleActivationsDamageControl = aDecoder.containsValue(forKey: "module_activations_damage_control") ? aDecoder.decodeInt64(forKey: "module_activations_damage_control") : nil
				moduleActivationsDataMiners = aDecoder.containsValue(forKey: "module_activations_data_miners") ? aDecoder.decodeInt64(forKey: "module_activations_data_miners") : nil
				moduleActivationsDroneControlUnit = aDecoder.containsValue(forKey: "module_activations_drone_control_unit") ? aDecoder.decodeInt64(forKey: "module_activations_drone_control_unit") : nil
				moduleActivationsDroneTrackingModules = aDecoder.containsValue(forKey: "module_activations_drone_tracking_modules") ? aDecoder.decodeInt64(forKey: "module_activations_drone_tracking_modules") : nil
				moduleActivationsEccm = aDecoder.containsValue(forKey: "module_activations_eccm") ? aDecoder.decodeInt64(forKey: "module_activations_eccm") : nil
				moduleActivationsEcm = aDecoder.containsValue(forKey: "module_activations_ecm") ? aDecoder.decodeInt64(forKey: "module_activations_ecm") : nil
				moduleActivationsEcmBurst = aDecoder.containsValue(forKey: "module_activations_ecm_burst") ? aDecoder.decodeInt64(forKey: "module_activations_ecm_burst") : nil
				moduleActivationsEnergyDestabilizer = aDecoder.containsValue(forKey: "module_activations_energy_destabilizer") ? aDecoder.decodeInt64(forKey: "module_activations_energy_destabilizer") : nil
				moduleActivationsEnergyVampire = aDecoder.containsValue(forKey: "module_activations_energy_vampire") ? aDecoder.decodeInt64(forKey: "module_activations_energy_vampire") : nil
				moduleActivationsEnergyWeapon = aDecoder.containsValue(forKey: "module_activations_energy_weapon") ? aDecoder.decodeInt64(forKey: "module_activations_energy_weapon") : nil
				moduleActivationsFestivalLauncher = aDecoder.containsValue(forKey: "module_activations_festival_launcher") ? aDecoder.decodeInt64(forKey: "module_activations_festival_launcher") : nil
				moduleActivationsFrequencyMiningLaser = aDecoder.containsValue(forKey: "module_activations_frequency_mining_laser") ? aDecoder.decodeInt64(forKey: "module_activations_frequency_mining_laser") : nil
				moduleActivationsFueledArmorRepairer = aDecoder.containsValue(forKey: "module_activations_fueled_armor_repairer") ? aDecoder.decodeInt64(forKey: "module_activations_fueled_armor_repairer") : nil
				moduleActivationsFueledShieldBooster = aDecoder.containsValue(forKey: "module_activations_fueled_shield_booster") ? aDecoder.decodeInt64(forKey: "module_activations_fueled_shield_booster") : nil
				moduleActivationsGangCoordinator = aDecoder.containsValue(forKey: "module_activations_gang_coordinator") ? aDecoder.decodeInt64(forKey: "module_activations_gang_coordinator") : nil
				moduleActivationsGasCloudHarvester = aDecoder.containsValue(forKey: "module_activations_gas_cloud_harvester") ? aDecoder.decodeInt64(forKey: "module_activations_gas_cloud_harvester") : nil
				moduleActivationsHullRepairUnit = aDecoder.containsValue(forKey: "module_activations_hull_repair_unit") ? aDecoder.decodeInt64(forKey: "module_activations_hull_repair_unit") : nil
				moduleActivationsHybridWeapon = aDecoder.containsValue(forKey: "module_activations_hybrid_weapon") ? aDecoder.decodeInt64(forKey: "module_activations_hybrid_weapon") : nil
				moduleActivationsIndustrialCore = aDecoder.containsValue(forKey: "module_activations_industrial_core") ? aDecoder.decodeInt64(forKey: "module_activations_industrial_core") : nil
				moduleActivationsInterdictionSphereLauncher = aDecoder.containsValue(forKey: "module_activations_interdiction_sphere_launcher") ? aDecoder.decodeInt64(forKey: "module_activations_interdiction_sphere_launcher") : nil
				moduleActivationsMicroJumpDrive = aDecoder.containsValue(forKey: "module_activations_micro_jump_drive") ? aDecoder.decodeInt64(forKey: "module_activations_micro_jump_drive") : nil
				moduleActivationsMiningLaser = aDecoder.containsValue(forKey: "module_activations_mining_laser") ? aDecoder.decodeInt64(forKey: "module_activations_mining_laser") : nil
				moduleActivationsMissileLauncher = aDecoder.containsValue(forKey: "module_activations_missile_launcher") ? aDecoder.decodeInt64(forKey: "module_activations_missile_launcher") : nil
				moduleActivationsPassiveTargetingSystem = aDecoder.containsValue(forKey: "module_activations_passive_targeting_system") ? aDecoder.decodeInt64(forKey: "module_activations_passive_targeting_system") : nil
				moduleActivationsProbeLauncher = aDecoder.containsValue(forKey: "module_activations_probe_launcher") ? aDecoder.decodeInt64(forKey: "module_activations_probe_launcher") : nil
				moduleActivationsProjectedEccm = aDecoder.containsValue(forKey: "module_activations_projected_eccm") ? aDecoder.decodeInt64(forKey: "module_activations_projected_eccm") : nil
				moduleActivationsProjectileWeapon = aDecoder.containsValue(forKey: "module_activations_projectile_weapon") ? aDecoder.decodeInt64(forKey: "module_activations_projectile_weapon") : nil
				moduleActivationsPropulsionModule = aDecoder.containsValue(forKey: "module_activations_propulsion_module") ? aDecoder.decodeInt64(forKey: "module_activations_propulsion_module") : nil
				moduleActivationsRemoteArmorRepairer = aDecoder.containsValue(forKey: "module_activations_remote_armor_repairer") ? aDecoder.decodeInt64(forKey: "module_activations_remote_armor_repairer") : nil
				moduleActivationsRemoteCapacitorTransmitter = aDecoder.containsValue(forKey: "module_activations_remote_capacitor_transmitter") ? aDecoder.decodeInt64(forKey: "module_activations_remote_capacitor_transmitter") : nil
				moduleActivationsRemoteEcmBurst = aDecoder.containsValue(forKey: "module_activations_remote_ecm_burst") ? aDecoder.decodeInt64(forKey: "module_activations_remote_ecm_burst") : nil
				moduleActivationsRemoteHullRepairer = aDecoder.containsValue(forKey: "module_activations_remote_hull_repairer") ? aDecoder.decodeInt64(forKey: "module_activations_remote_hull_repairer") : nil
				moduleActivationsRemoteSensorBooster = aDecoder.containsValue(forKey: "module_activations_remote_sensor_booster") ? aDecoder.decodeInt64(forKey: "module_activations_remote_sensor_booster") : nil
				moduleActivationsRemoteSensorDamper = aDecoder.containsValue(forKey: "module_activations_remote_sensor_damper") ? aDecoder.decodeInt64(forKey: "module_activations_remote_sensor_damper") : nil
				moduleActivationsRemoteShieldBooster = aDecoder.containsValue(forKey: "module_activations_remote_shield_booster") ? aDecoder.decodeInt64(forKey: "module_activations_remote_shield_booster") : nil
				moduleActivationsRemoteTrackingComputer = aDecoder.containsValue(forKey: "module_activations_remote_tracking_computer") ? aDecoder.decodeInt64(forKey: "module_activations_remote_tracking_computer") : nil
				moduleActivationsSalvager = aDecoder.containsValue(forKey: "module_activations_salvager") ? aDecoder.decodeInt64(forKey: "module_activations_salvager") : nil
				moduleActivationsSensorBooster = aDecoder.containsValue(forKey: "module_activations_sensor_booster") ? aDecoder.decodeInt64(forKey: "module_activations_sensor_booster") : nil
				moduleActivationsShieldBooster = aDecoder.containsValue(forKey: "module_activations_shield_booster") ? aDecoder.decodeInt64(forKey: "module_activations_shield_booster") : nil
				moduleActivationsShieldHardener = aDecoder.containsValue(forKey: "module_activations_shield_hardener") ? aDecoder.decodeInt64(forKey: "module_activations_shield_hardener") : nil
				moduleActivationsShipScanner = aDecoder.containsValue(forKey: "module_activations_ship_scanner") ? aDecoder.decodeInt64(forKey: "module_activations_ship_scanner") : nil
				moduleActivationsSiege = aDecoder.containsValue(forKey: "module_activations_siege") ? aDecoder.decodeInt64(forKey: "module_activations_siege") : nil
				moduleActivationsSmartBomb = aDecoder.containsValue(forKey: "module_activations_smart_bomb") ? aDecoder.decodeInt64(forKey: "module_activations_smart_bomb") : nil
				moduleActivationsStasisWeb = aDecoder.containsValue(forKey: "module_activations_stasis_web") ? aDecoder.decodeInt64(forKey: "module_activations_stasis_web") : nil
				moduleActivationsStripMiner = aDecoder.containsValue(forKey: "module_activations_strip_miner") ? aDecoder.decodeInt64(forKey: "module_activations_strip_miner") : nil
				moduleActivationsSuperWeapon = aDecoder.containsValue(forKey: "module_activations_super_weapon") ? aDecoder.decodeInt64(forKey: "module_activations_super_weapon") : nil
				moduleActivationsSurveyScanner = aDecoder.containsValue(forKey: "module_activations_survey_scanner") ? aDecoder.decodeInt64(forKey: "module_activations_survey_scanner") : nil
				moduleActivationsTargetBreaker = aDecoder.containsValue(forKey: "module_activations_target_breaker") ? aDecoder.decodeInt64(forKey: "module_activations_target_breaker") : nil
				moduleActivationsTargetPainter = aDecoder.containsValue(forKey: "module_activations_target_painter") ? aDecoder.decodeInt64(forKey: "module_activations_target_painter") : nil
				moduleActivationsTrackingComputer = aDecoder.containsValue(forKey: "module_activations_tracking_computer") ? aDecoder.decodeInt64(forKey: "module_activations_tracking_computer") : nil
				moduleActivationsTrackingDisruptor = aDecoder.containsValue(forKey: "module_activations_tracking_disruptor") ? aDecoder.decodeInt64(forKey: "module_activations_tracking_disruptor") : nil
				moduleActivationsTractorBeam = aDecoder.containsValue(forKey: "module_activations_tractor_beam") ? aDecoder.decodeInt64(forKey: "module_activations_tractor_beam") : nil
				moduleActivationsTriage = aDecoder.containsValue(forKey: "module_activations_triage") ? aDecoder.decodeInt64(forKey: "module_activations_triage") : nil
				moduleActivationsWarpDisruptFieldGenerator = aDecoder.containsValue(forKey: "module_activations_warp_disrupt_field_generator") ? aDecoder.decodeInt64(forKey: "module_activations_warp_disrupt_field_generator") : nil
				moduleActivationsWarpScrambler = aDecoder.containsValue(forKey: "module_activations_warp_scrambler") ? aDecoder.decodeInt64(forKey: "module_activations_warp_scrambler") : nil
				moduleLinkWeapons = aDecoder.containsValue(forKey: "module_link_weapons") ? aDecoder.decodeInt64(forKey: "module_link_weapons") : nil
				moduleOverload = aDecoder.containsValue(forKey: "module_overload") ? aDecoder.decodeInt64(forKey: "module_overload") : nil
				moduleRepairs = aDecoder.containsValue(forKey: "module_repairs") ? aDecoder.decodeInt64(forKey: "module_repairs") : nil
				orbitalStrikeCharactersKilled = aDecoder.containsValue(forKey: "orbital_strike_characters_killed") ? aDecoder.decodeInt64(forKey: "orbital_strike_characters_killed") : nil
				orbitalStrikeDamageToPlayersArmorAmount = aDecoder.containsValue(forKey: "orbital_strike_damage_to_players_armor_amount") ? aDecoder.decodeInt64(forKey: "orbital_strike_damage_to_players_armor_amount") : nil
				orbitalStrikeDamageToPlayersShieldAmount = aDecoder.containsValue(forKey: "orbital_strike_damage_to_players_shield_amount") ? aDecoder.decodeInt64(forKey: "orbital_strike_damage_to_players_shield_amount") : nil
				pveDungeonsCompletedAgent = aDecoder.containsValue(forKey: "pve_dungeons_completed_agent") ? aDecoder.decodeInt64(forKey: "pve_dungeons_completed_agent") : nil
				pveDungeonsCompletedDistribution = aDecoder.containsValue(forKey: "pve_dungeons_completed_distribution") ? aDecoder.decodeInt64(forKey: "pve_dungeons_completed_distribution") : nil
				pveMissionsSucceeded = aDecoder.containsValue(forKey: "pve_missions_succeeded") ? aDecoder.decodeInt64(forKey: "pve_missions_succeeded") : nil
				pveMissionsSucceededEpicArc = aDecoder.containsValue(forKey: "pve_missions_succeeded_epic_arc") ? aDecoder.decodeInt64(forKey: "pve_missions_succeeded_epic_arc") : nil
				socialAddContactBad = aDecoder.containsValue(forKey: "social_add_contact_bad") ? aDecoder.decodeInt64(forKey: "social_add_contact_bad") : nil
				socialAddContactGood = aDecoder.containsValue(forKey: "social_add_contact_good") ? aDecoder.decodeInt64(forKey: "social_add_contact_good") : nil
				socialAddContactHigh = aDecoder.containsValue(forKey: "social_add_contact_high") ? aDecoder.decodeInt64(forKey: "social_add_contact_high") : nil
				socialAddContactHorrible = aDecoder.containsValue(forKey: "social_add_contact_horrible") ? aDecoder.decodeInt64(forKey: "social_add_contact_horrible") : nil
				socialAddContactNeutral = aDecoder.containsValue(forKey: "social_add_contact_neutral") ? aDecoder.decodeInt64(forKey: "social_add_contact_neutral") : nil
				socialAddNote = aDecoder.containsValue(forKey: "social_add_note") ? aDecoder.decodeInt64(forKey: "social_add_note") : nil
				socialAddedAsContactBad = aDecoder.containsValue(forKey: "social_added_as_contact_bad") ? aDecoder.decodeInt64(forKey: "social_added_as_contact_bad") : nil
				socialAddedAsContactGood = aDecoder.containsValue(forKey: "social_added_as_contact_good") ? aDecoder.decodeInt64(forKey: "social_added_as_contact_good") : nil
				socialAddedAsContactHigh = aDecoder.containsValue(forKey: "social_added_as_contact_high") ? aDecoder.decodeInt64(forKey: "social_added_as_contact_high") : nil
				socialAddedAsContactHorrible = aDecoder.containsValue(forKey: "social_added_as_contact_horrible") ? aDecoder.decodeInt64(forKey: "social_added_as_contact_horrible") : nil
				socialAddedAsContactNeutral = aDecoder.containsValue(forKey: "social_added_as_contact_neutral") ? aDecoder.decodeInt64(forKey: "social_added_as_contact_neutral") : nil
				socialCalendarEventCreated = aDecoder.containsValue(forKey: "social_calendar_event_created") ? aDecoder.decodeInt64(forKey: "social_calendar_event_created") : nil
				socialChatMessagesAlliance = aDecoder.containsValue(forKey: "social_chat_messages_alliance") ? aDecoder.decodeInt64(forKey: "social_chat_messages_alliance") : nil
				socialChatMessagesConstellation = aDecoder.containsValue(forKey: "social_chat_messages_constellation") ? aDecoder.decodeInt64(forKey: "social_chat_messages_constellation") : nil
				socialChatMessagesCorporation = aDecoder.containsValue(forKey: "social_chat_messages_corporation") ? aDecoder.decodeInt64(forKey: "social_chat_messages_corporation") : nil
				socialChatMessagesFleet = aDecoder.containsValue(forKey: "social_chat_messages_fleet") ? aDecoder.decodeInt64(forKey: "social_chat_messages_fleet") : nil
				socialChatMessagesRegion = aDecoder.containsValue(forKey: "social_chat_messages_region") ? aDecoder.decodeInt64(forKey: "social_chat_messages_region") : nil
				socialChatMessagesSolarsystem = aDecoder.containsValue(forKey: "social_chat_messages_solarsystem") ? aDecoder.decodeInt64(forKey: "social_chat_messages_solarsystem") : nil
				socialChatMessagesWarfaction = aDecoder.containsValue(forKey: "social_chat_messages_warfaction") ? aDecoder.decodeInt64(forKey: "social_chat_messages_warfaction") : nil
				socialChatTotalMessageLength = aDecoder.containsValue(forKey: "social_chat_total_message_length") ? aDecoder.decodeInt64(forKey: "social_chat_total_message_length") : nil
				socialDirectTrades = aDecoder.containsValue(forKey: "social_direct_trades") ? aDecoder.decodeInt64(forKey: "social_direct_trades") : nil
				socialFleetBroadcasts = aDecoder.containsValue(forKey: "social_fleet_broadcasts") ? aDecoder.decodeInt64(forKey: "social_fleet_broadcasts") : nil
				socialFleetJoins = aDecoder.containsValue(forKey: "social_fleet_joins") ? aDecoder.decodeInt64(forKey: "social_fleet_joins") : nil
				socialMailsReceived = aDecoder.containsValue(forKey: "social_mails_received") ? aDecoder.decodeInt64(forKey: "social_mails_received") : nil
				socialMailsSent = aDecoder.containsValue(forKey: "social_mails_sent") ? aDecoder.decodeInt64(forKey: "social_mails_sent") : nil
				travelAccelerationGateActivations = aDecoder.containsValue(forKey: "travel_acceleration_gate_activations") ? aDecoder.decodeInt64(forKey: "travel_acceleration_gate_activations") : nil
				travelAlignTo = aDecoder.containsValue(forKey: "travel_align_to") ? aDecoder.decodeInt64(forKey: "travel_align_to") : nil
				travelDistanceWarpedHighSec = aDecoder.containsValue(forKey: "travel_distance_warped_high_sec") ? aDecoder.decodeInt64(forKey: "travel_distance_warped_high_sec") : nil
				travelDistanceWarpedLowSec = aDecoder.containsValue(forKey: "travel_distance_warped_low_sec") ? aDecoder.decodeInt64(forKey: "travel_distance_warped_low_sec") : nil
				travelDistanceWarpedNullSec = aDecoder.containsValue(forKey: "travel_distance_warped_null_sec") ? aDecoder.decodeInt64(forKey: "travel_distance_warped_null_sec") : nil
				travelDistanceWarpedWormhole = aDecoder.containsValue(forKey: "travel_distance_warped_wormhole") ? aDecoder.decodeInt64(forKey: "travel_distance_warped_wormhole") : nil
				travelDocksHighSec = aDecoder.containsValue(forKey: "travel_docks_high_sec") ? aDecoder.decodeInt64(forKey: "travel_docks_high_sec") : nil
				travelDocksLowSec = aDecoder.containsValue(forKey: "travel_docks_low_sec") ? aDecoder.decodeInt64(forKey: "travel_docks_low_sec") : nil
				travelDocksNullSec = aDecoder.containsValue(forKey: "travel_docks_null_sec") ? aDecoder.decodeInt64(forKey: "travel_docks_null_sec") : nil
				travelJumpsStargateHighSec = aDecoder.containsValue(forKey: "travel_jumps_stargate_high_sec") ? aDecoder.decodeInt64(forKey: "travel_jumps_stargate_high_sec") : nil
				travelJumpsStargateLowSec = aDecoder.containsValue(forKey: "travel_jumps_stargate_low_sec") ? aDecoder.decodeInt64(forKey: "travel_jumps_stargate_low_sec") : nil
				travelJumpsStargateNullSec = aDecoder.containsValue(forKey: "travel_jumps_stargate_null_sec") ? aDecoder.decodeInt64(forKey: "travel_jumps_stargate_null_sec") : nil
				travelJumpsWormhole = aDecoder.containsValue(forKey: "travel_jumps_wormhole") ? aDecoder.decodeInt64(forKey: "travel_jumps_wormhole") : nil
				travelWarpsHighSec = aDecoder.containsValue(forKey: "travel_warps_high_sec") ? aDecoder.decodeInt64(forKey: "travel_warps_high_sec") : nil
				travelWarpsLowSec = aDecoder.containsValue(forKey: "travel_warps_low_sec") ? aDecoder.decodeInt64(forKey: "travel_warps_low_sec") : nil
				travelWarpsNullSec = aDecoder.containsValue(forKey: "travel_warps_null_sec") ? aDecoder.decodeInt64(forKey: "travel_warps_null_sec") : nil
				travelWarpsToBookmark = aDecoder.containsValue(forKey: "travel_warps_to_bookmark") ? aDecoder.decodeInt64(forKey: "travel_warps_to_bookmark") : nil
				travelWarpsToCelestial = aDecoder.containsValue(forKey: "travel_warps_to_celestial") ? aDecoder.decodeInt64(forKey: "travel_warps_to_celestial") : nil
				travelWarpsToFleetMember = aDecoder.containsValue(forKey: "travel_warps_to_fleet_member") ? aDecoder.decodeInt64(forKey: "travel_warps_to_fleet_member") : nil
				travelWarpsToScanResult = aDecoder.containsValue(forKey: "travel_warps_to_scan_result") ? aDecoder.decodeInt64(forKey: "travel_warps_to_scan_result") : nil
				travelWarpsWormhole = aDecoder.containsValue(forKey: "travel_warps_wormhole") ? aDecoder.decodeInt64(forKey: "travel_warps_wormhole") : nil
				year = aDecoder.decodeInteger(forKey: "year")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = characterMinutes {
					aCoder.encode(v, forKey: "character_minutes")
				}
				if let v = characterSessionsStarted {
					aCoder.encode(v, forKey: "character_sessions_started")
				}
				if let v = combatCapDrainedbyNpc {
					aCoder.encode(v, forKey: "combat_cap_drainedby_npc")
				}
				if let v = combatCapDrainedbyPc {
					aCoder.encode(v, forKey: "combat_cap_drainedby_pc")
				}
				if let v = combatCapDrainingPc {
					aCoder.encode(v, forKey: "combat_cap_draining_pc")
				}
				if let v = combatCriminalFlagSet {
					aCoder.encode(v, forKey: "combat_criminal_flag_set")
				}
				if let v = combatDamageFromNpCsAmount {
					aCoder.encode(v, forKey: "combat_damage_from_np_cs_amount")
				}
				if let v = combatDamageFromNpCsNumShots {
					aCoder.encode(v, forKey: "combat_damage_from_np_cs_num_shots")
				}
				if let v = combatDamageFromPlayersBombAmount {
					aCoder.encode(v, forKey: "combat_damage_from_players_bomb_amount")
				}
				if let v = combatDamageFromPlayersBombNumShots {
					aCoder.encode(v, forKey: "combat_damage_from_players_bomb_num_shots")
				}
				if let v = combatDamageFromPlayersCombatDroneAmount {
					aCoder.encode(v, forKey: "combat_damage_from_players_combat_drone_amount")
				}
				if let v = combatDamageFromPlayersCombatDroneNumShots {
					aCoder.encode(v, forKey: "combat_damage_from_players_combat_drone_num_shots")
				}
				if let v = combatDamageFromPlayersEnergyAmount {
					aCoder.encode(v, forKey: "combat_damage_from_players_energy_amount")
				}
				if let v = combatDamageFromPlayersEnergyNumShots {
					aCoder.encode(v, forKey: "combat_damage_from_players_energy_num_shots")
				}
				if let v = combatDamageFromPlayersFighterBomberAmount {
					aCoder.encode(v, forKey: "combat_damage_from_players_fighter_bomber_amount")
				}
				if let v = combatDamageFromPlayersFighterBomberNumShots {
					aCoder.encode(v, forKey: "combat_damage_from_players_fighter_bomber_num_shots")
				}
				if let v = combatDamageFromPlayersFighterDroneAmount {
					aCoder.encode(v, forKey: "combat_damage_from_players_fighter_drone_amount")
				}
				if let v = combatDamageFromPlayersFighterDroneNumShots {
					aCoder.encode(v, forKey: "combat_damage_from_players_fighter_drone_num_shots")
				}
				if let v = combatDamageFromPlayersHybridAmount {
					aCoder.encode(v, forKey: "combat_damage_from_players_hybrid_amount")
				}
				if let v = combatDamageFromPlayersHybridNumShots {
					aCoder.encode(v, forKey: "combat_damage_from_players_hybrid_num_shots")
				}
				if let v = combatDamageFromPlayersMissileAmount {
					aCoder.encode(v, forKey: "combat_damage_from_players_missile_amount")
				}
				if let v = combatDamageFromPlayersMissileNumShots {
					aCoder.encode(v, forKey: "combat_damage_from_players_missile_num_shots")
				}
				if let v = combatDamageFromPlayersProjectileAmount {
					aCoder.encode(v, forKey: "combat_damage_from_players_projectile_amount")
				}
				if let v = combatDamageFromPlayersProjectileNumShots {
					aCoder.encode(v, forKey: "combat_damage_from_players_projectile_num_shots")
				}
				if let v = combatDamageFromPlayersSmartBombAmount {
					aCoder.encode(v, forKey: "combat_damage_from_players_smart_bomb_amount")
				}
				if let v = combatDamageFromPlayersSmartBombNumShots {
					aCoder.encode(v, forKey: "combat_damage_from_players_smart_bomb_num_shots")
				}
				if let v = combatDamageFromPlayersSuperAmount {
					aCoder.encode(v, forKey: "combat_damage_from_players_super_amount")
				}
				if let v = combatDamageFromPlayersSuperNumShots {
					aCoder.encode(v, forKey: "combat_damage_from_players_super_num_shots")
				}
				if let v = combatDamageFromStructuresTotalAmount {
					aCoder.encode(v, forKey: "combat_damage_from_structures_total_amount")
				}
				if let v = combatDamageFromStructuresTotalNumShots {
					aCoder.encode(v, forKey: "combat_damage_from_structures_total_num_shots")
				}
				if let v = combatDamageToPlayersBombAmount {
					aCoder.encode(v, forKey: "combat_damage_to_players_bomb_amount")
				}
				if let v = combatDamageToPlayersBombNumShots {
					aCoder.encode(v, forKey: "combat_damage_to_players_bomb_num_shots")
				}
				if let v = combatDamageToPlayersCombatDroneAmount {
					aCoder.encode(v, forKey: "combat_damage_to_players_combat_drone_amount")
				}
				if let v = combatDamageToPlayersCombatDroneNumShots {
					aCoder.encode(v, forKey: "combat_damage_to_players_combat_drone_num_shots")
				}
				if let v = combatDamageToPlayersEnergyAmount {
					aCoder.encode(v, forKey: "combat_damage_to_players_energy_amount")
				}
				if let v = combatDamageToPlayersEnergyNumShots {
					aCoder.encode(v, forKey: "combat_damage_to_players_energy_num_shots")
				}
				if let v = combatDamageToPlayersFighterBomberAmount {
					aCoder.encode(v, forKey: "combat_damage_to_players_fighter_bomber_amount")
				}
				if let v = combatDamageToPlayersFighterBomberNumShots {
					aCoder.encode(v, forKey: "combat_damage_to_players_fighter_bomber_num_shots")
				}
				if let v = combatDamageToPlayersFighterDroneAmount {
					aCoder.encode(v, forKey: "combat_damage_to_players_fighter_drone_amount")
				}
				if let v = combatDamageToPlayersFighterDroneNumShots {
					aCoder.encode(v, forKey: "combat_damage_to_players_fighter_drone_num_shots")
				}
				if let v = combatDamageToPlayersHybridAmount {
					aCoder.encode(v, forKey: "combat_damage_to_players_hybrid_amount")
				}
				if let v = combatDamageToPlayersHybridNumShots {
					aCoder.encode(v, forKey: "combat_damage_to_players_hybrid_num_shots")
				}
				if let v = combatDamageToPlayersMissileAmount {
					aCoder.encode(v, forKey: "combat_damage_to_players_missile_amount")
				}
				if let v = combatDamageToPlayersMissileNumShots {
					aCoder.encode(v, forKey: "combat_damage_to_players_missile_num_shots")
				}
				if let v = combatDamageToPlayersProjectileAmount {
					aCoder.encode(v, forKey: "combat_damage_to_players_projectile_amount")
				}
				if let v = combatDamageToPlayersProjectileNumShots {
					aCoder.encode(v, forKey: "combat_damage_to_players_projectile_num_shots")
				}
				if let v = combatDamageToPlayersSmartBombAmount {
					aCoder.encode(v, forKey: "combat_damage_to_players_smart_bomb_amount")
				}
				if let v = combatDamageToPlayersSmartBombNumShots {
					aCoder.encode(v, forKey: "combat_damage_to_players_smart_bomb_num_shots")
				}
				if let v = combatDamageToPlayersSuperAmount {
					aCoder.encode(v, forKey: "combat_damage_to_players_super_amount")
				}
				if let v = combatDamageToPlayersSuperNumShots {
					aCoder.encode(v, forKey: "combat_damage_to_players_super_num_shots")
				}
				if let v = combatDamageToStructuresTotalAmount {
					aCoder.encode(v, forKey: "combat_damage_to_structures_total_amount")
				}
				if let v = combatDamageToStructuresTotalNumShots {
					aCoder.encode(v, forKey: "combat_damage_to_structures_total_num_shots")
				}
				if let v = combatDeathsHighSec {
					aCoder.encode(v, forKey: "combat_deaths_high_sec")
				}
				if let v = combatDeathsLowSec {
					aCoder.encode(v, forKey: "combat_deaths_low_sec")
				}
				if let v = combatDeathsNullSec {
					aCoder.encode(v, forKey: "combat_deaths_null_sec")
				}
				if let v = combatDeathsPodHighSec {
					aCoder.encode(v, forKey: "combat_deaths_pod_high_sec")
				}
				if let v = combatDeathsPodLowSec {
					aCoder.encode(v, forKey: "combat_deaths_pod_low_sec")
				}
				if let v = combatDeathsPodNullSec {
					aCoder.encode(v, forKey: "combat_deaths_pod_null_sec")
				}
				if let v = combatDeathsPodWormhole {
					aCoder.encode(v, forKey: "combat_deaths_pod_wormhole")
				}
				if let v = combatDeathsWormhole {
					aCoder.encode(v, forKey: "combat_deaths_wormhole")
				}
				if let v = combatDroneEngage {
					aCoder.encode(v, forKey: "combat_drone_engage")
				}
				if let v = combatDuelRequested {
					aCoder.encode(v, forKey: "combat_duel_requested")
				}
				if let v = combatEngagementRegister {
					aCoder.encode(v, forKey: "combat_engagement_register")
				}
				if let v = combatKillsAssists {
					aCoder.encode(v, forKey: "combat_kills_assists")
				}
				if let v = combatKillsHighSec {
					aCoder.encode(v, forKey: "combat_kills_high_sec")
				}
				if let v = combatKillsLowSec {
					aCoder.encode(v, forKey: "combat_kills_low_sec")
				}
				if let v = combatKillsNullSec {
					aCoder.encode(v, forKey: "combat_kills_null_sec")
				}
				if let v = combatKillsPodHighSec {
					aCoder.encode(v, forKey: "combat_kills_pod_high_sec")
				}
				if let v = combatKillsPodLowSec {
					aCoder.encode(v, forKey: "combat_kills_pod_low_sec")
				}
				if let v = combatKillsPodNullSec {
					aCoder.encode(v, forKey: "combat_kills_pod_null_sec")
				}
				if let v = combatKillsPodWormhole {
					aCoder.encode(v, forKey: "combat_kills_pod_wormhole")
				}
				if let v = combatKillsWormhole {
					aCoder.encode(v, forKey: "combat_kills_wormhole")
				}
				if let v = combatNpcFlagSet {
					aCoder.encode(v, forKey: "combat_npc_flag_set")
				}
				if let v = combatPvpFlagSet {
					aCoder.encode(v, forKey: "combat_pvp_flag_set")
				}
				if let v = combatRepairArmorByRemoteAmount {
					aCoder.encode(v, forKey: "combat_repair_armor_by_remote_amount")
				}
				if let v = combatRepairArmorRemoteAmount {
					aCoder.encode(v, forKey: "combat_repair_armor_remote_amount")
				}
				if let v = combatRepairArmorSelfAmount {
					aCoder.encode(v, forKey: "combat_repair_armor_self_amount")
				}
				if let v = combatRepairCapacitorByRemoteAmount {
					aCoder.encode(v, forKey: "combat_repair_capacitor_by_remote_amount")
				}
				if let v = combatRepairCapacitorRemoteAmount {
					aCoder.encode(v, forKey: "combat_repair_capacitor_remote_amount")
				}
				if let v = combatRepairCapacitorSelfAmount {
					aCoder.encode(v, forKey: "combat_repair_capacitor_self_amount")
				}
				if let v = combatRepairHullByRemoteAmount {
					aCoder.encode(v, forKey: "combat_repair_hull_by_remote_amount")
				}
				if let v = combatRepairHullRemoteAmount {
					aCoder.encode(v, forKey: "combat_repair_hull_remote_amount")
				}
				if let v = combatRepairHullSelfAmount {
					aCoder.encode(v, forKey: "combat_repair_hull_self_amount")
				}
				if let v = combatRepairShieldByRemoteAmount {
					aCoder.encode(v, forKey: "combat_repair_shield_by_remote_amount")
				}
				if let v = combatRepairShieldRemoteAmount {
					aCoder.encode(v, forKey: "combat_repair_shield_remote_amount")
				}
				if let v = combatRepairShieldSelfAmount {
					aCoder.encode(v, forKey: "combat_repair_shield_self_amount")
				}
				if let v = combatSelfDestructs {
					aCoder.encode(v, forKey: "combat_self_destructs")
				}
				if let v = combatWarpScramblePc {
					aCoder.encode(v, forKey: "combat_warp_scramble_pc")
				}
				if let v = combatWarpScrambledbyNpc {
					aCoder.encode(v, forKey: "combat_warp_scrambledby_npc")
				}
				if let v = combatWarpScrambledbyPc {
					aCoder.encode(v, forKey: "combat_warp_scrambledby_pc")
				}
				if let v = combatWeaponFlagSet {
					aCoder.encode(v, forKey: "combat_weapon_flag_set")
				}
				if let v = combatWebifiedbyNpc {
					aCoder.encode(v, forKey: "combat_webifiedby_npc")
				}
				if let v = combatWebifiedbyPc {
					aCoder.encode(v, forKey: "combat_webifiedby_pc")
				}
				if let v = combatWebifyingPc {
					aCoder.encode(v, forKey: "combat_webifying_pc")
				}
				if let v = daysOfActivity {
					aCoder.encode(v, forKey: "days_of_activity")
				}
				if let v = genericConeScans {
					aCoder.encode(v, forKey: "generic_cone_scans")
				}
				if let v = genericRequestScans {
					aCoder.encode(v, forKey: "generic_request_scans")
				}
				if let v = industryHackingSuccesses {
					aCoder.encode(v, forKey: "industry_hacking_successes")
				}
				if let v = industryJobsCancelled {
					aCoder.encode(v, forKey: "industry_jobs_cancelled")
				}
				if let v = industryJobsCompletedCopyBlueprint {
					aCoder.encode(v, forKey: "industry_jobs_completed_copy_blueprint")
				}
				if let v = industryJobsCompletedInvention {
					aCoder.encode(v, forKey: "industry_jobs_completed_invention")
				}
				if let v = industryJobsCompletedManufacture {
					aCoder.encode(v, forKey: "industry_jobs_completed_manufacture")
				}
				if let v = industryJobsCompletedManufactureAsteroid {
					aCoder.encode(v, forKey: "industry_jobs_completed_manufacture_asteroid")
				}
				if let v = industryJobsCompletedManufactureAsteroidQuantity {
					aCoder.encode(v, forKey: "industry_jobs_completed_manufacture_asteroid_quantity")
				}
				if let v = industryJobsCompletedManufactureCharge {
					aCoder.encode(v, forKey: "industry_jobs_completed_manufacture_charge")
				}
				if let v = industryJobsCompletedManufactureChargeQuantity {
					aCoder.encode(v, forKey: "industry_jobs_completed_manufacture_charge_quantity")
				}
				if let v = industryJobsCompletedManufactureCommodity {
					aCoder.encode(v, forKey: "industry_jobs_completed_manufacture_commodity")
				}
				if let v = industryJobsCompletedManufactureCommodityQuantity {
					aCoder.encode(v, forKey: "industry_jobs_completed_manufacture_commodity_quantity")
				}
				if let v = industryJobsCompletedManufactureDeployable {
					aCoder.encode(v, forKey: "industry_jobs_completed_manufacture_deployable")
				}
				if let v = industryJobsCompletedManufactureDeployableQuantity {
					aCoder.encode(v, forKey: "industry_jobs_completed_manufacture_deployable_quantity")
				}
				if let v = industryJobsCompletedManufactureDrone {
					aCoder.encode(v, forKey: "industry_jobs_completed_manufacture_drone")
				}
				if let v = industryJobsCompletedManufactureDroneQuantity {
					aCoder.encode(v, forKey: "industry_jobs_completed_manufacture_drone_quantity")
				}
				if let v = industryJobsCompletedManufactureImplant {
					aCoder.encode(v, forKey: "industry_jobs_completed_manufacture_implant")
				}
				if let v = industryJobsCompletedManufactureImplantQuantity {
					aCoder.encode(v, forKey: "industry_jobs_completed_manufacture_implant_quantity")
				}
				if let v = industryJobsCompletedManufactureModule {
					aCoder.encode(v, forKey: "industry_jobs_completed_manufacture_module")
				}
				if let v = industryJobsCompletedManufactureModuleQuantity {
					aCoder.encode(v, forKey: "industry_jobs_completed_manufacture_module_quantity")
				}
				if let v = industryJobsCompletedManufactureOther {
					aCoder.encode(v, forKey: "industry_jobs_completed_manufacture_other")
				}
				if let v = industryJobsCompletedManufactureOtherQuantity {
					aCoder.encode(v, forKey: "industry_jobs_completed_manufacture_other_quantity")
				}
				if let v = industryJobsCompletedManufactureShip {
					aCoder.encode(v, forKey: "industry_jobs_completed_manufacture_ship")
				}
				if let v = industryJobsCompletedManufactureShipQuantity {
					aCoder.encode(v, forKey: "industry_jobs_completed_manufacture_ship_quantity")
				}
				if let v = industryJobsCompletedManufactureStructure {
					aCoder.encode(v, forKey: "industry_jobs_completed_manufacture_structure")
				}
				if let v = industryJobsCompletedManufactureStructureQuantity {
					aCoder.encode(v, forKey: "industry_jobs_completed_manufacture_structure_quantity")
				}
				if let v = industryJobsCompletedManufactureSubsystem {
					aCoder.encode(v, forKey: "industry_jobs_completed_manufacture_subsystem")
				}
				if let v = industryJobsCompletedManufactureSubsystemQuantity {
					aCoder.encode(v, forKey: "industry_jobs_completed_manufacture_subsystem_quantity")
				}
				if let v = industryJobsCompletedMaterialProductivity {
					aCoder.encode(v, forKey: "industry_jobs_completed_material_productivity")
				}
				if let v = industryJobsCompletedTimeProductivity {
					aCoder.encode(v, forKey: "industry_jobs_completed_time_productivity")
				}
				if let v = industryJobsStartedCopyBlueprint {
					aCoder.encode(v, forKey: "industry_jobs_started_copy_blueprint")
				}
				if let v = industryJobsStartedInvention {
					aCoder.encode(v, forKey: "industry_jobs_started_invention")
				}
				if let v = industryJobsStartedManufacture {
					aCoder.encode(v, forKey: "industry_jobs_started_manufacture")
				}
				if let v = industryJobsStartedMaterialProductivity {
					aCoder.encode(v, forKey: "industry_jobs_started_material_productivity")
				}
				if let v = industryJobsStartedTimeProductivity {
					aCoder.encode(v, forKey: "industry_jobs_started_time_productivity")
				}
				if let v = industryReprocessItem {
					aCoder.encode(v, forKey: "industry_reprocess_item")
				}
				if let v = industryReprocessItemQuantity {
					aCoder.encode(v, forKey: "industry_reprocess_item_quantity")
				}
				if let v = inventoryAbandonLootQuantity {
					aCoder.encode(v, forKey: "inventory_abandon_loot_quantity")
				}
				if let v = inventoryTrashItemQuantity {
					aCoder.encode(v, forKey: "inventory_trash_item_quantity")
				}
				if let v = iskIn {
					aCoder.encode(v, forKey: "isk_in")
				}
				if let v = iskOut {
					aCoder.encode(v, forKey: "isk_out")
				}
				if let v = marketAcceptContractsCourier {
					aCoder.encode(v, forKey: "market_accept_contracts_courier")
				}
				if let v = marketAcceptContractsItemExchange {
					aCoder.encode(v, forKey: "market_accept_contracts_item_exchange")
				}
				if let v = marketBuyOrdersPlaced {
					aCoder.encode(v, forKey: "market_buy_orders_placed")
				}
				if let v = marketCancelMarketOrder {
					aCoder.encode(v, forKey: "market_cancel_market_order")
				}
				if let v = marketCreateContractsAuction {
					aCoder.encode(v, forKey: "market_create_contracts_auction")
				}
				if let v = marketCreateContractsCourier {
					aCoder.encode(v, forKey: "market_create_contracts_courier")
				}
				if let v = marketCreateContractsItemExchange {
					aCoder.encode(v, forKey: "market_create_contracts_item_exchange")
				}
				if let v = marketDeliverCourierContract {
					aCoder.encode(v, forKey: "market_deliver_courier_contract")
				}
				if let v = marketIskGained {
					aCoder.encode(v, forKey: "market_isk_gained")
				}
				if let v = marketIskSpent {
					aCoder.encode(v, forKey: "market_isk_spent")
				}
				if let v = marketModifyMarketOrder {
					aCoder.encode(v, forKey: "market_modify_market_order")
				}
				if let v = marketSearchContracts {
					aCoder.encode(v, forKey: "market_search_contracts")
				}
				if let v = marketSellOrdersPlaced {
					aCoder.encode(v, forKey: "market_sell_orders_placed")
				}
				if let v = miningDroneMine {
					aCoder.encode(v, forKey: "mining_drone_mine")
				}
				if let v = miningOreArkonor {
					aCoder.encode(v, forKey: "mining_ore_arkonor")
				}
				if let v = miningOreBistot {
					aCoder.encode(v, forKey: "mining_ore_bistot")
				}
				if let v = miningOreCrokite {
					aCoder.encode(v, forKey: "mining_ore_crokite")
				}
				if let v = miningOreDarkOchre {
					aCoder.encode(v, forKey: "mining_ore_dark_ochre")
				}
				if let v = miningOreGneiss {
					aCoder.encode(v, forKey: "mining_ore_gneiss")
				}
				if let v = miningOreHarvestableCloud {
					aCoder.encode(v, forKey: "mining_ore_harvestable_cloud")
				}
				if let v = miningOreHedbergite {
					aCoder.encode(v, forKey: "mining_ore_hedbergite")
				}
				if let v = miningOreHemorphite {
					aCoder.encode(v, forKey: "mining_ore_hemorphite")
				}
				if let v = miningOreIce {
					aCoder.encode(v, forKey: "mining_ore_ice")
				}
				if let v = miningOreJaspet {
					aCoder.encode(v, forKey: "mining_ore_jaspet")
				}
				if let v = miningOreKernite {
					aCoder.encode(v, forKey: "mining_ore_kernite")
				}
				if let v = miningOreMercoxit {
					aCoder.encode(v, forKey: "mining_ore_mercoxit")
				}
				if let v = miningOreOmber {
					aCoder.encode(v, forKey: "mining_ore_omber")
				}
				if let v = miningOrePlagioclase {
					aCoder.encode(v, forKey: "mining_ore_plagioclase")
				}
				if let v = miningOrePyroxeres {
					aCoder.encode(v, forKey: "mining_ore_pyroxeres")
				}
				if let v = miningOreScordite {
					aCoder.encode(v, forKey: "mining_ore_scordite")
				}
				if let v = miningOreSpodumain {
					aCoder.encode(v, forKey: "mining_ore_spodumain")
				}
				if let v = miningOreVeldspar {
					aCoder.encode(v, forKey: "mining_ore_veldspar")
				}
				if let v = moduleActivationsArmorHardener {
					aCoder.encode(v, forKey: "module_activations_armor_hardener")
				}
				if let v = moduleActivationsArmorRepairUnit {
					aCoder.encode(v, forKey: "module_activations_armor_repair_unit")
				}
				if let v = moduleActivationsArmorResistanceShiftHardener {
					aCoder.encode(v, forKey: "module_activations_armor_resistance_shift_hardener")
				}
				if let v = moduleActivationsAutomatedTargetingSystem {
					aCoder.encode(v, forKey: "module_activations_automated_targeting_system")
				}
				if let v = moduleActivationsBastion {
					aCoder.encode(v, forKey: "module_activations_bastion")
				}
				if let v = moduleActivationsBombLauncher {
					aCoder.encode(v, forKey: "module_activations_bomb_launcher")
				}
				if let v = moduleActivationsCapacitorBooster {
					aCoder.encode(v, forKey: "module_activations_capacitor_booster")
				}
				if let v = moduleActivationsCargoScanner {
					aCoder.encode(v, forKey: "module_activations_cargo_scanner")
				}
				if let v = moduleActivationsCloakingDevice {
					aCoder.encode(v, forKey: "module_activations_cloaking_device")
				}
				if let v = moduleActivationsCloneVatBay {
					aCoder.encode(v, forKey: "module_activations_clone_vat_bay")
				}
				if let v = moduleActivationsCynosuralField {
					aCoder.encode(v, forKey: "module_activations_cynosural_field")
				}
				if let v = moduleActivationsDamageControl {
					aCoder.encode(v, forKey: "module_activations_damage_control")
				}
				if let v = moduleActivationsDataMiners {
					aCoder.encode(v, forKey: "module_activations_data_miners")
				}
				if let v = moduleActivationsDroneControlUnit {
					aCoder.encode(v, forKey: "module_activations_drone_control_unit")
				}
				if let v = moduleActivationsDroneTrackingModules {
					aCoder.encode(v, forKey: "module_activations_drone_tracking_modules")
				}
				if let v = moduleActivationsEccm {
					aCoder.encode(v, forKey: "module_activations_eccm")
				}
				if let v = moduleActivationsEcm {
					aCoder.encode(v, forKey: "module_activations_ecm")
				}
				if let v = moduleActivationsEcmBurst {
					aCoder.encode(v, forKey: "module_activations_ecm_burst")
				}
				if let v = moduleActivationsEnergyDestabilizer {
					aCoder.encode(v, forKey: "module_activations_energy_destabilizer")
				}
				if let v = moduleActivationsEnergyVampire {
					aCoder.encode(v, forKey: "module_activations_energy_vampire")
				}
				if let v = moduleActivationsEnergyWeapon {
					aCoder.encode(v, forKey: "module_activations_energy_weapon")
				}
				if let v = moduleActivationsFestivalLauncher {
					aCoder.encode(v, forKey: "module_activations_festival_launcher")
				}
				if let v = moduleActivationsFrequencyMiningLaser {
					aCoder.encode(v, forKey: "module_activations_frequency_mining_laser")
				}
				if let v = moduleActivationsFueledArmorRepairer {
					aCoder.encode(v, forKey: "module_activations_fueled_armor_repairer")
				}
				if let v = moduleActivationsFueledShieldBooster {
					aCoder.encode(v, forKey: "module_activations_fueled_shield_booster")
				}
				if let v = moduleActivationsGangCoordinator {
					aCoder.encode(v, forKey: "module_activations_gang_coordinator")
				}
				if let v = moduleActivationsGasCloudHarvester {
					aCoder.encode(v, forKey: "module_activations_gas_cloud_harvester")
				}
				if let v = moduleActivationsHullRepairUnit {
					aCoder.encode(v, forKey: "module_activations_hull_repair_unit")
				}
				if let v = moduleActivationsHybridWeapon {
					aCoder.encode(v, forKey: "module_activations_hybrid_weapon")
				}
				if let v = moduleActivationsIndustrialCore {
					aCoder.encode(v, forKey: "module_activations_industrial_core")
				}
				if let v = moduleActivationsInterdictionSphereLauncher {
					aCoder.encode(v, forKey: "module_activations_interdiction_sphere_launcher")
				}
				if let v = moduleActivationsMicroJumpDrive {
					aCoder.encode(v, forKey: "module_activations_micro_jump_drive")
				}
				if let v = moduleActivationsMiningLaser {
					aCoder.encode(v, forKey: "module_activations_mining_laser")
				}
				if let v = moduleActivationsMissileLauncher {
					aCoder.encode(v, forKey: "module_activations_missile_launcher")
				}
				if let v = moduleActivationsPassiveTargetingSystem {
					aCoder.encode(v, forKey: "module_activations_passive_targeting_system")
				}
				if let v = moduleActivationsProbeLauncher {
					aCoder.encode(v, forKey: "module_activations_probe_launcher")
				}
				if let v = moduleActivationsProjectedEccm {
					aCoder.encode(v, forKey: "module_activations_projected_eccm")
				}
				if let v = moduleActivationsProjectileWeapon {
					aCoder.encode(v, forKey: "module_activations_projectile_weapon")
				}
				if let v = moduleActivationsPropulsionModule {
					aCoder.encode(v, forKey: "module_activations_propulsion_module")
				}
				if let v = moduleActivationsRemoteArmorRepairer {
					aCoder.encode(v, forKey: "module_activations_remote_armor_repairer")
				}
				if let v = moduleActivationsRemoteCapacitorTransmitter {
					aCoder.encode(v, forKey: "module_activations_remote_capacitor_transmitter")
				}
				if let v = moduleActivationsRemoteEcmBurst {
					aCoder.encode(v, forKey: "module_activations_remote_ecm_burst")
				}
				if let v = moduleActivationsRemoteHullRepairer {
					aCoder.encode(v, forKey: "module_activations_remote_hull_repairer")
				}
				if let v = moduleActivationsRemoteSensorBooster {
					aCoder.encode(v, forKey: "module_activations_remote_sensor_booster")
				}
				if let v = moduleActivationsRemoteSensorDamper {
					aCoder.encode(v, forKey: "module_activations_remote_sensor_damper")
				}
				if let v = moduleActivationsRemoteShieldBooster {
					aCoder.encode(v, forKey: "module_activations_remote_shield_booster")
				}
				if let v = moduleActivationsRemoteTrackingComputer {
					aCoder.encode(v, forKey: "module_activations_remote_tracking_computer")
				}
				if let v = moduleActivationsSalvager {
					aCoder.encode(v, forKey: "module_activations_salvager")
				}
				if let v = moduleActivationsSensorBooster {
					aCoder.encode(v, forKey: "module_activations_sensor_booster")
				}
				if let v = moduleActivationsShieldBooster {
					aCoder.encode(v, forKey: "module_activations_shield_booster")
				}
				if let v = moduleActivationsShieldHardener {
					aCoder.encode(v, forKey: "module_activations_shield_hardener")
				}
				if let v = moduleActivationsShipScanner {
					aCoder.encode(v, forKey: "module_activations_ship_scanner")
				}
				if let v = moduleActivationsSiege {
					aCoder.encode(v, forKey: "module_activations_siege")
				}
				if let v = moduleActivationsSmartBomb {
					aCoder.encode(v, forKey: "module_activations_smart_bomb")
				}
				if let v = moduleActivationsStasisWeb {
					aCoder.encode(v, forKey: "module_activations_stasis_web")
				}
				if let v = moduleActivationsStripMiner {
					aCoder.encode(v, forKey: "module_activations_strip_miner")
				}
				if let v = moduleActivationsSuperWeapon {
					aCoder.encode(v, forKey: "module_activations_super_weapon")
				}
				if let v = moduleActivationsSurveyScanner {
					aCoder.encode(v, forKey: "module_activations_survey_scanner")
				}
				if let v = moduleActivationsTargetBreaker {
					aCoder.encode(v, forKey: "module_activations_target_breaker")
				}
				if let v = moduleActivationsTargetPainter {
					aCoder.encode(v, forKey: "module_activations_target_painter")
				}
				if let v = moduleActivationsTrackingComputer {
					aCoder.encode(v, forKey: "module_activations_tracking_computer")
				}
				if let v = moduleActivationsTrackingDisruptor {
					aCoder.encode(v, forKey: "module_activations_tracking_disruptor")
				}
				if let v = moduleActivationsTractorBeam {
					aCoder.encode(v, forKey: "module_activations_tractor_beam")
				}
				if let v = moduleActivationsTriage {
					aCoder.encode(v, forKey: "module_activations_triage")
				}
				if let v = moduleActivationsWarpDisruptFieldGenerator {
					aCoder.encode(v, forKey: "module_activations_warp_disrupt_field_generator")
				}
				if let v = moduleActivationsWarpScrambler {
					aCoder.encode(v, forKey: "module_activations_warp_scrambler")
				}
				if let v = moduleLinkWeapons {
					aCoder.encode(v, forKey: "module_link_weapons")
				}
				if let v = moduleOverload {
					aCoder.encode(v, forKey: "module_overload")
				}
				if let v = moduleRepairs {
					aCoder.encode(v, forKey: "module_repairs")
				}
				if let v = orbitalStrikeCharactersKilled {
					aCoder.encode(v, forKey: "orbital_strike_characters_killed")
				}
				if let v = orbitalStrikeDamageToPlayersArmorAmount {
					aCoder.encode(v, forKey: "orbital_strike_damage_to_players_armor_amount")
				}
				if let v = orbitalStrikeDamageToPlayersShieldAmount {
					aCoder.encode(v, forKey: "orbital_strike_damage_to_players_shield_amount")
				}
				if let v = pveDungeonsCompletedAgent {
					aCoder.encode(v, forKey: "pve_dungeons_completed_agent")
				}
				if let v = pveDungeonsCompletedDistribution {
					aCoder.encode(v, forKey: "pve_dungeons_completed_distribution")
				}
				if let v = pveMissionsSucceeded {
					aCoder.encode(v, forKey: "pve_missions_succeeded")
				}
				if let v = pveMissionsSucceededEpicArc {
					aCoder.encode(v, forKey: "pve_missions_succeeded_epic_arc")
				}
				if let v = socialAddContactBad {
					aCoder.encode(v, forKey: "social_add_contact_bad")
				}
				if let v = socialAddContactGood {
					aCoder.encode(v, forKey: "social_add_contact_good")
				}
				if let v = socialAddContactHigh {
					aCoder.encode(v, forKey: "social_add_contact_high")
				}
				if let v = socialAddContactHorrible {
					aCoder.encode(v, forKey: "social_add_contact_horrible")
				}
				if let v = socialAddContactNeutral {
					aCoder.encode(v, forKey: "social_add_contact_neutral")
				}
				if let v = socialAddNote {
					aCoder.encode(v, forKey: "social_add_note")
				}
				if let v = socialAddedAsContactBad {
					aCoder.encode(v, forKey: "social_added_as_contact_bad")
				}
				if let v = socialAddedAsContactGood {
					aCoder.encode(v, forKey: "social_added_as_contact_good")
				}
				if let v = socialAddedAsContactHigh {
					aCoder.encode(v, forKey: "social_added_as_contact_high")
				}
				if let v = socialAddedAsContactHorrible {
					aCoder.encode(v, forKey: "social_added_as_contact_horrible")
				}
				if let v = socialAddedAsContactNeutral {
					aCoder.encode(v, forKey: "social_added_as_contact_neutral")
				}
				if let v = socialCalendarEventCreated {
					aCoder.encode(v, forKey: "social_calendar_event_created")
				}
				if let v = socialChatMessagesAlliance {
					aCoder.encode(v, forKey: "social_chat_messages_alliance")
				}
				if let v = socialChatMessagesConstellation {
					aCoder.encode(v, forKey: "social_chat_messages_constellation")
				}
				if let v = socialChatMessagesCorporation {
					aCoder.encode(v, forKey: "social_chat_messages_corporation")
				}
				if let v = socialChatMessagesFleet {
					aCoder.encode(v, forKey: "social_chat_messages_fleet")
				}
				if let v = socialChatMessagesRegion {
					aCoder.encode(v, forKey: "social_chat_messages_region")
				}
				if let v = socialChatMessagesSolarsystem {
					aCoder.encode(v, forKey: "social_chat_messages_solarsystem")
				}
				if let v = socialChatMessagesWarfaction {
					aCoder.encode(v, forKey: "social_chat_messages_warfaction")
				}
				if let v = socialChatTotalMessageLength {
					aCoder.encode(v, forKey: "social_chat_total_message_length")
				}
				if let v = socialDirectTrades {
					aCoder.encode(v, forKey: "social_direct_trades")
				}
				if let v = socialFleetBroadcasts {
					aCoder.encode(v, forKey: "social_fleet_broadcasts")
				}
				if let v = socialFleetJoins {
					aCoder.encode(v, forKey: "social_fleet_joins")
				}
				if let v = socialMailsReceived {
					aCoder.encode(v, forKey: "social_mails_received")
				}
				if let v = socialMailsSent {
					aCoder.encode(v, forKey: "social_mails_sent")
				}
				if let v = travelAccelerationGateActivations {
					aCoder.encode(v, forKey: "travel_acceleration_gate_activations")
				}
				if let v = travelAlignTo {
					aCoder.encode(v, forKey: "travel_align_to")
				}
				if let v = travelDistanceWarpedHighSec {
					aCoder.encode(v, forKey: "travel_distance_warped_high_sec")
				}
				if let v = travelDistanceWarpedLowSec {
					aCoder.encode(v, forKey: "travel_distance_warped_low_sec")
				}
				if let v = travelDistanceWarpedNullSec {
					aCoder.encode(v, forKey: "travel_distance_warped_null_sec")
				}
				if let v = travelDistanceWarpedWormhole {
					aCoder.encode(v, forKey: "travel_distance_warped_wormhole")
				}
				if let v = travelDocksHighSec {
					aCoder.encode(v, forKey: "travel_docks_high_sec")
				}
				if let v = travelDocksLowSec {
					aCoder.encode(v, forKey: "travel_docks_low_sec")
				}
				if let v = travelDocksNullSec {
					aCoder.encode(v, forKey: "travel_docks_null_sec")
				}
				if let v = travelJumpsStargateHighSec {
					aCoder.encode(v, forKey: "travel_jumps_stargate_high_sec")
				}
				if let v = travelJumpsStargateLowSec {
					aCoder.encode(v, forKey: "travel_jumps_stargate_low_sec")
				}
				if let v = travelJumpsStargateNullSec {
					aCoder.encode(v, forKey: "travel_jumps_stargate_null_sec")
				}
				if let v = travelJumpsWormhole {
					aCoder.encode(v, forKey: "travel_jumps_wormhole")
				}
				if let v = travelWarpsHighSec {
					aCoder.encode(v, forKey: "travel_warps_high_sec")
				}
				if let v = travelWarpsLowSec {
					aCoder.encode(v, forKey: "travel_warps_low_sec")
				}
				if let v = travelWarpsNullSec {
					aCoder.encode(v, forKey: "travel_warps_null_sec")
				}
				if let v = travelWarpsToBookmark {
					aCoder.encode(v, forKey: "travel_warps_to_bookmark")
				}
				if let v = travelWarpsToCelestial {
					aCoder.encode(v, forKey: "travel_warps_to_celestial")
				}
				if let v = travelWarpsToFleetMember {
					aCoder.encode(v, forKey: "travel_warps_to_fleet_member")
				}
				if let v = travelWarpsToScanResult {
					aCoder.encode(v, forKey: "travel_warps_to_scan_result")
				}
				if let v = travelWarpsWormhole {
					aCoder.encode(v, forKey: "travel_warps_wormhole")
				}
				aCoder.encode(year, forKey: "year")
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = characterMinutes?.json {
					json["character_minutes"] = v
				}
				if let v = characterSessionsStarted?.json {
					json["character_sessions_started"] = v
				}
				if let v = combatCapDrainedbyNpc?.json {
					json["combat_cap_drainedby_npc"] = v
				}
				if let v = combatCapDrainedbyPc?.json {
					json["combat_cap_drainedby_pc"] = v
				}
				if let v = combatCapDrainingPc?.json {
					json["combat_cap_draining_pc"] = v
				}
				if let v = combatCriminalFlagSet?.json {
					json["combat_criminal_flag_set"] = v
				}
				if let v = combatDamageFromNpCsAmount?.json {
					json["combat_damage_from_np_cs_amount"] = v
				}
				if let v = combatDamageFromNpCsNumShots?.json {
					json["combat_damage_from_np_cs_num_shots"] = v
				}
				if let v = combatDamageFromPlayersBombAmount?.json {
					json["combat_damage_from_players_bomb_amount"] = v
				}
				if let v = combatDamageFromPlayersBombNumShots?.json {
					json["combat_damage_from_players_bomb_num_shots"] = v
				}
				if let v = combatDamageFromPlayersCombatDroneAmount?.json {
					json["combat_damage_from_players_combat_drone_amount"] = v
				}
				if let v = combatDamageFromPlayersCombatDroneNumShots?.json {
					json["combat_damage_from_players_combat_drone_num_shots"] = v
				}
				if let v = combatDamageFromPlayersEnergyAmount?.json {
					json["combat_damage_from_players_energy_amount"] = v
				}
				if let v = combatDamageFromPlayersEnergyNumShots?.json {
					json["combat_damage_from_players_energy_num_shots"] = v
				}
				if let v = combatDamageFromPlayersFighterBomberAmount?.json {
					json["combat_damage_from_players_fighter_bomber_amount"] = v
				}
				if let v = combatDamageFromPlayersFighterBomberNumShots?.json {
					json["combat_damage_from_players_fighter_bomber_num_shots"] = v
				}
				if let v = combatDamageFromPlayersFighterDroneAmount?.json {
					json["combat_damage_from_players_fighter_drone_amount"] = v
				}
				if let v = combatDamageFromPlayersFighterDroneNumShots?.json {
					json["combat_damage_from_players_fighter_drone_num_shots"] = v
				}
				if let v = combatDamageFromPlayersHybridAmount?.json {
					json["combat_damage_from_players_hybrid_amount"] = v
				}
				if let v = combatDamageFromPlayersHybridNumShots?.json {
					json["combat_damage_from_players_hybrid_num_shots"] = v
				}
				if let v = combatDamageFromPlayersMissileAmount?.json {
					json["combat_damage_from_players_missile_amount"] = v
				}
				if let v = combatDamageFromPlayersMissileNumShots?.json {
					json["combat_damage_from_players_missile_num_shots"] = v
				}
				if let v = combatDamageFromPlayersProjectileAmount?.json {
					json["combat_damage_from_players_projectile_amount"] = v
				}
				if let v = combatDamageFromPlayersProjectileNumShots?.json {
					json["combat_damage_from_players_projectile_num_shots"] = v
				}
				if let v = combatDamageFromPlayersSmartBombAmount?.json {
					json["combat_damage_from_players_smart_bomb_amount"] = v
				}
				if let v = combatDamageFromPlayersSmartBombNumShots?.json {
					json["combat_damage_from_players_smart_bomb_num_shots"] = v
				}
				if let v = combatDamageFromPlayersSuperAmount?.json {
					json["combat_damage_from_players_super_amount"] = v
				}
				if let v = combatDamageFromPlayersSuperNumShots?.json {
					json["combat_damage_from_players_super_num_shots"] = v
				}
				if let v = combatDamageFromStructuresTotalAmount?.json {
					json["combat_damage_from_structures_total_amount"] = v
				}
				if let v = combatDamageFromStructuresTotalNumShots?.json {
					json["combat_damage_from_structures_total_num_shots"] = v
				}
				if let v = combatDamageToPlayersBombAmount?.json {
					json["combat_damage_to_players_bomb_amount"] = v
				}
				if let v = combatDamageToPlayersBombNumShots?.json {
					json["combat_damage_to_players_bomb_num_shots"] = v
				}
				if let v = combatDamageToPlayersCombatDroneAmount?.json {
					json["combat_damage_to_players_combat_drone_amount"] = v
				}
				if let v = combatDamageToPlayersCombatDroneNumShots?.json {
					json["combat_damage_to_players_combat_drone_num_shots"] = v
				}
				if let v = combatDamageToPlayersEnergyAmount?.json {
					json["combat_damage_to_players_energy_amount"] = v
				}
				if let v = combatDamageToPlayersEnergyNumShots?.json {
					json["combat_damage_to_players_energy_num_shots"] = v
				}
				if let v = combatDamageToPlayersFighterBomberAmount?.json {
					json["combat_damage_to_players_fighter_bomber_amount"] = v
				}
				if let v = combatDamageToPlayersFighterBomberNumShots?.json {
					json["combat_damage_to_players_fighter_bomber_num_shots"] = v
				}
				if let v = combatDamageToPlayersFighterDroneAmount?.json {
					json["combat_damage_to_players_fighter_drone_amount"] = v
				}
				if let v = combatDamageToPlayersFighterDroneNumShots?.json {
					json["combat_damage_to_players_fighter_drone_num_shots"] = v
				}
				if let v = combatDamageToPlayersHybridAmount?.json {
					json["combat_damage_to_players_hybrid_amount"] = v
				}
				if let v = combatDamageToPlayersHybridNumShots?.json {
					json["combat_damage_to_players_hybrid_num_shots"] = v
				}
				if let v = combatDamageToPlayersMissileAmount?.json {
					json["combat_damage_to_players_missile_amount"] = v
				}
				if let v = combatDamageToPlayersMissileNumShots?.json {
					json["combat_damage_to_players_missile_num_shots"] = v
				}
				if let v = combatDamageToPlayersProjectileAmount?.json {
					json["combat_damage_to_players_projectile_amount"] = v
				}
				if let v = combatDamageToPlayersProjectileNumShots?.json {
					json["combat_damage_to_players_projectile_num_shots"] = v
				}
				if let v = combatDamageToPlayersSmartBombAmount?.json {
					json["combat_damage_to_players_smart_bomb_amount"] = v
				}
				if let v = combatDamageToPlayersSmartBombNumShots?.json {
					json["combat_damage_to_players_smart_bomb_num_shots"] = v
				}
				if let v = combatDamageToPlayersSuperAmount?.json {
					json["combat_damage_to_players_super_amount"] = v
				}
				if let v = combatDamageToPlayersSuperNumShots?.json {
					json["combat_damage_to_players_super_num_shots"] = v
				}
				if let v = combatDamageToStructuresTotalAmount?.json {
					json["combat_damage_to_structures_total_amount"] = v
				}
				if let v = combatDamageToStructuresTotalNumShots?.json {
					json["combat_damage_to_structures_total_num_shots"] = v
				}
				if let v = combatDeathsHighSec?.json {
					json["combat_deaths_high_sec"] = v
				}
				if let v = combatDeathsLowSec?.json {
					json["combat_deaths_low_sec"] = v
				}
				if let v = combatDeathsNullSec?.json {
					json["combat_deaths_null_sec"] = v
				}
				if let v = combatDeathsPodHighSec?.json {
					json["combat_deaths_pod_high_sec"] = v
				}
				if let v = combatDeathsPodLowSec?.json {
					json["combat_deaths_pod_low_sec"] = v
				}
				if let v = combatDeathsPodNullSec?.json {
					json["combat_deaths_pod_null_sec"] = v
				}
				if let v = combatDeathsPodWormhole?.json {
					json["combat_deaths_pod_wormhole"] = v
				}
				if let v = combatDeathsWormhole?.json {
					json["combat_deaths_wormhole"] = v
				}
				if let v = combatDroneEngage?.json {
					json["combat_drone_engage"] = v
				}
				if let v = combatDuelRequested?.json {
					json["combat_duel_requested"] = v
				}
				if let v = combatEngagementRegister?.json {
					json["combat_engagement_register"] = v
				}
				if let v = combatKillsAssists?.json {
					json["combat_kills_assists"] = v
				}
				if let v = combatKillsHighSec?.json {
					json["combat_kills_high_sec"] = v
				}
				if let v = combatKillsLowSec?.json {
					json["combat_kills_low_sec"] = v
				}
				if let v = combatKillsNullSec?.json {
					json["combat_kills_null_sec"] = v
				}
				if let v = combatKillsPodHighSec?.json {
					json["combat_kills_pod_high_sec"] = v
				}
				if let v = combatKillsPodLowSec?.json {
					json["combat_kills_pod_low_sec"] = v
				}
				if let v = combatKillsPodNullSec?.json {
					json["combat_kills_pod_null_sec"] = v
				}
				if let v = combatKillsPodWormhole?.json {
					json["combat_kills_pod_wormhole"] = v
				}
				if let v = combatKillsWormhole?.json {
					json["combat_kills_wormhole"] = v
				}
				if let v = combatNpcFlagSet?.json {
					json["combat_npc_flag_set"] = v
				}
				if let v = combatPvpFlagSet?.json {
					json["combat_pvp_flag_set"] = v
				}
				if let v = combatRepairArmorByRemoteAmount?.json {
					json["combat_repair_armor_by_remote_amount"] = v
				}
				if let v = combatRepairArmorRemoteAmount?.json {
					json["combat_repair_armor_remote_amount"] = v
				}
				if let v = combatRepairArmorSelfAmount?.json {
					json["combat_repair_armor_self_amount"] = v
				}
				if let v = combatRepairCapacitorByRemoteAmount?.json {
					json["combat_repair_capacitor_by_remote_amount"] = v
				}
				if let v = combatRepairCapacitorRemoteAmount?.json {
					json["combat_repair_capacitor_remote_amount"] = v
				}
				if let v = combatRepairCapacitorSelfAmount?.json {
					json["combat_repair_capacitor_self_amount"] = v
				}
				if let v = combatRepairHullByRemoteAmount?.json {
					json["combat_repair_hull_by_remote_amount"] = v
				}
				if let v = combatRepairHullRemoteAmount?.json {
					json["combat_repair_hull_remote_amount"] = v
				}
				if let v = combatRepairHullSelfAmount?.json {
					json["combat_repair_hull_self_amount"] = v
				}
				if let v = combatRepairShieldByRemoteAmount?.json {
					json["combat_repair_shield_by_remote_amount"] = v
				}
				if let v = combatRepairShieldRemoteAmount?.json {
					json["combat_repair_shield_remote_amount"] = v
				}
				if let v = combatRepairShieldSelfAmount?.json {
					json["combat_repair_shield_self_amount"] = v
				}
				if let v = combatSelfDestructs?.json {
					json["combat_self_destructs"] = v
				}
				if let v = combatWarpScramblePc?.json {
					json["combat_warp_scramble_pc"] = v
				}
				if let v = combatWarpScrambledbyNpc?.json {
					json["combat_warp_scrambledby_npc"] = v
				}
				if let v = combatWarpScrambledbyPc?.json {
					json["combat_warp_scrambledby_pc"] = v
				}
				if let v = combatWeaponFlagSet?.json {
					json["combat_weapon_flag_set"] = v
				}
				if let v = combatWebifiedbyNpc?.json {
					json["combat_webifiedby_npc"] = v
				}
				if let v = combatWebifiedbyPc?.json {
					json["combat_webifiedby_pc"] = v
				}
				if let v = combatWebifyingPc?.json {
					json["combat_webifying_pc"] = v
				}
				if let v = daysOfActivity?.json {
					json["days_of_activity"] = v
				}
				if let v = genericConeScans?.json {
					json["generic_cone_scans"] = v
				}
				if let v = genericRequestScans?.json {
					json["generic_request_scans"] = v
				}
				if let v = industryHackingSuccesses?.json {
					json["industry_hacking_successes"] = v
				}
				if let v = industryJobsCancelled?.json {
					json["industry_jobs_cancelled"] = v
				}
				if let v = industryJobsCompletedCopyBlueprint?.json {
					json["industry_jobs_completed_copy_blueprint"] = v
				}
				if let v = industryJobsCompletedInvention?.json {
					json["industry_jobs_completed_invention"] = v
				}
				if let v = industryJobsCompletedManufacture?.json {
					json["industry_jobs_completed_manufacture"] = v
				}
				if let v = industryJobsCompletedManufactureAsteroid?.json {
					json["industry_jobs_completed_manufacture_asteroid"] = v
				}
				if let v = industryJobsCompletedManufactureAsteroidQuantity?.json {
					json["industry_jobs_completed_manufacture_asteroid_quantity"] = v
				}
				if let v = industryJobsCompletedManufactureCharge?.json {
					json["industry_jobs_completed_manufacture_charge"] = v
				}
				if let v = industryJobsCompletedManufactureChargeQuantity?.json {
					json["industry_jobs_completed_manufacture_charge_quantity"] = v
				}
				if let v = industryJobsCompletedManufactureCommodity?.json {
					json["industry_jobs_completed_manufacture_commodity"] = v
				}
				if let v = industryJobsCompletedManufactureCommodityQuantity?.json {
					json["industry_jobs_completed_manufacture_commodity_quantity"] = v
				}
				if let v = industryJobsCompletedManufactureDeployable?.json {
					json["industry_jobs_completed_manufacture_deployable"] = v
				}
				if let v = industryJobsCompletedManufactureDeployableQuantity?.json {
					json["industry_jobs_completed_manufacture_deployable_quantity"] = v
				}
				if let v = industryJobsCompletedManufactureDrone?.json {
					json["industry_jobs_completed_manufacture_drone"] = v
				}
				if let v = industryJobsCompletedManufactureDroneQuantity?.json {
					json["industry_jobs_completed_manufacture_drone_quantity"] = v
				}
				if let v = industryJobsCompletedManufactureImplant?.json {
					json["industry_jobs_completed_manufacture_implant"] = v
				}
				if let v = industryJobsCompletedManufactureImplantQuantity?.json {
					json["industry_jobs_completed_manufacture_implant_quantity"] = v
				}
				if let v = industryJobsCompletedManufactureModule?.json {
					json["industry_jobs_completed_manufacture_module"] = v
				}
				if let v = industryJobsCompletedManufactureModuleQuantity?.json {
					json["industry_jobs_completed_manufacture_module_quantity"] = v
				}
				if let v = industryJobsCompletedManufactureOther?.json {
					json["industry_jobs_completed_manufacture_other"] = v
				}
				if let v = industryJobsCompletedManufactureOtherQuantity?.json {
					json["industry_jobs_completed_manufacture_other_quantity"] = v
				}
				if let v = industryJobsCompletedManufactureShip?.json {
					json["industry_jobs_completed_manufacture_ship"] = v
				}
				if let v = industryJobsCompletedManufactureShipQuantity?.json {
					json["industry_jobs_completed_manufacture_ship_quantity"] = v
				}
				if let v = industryJobsCompletedManufactureStructure?.json {
					json["industry_jobs_completed_manufacture_structure"] = v
				}
				if let v = industryJobsCompletedManufactureStructureQuantity?.json {
					json["industry_jobs_completed_manufacture_structure_quantity"] = v
				}
				if let v = industryJobsCompletedManufactureSubsystem?.json {
					json["industry_jobs_completed_manufacture_subsystem"] = v
				}
				if let v = industryJobsCompletedManufactureSubsystemQuantity?.json {
					json["industry_jobs_completed_manufacture_subsystem_quantity"] = v
				}
				if let v = industryJobsCompletedMaterialProductivity?.json {
					json["industry_jobs_completed_material_productivity"] = v
				}
				if let v = industryJobsCompletedTimeProductivity?.json {
					json["industry_jobs_completed_time_productivity"] = v
				}
				if let v = industryJobsStartedCopyBlueprint?.json {
					json["industry_jobs_started_copy_blueprint"] = v
				}
				if let v = industryJobsStartedInvention?.json {
					json["industry_jobs_started_invention"] = v
				}
				if let v = industryJobsStartedManufacture?.json {
					json["industry_jobs_started_manufacture"] = v
				}
				if let v = industryJobsStartedMaterialProductivity?.json {
					json["industry_jobs_started_material_productivity"] = v
				}
				if let v = industryJobsStartedTimeProductivity?.json {
					json["industry_jobs_started_time_productivity"] = v
				}
				if let v = industryReprocessItem?.json {
					json["industry_reprocess_item"] = v
				}
				if let v = industryReprocessItemQuantity?.json {
					json["industry_reprocess_item_quantity"] = v
				}
				if let v = inventoryAbandonLootQuantity?.json {
					json["inventory_abandon_loot_quantity"] = v
				}
				if let v = inventoryTrashItemQuantity?.json {
					json["inventory_trash_item_quantity"] = v
				}
				if let v = iskIn?.json {
					json["isk_in"] = v
				}
				if let v = iskOut?.json {
					json["isk_out"] = v
				}
				if let v = marketAcceptContractsCourier?.json {
					json["market_accept_contracts_courier"] = v
				}
				if let v = marketAcceptContractsItemExchange?.json {
					json["market_accept_contracts_item_exchange"] = v
				}
				if let v = marketBuyOrdersPlaced?.json {
					json["market_buy_orders_placed"] = v
				}
				if let v = marketCancelMarketOrder?.json {
					json["market_cancel_market_order"] = v
				}
				if let v = marketCreateContractsAuction?.json {
					json["market_create_contracts_auction"] = v
				}
				if let v = marketCreateContractsCourier?.json {
					json["market_create_contracts_courier"] = v
				}
				if let v = marketCreateContractsItemExchange?.json {
					json["market_create_contracts_item_exchange"] = v
				}
				if let v = marketDeliverCourierContract?.json {
					json["market_deliver_courier_contract"] = v
				}
				if let v = marketIskGained?.json {
					json["market_isk_gained"] = v
				}
				if let v = marketIskSpent?.json {
					json["market_isk_spent"] = v
				}
				if let v = marketModifyMarketOrder?.json {
					json["market_modify_market_order"] = v
				}
				if let v = marketSearchContracts?.json {
					json["market_search_contracts"] = v
				}
				if let v = marketSellOrdersPlaced?.json {
					json["market_sell_orders_placed"] = v
				}
				if let v = miningDroneMine?.json {
					json["mining_drone_mine"] = v
				}
				if let v = miningOreArkonor?.json {
					json["mining_ore_arkonor"] = v
				}
				if let v = miningOreBistot?.json {
					json["mining_ore_bistot"] = v
				}
				if let v = miningOreCrokite?.json {
					json["mining_ore_crokite"] = v
				}
				if let v = miningOreDarkOchre?.json {
					json["mining_ore_dark_ochre"] = v
				}
				if let v = miningOreGneiss?.json {
					json["mining_ore_gneiss"] = v
				}
				if let v = miningOreHarvestableCloud?.json {
					json["mining_ore_harvestable_cloud"] = v
				}
				if let v = miningOreHedbergite?.json {
					json["mining_ore_hedbergite"] = v
				}
				if let v = miningOreHemorphite?.json {
					json["mining_ore_hemorphite"] = v
				}
				if let v = miningOreIce?.json {
					json["mining_ore_ice"] = v
				}
				if let v = miningOreJaspet?.json {
					json["mining_ore_jaspet"] = v
				}
				if let v = miningOreKernite?.json {
					json["mining_ore_kernite"] = v
				}
				if let v = miningOreMercoxit?.json {
					json["mining_ore_mercoxit"] = v
				}
				if let v = miningOreOmber?.json {
					json["mining_ore_omber"] = v
				}
				if let v = miningOrePlagioclase?.json {
					json["mining_ore_plagioclase"] = v
				}
				if let v = miningOrePyroxeres?.json {
					json["mining_ore_pyroxeres"] = v
				}
				if let v = miningOreScordite?.json {
					json["mining_ore_scordite"] = v
				}
				if let v = miningOreSpodumain?.json {
					json["mining_ore_spodumain"] = v
				}
				if let v = miningOreVeldspar?.json {
					json["mining_ore_veldspar"] = v
				}
				if let v = moduleActivationsArmorHardener?.json {
					json["module_activations_armor_hardener"] = v
				}
				if let v = moduleActivationsArmorRepairUnit?.json {
					json["module_activations_armor_repair_unit"] = v
				}
				if let v = moduleActivationsArmorResistanceShiftHardener?.json {
					json["module_activations_armor_resistance_shift_hardener"] = v
				}
				if let v = moduleActivationsAutomatedTargetingSystem?.json {
					json["module_activations_automated_targeting_system"] = v
				}
				if let v = moduleActivationsBastion?.json {
					json["module_activations_bastion"] = v
				}
				if let v = moduleActivationsBombLauncher?.json {
					json["module_activations_bomb_launcher"] = v
				}
				if let v = moduleActivationsCapacitorBooster?.json {
					json["module_activations_capacitor_booster"] = v
				}
				if let v = moduleActivationsCargoScanner?.json {
					json["module_activations_cargo_scanner"] = v
				}
				if let v = moduleActivationsCloakingDevice?.json {
					json["module_activations_cloaking_device"] = v
				}
				if let v = moduleActivationsCloneVatBay?.json {
					json["module_activations_clone_vat_bay"] = v
				}
				if let v = moduleActivationsCynosuralField?.json {
					json["module_activations_cynosural_field"] = v
				}
				if let v = moduleActivationsDamageControl?.json {
					json["module_activations_damage_control"] = v
				}
				if let v = moduleActivationsDataMiners?.json {
					json["module_activations_data_miners"] = v
				}
				if let v = moduleActivationsDroneControlUnit?.json {
					json["module_activations_drone_control_unit"] = v
				}
				if let v = moduleActivationsDroneTrackingModules?.json {
					json["module_activations_drone_tracking_modules"] = v
				}
				if let v = moduleActivationsEccm?.json {
					json["module_activations_eccm"] = v
				}
				if let v = moduleActivationsEcm?.json {
					json["module_activations_ecm"] = v
				}
				if let v = moduleActivationsEcmBurst?.json {
					json["module_activations_ecm_burst"] = v
				}
				if let v = moduleActivationsEnergyDestabilizer?.json {
					json["module_activations_energy_destabilizer"] = v
				}
				if let v = moduleActivationsEnergyVampire?.json {
					json["module_activations_energy_vampire"] = v
				}
				if let v = moduleActivationsEnergyWeapon?.json {
					json["module_activations_energy_weapon"] = v
				}
				if let v = moduleActivationsFestivalLauncher?.json {
					json["module_activations_festival_launcher"] = v
				}
				if let v = moduleActivationsFrequencyMiningLaser?.json {
					json["module_activations_frequency_mining_laser"] = v
				}
				if let v = moduleActivationsFueledArmorRepairer?.json {
					json["module_activations_fueled_armor_repairer"] = v
				}
				if let v = moduleActivationsFueledShieldBooster?.json {
					json["module_activations_fueled_shield_booster"] = v
				}
				if let v = moduleActivationsGangCoordinator?.json {
					json["module_activations_gang_coordinator"] = v
				}
				if let v = moduleActivationsGasCloudHarvester?.json {
					json["module_activations_gas_cloud_harvester"] = v
				}
				if let v = moduleActivationsHullRepairUnit?.json {
					json["module_activations_hull_repair_unit"] = v
				}
				if let v = moduleActivationsHybridWeapon?.json {
					json["module_activations_hybrid_weapon"] = v
				}
				if let v = moduleActivationsIndustrialCore?.json {
					json["module_activations_industrial_core"] = v
				}
				if let v = moduleActivationsInterdictionSphereLauncher?.json {
					json["module_activations_interdiction_sphere_launcher"] = v
				}
				if let v = moduleActivationsMicroJumpDrive?.json {
					json["module_activations_micro_jump_drive"] = v
				}
				if let v = moduleActivationsMiningLaser?.json {
					json["module_activations_mining_laser"] = v
				}
				if let v = moduleActivationsMissileLauncher?.json {
					json["module_activations_missile_launcher"] = v
				}
				if let v = moduleActivationsPassiveTargetingSystem?.json {
					json["module_activations_passive_targeting_system"] = v
				}
				if let v = moduleActivationsProbeLauncher?.json {
					json["module_activations_probe_launcher"] = v
				}
				if let v = moduleActivationsProjectedEccm?.json {
					json["module_activations_projected_eccm"] = v
				}
				if let v = moduleActivationsProjectileWeapon?.json {
					json["module_activations_projectile_weapon"] = v
				}
				if let v = moduleActivationsPropulsionModule?.json {
					json["module_activations_propulsion_module"] = v
				}
				if let v = moduleActivationsRemoteArmorRepairer?.json {
					json["module_activations_remote_armor_repairer"] = v
				}
				if let v = moduleActivationsRemoteCapacitorTransmitter?.json {
					json["module_activations_remote_capacitor_transmitter"] = v
				}
				if let v = moduleActivationsRemoteEcmBurst?.json {
					json["module_activations_remote_ecm_burst"] = v
				}
				if let v = moduleActivationsRemoteHullRepairer?.json {
					json["module_activations_remote_hull_repairer"] = v
				}
				if let v = moduleActivationsRemoteSensorBooster?.json {
					json["module_activations_remote_sensor_booster"] = v
				}
				if let v = moduleActivationsRemoteSensorDamper?.json {
					json["module_activations_remote_sensor_damper"] = v
				}
				if let v = moduleActivationsRemoteShieldBooster?.json {
					json["module_activations_remote_shield_booster"] = v
				}
				if let v = moduleActivationsRemoteTrackingComputer?.json {
					json["module_activations_remote_tracking_computer"] = v
				}
				if let v = moduleActivationsSalvager?.json {
					json["module_activations_salvager"] = v
				}
				if let v = moduleActivationsSensorBooster?.json {
					json["module_activations_sensor_booster"] = v
				}
				if let v = moduleActivationsShieldBooster?.json {
					json["module_activations_shield_booster"] = v
				}
				if let v = moduleActivationsShieldHardener?.json {
					json["module_activations_shield_hardener"] = v
				}
				if let v = moduleActivationsShipScanner?.json {
					json["module_activations_ship_scanner"] = v
				}
				if let v = moduleActivationsSiege?.json {
					json["module_activations_siege"] = v
				}
				if let v = moduleActivationsSmartBomb?.json {
					json["module_activations_smart_bomb"] = v
				}
				if let v = moduleActivationsStasisWeb?.json {
					json["module_activations_stasis_web"] = v
				}
				if let v = moduleActivationsStripMiner?.json {
					json["module_activations_strip_miner"] = v
				}
				if let v = moduleActivationsSuperWeapon?.json {
					json["module_activations_super_weapon"] = v
				}
				if let v = moduleActivationsSurveyScanner?.json {
					json["module_activations_survey_scanner"] = v
				}
				if let v = moduleActivationsTargetBreaker?.json {
					json["module_activations_target_breaker"] = v
				}
				if let v = moduleActivationsTargetPainter?.json {
					json["module_activations_target_painter"] = v
				}
				if let v = moduleActivationsTrackingComputer?.json {
					json["module_activations_tracking_computer"] = v
				}
				if let v = moduleActivationsTrackingDisruptor?.json {
					json["module_activations_tracking_disruptor"] = v
				}
				if let v = moduleActivationsTractorBeam?.json {
					json["module_activations_tractor_beam"] = v
				}
				if let v = moduleActivationsTriage?.json {
					json["module_activations_triage"] = v
				}
				if let v = moduleActivationsWarpDisruptFieldGenerator?.json {
					json["module_activations_warp_disrupt_field_generator"] = v
				}
				if let v = moduleActivationsWarpScrambler?.json {
					json["module_activations_warp_scrambler"] = v
				}
				if let v = moduleLinkWeapons?.json {
					json["module_link_weapons"] = v
				}
				if let v = moduleOverload?.json {
					json["module_overload"] = v
				}
				if let v = moduleRepairs?.json {
					json["module_repairs"] = v
				}
				if let v = orbitalStrikeCharactersKilled?.json {
					json["orbital_strike_characters_killed"] = v
				}
				if let v = orbitalStrikeDamageToPlayersArmorAmount?.json {
					json["orbital_strike_damage_to_players_armor_amount"] = v
				}
				if let v = orbitalStrikeDamageToPlayersShieldAmount?.json {
					json["orbital_strike_damage_to_players_shield_amount"] = v
				}
				if let v = pveDungeonsCompletedAgent?.json {
					json["pve_dungeons_completed_agent"] = v
				}
				if let v = pveDungeonsCompletedDistribution?.json {
					json["pve_dungeons_completed_distribution"] = v
				}
				if let v = pveMissionsSucceeded?.json {
					json["pve_missions_succeeded"] = v
				}
				if let v = pveMissionsSucceededEpicArc?.json {
					json["pve_missions_succeeded_epic_arc"] = v
				}
				if let v = socialAddContactBad?.json {
					json["social_add_contact_bad"] = v
				}
				if let v = socialAddContactGood?.json {
					json["social_add_contact_good"] = v
				}
				if let v = socialAddContactHigh?.json {
					json["social_add_contact_high"] = v
				}
				if let v = socialAddContactHorrible?.json {
					json["social_add_contact_horrible"] = v
				}
				if let v = socialAddContactNeutral?.json {
					json["social_add_contact_neutral"] = v
				}
				if let v = socialAddNote?.json {
					json["social_add_note"] = v
				}
				if let v = socialAddedAsContactBad?.json {
					json["social_added_as_contact_bad"] = v
				}
				if let v = socialAddedAsContactGood?.json {
					json["social_added_as_contact_good"] = v
				}
				if let v = socialAddedAsContactHigh?.json {
					json["social_added_as_contact_high"] = v
				}
				if let v = socialAddedAsContactHorrible?.json {
					json["social_added_as_contact_horrible"] = v
				}
				if let v = socialAddedAsContactNeutral?.json {
					json["social_added_as_contact_neutral"] = v
				}
				if let v = socialCalendarEventCreated?.json {
					json["social_calendar_event_created"] = v
				}
				if let v = socialChatMessagesAlliance?.json {
					json["social_chat_messages_alliance"] = v
				}
				if let v = socialChatMessagesConstellation?.json {
					json["social_chat_messages_constellation"] = v
				}
				if let v = socialChatMessagesCorporation?.json {
					json["social_chat_messages_corporation"] = v
				}
				if let v = socialChatMessagesFleet?.json {
					json["social_chat_messages_fleet"] = v
				}
				if let v = socialChatMessagesRegion?.json {
					json["social_chat_messages_region"] = v
				}
				if let v = socialChatMessagesSolarsystem?.json {
					json["social_chat_messages_solarsystem"] = v
				}
				if let v = socialChatMessagesWarfaction?.json {
					json["social_chat_messages_warfaction"] = v
				}
				if let v = socialChatTotalMessageLength?.json {
					json["social_chat_total_message_length"] = v
				}
				if let v = socialDirectTrades?.json {
					json["social_direct_trades"] = v
				}
				if let v = socialFleetBroadcasts?.json {
					json["social_fleet_broadcasts"] = v
				}
				if let v = socialFleetJoins?.json {
					json["social_fleet_joins"] = v
				}
				if let v = socialMailsReceived?.json {
					json["social_mails_received"] = v
				}
				if let v = socialMailsSent?.json {
					json["social_mails_sent"] = v
				}
				if let v = travelAccelerationGateActivations?.json {
					json["travel_acceleration_gate_activations"] = v
				}
				if let v = travelAlignTo?.json {
					json["travel_align_to"] = v
				}
				if let v = travelDistanceWarpedHighSec?.json {
					json["travel_distance_warped_high_sec"] = v
				}
				if let v = travelDistanceWarpedLowSec?.json {
					json["travel_distance_warped_low_sec"] = v
				}
				if let v = travelDistanceWarpedNullSec?.json {
					json["travel_distance_warped_null_sec"] = v
				}
				if let v = travelDistanceWarpedWormhole?.json {
					json["travel_distance_warped_wormhole"] = v
				}
				if let v = travelDocksHighSec?.json {
					json["travel_docks_high_sec"] = v
				}
				if let v = travelDocksLowSec?.json {
					json["travel_docks_low_sec"] = v
				}
				if let v = travelDocksNullSec?.json {
					json["travel_docks_null_sec"] = v
				}
				if let v = travelJumpsStargateHighSec?.json {
					json["travel_jumps_stargate_high_sec"] = v
				}
				if let v = travelJumpsStargateLowSec?.json {
					json["travel_jumps_stargate_low_sec"] = v
				}
				if let v = travelJumpsStargateNullSec?.json {
					json["travel_jumps_stargate_null_sec"] = v
				}
				if let v = travelJumpsWormhole?.json {
					json["travel_jumps_wormhole"] = v
				}
				if let v = travelWarpsHighSec?.json {
					json["travel_warps_high_sec"] = v
				}
				if let v = travelWarpsLowSec?.json {
					json["travel_warps_low_sec"] = v
				}
				if let v = travelWarpsNullSec?.json {
					json["travel_warps_null_sec"] = v
				}
				if let v = travelWarpsToBookmark?.json {
					json["travel_warps_to_bookmark"] = v
				}
				if let v = travelWarpsToCelestial?.json {
					json["travel_warps_to_celestial"] = v
				}
				if let v = travelWarpsToFleetMember?.json {
					json["travel_warps_to_fleet_member"] = v
				}
				if let v = travelWarpsToScanResult?.json {
					json["travel_warps_to_scan_result"] = v
				}
				if let v = travelWarpsWormhole?.json {
					json["travel_warps_wormhole"] = v
				}
				json["year"] = year.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.characterMinutes?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.characterSessionsStarted?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatCapDrainedbyNpc?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatCapDrainedbyPc?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatCapDrainingPc?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatCriminalFlagSet?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageFromNpCsAmount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageFromNpCsNumShots?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageFromPlayersBombAmount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageFromPlayersBombNumShots?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageFromPlayersCombatDroneAmount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageFromPlayersCombatDroneNumShots?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageFromPlayersEnergyAmount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageFromPlayersEnergyNumShots?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageFromPlayersFighterBomberAmount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageFromPlayersFighterBomberNumShots?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageFromPlayersFighterDroneAmount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageFromPlayersFighterDroneNumShots?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageFromPlayersHybridAmount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageFromPlayersHybridNumShots?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageFromPlayersMissileAmount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageFromPlayersMissileNumShots?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageFromPlayersProjectileAmount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageFromPlayersProjectileNumShots?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageFromPlayersSmartBombAmount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageFromPlayersSmartBombNumShots?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageFromPlayersSuperAmount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageFromPlayersSuperNumShots?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageFromStructuresTotalAmount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageFromStructuresTotalNumShots?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageToPlayersBombAmount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageToPlayersBombNumShots?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageToPlayersCombatDroneAmount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageToPlayersCombatDroneNumShots?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageToPlayersEnergyAmount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageToPlayersEnergyNumShots?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageToPlayersFighterBomberAmount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageToPlayersFighterBomberNumShots?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageToPlayersFighterDroneAmount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageToPlayersFighterDroneNumShots?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageToPlayersHybridAmount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageToPlayersHybridNumShots?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageToPlayersMissileAmount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageToPlayersMissileNumShots?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageToPlayersProjectileAmount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageToPlayersProjectileNumShots?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageToPlayersSmartBombAmount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageToPlayersSmartBombNumShots?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageToPlayersSuperAmount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageToPlayersSuperNumShots?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageToStructuresTotalAmount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDamageToStructuresTotalNumShots?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDeathsHighSec?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDeathsLowSec?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDeathsNullSec?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDeathsPodHighSec?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDeathsPodLowSec?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDeathsPodNullSec?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDeathsPodWormhole?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDeathsWormhole?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDroneEngage?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatDuelRequested?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatEngagementRegister?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatKillsAssists?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatKillsHighSec?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatKillsLowSec?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatKillsNullSec?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatKillsPodHighSec?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatKillsPodLowSec?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatKillsPodNullSec?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatKillsPodWormhole?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatKillsWormhole?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatNpcFlagSet?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatPvpFlagSet?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatRepairArmorByRemoteAmount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatRepairArmorRemoteAmount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatRepairArmorSelfAmount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatRepairCapacitorByRemoteAmount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatRepairCapacitorRemoteAmount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatRepairCapacitorSelfAmount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatRepairHullByRemoteAmount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatRepairHullRemoteAmount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatRepairHullSelfAmount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatRepairShieldByRemoteAmount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatRepairShieldRemoteAmount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatRepairShieldSelfAmount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatSelfDestructs?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatWarpScramblePc?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatWarpScrambledbyNpc?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatWarpScrambledbyPc?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatWeaponFlagSet?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatWebifiedbyNpc?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatWebifiedbyPc?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.combatWebifyingPc?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.daysOfActivity?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.genericConeScans?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.genericRequestScans?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.industryHackingSuccesses?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.industryJobsCancelled?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.industryJobsCompletedCopyBlueprint?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.industryJobsCompletedInvention?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.industryJobsCompletedManufacture?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.industryJobsCompletedManufactureAsteroid?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.industryJobsCompletedManufactureAsteroidQuantity?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.industryJobsCompletedManufactureCharge?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.industryJobsCompletedManufactureChargeQuantity?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.industryJobsCompletedManufactureCommodity?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.industryJobsCompletedManufactureCommodityQuantity?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.industryJobsCompletedManufactureDeployable?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.industryJobsCompletedManufactureDeployableQuantity?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.industryJobsCompletedManufactureDrone?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.industryJobsCompletedManufactureDroneQuantity?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.industryJobsCompletedManufactureImplant?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.industryJobsCompletedManufactureImplantQuantity?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.industryJobsCompletedManufactureModule?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.industryJobsCompletedManufactureModuleQuantity?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.industryJobsCompletedManufactureOther?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.industryJobsCompletedManufactureOtherQuantity?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.industryJobsCompletedManufactureShip?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.industryJobsCompletedManufactureShipQuantity?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.industryJobsCompletedManufactureStructure?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.industryJobsCompletedManufactureStructureQuantity?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.industryJobsCompletedManufactureSubsystem?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.industryJobsCompletedManufactureSubsystemQuantity?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.industryJobsCompletedMaterialProductivity?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.industryJobsCompletedTimeProductivity?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.industryJobsStartedCopyBlueprint?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.industryJobsStartedInvention?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.industryJobsStartedManufacture?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.industryJobsStartedMaterialProductivity?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.industryJobsStartedTimeProductivity?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.industryReprocessItem?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.industryReprocessItemQuantity?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.inventoryAbandonLootQuantity?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.inventoryTrashItemQuantity?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.iskIn?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.iskOut?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.marketAcceptContractsCourier?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.marketAcceptContractsItemExchange?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.marketBuyOrdersPlaced?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.marketCancelMarketOrder?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.marketCreateContractsAuction?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.marketCreateContractsCourier?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.marketCreateContractsItemExchange?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.marketDeliverCourierContract?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.marketIskGained?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.marketIskSpent?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.marketModifyMarketOrder?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.marketSearchContracts?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.marketSellOrdersPlaced?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.miningDroneMine?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.miningOreArkonor?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.miningOreBistot?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.miningOreCrokite?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.miningOreDarkOchre?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.miningOreGneiss?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.miningOreHarvestableCloud?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.miningOreHedbergite?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.miningOreHemorphite?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.miningOreIce?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.miningOreJaspet?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.miningOreKernite?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.miningOreMercoxit?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.miningOreOmber?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.miningOrePlagioclase?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.miningOrePyroxeres?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.miningOreScordite?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.miningOreSpodumain?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.miningOreVeldspar?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsArmorHardener?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsArmorRepairUnit?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsArmorResistanceShiftHardener?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsAutomatedTargetingSystem?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsBastion?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsBombLauncher?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsCapacitorBooster?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsCargoScanner?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsCloakingDevice?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsCloneVatBay?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsCynosuralField?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsDamageControl?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsDataMiners?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsDroneControlUnit?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsDroneTrackingModules?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsEccm?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsEcm?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsEcmBurst?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsEnergyDestabilizer?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsEnergyVampire?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsEnergyWeapon?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsFestivalLauncher?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsFrequencyMiningLaser?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsFueledArmorRepairer?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsFueledShieldBooster?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsGangCoordinator?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsGasCloudHarvester?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsHullRepairUnit?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsHybridWeapon?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsIndustrialCore?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsInterdictionSphereLauncher?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsMicroJumpDrive?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsMiningLaser?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsMissileLauncher?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsPassiveTargetingSystem?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsProbeLauncher?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsProjectedEccm?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsProjectileWeapon?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsPropulsionModule?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsRemoteArmorRepairer?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsRemoteCapacitorTransmitter?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsRemoteEcmBurst?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsRemoteHullRepairer?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsRemoteSensorBooster?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsRemoteSensorDamper?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsRemoteShieldBooster?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsRemoteTrackingComputer?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsSalvager?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsSensorBooster?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsShieldBooster?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsShieldHardener?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsShipScanner?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsSiege?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsSmartBomb?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsStasisWeb?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsStripMiner?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsSuperWeapon?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsSurveyScanner?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsTargetBreaker?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsTargetPainter?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsTrackingComputer?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsTrackingDisruptor?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsTractorBeam?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsTriage?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsWarpDisruptFieldGenerator?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleActivationsWarpScrambler?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleLinkWeapons?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleOverload?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.moduleRepairs?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.orbitalStrikeCharactersKilled?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.orbitalStrikeDamageToPlayersArmorAmount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.orbitalStrikeDamageToPlayersShieldAmount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.pveDungeonsCompletedAgent?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.pveDungeonsCompletedDistribution?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.pveMissionsSucceeded?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.pveMissionsSucceededEpicArc?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.socialAddContactBad?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.socialAddContactGood?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.socialAddContactHigh?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.socialAddContactHorrible?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.socialAddContactNeutral?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.socialAddNote?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.socialAddedAsContactBad?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.socialAddedAsContactGood?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.socialAddedAsContactHigh?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.socialAddedAsContactHorrible?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.socialAddedAsContactNeutral?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.socialCalendarEventCreated?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.socialChatMessagesAlliance?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.socialChatMessagesConstellation?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.socialChatMessagesCorporation?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.socialChatMessagesFleet?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.socialChatMessagesRegion?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.socialChatMessagesSolarsystem?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.socialChatMessagesWarfaction?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.socialChatTotalMessageLength?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.socialDirectTrades?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.socialFleetBroadcasts?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.socialFleetJoins?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.socialMailsReceived?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.socialMailsSent?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.travelAccelerationGateActivations?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.travelAlignTo?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.travelDistanceWarpedHighSec?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.travelDistanceWarpedLowSec?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.travelDistanceWarpedNullSec?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.travelDistanceWarpedWormhole?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.travelDocksHighSec?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.travelDocksLowSec?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.travelDocksNullSec?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.travelJumpsStargateHighSec?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.travelJumpsStargateLowSec?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.travelJumpsStargateNullSec?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.travelJumpsWormhole?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.travelWarpsHighSec?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.travelWarpsLowSec?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.travelWarpsNullSec?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.travelWarpsToBookmark?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.travelWarpsToCelestial?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.travelWarpsToFleetMember?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.travelWarpsToScanResult?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.travelWarpsWormhole?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.year.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Character.GetCharactersCharacterIDStatsOk, rhs: Character.GetCharactersCharacterIDStatsOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Character.GetCharactersCharacterIDStatsOk) {
				characterMinutes = other.characterMinutes
				characterSessionsStarted = other.characterSessionsStarted
				combatCapDrainedbyNpc = other.combatCapDrainedbyNpc
				combatCapDrainedbyPc = other.combatCapDrainedbyPc
				combatCapDrainingPc = other.combatCapDrainingPc
				combatCriminalFlagSet = other.combatCriminalFlagSet
				combatDamageFromNpCsAmount = other.combatDamageFromNpCsAmount
				combatDamageFromNpCsNumShots = other.combatDamageFromNpCsNumShots
				combatDamageFromPlayersBombAmount = other.combatDamageFromPlayersBombAmount
				combatDamageFromPlayersBombNumShots = other.combatDamageFromPlayersBombNumShots
				combatDamageFromPlayersCombatDroneAmount = other.combatDamageFromPlayersCombatDroneAmount
				combatDamageFromPlayersCombatDroneNumShots = other.combatDamageFromPlayersCombatDroneNumShots
				combatDamageFromPlayersEnergyAmount = other.combatDamageFromPlayersEnergyAmount
				combatDamageFromPlayersEnergyNumShots = other.combatDamageFromPlayersEnergyNumShots
				combatDamageFromPlayersFighterBomberAmount = other.combatDamageFromPlayersFighterBomberAmount
				combatDamageFromPlayersFighterBomberNumShots = other.combatDamageFromPlayersFighterBomberNumShots
				combatDamageFromPlayersFighterDroneAmount = other.combatDamageFromPlayersFighterDroneAmount
				combatDamageFromPlayersFighterDroneNumShots = other.combatDamageFromPlayersFighterDroneNumShots
				combatDamageFromPlayersHybridAmount = other.combatDamageFromPlayersHybridAmount
				combatDamageFromPlayersHybridNumShots = other.combatDamageFromPlayersHybridNumShots
				combatDamageFromPlayersMissileAmount = other.combatDamageFromPlayersMissileAmount
				combatDamageFromPlayersMissileNumShots = other.combatDamageFromPlayersMissileNumShots
				combatDamageFromPlayersProjectileAmount = other.combatDamageFromPlayersProjectileAmount
				combatDamageFromPlayersProjectileNumShots = other.combatDamageFromPlayersProjectileNumShots
				combatDamageFromPlayersSmartBombAmount = other.combatDamageFromPlayersSmartBombAmount
				combatDamageFromPlayersSmartBombNumShots = other.combatDamageFromPlayersSmartBombNumShots
				combatDamageFromPlayersSuperAmount = other.combatDamageFromPlayersSuperAmount
				combatDamageFromPlayersSuperNumShots = other.combatDamageFromPlayersSuperNumShots
				combatDamageFromStructuresTotalAmount = other.combatDamageFromStructuresTotalAmount
				combatDamageFromStructuresTotalNumShots = other.combatDamageFromStructuresTotalNumShots
				combatDamageToPlayersBombAmount = other.combatDamageToPlayersBombAmount
				combatDamageToPlayersBombNumShots = other.combatDamageToPlayersBombNumShots
				combatDamageToPlayersCombatDroneAmount = other.combatDamageToPlayersCombatDroneAmount
				combatDamageToPlayersCombatDroneNumShots = other.combatDamageToPlayersCombatDroneNumShots
				combatDamageToPlayersEnergyAmount = other.combatDamageToPlayersEnergyAmount
				combatDamageToPlayersEnergyNumShots = other.combatDamageToPlayersEnergyNumShots
				combatDamageToPlayersFighterBomberAmount = other.combatDamageToPlayersFighterBomberAmount
				combatDamageToPlayersFighterBomberNumShots = other.combatDamageToPlayersFighterBomberNumShots
				combatDamageToPlayersFighterDroneAmount = other.combatDamageToPlayersFighterDroneAmount
				combatDamageToPlayersFighterDroneNumShots = other.combatDamageToPlayersFighterDroneNumShots
				combatDamageToPlayersHybridAmount = other.combatDamageToPlayersHybridAmount
				combatDamageToPlayersHybridNumShots = other.combatDamageToPlayersHybridNumShots
				combatDamageToPlayersMissileAmount = other.combatDamageToPlayersMissileAmount
				combatDamageToPlayersMissileNumShots = other.combatDamageToPlayersMissileNumShots
				combatDamageToPlayersProjectileAmount = other.combatDamageToPlayersProjectileAmount
				combatDamageToPlayersProjectileNumShots = other.combatDamageToPlayersProjectileNumShots
				combatDamageToPlayersSmartBombAmount = other.combatDamageToPlayersSmartBombAmount
				combatDamageToPlayersSmartBombNumShots = other.combatDamageToPlayersSmartBombNumShots
				combatDamageToPlayersSuperAmount = other.combatDamageToPlayersSuperAmount
				combatDamageToPlayersSuperNumShots = other.combatDamageToPlayersSuperNumShots
				combatDamageToStructuresTotalAmount = other.combatDamageToStructuresTotalAmount
				combatDamageToStructuresTotalNumShots = other.combatDamageToStructuresTotalNumShots
				combatDeathsHighSec = other.combatDeathsHighSec
				combatDeathsLowSec = other.combatDeathsLowSec
				combatDeathsNullSec = other.combatDeathsNullSec
				combatDeathsPodHighSec = other.combatDeathsPodHighSec
				combatDeathsPodLowSec = other.combatDeathsPodLowSec
				combatDeathsPodNullSec = other.combatDeathsPodNullSec
				combatDeathsPodWormhole = other.combatDeathsPodWormhole
				combatDeathsWormhole = other.combatDeathsWormhole
				combatDroneEngage = other.combatDroneEngage
				combatDuelRequested = other.combatDuelRequested
				combatEngagementRegister = other.combatEngagementRegister
				combatKillsAssists = other.combatKillsAssists
				combatKillsHighSec = other.combatKillsHighSec
				combatKillsLowSec = other.combatKillsLowSec
				combatKillsNullSec = other.combatKillsNullSec
				combatKillsPodHighSec = other.combatKillsPodHighSec
				combatKillsPodLowSec = other.combatKillsPodLowSec
				combatKillsPodNullSec = other.combatKillsPodNullSec
				combatKillsPodWormhole = other.combatKillsPodWormhole
				combatKillsWormhole = other.combatKillsWormhole
				combatNpcFlagSet = other.combatNpcFlagSet
				combatPvpFlagSet = other.combatPvpFlagSet
				combatRepairArmorByRemoteAmount = other.combatRepairArmorByRemoteAmount
				combatRepairArmorRemoteAmount = other.combatRepairArmorRemoteAmount
				combatRepairArmorSelfAmount = other.combatRepairArmorSelfAmount
				combatRepairCapacitorByRemoteAmount = other.combatRepairCapacitorByRemoteAmount
				combatRepairCapacitorRemoteAmount = other.combatRepairCapacitorRemoteAmount
				combatRepairCapacitorSelfAmount = other.combatRepairCapacitorSelfAmount
				combatRepairHullByRemoteAmount = other.combatRepairHullByRemoteAmount
				combatRepairHullRemoteAmount = other.combatRepairHullRemoteAmount
				combatRepairHullSelfAmount = other.combatRepairHullSelfAmount
				combatRepairShieldByRemoteAmount = other.combatRepairShieldByRemoteAmount
				combatRepairShieldRemoteAmount = other.combatRepairShieldRemoteAmount
				combatRepairShieldSelfAmount = other.combatRepairShieldSelfAmount
				combatSelfDestructs = other.combatSelfDestructs
				combatWarpScramblePc = other.combatWarpScramblePc
				combatWarpScrambledbyNpc = other.combatWarpScrambledbyNpc
				combatWarpScrambledbyPc = other.combatWarpScrambledbyPc
				combatWeaponFlagSet = other.combatWeaponFlagSet
				combatWebifiedbyNpc = other.combatWebifiedbyNpc
				combatWebifiedbyPc = other.combatWebifiedbyPc
				combatWebifyingPc = other.combatWebifyingPc
				daysOfActivity = other.daysOfActivity
				genericConeScans = other.genericConeScans
				genericRequestScans = other.genericRequestScans
				industryHackingSuccesses = other.industryHackingSuccesses
				industryJobsCancelled = other.industryJobsCancelled
				industryJobsCompletedCopyBlueprint = other.industryJobsCompletedCopyBlueprint
				industryJobsCompletedInvention = other.industryJobsCompletedInvention
				industryJobsCompletedManufacture = other.industryJobsCompletedManufacture
				industryJobsCompletedManufactureAsteroid = other.industryJobsCompletedManufactureAsteroid
				industryJobsCompletedManufactureAsteroidQuantity = other.industryJobsCompletedManufactureAsteroidQuantity
				industryJobsCompletedManufactureCharge = other.industryJobsCompletedManufactureCharge
				industryJobsCompletedManufactureChargeQuantity = other.industryJobsCompletedManufactureChargeQuantity
				industryJobsCompletedManufactureCommodity = other.industryJobsCompletedManufactureCommodity
				industryJobsCompletedManufactureCommodityQuantity = other.industryJobsCompletedManufactureCommodityQuantity
				industryJobsCompletedManufactureDeployable = other.industryJobsCompletedManufactureDeployable
				industryJobsCompletedManufactureDeployableQuantity = other.industryJobsCompletedManufactureDeployableQuantity
				industryJobsCompletedManufactureDrone = other.industryJobsCompletedManufactureDrone
				industryJobsCompletedManufactureDroneQuantity = other.industryJobsCompletedManufactureDroneQuantity
				industryJobsCompletedManufactureImplant = other.industryJobsCompletedManufactureImplant
				industryJobsCompletedManufactureImplantQuantity = other.industryJobsCompletedManufactureImplantQuantity
				industryJobsCompletedManufactureModule = other.industryJobsCompletedManufactureModule
				industryJobsCompletedManufactureModuleQuantity = other.industryJobsCompletedManufactureModuleQuantity
				industryJobsCompletedManufactureOther = other.industryJobsCompletedManufactureOther
				industryJobsCompletedManufactureOtherQuantity = other.industryJobsCompletedManufactureOtherQuantity
				industryJobsCompletedManufactureShip = other.industryJobsCompletedManufactureShip
				industryJobsCompletedManufactureShipQuantity = other.industryJobsCompletedManufactureShipQuantity
				industryJobsCompletedManufactureStructure = other.industryJobsCompletedManufactureStructure
				industryJobsCompletedManufactureStructureQuantity = other.industryJobsCompletedManufactureStructureQuantity
				industryJobsCompletedManufactureSubsystem = other.industryJobsCompletedManufactureSubsystem
				industryJobsCompletedManufactureSubsystemQuantity = other.industryJobsCompletedManufactureSubsystemQuantity
				industryJobsCompletedMaterialProductivity = other.industryJobsCompletedMaterialProductivity
				industryJobsCompletedTimeProductivity = other.industryJobsCompletedTimeProductivity
				industryJobsStartedCopyBlueprint = other.industryJobsStartedCopyBlueprint
				industryJobsStartedInvention = other.industryJobsStartedInvention
				industryJobsStartedManufacture = other.industryJobsStartedManufacture
				industryJobsStartedMaterialProductivity = other.industryJobsStartedMaterialProductivity
				industryJobsStartedTimeProductivity = other.industryJobsStartedTimeProductivity
				industryReprocessItem = other.industryReprocessItem
				industryReprocessItemQuantity = other.industryReprocessItemQuantity
				inventoryAbandonLootQuantity = other.inventoryAbandonLootQuantity
				inventoryTrashItemQuantity = other.inventoryTrashItemQuantity
				iskIn = other.iskIn
				iskOut = other.iskOut
				marketAcceptContractsCourier = other.marketAcceptContractsCourier
				marketAcceptContractsItemExchange = other.marketAcceptContractsItemExchange
				marketBuyOrdersPlaced = other.marketBuyOrdersPlaced
				marketCancelMarketOrder = other.marketCancelMarketOrder
				marketCreateContractsAuction = other.marketCreateContractsAuction
				marketCreateContractsCourier = other.marketCreateContractsCourier
				marketCreateContractsItemExchange = other.marketCreateContractsItemExchange
				marketDeliverCourierContract = other.marketDeliverCourierContract
				marketIskGained = other.marketIskGained
				marketIskSpent = other.marketIskSpent
				marketModifyMarketOrder = other.marketModifyMarketOrder
				marketSearchContracts = other.marketSearchContracts
				marketSellOrdersPlaced = other.marketSellOrdersPlaced
				miningDroneMine = other.miningDroneMine
				miningOreArkonor = other.miningOreArkonor
				miningOreBistot = other.miningOreBistot
				miningOreCrokite = other.miningOreCrokite
				miningOreDarkOchre = other.miningOreDarkOchre
				miningOreGneiss = other.miningOreGneiss
				miningOreHarvestableCloud = other.miningOreHarvestableCloud
				miningOreHedbergite = other.miningOreHedbergite
				miningOreHemorphite = other.miningOreHemorphite
				miningOreIce = other.miningOreIce
				miningOreJaspet = other.miningOreJaspet
				miningOreKernite = other.miningOreKernite
				miningOreMercoxit = other.miningOreMercoxit
				miningOreOmber = other.miningOreOmber
				miningOrePlagioclase = other.miningOrePlagioclase
				miningOrePyroxeres = other.miningOrePyroxeres
				miningOreScordite = other.miningOreScordite
				miningOreSpodumain = other.miningOreSpodumain
				miningOreVeldspar = other.miningOreVeldspar
				moduleActivationsArmorHardener = other.moduleActivationsArmorHardener
				moduleActivationsArmorRepairUnit = other.moduleActivationsArmorRepairUnit
				moduleActivationsArmorResistanceShiftHardener = other.moduleActivationsArmorResistanceShiftHardener
				moduleActivationsAutomatedTargetingSystem = other.moduleActivationsAutomatedTargetingSystem
				moduleActivationsBastion = other.moduleActivationsBastion
				moduleActivationsBombLauncher = other.moduleActivationsBombLauncher
				moduleActivationsCapacitorBooster = other.moduleActivationsCapacitorBooster
				moduleActivationsCargoScanner = other.moduleActivationsCargoScanner
				moduleActivationsCloakingDevice = other.moduleActivationsCloakingDevice
				moduleActivationsCloneVatBay = other.moduleActivationsCloneVatBay
				moduleActivationsCynosuralField = other.moduleActivationsCynosuralField
				moduleActivationsDamageControl = other.moduleActivationsDamageControl
				moduleActivationsDataMiners = other.moduleActivationsDataMiners
				moduleActivationsDroneControlUnit = other.moduleActivationsDroneControlUnit
				moduleActivationsDroneTrackingModules = other.moduleActivationsDroneTrackingModules
				moduleActivationsEccm = other.moduleActivationsEccm
				moduleActivationsEcm = other.moduleActivationsEcm
				moduleActivationsEcmBurst = other.moduleActivationsEcmBurst
				moduleActivationsEnergyDestabilizer = other.moduleActivationsEnergyDestabilizer
				moduleActivationsEnergyVampire = other.moduleActivationsEnergyVampire
				moduleActivationsEnergyWeapon = other.moduleActivationsEnergyWeapon
				moduleActivationsFestivalLauncher = other.moduleActivationsFestivalLauncher
				moduleActivationsFrequencyMiningLaser = other.moduleActivationsFrequencyMiningLaser
				moduleActivationsFueledArmorRepairer = other.moduleActivationsFueledArmorRepairer
				moduleActivationsFueledShieldBooster = other.moduleActivationsFueledShieldBooster
				moduleActivationsGangCoordinator = other.moduleActivationsGangCoordinator
				moduleActivationsGasCloudHarvester = other.moduleActivationsGasCloudHarvester
				moduleActivationsHullRepairUnit = other.moduleActivationsHullRepairUnit
				moduleActivationsHybridWeapon = other.moduleActivationsHybridWeapon
				moduleActivationsIndustrialCore = other.moduleActivationsIndustrialCore
				moduleActivationsInterdictionSphereLauncher = other.moduleActivationsInterdictionSphereLauncher
				moduleActivationsMicroJumpDrive = other.moduleActivationsMicroJumpDrive
				moduleActivationsMiningLaser = other.moduleActivationsMiningLaser
				moduleActivationsMissileLauncher = other.moduleActivationsMissileLauncher
				moduleActivationsPassiveTargetingSystem = other.moduleActivationsPassiveTargetingSystem
				moduleActivationsProbeLauncher = other.moduleActivationsProbeLauncher
				moduleActivationsProjectedEccm = other.moduleActivationsProjectedEccm
				moduleActivationsProjectileWeapon = other.moduleActivationsProjectileWeapon
				moduleActivationsPropulsionModule = other.moduleActivationsPropulsionModule
				moduleActivationsRemoteArmorRepairer = other.moduleActivationsRemoteArmorRepairer
				moduleActivationsRemoteCapacitorTransmitter = other.moduleActivationsRemoteCapacitorTransmitter
				moduleActivationsRemoteEcmBurst = other.moduleActivationsRemoteEcmBurst
				moduleActivationsRemoteHullRepairer = other.moduleActivationsRemoteHullRepairer
				moduleActivationsRemoteSensorBooster = other.moduleActivationsRemoteSensorBooster
				moduleActivationsRemoteSensorDamper = other.moduleActivationsRemoteSensorDamper
				moduleActivationsRemoteShieldBooster = other.moduleActivationsRemoteShieldBooster
				moduleActivationsRemoteTrackingComputer = other.moduleActivationsRemoteTrackingComputer
				moduleActivationsSalvager = other.moduleActivationsSalvager
				moduleActivationsSensorBooster = other.moduleActivationsSensorBooster
				moduleActivationsShieldBooster = other.moduleActivationsShieldBooster
				moduleActivationsShieldHardener = other.moduleActivationsShieldHardener
				moduleActivationsShipScanner = other.moduleActivationsShipScanner
				moduleActivationsSiege = other.moduleActivationsSiege
				moduleActivationsSmartBomb = other.moduleActivationsSmartBomb
				moduleActivationsStasisWeb = other.moduleActivationsStasisWeb
				moduleActivationsStripMiner = other.moduleActivationsStripMiner
				moduleActivationsSuperWeapon = other.moduleActivationsSuperWeapon
				moduleActivationsSurveyScanner = other.moduleActivationsSurveyScanner
				moduleActivationsTargetBreaker = other.moduleActivationsTargetBreaker
				moduleActivationsTargetPainter = other.moduleActivationsTargetPainter
				moduleActivationsTrackingComputer = other.moduleActivationsTrackingComputer
				moduleActivationsTrackingDisruptor = other.moduleActivationsTrackingDisruptor
				moduleActivationsTractorBeam = other.moduleActivationsTractorBeam
				moduleActivationsTriage = other.moduleActivationsTriage
				moduleActivationsWarpDisruptFieldGenerator = other.moduleActivationsWarpDisruptFieldGenerator
				moduleActivationsWarpScrambler = other.moduleActivationsWarpScrambler
				moduleLinkWeapons = other.moduleLinkWeapons
				moduleOverload = other.moduleOverload
				moduleRepairs = other.moduleRepairs
				orbitalStrikeCharactersKilled = other.orbitalStrikeCharactersKilled
				orbitalStrikeDamageToPlayersArmorAmount = other.orbitalStrikeDamageToPlayersArmorAmount
				orbitalStrikeDamageToPlayersShieldAmount = other.orbitalStrikeDamageToPlayersShieldAmount
				pveDungeonsCompletedAgent = other.pveDungeonsCompletedAgent
				pveDungeonsCompletedDistribution = other.pveDungeonsCompletedDistribution
				pveMissionsSucceeded = other.pveMissionsSucceeded
				pveMissionsSucceededEpicArc = other.pveMissionsSucceededEpicArc
				socialAddContactBad = other.socialAddContactBad
				socialAddContactGood = other.socialAddContactGood
				socialAddContactHigh = other.socialAddContactHigh
				socialAddContactHorrible = other.socialAddContactHorrible
				socialAddContactNeutral = other.socialAddContactNeutral
				socialAddNote = other.socialAddNote
				socialAddedAsContactBad = other.socialAddedAsContactBad
				socialAddedAsContactGood = other.socialAddedAsContactGood
				socialAddedAsContactHigh = other.socialAddedAsContactHigh
				socialAddedAsContactHorrible = other.socialAddedAsContactHorrible
				socialAddedAsContactNeutral = other.socialAddedAsContactNeutral
				socialCalendarEventCreated = other.socialCalendarEventCreated
				socialChatMessagesAlliance = other.socialChatMessagesAlliance
				socialChatMessagesConstellation = other.socialChatMessagesConstellation
				socialChatMessagesCorporation = other.socialChatMessagesCorporation
				socialChatMessagesFleet = other.socialChatMessagesFleet
				socialChatMessagesRegion = other.socialChatMessagesRegion
				socialChatMessagesSolarsystem = other.socialChatMessagesSolarsystem
				socialChatMessagesWarfaction = other.socialChatMessagesWarfaction
				socialChatTotalMessageLength = other.socialChatTotalMessageLength
				socialDirectTrades = other.socialDirectTrades
				socialFleetBroadcasts = other.socialFleetBroadcasts
				socialFleetJoins = other.socialFleetJoins
				socialMailsReceived = other.socialMailsReceived
				socialMailsSent = other.socialMailsSent
				travelAccelerationGateActivations = other.travelAccelerationGateActivations
				travelAlignTo = other.travelAlignTo
				travelDistanceWarpedHighSec = other.travelDistanceWarpedHighSec
				travelDistanceWarpedLowSec = other.travelDistanceWarpedLowSec
				travelDistanceWarpedNullSec = other.travelDistanceWarpedNullSec
				travelDistanceWarpedWormhole = other.travelDistanceWarpedWormhole
				travelDocksHighSec = other.travelDocksHighSec
				travelDocksLowSec = other.travelDocksLowSec
				travelDocksNullSec = other.travelDocksNullSec
				travelJumpsStargateHighSec = other.travelJumpsStargateHighSec
				travelJumpsStargateLowSec = other.travelJumpsStargateLowSec
				travelJumpsStargateNullSec = other.travelJumpsStargateNullSec
				travelJumpsWormhole = other.travelJumpsWormhole
				travelWarpsHighSec = other.travelWarpsHighSec
				travelWarpsLowSec = other.travelWarpsLowSec
				travelWarpsNullSec = other.travelWarpsNullSec
				travelWarpsToBookmark = other.travelWarpsToBookmark
				travelWarpsToCelestial = other.travelWarpsToCelestial
				travelWarpsToFleetMember = other.travelWarpsToFleetMember
				travelWarpsToScanResult = other.travelWarpsToScanResult
				travelWarpsWormhole = other.travelWarpsWormhole
				year = other.year
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Character.GetCharactersCharacterIDStatsOk(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCharactersCharacterIDStatsOk)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESICharacterName) public class Name: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var characterID: Int64 = Int64()
			public var characterName: String = String()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let characterID = dictionary["character_id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.characterID = characterID
				guard let characterName = dictionary["character_name"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.characterName = characterName
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
		
		
		@objc(ESICharacterGetCharactersCharacterIDTitlesOk) public class GetCharactersCharacterIDTitlesOk: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var name: String? = nil
			public var titleID: Int? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				name = dictionary["name"] as? String
				titleID = dictionary["title_id"] as? Int
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				name = aDecoder.decodeObject(forKey: "name") as? String
				titleID = aDecoder.containsValue(forKey: "title_id") ? aDecoder.decodeInteger(forKey: "title_id") : nil
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = name {
					aCoder.encode(v, forKey: "name")
				}
				if let v = titleID {
					aCoder.encode(v, forKey: "title_id")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = name?.json {
					json["name"] = v
				}
				if let v = titleID?.json {
					json["title_id"] = v
				}
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.name?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.titleID?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Character.GetCharactersCharacterIDTitlesOk, rhs: Character.GetCharactersCharacterIDTitlesOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Character.GetCharactersCharacterIDTitlesOk) {
				name = other.name
				titleID = other.titleID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Character.GetCharactersCharacterIDTitlesOk(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCharactersCharacterIDTitlesOk)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESICharacterRole) public class Role: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public enum GetCharactersCharacterIDRolesRolesAtBase: String, JSONCoding, HTTPQueryable {
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
					self = .accountTake1
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCharactersCharacterIDRolesRolesAtBase(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCharactersCharacterIDRolesRolesAtHq: String, JSONCoding, HTTPQueryable {
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
					self = .accountTake1
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCharactersCharacterIDRolesRolesAtHq(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCharactersCharacterIDRolesRoles: String, JSONCoding, HTTPQueryable {
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
					self = .accountTake1
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCharactersCharacterIDRolesRoles(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCharactersCharacterIDRolesRolesAtOther: String, JSONCoding, HTTPQueryable {
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
					self = .accountTake1
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCharactersCharacterIDRolesRolesAtOther(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var roles: [Character.Role.GetCharactersCharacterIDRolesRoles]? = nil
			public var rolesAtBase: [Character.Role.GetCharactersCharacterIDRolesRolesAtBase]? = nil
			public var rolesAtHq: [Character.Role.GetCharactersCharacterIDRolesRolesAtHq]? = nil
			public var rolesAtOther: [Character.Role.GetCharactersCharacterIDRolesRolesAtOther]? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				roles = try (dictionary["roles"] as? [Any])?.map {try Character.Role.GetCharactersCharacterIDRolesRoles(json: $0)}
				rolesAtBase = try (dictionary["roles_at_base"] as? [Any])?.map {try Character.Role.GetCharactersCharacterIDRolesRolesAtBase(json: $0)}
				rolesAtHq = try (dictionary["roles_at_hq"] as? [Any])?.map {try Character.Role.GetCharactersCharacterIDRolesRolesAtHq(json: $0)}
				rolesAtOther = try (dictionary["roles_at_other"] as? [Any])?.map {try Character.Role.GetCharactersCharacterIDRolesRolesAtOther(json: $0)}
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				roles = aDecoder.decodeObject(forKey: "roles") as? [Character.Role.GetCharactersCharacterIDRolesRoles]
				rolesAtBase = aDecoder.decodeObject(forKey: "roles_at_base") as? [Character.Role.GetCharactersCharacterIDRolesRolesAtBase]
				rolesAtHq = aDecoder.decodeObject(forKey: "roles_at_hq") as? [Character.Role.GetCharactersCharacterIDRolesRolesAtHq]
				rolesAtOther = aDecoder.decodeObject(forKey: "roles_at_other") as? [Character.Role.GetCharactersCharacterIDRolesRolesAtOther]
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = roles {
					aCoder.encode(v, forKey: "roles")
				}
				if let v = rolesAtBase {
					aCoder.encode(v, forKey: "roles_at_base")
				}
				if let v = rolesAtHq {
					aCoder.encode(v, forKey: "roles_at_hq")
				}
				if let v = rolesAtOther {
					aCoder.encode(v, forKey: "roles_at_other")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = roles?.json {
					json["roles"] = v
				}
				if let v = rolesAtBase?.json {
					json["roles_at_base"] = v
				}
				if let v = rolesAtHq?.json {
					json["roles_at_hq"] = v
				}
				if let v = rolesAtOther?.json {
					json["roles_at_other"] = v
				}
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.roles?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.rolesAtBase?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.rolesAtHq?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.rolesAtOther?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Character.Role, rhs: Character.Role) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Character.Role) {
				roles = other.roles?.flatMap { $0 }
				rolesAtBase = other.rolesAtBase?.flatMap { $0 }
				rolesAtHq = other.rolesAtHq?.flatMap { $0 }
				rolesAtOther = other.rolesAtOther?.flatMap { $0 }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Character.Role(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Role)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESICharacterGetCharactersCharacterIDNotificationsOk) public class GetCharactersCharacterIDNotificationsOk: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public enum GetCharactersCharacterIDNotificationsSenderType: String, JSONCoding, HTTPQueryable {
				case alliance = "alliance"
				case character = "character"
				case corporation = "corporation"
				case faction = "faction"
				case other = "other"
				
				public init() {
					self = .character
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCharactersCharacterIDNotificationsSenderType(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCharactersCharacterIDNotificationsType: String, JSONCoding, HTTPQueryable {
				case acceptedAlly = "AcceptedAlly"
				case acceptedSurrender = "AcceptedSurrender"
				case allAnchoringMsg = "AllAnchoringMsg"
				case allMaintenanceBillMsg = "AllMaintenanceBillMsg"
				case allStrucInvulnerableMsg = "AllStrucInvulnerableMsg"
				case allStructVulnerableMsg = "AllStructVulnerableMsg"
				case allWarCorpJoinedAllianceMsg = "AllWarCorpJoinedAllianceMsg"
				case allWarDeclaredMsg = "AllWarDeclaredMsg"
				case allWarInvalidatedMsg = "AllWarInvalidatedMsg"
				case allWarRetractedMsg = "AllWarRetractedMsg"
				case allWarSurrenderMsg = "AllWarSurrenderMsg"
				case allianceCapitalChanged = "AllianceCapitalChanged"
				case allyContractCancelled = "AllyContractCancelled"
				case allyJoinedWarAggressorMsg = "AllyJoinedWarAggressorMsg"
				case allyJoinedWarAllyMsg = "AllyJoinedWarAllyMsg"
				case allyJoinedWarDefenderMsg = "AllyJoinedWarDefenderMsg"
				case battlePunishFriendlyFire = "BattlePunishFriendlyFire"
				case billOutOfMoneyMsg = "BillOutOfMoneyMsg"
				case billPaidCorpAllMsg = "BillPaidCorpAllMsg"
				case bountyClaimMsg = "BountyClaimMsg"
				case bountyESSShared = "BountyESSShared"
				case bountyESSTaken = "BountyESSTaken"
				case bountyPlacedAlliance = "BountyPlacedAlliance"
				case bountyPlacedChar = "BountyPlacedChar"
				case bountyPlacedCorp = "BountyPlacedCorp"
				case bountyYourBountyClaimed = "BountyYourBountyClaimed"
				case buddyConnectContactAdd = "BuddyConnectContactAdd"
				case charAppAcceptMsg = "CharAppAcceptMsg"
				case charAppRejectMsg = "CharAppRejectMsg"
				case charAppWithdrawMsg = "CharAppWithdrawMsg"
				case charLeftCorpMsg = "CharLeftCorpMsg"
				case charMedalMsg = "CharMedalMsg"
				case charTerminationMsg = "CharTerminationMsg"
				case cloneActivationMsg = "CloneActivationMsg"
				case cloneActivationMsg2 = "CloneActivationMsg2"
				case cloneMovedMsg = "CloneMovedMsg"
				case cloneRevokedMsg1 = "CloneRevokedMsg1"
				case cloneRevokedMsg2 = "CloneRevokedMsg2"
				case contactAdd = "ContactAdd"
				case contactEdit = "ContactEdit"
				case containerPasswordMsg = "ContainerPasswordMsg"
				case corpAllBillMsg = "CorpAllBillMsg"
				case corpAppAcceptMsg = "CorpAppAcceptMsg"
				case corpAppInvitedMsg = "CorpAppInvitedMsg"
				case corpAppNewMsg = "CorpAppNewMsg"
				case corpAppRejectCustomMsg = "CorpAppRejectCustomMsg"
				case corpAppRejectMsg = "CorpAppRejectMsg"
				case corpDividendMsg = "CorpDividendMsg"
				case corpFriendlyFireDisableTimerCompleted = "CorpFriendlyFireDisableTimerCompleted"
				case corpFriendlyFireDisableTimerStarted = "CorpFriendlyFireDisableTimerStarted"
				case corpFriendlyFireEnableTimerCompleted = "CorpFriendlyFireEnableTimerCompleted"
				case corpFriendlyFireEnableTimerStarted = "CorpFriendlyFireEnableTimerStarted"
				case corpKicked = "CorpKicked"
				case corpLiquidationMsg = "CorpLiquidationMsg"
				case corpNewCEOMsg = "CorpNewCEOMsg"
				case corpNewsMsg = "CorpNewsMsg"
				case corpOfficeExpirationMsg = "CorpOfficeExpirationMsg"
				case corpStructLostMsg = "CorpStructLostMsg"
				case corpTaxChangeMsg = "CorpTaxChangeMsg"
				case corpVoteCEORevokedMsg = "CorpVoteCEORevokedMsg"
				case corpVoteMsg = "CorpVoteMsg"
				case corpWarDeclaredMsg = "CorpWarDeclaredMsg"
				case corpWarFightingLegalMsg = "CorpWarFightingLegalMsg"
				case corpWarInvalidatedMsg = "CorpWarInvalidatedMsg"
				case corpWarRetractedMsg = "CorpWarRetractedMsg"
				case corpWarSurrenderMsg = "CorpWarSurrenderMsg"
				case customsMsg = "CustomsMsg"
				case declareWar = "DeclareWar"
				case districtAttacked = "DistrictAttacked"
				case dustAppAcceptedMsg = "DustAppAcceptedMsg"
				case entosisCaptureStarted = "EntosisCaptureStarted"
				case fWAllianceKickMsg = "FWAllianceKickMsg"
				case fWAllianceWarningMsg = "FWAllianceWarningMsg"
				case fWCharKickMsg = "FWCharKickMsg"
				case fWCharRankGainMsg = "FWCharRankGainMsg"
				case fWCharRankLossMsg = "FWCharRankLossMsg"
				case fWCharWarningMsg = "FWCharWarningMsg"
				case fWCorpJoinMsg = "FWCorpJoinMsg"
				case fWCorpKickMsg = "FWCorpKickMsg"
				case fWCorpLeaveMsg = "FWCorpLeaveMsg"
				case fWCorpWarningMsg = "FWCorpWarningMsg"
				case facWarCorpJoinRequestMsg = "FacWarCorpJoinRequestMsg"
				case facWarCorpJoinWithdrawMsg = "FacWarCorpJoinWithdrawMsg"
				case facWarCorpLeaveRequestMsg = "FacWarCorpLeaveRequestMsg"
				case facWarCorpLeaveWithdrawMsg = "FacWarCorpLeaveWithdrawMsg"
				case facWarLPDisqualifiedEvent = "FacWarLPDisqualifiedEvent"
				case facWarLPDisqualifiedKill = "FacWarLPDisqualifiedKill"
				case facWarLPPayoutEvent = "FacWarLPPayoutEvent"
				case facWarLPPayoutKill = "FacWarLPPayoutKill"
				case gameTimeAdded = "GameTimeAdded"
				case gameTimeReceived = "GameTimeReceived"
				case gameTimeSent = "GameTimeSent"
				case giftReceived = "GiftReceived"
				case iHubDestroyedByBillFailure = "IHubDestroyedByBillFailure"
				case incursionCompletedMsg = "IncursionCompletedMsg"
				case industryTeamAuctionLost = "IndustryTeamAuctionLost"
				case industryTeamAuctionWon = "IndustryTeamAuctionWon"
				case infrastructureHubBillAboutToExpire = "InfrastructureHubBillAboutToExpire"
				case insuranceExpirationMsg = "InsuranceExpirationMsg"
				case insuranceFirstShipMsg = "InsuranceFirstShipMsg"
				case insuranceInvalidatedMsg = "InsuranceInvalidatedMsg"
				case insuranceIssuedMsg = "InsuranceIssuedMsg"
				case insurancePayoutMsg = "InsurancePayoutMsg"
				case jumpCloneDeletedMsg1 = "JumpCloneDeletedMsg1"
				case jumpCloneDeletedMsg2 = "JumpCloneDeletedMsg2"
				case killReportFinalBlow = "KillReportFinalBlow"
				case killReportVictim = "KillReportVictim"
				case killRightAvailable = "KillRightAvailable"
				case killRightAvailableOpen = "KillRightAvailableOpen"
				case killRightEarned = "KillRightEarned"
				case killRightUnavailable = "KillRightUnavailable"
				case killRightUnavailableOpen = "KillRightUnavailableOpen"
				case killRightUsed = "KillRightUsed"
				case locateCharMsg = "LocateCharMsg"
				case madeWarMutual = "MadeWarMutual"
				case mercOfferedNegotiationMsg = "MercOfferedNegotiationMsg"
				case missionOfferExpirationMsg = "MissionOfferExpirationMsg"
				case missionTimeoutMsg = "MissionTimeoutMsg"
				case moonminingAutomaticFracture = "MoonminingAutomaticFracture"
				case moonminingExtractionCancelled = "MoonminingExtractionCancelled"
				case moonminingExtractionFinished = "MoonminingExtractionFinished"
				case moonminingLaserFired = "MoonminingLaserFired"
				case nPCStandingsGained = "NPCStandingsGained"
				case nPCStandingsLost = "NPCStandingsLost"
				case offeredSurrender = "OfferedSurrender"
				case offeredToAlly = "OfferedToAlly"
				case oldLscMessages = "OldLscMessages"
				case operationFinished = "OperationFinished"
				case orbitalAttacked = "OrbitalAttacked"
				case orbitalReinforced = "OrbitalReinforced"
				case ownershipTransferred = "OwnershipTransferred"
				case reimbursementMsg = "ReimbursementMsg"
				case researchMissionAvailableMsg = "ResearchMissionAvailableMsg"
				case retractsWar = "RetractsWar"
				case seasonalChallengeCompleted = "SeasonalChallengeCompleted"
				case sovAllClaimAquiredMsg = "SovAllClaimAquiredMsg"
				case sovAllClaimLostMsg = "SovAllClaimLostMsg"
				case sovCommandNodeEventStarted = "SovCommandNodeEventStarted"
				case sovCorpBillLateMsg = "SovCorpBillLateMsg"
				case sovCorpClaimFailMsg = "SovCorpClaimFailMsg"
				case sovDisruptorMsg = "SovDisruptorMsg"
				case sovStationEnteredFreeport = "SovStationEnteredFreeport"
				case sovStructureDestroyed = "SovStructureDestroyed"
				case sovStructureReinforced = "SovStructureReinforced"
				case sovStructureSelfDestructCancel = "SovStructureSelfDestructCancel"
				case sovStructureSelfDestructFinished = "SovStructureSelfDestructFinished"
				case sovStructureSelfDestructRequested = "SovStructureSelfDestructRequested"
				case sovereigntyIHDamageMsg = "SovereigntyIHDamageMsg"
				case sovereigntySBUDamageMsg = "SovereigntySBUDamageMsg"
				case sovereigntyTCUDamageMsg = "SovereigntyTCUDamageMsg"
				case stationAggressionMsg1 = "StationAggressionMsg1"
				case stationAggressionMsg2 = "StationAggressionMsg2"
				case stationConquerMsg = "StationConquerMsg"
				case stationServiceDisabled = "StationServiceDisabled"
				case stationServiceEnabled = "StationServiceEnabled"
				case stationStateChangeMsg = "StationStateChangeMsg"
				case storyLineMissionAvailableMsg = "StoryLineMissionAvailableMsg"
				case structureAnchoring = "StructureAnchoring"
				case structureCourierContractChanged = "StructureCourierContractChanged"
				case structureDestroyed = "StructureDestroyed"
				case structureFuelAlert = "StructureFuelAlert"
				case structureItemsDelivered = "StructureItemsDelivered"
				case structureLostArmor = "StructureLostArmor"
				case structureLostShields = "StructureLostShields"
				case structureOnline = "StructureOnline"
				case structureServicesOffline = "StructureServicesOffline"
				case structureUnanchoring = "StructureUnanchoring"
				case structureUnderAttack = "StructureUnderAttack"
				case towerAlertMsg = "TowerAlertMsg"
				case towerResourceAlertMsg = "TowerResourceAlertMsg"
				case transactionReversalMsg = "TransactionReversalMsg"
				case tutorialMsg = "TutorialMsg"
				case warAllyOfferDeclinedMsg = "WarAllyOfferDeclinedMsg"
				case warSurrenderDeclinedMsg = "WarSurrenderDeclinedMsg"
				case warSurrenderOfferMsg = "WarSurrenderOfferMsg"
				case notificationTypeMoonminingExtractionStarted = "notificationTypeMoonminingExtractionStarted"
				
				public init() {
					self = .acceptedAlly
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCharactersCharacterIDNotificationsType(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var isRead: Bool? = nil
			public var notificationID: Int64 = Int64()
			public var senderID: Int = Int()
			public var senderType: Character.GetCharactersCharacterIDNotificationsOk.GetCharactersCharacterIDNotificationsSenderType = Character.GetCharactersCharacterIDNotificationsOk.GetCharactersCharacterIDNotificationsSenderType()
			public var text: String? = nil
			public var timestamp: Date = Date()
			public var type: Character.GetCharactersCharacterIDNotificationsOk.GetCharactersCharacterIDNotificationsType = Character.GetCharactersCharacterIDNotificationsOk.GetCharactersCharacterIDNotificationsType()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				isRead = dictionary["is_read"] as? Bool
				guard let notificationID = dictionary["notification_id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.notificationID = notificationID
				guard let senderID = dictionary["sender_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.senderID = senderID
				guard let senderType = Character.GetCharactersCharacterIDNotificationsOk.GetCharactersCharacterIDNotificationsSenderType(rawValue: dictionary["sender_type"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.senderType = senderType
				text = dictionary["text"] as? String
				guard let timestamp = DateFormatter.esiDateTimeFormatter.date(from: dictionary["timestamp"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.timestamp = timestamp
				guard let type = Character.GetCharactersCharacterIDNotificationsOk.GetCharactersCharacterIDNotificationsType(rawValue: dictionary["type"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.type = type
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				isRead = aDecoder.containsValue(forKey: "is_read") ? aDecoder.decodeBool(forKey: "is_read") : nil
				notificationID = aDecoder.decodeInt64(forKey: "notification_id")
				senderID = aDecoder.decodeInteger(forKey: "sender_id")
				senderType = Character.GetCharactersCharacterIDNotificationsOk.GetCharactersCharacterIDNotificationsSenderType(rawValue: aDecoder.decodeObject(forKey: "sender_type") as? String ?? "") ?? Character.GetCharactersCharacterIDNotificationsOk.GetCharactersCharacterIDNotificationsSenderType()
				text = aDecoder.decodeObject(forKey: "text") as? String
				timestamp = aDecoder.decodeObject(forKey: "timestamp") as? Date ?? Date()
				type = Character.GetCharactersCharacterIDNotificationsOk.GetCharactersCharacterIDNotificationsType(rawValue: aDecoder.decodeObject(forKey: "type") as? String ?? "") ?? Character.GetCharactersCharacterIDNotificationsOk.GetCharactersCharacterIDNotificationsType()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = isRead {
					aCoder.encode(v, forKey: "is_read")
				}
				aCoder.encode(notificationID, forKey: "notification_id")
				aCoder.encode(senderID, forKey: "sender_id")
				aCoder.encode(senderType.rawValue, forKey: "sender_type")
				if let v = text {
					aCoder.encode(v, forKey: "text")
				}
				aCoder.encode(timestamp, forKey: "timestamp")
				aCoder.encode(type.rawValue, forKey: "type")
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = isRead?.json {
					json["is_read"] = v
				}
				json["notification_id"] = notificationID.json
				json["sender_id"] = senderID.json
				json["sender_type"] = senderType.json
				if let v = text?.json {
					json["text"] = v
				}
				json["timestamp"] = timestamp.json
				json["type"] = type.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.isRead?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.notificationID.hashValue)
				hashCombine(seed: &hash, value: self.senderID.hashValue)
				hashCombine(seed: &hash, value: self.senderType.hashValue)
				hashCombine(seed: &hash, value: self.text?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.timestamp.hashValue)
				hashCombine(seed: &hash, value: self.type.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Character.GetCharactersCharacterIDNotificationsOk, rhs: Character.GetCharactersCharacterIDNotificationsOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Character.GetCharactersCharacterIDNotificationsOk) {
				isRead = other.isRead
				notificationID = other.notificationID
				senderID = other.senderID
				senderType = other.senderType
				text = other.text
				timestamp = other.timestamp
				type = other.type
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Character.GetCharactersCharacterIDNotificationsOk(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCharactersCharacterIDNotificationsOk)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESICharacterAffiliation) public class Affiliation: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var allianceID: Int? = nil
			public var characterID: Int = Int()
			public var corporationID: Int = Int()
			public var factionID: Int? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				allianceID = dictionary["alliance_id"] as? Int
				guard let characterID = dictionary["character_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.characterID = characterID
				guard let corporationID = dictionary["corporation_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.corporationID = corporationID
				factionID = dictionary["faction_id"] as? Int
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
		
		
		@objc(ESICharacterBlueprint) public class Blueprint: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
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
					guard let s = json as? String, let v = GetCharactersCharacterIDBlueprintsLocationFlag(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
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
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let itemID = dictionary["item_id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.itemID = itemID
				guard let locationFlag = Character.Blueprint.GetCharactersCharacterIDBlueprintsLocationFlag(rawValue: dictionary["location_flag"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.locationFlag = locationFlag
				guard let locationID = dictionary["location_id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.locationID = locationID
				guard let materialEfficiency = dictionary["material_efficiency"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.materialEfficiency = materialEfficiency
				guard let quantity = dictionary["quantity"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.quantity = quantity
				guard let runs = dictionary["runs"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.runs = runs
				guard let timeEfficiency = dictionary["time_efficiency"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.timeEfficiency = timeEfficiency
				guard let typeID = dictionary["type_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.typeID = typeID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
