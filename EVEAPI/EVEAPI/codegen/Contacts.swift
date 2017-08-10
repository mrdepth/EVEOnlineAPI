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
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/contacts/labels/"
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
		
		public func editContacts(characterID: Int, contactIds: [Int], labelID: Int64? = nil, standing: Float, watched: Bool? = nil, completionBlock:((Result<String>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-characters.write_contacts.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body = try? JSONSerialization.data(withJSONObject: contactIds.json, options: [])
			
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
			
			let url = session!.baseURL + "latest/characters/\(characterID)/contacts/"
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
			
			let url = session!.baseURL + "latest/characters/\(characterID)/contacts/"
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
		
		public func addContacts(characterID: Int, contactIds: [Int], labelID: Int64? = nil, standing: Float, watched: Bool? = nil, completionBlock:((Result<[Int]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-characters.write_contacts.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body = try? JSONSerialization.data(withJSONObject: contactIds.json, options: [])
			
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
			
			let url = session!.baseURL + "latest/characters/\(characterID)/contacts/"
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
		
		public func deleteContacts(characterID: Int, contactIds: [Int], completionBlock:((Result<String>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-characters.write_contacts.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body = try? JSONSerialization.data(withJSONObject: contactIds.json, options: [])
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/contacts/"
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
		
		
		public class Contact: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public enum GetCharactersCharacterIDContactsContactType: String, JSONCoding, HTTPQueryable {
				case alliance = "alliance"
				case character = "character"
				case corporation = "corporation"
				case faction = "faction"
				
				public init() {
					self = .character
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCharactersCharacterIDContactsContactType(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var contactID: Int = Int()
			public var contactType: Contacts.Contact.GetCharactersCharacterIDContactsContactType = Contacts.Contact.GetCharactersCharacterIDContactsContactType()
			public var isBlocked: Bool? = nil
			public var isWatched: Bool? = nil
			public var labelID: Int64? = nil
			public var standing: Float = Float()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let contactID = dictionary["contact_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.contactID = contactID
				guard let contactType = Contacts.Contact.GetCharactersCharacterIDContactsContactType(rawValue: dictionary["contact_type"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.contactType = contactType
				isBlocked = dictionary["is_blocked"] as? Bool
				isWatched = dictionary["is_watched"] as? Bool
				labelID = dictionary["label_id"] as? Int64
				guard let standing = dictionary["standing"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.standing = standing
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				contactID = aDecoder.decodeInteger(forKey: "contact_id")
				contactType = Contacts.Contact.GetCharactersCharacterIDContactsContactType(rawValue: aDecoder.decodeObject(forKey: "contact_type") as? String ?? "") ?? Contacts.Contact.GetCharactersCharacterIDContactsContactType()
				isBlocked = aDecoder.containsValue(forKey: "is_blocked") ? aDecoder.decodeBool(forKey: "is_blocked") : nil
				isWatched = aDecoder.containsValue(forKey: "is_watched") ? aDecoder.decodeBool(forKey: "is_watched") : nil
				labelID = aDecoder.containsValue(forKey: "label_id") ? aDecoder.decodeInt64(forKey: "label_id") : nil
				standing = aDecoder.decodeFloat(forKey: "standing")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(contactID, forKey: "contact_id")
				aCoder.encode(contactType.rawValue, forKey: "contact_type")
				if let v = isBlocked {
					aCoder.encode(v, forKey: "is_blocked")
				}
				if let v = isWatched {
					aCoder.encode(v, forKey: "is_watched")
				}
				if let v = labelID {
					aCoder.encode(v, forKey: "label_id")
				}
				aCoder.encode(standing, forKey: "standing")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["contact_id"] = contactID.json
				json["contact_type"] = contactType.json
				if let v = isBlocked?.json {
					json["is_blocked"] = v
				}
				if let v = isWatched?.json {
					json["is_watched"] = v
				}
				if let v = labelID?.json {
					json["label_id"] = v
				}
				json["standing"] = standing.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.contactID.hashValue)
				hashCombine(seed: &hash, value: self.contactType.hashValue)
				hashCombine(seed: &hash, value: self.isBlocked?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.isWatched?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.labelID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.standing.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Contacts.Contact, rhs: Contacts.Contact) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Contacts.Contact) {
				contactID = other.contactID
				contactType = other.contactType
				isBlocked = other.isBlocked
				isWatched = other.isWatched
				labelID = other.labelID
				standing = other.standing
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Contacts.Contact(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Contact)?.hashValue == hashValue
			}
			
		}
		
		
		public class Label: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var labelID: Int64 = Int64()
			public var labelName: String = String()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let labelID = dictionary["label_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.labelID = labelID
				guard let labelName = dictionary["label_name"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.labelName = labelName
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				labelID = aDecoder.decodeInt64(forKey: "label_id")
				labelName = aDecoder.decodeObject(forKey: "label_name") as? String ?? String()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(labelID, forKey: "label_id")
				aCoder.encode(labelName, forKey: "label_name")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["label_id"] = labelID.json
				json["label_name"] = labelName.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.labelID.hashValue)
				hashCombine(seed: &hash, value: self.labelName.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Contacts.Label, rhs: Contacts.Label) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Contacts.Label) {
				labelID = other.labelID
				labelName = other.labelName
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Contacts.Label(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Label)?.hashValue == hashValue
			}
			
		}
		
		
	}
	
}
