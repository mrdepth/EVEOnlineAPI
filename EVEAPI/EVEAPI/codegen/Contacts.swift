import Foundation
import Alamofire
import Futures


public extension ESI {
	public var contacts: Contacts {
		return Contacts(esi: self)
	}
	
	class Contacts {
		weak var esi: ESI?
		
		init(esi: ESI) {
			self.esi = esi
		}
		
		@discardableResult
		public func getAllianceContacts(allianceID: Int, ifNoneMatch: String? = nil, page: Int? = nil) -> Future<ESI.Result<[Contacts.GetAlliancesAllianceIDContactsOk]>> {
			guard let esi = self.esi else { return .init(.failure(ESIError.internalError)) }
			
			let scopes = (esi.sessionManager.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-alliances.read_contacts.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = esi.baseURL + "/v2/alliances/\(allianceID)/contacts/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Contacts.GetAlliancesAllianceIDContactsOk]>>()
			esi.perform { [weak esi] () -> DataRequest? in
				return esi?.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Contacts.GetAlliancesAllianceIDContactsOk]>) in
					promise.set(response: response, cached: 300.0)
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCorporationContacts(corporationID: Int, ifNoneMatch: String? = nil, page: Int? = nil) -> Future<ESI.Result<[Contacts.GetCorporationsCorporationIDContactsOk]>> {
			guard let esi = self.esi else { return .init(.failure(ESIError.internalError)) }
			
			let scopes = (esi.sessionManager.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.read_contacts.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = esi.baseURL + "/v2/corporations/\(corporationID)/contacts/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Contacts.GetCorporationsCorporationIDContactsOk]>>()
			esi.perform { [weak esi] () -> DataRequest? in
				return esi?.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Contacts.GetCorporationsCorporationIDContactsOk]>) in
					promise.set(response: response, cached: 300.0)
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getContactLabels(characterID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<[Contacts.Label]>> {
			guard let esi = self.esi else { return .init(.failure(ESIError.internalError)) }
			
			let scopes = (esi.sessionManager.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-characters.read_contacts.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/characters/\(characterID)/contacts/labels/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Contacts.Label]>>()
			esi.perform { [weak esi] () -> DataRequest? in
				return esi?.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Contacts.Label]>) in
					promise.set(response: response, cached: 300.0)
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getAllianceContactLabels(allianceID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<[Contacts.GetAlliancesAllianceIDContactsLabelsOk]>> {
			guard let esi = self.esi else { return .init(.failure(ESIError.internalError)) }
			
			let scopes = (esi.sessionManager.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-alliances.read_contacts.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/alliances/\(allianceID)/contacts/labels/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Contacts.GetAlliancesAllianceIDContactsLabelsOk]>>()
			esi.perform { [weak esi] () -> DataRequest? in
				return esi?.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Contacts.GetAlliancesAllianceIDContactsLabelsOk]>) in
					promise.set(response: response, cached: 300.0)
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCorporationContactLabels(corporationID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<[Contacts.GetCorporationsCorporationIDContactsLabelsOk]>> {
			guard let esi = self.esi else { return .init(.failure(ESIError.internalError)) }
			
			let scopes = (esi.sessionManager.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.read_contacts.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/corporations/\(corporationID)/contacts/labels/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Contacts.GetCorporationsCorporationIDContactsLabelsOk]>>()
			esi.perform { [weak esi] () -> DataRequest? in
				return esi?.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Contacts.GetCorporationsCorporationIDContactsLabelsOk]>) in
					promise.set(response: response, cached: 300.0)
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func editContacts(characterID: Int, contactIds: [Int], labelIds: [Int64]? = nil, standing: Float, watched: Bool? = nil) -> Future<ESI.Result<String>> {
			guard let esi = self.esi else { return .init(.failure(ESIError.internalError)) }
			
			let scopes = (esi.sessionManager.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-characters.write_contacts.v1") else {return .init(.failure(ESIError.forbidden))}
			let body = try? JSONEncoder().encode(contactIds)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = labelIds?.httpQuery {
				query.append(URLQueryItem(name: "label_ids", value: v))
			}
			if let v = standing.httpQuery {
				query.append(URLQueryItem(name: "standing", value: v))
			}
			if let v = watched?.httpQuery {
				query.append(URLQueryItem(name: "watched", value: v))
			}
			
			let url = esi.baseURL + "/v2/characters/\(characterID)/contacts/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<String>>()
			esi.perform { [weak esi] () -> DataRequest? in
				return esi?.sessionManager.request(components.url!, method: .put, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<String>) in
					promise.set(response: response, cached: nil)
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func addContacts(characterID: Int, contactIds: [Int], labelIds: [Int64]? = nil, standing: Float, watched: Bool? = nil) -> Future<ESI.Result<[Int]>> {
			guard let esi = self.esi else { return .init(.failure(ESIError.internalError)) }
			
			let scopes = (esi.sessionManager.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-characters.write_contacts.v1") else {return .init(.failure(ESIError.forbidden))}
			let body = try? JSONEncoder().encode(contactIds)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = labelIds?.httpQuery {
				query.append(URLQueryItem(name: "label_ids", value: v))
			}
			if let v = standing.httpQuery {
				query.append(URLQueryItem(name: "standing", value: v))
			}
			if let v = watched?.httpQuery {
				query.append(URLQueryItem(name: "watched", value: v))
			}
			
			let url = esi.baseURL + "/v2/characters/\(characterID)/contacts/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Int]>>()
			esi.perform { [weak esi] () -> DataRequest? in
				return esi?.sessionManager.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Int]>) in
					promise.set(response: response, cached: nil)
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getContacts(characterID: Int, ifNoneMatch: String? = nil, page: Int? = nil) -> Future<ESI.Result<[Contacts.Contact]>> {
			guard let esi = self.esi else { return .init(.failure(ESIError.internalError)) }
			
			let scopes = (esi.sessionManager.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-characters.read_contacts.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = esi.baseURL + "/v2/characters/\(characterID)/contacts/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Contacts.Contact]>>()
			esi.perform { [weak esi] () -> DataRequest? in
				return esi?.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Contacts.Contact]>) in
					promise.set(response: response, cached: 300.0)
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func deleteContacts(characterID: Int, contactIds: [Int]) -> Future<ESI.Result<String>> {
			guard let esi = self.esi else { return .init(.failure(ESIError.internalError)) }
			
			let scopes = (esi.sessionManager.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-characters.write_contacts.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = contactIds.httpQuery {
				query.append(URLQueryItem(name: "contact_ids", value: v))
			}
			
			let url = esi.baseURL + "/v2/characters/\(characterID)/contacts/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<String>>()
			esi.perform { [weak esi] () -> DataRequest? in
				return esi?.sessionManager.request(components.url!, method: .delete, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<String>) in
					promise.set(response: response, cached: nil)
				}
			}
			return promise.future
		}
		
		
		public struct GetAlliancesAllianceIDContactsLabelsOk: Codable, Hashable {
			
			
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
			
			public static func ==(lhs: Contacts.GetAlliancesAllianceIDContactsLabelsOk, rhs: Contacts.GetAlliancesAllianceIDContactsLabelsOk) -> Bool {
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
		
		
		public struct PostCharactersCharacterIDContactsError520: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Contacts.PostCharactersCharacterIDContactsError520, rhs: Contacts.PostCharactersCharacterIDContactsError520) -> Bool {
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
		
		
		public struct GetCorporationsCorporationIDContactsLabelsOk: Codable, Hashable {
			
			
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
			
			public static func ==(lhs: Contacts.GetCorporationsCorporationIDContactsLabelsOk, rhs: Contacts.GetCorporationsCorporationIDContactsLabelsOk) -> Bool {
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
			public var labelIds: [Int64]?
			public var standing: Float
			
			public init(contactID: Int, contactType: Contacts.GetAlliancesAllianceIDContactsOk.GetAlliancesAllianceIDContactsContactType, labelIds: [Int64]?, standing: Float) {
				self.contactID = contactID
				self.contactType = contactType
				self.labelIds = labelIds
				self.standing = standing
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: contactID.hashValue)
				hashCombine(seed: &hash, value: contactType.hashValue)
				self.labelIds?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: standing.hashValue)
				return hash
			}
			
			public static func ==(lhs: Contacts.GetAlliancesAllianceIDContactsOk, rhs: Contacts.GetAlliancesAllianceIDContactsOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case contactID = "contact_id"
				case contactType = "contact_type"
				case labelIds = "label_ids"
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
			public var labelIds: [Int64]?
			public var standing: Float
			
			public init(contactID: Int, contactType: Contacts.GetCorporationsCorporationIDContactsOk.GetCorporationsCorporationIDContactsContactType, isWatched: Bool?, labelIds: [Int64]?, standing: Float) {
				self.contactID = contactID
				self.contactType = contactType
				self.isWatched = isWatched
				self.labelIds = labelIds
				self.standing = standing
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: contactID.hashValue)
				hashCombine(seed: &hash, value: contactType.hashValue)
				hashCombine(seed: &hash, value: isWatched?.hashValue ?? 0)
				self.labelIds?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
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
				case labelIds = "label_ids"
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
			public var labelIds: [Int64]?
			public var standing: Float
			
			public init(contactID: Int, contactType: Contacts.Contact.GetCharactersCharacterIDContactsContactType, isBlocked: Bool?, isWatched: Bool?, labelIds: [Int64]?, standing: Float) {
				self.contactID = contactID
				self.contactType = contactType
				self.isBlocked = isBlocked
				self.isWatched = isWatched
				self.labelIds = labelIds
				self.standing = standing
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: contactID.hashValue)
				hashCombine(seed: &hash, value: contactType.hashValue)
				hashCombine(seed: &hash, value: isBlocked?.hashValue ?? 0)
				hashCombine(seed: &hash, value: isWatched?.hashValue ?? 0)
				self.labelIds?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
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
				case labelIds = "label_ids"
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
