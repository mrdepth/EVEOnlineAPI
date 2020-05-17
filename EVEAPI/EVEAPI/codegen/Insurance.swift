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
			
			
			public func get(language: ESI.Corporations.Language? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Insurance.Prices.Success]>, AFError> {
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
					
					let session = esi.session
					
					return Deferred { () -> AnyPublisher<ESIResponse<[ESI.Insurance.Prices.Success]>, AFError> in
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
			
		}
		
		
		
	}
	
}
