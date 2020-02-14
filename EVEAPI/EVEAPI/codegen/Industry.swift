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
			
			
			public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[Success]>, AFError> {
				do {
					
					
					
					
					var headers = HTTPHeaders()
					headers["Accept"] = "application/json"
					
					
					var query = [URLQueryItem]()
					query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
					
					
					let url = try route.asURL()
					var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
					components.queryItems = query
					
					let publisher = esi.session.publisher(components,
					method: .get,
					encoding: URLEncoding.default,
					headers: headers,
					interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
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
				
				
				public var facilityID: Int64
				public var ownerID: Int
				public var regionID: Int
				public var solarSystemID: Int
				public var tax: Double?
				public var typeID: Int
				public init(facilityID: Int64, ownerID: Int, regionID: Int, solarSystemID: Int, tax: Double?, typeID: Int) {
					self.facilityID = facilityID
					self.ownerID = ownerID
					self.regionID = regionID
					self.solarSystemID = solarSystemID
					self.tax = tax
					self.typeID = typeID
				}
				
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
			
			
			public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[Success]>, AFError> {
				do {
					
					
					
					
					var headers = HTTPHeaders()
					headers["Accept"] = "application/json"
					
					
					var query = [URLQueryItem]()
					query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
					
					
					let url = try route.asURL()
					var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
					components.queryItems = query
					
					let publisher = esi.session.publisher(components,
					method: .get,
					encoding: URLEncoding.default,
					headers: headers,
					interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
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
				
				
				public var costIndices: [ESI.Industry.Systems.CostIndice]
				public var solarSystemID: Int
				public init(costIndices: [ESI.Industry.Systems.CostIndice], solarSystemID: Int) {
					self.costIndices = costIndices
					self.solarSystemID = solarSystemID
				}
				
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
				
				public var activity: ESI.Industry.Systems.CostIndice.Activity
				public var costIndex: Double
				public init(activity: ESI.Industry.Systems.CostIndice.Activity, costIndex: Double) {
					self.activity = activity
					self.costIndex = costIndex
				}
				
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
