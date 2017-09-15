import Foundation
import Alamofire


public extension ESI {
	public var calendar: Calendar {
		return Calendar(sessionManager: self)
	}
	
	class Calendar {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		public func respondToAnEvent(characterID: Int, eventID: Int, response: Calendar.Response, completionBlock:((Result<String>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-calendar.respond_calendar_events.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body = try? JSONSerialization.data(withJSONObject: response.json, options: [])
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/calendar/\(eventID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .put, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<String>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getAnEvent(characterID: Int, eventID: Int, completionBlock:((Result<Calendar.Event>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-calendar.read_calendar_events.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/calendar/\(eventID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Calendar.Event>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func listCalendarEventSummaries(characterID: Int, fromEvent: Int? = nil, completionBlock:((Result<[Calendar.Summary]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-calendar.read_calendar_events.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = fromEvent?.httpQuery {
				query.append(URLQueryItem(name: "from_event", value: v))
			}
			
			let url = session!.baseURL + "latest/characters/\(characterID)/calendar/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Calendar.Summary]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		@objc(ESICalendarSummary) public class Summary: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public enum Response: String, JSONCoding, HTTPQueryable {
				case accepted = "accepted"
				case declined = "declined"
				case notResponded = "not_responded"
				case tentative = "tentative"
				
				public init() {
					self = .declined
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = Response(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var eventDate: Date? = nil
			public var eventID: Int? = nil
			public var eventResponse: Calendar.Summary.Response? = nil
			public var importance: Int? = nil
			public var title: String? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				eventDate = DateFormatter.esiDateTimeFormatter.date(from: dictionary["event_date"] as? String ?? "")
				eventID = dictionary["event_id"] as? Int
				eventResponse = Calendar.Summary.Response(rawValue: dictionary["event_response"] as? String ?? "")
				importance = dictionary["importance"] as? Int
				title = dictionary["title"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				eventDate = aDecoder.decodeObject(forKey: "event_date") as? Date
				eventID = aDecoder.containsValue(forKey: "event_id") ? aDecoder.decodeInteger(forKey: "event_id") : nil
				eventResponse = Calendar.Summary.Response(rawValue: aDecoder.decodeObject(forKey: "event_response") as? String ?? "")
				importance = aDecoder.containsValue(forKey: "importance") ? aDecoder.decodeInteger(forKey: "importance") : nil
				title = aDecoder.decodeObject(forKey: "title") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = eventDate {
					aCoder.encode(v, forKey: "event_date")
				}
				if let v = eventID {
					aCoder.encode(v, forKey: "event_id")
				}
				if let v = eventResponse {
					aCoder.encode(v.rawValue, forKey: "event_response")
				}
				if let v = importance {
					aCoder.encode(v, forKey: "importance")
				}
				if let v = title {
					aCoder.encode(v, forKey: "title")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = eventDate?.json {
					json["event_date"] = v
				}
				if let v = eventID?.json {
					json["event_id"] = v
				}
				if let v = eventResponse?.json {
					json["event_response"] = v
				}
				if let v = importance?.json {
					json["importance"] = v
				}
				if let v = title?.json {
					json["title"] = v
				}
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.eventDate?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.eventID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.eventResponse?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.importance?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.title?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Calendar.Summary, rhs: Calendar.Summary) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Calendar.Summary) {
				eventDate = other.eventDate
				eventID = other.eventID
				eventResponse = other.eventResponse
				importance = other.importance
				title = other.title
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Calendar.Summary(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Summary)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESICalendarEvent) public class Event: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public enum GetCharactersCharacterIDCalendarEventIDOwnerType: String, JSONCoding, HTTPQueryable {
				case alliance = "alliance"
				case character = "character"
				case corporation = "corporation"
				case eveServer = "eve_server"
				case faction = "faction"
				
				public init() {
					self = .eveServer
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCharactersCharacterIDCalendarEventIDOwnerType(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var date: Date = Date()
			public var duration: Int = Int()
			public var eventID: Int = Int()
			public var importance: Int = Int()
			public var ownerID: Int = Int()
			public var ownerName: String = String()
			public var ownerType: Calendar.Event.GetCharactersCharacterIDCalendarEventIDOwnerType = Calendar.Event.GetCharactersCharacterIDCalendarEventIDOwnerType()
			public var response: String = String()
			public var text: String = String()
			public var title: String = String()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let date = DateFormatter.esiDateTimeFormatter.date(from: dictionary["date"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.date = date
				guard let duration = dictionary["duration"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.duration = duration
				guard let eventID = dictionary["event_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.eventID = eventID
				guard let importance = dictionary["importance"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.importance = importance
				guard let ownerID = dictionary["owner_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.ownerID = ownerID
				guard let ownerName = dictionary["owner_name"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.ownerName = ownerName
				guard let ownerType = Calendar.Event.GetCharactersCharacterIDCalendarEventIDOwnerType(rawValue: dictionary["owner_type"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.ownerType = ownerType
				guard let response = dictionary["response"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.response = response
				guard let text = dictionary["text"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.text = text
				guard let title = dictionary["title"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.title = title
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				date = aDecoder.decodeObject(forKey: "date") as? Date ?? Date()
				duration = aDecoder.decodeInteger(forKey: "duration")
				eventID = aDecoder.decodeInteger(forKey: "event_id")
				importance = aDecoder.decodeInteger(forKey: "importance")
				ownerID = aDecoder.decodeInteger(forKey: "owner_id")
				ownerName = aDecoder.decodeObject(forKey: "owner_name") as? String ?? String()
				ownerType = Calendar.Event.GetCharactersCharacterIDCalendarEventIDOwnerType(rawValue: aDecoder.decodeObject(forKey: "owner_type") as? String ?? "") ?? Calendar.Event.GetCharactersCharacterIDCalendarEventIDOwnerType()
				response = aDecoder.decodeObject(forKey: "response") as? String ?? String()
				text = aDecoder.decodeObject(forKey: "text") as? String ?? String()
				title = aDecoder.decodeObject(forKey: "title") as? String ?? String()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(date, forKey: "date")
				aCoder.encode(duration, forKey: "duration")
				aCoder.encode(eventID, forKey: "event_id")
				aCoder.encode(importance, forKey: "importance")
				aCoder.encode(ownerID, forKey: "owner_id")
				aCoder.encode(ownerName, forKey: "owner_name")
				aCoder.encode(ownerType.rawValue, forKey: "owner_type")
				aCoder.encode(response, forKey: "response")
				aCoder.encode(text, forKey: "text")
				aCoder.encode(title, forKey: "title")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["date"] = date.json
				json["duration"] = duration.json
				json["event_id"] = eventID.json
				json["importance"] = importance.json
				json["owner_id"] = ownerID.json
				json["owner_name"] = ownerName.json
				json["owner_type"] = ownerType.json
				json["response"] = response.json
				json["text"] = text.json
				json["title"] = title.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.date.hashValue)
				hashCombine(seed: &hash, value: self.duration.hashValue)
				hashCombine(seed: &hash, value: self.eventID.hashValue)
				hashCombine(seed: &hash, value: self.importance.hashValue)
				hashCombine(seed: &hash, value: self.ownerID.hashValue)
				hashCombine(seed: &hash, value: self.ownerName.hashValue)
				hashCombine(seed: &hash, value: self.ownerType.hashValue)
				hashCombine(seed: &hash, value: self.response.hashValue)
				hashCombine(seed: &hash, value: self.text.hashValue)
				hashCombine(seed: &hash, value: self.title.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Calendar.Event, rhs: Calendar.Event) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Calendar.Event) {
				date = other.date
				duration = other.duration
				eventID = other.eventID
				importance = other.importance
				ownerID = other.ownerID
				ownerName = other.ownerName
				ownerType = other.ownerType
				response = other.response
				text = other.text
				title = other.title
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Calendar.Event(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Event)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESICalendarResponse) public class Response: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public enum Response: String, JSONCoding, HTTPQueryable {
				case accepted = "accepted"
				case declined = "declined"
				case tentative = "tentative"
				
				public init() {
					self = .accepted
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = Response(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var response: Calendar.Response.Response = Calendar.Response.Response()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let response = Calendar.Response.Response(rawValue: dictionary["response"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.response = response
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				response = Calendar.Response.Response(rawValue: aDecoder.decodeObject(forKey: "response") as? String ?? "") ?? Calendar.Response.Response()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(response.rawValue, forKey: "response")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["response"] = response.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.response.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Calendar.Response, rhs: Calendar.Response) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Calendar.Response) {
				response = other.response
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Calendar.Response(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Response)?.hashValue == hashValue
			}
			
		}
		
		
	}
	
}
