import Foundation
import Alamofire
import Futures


public extension ESI {
	var calendar: Calendar {
		return Calendar(esi: self)
	}
	
	struct Calendar {
		let esi: ESI
		
		@discardableResult
		public func getAttendees(characterID: Int, eventID: Int, ifNoneMatch: String? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Calendar.GetCharactersCharacterIDCalendarEventIDAttendeesOk]>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-calendar.read_calendar_events.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/characters/\(characterID)/calendar/\(eventID)/attendees/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<[Calendar.GetCharactersCharacterIDCalendarEventIDAttendeesOk]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<[Calendar.GetCharactersCharacterIDCalendarEventIDAttendeesOk]>) in
				promise.set(response: response, cached: 600.0)
			}
			return promise.future
		}
		
		@discardableResult
		public func listCalendarEventSummaries(characterID: Int, fromEvent: Int? = nil, ifNoneMatch: String? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Calendar.Summary]>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-calendar.read_calendar_events.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = fromEvent?.httpQuery {
				query.append(URLQueryItem(name: "from_event", value: v))
			}
			
			let url = esi.baseURL + "/v1/characters/\(characterID)/calendar/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<[Calendar.Summary]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<[Calendar.Summary]>) in
				promise.set(response: response, cached: 5.0)
			}
			return promise.future
		}
		
		@discardableResult
		public func getAnEvent(characterID: Int, eventID: Int, ifNoneMatch: String? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<Calendar.Event>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-calendar.read_calendar_events.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v3/characters/\(characterID)/calendar/\(eventID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<Calendar.Event>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<Calendar.Event>) in
				promise.set(response: response, cached: 5.0)
			}
			return promise.future
		}
		
		@discardableResult
		public func respondToAnEvent(characterID: Int, eventID: Int, response: Calendar.Response, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<String>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-calendar.respond_calendar_events.v1") else {return .init(.failure(ESIError.forbidden))}
			let body = try? JSONEncoder().encode(response)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v3/characters/\(characterID)/calendar/\(eventID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<String>>()
			esi.request(components.url!, method: .put, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<String>) in
				promise.set(response: response, cached: nil)
			}
			return promise.future
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
		
		
		public struct GetCharactersCharacterIDCalendarEventIDNotFound: Codable, Hashable {
			
			
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
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case response
				
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
		
		
		public struct GetCharactersCharacterIDCalendarEventIDAttendeesNotFound: Codable, Hashable {
			
			
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
