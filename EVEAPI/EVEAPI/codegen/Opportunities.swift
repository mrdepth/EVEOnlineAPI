import Foundation
import Alamofire
import Futures


public extension ESI {
	public var opportunities: Opportunities {
		return Opportunities(esi: self)
	}
	
	class Opportunities {
		weak var esi: ESI?
		
		init(esi: ESI) {
			self.esi = esi
		}
		
		@discardableResult
		public func getOpportunitiesTask(ifNoneMatch: String? = nil, taskID: Int) -> Future<ESI.Result<Opportunities.OpportunitiesTask>> {
			guard let esi = self.esi else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<Opportunities.OpportunitiesTask>>()
			esi.perform { [weak esi] () -> DataRequest? in
				return esi?.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Opportunities.OpportunitiesTask>) in
					promise.set(result: response.result, cached: 3600.0)
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getOpportunitiesGroup(acceptLanguage: AcceptLanguage? = nil, groupID: Int, ifNoneMatch: String? = nil, language: Language? = nil) -> Future<ESI.Result<Opportunities.Group>> {
			guard let esi = self.esi else { return .init(.failure(ESIError.internalError)) }
			
			
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
			
			let url = esi.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<Opportunities.Group>>()
			esi.perform { [weak esi] () -> DataRequest? in
				return esi?.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Opportunities.Group>) in
					promise.set(result: response.result, cached: 3600.0)
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getOpportunitiesTasks(ifNoneMatch: String? = nil) -> Future<ESI.Result<[Int]>> {
			guard let esi = self.esi else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Int]>>()
			esi.perform { [weak esi] () -> DataRequest? in
				return esi?.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Int]>) in
					promise.set(result: response.result, cached: 3600.0)
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getOpportunitiesGroups(ifNoneMatch: String? = nil) -> Future<ESI.Result<[Int]>> {
			guard let esi = self.esi else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Int]>>()
			esi.perform { [weak esi] () -> DataRequest? in
				return esi?.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Int]>) in
					promise.set(result: response.result, cached: 3600.0)
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCharactersCompletedTasks(characterID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<[Opportunities.CompletedTask]>> {
			guard let esi = self.esi else { return .init(.failure(ESIError.internalError)) }
			
			let scopes = (esi.sessionManager.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-characters.read_opportunities.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Opportunities.CompletedTask]>>()
			esi.perform { [weak esi] () -> DataRequest? in
				return esi?.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Opportunities.CompletedTask]>) in
					promise.set(result: response.result, cached: 3600.0)
				}
			}
			return promise.future
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
		
		
	}
	
}
