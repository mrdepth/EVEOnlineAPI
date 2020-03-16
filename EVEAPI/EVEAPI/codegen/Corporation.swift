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
					
					
					public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Corporation.CorporationID.Mining.Extractions.Success]>, AFError> {
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
							
							let publisher = esi.publisher(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
							if let progress = progress {
								return publisher
								.downloadProgress(closure: progress)
								.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
								.eraseToAnyPublisher()
							}
							else {
								return publisher
								.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
								.eraseToAnyPublisher()
							}
						}
						catch {
							return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
						}
					}
					
					
					
					
					
					
					public struct Success: Codable, Hashable {
						
						
						public var chunkArrivalTime: Date
						public var extractionStartTime: Date
						public var moonID: Int
						public var naturalDecayTime: Date
						public var structureID: Int64
						public init(chunkArrivalTime: Date, extractionStartTime: Date, moonID: Int, naturalDecayTime: Date, structureID: Int64) {
							self.chunkArrivalTime = chunkArrivalTime
							self.extractionStartTime = extractionStartTime
							self.moonID = moonID
							self.naturalDecayTime = naturalDecayTime
							self.structureID = structureID
						}
						
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
					
					
					public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Corporation.CorporationID.Mining.Observers.Success]>, AFError> {
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
							
							let publisher = esi.publisher(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
							if let progress = progress {
								return publisher
								.downloadProgress(closure: progress)
								.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
								.eraseToAnyPublisher()
							}
							else {
								return publisher
								.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
								.eraseToAnyPublisher()
							}
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
						
						
						public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Corporation.CorporationID.Mining.Observers.ObserverID.Success]>, AFError> {
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
								
								let publisher = esi.publisher(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
								if let progress = progress {
									return publisher
									.downloadProgress(closure: progress)
									.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
									.eraseToAnyPublisher()
								}
								else {
									return publisher
									.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
									.eraseToAnyPublisher()
								}
							}
							catch {
								return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
							}
						}
						
						
						
						
						
						
						public struct Success: Codable, Hashable {
							
							
							public var characterID: Int
							public var lastUpdated: Date
							public var quantity: Int64
							public var recordedCorporationID: Int
							public var typeID: Int
							public init(characterID: Int, lastUpdated: Date, quantity: Int64, recordedCorporationID: Int, typeID: Int) {
								self.characterID = characterID
								self.lastUpdated = lastUpdated
								self.quantity = quantity
								self.recordedCorporationID = recordedCorporationID
								self.typeID = typeID
							}
							
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
						
						
						public var lastUpdated: Date
						public var observerID: Int64
						public var observerType: ESI.Corporation.CorporationID.Mining.Observers.ObserverType
						public init(lastUpdated: Date, observerID: Int64, observerType: ESI.Corporation.CorporationID.Mining.Observers.ObserverType) {
							self.lastUpdated = lastUpdated
							self.observerID = observerID
							self.observerType = observerType
						}
						
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
