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
		
		public func getAttendees(characterID: Int, eventID: Int, completionBlock:((Result<[Calendar.GetCharactersCharacterIDCalendarEventIDAttendeesOk]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-calendar.read_calendar_events.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/calendar/\(eventID)/attendees/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Calendar.GetCharactersCharacterIDCalendarEventIDAttendeesOk]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func listCalendarEventSummaries(characterID: Int, fromEvent: Int? = nil, completionBlock:((Result<[Calendar.Summary]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-calendar.read_calendar_events.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = fromEvent?.httpQuery {
				query.append(URLQueryItem(name: "from_event", value: v))
			}
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/calendar/"
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
		
		public func respondToAnEvent(characterID: Int, eventID: Int, response: Calendar.Response, completionBlock:((Result<String>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-calendar.respond_calendar_events.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body = try? JSONEncoder().encode(response)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v3/characters/\(characterID)/calendar/\(eventID)/"
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
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-calendar.read_calendar_events.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v3/characters/\(characterID)/calendar/\(eventID)/"
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
		
		
		public struct Summary: Codable, Hashable {
			
			public enum Response: String, Codable, HTTPQueryable {
				case accepted = "accepted"
				case declined = "declined"
				case notResponded = "not_responded"
				case tentative = "tentative"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var eventDate: Date?
			public var eventID: Int?
			public var eventResponse: Calendar.Summary.Response?
			public var importance: Int?
			public var title: String?
			
			public init(eventDate: Date?, eventID: Int?, eventResponse: Calendar.Summary.Response?, importance: Int?, title: String?) {
				self.eventDate = eventDate
				self.eventID = eventID
				self.eventResponse = eventResponse
				self.importance = importance
				self.title = title
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: eventDate?.hashValue ?? 0)
				hashCombine(seed: &hash, value: eventID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: eventResponse?.hashValue ?? 0)
				hashCombine(seed: &hash, value: importance?.hashValue ?? 0)
				hashCombine(seed: &hash, value: title?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Calendar.Summary, rhs: Calendar.Summary) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case eventDate = "event_date"
				case eventID = "event_id"
				case eventResponse = "event_response"
				case importance
				case title
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .eventDate: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCharactersCharacterIDCalendarEventIDAttendeesOk: Codable, Hashable {
			
			public enum GetCharactersCharacterIDCalendarEventIDAttendeesEventResponse: String, Codable, HTTPQueryable {
				case accepted = "accepted"
				case declined = "declined"
				case notResponded = "not_responded"
				case tentative = "tentative"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var characterID: Int?
			public var eventResponse: Calendar.GetCharactersCharacterIDCalendarEventIDAttendeesOk.GetCharactersCharacterIDCalendarEventIDAttendeesEventResponse?
			
			public init(characterID: Int?, eventResponse: Calendar.GetCharactersCharacterIDCalendarEventIDAttendeesOk.GetCharactersCharacterIDCalendarEventIDAttendeesEventResponse?) {
				self.characterID = characterID
				self.eventResponse = eventResponse
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: characterID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: eventResponse?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Calendar.GetCharactersCharacterIDCalendarEventIDAttendeesOk, rhs: Calendar.GetCharactersCharacterIDCalendarEventIDAttendeesOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case characterID = "character_id"
				case eventResponse = "event_response"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct Event: Codable, Hashable {
			
			public enum GetCharactersCharacterIDCalendarEventIDOwnerType: String, Codable, HTTPQueryable {
				case alliance = "alliance"
				case character = "character"
				case corporation = "corporation"
				case eveServer = "eve_server"
				case faction = "faction"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var date: Date
			public var duration: Int
			public var eventID: Int
			public var importance: Int
			public var ownerID: Int
			public var ownerName: String
			public var ownerType: Calendar.Event.GetCharactersCharacterIDCalendarEventIDOwnerType
			public var response: String
			public var text: String
			public var title: String
			
			public init(date: Date, duration: Int, eventID: Int, importance: Int, ownerID: Int, ownerName: String, ownerType: Calendar.Event.GetCharactersCharacterIDCalendarEventIDOwnerType, response: String, text: String, title: String) {
				self.date = date
				self.duration = duration
				self.eventID = eventID
				self.importance = importance
				self.ownerID = ownerID
				self.ownerName = ownerName
				self.ownerType = ownerType
				self.response = response
				self.text = text
				self.title = title
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: date.hashValue)
				hashCombine(seed: &hash, value: duration.hashValue)
				hashCombine(seed: &hash, value: eventID.hashValue)
				hashCombine(seed: &hash, value: importance.hashValue)
				hashCombine(seed: &hash, value: ownerID.hashValue)
				hashCombine(seed: &hash, value: ownerName.hashValue)
				hashCombine(seed: &hash, value: ownerType.hashValue)
				hashCombine(seed: &hash, value: response.hashValue)
				hashCombine(seed: &hash, value: text.hashValue)
				hashCombine(seed: &hash, value: title.hashValue)
				return hash
			}
			
			public static func ==(lhs: Calendar.Event, rhs: Calendar.Event) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case date
				case duration
				case eventID = "event_id"
				case importance
				case ownerID = "owner_id"
				case ownerName = "owner_name"
				case ownerType = "owner_type"
				case response
				case text
				case title
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .date: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct Response: Codable, Hashable {
			
			public enum Response: String, Codable, HTTPQueryable {
				case accepted = "accepted"
				case declined = "declined"
				case tentative = "tentative"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var response: Calendar.Response.Response
			
			public init(response: Calendar.Response.Response) {
				self.response = response
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: response.hashValue)
				return hash
			}
			
			public static func ==(lhs: Calendar.Response, rhs: Calendar.Response) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case response
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
	}
	
}
