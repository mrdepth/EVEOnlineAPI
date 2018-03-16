import Foundation
import Alamofire


public extension ESI {
	public var contacts: Contacts {
		return Contacts(sessionManager: self)
	}
	
	class Contacts {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		@discardableResult
		public func addContacts(characterID: Int, contactIds: [Int], labelID: Int64? = nil, standing: Float, watched: Bool? = nil) -> Future<ESI.Result<[Int]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Int]>>()
			guard session != nil else {
				try! promise.set(.failure(ESIError.internalError))
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-characters.write_contacts.v1") else {
				try! promise.set(.failure(ESIError.forbidden))
				return promise.future
			}
			let body = try? JSONEncoder().encode(contactIds)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			if let v = labelID?.httpQuery {
				query.append(URLQueryItem(name: "label_id", value: v))
			}
			if let v = standing.httpQuery {
				query.append(URLQueryItem(name: "standing", value: v))
			}
			if let v = watched?.httpQuery {
				query.append(URLQueryItem(name: "watched", value: v))
			}
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/contacts/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Int]>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func editContacts(characterID: Int, contactIds: [Int], labelID: Int64? = nil, standing: Float, watched: Bool? = nil) -> Future<ESI.Result<String>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<String>>()
			guard session != nil else {
				try! promise.set(.failure(ESIError.internalError))
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-characters.write_contacts.v1") else {
				try! promise.set(.failure(ESIError.forbidden))
				return promise.future
			}
			let body = try? JSONEncoder().encode(contactIds)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			if let v = labelID?.httpQuery {
				query.append(URLQueryItem(name: "label_id", value: v))
			}
			if let v = standing.httpQuery {
				query.append(URLQueryItem(name: "standing", value: v))
			}
			if let v = watched?.httpQuery {
				query.append(URLQueryItem(name: "watched", value: v))
			}
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/contacts/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .put, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<String>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getContacts(characterID: Int, page: Int? = nil) -> Future<ESI.Result<[Contacts.Contact]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Contacts.Contact]>>()
			guard session != nil else {
				try! promise.set(.failure(ESIError.internalError))
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-characters.read_contacts.v1") else {
				try! promise.set(.failure(ESIError.forbidden))
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/contacts/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Contacts.Contact]>) in
					promise.set(result: response.result, cached: 300.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getAllianceContacts(allianceID: Int, page: Int? = nil) -> Future<ESI.Result<[Contacts.GetAlliancesAllianceIDContactsOk]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Contacts.GetAlliancesAllianceIDContactsOk]>>()
			guard session != nil else {
				try! promise.set(.failure(ESIError.internalError))
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-alliances.read_contacts.v1") else {
				try! promise.set(.failure(ESIError.forbidden))
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v1/alliances/\(allianceID)/contacts/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Contacts.GetAlliancesAllianceIDContactsOk]>) in
					promise.set(result: response.result, cached: 300.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getContactLabels(characterID: Int) -> Future<ESI.Result<[Contacts.Label]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Contacts.Label]>>()
			guard session != nil else {
				try! promise.set(.failure(ESIError.internalError))
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-characters.read_contacts.v1") else {
				try! promise.set(.failure(ESIError.forbidden))
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/contacts/labels/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Contacts.Label]>) in
					promise.set(result: response.result, cached: 300.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCorporationContacts(corporationID: Int, page: Int? = nil) -> Future<ESI.Result<[Contacts.GetCorporationsCorporationIDContactsOk]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Contacts.GetCorporationsCorporationIDContactsOk]>>()
			guard session != nil else {
				try! promise.set(.failure(ESIError.internalError))
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.read_contacts.v1") else {
				try! promise.set(.failure(ESIError.forbidden))
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/contacts/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Contacts.GetCorporationsCorporationIDContactsOk]>) in
					promise.set(result: response.result, cached: 300.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func deleteContacts(characterID: Int, contactIds: [Int]) -> Future<ESI.Result<String>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<String>>()
			guard session != nil else {
				try! promise.set(.failure(ESIError.internalError))
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-characters.write_contacts.v1") else {
				try! promise.set(.failure(ESIError.forbidden))
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			if let v = contactIds.httpQuery {
				query.append(URLQueryItem(name: "contact_ids", value: v))
			}
			
			let url = session!.baseURL + "/v2/characters/\(characterID)/contacts/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .delete, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<String>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		
		public struct GetAlliancesAllianceIDContactsOk: Codable, Hashable {
			
			public enum GetAlliancesAllianceIDContactsContactType: String, Codable, HTTPQueryable {
				case alliance = "alliance"
				case character = "character"
				case corporation = "corporation"
				case faction = "faction"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var contactID: Int
			public var contactType: Contacts.GetAlliancesAllianceIDContactsOk.GetAlliancesAllianceIDContactsContactType
			public var labelID: Int64?
			public var standing: Float
			
			public init(contactID: Int, contactType: Contacts.GetAlliancesAllianceIDContactsOk.GetAlliancesAllianceIDContactsContactType, labelID: Int64?, standing: Float) {
				self.contactID = contactID
				self.contactType = contactType
				self.labelID = labelID
				self.standing = standing
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: contactID.hashValue)
				hashCombine(seed: &hash, value: contactType.hashValue)
				hashCombine(seed: &hash, value: labelID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: standing.hashValue)
				return hash
			}
			
			public static func ==(lhs: Contacts.GetAlliancesAllianceIDContactsOk, rhs: Contacts.GetAlliancesAllianceIDContactsOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case contactID = "contact_id"
				case contactType = "contact_type"
				case labelID = "label_id"
				case standing
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCorporationsCorporationIDContactsOk: Codable, Hashable {
			
			public enum GetCorporationsCorporationIDContactsContactType: String, Codable, HTTPQueryable {
				case alliance = "alliance"
				case character = "character"
				case corporation = "corporation"
				case faction = "faction"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var contactID: Int
			public var contactType: Contacts.GetCorporationsCorporationIDContactsOk.GetCorporationsCorporationIDContactsContactType
			public var isWatched: Bool?
			public var labelID: Int64?
			public var standing: Float
			
			public init(contactID: Int, contactType: Contacts.GetCorporationsCorporationIDContactsOk.GetCorporationsCorporationIDContactsContactType, isWatched: Bool?, labelID: Int64?, standing: Float) {
				self.contactID = contactID
				self.contactType = contactType
				self.isWatched = isWatched
				self.labelID = labelID
				self.standing = standing
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: contactID.hashValue)
				hashCombine(seed: &hash, value: contactType.hashValue)
				hashCombine(seed: &hash, value: isWatched?.hashValue ?? 0)
				hashCombine(seed: &hash, value: labelID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: standing.hashValue)
				return hash
			}
			
			public static func ==(lhs: Contacts.GetCorporationsCorporationIDContactsOk, rhs: Contacts.GetCorporationsCorporationIDContactsOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case contactID = "contact_id"
				case contactType = "contact_type"
				case isWatched = "is_watched"
				case labelID = "label_id"
				case standing
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct Contact: Codable, Hashable {
			
			public enum GetCharactersCharacterIDContactsContactType: String, Codable, HTTPQueryable {
				case alliance = "alliance"
				case character = "character"
				case corporation = "corporation"
				case faction = "faction"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var contactID: Int
			public var contactType: Contacts.Contact.GetCharactersCharacterIDContactsContactType
			public var isBlocked: Bool?
			public var isWatched: Bool?
			public var labelID: Int64?
			public var standing: Float
			
			public init(contactID: Int, contactType: Contacts.Contact.GetCharactersCharacterIDContactsContactType, isBlocked: Bool?, isWatched: Bool?, labelID: Int64?, standing: Float) {
				self.contactID = contactID
				self.contactType = contactType
				self.isBlocked = isBlocked
				self.isWatched = isWatched
				self.labelID = labelID
				self.standing = standing
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: contactID.hashValue)
				hashCombine(seed: &hash, value: contactType.hashValue)
				hashCombine(seed: &hash, value: isBlocked?.hashValue ?? 0)
				hashCombine(seed: &hash, value: isWatched?.hashValue ?? 0)
				hashCombine(seed: &hash, value: labelID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: standing.hashValue)
				return hash
			}
			
			public static func ==(lhs: Contacts.Contact, rhs: Contacts.Contact) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case contactID = "contact_id"
				case contactType = "contact_type"
				case isBlocked = "is_blocked"
				case isWatched = "is_watched"
				case labelID = "label_id"
				case standing
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct Label: Codable, Hashable {
			
			
			public var labelID: Int64
			public var labelName: String
			
			public init(labelID: Int64, labelName: String) {
				self.labelID = labelID
				self.labelName = labelName
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: labelID.hashValue)
				hashCombine(seed: &hash, value: labelName.hashValue)
				return hash
			}
			
			public static func ==(lhs: Contacts.Label, rhs: Contacts.Label) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case labelID = "label_id"
				case labelName = "label_name"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
	}
	
}
