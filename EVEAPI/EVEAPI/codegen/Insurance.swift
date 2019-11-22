import Foundation
import Alamofire
import Combine


extension ESI {
	public var insurance: Insurance {
		return Insurance(esi: self, route: .path("insurance", next: .root(ESI.apiURL)))
	}
	
	public struct Insurance {
		let esi: ESI
		let route: APIRoute
		
		
		
		public func prices() -> Prices {
			Prices(esi: esi, route: .path("prices", next: route))
		}
		
		public struct Prices {
			let esi: ESI
			let route: APIRoute
			
			
			public func get(language: ESI.Markets.Language? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
				do {
					
					
					
					
					var headers = HTTPHeaders()
					headers["Accept"] = "application/json"
					
					
					var query = [URLQueryItem]()
					query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
					if let language = language {
						query.append(URLQueryItem(name: "language", value: language.description))
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
				
				
				public let levels: [ESI.Insurance.Prices.Level]
				public let typeID: Int
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case levels
					case typeID = "type_id"
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
			public struct Level: Codable, Hashable {
				
				
				public let cost: Double
				public let name: String
				public let payout: Double
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case cost
					case name
					case payout
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
		}
		
		
		
	}
	
}
