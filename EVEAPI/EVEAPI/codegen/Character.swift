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
		
		@discardableResult
		public func yearlyAggregateStats(characterID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<[Character.GetCharactersCharacterIDStatsOk]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Character.GetCharactersCharacterIDStatsOk]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-characterstats.read.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v2/characters/\(characterID)/stats/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Character.GetCharactersCharacterIDStatsOk]>) in
					promise.set(result: response.result, cached: 86400.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCharacterPortraits(characterID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<Character.Portrait>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<Character.Portrait>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v2/characters/\(characterID)/portrait/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Character.Portrait>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getJumpFatigue(characterID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<Character.Fatigue>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<Character.Fatigue>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-characters.read_fatigue.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/fatigue/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Character.Fatigue>) in
					promise.set(result: response.result, cached: 300.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCharacterCorporationRoles(characterID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<Character.Role>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<Character.Role>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-characters.read_corporation_roles.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v2/characters/\(characterID)/roles/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Character.Role>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCharactersPublicInformation(characterID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<Character.Information>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<Character.Information>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v4/characters/\(characterID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Character.Information>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCorporationHistory(characterID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<[Character.CorporationHistory]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Character.CorporationHistory]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/corporationhistory/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Character.CorporationHistory]>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func calculateCSPAChargeCost(characterID: Int, characters: [Int]) -> Future<ESI.Result<Float>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<Float>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-characters.read_contacts.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body = try? JSONEncoder().encode(characters)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v4/characters/\(characterID)/cspa/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Float>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCharacterCorporationTitles(characterID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<[Character.GetCharactersCharacterIDTitlesOk]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Character.GetCharactersCharacterIDTitlesOk]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-characters.read_titles.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/titles/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Character.GetCharactersCharacterIDTitlesOk]>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCharacterNames(characterIds: [Int64], ifNoneMatch: String? = nil) -> Future<ESI.Result<[Character.Name]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Character.Name]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			if let v = characterIds.httpQuery {
				query.append(URLQueryItem(name: "character_ids", value: v))
			}
			
			let url = session!.baseURL + "/v1/characters/names/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Character.Name]>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getNewContactNotifications(characterID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<[Character.GetCharactersCharacterIDNotificationsContactsOk]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Character.GetCharactersCharacterIDNotificationsContactsOk]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-characters.read_notifications.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/notifications/contacts/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Character.GetCharactersCharacterIDNotificationsContactsOk]>) in
					promise.set(result: response.result, cached: 600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getStandings(characterID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<[Character.Standing]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Character.Standing]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-characters.read_standings.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/standings/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Character.Standing]>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCharacterNotifications(characterID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<[Character.GetCharactersCharacterIDNotificationsOk]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Character.GetCharactersCharacterIDNotificationsOk]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-characters.read_notifications.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v2/characters/\(characterID)/notifications/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Character.GetCharactersCharacterIDNotificationsOk]>) in
					promise.set(result: response.result, cached: 600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getAgentsResearch(characterID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<[Character.Research]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Character.Research]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-characters.read_agents_research.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/agents_research/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Character.Research]>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getMedals(characterID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<[Character.Medal]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Character.Medal]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-characters.read_medals.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/medals/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Character.Medal]>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getBlueprints(characterID: Int, ifNoneMatch: String? = nil, page: Int? = nil) -> Future<ESI.Result<[Character.Blueprint]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Character.Blueprint]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-characters.read_blueprints.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v2/characters/\(characterID)/blueprints/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Character.Blueprint]>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func characterAffiliation(characters: [Int], ifNoneMatch: String? = nil) -> Future<ESI.Result<[Character.Affiliation]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Character.Affiliation]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			
			let body = try? JSONEncoder().encode(characters)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/characters/affiliation/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Character.Affiliation]>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		
		public struct Portrait: Codable, Hashable {
			
			
			public var px128x128: String?
			public var px256x256: String?
			public var px512x512: String?
			public var px64x64: String?
			
			public init(px128x128: String?, px256x256: String?, px512x512: String?, px64x64: String?) {
				self.px128x128 = px128x128
				self.px256x256 = px256x256
				self.px512x512 = px512x512
				self.px64x64 = px64x64
			}
			
			public var hashValue: Int {
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
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case px128x128
				case px256x256
				case px512x512
				case px64x64
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCharactersCharacterIDNotificationsContactsOk: Codable, Hashable {
			
			
			public var message: String
			public var notificationID: Int
			public var sendDate: Date
			public var senderCharacterID: Int
			public var standingLevel: Float
			
			public init(message: String, notificationID: Int, sendDate: Date, senderCharacterID: Int, standingLevel: Float) {
				self.message = message
				self.notificationID = notificationID
				self.sendDate = sendDate
				self.senderCharacterID = senderCharacterID
				self.standingLevel = standingLevel
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: message.hashValue)
				hashCombine(seed: &hash, value: notificationID.hashValue)
				hashCombine(seed: &hash, value: sendDate.hashValue)
				hashCombine(seed: &hash, value: senderCharacterID.hashValue)
				hashCombine(seed: &hash, value: standingLevel.hashValue)
				return hash
			}
			
			public static func ==(lhs: Character.GetCharactersCharacterIDNotificationsContactsOk, rhs: Character.GetCharactersCharacterIDNotificationsContactsOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case message
				case notificationID = "notification_id"
				case sendDate = "send_date"
				case senderCharacterID = "sender_character_id"
				case standingLevel = "standing_level"
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .sendDate: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct Fatigue: Codable, Hashable {
			
			
			public var jumpFatigueExpireDate: Date?
			public var lastJumpDate: Date?
			public var lastUpdateDate: Date?
			
			public init(jumpFatigueExpireDate: Date?, lastJumpDate: Date?, lastUpdateDate: Date?) {
				self.jumpFatigueExpireDate = jumpFatigueExpireDate
				self.lastJumpDate = lastJumpDate
				self.lastUpdateDate = lastUpdateDate
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: jumpFatigueExpireDate?.hashValue ?? 0)
				hashCombine(seed: &hash, value: lastJumpDate?.hashValue ?? 0)
				hashCombine(seed: &hash, value: lastUpdateDate?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Character.Fatigue, rhs: Character.Fatigue) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case jumpFatigueExpireDate = "jump_fatigue_expire_date"
				case lastJumpDate = "last_jump_date"
				case lastUpdateDate = "last_update_date"
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .jumpFatigueExpireDate: return DateFormatter.esiDateTimeFormatter
						case .lastJumpDate: return DateFormatter.esiDateTimeFormatter
						case .lastUpdateDate: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCharactersCharacterIDNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Character.GetCharactersCharacterIDNotFound, rhs: Character.GetCharactersCharacterIDNotFound) -> Bool {
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
		
		
		public struct Standing: Codable, Hashable {
			
			public enum GetCharactersCharacterIDStandingsFromType: String, Codable, HTTPQueryable {
				case agent = "agent"
				case faction = "faction"
				case npcCorp = "npc_corp"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var fromID: Int
			public var fromType: Character.Standing.GetCharactersCharacterIDStandingsFromType
			public var standing: Float
			
			public init(fromID: Int, fromType: Character.Standing.GetCharactersCharacterIDStandingsFromType, standing: Float) {
				self.fromID = fromID
				self.fromType = fromType
				self.standing = standing
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: fromID.hashValue)
				hashCombine(seed: &hash, value: fromType.hashValue)
				hashCombine(seed: &hash, value: standing.hashValue)
				return hash
			}
			
			public static func ==(lhs: Character.Standing, rhs: Character.Standing) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case fromID = "from_id"
				case fromType = "from_type"
				case standing
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCharactersCharacterIDTitlesOk: Codable, Hashable {
			
			
			public var name: String?
			public var titleID: Int?
			
			public init(name: String?, titleID: Int?) {
				self.name = name
				self.titleID = titleID
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: name?.hashValue ?? 0)
				hashCombine(seed: &hash, value: titleID?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Character.GetCharactersCharacterIDTitlesOk, rhs: Character.GetCharactersCharacterIDTitlesOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case name
				case titleID = "title_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct Information: Codable, Hashable {
			
			public enum GetCharactersCharacterIDGender: String, Codable, HTTPQueryable {
				case female = "female"
				case male = "male"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var allianceID: Int?
			public var ancestryID: Int?
			public var birthday: Date
			public var bloodlineID: Int
			public var corporationID: Int
			public var localizedDescription: String?
			public var factionID: Int?
			public var gender: Character.Information.GetCharactersCharacterIDGender
			public var name: String
			public var raceID: Int
			public var securityStatus: Float?
			
			public init(allianceID: Int?, ancestryID: Int?, birthday: Date, bloodlineID: Int, corporationID: Int, localizedDescription: String?, factionID: Int?, gender: Character.Information.GetCharactersCharacterIDGender, name: String, raceID: Int, securityStatus: Float?) {
				self.allianceID = allianceID
				self.ancestryID = ancestryID
				self.birthday = birthday
				self.bloodlineID = bloodlineID
				self.corporationID = corporationID
				self.localizedDescription = localizedDescription
				self.factionID = factionID
				self.gender = gender
				self.name = name
				self.raceID = raceID
				self.securityStatus = securityStatus
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: allianceID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: ancestryID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: birthday.hashValue)
				hashCombine(seed: &hash, value: bloodlineID.hashValue)
				hashCombine(seed: &hash, value: corporationID.hashValue)
				hashCombine(seed: &hash, value: localizedDescription?.hashValue ?? 0)
				hashCombine(seed: &hash, value: factionID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: gender.hashValue)
				hashCombine(seed: &hash, value: name.hashValue)
				hashCombine(seed: &hash, value: raceID.hashValue)
				hashCombine(seed: &hash, value: securityStatus?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Character.Information, rhs: Character.Information) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case allianceID = "alliance_id"
				case ancestryID = "ancestry_id"
				case birthday
				case bloodlineID = "bloodline_id"
				case corporationID = "corporation_id"
				case localizedDescription = "description"
				case factionID = "faction_id"
				case gender
				case name
				case raceID = "race_id"
				case securityStatus = "security_status"
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .birthday: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCharactersCharacterIDPortraitNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Character.GetCharactersCharacterIDPortraitNotFound, rhs: Character.GetCharactersCharacterIDPortraitNotFound) -> Bool {
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
		
		
		public struct Research: Codable, Hashable {
			
			
			public var agentID: Int
			public var pointsPerDay: Float
			public var remainderPoints: Float
			public var skillTypeID: Int
			public var startedAt: Date
			
			public init(agentID: Int, pointsPerDay: Float, remainderPoints: Float, skillTypeID: Int, startedAt: Date) {
				self.agentID = agentID
				self.pointsPerDay = pointsPerDay
				self.remainderPoints = remainderPoints
				self.skillTypeID = skillTypeID
				self.startedAt = startedAt
			}
			
			public var hashValue: Int {
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
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case agentID = "agent_id"
				case pointsPerDay = "points_per_day"
				case remainderPoints = "remainder_points"
				case skillTypeID = "skill_type_id"
				case startedAt = "started_at"
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .startedAt: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct Medal: Codable, Hashable {
			
			public enum GetCharactersCharacterIDMedalsStatus: String, Codable, HTTPQueryable {
				case `private` = "private"
				case `public` = "public"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public struct GetCharactersCharacterIDMedalsGraphics: Codable, Hashable {
				
				
				public var color: Int?
				public var graphic: String
				public var layer: Int
				public var part: Int
				
				public init(color: Int?, graphic: String, layer: Int, part: Int) {
					self.color = color
					self.graphic = graphic
					self.layer = layer
					self.part = part
				}
				
				public var hashValue: Int {
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
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case color
					case graphic
					case layer
					case part
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public var corporationID: Int
			public var date: Date
			public var localizedDescription: String
			public var graphics: [Character.Medal.GetCharactersCharacterIDMedalsGraphics]
			public var issuerID: Int
			public var medalID: Int
			public var reason: String
			public var status: Character.Medal.GetCharactersCharacterIDMedalsStatus
			public var title: String
			
			public init(corporationID: Int, date: Date, localizedDescription: String, graphics: [Character.Medal.GetCharactersCharacterIDMedalsGraphics], issuerID: Int, medalID: Int, reason: String, status: Character.Medal.GetCharactersCharacterIDMedalsStatus, title: String) {
				self.corporationID = corporationID
				self.date = date
				self.localizedDescription = localizedDescription
				self.graphics = graphics
				self.issuerID = issuerID
				self.medalID = medalID
				self.reason = reason
				self.status = status
				self.title = title
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: corporationID.hashValue)
				hashCombine(seed: &hash, value: date.hashValue)
				hashCombine(seed: &hash, value: localizedDescription.hashValue)
				self.graphics.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
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
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case corporationID = "corporation_id"
				case date
				case localizedDescription = "description"
				case graphics
				case issuerID = "issuer_id"
				case medalID = "medal_id"
				case reason
				case status
				case title
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .date: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct PostCharactersAffiliationNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Character.PostCharactersAffiliationNotFound, rhs: Character.PostCharactersAffiliationNotFound) -> Bool {
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
		
		
		public struct CorporationHistory: Codable, Hashable {
			
			
			public var corporationID: Int
			public var isDeleted: Bool?
			public var recordID: Int
			public var startDate: Date
			
			public init(corporationID: Int, isDeleted: Bool?, recordID: Int, startDate: Date) {
				self.corporationID = corporationID
				self.isDeleted = isDeleted
				self.recordID = recordID
				self.startDate = startDate
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: corporationID.hashValue)
				hashCombine(seed: &hash, value: isDeleted?.hashValue ?? 0)
				hashCombine(seed: &hash, value: recordID.hashValue)
				hashCombine(seed: &hash, value: startDate.hashValue)
				return hash
			}
			
			public static func ==(lhs: Character.CorporationHistory, rhs: Character.CorporationHistory) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case corporationID = "corporation_id"
				case isDeleted = "is_deleted"
				case recordID = "record_id"
				case startDate = "start_date"
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .startDate: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct Name: Codable, Hashable {
			
			
			public var characterID: Int64
			public var characterName: String
			
			public init(characterID: Int64, characterName: String) {
				self.characterID = characterID
				self.characterName = characterName
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: characterID.hashValue)
				hashCombine(seed: &hash, value: characterName.hashValue)
				return hash
			}
			
			public static func ==(lhs: Character.Name, rhs: Character.Name) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case characterID = "character_id"
				case characterName = "character_name"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCharactersCharacterIDStatsOk: Codable, Hashable {
			
			public struct GetCharactersCharacterIDStatsPve: Codable, Hashable {
				
				
				public var dungeonsCompletedAgent: Int64?
				public var dungeonsCompletedDistribution: Int64?
				public var missionsSucceeded: Int64?
				public var missionsSucceededEpicArc: Int64?
				
				public init(dungeonsCompletedAgent: Int64?, dungeonsCompletedDistribution: Int64?, missionsSucceeded: Int64?, missionsSucceededEpicArc: Int64?) {
					self.dungeonsCompletedAgent = dungeonsCompletedAgent
					self.dungeonsCompletedDistribution = dungeonsCompletedDistribution
					self.missionsSucceeded = missionsSucceeded
					self.missionsSucceededEpicArc = missionsSucceededEpicArc
				}
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: dungeonsCompletedAgent?.hashValue ?? 0)
					hashCombine(seed: &hash, value: dungeonsCompletedDistribution?.hashValue ?? 0)
					hashCombine(seed: &hash, value: missionsSucceeded?.hashValue ?? 0)
					hashCombine(seed: &hash, value: missionsSucceededEpicArc?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsPve, rhs: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsPve) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case dungeonsCompletedAgent = "dungeons_completed_agent"
					case dungeonsCompletedDistribution = "dungeons_completed_distribution"
					case missionsSucceeded = "missions_succeeded"
					case missionsSucceededEpicArc = "missions_succeeded_epic_arc"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct GetCharactersCharacterIDStatsInventory: Codable, Hashable {
				
				
				public var abandonLootQuantity: Int64?
				public var trashItemQuantity: Int64?
				
				public init(abandonLootQuantity: Int64?, trashItemQuantity: Int64?) {
					self.abandonLootQuantity = abandonLootQuantity
					self.trashItemQuantity = trashItemQuantity
				}
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: abandonLootQuantity?.hashValue ?? 0)
					hashCombine(seed: &hash, value: trashItemQuantity?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsInventory, rhs: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsInventory) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case abandonLootQuantity = "abandon_loot_quantity"
					case trashItemQuantity = "trash_item_quantity"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct GetCharactersCharacterIDStatsCharacter: Codable, Hashable {
				
				
				public var daysOfActivity: Int64?
				public var minutes: Int64?
				public var sessionsStarted: Int64?
				
				public init(daysOfActivity: Int64?, minutes: Int64?, sessionsStarted: Int64?) {
					self.daysOfActivity = daysOfActivity
					self.minutes = minutes
					self.sessionsStarted = sessionsStarted
				}
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: daysOfActivity?.hashValue ?? 0)
					hashCombine(seed: &hash, value: minutes?.hashValue ?? 0)
					hashCombine(seed: &hash, value: sessionsStarted?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsCharacter, rhs: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsCharacter) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case daysOfActivity = "days_of_activity"
					case minutes
					case sessionsStarted = "sessions_started"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct GetCharactersCharacterIDStatsMining: Codable, Hashable {
				
				
				public var droneMine: Int64?
				public var oreArkonor: Int64?
				public var oreBistot: Int64?
				public var oreCrokite: Int64?
				public var oreDarkOchre: Int64?
				public var oreGneiss: Int64?
				public var oreHarvestableCloud: Int64?
				public var oreHedbergite: Int64?
				public var oreHemorphite: Int64?
				public var oreIce: Int64?
				public var oreJaspet: Int64?
				public var oreKernite: Int64?
				public var oreMercoxit: Int64?
				public var oreOmber: Int64?
				public var orePlagioclase: Int64?
				public var orePyroxeres: Int64?
				public var oreScordite: Int64?
				public var oreSpodumain: Int64?
				public var oreVeldspar: Int64?
				
				public init(droneMine: Int64?, oreArkonor: Int64?, oreBistot: Int64?, oreCrokite: Int64?, oreDarkOchre: Int64?, oreGneiss: Int64?, oreHarvestableCloud: Int64?, oreHedbergite: Int64?, oreHemorphite: Int64?, oreIce: Int64?, oreJaspet: Int64?, oreKernite: Int64?, oreMercoxit: Int64?, oreOmber: Int64?, orePlagioclase: Int64?, orePyroxeres: Int64?, oreScordite: Int64?, oreSpodumain: Int64?, oreVeldspar: Int64?) {
					self.droneMine = droneMine
					self.oreArkonor = oreArkonor
					self.oreBistot = oreBistot
					self.oreCrokite = oreCrokite
					self.oreDarkOchre = oreDarkOchre
					self.oreGneiss = oreGneiss
					self.oreHarvestableCloud = oreHarvestableCloud
					self.oreHedbergite = oreHedbergite
					self.oreHemorphite = oreHemorphite
					self.oreIce = oreIce
					self.oreJaspet = oreJaspet
					self.oreKernite = oreKernite
					self.oreMercoxit = oreMercoxit
					self.oreOmber = oreOmber
					self.orePlagioclase = orePlagioclase
					self.orePyroxeres = orePyroxeres
					self.oreScordite = oreScordite
					self.oreSpodumain = oreSpodumain
					self.oreVeldspar = oreVeldspar
				}
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: droneMine?.hashValue ?? 0)
					hashCombine(seed: &hash, value: oreArkonor?.hashValue ?? 0)
					hashCombine(seed: &hash, value: oreBistot?.hashValue ?? 0)
					hashCombine(seed: &hash, value: oreCrokite?.hashValue ?? 0)
					hashCombine(seed: &hash, value: oreDarkOchre?.hashValue ?? 0)
					hashCombine(seed: &hash, value: oreGneiss?.hashValue ?? 0)
					hashCombine(seed: &hash, value: oreHarvestableCloud?.hashValue ?? 0)
					hashCombine(seed: &hash, value: oreHedbergite?.hashValue ?? 0)
					hashCombine(seed: &hash, value: oreHemorphite?.hashValue ?? 0)
					hashCombine(seed: &hash, value: oreIce?.hashValue ?? 0)
					hashCombine(seed: &hash, value: oreJaspet?.hashValue ?? 0)
					hashCombine(seed: &hash, value: oreKernite?.hashValue ?? 0)
					hashCombine(seed: &hash, value: oreMercoxit?.hashValue ?? 0)
					hashCombine(seed: &hash, value: oreOmber?.hashValue ?? 0)
					hashCombine(seed: &hash, value: orePlagioclase?.hashValue ?? 0)
					hashCombine(seed: &hash, value: orePyroxeres?.hashValue ?? 0)
					hashCombine(seed: &hash, value: oreScordite?.hashValue ?? 0)
					hashCombine(seed: &hash, value: oreSpodumain?.hashValue ?? 0)
					hashCombine(seed: &hash, value: oreVeldspar?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsMining, rhs: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsMining) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case droneMine = "drone_mine"
					case oreArkonor = "ore_arkonor"
					case oreBistot = "ore_bistot"
					case oreCrokite = "ore_crokite"
					case oreDarkOchre = "ore_dark_ochre"
					case oreGneiss = "ore_gneiss"
					case oreHarvestableCloud = "ore_harvestable_cloud"
					case oreHedbergite = "ore_hedbergite"
					case oreHemorphite = "ore_hemorphite"
					case oreIce = "ore_ice"
					case oreJaspet = "ore_jaspet"
					case oreKernite = "ore_kernite"
					case oreMercoxit = "ore_mercoxit"
					case oreOmber = "ore_omber"
					case orePlagioclase = "ore_plagioclase"
					case orePyroxeres = "ore_pyroxeres"
					case oreScordite = "ore_scordite"
					case oreSpodumain = "ore_spodumain"
					case oreVeldspar = "ore_veldspar"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct GetCharactersCharacterIDStatsCombat: Codable, Hashable {
				
				
				public var capDrainedbyNpc: Int64?
				public var capDrainedbyPc: Int64?
				public var capDrainingPc: Int64?
				public var criminalFlagSet: Int64?
				public var damageFromNpCsAmount: Int64?
				public var damageFromNpCsNumShots: Int64?
				public var damageFromPlayersBombAmount: Int64?
				public var damageFromPlayersBombNumShots: Int64?
				public var damageFromPlayersCombatDroneAmount: Int64?
				public var damageFromPlayersCombatDroneNumShots: Int64?
				public var damageFromPlayersEnergyAmount: Int64?
				public var damageFromPlayersEnergyNumShots: Int64?
				public var damageFromPlayersFighterBomberAmount: Int64?
				public var damageFromPlayersFighterBomberNumShots: Int64?
				public var damageFromPlayersFighterDroneAmount: Int64?
				public var damageFromPlayersFighterDroneNumShots: Int64?
				public var damageFromPlayersHybridAmount: Int64?
				public var damageFromPlayersHybridNumShots: Int64?
				public var damageFromPlayersMissileAmount: Int64?
				public var damageFromPlayersMissileNumShots: Int64?
				public var damageFromPlayersProjectileAmount: Int64?
				public var damageFromPlayersProjectileNumShots: Int64?
				public var damageFromPlayersSmartBombAmount: Int64?
				public var damageFromPlayersSmartBombNumShots: Int64?
				public var damageFromPlayersSuperAmount: Int64?
				public var damageFromPlayersSuperNumShots: Int64?
				public var damageFromStructuresTotalAmount: Int64?
				public var damageFromStructuresTotalNumShots: Int64?
				public var damageToPlayersBombAmount: Int64?
				public var damageToPlayersBombNumShots: Int64?
				public var damageToPlayersCombatDroneAmount: Int64?
				public var damageToPlayersCombatDroneNumShots: Int64?
				public var damageToPlayersEnergyAmount: Int64?
				public var damageToPlayersEnergyNumShots: Int64?
				public var damageToPlayersFighterBomberAmount: Int64?
				public var damageToPlayersFighterBomberNumShots: Int64?
				public var damageToPlayersFighterDroneAmount: Int64?
				public var damageToPlayersFighterDroneNumShots: Int64?
				public var damageToPlayersHybridAmount: Int64?
				public var damageToPlayersHybridNumShots: Int64?
				public var damageToPlayersMissileAmount: Int64?
				public var damageToPlayersMissileNumShots: Int64?
				public var damageToPlayersProjectileAmount: Int64?
				public var damageToPlayersProjectileNumShots: Int64?
				public var damageToPlayersSmartBombAmount: Int64?
				public var damageToPlayersSmartBombNumShots: Int64?
				public var damageToPlayersSuperAmount: Int64?
				public var damageToPlayersSuperNumShots: Int64?
				public var damageToStructuresTotalAmount: Int64?
				public var damageToStructuresTotalNumShots: Int64?
				public var deathsHighSec: Int64?
				public var deathsLowSec: Int64?
				public var deathsNullSec: Int64?
				public var deathsPodHighSec: Int64?
				public var deathsPodLowSec: Int64?
				public var deathsPodNullSec: Int64?
				public var deathsPodWormhole: Int64?
				public var deathsWormhole: Int64?
				public var droneEngage: Int64?
				public var dscans: Int64?
				public var duelRequested: Int64?
				public var engagementRegister: Int64?
				public var killsAssists: Int64?
				public var killsHighSec: Int64?
				public var killsLowSec: Int64?
				public var killsNullSec: Int64?
				public var killsPodHighSec: Int64?
				public var killsPodLowSec: Int64?
				public var killsPodNullSec: Int64?
				public var killsPodWormhole: Int64?
				public var killsWormhole: Int64?
				public var npcFlagSet: Int64?
				public var probeScans: Int64?
				public var pvpFlagSet: Int64?
				public var repairArmorByRemoteAmount: Int64?
				public var repairArmorRemoteAmount: Int64?
				public var repairArmorSelfAmount: Int64?
				public var repairCapacitorByRemoteAmount: Int64?
				public var repairCapacitorRemoteAmount: Int64?
				public var repairCapacitorSelfAmount: Int64?
				public var repairHullByRemoteAmount: Int64?
				public var repairHullRemoteAmount: Int64?
				public var repairHullSelfAmount: Int64?
				public var repairShieldByRemoteAmount: Int64?
				public var repairShieldRemoteAmount: Int64?
				public var repairShieldSelfAmount: Int64?
				public var selfDestructs: Int64?
				public var warpScramblePc: Int64?
				public var warpScrambledbyNpc: Int64?
				public var warpScrambledbyPc: Int64?
				public var weaponFlagSet: Int64?
				public var webifiedbyNpc: Int64?
				public var webifiedbyPc: Int64?
				public var webifyingPc: Int64?
				
				public init(capDrainedbyNpc: Int64?, capDrainedbyPc: Int64?, capDrainingPc: Int64?, criminalFlagSet: Int64?, damageFromNpCsAmount: Int64?, damageFromNpCsNumShots: Int64?, damageFromPlayersBombAmount: Int64?, damageFromPlayersBombNumShots: Int64?, damageFromPlayersCombatDroneAmount: Int64?, damageFromPlayersCombatDroneNumShots: Int64?, damageFromPlayersEnergyAmount: Int64?, damageFromPlayersEnergyNumShots: Int64?, damageFromPlayersFighterBomberAmount: Int64?, damageFromPlayersFighterBomberNumShots: Int64?, damageFromPlayersFighterDroneAmount: Int64?, damageFromPlayersFighterDroneNumShots: Int64?, damageFromPlayersHybridAmount: Int64?, damageFromPlayersHybridNumShots: Int64?, damageFromPlayersMissileAmount: Int64?, damageFromPlayersMissileNumShots: Int64?, damageFromPlayersProjectileAmount: Int64?, damageFromPlayersProjectileNumShots: Int64?, damageFromPlayersSmartBombAmount: Int64?, damageFromPlayersSmartBombNumShots: Int64?, damageFromPlayersSuperAmount: Int64?, damageFromPlayersSuperNumShots: Int64?, damageFromStructuresTotalAmount: Int64?, damageFromStructuresTotalNumShots: Int64?, damageToPlayersBombAmount: Int64?, damageToPlayersBombNumShots: Int64?, damageToPlayersCombatDroneAmount: Int64?, damageToPlayersCombatDroneNumShots: Int64?, damageToPlayersEnergyAmount: Int64?, damageToPlayersEnergyNumShots: Int64?, damageToPlayersFighterBomberAmount: Int64?, damageToPlayersFighterBomberNumShots: Int64?, damageToPlayersFighterDroneAmount: Int64?, damageToPlayersFighterDroneNumShots: Int64?, damageToPlayersHybridAmount: Int64?, damageToPlayersHybridNumShots: Int64?, damageToPlayersMissileAmount: Int64?, damageToPlayersMissileNumShots: Int64?, damageToPlayersProjectileAmount: Int64?, damageToPlayersProjectileNumShots: Int64?, damageToPlayersSmartBombAmount: Int64?, damageToPlayersSmartBombNumShots: Int64?, damageToPlayersSuperAmount: Int64?, damageToPlayersSuperNumShots: Int64?, damageToStructuresTotalAmount: Int64?, damageToStructuresTotalNumShots: Int64?, deathsHighSec: Int64?, deathsLowSec: Int64?, deathsNullSec: Int64?, deathsPodHighSec: Int64?, deathsPodLowSec: Int64?, deathsPodNullSec: Int64?, deathsPodWormhole: Int64?, deathsWormhole: Int64?, droneEngage: Int64?, dscans: Int64?, duelRequested: Int64?, engagementRegister: Int64?, killsAssists: Int64?, killsHighSec: Int64?, killsLowSec: Int64?, killsNullSec: Int64?, killsPodHighSec: Int64?, killsPodLowSec: Int64?, killsPodNullSec: Int64?, killsPodWormhole: Int64?, killsWormhole: Int64?, npcFlagSet: Int64?, probeScans: Int64?, pvpFlagSet: Int64?, repairArmorByRemoteAmount: Int64?, repairArmorRemoteAmount: Int64?, repairArmorSelfAmount: Int64?, repairCapacitorByRemoteAmount: Int64?, repairCapacitorRemoteAmount: Int64?, repairCapacitorSelfAmount: Int64?, repairHullByRemoteAmount: Int64?, repairHullRemoteAmount: Int64?, repairHullSelfAmount: Int64?, repairShieldByRemoteAmount: Int64?, repairShieldRemoteAmount: Int64?, repairShieldSelfAmount: Int64?, selfDestructs: Int64?, warpScramblePc: Int64?, warpScrambledbyNpc: Int64?, warpScrambledbyPc: Int64?, weaponFlagSet: Int64?, webifiedbyNpc: Int64?, webifiedbyPc: Int64?, webifyingPc: Int64?) {
					self.capDrainedbyNpc = capDrainedbyNpc
					self.capDrainedbyPc = capDrainedbyPc
					self.capDrainingPc = capDrainingPc
					self.criminalFlagSet = criminalFlagSet
					self.damageFromNpCsAmount = damageFromNpCsAmount
					self.damageFromNpCsNumShots = damageFromNpCsNumShots
					self.damageFromPlayersBombAmount = damageFromPlayersBombAmount
					self.damageFromPlayersBombNumShots = damageFromPlayersBombNumShots
					self.damageFromPlayersCombatDroneAmount = damageFromPlayersCombatDroneAmount
					self.damageFromPlayersCombatDroneNumShots = damageFromPlayersCombatDroneNumShots
					self.damageFromPlayersEnergyAmount = damageFromPlayersEnergyAmount
					self.damageFromPlayersEnergyNumShots = damageFromPlayersEnergyNumShots
					self.damageFromPlayersFighterBomberAmount = damageFromPlayersFighterBomberAmount
					self.damageFromPlayersFighterBomberNumShots = damageFromPlayersFighterBomberNumShots
					self.damageFromPlayersFighterDroneAmount = damageFromPlayersFighterDroneAmount
					self.damageFromPlayersFighterDroneNumShots = damageFromPlayersFighterDroneNumShots
					self.damageFromPlayersHybridAmount = damageFromPlayersHybridAmount
					self.damageFromPlayersHybridNumShots = damageFromPlayersHybridNumShots
					self.damageFromPlayersMissileAmount = damageFromPlayersMissileAmount
					self.damageFromPlayersMissileNumShots = damageFromPlayersMissileNumShots
					self.damageFromPlayersProjectileAmount = damageFromPlayersProjectileAmount
					self.damageFromPlayersProjectileNumShots = damageFromPlayersProjectileNumShots
					self.damageFromPlayersSmartBombAmount = damageFromPlayersSmartBombAmount
					self.damageFromPlayersSmartBombNumShots = damageFromPlayersSmartBombNumShots
					self.damageFromPlayersSuperAmount = damageFromPlayersSuperAmount
					self.damageFromPlayersSuperNumShots = damageFromPlayersSuperNumShots
					self.damageFromStructuresTotalAmount = damageFromStructuresTotalAmount
					self.damageFromStructuresTotalNumShots = damageFromStructuresTotalNumShots
					self.damageToPlayersBombAmount = damageToPlayersBombAmount
					self.damageToPlayersBombNumShots = damageToPlayersBombNumShots
					self.damageToPlayersCombatDroneAmount = damageToPlayersCombatDroneAmount
					self.damageToPlayersCombatDroneNumShots = damageToPlayersCombatDroneNumShots
					self.damageToPlayersEnergyAmount = damageToPlayersEnergyAmount
					self.damageToPlayersEnergyNumShots = damageToPlayersEnergyNumShots
					self.damageToPlayersFighterBomberAmount = damageToPlayersFighterBomberAmount
					self.damageToPlayersFighterBomberNumShots = damageToPlayersFighterBomberNumShots
					self.damageToPlayersFighterDroneAmount = damageToPlayersFighterDroneAmount
					self.damageToPlayersFighterDroneNumShots = damageToPlayersFighterDroneNumShots
					self.damageToPlayersHybridAmount = damageToPlayersHybridAmount
					self.damageToPlayersHybridNumShots = damageToPlayersHybridNumShots
					self.damageToPlayersMissileAmount = damageToPlayersMissileAmount
					self.damageToPlayersMissileNumShots = damageToPlayersMissileNumShots
					self.damageToPlayersProjectileAmount = damageToPlayersProjectileAmount
					self.damageToPlayersProjectileNumShots = damageToPlayersProjectileNumShots
					self.damageToPlayersSmartBombAmount = damageToPlayersSmartBombAmount
					self.damageToPlayersSmartBombNumShots = damageToPlayersSmartBombNumShots
					self.damageToPlayersSuperAmount = damageToPlayersSuperAmount
					self.damageToPlayersSuperNumShots = damageToPlayersSuperNumShots
					self.damageToStructuresTotalAmount = damageToStructuresTotalAmount
					self.damageToStructuresTotalNumShots = damageToStructuresTotalNumShots
					self.deathsHighSec = deathsHighSec
					self.deathsLowSec = deathsLowSec
					self.deathsNullSec = deathsNullSec
					self.deathsPodHighSec = deathsPodHighSec
					self.deathsPodLowSec = deathsPodLowSec
					self.deathsPodNullSec = deathsPodNullSec
					self.deathsPodWormhole = deathsPodWormhole
					self.deathsWormhole = deathsWormhole
					self.droneEngage = droneEngage
					self.dscans = dscans
					self.duelRequested = duelRequested
					self.engagementRegister = engagementRegister
					self.killsAssists = killsAssists
					self.killsHighSec = killsHighSec
					self.killsLowSec = killsLowSec
					self.killsNullSec = killsNullSec
					self.killsPodHighSec = killsPodHighSec
					self.killsPodLowSec = killsPodLowSec
					self.killsPodNullSec = killsPodNullSec
					self.killsPodWormhole = killsPodWormhole
					self.killsWormhole = killsWormhole
					self.npcFlagSet = npcFlagSet
					self.probeScans = probeScans
					self.pvpFlagSet = pvpFlagSet
					self.repairArmorByRemoteAmount = repairArmorByRemoteAmount
					self.repairArmorRemoteAmount = repairArmorRemoteAmount
					self.repairArmorSelfAmount = repairArmorSelfAmount
					self.repairCapacitorByRemoteAmount = repairCapacitorByRemoteAmount
					self.repairCapacitorRemoteAmount = repairCapacitorRemoteAmount
					self.repairCapacitorSelfAmount = repairCapacitorSelfAmount
					self.repairHullByRemoteAmount = repairHullByRemoteAmount
					self.repairHullRemoteAmount = repairHullRemoteAmount
					self.repairHullSelfAmount = repairHullSelfAmount
					self.repairShieldByRemoteAmount = repairShieldByRemoteAmount
					self.repairShieldRemoteAmount = repairShieldRemoteAmount
					self.repairShieldSelfAmount = repairShieldSelfAmount
					self.selfDestructs = selfDestructs
					self.warpScramblePc = warpScramblePc
					self.warpScrambledbyNpc = warpScrambledbyNpc
					self.warpScrambledbyPc = warpScrambledbyPc
					self.weaponFlagSet = weaponFlagSet
					self.webifiedbyNpc = webifiedbyNpc
					self.webifiedbyPc = webifiedbyPc
					self.webifyingPc = webifyingPc
				}
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: capDrainedbyNpc?.hashValue ?? 0)
					hashCombine(seed: &hash, value: capDrainedbyPc?.hashValue ?? 0)
					hashCombine(seed: &hash, value: capDrainingPc?.hashValue ?? 0)
					hashCombine(seed: &hash, value: criminalFlagSet?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageFromNpCsAmount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageFromNpCsNumShots?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageFromPlayersBombAmount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageFromPlayersBombNumShots?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageFromPlayersCombatDroneAmount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageFromPlayersCombatDroneNumShots?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageFromPlayersEnergyAmount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageFromPlayersEnergyNumShots?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageFromPlayersFighterBomberAmount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageFromPlayersFighterBomberNumShots?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageFromPlayersFighterDroneAmount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageFromPlayersFighterDroneNumShots?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageFromPlayersHybridAmount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageFromPlayersHybridNumShots?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageFromPlayersMissileAmount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageFromPlayersMissileNumShots?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageFromPlayersProjectileAmount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageFromPlayersProjectileNumShots?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageFromPlayersSmartBombAmount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageFromPlayersSmartBombNumShots?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageFromPlayersSuperAmount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageFromPlayersSuperNumShots?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageFromStructuresTotalAmount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageFromStructuresTotalNumShots?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageToPlayersBombAmount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageToPlayersBombNumShots?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageToPlayersCombatDroneAmount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageToPlayersCombatDroneNumShots?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageToPlayersEnergyAmount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageToPlayersEnergyNumShots?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageToPlayersFighterBomberAmount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageToPlayersFighterBomberNumShots?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageToPlayersFighterDroneAmount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageToPlayersFighterDroneNumShots?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageToPlayersHybridAmount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageToPlayersHybridNumShots?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageToPlayersMissileAmount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageToPlayersMissileNumShots?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageToPlayersProjectileAmount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageToPlayersProjectileNumShots?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageToPlayersSmartBombAmount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageToPlayersSmartBombNumShots?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageToPlayersSuperAmount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageToPlayersSuperNumShots?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageToStructuresTotalAmount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageToStructuresTotalNumShots?.hashValue ?? 0)
					hashCombine(seed: &hash, value: deathsHighSec?.hashValue ?? 0)
					hashCombine(seed: &hash, value: deathsLowSec?.hashValue ?? 0)
					hashCombine(seed: &hash, value: deathsNullSec?.hashValue ?? 0)
					hashCombine(seed: &hash, value: deathsPodHighSec?.hashValue ?? 0)
					hashCombine(seed: &hash, value: deathsPodLowSec?.hashValue ?? 0)
					hashCombine(seed: &hash, value: deathsPodNullSec?.hashValue ?? 0)
					hashCombine(seed: &hash, value: deathsPodWormhole?.hashValue ?? 0)
					hashCombine(seed: &hash, value: deathsWormhole?.hashValue ?? 0)
					hashCombine(seed: &hash, value: droneEngage?.hashValue ?? 0)
					hashCombine(seed: &hash, value: dscans?.hashValue ?? 0)
					hashCombine(seed: &hash, value: duelRequested?.hashValue ?? 0)
					hashCombine(seed: &hash, value: engagementRegister?.hashValue ?? 0)
					hashCombine(seed: &hash, value: killsAssists?.hashValue ?? 0)
					hashCombine(seed: &hash, value: killsHighSec?.hashValue ?? 0)
					hashCombine(seed: &hash, value: killsLowSec?.hashValue ?? 0)
					hashCombine(seed: &hash, value: killsNullSec?.hashValue ?? 0)
					hashCombine(seed: &hash, value: killsPodHighSec?.hashValue ?? 0)
					hashCombine(seed: &hash, value: killsPodLowSec?.hashValue ?? 0)
					hashCombine(seed: &hash, value: killsPodNullSec?.hashValue ?? 0)
					hashCombine(seed: &hash, value: killsPodWormhole?.hashValue ?? 0)
					hashCombine(seed: &hash, value: killsWormhole?.hashValue ?? 0)
					hashCombine(seed: &hash, value: npcFlagSet?.hashValue ?? 0)
					hashCombine(seed: &hash, value: probeScans?.hashValue ?? 0)
					hashCombine(seed: &hash, value: pvpFlagSet?.hashValue ?? 0)
					hashCombine(seed: &hash, value: repairArmorByRemoteAmount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: repairArmorRemoteAmount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: repairArmorSelfAmount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: repairCapacitorByRemoteAmount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: repairCapacitorRemoteAmount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: repairCapacitorSelfAmount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: repairHullByRemoteAmount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: repairHullRemoteAmount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: repairHullSelfAmount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: repairShieldByRemoteAmount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: repairShieldRemoteAmount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: repairShieldSelfAmount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: selfDestructs?.hashValue ?? 0)
					hashCombine(seed: &hash, value: warpScramblePc?.hashValue ?? 0)
					hashCombine(seed: &hash, value: warpScrambledbyNpc?.hashValue ?? 0)
					hashCombine(seed: &hash, value: warpScrambledbyPc?.hashValue ?? 0)
					hashCombine(seed: &hash, value: weaponFlagSet?.hashValue ?? 0)
					hashCombine(seed: &hash, value: webifiedbyNpc?.hashValue ?? 0)
					hashCombine(seed: &hash, value: webifiedbyPc?.hashValue ?? 0)
					hashCombine(seed: &hash, value: webifyingPc?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsCombat, rhs: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsCombat) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case capDrainedbyNpc = "cap_drainedby_npc"
					case capDrainedbyPc = "cap_drainedby_pc"
					case capDrainingPc = "cap_draining_pc"
					case criminalFlagSet = "criminal_flag_set"
					case damageFromNpCsAmount = "damage_from_np_cs_amount"
					case damageFromNpCsNumShots = "damage_from_np_cs_num_shots"
					case damageFromPlayersBombAmount = "damage_from_players_bomb_amount"
					case damageFromPlayersBombNumShots = "damage_from_players_bomb_num_shots"
					case damageFromPlayersCombatDroneAmount = "damage_from_players_combat_drone_amount"
					case damageFromPlayersCombatDroneNumShots = "damage_from_players_combat_drone_num_shots"
					case damageFromPlayersEnergyAmount = "damage_from_players_energy_amount"
					case damageFromPlayersEnergyNumShots = "damage_from_players_energy_num_shots"
					case damageFromPlayersFighterBomberAmount = "damage_from_players_fighter_bomber_amount"
					case damageFromPlayersFighterBomberNumShots = "damage_from_players_fighter_bomber_num_shots"
					case damageFromPlayersFighterDroneAmount = "damage_from_players_fighter_drone_amount"
					case damageFromPlayersFighterDroneNumShots = "damage_from_players_fighter_drone_num_shots"
					case damageFromPlayersHybridAmount = "damage_from_players_hybrid_amount"
					case damageFromPlayersHybridNumShots = "damage_from_players_hybrid_num_shots"
					case damageFromPlayersMissileAmount = "damage_from_players_missile_amount"
					case damageFromPlayersMissileNumShots = "damage_from_players_missile_num_shots"
					case damageFromPlayersProjectileAmount = "damage_from_players_projectile_amount"
					case damageFromPlayersProjectileNumShots = "damage_from_players_projectile_num_shots"
					case damageFromPlayersSmartBombAmount = "damage_from_players_smart_bomb_amount"
					case damageFromPlayersSmartBombNumShots = "damage_from_players_smart_bomb_num_shots"
					case damageFromPlayersSuperAmount = "damage_from_players_super_amount"
					case damageFromPlayersSuperNumShots = "damage_from_players_super_num_shots"
					case damageFromStructuresTotalAmount = "damage_from_structures_total_amount"
					case damageFromStructuresTotalNumShots = "damage_from_structures_total_num_shots"
					case damageToPlayersBombAmount = "damage_to_players_bomb_amount"
					case damageToPlayersBombNumShots = "damage_to_players_bomb_num_shots"
					case damageToPlayersCombatDroneAmount = "damage_to_players_combat_drone_amount"
					case damageToPlayersCombatDroneNumShots = "damage_to_players_combat_drone_num_shots"
					case damageToPlayersEnergyAmount = "damage_to_players_energy_amount"
					case damageToPlayersEnergyNumShots = "damage_to_players_energy_num_shots"
					case damageToPlayersFighterBomberAmount = "damage_to_players_fighter_bomber_amount"
					case damageToPlayersFighterBomberNumShots = "damage_to_players_fighter_bomber_num_shots"
					case damageToPlayersFighterDroneAmount = "damage_to_players_fighter_drone_amount"
					case damageToPlayersFighterDroneNumShots = "damage_to_players_fighter_drone_num_shots"
					case damageToPlayersHybridAmount = "damage_to_players_hybrid_amount"
					case damageToPlayersHybridNumShots = "damage_to_players_hybrid_num_shots"
					case damageToPlayersMissileAmount = "damage_to_players_missile_amount"
					case damageToPlayersMissileNumShots = "damage_to_players_missile_num_shots"
					case damageToPlayersProjectileAmount = "damage_to_players_projectile_amount"
					case damageToPlayersProjectileNumShots = "damage_to_players_projectile_num_shots"
					case damageToPlayersSmartBombAmount = "damage_to_players_smart_bomb_amount"
					case damageToPlayersSmartBombNumShots = "damage_to_players_smart_bomb_num_shots"
					case damageToPlayersSuperAmount = "damage_to_players_super_amount"
					case damageToPlayersSuperNumShots = "damage_to_players_super_num_shots"
					case damageToStructuresTotalAmount = "damage_to_structures_total_amount"
					case damageToStructuresTotalNumShots = "damage_to_structures_total_num_shots"
					case deathsHighSec = "deaths_high_sec"
					case deathsLowSec = "deaths_low_sec"
					case deathsNullSec = "deaths_null_sec"
					case deathsPodHighSec = "deaths_pod_high_sec"
					case deathsPodLowSec = "deaths_pod_low_sec"
					case deathsPodNullSec = "deaths_pod_null_sec"
					case deathsPodWormhole = "deaths_pod_wormhole"
					case deathsWormhole = "deaths_wormhole"
					case droneEngage = "drone_engage"
					case dscans
					case duelRequested = "duel_requested"
					case engagementRegister = "engagement_register"
					case killsAssists = "kills_assists"
					case killsHighSec = "kills_high_sec"
					case killsLowSec = "kills_low_sec"
					case killsNullSec = "kills_null_sec"
					case killsPodHighSec = "kills_pod_high_sec"
					case killsPodLowSec = "kills_pod_low_sec"
					case killsPodNullSec = "kills_pod_null_sec"
					case killsPodWormhole = "kills_pod_wormhole"
					case killsWormhole = "kills_wormhole"
					case npcFlagSet = "npc_flag_set"
					case probeScans = "probe_scans"
					case pvpFlagSet = "pvp_flag_set"
					case repairArmorByRemoteAmount = "repair_armor_by_remote_amount"
					case repairArmorRemoteAmount = "repair_armor_remote_amount"
					case repairArmorSelfAmount = "repair_armor_self_amount"
					case repairCapacitorByRemoteAmount = "repair_capacitor_by_remote_amount"
					case repairCapacitorRemoteAmount = "repair_capacitor_remote_amount"
					case repairCapacitorSelfAmount = "repair_capacitor_self_amount"
					case repairHullByRemoteAmount = "repair_hull_by_remote_amount"
					case repairHullRemoteAmount = "repair_hull_remote_amount"
					case repairHullSelfAmount = "repair_hull_self_amount"
					case repairShieldByRemoteAmount = "repair_shield_by_remote_amount"
					case repairShieldRemoteAmount = "repair_shield_remote_amount"
					case repairShieldSelfAmount = "repair_shield_self_amount"
					case selfDestructs = "self_destructs"
					case warpScramblePc = "warp_scramble_pc"
					case warpScrambledbyNpc = "warp_scrambledby_npc"
					case warpScrambledbyPc = "warp_scrambledby_pc"
					case weaponFlagSet = "weapon_flag_set"
					case webifiedbyNpc = "webifiedby_npc"
					case webifiedbyPc = "webifiedby_pc"
					case webifyingPc = "webifying_pc"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct GetCharactersCharacterIDStatsTravel: Codable, Hashable {
				
				
				public var accelerationGateActivations: Int64?
				public var alignTo: Int64?
				public var distanceWarpedHighSec: Int64?
				public var distanceWarpedLowSec: Int64?
				public var distanceWarpedNullSec: Int64?
				public var distanceWarpedWormhole: Int64?
				public var docksHighSec: Int64?
				public var docksLowSec: Int64?
				public var docksNullSec: Int64?
				public var jumpsStargateHighSec: Int64?
				public var jumpsStargateLowSec: Int64?
				public var jumpsStargateNullSec: Int64?
				public var jumpsWormhole: Int64?
				public var warpsHighSec: Int64?
				public var warpsLowSec: Int64?
				public var warpsNullSec: Int64?
				public var warpsToBookmark: Int64?
				public var warpsToCelestial: Int64?
				public var warpsToFleetMember: Int64?
				public var warpsToScanResult: Int64?
				public var warpsWormhole: Int64?
				
				public init(accelerationGateActivations: Int64?, alignTo: Int64?, distanceWarpedHighSec: Int64?, distanceWarpedLowSec: Int64?, distanceWarpedNullSec: Int64?, distanceWarpedWormhole: Int64?, docksHighSec: Int64?, docksLowSec: Int64?, docksNullSec: Int64?, jumpsStargateHighSec: Int64?, jumpsStargateLowSec: Int64?, jumpsStargateNullSec: Int64?, jumpsWormhole: Int64?, warpsHighSec: Int64?, warpsLowSec: Int64?, warpsNullSec: Int64?, warpsToBookmark: Int64?, warpsToCelestial: Int64?, warpsToFleetMember: Int64?, warpsToScanResult: Int64?, warpsWormhole: Int64?) {
					self.accelerationGateActivations = accelerationGateActivations
					self.alignTo = alignTo
					self.distanceWarpedHighSec = distanceWarpedHighSec
					self.distanceWarpedLowSec = distanceWarpedLowSec
					self.distanceWarpedNullSec = distanceWarpedNullSec
					self.distanceWarpedWormhole = distanceWarpedWormhole
					self.docksHighSec = docksHighSec
					self.docksLowSec = docksLowSec
					self.docksNullSec = docksNullSec
					self.jumpsStargateHighSec = jumpsStargateHighSec
					self.jumpsStargateLowSec = jumpsStargateLowSec
					self.jumpsStargateNullSec = jumpsStargateNullSec
					self.jumpsWormhole = jumpsWormhole
					self.warpsHighSec = warpsHighSec
					self.warpsLowSec = warpsLowSec
					self.warpsNullSec = warpsNullSec
					self.warpsToBookmark = warpsToBookmark
					self.warpsToCelestial = warpsToCelestial
					self.warpsToFleetMember = warpsToFleetMember
					self.warpsToScanResult = warpsToScanResult
					self.warpsWormhole = warpsWormhole
				}
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: accelerationGateActivations?.hashValue ?? 0)
					hashCombine(seed: &hash, value: alignTo?.hashValue ?? 0)
					hashCombine(seed: &hash, value: distanceWarpedHighSec?.hashValue ?? 0)
					hashCombine(seed: &hash, value: distanceWarpedLowSec?.hashValue ?? 0)
					hashCombine(seed: &hash, value: distanceWarpedNullSec?.hashValue ?? 0)
					hashCombine(seed: &hash, value: distanceWarpedWormhole?.hashValue ?? 0)
					hashCombine(seed: &hash, value: docksHighSec?.hashValue ?? 0)
					hashCombine(seed: &hash, value: docksLowSec?.hashValue ?? 0)
					hashCombine(seed: &hash, value: docksNullSec?.hashValue ?? 0)
					hashCombine(seed: &hash, value: jumpsStargateHighSec?.hashValue ?? 0)
					hashCombine(seed: &hash, value: jumpsStargateLowSec?.hashValue ?? 0)
					hashCombine(seed: &hash, value: jumpsStargateNullSec?.hashValue ?? 0)
					hashCombine(seed: &hash, value: jumpsWormhole?.hashValue ?? 0)
					hashCombine(seed: &hash, value: warpsHighSec?.hashValue ?? 0)
					hashCombine(seed: &hash, value: warpsLowSec?.hashValue ?? 0)
					hashCombine(seed: &hash, value: warpsNullSec?.hashValue ?? 0)
					hashCombine(seed: &hash, value: warpsToBookmark?.hashValue ?? 0)
					hashCombine(seed: &hash, value: warpsToCelestial?.hashValue ?? 0)
					hashCombine(seed: &hash, value: warpsToFleetMember?.hashValue ?? 0)
					hashCombine(seed: &hash, value: warpsToScanResult?.hashValue ?? 0)
					hashCombine(seed: &hash, value: warpsWormhole?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsTravel, rhs: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsTravel) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case accelerationGateActivations = "acceleration_gate_activations"
					case alignTo = "align_to"
					case distanceWarpedHighSec = "distance_warped_high_sec"
					case distanceWarpedLowSec = "distance_warped_low_sec"
					case distanceWarpedNullSec = "distance_warped_null_sec"
					case distanceWarpedWormhole = "distance_warped_wormhole"
					case docksHighSec = "docks_high_sec"
					case docksLowSec = "docks_low_sec"
					case docksNullSec = "docks_null_sec"
					case jumpsStargateHighSec = "jumps_stargate_high_sec"
					case jumpsStargateLowSec = "jumps_stargate_low_sec"
					case jumpsStargateNullSec = "jumps_stargate_null_sec"
					case jumpsWormhole = "jumps_wormhole"
					case warpsHighSec = "warps_high_sec"
					case warpsLowSec = "warps_low_sec"
					case warpsNullSec = "warps_null_sec"
					case warpsToBookmark = "warps_to_bookmark"
					case warpsToCelestial = "warps_to_celestial"
					case warpsToFleetMember = "warps_to_fleet_member"
					case warpsToScanResult = "warps_to_scan_result"
					case warpsWormhole = "warps_wormhole"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct GetCharactersCharacterIDStatsSocial: Codable, Hashable {
				
				
				public var addContactBad: Int64?
				public var addContactGood: Int64?
				public var addContactHigh: Int64?
				public var addContactHorrible: Int64?
				public var addContactNeutral: Int64?
				public var addNote: Int64?
				public var addedAsContactBad: Int64?
				public var addedAsContactGood: Int64?
				public var addedAsContactHigh: Int64?
				public var addedAsContactHorrible: Int64?
				public var addedAsContactNeutral: Int64?
				public var calendarEventCreated: Int64?
				public var chatMessagesAlliance: Int64?
				public var chatMessagesConstellation: Int64?
				public var chatMessagesCorporation: Int64?
				public var chatMessagesFleet: Int64?
				public var chatMessagesRegion: Int64?
				public var chatMessagesSolarsystem: Int64?
				public var chatMessagesWarfaction: Int64?
				public var chatTotalMessageLength: Int64?
				public var directTrades: Int64?
				public var fleetBroadcasts: Int64?
				public var fleetJoins: Int64?
				public var mailsReceived: Int64?
				public var mailsSent: Int64?
				
				public init(addContactBad: Int64?, addContactGood: Int64?, addContactHigh: Int64?, addContactHorrible: Int64?, addContactNeutral: Int64?, addNote: Int64?, addedAsContactBad: Int64?, addedAsContactGood: Int64?, addedAsContactHigh: Int64?, addedAsContactHorrible: Int64?, addedAsContactNeutral: Int64?, calendarEventCreated: Int64?, chatMessagesAlliance: Int64?, chatMessagesConstellation: Int64?, chatMessagesCorporation: Int64?, chatMessagesFleet: Int64?, chatMessagesRegion: Int64?, chatMessagesSolarsystem: Int64?, chatMessagesWarfaction: Int64?, chatTotalMessageLength: Int64?, directTrades: Int64?, fleetBroadcasts: Int64?, fleetJoins: Int64?, mailsReceived: Int64?, mailsSent: Int64?) {
					self.addContactBad = addContactBad
					self.addContactGood = addContactGood
					self.addContactHigh = addContactHigh
					self.addContactHorrible = addContactHorrible
					self.addContactNeutral = addContactNeutral
					self.addNote = addNote
					self.addedAsContactBad = addedAsContactBad
					self.addedAsContactGood = addedAsContactGood
					self.addedAsContactHigh = addedAsContactHigh
					self.addedAsContactHorrible = addedAsContactHorrible
					self.addedAsContactNeutral = addedAsContactNeutral
					self.calendarEventCreated = calendarEventCreated
					self.chatMessagesAlliance = chatMessagesAlliance
					self.chatMessagesConstellation = chatMessagesConstellation
					self.chatMessagesCorporation = chatMessagesCorporation
					self.chatMessagesFleet = chatMessagesFleet
					self.chatMessagesRegion = chatMessagesRegion
					self.chatMessagesSolarsystem = chatMessagesSolarsystem
					self.chatMessagesWarfaction = chatMessagesWarfaction
					self.chatTotalMessageLength = chatTotalMessageLength
					self.directTrades = directTrades
					self.fleetBroadcasts = fleetBroadcasts
					self.fleetJoins = fleetJoins
					self.mailsReceived = mailsReceived
					self.mailsSent = mailsSent
				}
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: addContactBad?.hashValue ?? 0)
					hashCombine(seed: &hash, value: addContactGood?.hashValue ?? 0)
					hashCombine(seed: &hash, value: addContactHigh?.hashValue ?? 0)
					hashCombine(seed: &hash, value: addContactHorrible?.hashValue ?? 0)
					hashCombine(seed: &hash, value: addContactNeutral?.hashValue ?? 0)
					hashCombine(seed: &hash, value: addNote?.hashValue ?? 0)
					hashCombine(seed: &hash, value: addedAsContactBad?.hashValue ?? 0)
					hashCombine(seed: &hash, value: addedAsContactGood?.hashValue ?? 0)
					hashCombine(seed: &hash, value: addedAsContactHigh?.hashValue ?? 0)
					hashCombine(seed: &hash, value: addedAsContactHorrible?.hashValue ?? 0)
					hashCombine(seed: &hash, value: addedAsContactNeutral?.hashValue ?? 0)
					hashCombine(seed: &hash, value: calendarEventCreated?.hashValue ?? 0)
					hashCombine(seed: &hash, value: chatMessagesAlliance?.hashValue ?? 0)
					hashCombine(seed: &hash, value: chatMessagesConstellation?.hashValue ?? 0)
					hashCombine(seed: &hash, value: chatMessagesCorporation?.hashValue ?? 0)
					hashCombine(seed: &hash, value: chatMessagesFleet?.hashValue ?? 0)
					hashCombine(seed: &hash, value: chatMessagesRegion?.hashValue ?? 0)
					hashCombine(seed: &hash, value: chatMessagesSolarsystem?.hashValue ?? 0)
					hashCombine(seed: &hash, value: chatMessagesWarfaction?.hashValue ?? 0)
					hashCombine(seed: &hash, value: chatTotalMessageLength?.hashValue ?? 0)
					hashCombine(seed: &hash, value: directTrades?.hashValue ?? 0)
					hashCombine(seed: &hash, value: fleetBroadcasts?.hashValue ?? 0)
					hashCombine(seed: &hash, value: fleetJoins?.hashValue ?? 0)
					hashCombine(seed: &hash, value: mailsReceived?.hashValue ?? 0)
					hashCombine(seed: &hash, value: mailsSent?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsSocial, rhs: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsSocial) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case addContactBad = "add_contact_bad"
					case addContactGood = "add_contact_good"
					case addContactHigh = "add_contact_high"
					case addContactHorrible = "add_contact_horrible"
					case addContactNeutral = "add_contact_neutral"
					case addNote = "add_note"
					case addedAsContactBad = "added_as_contact_bad"
					case addedAsContactGood = "added_as_contact_good"
					case addedAsContactHigh = "added_as_contact_high"
					case addedAsContactHorrible = "added_as_contact_horrible"
					case addedAsContactNeutral = "added_as_contact_neutral"
					case calendarEventCreated = "calendar_event_created"
					case chatMessagesAlliance = "chat_messages_alliance"
					case chatMessagesConstellation = "chat_messages_constellation"
					case chatMessagesCorporation = "chat_messages_corporation"
					case chatMessagesFleet = "chat_messages_fleet"
					case chatMessagesRegion = "chat_messages_region"
					case chatMessagesSolarsystem = "chat_messages_solarsystem"
					case chatMessagesWarfaction = "chat_messages_warfaction"
					case chatTotalMessageLength = "chat_total_message_length"
					case directTrades = "direct_trades"
					case fleetBroadcasts = "fleet_broadcasts"
					case fleetJoins = "fleet_joins"
					case mailsReceived = "mails_received"
					case mailsSent = "mails_sent"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct GetCharactersCharacterIDStatsOrbital: Codable, Hashable {
				
				
				public var strikeCharactersKilled: Int64?
				public var strikeDamageToPlayersArmorAmount: Int64?
				public var strikeDamageToPlayersShieldAmount: Int64?
				
				public init(strikeCharactersKilled: Int64?, strikeDamageToPlayersArmorAmount: Int64?, strikeDamageToPlayersShieldAmount: Int64?) {
					self.strikeCharactersKilled = strikeCharactersKilled
					self.strikeDamageToPlayersArmorAmount = strikeDamageToPlayersArmorAmount
					self.strikeDamageToPlayersShieldAmount = strikeDamageToPlayersShieldAmount
				}
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: strikeCharactersKilled?.hashValue ?? 0)
					hashCombine(seed: &hash, value: strikeDamageToPlayersArmorAmount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: strikeDamageToPlayersShieldAmount?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsOrbital, rhs: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsOrbital) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case strikeCharactersKilled = "strike_characters_killed"
					case strikeDamageToPlayersArmorAmount = "strike_damage_to_players_armor_amount"
					case strikeDamageToPlayersShieldAmount = "strike_damage_to_players_shield_amount"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct GetCharactersCharacterIDStatsModule: Codable, Hashable {
				
				
				public var activationsArmorHardener: Int64?
				public var activationsArmorRepairUnit: Int64?
				public var activationsArmorResistanceShiftHardener: Int64?
				public var activationsAutomatedTargetingSystem: Int64?
				public var activationsBastion: Int64?
				public var activationsBombLauncher: Int64?
				public var activationsCapacitorBooster: Int64?
				public var activationsCargoScanner: Int64?
				public var activationsCloakingDevice: Int64?
				public var activationsCloneVatBay: Int64?
				public var activationsCynosuralField: Int64?
				public var activationsDamageControl: Int64?
				public var activationsDataMiners: Int64?
				public var activationsDroneControlUnit: Int64?
				public var activationsDroneTrackingModules: Int64?
				public var activationsEccm: Int64?
				public var activationsEcm: Int64?
				public var activationsEcmBurst: Int64?
				public var activationsEnergyDestabilizer: Int64?
				public var activationsEnergyVampire: Int64?
				public var activationsEnergyWeapon: Int64?
				public var activationsFestivalLauncher: Int64?
				public var activationsFrequencyMiningLaser: Int64?
				public var activationsFueledArmorRepairer: Int64?
				public var activationsFueledShieldBooster: Int64?
				public var activationsGangCoordinator: Int64?
				public var activationsGasCloudHarvester: Int64?
				public var activationsHullRepairUnit: Int64?
				public var activationsHybridWeapon: Int64?
				public var activationsIndustrialCore: Int64?
				public var activationsInterdictionSphereLauncher: Int64?
				public var activationsMicroJumpDrive: Int64?
				public var activationsMiningLaser: Int64?
				public var activationsMissileLauncher: Int64?
				public var activationsPassiveTargetingSystem: Int64?
				public var activationsProbeLauncher: Int64?
				public var activationsProjectedEccm: Int64?
				public var activationsProjectileWeapon: Int64?
				public var activationsPropulsionModule: Int64?
				public var activationsRemoteArmorRepairer: Int64?
				public var activationsRemoteCapacitorTransmitter: Int64?
				public var activationsRemoteEcmBurst: Int64?
				public var activationsRemoteHullRepairer: Int64?
				public var activationsRemoteSensorBooster: Int64?
				public var activationsRemoteSensorDamper: Int64?
				public var activationsRemoteShieldBooster: Int64?
				public var activationsRemoteTrackingComputer: Int64?
				public var activationsSalvager: Int64?
				public var activationsSensorBooster: Int64?
				public var activationsShieldBooster: Int64?
				public var activationsShieldHardener: Int64?
				public var activationsShipScanner: Int64?
				public var activationsSiege: Int64?
				public var activationsSmartBomb: Int64?
				public var activationsStasisWeb: Int64?
				public var activationsStripMiner: Int64?
				public var activationsSuperWeapon: Int64?
				public var activationsSurveyScanner: Int64?
				public var activationsTargetBreaker: Int64?
				public var activationsTargetPainter: Int64?
				public var activationsTrackingComputer: Int64?
				public var activationsTrackingDisruptor: Int64?
				public var activationsTractorBeam: Int64?
				public var activationsTriage: Int64?
				public var activationsWarpDisruptFieldGenerator: Int64?
				public var activationsWarpScrambler: Int64?
				public var linkWeapons: Int64?
				public var overload: Int64?
				public var repairs: Int64?
				
				public init(activationsArmorHardener: Int64?, activationsArmorRepairUnit: Int64?, activationsArmorResistanceShiftHardener: Int64?, activationsAutomatedTargetingSystem: Int64?, activationsBastion: Int64?, activationsBombLauncher: Int64?, activationsCapacitorBooster: Int64?, activationsCargoScanner: Int64?, activationsCloakingDevice: Int64?, activationsCloneVatBay: Int64?, activationsCynosuralField: Int64?, activationsDamageControl: Int64?, activationsDataMiners: Int64?, activationsDroneControlUnit: Int64?, activationsDroneTrackingModules: Int64?, activationsEccm: Int64?, activationsEcm: Int64?, activationsEcmBurst: Int64?, activationsEnergyDestabilizer: Int64?, activationsEnergyVampire: Int64?, activationsEnergyWeapon: Int64?, activationsFestivalLauncher: Int64?, activationsFrequencyMiningLaser: Int64?, activationsFueledArmorRepairer: Int64?, activationsFueledShieldBooster: Int64?, activationsGangCoordinator: Int64?, activationsGasCloudHarvester: Int64?, activationsHullRepairUnit: Int64?, activationsHybridWeapon: Int64?, activationsIndustrialCore: Int64?, activationsInterdictionSphereLauncher: Int64?, activationsMicroJumpDrive: Int64?, activationsMiningLaser: Int64?, activationsMissileLauncher: Int64?, activationsPassiveTargetingSystem: Int64?, activationsProbeLauncher: Int64?, activationsProjectedEccm: Int64?, activationsProjectileWeapon: Int64?, activationsPropulsionModule: Int64?, activationsRemoteArmorRepairer: Int64?, activationsRemoteCapacitorTransmitter: Int64?, activationsRemoteEcmBurst: Int64?, activationsRemoteHullRepairer: Int64?, activationsRemoteSensorBooster: Int64?, activationsRemoteSensorDamper: Int64?, activationsRemoteShieldBooster: Int64?, activationsRemoteTrackingComputer: Int64?, activationsSalvager: Int64?, activationsSensorBooster: Int64?, activationsShieldBooster: Int64?, activationsShieldHardener: Int64?, activationsShipScanner: Int64?, activationsSiege: Int64?, activationsSmartBomb: Int64?, activationsStasisWeb: Int64?, activationsStripMiner: Int64?, activationsSuperWeapon: Int64?, activationsSurveyScanner: Int64?, activationsTargetBreaker: Int64?, activationsTargetPainter: Int64?, activationsTrackingComputer: Int64?, activationsTrackingDisruptor: Int64?, activationsTractorBeam: Int64?, activationsTriage: Int64?, activationsWarpDisruptFieldGenerator: Int64?, activationsWarpScrambler: Int64?, linkWeapons: Int64?, overload: Int64?, repairs: Int64?) {
					self.activationsArmorHardener = activationsArmorHardener
					self.activationsArmorRepairUnit = activationsArmorRepairUnit
					self.activationsArmorResistanceShiftHardener = activationsArmorResistanceShiftHardener
					self.activationsAutomatedTargetingSystem = activationsAutomatedTargetingSystem
					self.activationsBastion = activationsBastion
					self.activationsBombLauncher = activationsBombLauncher
					self.activationsCapacitorBooster = activationsCapacitorBooster
					self.activationsCargoScanner = activationsCargoScanner
					self.activationsCloakingDevice = activationsCloakingDevice
					self.activationsCloneVatBay = activationsCloneVatBay
					self.activationsCynosuralField = activationsCynosuralField
					self.activationsDamageControl = activationsDamageControl
					self.activationsDataMiners = activationsDataMiners
					self.activationsDroneControlUnit = activationsDroneControlUnit
					self.activationsDroneTrackingModules = activationsDroneTrackingModules
					self.activationsEccm = activationsEccm
					self.activationsEcm = activationsEcm
					self.activationsEcmBurst = activationsEcmBurst
					self.activationsEnergyDestabilizer = activationsEnergyDestabilizer
					self.activationsEnergyVampire = activationsEnergyVampire
					self.activationsEnergyWeapon = activationsEnergyWeapon
					self.activationsFestivalLauncher = activationsFestivalLauncher
					self.activationsFrequencyMiningLaser = activationsFrequencyMiningLaser
					self.activationsFueledArmorRepairer = activationsFueledArmorRepairer
					self.activationsFueledShieldBooster = activationsFueledShieldBooster
					self.activationsGangCoordinator = activationsGangCoordinator
					self.activationsGasCloudHarvester = activationsGasCloudHarvester
					self.activationsHullRepairUnit = activationsHullRepairUnit
					self.activationsHybridWeapon = activationsHybridWeapon
					self.activationsIndustrialCore = activationsIndustrialCore
					self.activationsInterdictionSphereLauncher = activationsInterdictionSphereLauncher
					self.activationsMicroJumpDrive = activationsMicroJumpDrive
					self.activationsMiningLaser = activationsMiningLaser
					self.activationsMissileLauncher = activationsMissileLauncher
					self.activationsPassiveTargetingSystem = activationsPassiveTargetingSystem
					self.activationsProbeLauncher = activationsProbeLauncher
					self.activationsProjectedEccm = activationsProjectedEccm
					self.activationsProjectileWeapon = activationsProjectileWeapon
					self.activationsPropulsionModule = activationsPropulsionModule
					self.activationsRemoteArmorRepairer = activationsRemoteArmorRepairer
					self.activationsRemoteCapacitorTransmitter = activationsRemoteCapacitorTransmitter
					self.activationsRemoteEcmBurst = activationsRemoteEcmBurst
					self.activationsRemoteHullRepairer = activationsRemoteHullRepairer
					self.activationsRemoteSensorBooster = activationsRemoteSensorBooster
					self.activationsRemoteSensorDamper = activationsRemoteSensorDamper
					self.activationsRemoteShieldBooster = activationsRemoteShieldBooster
					self.activationsRemoteTrackingComputer = activationsRemoteTrackingComputer
					self.activationsSalvager = activationsSalvager
					self.activationsSensorBooster = activationsSensorBooster
					self.activationsShieldBooster = activationsShieldBooster
					self.activationsShieldHardener = activationsShieldHardener
					self.activationsShipScanner = activationsShipScanner
					self.activationsSiege = activationsSiege
					self.activationsSmartBomb = activationsSmartBomb
					self.activationsStasisWeb = activationsStasisWeb
					self.activationsStripMiner = activationsStripMiner
					self.activationsSuperWeapon = activationsSuperWeapon
					self.activationsSurveyScanner = activationsSurveyScanner
					self.activationsTargetBreaker = activationsTargetBreaker
					self.activationsTargetPainter = activationsTargetPainter
					self.activationsTrackingComputer = activationsTrackingComputer
					self.activationsTrackingDisruptor = activationsTrackingDisruptor
					self.activationsTractorBeam = activationsTractorBeam
					self.activationsTriage = activationsTriage
					self.activationsWarpDisruptFieldGenerator = activationsWarpDisruptFieldGenerator
					self.activationsWarpScrambler = activationsWarpScrambler
					self.linkWeapons = linkWeapons
					self.overload = overload
					self.repairs = repairs
				}
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: activationsArmorHardener?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsArmorRepairUnit?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsArmorResistanceShiftHardener?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsAutomatedTargetingSystem?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsBastion?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsBombLauncher?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsCapacitorBooster?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsCargoScanner?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsCloakingDevice?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsCloneVatBay?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsCynosuralField?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsDamageControl?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsDataMiners?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsDroneControlUnit?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsDroneTrackingModules?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsEccm?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsEcm?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsEcmBurst?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsEnergyDestabilizer?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsEnergyVampire?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsEnergyWeapon?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsFestivalLauncher?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsFrequencyMiningLaser?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsFueledArmorRepairer?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsFueledShieldBooster?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsGangCoordinator?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsGasCloudHarvester?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsHullRepairUnit?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsHybridWeapon?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsIndustrialCore?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsInterdictionSphereLauncher?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsMicroJumpDrive?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsMiningLaser?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsMissileLauncher?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsPassiveTargetingSystem?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsProbeLauncher?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsProjectedEccm?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsProjectileWeapon?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsPropulsionModule?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsRemoteArmorRepairer?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsRemoteCapacitorTransmitter?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsRemoteEcmBurst?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsRemoteHullRepairer?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsRemoteSensorBooster?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsRemoteSensorDamper?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsRemoteShieldBooster?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsRemoteTrackingComputer?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsSalvager?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsSensorBooster?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsShieldBooster?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsShieldHardener?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsShipScanner?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsSiege?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsSmartBomb?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsStasisWeb?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsStripMiner?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsSuperWeapon?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsSurveyScanner?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsTargetBreaker?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsTargetPainter?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsTrackingComputer?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsTrackingDisruptor?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsTractorBeam?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsTriage?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsWarpDisruptFieldGenerator?.hashValue ?? 0)
					hashCombine(seed: &hash, value: activationsWarpScrambler?.hashValue ?? 0)
					hashCombine(seed: &hash, value: linkWeapons?.hashValue ?? 0)
					hashCombine(seed: &hash, value: overload?.hashValue ?? 0)
					hashCombine(seed: &hash, value: repairs?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsModule, rhs: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsModule) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case activationsArmorHardener = "activations_armor_hardener"
					case activationsArmorRepairUnit = "activations_armor_repair_unit"
					case activationsArmorResistanceShiftHardener = "activations_armor_resistance_shift_hardener"
					case activationsAutomatedTargetingSystem = "activations_automated_targeting_system"
					case activationsBastion = "activations_bastion"
					case activationsBombLauncher = "activations_bomb_launcher"
					case activationsCapacitorBooster = "activations_capacitor_booster"
					case activationsCargoScanner = "activations_cargo_scanner"
					case activationsCloakingDevice = "activations_cloaking_device"
					case activationsCloneVatBay = "activations_clone_vat_bay"
					case activationsCynosuralField = "activations_cynosural_field"
					case activationsDamageControl = "activations_damage_control"
					case activationsDataMiners = "activations_data_miners"
					case activationsDroneControlUnit = "activations_drone_control_unit"
					case activationsDroneTrackingModules = "activations_drone_tracking_modules"
					case activationsEccm = "activations_eccm"
					case activationsEcm = "activations_ecm"
					case activationsEcmBurst = "activations_ecm_burst"
					case activationsEnergyDestabilizer = "activations_energy_destabilizer"
					case activationsEnergyVampire = "activations_energy_vampire"
					case activationsEnergyWeapon = "activations_energy_weapon"
					case activationsFestivalLauncher = "activations_festival_launcher"
					case activationsFrequencyMiningLaser = "activations_frequency_mining_laser"
					case activationsFueledArmorRepairer = "activations_fueled_armor_repairer"
					case activationsFueledShieldBooster = "activations_fueled_shield_booster"
					case activationsGangCoordinator = "activations_gang_coordinator"
					case activationsGasCloudHarvester = "activations_gas_cloud_harvester"
					case activationsHullRepairUnit = "activations_hull_repair_unit"
					case activationsHybridWeapon = "activations_hybrid_weapon"
					case activationsIndustrialCore = "activations_industrial_core"
					case activationsInterdictionSphereLauncher = "activations_interdiction_sphere_launcher"
					case activationsMicroJumpDrive = "activations_micro_jump_drive"
					case activationsMiningLaser = "activations_mining_laser"
					case activationsMissileLauncher = "activations_missile_launcher"
					case activationsPassiveTargetingSystem = "activations_passive_targeting_system"
					case activationsProbeLauncher = "activations_probe_launcher"
					case activationsProjectedEccm = "activations_projected_eccm"
					case activationsProjectileWeapon = "activations_projectile_weapon"
					case activationsPropulsionModule = "activations_propulsion_module"
					case activationsRemoteArmorRepairer = "activations_remote_armor_repairer"
					case activationsRemoteCapacitorTransmitter = "activations_remote_capacitor_transmitter"
					case activationsRemoteEcmBurst = "activations_remote_ecm_burst"
					case activationsRemoteHullRepairer = "activations_remote_hull_repairer"
					case activationsRemoteSensorBooster = "activations_remote_sensor_booster"
					case activationsRemoteSensorDamper = "activations_remote_sensor_damper"
					case activationsRemoteShieldBooster = "activations_remote_shield_booster"
					case activationsRemoteTrackingComputer = "activations_remote_tracking_computer"
					case activationsSalvager = "activations_salvager"
					case activationsSensorBooster = "activations_sensor_booster"
					case activationsShieldBooster = "activations_shield_booster"
					case activationsShieldHardener = "activations_shield_hardener"
					case activationsShipScanner = "activations_ship_scanner"
					case activationsSiege = "activations_siege"
					case activationsSmartBomb = "activations_smart_bomb"
					case activationsStasisWeb = "activations_stasis_web"
					case activationsStripMiner = "activations_strip_miner"
					case activationsSuperWeapon = "activations_super_weapon"
					case activationsSurveyScanner = "activations_survey_scanner"
					case activationsTargetBreaker = "activations_target_breaker"
					case activationsTargetPainter = "activations_target_painter"
					case activationsTrackingComputer = "activations_tracking_computer"
					case activationsTrackingDisruptor = "activations_tracking_disruptor"
					case activationsTractorBeam = "activations_tractor_beam"
					case activationsTriage = "activations_triage"
					case activationsWarpDisruptFieldGenerator = "activations_warp_disrupt_field_generator"
					case activationsWarpScrambler = "activations_warp_scrambler"
					case linkWeapons = "link_weapons"
					case overload
					case repairs
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct GetCharactersCharacterIDStatsIndustry: Codable, Hashable {
				
				
				public var hackingSuccesses: Int64?
				public var jobsCancelled: Int64?
				public var jobsCompletedCopyBlueprint: Int64?
				public var jobsCompletedInvention: Int64?
				public var jobsCompletedManufacture: Int64?
				public var jobsCompletedManufactureAsteroid: Int64?
				public var jobsCompletedManufactureAsteroidQuantity: Int64?
				public var jobsCompletedManufactureCharge: Int64?
				public var jobsCompletedManufactureChargeQuantity: Int64?
				public var jobsCompletedManufactureCommodity: Int64?
				public var jobsCompletedManufactureCommodityQuantity: Int64?
				public var jobsCompletedManufactureDeployable: Int64?
				public var jobsCompletedManufactureDeployableQuantity: Int64?
				public var jobsCompletedManufactureDrone: Int64?
				public var jobsCompletedManufactureDroneQuantity: Int64?
				public var jobsCompletedManufactureImplant: Int64?
				public var jobsCompletedManufactureImplantQuantity: Int64?
				public var jobsCompletedManufactureModule: Int64?
				public var jobsCompletedManufactureModuleQuantity: Int64?
				public var jobsCompletedManufactureOther: Int64?
				public var jobsCompletedManufactureOtherQuantity: Int64?
				public var jobsCompletedManufactureShip: Int64?
				public var jobsCompletedManufactureShipQuantity: Int64?
				public var jobsCompletedManufactureStructure: Int64?
				public var jobsCompletedManufactureStructureQuantity: Int64?
				public var jobsCompletedManufactureSubsystem: Int64?
				public var jobsCompletedManufactureSubsystemQuantity: Int64?
				public var jobsCompletedMaterialProductivity: Int64?
				public var jobsCompletedTimeProductivity: Int64?
				public var jobsStartedCopyBlueprint: Int64?
				public var jobsStartedInvention: Int64?
				public var jobsStartedManufacture: Int64?
				public var jobsStartedMaterialProductivity: Int64?
				public var jobsStartedTimeProductivity: Int64?
				public var reprocessItem: Int64?
				public var reprocessItemQuantity: Int64?
				
				public init(hackingSuccesses: Int64?, jobsCancelled: Int64?, jobsCompletedCopyBlueprint: Int64?, jobsCompletedInvention: Int64?, jobsCompletedManufacture: Int64?, jobsCompletedManufactureAsteroid: Int64?, jobsCompletedManufactureAsteroidQuantity: Int64?, jobsCompletedManufactureCharge: Int64?, jobsCompletedManufactureChargeQuantity: Int64?, jobsCompletedManufactureCommodity: Int64?, jobsCompletedManufactureCommodityQuantity: Int64?, jobsCompletedManufactureDeployable: Int64?, jobsCompletedManufactureDeployableQuantity: Int64?, jobsCompletedManufactureDrone: Int64?, jobsCompletedManufactureDroneQuantity: Int64?, jobsCompletedManufactureImplant: Int64?, jobsCompletedManufactureImplantQuantity: Int64?, jobsCompletedManufactureModule: Int64?, jobsCompletedManufactureModuleQuantity: Int64?, jobsCompletedManufactureOther: Int64?, jobsCompletedManufactureOtherQuantity: Int64?, jobsCompletedManufactureShip: Int64?, jobsCompletedManufactureShipQuantity: Int64?, jobsCompletedManufactureStructure: Int64?, jobsCompletedManufactureStructureQuantity: Int64?, jobsCompletedManufactureSubsystem: Int64?, jobsCompletedManufactureSubsystemQuantity: Int64?, jobsCompletedMaterialProductivity: Int64?, jobsCompletedTimeProductivity: Int64?, jobsStartedCopyBlueprint: Int64?, jobsStartedInvention: Int64?, jobsStartedManufacture: Int64?, jobsStartedMaterialProductivity: Int64?, jobsStartedTimeProductivity: Int64?, reprocessItem: Int64?, reprocessItemQuantity: Int64?) {
					self.hackingSuccesses = hackingSuccesses
					self.jobsCancelled = jobsCancelled
					self.jobsCompletedCopyBlueprint = jobsCompletedCopyBlueprint
					self.jobsCompletedInvention = jobsCompletedInvention
					self.jobsCompletedManufacture = jobsCompletedManufacture
					self.jobsCompletedManufactureAsteroid = jobsCompletedManufactureAsteroid
					self.jobsCompletedManufactureAsteroidQuantity = jobsCompletedManufactureAsteroidQuantity
					self.jobsCompletedManufactureCharge = jobsCompletedManufactureCharge
					self.jobsCompletedManufactureChargeQuantity = jobsCompletedManufactureChargeQuantity
					self.jobsCompletedManufactureCommodity = jobsCompletedManufactureCommodity
					self.jobsCompletedManufactureCommodityQuantity = jobsCompletedManufactureCommodityQuantity
					self.jobsCompletedManufactureDeployable = jobsCompletedManufactureDeployable
					self.jobsCompletedManufactureDeployableQuantity = jobsCompletedManufactureDeployableQuantity
					self.jobsCompletedManufactureDrone = jobsCompletedManufactureDrone
					self.jobsCompletedManufactureDroneQuantity = jobsCompletedManufactureDroneQuantity
					self.jobsCompletedManufactureImplant = jobsCompletedManufactureImplant
					self.jobsCompletedManufactureImplantQuantity = jobsCompletedManufactureImplantQuantity
					self.jobsCompletedManufactureModule = jobsCompletedManufactureModule
					self.jobsCompletedManufactureModuleQuantity = jobsCompletedManufactureModuleQuantity
					self.jobsCompletedManufactureOther = jobsCompletedManufactureOther
					self.jobsCompletedManufactureOtherQuantity = jobsCompletedManufactureOtherQuantity
					self.jobsCompletedManufactureShip = jobsCompletedManufactureShip
					self.jobsCompletedManufactureShipQuantity = jobsCompletedManufactureShipQuantity
					self.jobsCompletedManufactureStructure = jobsCompletedManufactureStructure
					self.jobsCompletedManufactureStructureQuantity = jobsCompletedManufactureStructureQuantity
					self.jobsCompletedManufactureSubsystem = jobsCompletedManufactureSubsystem
					self.jobsCompletedManufactureSubsystemQuantity = jobsCompletedManufactureSubsystemQuantity
					self.jobsCompletedMaterialProductivity = jobsCompletedMaterialProductivity
					self.jobsCompletedTimeProductivity = jobsCompletedTimeProductivity
					self.jobsStartedCopyBlueprint = jobsStartedCopyBlueprint
					self.jobsStartedInvention = jobsStartedInvention
					self.jobsStartedManufacture = jobsStartedManufacture
					self.jobsStartedMaterialProductivity = jobsStartedMaterialProductivity
					self.jobsStartedTimeProductivity = jobsStartedTimeProductivity
					self.reprocessItem = reprocessItem
					self.reprocessItemQuantity = reprocessItemQuantity
				}
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: hackingSuccesses?.hashValue ?? 0)
					hashCombine(seed: &hash, value: jobsCancelled?.hashValue ?? 0)
					hashCombine(seed: &hash, value: jobsCompletedCopyBlueprint?.hashValue ?? 0)
					hashCombine(seed: &hash, value: jobsCompletedInvention?.hashValue ?? 0)
					hashCombine(seed: &hash, value: jobsCompletedManufacture?.hashValue ?? 0)
					hashCombine(seed: &hash, value: jobsCompletedManufactureAsteroid?.hashValue ?? 0)
					hashCombine(seed: &hash, value: jobsCompletedManufactureAsteroidQuantity?.hashValue ?? 0)
					hashCombine(seed: &hash, value: jobsCompletedManufactureCharge?.hashValue ?? 0)
					hashCombine(seed: &hash, value: jobsCompletedManufactureChargeQuantity?.hashValue ?? 0)
					hashCombine(seed: &hash, value: jobsCompletedManufactureCommodity?.hashValue ?? 0)
					hashCombine(seed: &hash, value: jobsCompletedManufactureCommodityQuantity?.hashValue ?? 0)
					hashCombine(seed: &hash, value: jobsCompletedManufactureDeployable?.hashValue ?? 0)
					hashCombine(seed: &hash, value: jobsCompletedManufactureDeployableQuantity?.hashValue ?? 0)
					hashCombine(seed: &hash, value: jobsCompletedManufactureDrone?.hashValue ?? 0)
					hashCombine(seed: &hash, value: jobsCompletedManufactureDroneQuantity?.hashValue ?? 0)
					hashCombine(seed: &hash, value: jobsCompletedManufactureImplant?.hashValue ?? 0)
					hashCombine(seed: &hash, value: jobsCompletedManufactureImplantQuantity?.hashValue ?? 0)
					hashCombine(seed: &hash, value: jobsCompletedManufactureModule?.hashValue ?? 0)
					hashCombine(seed: &hash, value: jobsCompletedManufactureModuleQuantity?.hashValue ?? 0)
					hashCombine(seed: &hash, value: jobsCompletedManufactureOther?.hashValue ?? 0)
					hashCombine(seed: &hash, value: jobsCompletedManufactureOtherQuantity?.hashValue ?? 0)
					hashCombine(seed: &hash, value: jobsCompletedManufactureShip?.hashValue ?? 0)
					hashCombine(seed: &hash, value: jobsCompletedManufactureShipQuantity?.hashValue ?? 0)
					hashCombine(seed: &hash, value: jobsCompletedManufactureStructure?.hashValue ?? 0)
					hashCombine(seed: &hash, value: jobsCompletedManufactureStructureQuantity?.hashValue ?? 0)
					hashCombine(seed: &hash, value: jobsCompletedManufactureSubsystem?.hashValue ?? 0)
					hashCombine(seed: &hash, value: jobsCompletedManufactureSubsystemQuantity?.hashValue ?? 0)
					hashCombine(seed: &hash, value: jobsCompletedMaterialProductivity?.hashValue ?? 0)
					hashCombine(seed: &hash, value: jobsCompletedTimeProductivity?.hashValue ?? 0)
					hashCombine(seed: &hash, value: jobsStartedCopyBlueprint?.hashValue ?? 0)
					hashCombine(seed: &hash, value: jobsStartedInvention?.hashValue ?? 0)
					hashCombine(seed: &hash, value: jobsStartedManufacture?.hashValue ?? 0)
					hashCombine(seed: &hash, value: jobsStartedMaterialProductivity?.hashValue ?? 0)
					hashCombine(seed: &hash, value: jobsStartedTimeProductivity?.hashValue ?? 0)
					hashCombine(seed: &hash, value: reprocessItem?.hashValue ?? 0)
					hashCombine(seed: &hash, value: reprocessItemQuantity?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsIndustry, rhs: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsIndustry) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case hackingSuccesses = "hacking_successes"
					case jobsCancelled = "jobs_cancelled"
					case jobsCompletedCopyBlueprint = "jobs_completed_copy_blueprint"
					case jobsCompletedInvention = "jobs_completed_invention"
					case jobsCompletedManufacture = "jobs_completed_manufacture"
					case jobsCompletedManufactureAsteroid = "jobs_completed_manufacture_asteroid"
					case jobsCompletedManufactureAsteroidQuantity = "jobs_completed_manufacture_asteroid_quantity"
					case jobsCompletedManufactureCharge = "jobs_completed_manufacture_charge"
					case jobsCompletedManufactureChargeQuantity = "jobs_completed_manufacture_charge_quantity"
					case jobsCompletedManufactureCommodity = "jobs_completed_manufacture_commodity"
					case jobsCompletedManufactureCommodityQuantity = "jobs_completed_manufacture_commodity_quantity"
					case jobsCompletedManufactureDeployable = "jobs_completed_manufacture_deployable"
					case jobsCompletedManufactureDeployableQuantity = "jobs_completed_manufacture_deployable_quantity"
					case jobsCompletedManufactureDrone = "jobs_completed_manufacture_drone"
					case jobsCompletedManufactureDroneQuantity = "jobs_completed_manufacture_drone_quantity"
					case jobsCompletedManufactureImplant = "jobs_completed_manufacture_implant"
					case jobsCompletedManufactureImplantQuantity = "jobs_completed_manufacture_implant_quantity"
					case jobsCompletedManufactureModule = "jobs_completed_manufacture_module"
					case jobsCompletedManufactureModuleQuantity = "jobs_completed_manufacture_module_quantity"
					case jobsCompletedManufactureOther = "jobs_completed_manufacture_other"
					case jobsCompletedManufactureOtherQuantity = "jobs_completed_manufacture_other_quantity"
					case jobsCompletedManufactureShip = "jobs_completed_manufacture_ship"
					case jobsCompletedManufactureShipQuantity = "jobs_completed_manufacture_ship_quantity"
					case jobsCompletedManufactureStructure = "jobs_completed_manufacture_structure"
					case jobsCompletedManufactureStructureQuantity = "jobs_completed_manufacture_structure_quantity"
					case jobsCompletedManufactureSubsystem = "jobs_completed_manufacture_subsystem"
					case jobsCompletedManufactureSubsystemQuantity = "jobs_completed_manufacture_subsystem_quantity"
					case jobsCompletedMaterialProductivity = "jobs_completed_material_productivity"
					case jobsCompletedTimeProductivity = "jobs_completed_time_productivity"
					case jobsStartedCopyBlueprint = "jobs_started_copy_blueprint"
					case jobsStartedInvention = "jobs_started_invention"
					case jobsStartedManufacture = "jobs_started_manufacture"
					case jobsStartedMaterialProductivity = "jobs_started_material_productivity"
					case jobsStartedTimeProductivity = "jobs_started_time_productivity"
					case reprocessItem = "reprocess_item"
					case reprocessItemQuantity = "reprocess_item_quantity"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct GetCharactersCharacterIDStatsMarket: Codable, Hashable {
				
				
				public var acceptContractsCourier: Int64?
				public var acceptContractsItemExchange: Int64?
				public var buyOrdersPlaced: Int64?
				public var cancelMarketOrder: Int64?
				public var createContractsAuction: Int64?
				public var createContractsCourier: Int64?
				public var createContractsItemExchange: Int64?
				public var deliverCourierContract: Int64?
				public var iskGained: Int64?
				public var iskSpent: Int64?
				public var modifyMarketOrder: Int64?
				public var searchContracts: Int64?
				public var sellOrdersPlaced: Int64?
				
				public init(acceptContractsCourier: Int64?, acceptContractsItemExchange: Int64?, buyOrdersPlaced: Int64?, cancelMarketOrder: Int64?, createContractsAuction: Int64?, createContractsCourier: Int64?, createContractsItemExchange: Int64?, deliverCourierContract: Int64?, iskGained: Int64?, iskSpent: Int64?, modifyMarketOrder: Int64?, searchContracts: Int64?, sellOrdersPlaced: Int64?) {
					self.acceptContractsCourier = acceptContractsCourier
					self.acceptContractsItemExchange = acceptContractsItemExchange
					self.buyOrdersPlaced = buyOrdersPlaced
					self.cancelMarketOrder = cancelMarketOrder
					self.createContractsAuction = createContractsAuction
					self.createContractsCourier = createContractsCourier
					self.createContractsItemExchange = createContractsItemExchange
					self.deliverCourierContract = deliverCourierContract
					self.iskGained = iskGained
					self.iskSpent = iskSpent
					self.modifyMarketOrder = modifyMarketOrder
					self.searchContracts = searchContracts
					self.sellOrdersPlaced = sellOrdersPlaced
				}
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: acceptContractsCourier?.hashValue ?? 0)
					hashCombine(seed: &hash, value: acceptContractsItemExchange?.hashValue ?? 0)
					hashCombine(seed: &hash, value: buyOrdersPlaced?.hashValue ?? 0)
					hashCombine(seed: &hash, value: cancelMarketOrder?.hashValue ?? 0)
					hashCombine(seed: &hash, value: createContractsAuction?.hashValue ?? 0)
					hashCombine(seed: &hash, value: createContractsCourier?.hashValue ?? 0)
					hashCombine(seed: &hash, value: createContractsItemExchange?.hashValue ?? 0)
					hashCombine(seed: &hash, value: deliverCourierContract?.hashValue ?? 0)
					hashCombine(seed: &hash, value: iskGained?.hashValue ?? 0)
					hashCombine(seed: &hash, value: iskSpent?.hashValue ?? 0)
					hashCombine(seed: &hash, value: modifyMarketOrder?.hashValue ?? 0)
					hashCombine(seed: &hash, value: searchContracts?.hashValue ?? 0)
					hashCombine(seed: &hash, value: sellOrdersPlaced?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsMarket, rhs: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsMarket) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case acceptContractsCourier = "accept_contracts_courier"
					case acceptContractsItemExchange = "accept_contracts_item_exchange"
					case buyOrdersPlaced = "buy_orders_placed"
					case cancelMarketOrder = "cancel_market_order"
					case createContractsAuction = "create_contracts_auction"
					case createContractsCourier = "create_contracts_courier"
					case createContractsItemExchange = "create_contracts_item_exchange"
					case deliverCourierContract = "deliver_courier_contract"
					case iskGained = "isk_gained"
					case iskSpent = "isk_spent"
					case modifyMarketOrder = "modify_market_order"
					case searchContracts = "search_contracts"
					case sellOrdersPlaced = "sell_orders_placed"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct GetCharactersCharacterIDStatsIsk: Codable, Hashable {
				
				
				public var `in`: Int64?
				public var out: Int64?
				
				public init(`in`: Int64?, out: Int64?) {
					self.`in` = `in`
					self.out = out
				}
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: `in`?.hashValue ?? 0)
					hashCombine(seed: &hash, value: out?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsIsk, rhs: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsIsk) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case `in` = "in"
					case out
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public var character: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsCharacter?
			public var combat: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsCombat?
			public var industry: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsIndustry?
			public var inventory: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsInventory?
			public var isk: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsIsk?
			public var market: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsMarket?
			public var mining: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsMining?
			public var module: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsModule?
			public var orbital: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsOrbital?
			public var pve: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsPve?
			public var social: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsSocial?
			public var travel: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsTravel?
			public var year: Int
			
			public init(character: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsCharacter?, combat: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsCombat?, industry: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsIndustry?, inventory: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsInventory?, isk: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsIsk?, market: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsMarket?, mining: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsMining?, module: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsModule?, orbital: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsOrbital?, pve: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsPve?, social: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsSocial?, travel: Character.GetCharactersCharacterIDStatsOk.GetCharactersCharacterIDStatsTravel?, year: Int) {
				self.character = character
				self.combat = combat
				self.industry = industry
				self.inventory = inventory
				self.isk = isk
				self.market = market
				self.mining = mining
				self.module = module
				self.orbital = orbital
				self.pve = pve
				self.social = social
				self.travel = travel
				self.year = year
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: character?.hashValue ?? 0)
				hashCombine(seed: &hash, value: combat?.hashValue ?? 0)
				hashCombine(seed: &hash, value: industry?.hashValue ?? 0)
				hashCombine(seed: &hash, value: inventory?.hashValue ?? 0)
				hashCombine(seed: &hash, value: isk?.hashValue ?? 0)
				hashCombine(seed: &hash, value: market?.hashValue ?? 0)
				hashCombine(seed: &hash, value: mining?.hashValue ?? 0)
				hashCombine(seed: &hash, value: module?.hashValue ?? 0)
				hashCombine(seed: &hash, value: orbital?.hashValue ?? 0)
				hashCombine(seed: &hash, value: pve?.hashValue ?? 0)
				hashCombine(seed: &hash, value: social?.hashValue ?? 0)
				hashCombine(seed: &hash, value: travel?.hashValue ?? 0)
				hashCombine(seed: &hash, value: year.hashValue)
				return hash
			}
			
			public static func ==(lhs: Character.GetCharactersCharacterIDStatsOk, rhs: Character.GetCharactersCharacterIDStatsOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case character
				case combat
				case industry
				case inventory
				case isk
				case market
				case mining
				case module
				case orbital
				case pve
				case social
				case travel
				case year
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct Role: Codable, Hashable {
			
			public enum GetCharactersCharacterIDRolesRolesAtBase: String, Codable, HTTPQueryable {
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
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCharactersCharacterIDRolesRolesAtHq: String, Codable, HTTPQueryable {
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
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCharactersCharacterIDRolesRoles: String, Codable, HTTPQueryable {
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
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCharactersCharacterIDRolesRolesAtOther: String, Codable, HTTPQueryable {
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
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var roles: [Character.Role.GetCharactersCharacterIDRolesRoles]?
			public var rolesAtBase: [Character.Role.GetCharactersCharacterIDRolesRolesAtBase]?
			public var rolesAtHq: [Character.Role.GetCharactersCharacterIDRolesRolesAtHq]?
			public var rolesAtOther: [Character.Role.GetCharactersCharacterIDRolesRolesAtOther]?
			
			public init(roles: [Character.Role.GetCharactersCharacterIDRolesRoles]?, rolesAtBase: [Character.Role.GetCharactersCharacterIDRolesRolesAtBase]?, rolesAtHq: [Character.Role.GetCharactersCharacterIDRolesRolesAtHq]?, rolesAtOther: [Character.Role.GetCharactersCharacterIDRolesRolesAtOther]?) {
				self.roles = roles
				self.rolesAtBase = rolesAtBase
				self.rolesAtHq = rolesAtHq
				self.rolesAtOther = rolesAtOther
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				self.roles?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.rolesAtBase?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.rolesAtHq?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.rolesAtOther?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}
			
			public static func ==(lhs: Character.Role, rhs: Character.Role) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case roles
				case rolesAtBase = "roles_at_base"
				case rolesAtHq = "roles_at_hq"
				case rolesAtOther = "roles_at_other"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCharactersCharacterIDNotificationsOk: Codable, Hashable {
			
			public enum GetCharactersCharacterIDNotificationsType: String, Codable, HTTPQueryable {
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
				case moonminingExtractionStarted = "MoonminingExtractionStarted"
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
				case structureWentHighPower = "StructureWentHighPower"
				case structureWentLowPower = "StructureWentLowPower"
				case structuresReinforcementChanged = "StructuresReinforcementChanged"
				case towerAlertMsg = "TowerAlertMsg"
				case towerResourceAlertMsg = "TowerResourceAlertMsg"
				case transactionReversalMsg = "TransactionReversalMsg"
				case tutorialMsg = "TutorialMsg"
				case warAllyOfferDeclinedMsg = "WarAllyOfferDeclinedMsg"
				case warSurrenderDeclinedMsg = "WarSurrenderDeclinedMsg"
				case warSurrenderOfferMsg = "WarSurrenderOfferMsg"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCharactersCharacterIDNotificationsSenderType: String, Codable, HTTPQueryable {
				case alliance = "alliance"
				case character = "character"
				case corporation = "corporation"
				case faction = "faction"
				case other = "other"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var isRead: Bool?
			public var notificationID: Int64
			public var senderID: Int
			public var senderType: Character.GetCharactersCharacterIDNotificationsOk.GetCharactersCharacterIDNotificationsSenderType
			public var text: String?
			public var timestamp: Date
			public var type: Character.GetCharactersCharacterIDNotificationsOk.GetCharactersCharacterIDNotificationsType
			
			public init(isRead: Bool?, notificationID: Int64, senderID: Int, senderType: Character.GetCharactersCharacterIDNotificationsOk.GetCharactersCharacterIDNotificationsSenderType, text: String?, timestamp: Date, type: Character.GetCharactersCharacterIDNotificationsOk.GetCharactersCharacterIDNotificationsType) {
				self.isRead = isRead
				self.notificationID = notificationID
				self.senderID = senderID
				self.senderType = senderType
				self.text = text
				self.timestamp = timestamp
				self.type = type
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: isRead?.hashValue ?? 0)
				hashCombine(seed: &hash, value: notificationID.hashValue)
				hashCombine(seed: &hash, value: senderID.hashValue)
				hashCombine(seed: &hash, value: senderType.hashValue)
				hashCombine(seed: &hash, value: text?.hashValue ?? 0)
				hashCombine(seed: &hash, value: timestamp.hashValue)
				hashCombine(seed: &hash, value: type.hashValue)
				return hash
			}
			
			public static func ==(lhs: Character.GetCharactersCharacterIDNotificationsOk, rhs: Character.GetCharactersCharacterIDNotificationsOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case isRead = "is_read"
				case notificationID = "notification_id"
				case senderID = "sender_id"
				case senderType = "sender_type"
				case text
				case timestamp
				case type
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .timestamp: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct Affiliation: Codable, Hashable {
			
			
			public var allianceID: Int?
			public var characterID: Int
			public var corporationID: Int
			public var factionID: Int?
			
			public init(allianceID: Int?, characterID: Int, corporationID: Int, factionID: Int?) {
				self.allianceID = allianceID
				self.characterID = characterID
				self.corporationID = corporationID
				self.factionID = factionID
			}
			
			public var hashValue: Int {
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
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case allianceID = "alliance_id"
				case characterID = "character_id"
				case corporationID = "corporation_id"
				case factionID = "faction_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct Blueprint: Codable, Hashable {
			
			public enum GetCharactersCharacterIDBlueprintsLocationFlag: String, Codable, HTTPQueryable {
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
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var itemID: Int64
			public var locationFlag: Character.Blueprint.GetCharactersCharacterIDBlueprintsLocationFlag
			public var locationID: Int64
			public var materialEfficiency: Int
			public var quantity: Int
			public var runs: Int
			public var timeEfficiency: Int
			public var typeID: Int
			
			public init(itemID: Int64, locationFlag: Character.Blueprint.GetCharactersCharacterIDBlueprintsLocationFlag, locationID: Int64, materialEfficiency: Int, quantity: Int, runs: Int, timeEfficiency: Int, typeID: Int) {
				self.itemID = itemID
				self.locationFlag = locationFlag
				self.locationID = locationID
				self.materialEfficiency = materialEfficiency
				self.quantity = quantity
				self.runs = runs
				self.timeEfficiency = timeEfficiency
				self.typeID = typeID
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: itemID.hashValue)
				hashCombine(seed: &hash, value: locationFlag.hashValue)
				hashCombine(seed: &hash, value: locationID.hashValue)
				hashCombine(seed: &hash, value: materialEfficiency.hashValue)
				hashCombine(seed: &hash, value: quantity.hashValue)
				hashCombine(seed: &hash, value: runs.hashValue)
				hashCombine(seed: &hash, value: timeEfficiency.hashValue)
				hashCombine(seed: &hash, value: typeID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Character.Blueprint, rhs: Character.Blueprint) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case itemID = "item_id"
				case locationFlag = "location_flag"
				case locationID = "location_id"
				case materialEfficiency = "material_efficiency"
				case quantity
				case runs
				case timeEfficiency = "time_efficiency"
				case typeID = "type_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
	}
	
}
