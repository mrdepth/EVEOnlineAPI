import Foundation
import Alamofire
import Combine


extension ESI {
	public var alliances: Alliances {
		return Alliances(esi: self, route: .path("alliances", next: .root(ESI.apiURL)))
	}
	
	public struct Alliances {
		let esi: ESI
		let route: APIRoute
		
		
		public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Int], AFError> {
			do {
				
				
				
				
				var headers = HTTPHeaders()
				headers["Accept"] = "application/json"
				
				
				var query = [URLQueryItem]()
				query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
				
				
				let url = try route.asURL()
				var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
				components.queryItems = query
				
				return esi.session.publisher(components,
				method: .get,
				encoding: URLEncoding.default,
				headers: headers,
				interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
				.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
				.eraseToAnyPublisher()
				
			}
			catch {
				return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
			}
		}
		
		
		public func allianceID(_ value: Int) -> AllianceID {
			AllianceID(esi: esi, route: .parameter(value, next: route))
		}
		
		public struct AllianceID {
			let esi: ESI
			let route: APIRoute
			
			
			public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Success, AFError> {
				do {
					
					
					
					
					var headers = HTTPHeaders()
					headers["Accept"] = "application/json"
					
					
					var query = [URLQueryItem]()
					query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
					
					
					let url = try route.asURL()
					var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
					components.queryItems = query
					
					return esi.session.publisher(components,
					method: .get,
					encoding: URLEncoding.default,
					headers: headers,
					interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
					.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
					.eraseToAnyPublisher()
					
				}
				catch {
					return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
				}
			}
			
			
			public func contacts() -> Contacts {
				Contacts(esi: esi, route: .path("contacts", next: route))
			}
			public func corporations() -> Corporations {
				Corporations(esi: esi, route: .path("corporations", next: route))
			}
			public func icons() -> Icons {
				Icons(esi: esi, route: .path("icons", next: route))
			}
			
			public struct Contacts {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-alliances.read_contacts.v1") else {throw ESIError.forbidden}
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						if let page = page {
							query.append(URLQueryItem(name: "page", value: page.description))
						}
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				public func labels() -> Labels {
					Labels(esi: esi, route: .path("labels", next: route))
				}
				
				public struct Labels {
					let esi: ESI
					let route: APIRoute
					
					
					public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-alliances.read_contacts.v1") else {throw ESIError.forbidden}
							
							
							var headers = HTTPHeaders()
							headers["Accept"] = "application/json"
							
							
							var query = [URLQueryItem]()
							query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
							
							
							let url = try route.asURL()
							var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
							components.queryItems = query
							
							return esi.session.publisher(components,
							method: .get,
							encoding: URLEncoding.default,
							headers: headers,
							interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
							
						}
						catch {
							return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
						}
					}
					
					
					
					
					
					
					
				}
				
				
				public struct Success: Codable, Hashable {
					
					
					public let contactID: Int
					public let contactType: ESI.Characters.ContactType
					public let labelIds: [Int64]?
					public let standing: Double
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case contactID = "contact_id"
						case contactType = "contact_type"
						case labelIds = "label_ids"
						case standing
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
			}
			
			public struct Corporations {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Int], AFError> {
					do {
						
						
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				
			}
			
			public struct Icons {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Success, AFError> {
					do {
						
						
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public let px128x128: String?
					public let px64x64: String?
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case px128x128
						case px64x64
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
			}
			
			
			public struct Success: Codable, Hashable {
				
				
				public let creatorCorporationID: Int
				public let creatorID: Int
				public let dateFounded: Date
				public let executorCorporationID: Int?
				public let factionID: Int?
				public let name: String
				public let ticker: String
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case creatorCorporationID = "creator_corporation_id"
					case creatorID = "creator_id"
					case dateFounded = "date_founded"
					case executorCorporationID = "executor_corporation_id"
					case factionID = "faction_id"
					case name
					case ticker
					
					var dateFormatter: DateFormatter? {
						switch self {
							case .dateFounded:
							return DateFormatter.esiDateTimeFormatter
							default:
							return nil
						}
					}
				}
			}
			
		}
		
		
		
	}
	
}
