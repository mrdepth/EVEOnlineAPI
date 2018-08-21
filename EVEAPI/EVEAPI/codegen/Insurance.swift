import Foundation
import Alamofire
import Futures


public extension ESI {
	public var insurance: Insurance {
		return Insurance(esi: self)
	}
	
	class Insurance {
		weak var esi: ESI?
		
		init(esi: ESI) {
			self.esi = esi
		}
		
		@discardableResult
		public func listInsuranceLevels(acceptLanguage: AcceptLanguage? = nil, ifNoneMatch: String? = nil, language: Language? = nil) -> Future<ESI.Result<[Insurance.Price]>> {
			guard let esi = self.esi else { return .init(.failure(ESIError.internalError)) }
			
			
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
			
			let url = esi.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Insurance.Price]>>()
			esi.perform { [weak esi] () -> DataRequest? in
				return esi?.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Insurance.Price]>) in
					promise.set(result: response.result, cached: 3600.0)
				}
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
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: cost.hashValue)
					hashCombine(seed: &hash, value: name.hashValue)
					hashCombine(seed: &hash, value: payout.hashValue)
					return hash
				}
				
				public static func ==(lhs: Insurance.Price.GetInsurancePricesLevels, rhs: Insurance.Price.GetInsurancePricesLevels) -> Bool {
					return lhs.hashValue == rhs.hashValue
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
			
			public var hashValue: Int {
				var hash: Int = 0
				self.levels.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: typeID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Insurance.Price, rhs: Insurance.Price) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
