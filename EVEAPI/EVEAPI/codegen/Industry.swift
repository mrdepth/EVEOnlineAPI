import Foundation
import Alamofire
import Combine


extension ESI {
	public var industry: Industry {
		return Industry(esi: self, route: .path("industry", next: .root(ESI.apiURL)))
	}
	
	public struct Industry {
		let esi: ESI
		let route: APIRoute
		
		
		
		public func facilities() -> Facilities {
			Facilities(esi: esi, route: .path("facilities", next: route))
		}
		public func systems() -> Systems {
			Systems(esi: esi, route: .path("systems", next: route))
		}
		
		public struct Facilities {
			let esi: ESI
			let route: APIRoute
			
			
			public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
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
				
				
				public let facilityID: Int64
				public let ownerID: Int
				public let regionID: Int
				public let solarSystemID: Int
				public let tax: Double?
				public let typeID: Int
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case facilityID = "facility_id"
					case ownerID = "owner_id"
					case regionID = "region_id"
					case solarSystemID = "solar_system_id"
					case tax
					case typeID = "type_id"
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
		}
		
		public struct Systems {
			let esi: ESI
			let route: APIRoute
			
			
			public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
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
				
				
				public let costIndices: [ESI.Industry.Systems.CostIndice]
				public let solarSystemID: Int
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case costIndices = "cost_indices"
					case solarSystemID = "solar_system_id"
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
			public struct CostIndice: Codable, Hashable {
				
				public enum Activity: String, Codable, CustomStringConvertible {
					case copying
					case duplicating
					case invention
					case manufacturing
					case none
					case reaction
					case researchingMaterialEfficiency = "researching_material_efficiency"
					case researchingTechnology = "researching_technology"
					case researchingTimeEfficiency = "researching_time_efficiency"
					case reverseEngineering = "reverse_engineering"
					
					public var description: String {
						return rawValue
					}
					
				}
				
				public let activity: ESI.Industry.Systems.CostIndice.Activity
				public let costIndex: Double
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case activity
					case costIndex = "cost_index"
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
		}
		
		
		
	}
	
}
