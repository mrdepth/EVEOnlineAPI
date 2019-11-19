import Foundation
import Alamofire
import Combine


extension ESI {
	public var insurance: Insurance {
		return Insurance(esi: self)
	}
	
	public struct Insurance {
		let esi: ESI
		
		
		public func listInsuranceLevels(acceptLanguage: AcceptLanguage? = nil, language: Language? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Insurance.Price], AFError> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = acceptLanguage?.description {
				headers["Accept-Language"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = language?.description {
				query.append(URLQueryItem(name: "language", value: v.lazy.map{$0.description}.joined(separator: ",")))
			}
			
			        let url = ESI.apiURL.appendingPathComponent("/insurance/prices/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .get,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
			            .eraseToAnyPublisher()
		}
		
		
		public struct Price: Codable, Hashable {
			
			public struct GetInsurancePricesLevels: Codable, Hashable {
				
				
				public var cost: Float
				public var name: String
				public var payout: Float
				
				public init(cost: Float, name: String, payout: Float) {
					self.cost = cost
					self.name = name
					self.payout = payout
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case cost
					case name
					case payout
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public var levels: [Insurance.Price.GetInsurancePricesLevels]
			public var typeID: Int
			
			public init(levels: [Insurance.Price.GetInsurancePricesLevels], typeID: Int) {
				self.levels = levels
				self.typeID = typeID
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case levels
				case typeID = "type_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
	}
	
}
