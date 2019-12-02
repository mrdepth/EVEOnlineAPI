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
			
			
			public func get(language: ESI.Opportunities.Language? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
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
			
			
			
			
			
			
			public struct Level: Codable, Hashable {
				
				
				public var cost: Double
				public var name: String
				public var payout: Double
				public init(cost: Double, name: String, payout: Double) {
					self.cost = cost
					self.name = name
					self.payout = payout
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case cost
					case name
					case payout
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
			public struct Success: Codable, Hashable {
				
				
				public var levels: [ESI.Insurance.Prices.Level]
				public var typeID: Int
				public init(levels: [ESI.Insurance.Prices.Level], typeID: Int) {
					self.levels = levels
					self.typeID = typeID
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case levels
					case typeID = "type_id"
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
		}
		
		
		
	}
	
}
