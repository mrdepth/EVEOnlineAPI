import Foundation
import Alamofire


public extension ESI {
	public var opportunities: Opportunities {
		return Opportunities(sessionManager: self)
	}
	
	class Opportunities {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		@discardableResult
		public func getOpportunitiesTask(ifNoneMatch: String? = nil, taskID: Int) -> Future<ESI.Result<Opportunities.OpportunitiesTask>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<Opportunities.OpportunitiesTask>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(describing: v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/opportunities/tasks/\(taskID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Opportunities.OpportunitiesTask>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getOpportunitiesTasks(ifNoneMatch: String? = nil) -> Future<ESI.Result<[Int]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Int]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(describing: v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/opportunities/tasks/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Int]>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getOpportunitiesGroups(ifNoneMatch: String? = nil) -> Future<ESI.Result<[Int]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Int]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(describing: v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/opportunities/groups/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Int]>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getOpportunitiesGroup(acceptLanguage: AcceptLanguage? = nil, groupID: Int, ifNoneMatch: String? = nil, language: Language? = nil) -> Future<ESI.Result<Opportunities.Group>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<Opportunities.Group>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = acceptLanguage {
				headers["Accept-Language"] = String(describing: v)
			}
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(describing: v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			if let v = language?.httpQuery {
				query.append(URLQueryItem(name: "language", value: v))
			}
			
			let url = session!.baseURL + "/v1/opportunities/groups/\(groupID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Opportunities.Group>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCharactersCompletedTasks(characterID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<[Opportunities.CompletedTask]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Opportunities.CompletedTask]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-characters.read_opportunities.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(describing: v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/opportunities/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Opportunities.CompletedTask]>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
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
			
			public var hashValue: Int {
				var hash: Int = 0
				self.connectedGroups.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: localizedDescription.hashValue)
				hashCombine(seed: &hash, value: groupID.hashValue)
				hashCombine(seed: &hash, value: name.hashValue)
				hashCombine(seed: &hash, value: notification.hashValue)
				self.requiredTasks.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}
			
			public static func ==(lhs: Opportunities.Group, rhs: Opportunities.Group) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
		
		
		public struct CompletedTask: Codable, Hashable {
			
			
			public var completedAt: Date
			public var taskID: Int
			
			public init(completedAt: Date, taskID: Int) {
				self.completedAt = completedAt
				self.taskID = taskID
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: completedAt.hashValue)
				hashCombine(seed: &hash, value: taskID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Opportunities.CompletedTask, rhs: Opportunities.CompletedTask) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: localizedDescription.hashValue)
				hashCombine(seed: &hash, value: name.hashValue)
				hashCombine(seed: &hash, value: notification.hashValue)
				hashCombine(seed: &hash, value: taskID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Opportunities.OpportunitiesTask, rhs: Opportunities.OpportunitiesTask) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
