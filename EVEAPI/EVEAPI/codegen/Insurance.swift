import Foundation
import Alamofire


public extension ESI {
	public var insurance: Insurance {
		return Insurance(sessionManager: self)
	}
	
	class Insurance {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		@discardableResult
		public func listInsuranceLevels(language: Language? = nil) -> Future<ESI.Result<[Insurance.Price]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Insurance.Price]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			if let v = language?.httpQuery {
				query.append(URLQueryItem(name: "language", value: v))
			}
			
			let url = session!.baseURL + "/v1/insurance/prices/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Insurance.Price]>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
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
