import Foundation
import Alamofire
import Futures


public extension ESI {
	public var opportunities: Opportunities {
		return Opportunities(esi: self)
	}
	
	struct Opportunities {
		let esi: ESI
		
		@discardableResult
		public func getOpportunitiesGroup(acceptLanguage: AcceptLanguage? = nil, groupID: Int, ifNoneMatch: String? = nil, language: Language? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<Opportunities.Group>> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = acceptLanguage?.httpQuery {
				headers["Accept-Language"] = v
			}
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = language?.httpQuery {
				query.append(URLQueryItem(name: "language", value: v))
			}
			
			let url = esi.baseURL + "/v1/opportunities/groups/\(groupID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<Opportunities.Group>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<Opportunities.Group>) in
				promise.set(response: response, cached: nil)
			}
			return promise.future
		}
		
		@discardableResult
		public func getOpportunitiesTasks(ifNoneMatch: String? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Int]>> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/opportunities/tasks/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<[Int]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<[Int]>) in
				promise.set(response: response, cached: nil)
			}
			return promise.future
		}
		
		@discardableResult
		public func getOpportunitiesGroups(ifNoneMatch: String? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Int]>> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/opportunities/groups/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<[Int]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<[Int]>) in
				promise.set(response: response, cached: nil)
			}
			return promise.future
		}
		
		@discardableResult
		public func getOpportunitiesTask(ifNoneMatch: String? = nil, taskID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<Opportunities.OpportunitiesTask>> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/opportunities/tasks/\(taskID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<Opportunities.OpportunitiesTask>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<Opportunities.OpportunitiesTask>) in
				promise.set(response: response, cached: nil)
			}
			return promise.future
		}
		
		@discardableResult
		public func getCharactersCompletedTasks(characterID: Int, ifNoneMatch: String? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Opportunities.CompletedTask]>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-characters.read_opportunities.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/characters/\(characterID)/opportunities/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<[Opportunities.CompletedTask]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<[Opportunities.CompletedTask]>) in
				promise.set(response: response, cached: 3600.0)
			}
			return promise.future
		}
		
		
		public struct CompletedTask: Codable, Hashable {
			
			
			public var completedAt: Date
			public var taskID: Int
			
			public init(completedAt: Date, taskID: Int) {
				self.completedAt = completedAt
				self.taskID = taskID
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case completedAt = "completed_at"
				case taskID = "task_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .completedAt: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct Group: Codable, Hashable {
			
			
			public var connectedGroups: [Int]
			public var localizedDescription: String
			public var groupID: Int
			public var name: String
			public var notification: String
			public var requiredTasks: [Int]
			
			public init(connectedGroups: [Int], localizedDescription: String, groupID: Int, name: String, notification: String, requiredTasks: [Int]) {
				self.connectedGroups = connectedGroups
				self.localizedDescription = localizedDescription
				self.groupID = groupID
				self.name = name
				self.notification = notification
				self.requiredTasks = requiredTasks
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case connectedGroups = "connected_groups"
				case localizedDescription = "description"
				case groupID = "group_id"
				case name
				case notification
				case requiredTasks = "required_tasks"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct OpportunitiesTask: Codable, Hashable {
			
			
			public var localizedDescription: String
			public var name: String
			public var notification: String
			public var taskID: Int
			
			public init(localizedDescription: String, name: String, notification: String, taskID: Int) {
				self.localizedDescription = localizedDescription
				self.name = name
				self.notification = notification
				self.taskID = taskID
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case localizedDescription = "description"
				case name
				case notification
				case taskID = "task_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
	}
	
}
