import Foundation
import Alamofire


public extension ESI {
	public var userInterface: UserInterface {
		return UserInterface(sessionManager: self)
	}
	
	class UserInterface {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		public func openMarketDetails(typeID: Int, completionBlock:((Result<String>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-ui.open_window.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = typeID.httpQuery {
				query.append(URLQueryItem(name: "type_id", value: v))
			}
			
			let url = session!.baseURL + "latest/ui/openwindow/marketdetails/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<String>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func setAutopilotWaypoint(addToBeginning: Bool, clearOtherWaypoints: Bool, destinationID: Int64, completionBlock:((Result<String>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-ui.write_waypoint.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = addToBeginning.httpQuery {
				query.append(URLQueryItem(name: "add_to_beginning", value: v))
			}
			if let v = clearOtherWaypoints.httpQuery {
				query.append(URLQueryItem(name: "clear_other_waypoints", value: v))
			}
			if let v = destinationID.httpQuery {
				query.append(URLQueryItem(name: "destination_id", value: v))
			}
			
			let url = session!.baseURL + "latest/ui/autopilot/waypoint/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<String>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func openInformationWindow(targetID: Int, completionBlock:((Result<String>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-ui.open_window.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = targetID.httpQuery {
				query.append(URLQueryItem(name: "target_id", value: v))
			}
			
			let url = session!.baseURL + "latest/ui/openwindow/information/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<String>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func openContractWindow(contractID: Int, completionBlock:((Result<String>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-ui.open_window.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = contractID.httpQuery {
				query.append(URLQueryItem(name: "contract_id", value: v))
			}
			
			let url = session!.baseURL + "latest/ui/openwindow/contract/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<String>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func openNewMailWindow(newMail: UserInterface.NewMail, completionBlock:((Result<String>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-ui.open_window.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body = try? JSONSerialization.data(withJSONObject: newMail.json, options: [])
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/ui/openwindow/newmail/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<String>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		@objc(ESIUserInterfacePostUiOpenwindowNewmailUnprocessableEntity) public class PostUiOpenwindowNewmailUnprocessableEntity: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.error?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: UserInterface.PostUiOpenwindowNewmailUnprocessableEntity, rhs: UserInterface.PostUiOpenwindowNewmailUnprocessableEntity) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: UserInterface.PostUiOpenwindowNewmailUnprocessableEntity) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return UserInterface.PostUiOpenwindowNewmailUnprocessableEntity(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? PostUiOpenwindowNewmailUnprocessableEntity)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIUserInterfaceNewMail) public class NewMail: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var body: String = String()
			public var recipients: [Int] = []
			public var subject: String = String()
			public var toCorpOrAllianceID: Int? = nil
			public var toMailingListID: Int? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let body = dictionary["body"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.body = body
				recipients = try (dictionary["recipients"] as? [Any])?.map {try Int(json: $0)} ?? []
				guard let subject = dictionary["subject"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.subject = subject
				toCorpOrAllianceID = dictionary["to_corp_or_alliance_id"] as? Int
				toMailingListID = dictionary["to_mailing_list_id"] as? Int
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				body = aDecoder.decodeObject(forKey: "body") as? String ?? String()
				recipients = aDecoder.decodeObject(forKey: "recipients") as? [Int] ?? []
				subject = aDecoder.decodeObject(forKey: "subject") as? String ?? String()
				toCorpOrAllianceID = aDecoder.containsValue(forKey: "to_corp_or_alliance_id") ? aDecoder.decodeInteger(forKey: "to_corp_or_alliance_id") : nil
				toMailingListID = aDecoder.containsValue(forKey: "to_mailing_list_id") ? aDecoder.decodeInteger(forKey: "to_mailing_list_id") : nil
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(body, forKey: "body")
				aCoder.encode(recipients, forKey: "recipients")
				aCoder.encode(subject, forKey: "subject")
				if let v = toCorpOrAllianceID {
					aCoder.encode(v, forKey: "to_corp_or_alliance_id")
				}
				if let v = toMailingListID {
					aCoder.encode(v, forKey: "to_mailing_list_id")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["body"] = body.json
				json["recipients"] = recipients.json
				json["subject"] = subject.json
				if let v = toCorpOrAllianceID?.json {
					json["to_corp_or_alliance_id"] = v
				}
				if let v = toMailingListID?.json {
					json["to_mailing_list_id"] = v
				}
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.body.hashValue)
				self.recipients.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: self.subject.hashValue)
				hashCombine(seed: &hash, value: self.toCorpOrAllianceID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.toMailingListID?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: UserInterface.NewMail, rhs: UserInterface.NewMail) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: UserInterface.NewMail) {
				body = other.body
				recipients = other.recipients.flatMap { $0 }
				subject = other.subject
				toCorpOrAllianceID = other.toCorpOrAllianceID
				toMailingListID = other.toMailingListID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return UserInterface.NewMail(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? NewMail)?.hashValue == hashValue
			}
			
		}
		
		
	}
	
}