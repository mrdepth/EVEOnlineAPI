import Foundation
import Alamofire
import Combine


extension ESI {
	public var userInterface: UserInterface {
		return UserInterface(esi: self)
	}
	
	public struct UserInterface {
		let esi: ESI
		
		
		public func setAutopilotWaypoint(addToBeginning: Bool, clearOtherWaypoints: Bool, destinationID: Int64, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<String, AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-ui.write_waypoint.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			query.append(URLQueryItem(name: "add_to_beginning", value: addToBeginning.description))
			query.append(URLQueryItem(name: "clear_other_waypoints", value: clearOtherWaypoints.description))
			query.append(URLQueryItem(name: "destination_id", value: destinationID.description))
			
			        let url = ESI.apiURL.appendingPathComponent("/ui/autopilot/waypoint/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .post,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseString(queue: esi.session.serializationQueue)
			            .eraseToAnyPublisher()
		}
		
		
		public func openNewMailWindow(newMail: UserInterface.NewMail, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<String, AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-ui.open_window.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body = try? JSONEncoder().encode(newMail)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/ui/openwindow/newmail/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .post,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseString(queue: esi.session.serializationQueue)
			            .eraseToAnyPublisher()
		}
		
		
		public func openContractWindow(contractID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<String, AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-ui.open_window.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			query.append(URLQueryItem(name: "contract_id", value: contractID.description))
			
			        let url = ESI.apiURL.appendingPathComponent("/ui/openwindow/contract/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .post,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseString(queue: esi.session.serializationQueue)
			            .eraseToAnyPublisher()
		}
		
		
		public func openInformationWindow(targetID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<String, AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-ui.open_window.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			query.append(URLQueryItem(name: "target_id", value: targetID.description))
			
			        let url = ESI.apiURL.appendingPathComponent("/ui/openwindow/information/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .post,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseString(queue: esi.session.serializationQueue)
			            .eraseToAnyPublisher()
		}
		
		
		public func openMarketDetails(typeID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<String, AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-ui.open_window.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			query.append(URLQueryItem(name: "type_id", value: typeID.description))
			
			        let url = ESI.apiURL.appendingPathComponent("/ui/openwindow/marketdetails/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .post,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseString(queue: esi.session.serializationQueue)
			            .eraseToAnyPublisher()
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
		
		
		public struct PostUiOpenwindowNewmailUnprocessableEntity: Codable, Hashable {
			
			
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
		
		
	}
	
}
