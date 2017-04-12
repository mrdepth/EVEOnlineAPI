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
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-ui.open_window.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			parameters["type_id"] = typeID.json
			
			let url = session!.baseURL + "latest/ui/openwindow/marketdetails/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<String>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func setAutopilotWaypoint(addToBeginning: Bool, clearOtherWaypoints: Bool, destinationID: Int64, completionBlock:((Result<String>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-ui.write_waypoint.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			parameters["add_to_beginning"] = addToBeginning.json
			parameters["clear_other_waypoints"] = clearOtherWaypoints.json
			parameters["destination_id"] = destinationID.json
			
			let url = session!.baseURL + "latest/ui/autopilot/waypoint/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<String>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func openInformationWindow(targetID: Int, completionBlock:((Result<String>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-ui.open_window.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			parameters["target_id"] = targetID.json
			
			let url = session!.baseURL + "latest/ui/openwindow/information/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<String>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func openContractWindow(contractID: Int, completionBlock:((Result<String>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-ui.open_window.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			parameters["contract_id"] = contractID.json
			
			let url = session!.baseURL + "latest/ui/openwindow/contract/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<String>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func openNewMailWindow(newMail: UserInterface.NewMail, completionBlock:((Result<String>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-ui.open_window.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			parameters["new_mail"] = newMail.json
			
			let url = session!.baseURL + "latest/ui/openwindow/newmail/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<String>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		public class PostUiOpenwindowNewmailUnprocessableEntity: NSObject, NSCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: UserInterface.PostUiOpenwindowNewmailUnprocessableEntity, rhs: UserInterface.PostUiOpenwindowNewmailUnprocessableEntity) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PostUiOpenwindowContractForbidden: NSObject, NSCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: UserInterface.PostUiOpenwindowContractForbidden, rhs: UserInterface.PostUiOpenwindowContractForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PostUiAutopilotWaypointInternalServerError: NSObject, NSCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: UserInterface.PostUiAutopilotWaypointInternalServerError, rhs: UserInterface.PostUiAutopilotWaypointInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PostUiOpenwindowMarketdetailsInternalServerError: NSObject, NSCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: UserInterface.PostUiOpenwindowMarketdetailsInternalServerError, rhs: UserInterface.PostUiOpenwindowMarketdetailsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class NewMail: NSObject, NSCoding , JSONCoding {
			
			
			public var body: String
			public var recipients: [Int]
			public var subject: String
			public var toCorpOrAllianceID: Int?
			public var toMailingListID: Int?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let body = dictionary["body"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.body = body
				recipients = try (dictionary["recipients"] as? [Any])?.map {try Int(json: $0)} ?? []
				guard let subject = dictionary["subject"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.subject = subject
				toCorpOrAllianceID = dictionary["to_corp_or_alliance_id"] as? Int
				toMailingListID = dictionary["to_mailing_list_id"] as? Int
				
				super.init()
			}
			
			override public init() {
				body = String()
				recipients = []
				subject = String()
				toCorpOrAllianceID = nil
				toMailingListID = nil
				
				super.init()
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: body.hashValue)
				recipients.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: subject.hashValue)
				hashCombine(seed: &hash, value: toCorpOrAllianceID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: toMailingListID?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: UserInterface.NewMail, rhs: UserInterface.NewMail) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PostUiOpenwindowNewmailForbidden: NSObject, NSCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: UserInterface.PostUiOpenwindowNewmailForbidden, rhs: UserInterface.PostUiOpenwindowNewmailForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PostUiAutopilotWaypointForbidden: NSObject, NSCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: UserInterface.PostUiAutopilotWaypointForbidden, rhs: UserInterface.PostUiAutopilotWaypointForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PostUiOpenwindowContractInternalServerError: NSObject, NSCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: UserInterface.PostUiOpenwindowContractInternalServerError, rhs: UserInterface.PostUiOpenwindowContractInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PostUiOpenwindowInformationForbidden: NSObject, NSCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: UserInterface.PostUiOpenwindowInformationForbidden, rhs: UserInterface.PostUiOpenwindowInformationForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PostUiOpenwindowNewmailInternalServerError: NSObject, NSCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: UserInterface.PostUiOpenwindowNewmailInternalServerError, rhs: UserInterface.PostUiOpenwindowNewmailInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PostUiOpenwindowInformationInternalServerError: NSObject, NSCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: UserInterface.PostUiOpenwindowInformationInternalServerError, rhs: UserInterface.PostUiOpenwindowInformationInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PostUiOpenwindowMarketdetailsForbidden: NSObject, NSCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: UserInterface.PostUiOpenwindowMarketdetailsForbidden, rhs: UserInterface.PostUiOpenwindowMarketdetailsForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
	}
	
}
