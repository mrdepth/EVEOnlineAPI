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
					
					
					public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Loyalty.Stores.CorporationID.Offers.Success]>, AFError> {
						do {
							
							
							
							
							var headers = HTTPHeaders()
							headers["Accept"] = "application/json"
							
							
							var query = [URLQueryItem]()
							query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
							
							
							let url = try route.asURL()
							var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
							components.queryItems = query
							
							let session = esi.session
							
							return Deferred { () -> AnyPublisher<ESIResponse<[ESI.Loyalty.Stores.CorporationID.Offers.Success]>, AFError> in
								var request = session.request(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
								
								if let progress = progress {
									request = request.downloadProgress(closure: progress)
								}
								
								return request.publishDecodable(queue: session.serializationQueue, decoder: ESI.jsonDecoder)
								.tryMap { response in
									try ESIResponse(value: response.result.get(), httpHeaders: response.response?.headers)
								}
								.mapError{$0 as! AFError}
								.handleEvents(receiveCompletion: { (_) in
									withExtendedLifetime(session) {}
								}).eraseToAnyPublisher()
							}.eraseToAnyPublisher()
						}
						catch {
							return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
						}
					}
					
					
					
					
					
					
					public struct RequiredItem: Codable, Hashable {
						
						
						public var quantity: Int
						public var typeID: Int
						public init(quantity: Int, typeID: Int) {
							self.quantity = quantity
							self.typeID = typeID
						}
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case quantity
							case typeID = "type_id"
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
					public struct Success: Codable, Hashable {
						
						
						public var akCost: Int?
						public var iskCost: Int64
						public var lpCost: Int
						public var offerID: Int
						public var quantity: Int
						public var requiredItems: [ESI.Loyalty.Stores.CorporationID.Offers.RequiredItem]
						public var typeID: Int
						public init(akCost: Int?, iskCost: Int64, lpCost: Int, offerID: Int, quantity: Int, requiredItems: [ESI.Loyalty.Stores.CorporationID.Offers.RequiredItem], typeID: Int) {
							self.akCost = akCost
							self.iskCost = iskCost
							self.lpCost = lpCost
							self.offerID = offerID
							self.quantity = quantity
							self.requiredItems = requiredItems
							self.typeID = typeID
						}
						
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
					
				}
				
				
				
			}
			
			
			
		}
		
		
		
	}
	
}
