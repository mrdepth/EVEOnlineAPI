import Foundation
import Alamofire


public extension ESI {
	public var mail: Mail {
		return Mail(sessionManager: self)
	}
	
	class Mail {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		public func createMailLabel(characterID: Int, label: Mail.Label? = nil, completionBlock:((Result<Int64>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-mail.organize_mail.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			if let v = label {
				parameters["label"] = v.json
			}
			
			let url = session!.baseURL + "latest/characters/\(characterID)/mail/labels/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Int64>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getMailLabelsAndUnreadCounts(characterID: Int, completionBlock:((Result<Mail.MailLabelsAndUnreadCounts>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-mail.read_mail.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/mail/labels/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Mail.MailLabelsAndUnreadCounts>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func deleteMail(characterID: Int, mailID: Int, completionBlock:((Result<String>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-mail.organize_mail.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/mail/\(mailID)/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .delete, parameters: parameters, encoding: JSONEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<String>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func updateMetadataAboutMail(characterID: Int, contents: Mail.UpdateContents, mailID: Int, completionBlock:((Result<String>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-mail.organize_mail.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			parameters["contents"] = contents.json
			
			let url = session!.baseURL + "latest/characters/\(characterID)/mail/\(mailID)/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .put, parameters: parameters, encoding: JSONEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<String>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func returnMail(characterID: Int, mailID: Int, completionBlock:((Result<Mail.MailBody>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-mail.read_mail.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/mail/\(mailID)/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Mail.MailBody>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func deleteMailLabel(characterID: Int, labelID: Int, completionBlock:((Result<String>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-mail.organize_mail.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/mail/labels/\(labelID)/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .delete, parameters: parameters, encoding: JSONEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<String>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func sendNewMail(characterID: Int, mail: Mail.NewMail, completionBlock:((Result<Int>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-mail.send_mail.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			parameters["mail"] = mail.json
			
			let url = session!.baseURL + "latest/characters/\(characterID)/mail/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Int>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func returnMailHeaders(characterID: Int, labels: [Int64]? = nil, lastMailID: Int? = nil, completionBlock:((Result<[Mail.Header]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-mail.read_mail.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			if let v = labels {
				parameters["labels"] = v.json
			}
			if let v = lastMailID {
				parameters["last_mail_id"] = v.json
			}
			
			let url = session!.baseURL + "latest/characters/\(characterID)/mail/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Mail.Header]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func returnMailingListSubscriptions(characterID: Int, completionBlock:((Result<[Mail.Subscription]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-mail.read_mail.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/mail/lists/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Mail.Subscription]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		public class GetCharactersCharacterIDMailLabelsForbidden: NSObject, NSCoding , JSONCoding {
			
			
			public var error: String?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				error = nil
				
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
			
			public static func ==(lhs: Mail.GetCharactersCharacterIDMailLabelsForbidden, rhs: Mail.GetCharactersCharacterIDMailLabelsForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class DeleteCharactersCharacterIDMailMailIDForbidden: NSObject, NSCoding , JSONCoding {
			
			
			public var error: String?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				error = nil
				
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
			
			public static func ==(lhs: Mail.DeleteCharactersCharacterIDMailMailIDForbidden, rhs: Mail.DeleteCharactersCharacterIDMailMailIDForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class DeleteCharactersCharacterIDMailLabelsLabelIDUnprocessableEntity: NSObject, NSCoding , JSONCoding {
			
			
			public var error: String?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				error = nil
				
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
			
			public static func ==(lhs: Mail.DeleteCharactersCharacterIDMailLabelsLabelIDUnprocessableEntity, rhs: Mail.DeleteCharactersCharacterIDMailLabelsLabelIDUnprocessableEntity) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class DeleteCharactersCharacterIDMailLabelsLabelIDForbidden: NSObject, NSCoding , JSONCoding {
			
			
			public var error: String?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				error = nil
				
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
			
			public static func ==(lhs: Mail.DeleteCharactersCharacterIDMailLabelsLabelIDForbidden, rhs: Mail.DeleteCharactersCharacterIDMailLabelsLabelIDForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class Header: NSObject, NSCoding , JSONCoding {
			
			public class GetCharactersCharacterIDMailRecipients: NSObject, NSCoding , JSONCoding {
				
				public enum GetCharactersCharacterIDMailRecipientType: String, JSONCoding {
					case alliance = "alliance"
					case character = "character"
					case corporation = "corporation"
					case mailingList = "mailing_list"
					
					public init() {
						self = .alliance
					}
					
					public var json: Any {
						return self.rawValue
					}
					
					public init(json: Any) throws {
						guard let s = json as? String, let v = GetCharactersCharacterIDMailRecipientType(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
						self = v
					}
					
				}
				
				public var recipientID: Int
				public var recipientType: Mail.Header.GetCharactersCharacterIDMailRecipients.GetCharactersCharacterIDMailRecipientType
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let recipientID = dictionary["recipient_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.recipientID = recipientID
					guard let recipientType = Mail.Header.GetCharactersCharacterIDMailRecipients.GetCharactersCharacterIDMailRecipientType(rawValue: dictionary["recipient_type"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.recipientType = recipientType
					
					super.init()
				}
				
				override public init() {
					recipientID = Int()
					recipientType = Mail.Header.GetCharactersCharacterIDMailRecipients.GetCharactersCharacterIDMailRecipientType()
					
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					recipientID = aDecoder.decodeInteger(forKey: "recipient_id")
					recipientType = Mail.Header.GetCharactersCharacterIDMailRecipients.GetCharactersCharacterIDMailRecipientType(rawValue: aDecoder.decodeObject(forKey: "recipient_type") as? String ?? "") ?? Mail.Header.GetCharactersCharacterIDMailRecipients.GetCharactersCharacterIDMailRecipientType()
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(recipientID, forKey: "recipient_id")
					aCoder.encode(recipientType.rawValue, forKey: "recipient_type")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["recipient_id"] = recipientID.json
					json["recipient_type"] = recipientType.json
					return json
				}
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: recipientID.hashValue)
					hashCombine(seed: &hash, value: recipientType.hashValue)
					return hash
				}
				
				public static func ==(lhs: Mail.Header.GetCharactersCharacterIDMailRecipients, rhs: Mail.Header.GetCharactersCharacterIDMailRecipients) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
			}
			
			public var from: Int?
			public var isRead: Bool?
			public var labels: [Int64]?
			public var mailID: Int64?
			public var recipients: [Mail.Header.GetCharactersCharacterIDMailRecipients]?
			public var subject: String?
			public var timestamp: Date?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				from = dictionary["from"] as? Int
				isRead = dictionary["is_read"] as? Bool
				labels = try (dictionary["labels"] as? [Any])?.map {try Int64(json: $0)}
				mailID = dictionary["mail_id"] as? Int64
				recipients = try (dictionary["recipients"] as? [Any])?.map {try Mail.Header.GetCharactersCharacterIDMailRecipients(json: $0)}
				subject = dictionary["subject"] as? String
				timestamp = DateFormatter.esiDateFormatter.date(from: dictionary["timestamp"] as? String ?? "")
				
				super.init()
			}
			
			override public init() {
				from = nil
				isRead = nil
				labels = nil
				mailID = nil
				recipients = nil
				subject = nil
				timestamp = nil
				
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				from = aDecoder.containsValue(forKey: "from") ? aDecoder.decodeInteger(forKey: "from") : nil
				isRead = aDecoder.containsValue(forKey: "is_read") ? aDecoder.decodeBool(forKey: "is_read") : nil
				labels = aDecoder.decodeObject(forKey: "labels") as? [Int64]
				mailID = aDecoder.containsValue(forKey: "mail_id") ? aDecoder.decodeInt64(forKey: "mail_id") : nil
				recipients = aDecoder.decodeObject(forKey: "recipients") as? [Mail.Header.GetCharactersCharacterIDMailRecipients]
				subject = aDecoder.decodeObject(forKey: "subject") as? String
				timestamp = aDecoder.decodeObject(forKey: "timestamp") as? Date
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = from {
					aCoder.encode(v, forKey: "from")
				}
				if let v = isRead {
					aCoder.encode(v, forKey: "is_read")
				}
				if let v = labels {
					aCoder.encode(v, forKey: "labels")
				}
				if let v = mailID {
					aCoder.encode(v, forKey: "mail_id")
				}
				if let v = recipients {
					aCoder.encode(v, forKey: "recipients")
				}
				if let v = subject {
					aCoder.encode(v, forKey: "subject")
				}
				if let v = timestamp {
					aCoder.encode(v, forKey: "timestamp")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = from?.json {
					json["from"] = v
				}
				if let v = isRead?.json {
					json["is_read"] = v
				}
				if let v = labels?.json {
					json["labels"] = v
				}
				if let v = mailID?.json {
					json["mail_id"] = v
				}
				if let v = recipients?.json {
					json["recipients"] = v
				}
				if let v = subject?.json {
					json["subject"] = v
				}
				if let v = timestamp?.json {
					json["timestamp"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: from?.hashValue ?? 0)
				hashCombine(seed: &hash, value: isRead?.hashValue ?? 0)
				labels?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: mailID?.hashValue ?? 0)
				recipients?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: subject?.hashValue ?? 0)
				hashCombine(seed: &hash, value: timestamp?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Mail.Header, rhs: Mail.Header) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PostCharactersCharacterIDMailLabelsForbidden: NSObject, NSCoding , JSONCoding {
			
			
			public var error: String?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				error = nil
				
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
			
			public static func ==(lhs: Mail.PostCharactersCharacterIDMailLabelsForbidden, rhs: Mail.PostCharactersCharacterIDMailLabelsForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class DeleteCharactersCharacterIDMailLabelsLabelIDInternalServerError: NSObject, NSCoding , JSONCoding {
			
			
			public var error: String?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				error = nil
				
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
			
			public static func ==(lhs: Mail.DeleteCharactersCharacterIDMailLabelsLabelIDInternalServerError, rhs: Mail.DeleteCharactersCharacterIDMailLabelsLabelIDInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PutCharactersCharacterIDMailMailIDBadRequest: NSObject, NSCoding , JSONCoding {
			
			
			public var error: String?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				error = nil
				
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
			
			public static func ==(lhs: Mail.PutCharactersCharacterIDMailMailIDBadRequest, rhs: Mail.PutCharactersCharacterIDMailMailIDBadRequest) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PostCharactersCharacterIDMailInternalServerError: NSObject, NSCoding , JSONCoding {
			
			
			public var error: String?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				error = nil
				
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
			
			public static func ==(lhs: Mail.PostCharactersCharacterIDMailInternalServerError, rhs: Mail.PostCharactersCharacterIDMailInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class DeleteCharactersCharacterIDMailMailIDInternalServerError: NSObject, NSCoding , JSONCoding {
			
			
			public var error: String?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				error = nil
				
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
			
			public static func ==(lhs: Mail.DeleteCharactersCharacterIDMailMailIDInternalServerError, rhs: Mail.DeleteCharactersCharacterIDMailMailIDInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDMailListsForbidden: NSObject, NSCoding , JSONCoding {
			
			
			public var error: String?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				error = nil
				
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
			
			public static func ==(lhs: Mail.GetCharactersCharacterIDMailListsForbidden, rhs: Mail.GetCharactersCharacterIDMailListsForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class MailLabelsAndUnreadCounts: NSObject, NSCoding , JSONCoding {
			
			public class GetCharactersCharacterIDMailLabelsLabels: NSObject, NSCoding , JSONCoding {
				
				public enum GetCharactersCharacterIDMailLabelsColor: String, JSONCoding {
					case h0000fe = "#0000fe"
					case h006634 = "#006634"
					case h0099ff = "#0099ff"
					case h00ff33 = "#00ff33"
					case h01ffff = "#01ffff"
					case h349800 = "#349800"
					case h660066 = "#660066"
					case h666666 = "#666666"
					case h999999 = "#999999"
					case h99ffff = "#99ffff"
					case h9a0000 = "#9a0000"
					case hccff9a = "#ccff9a"
					case he6e6e6 = "#e6e6e6"
					case hfe0000 = "#fe0000"
					case hff6600 = "#ff6600"
					case hffff01 = "#ffff01"
					case hffffcd = "#ffffcd"
					case hffffff = "#ffffff"
					
					public init() {
						self = .hffffff
					}
					
					public var json: Any {
						return self.rawValue
					}
					
					public init(json: Any) throws {
						guard let s = json as? String, let v = GetCharactersCharacterIDMailLabelsColor(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
						self = v
					}
					
				}
				
				public var color: Mail.MailLabelsAndUnreadCounts.GetCharactersCharacterIDMailLabelsLabels.GetCharactersCharacterIDMailLabelsColor?
				public var labelID: Int?
				public var name: String?
				public var unreadCount: Int?
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					color = Mail.MailLabelsAndUnreadCounts.GetCharactersCharacterIDMailLabelsLabels.GetCharactersCharacterIDMailLabelsColor(rawValue: dictionary["color"] as? String ?? "")
					labelID = dictionary["label_id"] as? Int
					name = dictionary["name"] as? String
					unreadCount = dictionary["unread_count"] as? Int
					
					super.init()
				}
				
				override public init() {
					color = nil
					labelID = nil
					name = nil
					unreadCount = nil
					
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					color = Mail.MailLabelsAndUnreadCounts.GetCharactersCharacterIDMailLabelsLabels.GetCharactersCharacterIDMailLabelsColor(rawValue: aDecoder.decodeObject(forKey: "color") as? String ?? "")
					labelID = aDecoder.containsValue(forKey: "label_id") ? aDecoder.decodeInteger(forKey: "label_id") : nil
					name = aDecoder.decodeObject(forKey: "name") as? String
					unreadCount = aDecoder.containsValue(forKey: "unread_count") ? aDecoder.decodeInteger(forKey: "unread_count") : nil
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					if let v = color {
						aCoder.encode(v.rawValue, forKey: "color")
					}
					if let v = labelID {
						aCoder.encode(v, forKey: "label_id")
					}
					if let v = name {
						aCoder.encode(v, forKey: "name")
					}
					if let v = unreadCount {
						aCoder.encode(v, forKey: "unread_count")
					}
				}
				
				public var json: Any {
					var json = [String: Any]()
					if let v = color?.json {
						json["color"] = v
					}
					if let v = labelID?.json {
						json["label_id"] = v
					}
					if let v = name?.json {
						json["name"] = v
					}
					if let v = unreadCount?.json {
						json["unread_count"] = v
					}
					return json
				}
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: color?.hashValue ?? 0)
					hashCombine(seed: &hash, value: labelID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: name?.hashValue ?? 0)
					hashCombine(seed: &hash, value: unreadCount?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: Mail.MailLabelsAndUnreadCounts.GetCharactersCharacterIDMailLabelsLabels, rhs: Mail.MailLabelsAndUnreadCounts.GetCharactersCharacterIDMailLabelsLabels) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
			}
			
			public var labels: [Mail.MailLabelsAndUnreadCounts.GetCharactersCharacterIDMailLabelsLabels]?
			public var totalUnreadCount: Int?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				labels = try (dictionary["labels"] as? [Any])?.map {try Mail.MailLabelsAndUnreadCounts.GetCharactersCharacterIDMailLabelsLabels(json: $0)}
				totalUnreadCount = dictionary["total_unread_count"] as? Int
				
				super.init()
			}
			
			override public init() {
				labels = nil
				totalUnreadCount = nil
				
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				labels = aDecoder.decodeObject(forKey: "labels") as? [Mail.MailLabelsAndUnreadCounts.GetCharactersCharacterIDMailLabelsLabels]
				totalUnreadCount = aDecoder.containsValue(forKey: "total_unread_count") ? aDecoder.decodeInteger(forKey: "total_unread_count") : nil
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = labels {
					aCoder.encode(v, forKey: "labels")
				}
				if let v = totalUnreadCount {
					aCoder.encode(v, forKey: "total_unread_count")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = labels?.json {
					json["labels"] = v
				}
				if let v = totalUnreadCount?.json {
					json["total_unread_count"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				labels?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: totalUnreadCount?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Mail.MailLabelsAndUnreadCounts, rhs: Mail.MailLabelsAndUnreadCounts) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class Subscription: NSObject, NSCoding , JSONCoding {
			
			
			public var mailingListID: Int
			public var name: String
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let mailingListID = dictionary["mailing_list_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.mailingListID = mailingListID
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.name = name
				
				super.init()
			}
			
			override public init() {
				mailingListID = Int()
				name = String()
				
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				mailingListID = aDecoder.decodeInteger(forKey: "mailing_list_id")
				name = aDecoder.decodeObject(forKey: "name") as? String ?? String()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(mailingListID, forKey: "mailing_list_id")
				aCoder.encode(name, forKey: "name")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["mailing_list_id"] = mailingListID.json
				json["name"] = name.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: mailingListID.hashValue)
				hashCombine(seed: &hash, value: name.hashValue)
				return hash
			}
			
			public static func ==(lhs: Mail.Subscription, rhs: Mail.Subscription) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PutCharactersCharacterIDMailMailIDForbidden: NSObject, NSCoding , JSONCoding {
			
			
			public var error: String?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				error = nil
				
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
			
			public static func ==(lhs: Mail.PutCharactersCharacterIDMailMailIDForbidden, rhs: Mail.PutCharactersCharacterIDMailMailIDForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PutCharactersCharacterIDMailMailIDInternalServerError: NSObject, NSCoding , JSONCoding {
			
			
			public var error: String?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				error = nil
				
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
			
			public static func ==(lhs: Mail.PutCharactersCharacterIDMailMailIDInternalServerError, rhs: Mail.PutCharactersCharacterIDMailMailIDInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class MailBody: NSObject, NSCoding , JSONCoding {
			
			public class GetCharactersCharacterIDMailMailIDRecipients: NSObject, NSCoding , JSONCoding {
				
				public enum GetCharactersCharacterIDMailMailIDRecipientType: String, JSONCoding {
					case alliance = "alliance"
					case character = "character"
					case corporation = "corporation"
					case mailingList = "mailing_list"
					
					public init() {
						self = .alliance
					}
					
					public var json: Any {
						return self.rawValue
					}
					
					public init(json: Any) throws {
						guard let s = json as? String, let v = GetCharactersCharacterIDMailMailIDRecipientType(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
						self = v
					}
					
				}
				
				public var recipientID: Int
				public var recipientType: Mail.MailBody.GetCharactersCharacterIDMailMailIDRecipients.GetCharactersCharacterIDMailMailIDRecipientType
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let recipientID = dictionary["recipient_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.recipientID = recipientID
					guard let recipientType = Mail.MailBody.GetCharactersCharacterIDMailMailIDRecipients.GetCharactersCharacterIDMailMailIDRecipientType(rawValue: dictionary["recipient_type"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.recipientType = recipientType
					
					super.init()
				}
				
				override public init() {
					recipientID = Int()
					recipientType = Mail.MailBody.GetCharactersCharacterIDMailMailIDRecipients.GetCharactersCharacterIDMailMailIDRecipientType()
					
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					recipientID = aDecoder.decodeInteger(forKey: "recipient_id")
					recipientType = Mail.MailBody.GetCharactersCharacterIDMailMailIDRecipients.GetCharactersCharacterIDMailMailIDRecipientType(rawValue: aDecoder.decodeObject(forKey: "recipient_type") as? String ?? "") ?? Mail.MailBody.GetCharactersCharacterIDMailMailIDRecipients.GetCharactersCharacterIDMailMailIDRecipientType()
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(recipientID, forKey: "recipient_id")
					aCoder.encode(recipientType.rawValue, forKey: "recipient_type")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["recipient_id"] = recipientID.json
					json["recipient_type"] = recipientType.json
					return json
				}
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: recipientID.hashValue)
					hashCombine(seed: &hash, value: recipientType.hashValue)
					return hash
				}
				
				public static func ==(lhs: Mail.MailBody.GetCharactersCharacterIDMailMailIDRecipients, rhs: Mail.MailBody.GetCharactersCharacterIDMailMailIDRecipients) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
			}
			
			public var body: String?
			public var from: Int?
			public var labels: [Int64]?
			public var read: Bool?
			public var recipients: [Mail.MailBody.GetCharactersCharacterIDMailMailIDRecipients]?
			public var subject: String?
			public var timestamp: Date?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				body = dictionary["body"] as? String
				from = dictionary["from"] as? Int
				labels = try (dictionary["labels"] as? [Any])?.map {try Int64(json: $0)}
				read = dictionary["read"] as? Bool
				recipients = try (dictionary["recipients"] as? [Any])?.map {try Mail.MailBody.GetCharactersCharacterIDMailMailIDRecipients(json: $0)}
				subject = dictionary["subject"] as? String
				timestamp = DateFormatter.esiDateFormatter.date(from: dictionary["timestamp"] as? String ?? "")
				
				super.init()
			}
			
			override public init() {
				body = nil
				from = nil
				labels = nil
				read = nil
				recipients = nil
				subject = nil
				timestamp = nil
				
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				body = aDecoder.decodeObject(forKey: "body") as? String
				from = aDecoder.containsValue(forKey: "from") ? aDecoder.decodeInteger(forKey: "from") : nil
				labels = aDecoder.decodeObject(forKey: "labels") as? [Int64]
				read = aDecoder.containsValue(forKey: "read") ? aDecoder.decodeBool(forKey: "read") : nil
				recipients = aDecoder.decodeObject(forKey: "recipients") as? [Mail.MailBody.GetCharactersCharacterIDMailMailIDRecipients]
				subject = aDecoder.decodeObject(forKey: "subject") as? String
				timestamp = aDecoder.decodeObject(forKey: "timestamp") as? Date
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = body {
					aCoder.encode(v, forKey: "body")
				}
				if let v = from {
					aCoder.encode(v, forKey: "from")
				}
				if let v = labels {
					aCoder.encode(v, forKey: "labels")
				}
				if let v = read {
					aCoder.encode(v, forKey: "read")
				}
				if let v = recipients {
					aCoder.encode(v, forKey: "recipients")
				}
				if let v = subject {
					aCoder.encode(v, forKey: "subject")
				}
				if let v = timestamp {
					aCoder.encode(v, forKey: "timestamp")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = body?.json {
					json["body"] = v
				}
				if let v = from?.json {
					json["from"] = v
				}
				if let v = labels?.json {
					json["labels"] = v
				}
				if let v = read?.json {
					json["read"] = v
				}
				if let v = recipients?.json {
					json["recipients"] = v
				}
				if let v = subject?.json {
					json["subject"] = v
				}
				if let v = timestamp?.json {
					json["timestamp"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: body?.hashValue ?? 0)
				hashCombine(seed: &hash, value: from?.hashValue ?? 0)
				labels?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: read?.hashValue ?? 0)
				recipients?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: subject?.hashValue ?? 0)
				hashCombine(seed: &hash, value: timestamp?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Mail.MailBody, rhs: Mail.MailBody) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PostCharactersCharacterIDMailLabelsInternalServerError: NSObject, NSCoding , JSONCoding {
			
			
			public var error: String?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				error = nil
				
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
			
			public static func ==(lhs: Mail.PostCharactersCharacterIDMailLabelsInternalServerError, rhs: Mail.PostCharactersCharacterIDMailLabelsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class UpdateContents: NSObject, NSCoding , JSONCoding {
			
			
			public var labels: [Int64]?
			public var read: Bool?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				labels = try (dictionary["labels"] as? [Any])?.map {try Int64(json: $0)}
				read = dictionary["read"] as? Bool
				
				super.init()
			}
			
			override public init() {
				labels = nil
				read = nil
				
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				labels = aDecoder.decodeObject(forKey: "labels") as? [Int64]
				read = aDecoder.containsValue(forKey: "read") ? aDecoder.decodeBool(forKey: "read") : nil
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = labels {
					aCoder.encode(v, forKey: "labels")
				}
				if let v = read {
					aCoder.encode(v, forKey: "read")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = labels?.json {
					json["labels"] = v
				}
				if let v = read?.json {
					json["read"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				labels?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: read?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Mail.UpdateContents, rhs: Mail.UpdateContents) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDMailMailIDNotFound: NSObject, NSCoding , JSONCoding {
			
			
			public var error: String?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				error = nil
				
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
			
			public static func ==(lhs: Mail.GetCharactersCharacterIDMailMailIDNotFound, rhs: Mail.GetCharactersCharacterIDMailMailIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDMailLabelsInternalServerError: NSObject, NSCoding , JSONCoding {
			
			
			public var error: String?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				error = nil
				
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
			
			public static func ==(lhs: Mail.GetCharactersCharacterIDMailLabelsInternalServerError, rhs: Mail.GetCharactersCharacterIDMailLabelsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDMailMailIDForbidden: NSObject, NSCoding , JSONCoding {
			
			
			public var error: String?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				error = nil
				
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
			
			public static func ==(lhs: Mail.GetCharactersCharacterIDMailMailIDForbidden, rhs: Mail.GetCharactersCharacterIDMailMailIDForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDMailMailIDInternalServerError: NSObject, NSCoding , JSONCoding {
			
			
			public var error: String?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				error = nil
				
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
			
			public static func ==(lhs: Mail.GetCharactersCharacterIDMailMailIDInternalServerError, rhs: Mail.GetCharactersCharacterIDMailMailIDInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PostCharactersCharacterIDMailForbidden: NSObject, NSCoding , JSONCoding {
			
			
			public var error: String?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				error = nil
				
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
			
			public static func ==(lhs: Mail.PostCharactersCharacterIDMailForbidden, rhs: Mail.PostCharactersCharacterIDMailForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class Label: NSObject, NSCoding , JSONCoding {
			
			public enum PostCharactersCharacterIDMailLabelsColor: String, JSONCoding {
				case h0000fe = "#0000fe"
				case h006634 = "#006634"
				case h0099ff = "#0099ff"
				case h00ff33 = "#00ff33"
				case h01ffff = "#01ffff"
				case h349800 = "#349800"
				case h660066 = "#660066"
				case h666666 = "#666666"
				case h999999 = "#999999"
				case h99ffff = "#99ffff"
				case h9a0000 = "#9a0000"
				case hccff9a = "#ccff9a"
				case he6e6e6 = "#e6e6e6"
				case hfe0000 = "#fe0000"
				case hff6600 = "#ff6600"
				case hffff01 = "#ffff01"
				case hffffcd = "#ffffcd"
				case hffffff = "#ffffff"
				
				public init() {
					self = .hffffff
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = PostCharactersCharacterIDMailLabelsColor(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
					self = v
				}
				
			}
			
			public var color: Mail.Label.PostCharactersCharacterIDMailLabelsColor?
			public var name: String
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				color = Mail.Label.PostCharactersCharacterIDMailLabelsColor(rawValue: dictionary["color"] as? String ?? "")
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.name = name
				
				super.init()
			}
			
			override public init() {
				color = nil
				name = String()
				
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				color = Mail.Label.PostCharactersCharacterIDMailLabelsColor(rawValue: aDecoder.decodeObject(forKey: "color") as? String ?? "")
				name = aDecoder.decodeObject(forKey: "name") as? String ?? String()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = color {
					aCoder.encode(v.rawValue, forKey: "color")
				}
				aCoder.encode(name, forKey: "name")
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = color?.json {
					json["color"] = v
				}
				json["name"] = name.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: color?.hashValue ?? 0)
				hashCombine(seed: &hash, value: name.hashValue)
				return hash
			}
			
			public static func ==(lhs: Mail.Label, rhs: Mail.Label) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PostCharactersCharacterIDMailBadRequest: NSObject, NSCoding , JSONCoding {
			
			
			public var error: String?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				error = nil
				
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
			
			public static func ==(lhs: Mail.PostCharactersCharacterIDMailBadRequest, rhs: Mail.PostCharactersCharacterIDMailBadRequest) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDMailListsInternalServerError: NSObject, NSCoding , JSONCoding {
			
			
			public var error: String?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				error = nil
				
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
			
			public static func ==(lhs: Mail.GetCharactersCharacterIDMailListsInternalServerError, rhs: Mail.GetCharactersCharacterIDMailListsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class NewMail: NSObject, NSCoding , JSONCoding {
			
			public class PostCharactersCharacterIDMailRecipients: NSObject, NSCoding , JSONCoding {
				
				public enum PostCharactersCharacterIDMailRecipientType: String, JSONCoding {
					case alliance = "alliance"
					case character = "character"
					case corporation = "corporation"
					case mailingList = "mailing_list"
					
					public init() {
						self = .alliance
					}
					
					public var json: Any {
						return self.rawValue
					}
					
					public init(json: Any) throws {
						guard let s = json as? String, let v = PostCharactersCharacterIDMailRecipientType(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
						self = v
					}
					
				}
				
				public var recipientID: Int
				public var recipientType: Mail.NewMail.PostCharactersCharacterIDMailRecipients.PostCharactersCharacterIDMailRecipientType
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let recipientID = dictionary["recipient_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.recipientID = recipientID
					guard let recipientType = Mail.NewMail.PostCharactersCharacterIDMailRecipients.PostCharactersCharacterIDMailRecipientType(rawValue: dictionary["recipient_type"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.recipientType = recipientType
					
					super.init()
				}
				
				override public init() {
					recipientID = Int()
					recipientType = Mail.NewMail.PostCharactersCharacterIDMailRecipients.PostCharactersCharacterIDMailRecipientType()
					
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					recipientID = aDecoder.decodeInteger(forKey: "recipient_id")
					recipientType = Mail.NewMail.PostCharactersCharacterIDMailRecipients.PostCharactersCharacterIDMailRecipientType(rawValue: aDecoder.decodeObject(forKey: "recipient_type") as? String ?? "") ?? Mail.NewMail.PostCharactersCharacterIDMailRecipients.PostCharactersCharacterIDMailRecipientType()
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(recipientID, forKey: "recipient_id")
					aCoder.encode(recipientType.rawValue, forKey: "recipient_type")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["recipient_id"] = recipientID.json
					json["recipient_type"] = recipientType.json
					return json
				}
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: recipientID.hashValue)
					hashCombine(seed: &hash, value: recipientType.hashValue)
					return hash
				}
				
				public static func ==(lhs: Mail.NewMail.PostCharactersCharacterIDMailRecipients, rhs: Mail.NewMail.PostCharactersCharacterIDMailRecipients) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
			}
			
			public var approvedCost: Int64?
			public var body: String
			public var recipients: [Mail.NewMail.PostCharactersCharacterIDMailRecipients]
			public var subject: String
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				approvedCost = dictionary["approved_cost"] as? Int64
				guard let body = dictionary["body"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.body = body
				recipients = try (dictionary["recipients"] as? [Any])?.map {try Mail.NewMail.PostCharactersCharacterIDMailRecipients(json: $0)} ?? []
				guard let subject = dictionary["subject"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.subject = subject
				
				super.init()
			}
			
			override public init() {
				approvedCost = nil
				body = String()
				recipients = []
				subject = String()
				
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				approvedCost = aDecoder.containsValue(forKey: "approved_cost") ? aDecoder.decodeInt64(forKey: "approved_cost") : nil
				body = aDecoder.decodeObject(forKey: "body") as? String ?? String()
				recipients = aDecoder.decodeObject(forKey: "recipients") as? [Mail.NewMail.PostCharactersCharacterIDMailRecipients] ?? []
				subject = aDecoder.decodeObject(forKey: "subject") as? String ?? String()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = approvedCost {
					aCoder.encode(v, forKey: "approved_cost")
				}
				aCoder.encode(body, forKey: "body")
				aCoder.encode(recipients, forKey: "recipients")
				aCoder.encode(subject, forKey: "subject")
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = approvedCost?.json {
					json["approved_cost"] = v
				}
				json["body"] = body.json
				json["recipients"] = recipients.json
				json["subject"] = subject.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: approvedCost?.hashValue ?? 0)
				hashCombine(seed: &hash, value: body.hashValue)
				recipients.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: subject.hashValue)
				return hash
			}
			
			public static func ==(lhs: Mail.NewMail, rhs: Mail.NewMail) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDMailInternalServerError: NSObject, NSCoding , JSONCoding {
			
			
			public var error: String?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				error = nil
				
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
			
			public static func ==(lhs: Mail.GetCharactersCharacterIDMailInternalServerError, rhs: Mail.GetCharactersCharacterIDMailInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDMailForbidden: NSObject, NSCoding , JSONCoding {
			
			
			public var error: String?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				error = nil
				
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
			
			public static func ==(lhs: Mail.GetCharactersCharacterIDMailForbidden, rhs: Mail.GetCharactersCharacterIDMailForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
	}
	
}
