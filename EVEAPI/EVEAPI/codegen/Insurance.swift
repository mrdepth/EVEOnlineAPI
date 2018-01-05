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
		
		public func listInsuranceLevels(language: Language? = nil, completionBlock:((Result<[Insurance.Price]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
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
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Insurance.Price]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		public struct Price: Codable, Hashable {
			
			public struct GetInsurancePricesLevels: Codable, Hashable {
				
				
				public let cost: Float
				public let name: String
				public let payout: Float
				
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
			
			public let levels: [Insurance.Price.GetInsurancePricesLevels]
			public let typeID: Int
			
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
