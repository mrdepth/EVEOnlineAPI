import Foundation
import Alamofire
import Combine


extension ESI {
	public var contacts: Contacts {
		return Contacts(esi: self)
	}
	
	public struct Contacts {
		let esi: ESI
		
		
		public func getCorporationContacts(corporationID: Int, page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Contacts.GetCorporationsCorporationIDContactsOk], AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-corporations.read_contacts.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = page?.description {
				query.append(URLQueryItem(name: "page", value: v.lazy.map{$0.description}.joined(separator: ",")))
			}
			
			        let url = ESI.apiURL.appendingPathComponent("/corporations/\(corporationID)/contacts/")
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
		
		
		public func getAllianceContactLabels(allianceID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Contacts.GetAlliancesAllianceIDContactsLabelsOk], AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-alliances.read_contacts.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/alliances/\(allianceID)/contacts/labels/")
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
		
		
		public func getAllianceContacts(allianceID: Int, page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Contacts.GetAlliancesAllianceIDContactsOk], AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-alliances.read_contacts.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = page?.description {
				query.append(URLQueryItem(name: "page", value: v.lazy.map{$0.description}.joined(separator: ",")))
			}
			
			        let url = ESI.apiURL.appendingPathComponent("/alliances/\(allianceID)/contacts/")
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
		
		
		public func getCorporationContactLabels(corporationID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Contacts.GetCorporationsCorporationIDContactsLabelsOk], AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-corporations.read_contacts.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/corporations/\(corporationID)/contacts/labels/")
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
		
		
		public func deleteContacts(characterID: Int, contactIds: [Int], cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<String, AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-characters.write_contacts.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if !contactIds.isEmpty {
				query.append(URLQueryItem(name: "contact_ids", value: contactIds.lazy.map{$0.description}.joined(separator: ",")))
			}
			
			        let url = ESI.apiURL.appendingPathComponent("/characters/\(characterID)/contacts/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .delete,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseString(queue: esi.session.serializationQueue)
			            .eraseToAnyPublisher()
		}
		
		
		public func getContacts(characterID: Int, page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Contacts.Contact], AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-characters.read_contacts.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = page?.description {
				query.append(URLQueryItem(name: "page", value: v.lazy.map{$0.description}.joined(separator: ",")))
			}
			
			        let url = ESI.apiURL.appendingPathComponent("/characters/\(characterID)/contacts/")
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
		
		
		public func addContacts(characterID: Int, contactIds: [Int], labelIds: [Int64]? = nil, standing: Float, watched: Bool? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Int], AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-characters.write_contacts.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body = try? JSONEncoder().encode(contactIds)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = labelIds, !v.isEmpty {
				query.append(URLQueryItem(name: "label_ids", value: v.lazy.map{$0.description}.joined(separator: ",")))
			}
			query.append(URLQueryItem(name: "standing", value: standing.description))
			if let v = watched?.description {
				query.append(URLQueryItem(name: "watched", value: v.lazy.map{$0.description}.joined(separator: ",")))
			}
			
			        let url = ESI.apiURL.appendingPathComponent("/characters/\(characterID)/contacts/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .post,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
			            .eraseToAnyPublisher()
		}
		
		
		public func editContacts(characterID: Int, contactIds: [Int], labelIds: [Int64]? = nil, standing: Float, watched: Bool? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<String, AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-characters.write_contacts.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body = try? JSONEncoder().encode(contactIds)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = labelIds, !v.isEmpty {
				query.append(URLQueryItem(name: "label_ids", value: v.lazy.map{$0.description}.joined(separator: ",")))
			}
			query.append(URLQueryItem(name: "standing", value: standing.description))
			if let v = watched?.description {
				query.append(URLQueryItem(name: "watched", value: v.lazy.map{$0.description}.joined(separator: ",")))
			}
			
			        let url = ESI.apiURL.appendingPathComponent("/characters/\(characterID)/contacts/")
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
		
		
		public func getContactLabels(characterID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Contacts.Label], AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-characters.read_contacts.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/characters/\(characterID)/contacts/labels/")
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
		
		
		public struct PostCharactersCharacterIDContactsError520: Codable, Hashable {
			
			
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
		
		
		public struct Label: Codable, Hashable {
			
			
			public var labelID: Int64
			public var labelName: String
			
			public init(labelID: Int64, labelName: String) {
				self.labelID = labelID
				self.labelName = labelName
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case labelID = "label_id"
				case labelName = "label_name"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct Contact: Codable, Hashable {
			
			public enum GetCharactersCharacterIDContactsContactType: String, Codable, CustomStringConvertible {
				case alliance = "alliance"
				case character = "character"
				case corporation = "corporation"
				case faction = "faction"
				
				public var description: String {
					return rawValue
				}
				
			}
			
			public var contactID: Int
			public var contactType: Contacts.Contact.GetCharactersCharacterIDContactsContactType
			public var isBlocked: Bool?
			public var isWatched: Bool?
			public var labelIds: [Int64]?
			public var standing: Float
			
			public init(contactID: Int, contactType: Contacts.Contact.GetCharactersCharacterIDContactsContactType, isBlocked: Bool?, isWatched: Bool?, labelIds: [Int64]?, standing: Float) {
				self.contactID = contactID
				self.contactType = contactType
				self.isBlocked = isBlocked
				self.isWatched = isWatched
				self.labelIds = labelIds
				self.standing = standing
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case contactID = "contact_id"
				case contactType = "contact_type"
				case isBlocked = "is_blocked"
				case isWatched = "is_watched"
				case labelIds = "label_ids"
				case standing
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetAlliancesAllianceIDContactsOk: Codable, Hashable {
			
			public enum GetAlliancesAllianceIDContactsContactType: String, Codable, CustomStringConvertible {
				case alliance = "alliance"
				case character = "character"
				case corporation = "corporation"
				case faction = "faction"
				
				public var description: String {
					return rawValue
				}
				
			}
			
			public var contactID: Int
			public var contactType: Contacts.GetAlliancesAllianceIDContactsOk.GetAlliancesAllianceIDContactsContactType
			public var labelIds: [Int64]?
			public var standing: Float
			
			public init(contactID: Int, contactType: Contacts.GetAlliancesAllianceIDContactsOk.GetAlliancesAllianceIDContactsContactType, labelIds: [Int64]?, standing: Float) {
				self.contactID = contactID
				self.contactType = contactType
				self.labelIds = labelIds
				self.standing = standing
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case contactID = "contact_id"
				case contactType = "contact_type"
				case labelIds = "label_ids"
				case standing
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCorporationsCorporationIDContactsLabelsOk: Codable, Hashable {
			
			
			public var labelID: Int64
			public var labelName: String
			
			public init(labelID: Int64, labelName: String) {
				self.labelID = labelID
				self.labelName = labelName
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case labelID = "label_id"
				case labelName = "label_name"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetAlliancesAllianceIDContactsLabelsOk: Codable, Hashable {
			
			
			public var labelID: Int64
			public var labelName: String
			
			public init(labelID: Int64, labelName: String) {
				self.labelID = labelID
				self.labelName = labelName
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case labelID = "label_id"
				case labelName = "label_name"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCorporationsCorporationIDContactsOk: Codable, Hashable {
			
			public enum GetCorporationsCorporationIDContactsContactType: String, Codable, CustomStringConvertible {
				case alliance = "alliance"
				case character = "character"
				case corporation = "corporation"
				case faction = "faction"
				
				public var description: String {
					return rawValue
				}
				
			}
			
			public var contactID: Int
			public var contactType: Contacts.GetCorporationsCorporationIDContactsOk.GetCorporationsCorporationIDContactsContactType
			public var isWatched: Bool?
			public var labelIds: [Int64]?
			public var standing: Float
			
			public init(contactID: Int, contactType: Contacts.GetCorporationsCorporationIDContactsOk.GetCorporationsCorporationIDContactsContactType, isWatched: Bool?, labelIds: [Int64]?, standing: Float) {
				self.contactID = contactID
				self.contactType = contactType
				self.isWatched = isWatched
				self.labelIds = labelIds
				self.standing = standing
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case contactID = "contact_id"
				case contactType = "contact_type"
				case isWatched = "is_watched"
				case labelIds = "label_ids"
				case standing
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
	}
	
}
