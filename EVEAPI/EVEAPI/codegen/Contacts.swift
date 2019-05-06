import Foundation
import Alamofire
import Futures


public extension ESI {
	var contacts: Contacts {
		return Contacts(esi: self)
	}
	
	struct Contacts {
		let esi: ESI
		
		@discardableResult
		public func getAllianceContactLabels(allianceID: Int, ifNoneMatch: String? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Contacts.GetAlliancesAllianceIDContactsLabelsOk]>> {
			
			let scopes = esi.token?.scopes ?? []
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
			
			let promise = Promise<ESI.Result<[Contacts.GetAlliancesAllianceIDContactsLabelsOk]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<[Contacts.GetAlliancesAllianceIDContactsLabelsOk]>) in
				promise.set(response: response, cached: 300.0)
			}
			return promise.future
		}
		
		@discardableResult
		public func getContactLabels(characterID: Int, ifNoneMatch: String? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Contacts.Label]>> {
			
			let scopes = esi.token?.scopes ?? []
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
			
			let promise = Promise<ESI.Result<[Contacts.Label]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<[Contacts.Label]>) in
				promise.set(response: response, cached: 300.0)
			}
			return promise.future
		}
		
		@discardableResult
		public func getCorporationContacts(corporationID: Int, ifNoneMatch: String? = nil, page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Contacts.GetCorporationsCorporationIDContactsOk]>> {
			
			let scopes = esi.token?.scopes ?? []
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
			
			let promise = Promise<ESI.Result<[Contacts.GetCorporationsCorporationIDContactsOk]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<[Contacts.GetCorporationsCorporationIDContactsOk]>) in
				promise.set(response: response, cached: 300.0)
			}
			return promise.future
		}
		
		@discardableResult
		public func getAllianceContacts(allianceID: Int, ifNoneMatch: String? = nil, page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Contacts.GetAlliancesAllianceIDContactsOk]>> {
			
			let scopes = esi.token?.scopes ?? []
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
			
			let promise = Promise<ESI.Result<[Contacts.GetAlliancesAllianceIDContactsOk]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<[Contacts.GetAlliancesAllianceIDContactsOk]>) in
				promise.set(response: response, cached: 300.0)
			}
			return promise.future
		}
		
		@discardableResult
		public func getCorporationContactLabels(corporationID: Int, ifNoneMatch: String? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Contacts.GetCorporationsCorporationIDContactsLabelsOk]>> {
			
			let scopes = esi.token?.scopes ?? []
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
			
			let promise = Promise<ESI.Result<[Contacts.GetCorporationsCorporationIDContactsLabelsOk]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<[Contacts.GetCorporationsCorporationIDContactsLabelsOk]>) in
				promise.set(response: response, cached: 300.0)
			}
			return promise.future
		}
		
		@discardableResult
		public func deleteContacts(characterID: Int, contactIds: [Int], cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<String>> {
			
			let scopes = esi.token?.scopes ?? []
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
			
			let promise = Promise<ESI.Result<String>>()
			esi.request(components.url!, method: .delete, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<String>) in
				promise.set(response: response, cached: nil)
			}
			return promise.future
		}
		
		@discardableResult
		public func editContacts(characterID: Int, contactIds: [Int], labelIds: [Int64]? = nil, standing: Float, watched: Bool? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<String>> {
			
			let scopes = esi.token?.scopes ?? []
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
			
			let promise = Promise<ESI.Result<String>>()
			esi.request(components.url!, method: .put, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<String>) in
				promise.set(response: response, cached: nil)
			}
			return promise.future
		}
		
		@discardableResult
		public func getContacts(characterID: Int, ifNoneMatch: String? = nil, page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Contacts.Contact]>> {
			
			let scopes = esi.token?.scopes ?? []
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
			
			let promise = Promise<ESI.Result<[Contacts.Contact]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<[Contacts.Contact]>) in
				promise.set(response: response, cached: 300.0)
			}
			return promise.future
		}
		
		@discardableResult
		public func addContacts(characterID: Int, contactIds: [Int], labelIds: [Int64]? = nil, standing: Float, watched: Bool? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Int]>> {
			
			let scopes = esi.token?.scopes ?? []
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
			
			let promise = Promise<ESI.Result<[Int]>>()
			esi.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<[Int]>) in
				promise.set(response: response, cached: nil)
			}
			return promise.future
		}
		
		
		public struct GetCorporationsCorporationIDContactsLabelsOk: Codable, Hashable {
			
			
			public var labelID: Int64
			public var labelName: String
			
			public init(labelID: Int64, labelName: String) {
				self.labelID = labelID
				self.labelName = labelName
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
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case error
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetAlliancesAllianceIDContactsLabelsOk: Codable, Hashable {
			
			
			public var labelID: Int64
			public var labelName: String
			
			public init(labelID: Int64, labelName: String) {
				self.labelID = labelID
				self.labelName = labelName
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
		
		
		public struct Label: Codable, Hashable {
			
			
			public var labelID: Int64
			public var labelName: String
			
			public init(labelID: Int64, labelName: String) {
				self.labelID = labelID
				self.labelName = labelName
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
		
		
	}
	
}
