import Foundation
import Alamofire
import Futures


public extension ESI {
	public var userInterface: UserInterface {
		return UserInterface(esi: self)
	}
	
	struct UserInterface {
		let esi: ESI
		
		@discardableResult
		public func openInformationWindow(targetID: Int) -> Future<ESI.Result<String>> {
			
			let scopes = (esi.sessionManager.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-ui.open_window.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = targetID.httpQuery {
				query.append(URLQueryItem(name: "target_id", value: v))
			}
			
			let url = esi.baseURL + "/v1/ui/openwindow/information/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<String>>()
			esi.perform { [weak esi] () -> DataRequest? in
				return esi?.sessionManager.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<String>) in
					promise.set(response: response, cached: nil)
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func setAutopilotWaypoint(addToBeginning: Bool, clearOtherWaypoints: Bool, destinationID: Int64) -> Future<ESI.Result<String>> {
			
			let scopes = (esi.sessionManager.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-ui.write_waypoint.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = addToBeginning.httpQuery {
				query.append(URLQueryItem(name: "add_to_beginning", value: v))
			}
			if let v = clearOtherWaypoints.httpQuery {
				query.append(URLQueryItem(name: "clear_other_waypoints", value: v))
			}
			if let v = destinationID.httpQuery {
				query.append(URLQueryItem(name: "destination_id", value: v))
			}
			
			let url = esi.baseURL + "/v2/ui/autopilot/waypoint/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<String>>()
			esi.perform { [weak esi] () -> DataRequest? in
				return esi?.sessionManager.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<String>) in
					promise.set(response: response, cached: nil)
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func openMarketDetails(typeID: Int) -> Future<ESI.Result<String>> {
			
			let scopes = (esi.sessionManager.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-ui.open_window.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = typeID.httpQuery {
				query.append(URLQueryItem(name: "type_id", value: v))
			}
			
			let url = esi.baseURL + "/v1/ui/openwindow/marketdetails/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<String>>()
			esi.perform { [weak esi] () -> DataRequest? in
				return esi?.sessionManager.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<String>) in
					promise.set(response: response, cached: nil)
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func openContractWindow(contractID: Int) -> Future<ESI.Result<String>> {
			
			let scopes = (esi.sessionManager.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-ui.open_window.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = contractID.httpQuery {
				query.append(URLQueryItem(name: "contract_id", value: v))
			}
			
			let url = esi.baseURL + "/v1/ui/openwindow/contract/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<String>>()
			esi.perform { [weak esi] () -> DataRequest? in
				return esi?.sessionManager.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<String>) in
					promise.set(response: response, cached: nil)
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func openNewMailWindow(newMail: UserInterface.NewMail) -> Future<ESI.Result<String>> {
			
			let scopes = (esi.sessionManager.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-ui.open_window.v1") else {return .init(.failure(ESIError.forbidden))}
			let body = try? JSONEncoder().encode(newMail)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/ui/openwindow/newmail/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<String>>()
			esi.perform { [weak esi] () -> DataRequest? in
				return esi?.sessionManager.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<String>) in
					promise.set(response: response, cached: nil)
				}
			}
			return promise.future
		}
		
		
		public struct PostUiOpenwindowNewmailUnprocessableEntity: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: UserInterface.PostUiOpenwindowNewmailUnprocessableEntity, rhs: UserInterface.PostUiOpenwindowNewmailUnprocessableEntity) -> Bool {
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
			
			
			public var body: String
			public var recipients: [Int]
			public var subject: String
			public var toCorpOrAllianceID: Int?
			public var toMailingListID: Int?
			
			public init(body: String, recipients: [Int], subject: String, toCorpOrAllianceID: Int?, toMailingListID: Int?) {
				self.body = body
				self.recipients = recipients
				self.subject = subject
				self.toCorpOrAllianceID = toCorpOrAllianceID
				self.toMailingListID = toMailingListID
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: body.hashValue)
				self.recipients.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: subject.hashValue)
				hashCombine(seed: &hash, value: toCorpOrAllianceID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: toMailingListID?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: UserInterface.NewMail, rhs: UserInterface.NewMail) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case body
				case recipients
				case subject
				case toCorpOrAllianceID = "to_corp_or_alliance_id"
				case toMailingListID = "to_mailing_list_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
	}
	
}
