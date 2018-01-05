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
		
		public func addContacts(characterID: Int, contactIds: [Int], labelID: Int64? = nil, standing: Float, watched: Bool? = nil, completionBlock:((Result<[Int]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-characters.write_contacts.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
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
			
			session!.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Int]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func editContacts(characterID: Int, contactIds: [Int], labelID: Int64? = nil, standing: Float, watched: Bool? = nil, completionBlock:((Result<String>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-characters.write_contacts.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
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
			
			session!.request(components.url!, method: .put, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<String>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getContacts(characterID: Int, page: Int? = nil, completionBlock:((Result<[Contacts.Contact]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-characters.read_contacts.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
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
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Contacts.Contact]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getAllianceContacts(allianceID: Int, page: Int? = nil, completionBlock:((Result<[Contacts.GetAlliancesAllianceIDContactsOk]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-alliances.read_contacts.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
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
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Contacts.GetAlliancesAllianceIDContactsOk]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getContactLabels(characterID: Int, completionBlock:((Result<[Contacts.Label]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-characters.read_contacts.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/contacts/labels/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Contacts.Label]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getCorporationContacts(corporationID: Int, page: Int? = nil, completionBlock:((Result<[Contacts.GetCorporationsCorporationIDContactsOk]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.read_contacts.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
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
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Contacts.GetCorporationsCorporationIDContactsOk]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func deleteContacts(characterID: Int, contactIds: [Int], completionBlock:((Result<String>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-characters.write_contacts.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
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
			
			session!.request(components.url!, method: .delete, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<String>) in
				completionBlock?(response.result)
				session = nil
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
			
			public let contactID: Int
			public let contactType: Contacts.GetAlliancesAllianceIDContactsOk.GetAlliancesAllianceIDContactsContactType
			public let labelID: Int64?
			public let standing: Float
			
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
			
			public let contactID: Int
			public let contactType: Contacts.GetCorporationsCorporationIDContactsOk.GetCorporationsCorporationIDContactsContactType
			public let isWatched: Bool?
			public let labelID: Int64?
			public let standing: Float
			
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
			
			public let contactID: Int
			public let contactType: Contacts.Contact.GetCharactersCharacterIDContactsContactType
			public let isBlocked: Bool?
			public let isWatched: Bool?
			public let labelID: Int64?
			public let standing: Float
			
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
			
			
			public let labelID: Int64
			public let labelName: String
			
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
