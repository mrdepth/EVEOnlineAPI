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
		
		public func deleteMail(characterID: Int, mailID: Int, completionBlock:((Result<String>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-mail.organize_mail.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/mail/\(mailID)/"
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
		
		public func updateMetadataAboutMail(characterID: Int, contents: Mail.UpdateContents, mailID: Int, completionBlock:((Result<String>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-mail.organize_mail.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body = try? JSONEncoder().encode(contents)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/mail/\(mailID)/"
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
		
		public func returnMail(characterID: Int, mailID: Int, completionBlock:((Result<Mail.MailBody>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-mail.read_mail.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/mail/\(mailID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Mail.MailBody>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func createMailLabel(characterID: Int, label: Mail.Label? = nil, completionBlock:((Result<Int64>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-mail.organize_mail.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body = label != nil ? try? JSONEncoder().encode(label) : nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v2/characters/\(characterID)/mail/labels/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Int64>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func returnMailingListSubscriptions(characterID: Int, completionBlock:((Result<[Mail.Subscription]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-mail.read_mail.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/mail/lists/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Mail.Subscription]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getMailLabelsAndUnreadCounts(characterID: Int, completionBlock:((Result<Mail.MailLabelsAndUnreadCounts>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-mail.read_mail.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v3/characters/\(characterID)/mail/labels/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Mail.MailLabelsAndUnreadCounts>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func sendNewMail(characterID: Int, mail: Mail.NewMail, completionBlock:((Result<Int>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-mail.send_mail.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body = try? JSONEncoder().encode(mail)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/mail/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Int>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func returnMailHeaders(characterID: Int, labels: [Int64]? = nil, lastMailID: Int? = nil, completionBlock:((Result<[Mail.Header]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-mail.read_mail.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = labels?.httpQuery {
				query.append(URLQueryItem(name: "labels", value: v))
			}
			if let v = lastMailID?.httpQuery {
				query.append(URLQueryItem(name: "last_mail_id", value: v))
			}
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/mail/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Mail.Header]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func deleteMailLabel(characterID: Int, labelID: Int, completionBlock:((Result<String>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-mail.organize_mail.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/mail/labels/\(labelID)/"
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
		
		
		public struct Recipient: Codable, Hashable {
			
			public enum RecipientType: String, Codable, HTTPQueryable {
				case alliance = "alliance"
				case character = "character"
				case corporation = "corporation"
				case mailingList = "mailing_list"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public let recipientID: Int
			public let recipientType: Mail.Recipient.RecipientType
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: recipientID.hashValue)
				hashCombine(seed: &hash, value: recipientType.hashValue)
				return hash
			}
			
			public static func ==(lhs: Mail.Recipient, rhs: Mail.Recipient) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case recipientID = "recipient_id"
				case recipientType = "recipient_type"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct PutCharactersCharacterIDMailMailIDBadRequest: Codable, Hashable {
			
			
			public let error: String?
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Mail.PutCharactersCharacterIDMailMailIDBadRequest, rhs: Mail.PutCharactersCharacterIDMailMailIDBadRequest) -> Bool {
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
		
		
		public struct GetCharactersCharacterIDMailMailIDNotFound: Codable, Hashable {
			
			
			public let error: String?
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Mail.GetCharactersCharacterIDMailMailIDNotFound, rhs: Mail.GetCharactersCharacterIDMailMailIDNotFound) -> Bool {
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
		
		
		public struct UpdateContents: Codable, Hashable {
			
			
			public let labels: [Int64]?
			public let read: Bool?
			
			public var hashValue: Int {
				var hash: Int = 0
				self.labels?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: read?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Mail.UpdateContents, rhs: Mail.UpdateContents) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case labels
				case read
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct DeleteCharactersCharacterIDMailLabelsLabelIDUnprocessableEntity: Codable, Hashable {
			
			
			public let error: String?
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Mail.DeleteCharactersCharacterIDMailLabelsLabelIDUnprocessableEntity, rhs: Mail.DeleteCharactersCharacterIDMailLabelsLabelIDUnprocessableEntity) -> Bool {
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
		
		
		public struct NewMail: Codable, Hashable {
			
			
			public let approvedCost: Int64?
			public let body: String
			public let recipients: [Mail.Recipient]
			public let subject: String
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: approvedCost?.hashValue ?? 0)
				hashCombine(seed: &hash, value: body.hashValue)
				self.recipients.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: subject.hashValue)
				return hash
			}
			
			public static func ==(lhs: Mail.NewMail, rhs: Mail.NewMail) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case approvedCost = "approved_cost"
				case body
				case recipients
				case subject
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct MailLabelsAndUnreadCounts: Codable, Hashable {
			
			public struct Label: Codable, Hashable {
				
				public enum GetCharactersCharacterIDMailLabelsColor: String, Codable, HTTPQueryable {
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
					
					public var httpQuery: String? {
						return rawValue
					}
					
				}
				
				public let color: Mail.MailLabelsAndUnreadCounts.Label.GetCharactersCharacterIDMailLabelsColor?
				public let labelID: Int?
				public let name: String?
				public let unreadCount: Int?
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: color?.hashValue ?? 0)
					hashCombine(seed: &hash, value: labelID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: name?.hashValue ?? 0)
					hashCombine(seed: &hash, value: unreadCount?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: Mail.MailLabelsAndUnreadCounts.Label, rhs: Mail.MailLabelsAndUnreadCounts.Label) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case color
					case labelID = "label_id"
					case name
					case unreadCount = "unread_count"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public let labels: [Mail.MailLabelsAndUnreadCounts.Label]?
			public let totalUnreadCount: Int?
			
			public var hashValue: Int {
				var hash: Int = 0
				self.labels?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: totalUnreadCount?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Mail.MailLabelsAndUnreadCounts, rhs: Mail.MailLabelsAndUnreadCounts) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case labels
				case totalUnreadCount = "total_unread_count"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct Subscription: Codable, Hashable {
			
			
			public let mailingListID: Int
			public let name: String
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: mailingListID.hashValue)
				hashCombine(seed: &hash, value: name.hashValue)
				return hash
			}
			
			public static func ==(lhs: Mail.Subscription, rhs: Mail.Subscription) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case mailingListID = "mailing_list_id"
				case name
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct PostCharactersCharacterIDMailBadRequest: Codable, Hashable {
			
			
			public let error: String?
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Mail.PostCharactersCharacterIDMailBadRequest, rhs: Mail.PostCharactersCharacterIDMailBadRequest) -> Bool {
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
		
		
		public struct MailBody: Codable, Hashable {
			
			
			public let body: String?
			public let from: Int?
			public let labels: [Int64]?
			public let read: Bool?
			public let recipients: [Mail.Recipient]?
			public let subject: String?
			public let timestamp: Date?
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: body?.hashValue ?? 0)
				hashCombine(seed: &hash, value: from?.hashValue ?? 0)
				self.labels?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: read?.hashValue ?? 0)
				self.recipients?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: subject?.hashValue ?? 0)
				hashCombine(seed: &hash, value: timestamp?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Mail.MailBody, rhs: Mail.MailBody) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case body
				case from
				case labels
				case read
				case recipients
				case subject
				case timestamp
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .timestamp: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct Header: Codable, Hashable {
			
			
			public let from: Int?
			public let isRead: Bool?
			public let labels: [Int64]?
			public let mailID: Int64?
			public let recipients: [Mail.Recipient]?
			public let subject: String?
			public let timestamp: Date?
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: from?.hashValue ?? 0)
				hashCombine(seed: &hash, value: isRead?.hashValue ?? 0)
				self.labels?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: mailID?.hashValue ?? 0)
				self.recipients?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: subject?.hashValue ?? 0)
				hashCombine(seed: &hash, value: timestamp?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Mail.Header, rhs: Mail.Header) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case from
				case isRead = "is_read"
				case labels
				case mailID = "mail_id"
				case recipients
				case subject
				case timestamp
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .timestamp: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct Label: Codable, Hashable {
			
			public enum PostCharactersCharacterIDMailLabelsColor: String, Codable, HTTPQueryable {
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
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public let color: Mail.Label.PostCharactersCharacterIDMailLabelsColor?
			public let name: String
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: color?.hashValue ?? 0)
				hashCombine(seed: &hash, value: name.hashValue)
				return hash
			}
			
			public static func ==(lhs: Mail.Label, rhs: Mail.Label) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case color
				case name
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
	}
	
}
