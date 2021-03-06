import Foundation
import Alamofire
import Futures


public extension ESI {
	var insurance: Insurance {
		return Insurance(esi: self)
	}
	
	struct Insurance {
		let esi: ESI
		
		@discardableResult
		public func listInsuranceLevels(acceptLanguage: AcceptLanguage? = nil, ifNoneMatch: String? = nil, language: Language? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Insurance.Price]>> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = acceptLanguage?.httpQuery {
				headers["Accept-Language"] = v
			}
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = language?.httpQuery {
				query.append(URLQueryItem(name: "language", value: v))
			}
			
			let url = esi.baseURL + "/insurance/prices/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<[Insurance.Price]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<[Insurance.Price]>) in
				promise.set(response: response, cached: 3600.0)
			}
			return promise.future
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
