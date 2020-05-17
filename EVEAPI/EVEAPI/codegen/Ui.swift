import Foundation
import Alamofire
import Combine


extension ESI {
	public var ui: UI {
		return UI(esi: self, route: .path("ui", next: .root(ESI.apiURL)))
	}
	
	public struct UI {
		let esi: ESI
		let route: APIRoute
		
		
		
		public func autopilot() -> Autopilot {
			Autopilot(esi: esi, route: .path("autopilot", next: route))
		}
		public func openwindow() -> Openwindow {
			Openwindow(esi: esi, route: .path("openwindow", next: route))
		}
		
		public struct Autopilot {
			let esi: ESI
			let route: APIRoute
			
			
			
			public func waypoint() -> Waypoint {
				Waypoint(esi: esi, route: .path("waypoint", next: route))
			}
			
			public struct Waypoint {
				let esi: ESI
				let route: APIRoute
				
				
				public func post(addToBeginning: Bool = false, clearOtherWaypoints: Bool = false, destinationID: Int64, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<Void>, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-ui.write_waypoint.v1") else {throw ESIError.forbidden}
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						headers["Content-Type"] = "application/json"
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						query.append(URLQueryItem(name: "add_to_beginning", value: addToBeginning.description))
						query.append(URLQueryItem(name: "clear_other_waypoints", value: clearOtherWaypoints.description))
						query.append(URLQueryItem(name: "destination_id", value: destinationID.description))
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						let session = esi.session
						
						return Deferred { () -> AnyPublisher<ESIResponse<Void>, AFError> in
							var request = session.request(components, method: .post, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
							
							if let progress = progress {
								request = request.downloadProgress(closure: progress)
							}
							
							return request.publishData(queue: session.serializationQueue)
							.tryMap { response in
								try ESIResponse(value: response.result.map{_ in}.get(), httpHeaders: response.response?.headers)
							}
							.mapError{$0 as! AFError}
							.handleEvents(receiveCompletion: { (_) in
								withExtendedLifetime(session) {}
							}).eraseToAnyPublisher()
						}.eraseToAnyPublisher()
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				
			}
			
			
			
		}
		
		public struct Openwindow {
			let esi: ESI
			let route: APIRoute
			
			
			
			public func contract() -> Contract {
				Contract(esi: esi, route: .path("contract", next: route))
			}
			public func information() -> Information {
				Information(esi: esi, route: .path("information", next: route))
			}
			public func marketdetails() -> Marketdetails {
				Marketdetails(esi: esi, route: .path("marketdetails", next: route))
			}
			public func newmail() -> Newmail {
				Newmail(esi: esi, route: .path("newmail", next: route))
			}
			
			public struct Contract {
				let esi: ESI
				let route: APIRoute
				
				
				public func post(contractID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<Void>, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-ui.open_window.v1") else {throw ESIError.forbidden}
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						headers["Content-Type"] = "application/json"
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						query.append(URLQueryItem(name: "contract_id", value: contractID.description))
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						let session = esi.session
						
						return Deferred { () -> AnyPublisher<ESIResponse<Void>, AFError> in
							var request = session.request(components, method: .post, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
							
							if let progress = progress {
								request = request.downloadProgress(closure: progress)
							}
							
							return request.publishData(queue: session.serializationQueue)
							.tryMap { response in
								try ESIResponse(value: response.result.map{_ in}.get(), httpHeaders: response.response?.headers)
							}
							.mapError{$0 as! AFError}
							.handleEvents(receiveCompletion: { (_) in
								withExtendedLifetime(session) {}
							}).eraseToAnyPublisher()
						}.eraseToAnyPublisher()
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				
			}
			
			public struct Information {
				let esi: ESI
				let route: APIRoute
				
				
				public func post(targetID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<Void>, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-ui.open_window.v1") else {throw ESIError.forbidden}
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						headers["Content-Type"] = "application/json"
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						query.append(URLQueryItem(name: "target_id", value: targetID.description))
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						let session = esi.session
						
						return Deferred { () -> AnyPublisher<ESIResponse<Void>, AFError> in
							var request = session.request(components, method: .post, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
							
							if let progress = progress {
								request = request.downloadProgress(closure: progress)
							}
							
							return request.publishData(queue: session.serializationQueue)
							.tryMap { response in
								try ESIResponse(value: response.result.map{_ in}.get(), httpHeaders: response.response?.headers)
							}
							.mapError{$0 as! AFError}
							.handleEvents(receiveCompletion: { (_) in
								withExtendedLifetime(session) {}
							}).eraseToAnyPublisher()
						}.eraseToAnyPublisher()
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				
			}
			
			public struct Marketdetails {
				let esi: ESI
				let route: APIRoute
				
				
				public func post(typeID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<Void>, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-ui.open_window.v1") else {throw ESIError.forbidden}
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						headers["Content-Type"] = "application/json"
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						query.append(URLQueryItem(name: "type_id", value: typeID.description))
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						let session = esi.session
						
						return Deferred { () -> AnyPublisher<ESIResponse<Void>, AFError> in
							var request = session.request(components, method: .post, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
							
							if let progress = progress {
								request = request.downloadProgress(closure: progress)
							}
							
							return request.publishData(queue: session.serializationQueue)
							.tryMap { response in
								try ESIResponse(value: response.result.map{_ in}.get(), httpHeaders: response.response?.headers)
							}
							.mapError{$0 as! AFError}
							.handleEvents(receiveCompletion: { (_) in
								withExtendedLifetime(session) {}
							}).eraseToAnyPublisher()
						}.eraseToAnyPublisher()
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				
			}
			
			public struct Newmail {
				let esi: ESI
				let route: APIRoute
				
				
				public func post(newMail: ESI.UI.Openwindow.Newmail.NewMail, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<Void>, AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-ui.open_window.v1") else {throw ESIError.forbidden}
						let body = try JSONEncoder().encode(newMail)
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						headers["Content-Type"] = "application/json"
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						let session = esi.session
						
						return Deferred { () -> AnyPublisher<ESIResponse<Void>, AFError> in
							var request = session.request(components, method: .post, encoding: BodyDataEncoding(data: body), headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
							
							if let progress = progress {
								request = request.downloadProgress(closure: progress)
							}
							
							return request.publishData(queue: session.serializationQueue)
							.tryMap { response in
								try ESIResponse(value: response.result.map{_ in}.get(), httpHeaders: response.response?.headers)
							}
							.mapError{$0 as! AFError}
							.handleEvents(receiveCompletion: { (_) in
								withExtendedLifetime(session) {}
							}).eraseToAnyPublisher()
						}.eraseToAnyPublisher()
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
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
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case body
						case recipients
						case subject
						case toCorpOrAllianceID = "to_corp_or_alliance_id"
						case toMailingListID = "to_mailing_list_id"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
			}
			
			
			
		}
		
		
		
	}
	
}
