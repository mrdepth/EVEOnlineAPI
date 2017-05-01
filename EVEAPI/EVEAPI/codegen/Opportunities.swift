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
		
		public func getOpportunitiesGroup(groupID: Int, language: Language? = nil, completionBlock:((Result<Opportunities.Group>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = language?.httpQuery {
				query.append(URLQueryItem(name: "language", value: v))
			}
			
			let url = session!.baseURL + "latest/opportunities/groups/\(groupID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Opportunities.Group>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getOpportunitiesGroups(completionBlock:((Result<[Int]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/opportunities/groups/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Int]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getOpportunitiesTasks(completionBlock:((Result<[Int]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/opportunities/tasks/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Int]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getOpportunitiesTask(taskID: Int, completionBlock:((Result<Opportunities.OpportunitiesTask>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/opportunities/tasks/\(taskID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Opportunities.OpportunitiesTask>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getCharactersCompletedTasks(characterID: Int, completionBlock:((Result<[Opportunities.CompletedTask]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-characters.read_opportunities.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/opportunities/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Opportunities.CompletedTask]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		public class GetOpportunitiesGroupsGroupIDInternalServerError: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
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
			
			public static func ==(lhs: Opportunities.GetOpportunitiesGroupsGroupIDInternalServerError, rhs: Opportunities.GetOpportunitiesGroupsGroupIDInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Opportunities.GetOpportunitiesGroupsGroupIDInternalServerError) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Opportunities.GetOpportunitiesGroupsGroupIDInternalServerError(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetOpportunitiesGroupsGroupIDInternalServerError)?.hashValue == hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDOpportunitiesForbidden: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
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
			
			public static func ==(lhs: Opportunities.GetCharactersCharacterIDOpportunitiesForbidden, rhs: Opportunities.GetCharactersCharacterIDOpportunitiesForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Opportunities.GetCharactersCharacterIDOpportunitiesForbidden) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Opportunities.GetCharactersCharacterIDOpportunitiesForbidden(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCharactersCharacterIDOpportunitiesForbidden)?.hashValue == hashValue
			}
			
		}
		
		
		public class Group: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var connectedGroups: [Int] = []
			public var localizedDescription: String = String()
			public var groupID: Int = Int()
			public var name: String = String()
			public var notification: String = String()
			public var requiredTasks: [Int] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				connectedGroups = try (dictionary["connected_groups"] as? [Any])?.map {try Int(json: $0)} ?? []
				guard let localizedDescription = dictionary["description"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.localizedDescription = localizedDescription
				guard let groupID = dictionary["group_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.groupID = groupID
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.name = name
				guard let notification = dictionary["notification"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.notification = notification
				requiredTasks = try (dictionary["required_tasks"] as? [Any])?.map {try Int(json: $0)} ?? []
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				connectedGroups = aDecoder.decodeObject(forKey: "connected_groups") as? [Int] ?? []
				localizedDescription = aDecoder.decodeObject(forKey: "description") as? String ?? String()
				groupID = aDecoder.decodeInteger(forKey: "group_id")
				name = aDecoder.decodeObject(forKey: "name") as? String ?? String()
				notification = aDecoder.decodeObject(forKey: "notification") as? String ?? String()
				requiredTasks = aDecoder.decodeObject(forKey: "required_tasks") as? [Int] ?? []
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(connectedGroups, forKey: "connected_groups")
				aCoder.encode(localizedDescription, forKey: "description")
				aCoder.encode(groupID, forKey: "group_id")
				aCoder.encode(name, forKey: "name")
				aCoder.encode(notification, forKey: "notification")
				aCoder.encode(requiredTasks, forKey: "required_tasks")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["connected_groups"] = connectedGroups.json
				json["description"] = localizedDescription.json
				json["group_id"] = groupID.json
				json["name"] = name.json
				json["notification"] = notification.json
				json["required_tasks"] = requiredTasks.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				connectedGroups.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: localizedDescription.hashValue)
				hashCombine(seed: &hash, value: groupID.hashValue)
				hashCombine(seed: &hash, value: name.hashValue)
				hashCombine(seed: &hash, value: notification.hashValue)
				requiredTasks.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}
			
			public static func ==(lhs: Opportunities.Group, rhs: Opportunities.Group) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Opportunities.Group) {
				connectedGroups = other.connectedGroups.flatMap { $0 }
				localizedDescription = other.localizedDescription
				groupID = other.groupID
				name = other.name
				notification = other.notification
				requiredTasks = other.requiredTasks.flatMap { $0 }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Opportunities.Group(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Group)?.hashValue == hashValue
			}
			
		}
		
		
		public class GetOpportunitiesTasksInternalServerError: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
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
			
			public static func ==(lhs: Opportunities.GetOpportunitiesTasksInternalServerError, rhs: Opportunities.GetOpportunitiesTasksInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Opportunities.GetOpportunitiesTasksInternalServerError) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Opportunities.GetOpportunitiesTasksInternalServerError(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetOpportunitiesTasksInternalServerError)?.hashValue == hashValue
			}
			
		}
		
		
		public class GetOpportunitiesGroupsInternalServerError: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
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
			
			public static func ==(lhs: Opportunities.GetOpportunitiesGroupsInternalServerError, rhs: Opportunities.GetOpportunitiesGroupsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Opportunities.GetOpportunitiesGroupsInternalServerError) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Opportunities.GetOpportunitiesGroupsInternalServerError(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetOpportunitiesGroupsInternalServerError)?.hashValue == hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDOpportunitiesInternalServerError: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
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
			
			public static func ==(lhs: Opportunities.GetCharactersCharacterIDOpportunitiesInternalServerError, rhs: Opportunities.GetCharactersCharacterIDOpportunitiesInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Opportunities.GetCharactersCharacterIDOpportunitiesInternalServerError) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Opportunities.GetCharactersCharacterIDOpportunitiesInternalServerError(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCharactersCharacterIDOpportunitiesInternalServerError)?.hashValue == hashValue
			}
			
		}
		
		
		public class CompletedTask: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var completedAt: Date = Date()
			public var taskID: Int = Int()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let completedAt = DateFormatter.esiDateFormatter.date(from: dictionary["completed_at"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.completedAt = completedAt
				guard let taskID = dictionary["task_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.taskID = taskID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				completedAt = aDecoder.decodeObject(forKey: "completed_at") as? Date ?? Date()
				taskID = aDecoder.decodeInteger(forKey: "task_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(completedAt, forKey: "completed_at")
				aCoder.encode(taskID, forKey: "task_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["completed_at"] = completedAt.json
				json["task_id"] = taskID.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: completedAt.hashValue)
				hashCombine(seed: &hash, value: taskID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Opportunities.CompletedTask, rhs: Opportunities.CompletedTask) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Opportunities.CompletedTask) {
				completedAt = other.completedAt
				taskID = other.taskID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Opportunities.CompletedTask(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? CompletedTask)?.hashValue == hashValue
			}
			
		}
		
		
		public class OpportunitiesTask: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var localizedDescription: String = String()
			public var name: String = String()
			public var notification: String = String()
			public var taskID: Int = Int()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let localizedDescription = dictionary["description"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.localizedDescription = localizedDescription
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.name = name
				guard let notification = dictionary["notification"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.notification = notification
				guard let taskID = dictionary["task_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.taskID = taskID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				localizedDescription = aDecoder.decodeObject(forKey: "description") as? String ?? String()
				name = aDecoder.decodeObject(forKey: "name") as? String ?? String()
				notification = aDecoder.decodeObject(forKey: "notification") as? String ?? String()
				taskID = aDecoder.decodeInteger(forKey: "task_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(localizedDescription, forKey: "description")
				aCoder.encode(name, forKey: "name")
				aCoder.encode(notification, forKey: "notification")
				aCoder.encode(taskID, forKey: "task_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["description"] = localizedDescription.json
				json["name"] = name.json
				json["notification"] = notification.json
				json["task_id"] = taskID.json
				return json
			}
			
			override public var hashValue: Int {
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
			
			init(_ other: Opportunities.OpportunitiesTask) {
				localizedDescription = other.localizedDescription
				name = other.name
				notification = other.notification
				taskID = other.taskID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Opportunities.OpportunitiesTask(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? OpportunitiesTask)?.hashValue == hashValue
			}
			
		}
		
		
		public class GetOpportunitiesTasksTaskIDInternalServerError: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
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
			
			public static func ==(lhs: Opportunities.GetOpportunitiesTasksTaskIDInternalServerError, rhs: Opportunities.GetOpportunitiesTasksTaskIDInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Opportunities.GetOpportunitiesTasksTaskIDInternalServerError) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Opportunities.GetOpportunitiesTasksTaskIDInternalServerError(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetOpportunitiesTasksTaskIDInternalServerError)?.hashValue == hashValue
			}
			
		}
		
		
	}
	
}
