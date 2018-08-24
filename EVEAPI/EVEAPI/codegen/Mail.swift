import Foundation
import Alamofire
import Futures


public extension ESI {
	public var mail: Mail {
		return Mail(esi: self)
	}
	
	struct Mail {
		let esi: ESI
		
		@discardableResult
		public func deleteMail(characterID: Int, mailID: Int) -> Future<ESI.Result<String>> {
			
			let scopes = (esi.sessionManager.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-mail.organize_mail.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/characters/\(characterID)/mail/\(mailID)/"
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
		
		@discardableResult
		public func updateMetadataAboutMail(characterID: Int, contents: Mail.UpdateContents, mailID: Int) -> Future<ESI.Result<String>> {
			
			let scopes = (esi.sessionManager.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-mail.organize_mail.v1") else {return .init(.failure(ESIError.forbidden))}
			let body = try? JSONEncoder().encode(contents)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/characters/\(characterID)/mail/\(mailID)/"
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
		public func returnMail(characterID: Int, ifNoneMatch: String? = nil, mailID: Int) -> Future<ESI.Result<Mail.MailBody>> {
			
			let scopes = (esi.sessionManager.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-mail.read_mail.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/characters/\(characterID)/mail/\(mailID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<Mail.MailBody>>()
			esi.perform { [weak esi] () -> DataRequest? in
				return esi?.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Mail.MailBody>) in
					promise.set(response: response, cached: 30.0)
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func createMailLabel(characterID: Int, label: Mail.Label) -> Future<ESI.Result<Int>> {
			
			let scopes = (esi.sessionManager.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-mail.organize_mail.v1") else {return .init(.failure(ESIError.forbidden))}
			let body = try? JSONEncoder().encode(label)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v2/characters/\(characterID)/mail/labels/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<Int>>()
			esi.perform { [weak esi] () -> DataRequest? in
				return esi?.sessionManager.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Int>) in
					promise.set(response: response, cached: nil)
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func returnMailingListSubscriptions(characterID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<[Mail.Subscription]>> {
			
			let scopes = (esi.sessionManager.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-mail.read_mail.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/characters/\(characterID)/mail/lists/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Mail.Subscription]>>()
			esi.perform { [weak esi] () -> DataRequest? in
				return esi?.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Mail.Subscription]>) in
					promise.set(response: response, cached: 120.0)
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getMailLabelsAndUnreadCounts(characterID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<Mail.MailLabelsAndUnreadCounts>> {
			
			let scopes = (esi.sessionManager.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-mail.read_mail.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v3/characters/\(characterID)/mail/labels/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<Mail.MailLabelsAndUnreadCounts>>()
			esi.perform { [weak esi] () -> DataRequest? in
				return esi?.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Mail.MailLabelsAndUnreadCounts>) in
					promise.set(response: response, cached: 30.0)
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func sendNewMail(characterID: Int, mail: Mail.NewMail) -> Future<ESI.Result<Int>> {
			
			let scopes = (esi.sessionManager.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-mail.send_mail.v1") else {return .init(.failure(ESIError.forbidden))}
			let body = try? JSONEncoder().encode(mail)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/characters/\(characterID)/mail/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<Int>>()
			esi.perform { [weak esi] () -> DataRequest? in
				return esi?.sessionManager.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Int>) in
					promise.set(response: response, cached: nil)
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func returnMailHeaders(characterID: Int, ifNoneMatch: String? = nil, labels: [Int]? = nil, lastMailID: Int? = nil) -> Future<ESI.Result<[Mail.Header]>> {
			
			let scopes = (esi.sessionManager.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-mail.read_mail.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = labels?.httpQuery {
				query.append(URLQueryItem(name: "labels", value: v))
			}
			if let v = lastMailID?.httpQuery {
				query.append(URLQueryItem(name: "last_mail_id", value: v))
			}
			
			let url = esi.baseURL + "/v1/characters/\(characterID)/mail/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Mail.Header]>>()
			esi.perform { [weak esi] () -> DataRequest? in
				return esi?.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Mail.Header]>) in
					promise.set(response: response, cached: 30.0)
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func deleteMailLabel(characterID: Int, labelID: Int) -> Future<ESI.Result<String>> {
			
			let scopes = (esi.sessionManager.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-mail.organize_mail.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/characters/\(characterID)/mail/labels/\(labelID)/"
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
			
			public var recipientID: Int
			public var recipientType: Mail.Recipient.RecipientType
			
			public init(recipientID: Int, recipientType: Mail.Recipient.RecipientType) {
				self.recipientID = recipientID
				self.recipientType = recipientType
			}
			
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
		
		
		public struct UpdateContents: Codable, Hashable {
			
			
			public var labels: [Int]?
			public var read: Bool?
			
			public init(labels: [Int]?, read: Bool?) {
				self.labels = labels
				self.read = read
			}
			
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
		
		
		public struct GetCharactersCharacterIDMailMailIDNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
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
		
		
		public struct DeleteCharactersCharacterIDMailLabelsLabelIDUnprocessableEntity: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
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
			
			
			public var approvedCost: Int64?
			public var body: String
			public var recipients: [Mail.Recipient]
			public var subject: String
			
			public init(approvedCost: Int64?, body: String, recipients: [Mail.Recipient], subject: String) {
				self.approvedCost = approvedCost
				self.body = body
				self.recipients = recipients
				self.subject = subject
			}
			
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
		
		
		public struct Header: Codable, Hashable {
			
			
			public var from: Int?
			public var isRead: Bool?
			public var labels: [Int]?
			public var mailID: Int?
			public var recipients: [Mail.Recipient]?
			public var subject: String?
			public var timestamp: Date?
			
			public init(from: Int?, isRead: Bool?, labels: [Int]?, mailID: Int?, recipients: [Mail.Recipient]?, subject: String?, timestamp: Date?) {
				self.from = from
				self.isRead = isRead
				self.labels = labels
				self.mailID = mailID
				self.recipients = recipients
				self.subject = subject
				self.timestamp = timestamp
			}
			
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
				
				public var color: Mail.MailLabelsAndUnreadCounts.Label.GetCharactersCharacterIDMailLabelsColor?
				public var labelID: Int?
				public var name: String?
				public var unreadCount: Int?
				
				public init(color: Mail.MailLabelsAndUnreadCounts.Label.GetCharactersCharacterIDMailLabelsColor?, labelID: Int?, name: String?, unreadCount: Int?) {
					self.color = color
					self.labelID = labelID
					self.name = name
					self.unreadCount = unreadCount
				}
				
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
			
			public var labels: [Mail.MailLabelsAndUnreadCounts.Label]?
			public var totalUnreadCount: Int?
			
			public init(labels: [Mail.MailLabelsAndUnreadCounts.Label]?, totalUnreadCount: Int?) {
				self.labels = labels
				self.totalUnreadCount = totalUnreadCount
			}
			
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
		
		
		public struct PostCharactersCharacterIDMailError520: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Mail.PostCharactersCharacterIDMailError520, rhs: Mail.PostCharactersCharacterIDMailError520) -> Bool {
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
			
			
			public var body: String?
			public var from: Int?
			public var labels: [Int]?
			public var read: Bool?
			public var recipients: [Mail.Recipient]?
			public var subject: String?
			public var timestamp: Date?
			
			public init(body: String?, from: Int?, labels: [Int]?, read: Bool?, recipients: [Mail.Recipient]?, subject: String?, timestamp: Date?) {
				self.body = body
				self.from = from
				self.labels = labels
				self.read = read
				self.recipients = recipients
				self.subject = subject
				self.timestamp = timestamp
			}
			
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
		
		
		public struct Subscription: Codable, Hashable {
			
			
			public var mailingListID: Int
			public var name: String
			
			public init(mailingListID: Int, name: String) {
				self.mailingListID = mailingListID
				self.name = name
			}
			
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
			
			public var color: Mail.Label.PostCharactersCharacterIDMailLabelsColor?
			public var name: String
			
			public init(color: Mail.Label.PostCharactersCharacterIDMailLabelsColor?, name: String) {
				self.color = color
				self.name = name
			}
			
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
