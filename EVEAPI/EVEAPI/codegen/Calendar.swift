import Foundation
import Alamofire
import Combine


extension ESI {
	public var calendar: Calendar {
		return Calendar(esi: self)
	}
	
	public struct Calendar {
		let esi: ESI
		
		
		public func getAttendees(characterID: Int, eventID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Calendar.GetCharactersCharacterIDCalendarEventIDAttendeesOk], AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-calendar.read_calendar_events.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/characters/\(characterID)/calendar/\(eventID)/attendees/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .get,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
			            .eraseToAnyPublisher()
		}
		
		
		public func getAnEvent(characterID: Int, eventID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Calendar.Event, AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-calendar.read_calendar_events.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/characters/\(characterID)/calendar/\(eventID)/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .get,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
			            .eraseToAnyPublisher()
		}
		
		
		public func respondToAnEvent(characterID: Int, eventID: Int, response: Calendar.Response, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<String, AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-calendar.respond_calendar_events.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body = try? JSONEncoder().encode(response)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/characters/\(characterID)/calendar/\(eventID)/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .put,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseString(queue: esi.session.serializationQueue)
			            .eraseToAnyPublisher()
		}
		
		
		public func listCalendarEventSummaries(characterID: Int, fromEvent: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Calendar.Summary], AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-calendar.read_calendar_events.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = fromEvent?.description {
				query.append(URLQueryItem(name: "from_event", value: v.lazy.map{$0.description}.joined(separator: ",")))
			}
			
			        let url = ESI.apiURL.appendingPathComponent("/characters/\(characterID)/calendar/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .get,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
			            .eraseToAnyPublisher()
		}
		
		
		public struct Event: Codable, Hashable {
			
			public enum GetCharactersCharacterIDCalendarEventIDOwnerType: String, Codable, CustomStringConvertible {
				case alliance = "alliance"
				case character = "character"
				case corporation = "corporation"
				case eveServer = "eve_server"
				case faction = "faction"
				
				public var description: String {
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
		
		
		public struct Summary: Codable, Hashable {
			
			public enum Response: String, Codable, CustomStringConvertible {
				case accepted = "accepted"
				case declined = "declined"
				case notResponded = "not_responded"
				case tentative = "tentative"
				
				public var description: String {
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
		
		
		public struct GetCharactersCharacterIDCalendarEventIDAttendeesOk: Codable, Hashable {
			
			public enum GetCharactersCharacterIDCalendarEventIDAttendeesEventResponse: String, Codable, CustomStringConvertible {
				case accepted = "accepted"
				case declined = "declined"
				case notResponded = "not_responded"
				case tentative = "tentative"
				
				public var description: String {
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
		
		
		public struct Response: Codable, Hashable {
			
			public enum Response: String, Codable, CustomStringConvertible {
				case accepted = "accepted"
				case declined = "declined"
				case tentative = "tentative"
				
				public var description: String {
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
		
		
	}
	
}
