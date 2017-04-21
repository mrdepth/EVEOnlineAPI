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
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
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
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
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
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
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
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
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
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
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
		
		
		public class PostCharactersCharacterIDContactsForbidden: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Contacts.PostCharactersCharacterIDContactsForbidden, rhs: Contacts.PostCharactersCharacterIDContactsForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PutCharactersCharacterIDContactsForbidden: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Contacts.PutCharactersCharacterIDContactsForbidden, rhs: Contacts.PutCharactersCharacterIDContactsForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDContactsForbidden: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Contacts.GetCharactersCharacterIDContactsForbidden, rhs: Contacts.GetCharactersCharacterIDContactsForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PutCharactersCharacterIDContactsInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Contacts.PutCharactersCharacterIDContactsInternalServerError, rhs: Contacts.PutCharactersCharacterIDContactsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PostCharactersCharacterIDContactsInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Contacts.PostCharactersCharacterIDContactsInternalServerError, rhs: Contacts.PostCharactersCharacterIDContactsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class DeleteCharactersCharacterIDContactsForbidden: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Contacts.DeleteCharactersCharacterIDContactsForbidden, rhs: Contacts.DeleteCharactersCharacterIDContactsForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDContactsLabelsInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Contacts.GetCharactersCharacterIDContactsLabelsInternalServerError, rhs: Contacts.GetCharactersCharacterIDContactsLabelsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDContactsInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Contacts.GetCharactersCharacterIDContactsInternalServerError, rhs: Contacts.GetCharactersCharacterIDContactsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class Contact: NSObject, NSSecureCoding , JSONCoding {
			
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
			
			override public var hashValue: Int {
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
			
		}
		
		
		public class DeleteCharactersCharacterIDContactsInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Contacts.DeleteCharactersCharacterIDContactsInternalServerError, rhs: Contacts.DeleteCharactersCharacterIDContactsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDContactsLabelsForbidden: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Contacts.GetCharactersCharacterIDContactsLabelsForbidden, rhs: Contacts.GetCharactersCharacterIDContactsLabelsForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class Label: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: labelID.hashValue)
				hashCombine(seed: &hash, value: labelName.hashValue)
				return hash
			}
			
			public static func ==(lhs: Contacts.Label, rhs: Contacts.Label) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
	}
	
}
