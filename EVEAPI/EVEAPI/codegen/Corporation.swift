import Foundation
import Alamofire
import Combine


extension ESI {
	public var corporation: Corporation {
		return Corporation(esi: self, route: .path("corporation", next: .root(ESI.apiURL)))
	}
	
	public struct Corporation {
		let esi: ESI
		let route: APIRoute
		
		
		
		public func corporationID(_ value: Int) -> CorporationID {
			CorporationID(esi: esi, route: .parameter(value, next: route))
		}
		
		public struct CorporationID {
			let esi: ESI
			let route: APIRoute
			
			
			
			public func mining() -> Mining {
				Mining(esi: esi, route: .path("mining", next: route))
			}
			
			public struct Mining {
				let esi: ESI
				let route: APIRoute
				
				
				
				public func extractions() -> Extractions {
					Extractions(esi: esi, route: .path("extractions", next: route))
				}
				public func observers() -> Observers {
					Observers(esi: esi, route: .path("observers", next: route))
				}
				
				public struct Extractions {
					let esi: ESI
					let route: APIRoute
					
					
					public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-industry.read_corporation_mining.v1") else {throw ESIError.forbidden}
							
							
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
					
					
					
					
					
					
					public struct Success: Codable, Hashable {
						
						
						public let chunkArrivalTime: Date
						public let extractionStartTime: Date
						public let moonID: Int
						public let naturalDecayTime: Date
						public let structureID: Int64
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case chunkArrivalTime = "chunk_arrival_time"
							case extractionStartTime = "extraction_start_time"
							case moonID = "moon_id"
							case naturalDecayTime = "natural_decay_time"
							case structureID = "structure_id"
							
							var dateFormatter: DateFormatter? {
								switch self {
									case .chunkArrivalTime:
									return DateFormatter.esiDateTimeFormatter
									case .extractionStartTime:
									return DateFormatter.esiDateTimeFormatter
									case .naturalDecayTime:
									return DateFormatter.esiDateTimeFormatter
									default:
									return nil
								}
							}
						}
					}
					
				}
				
				public struct Observers {
					let esi: ESI
					let route: APIRoute
					
					
					public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
						do {
							
							let scopes = esi.token?.scopes ?? []
							guard scopes.contains("esi-industry.read_corporation_mining.v1") else {throw ESIError.forbidden}
							
							
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
					
					
					public func observerID(_ value: Int64) -> ObserverID {
						ObserverID(esi: esi, route: .parameter(value, next: route))
					}
					
					public struct ObserverID {
						let esi: ESI
						let route: APIRoute
						
						
						public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
							do {
								
								let scopes = esi.token?.scopes ?? []
								guard scopes.contains("esi-industry.read_corporation_mining.v1") else {throw ESIError.forbidden}
								
								
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
						
						
						
						
						
						
						public struct Success: Codable, Hashable {
							
							
							public let characterID: Int
							public let lastUpdated: Date
							public let quantity: Int64
							public let recordedCorporationID: Int
							public let typeID: Int
							
							enum CodingKeys: String, CodingKey, DateFormatted {
								case characterID = "character_id"
								case lastUpdated = "last_updated"
								case quantity
								case recordedCorporationID = "recorded_corporation_id"
								case typeID = "type_id"
								
								var dateFormatter: DateFormatter? {
									switch self {
										case .lastUpdated:
										return DateFormatter.esiDateFormatter
										default:
										return nil
									}
								}
							}
						}
						
					}
					
					
					public struct Success: Codable, Hashable {
						
						
						public let lastUpdated: Date
						public let observerID: Int64
						public let observerType: ESI.Corporation.CorporationID.Mining.Observers.ObserverType
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case lastUpdated = "last_updated"
							case observerID = "observer_id"
							case observerType = "observer_type"
							
							var dateFormatter: DateFormatter? {
								switch self {
									case .lastUpdated:
									return DateFormatter.esiDateFormatter
									default:
									return nil
								}
							}
						}
					}
					
					public enum ObserverType: String, Codable, CustomStringConvertible {
						case structure
						
						public var description: String {
							return rawValue
						}
						
					}
					
				}
				
				
				
			}
			
			
			
		}
		
		
		
	}
	
}
