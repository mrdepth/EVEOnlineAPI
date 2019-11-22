import Foundation
import Alamofire
import Combine


extension ESI {
	public var loyalty: Loyalty {
		return Loyalty(esi: self, route: .path("loyalty", next: .root(ESI.apiURL)))
	}
	
	public struct Loyalty {
		let esi: ESI
		let route: APIRoute
		
		
		
		public func stores() -> Stores {
			Stores(esi: esi, route: .path("stores", next: route))
		}
		
		public struct Stores {
			let esi: ESI
			let route: APIRoute
			
			
			
			public func corporationID(_ value: Int) -> CorporationID {
				CorporationID(esi: esi, route: .parameter(value, next: route))
			}
			
			public struct CorporationID {
				let esi: ESI
				let route: APIRoute
				
				
				
				public func offers() -> Offers {
					Offers(esi: esi, route: .path("offers", next: route))
				}
				
				public struct Offers {
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
						
						
						public let akCost: Int?
						public let iskCost: Int64
						public let lpCost: Int
						public let offerID: Int
						public let quantity: Int
						public let requiredItems: [ESI.Loyalty.Stores.CorporationID.Offers.RequiredItem]
						public let typeID: Int
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case akCost = "ak_cost"
							case iskCost = "isk_cost"
							case lpCost = "lp_cost"
							case offerID = "offer_id"
							case quantity
							case requiredItems = "required_items"
							case typeID = "type_id"
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
					public struct RequiredItem: Codable, Hashable {
						
						
						public let quantity: Int
						public let typeID: Int
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case quantity
							case typeID = "type_id"
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
				}
				
				
				
			}
			
			
			
		}
		
		
		
	}
	
}
