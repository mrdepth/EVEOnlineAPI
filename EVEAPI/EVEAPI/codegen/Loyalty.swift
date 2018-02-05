import Foundation
import Alamofire


public extension ESI {
	public var loyalty: Loyalty {
		return Loyalty(sessionManager: self)
	}
	
	class Loyalty {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		public func getLoyaltyPoints(characterID: Int, completionBlock:((Result<[Loyalty.Point]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-characters.read_loyalty.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/loyalty/points/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Loyalty.Point]>) in
					completionBlock?(response.result)
					session = nil
				}
			}
		}
		
		public func listLoyaltyStoreOffers(corporationID: Int, completionBlock:((Result<[Loyalty.Offer]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/loyalty/stores/\(corporationID)/offers/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Loyalty.Offer]>) in
					completionBlock?(response.result)
					session = nil
				}
			}
		}
		
		
		public struct Point: Codable, Hashable {
			
			
			public var corporationID: Int
			public var loyaltyPoints: Int
			
			public init(corporationID: Int, loyaltyPoints: Int) {
				self.corporationID = corporationID
				self.loyaltyPoints = loyaltyPoints
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: corporationID.hashValue)
				hashCombine(seed: &hash, value: loyaltyPoints.hashValue)
				return hash
			}
			
			public static func ==(lhs: Loyalty.Point, rhs: Loyalty.Point) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case corporationID = "corporation_id"
				case loyaltyPoints = "loyalty_points"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct Offer: Codable, Hashable {
			
			public struct GetLoyaltyStoresCorporationIDOffersRequiredItems: Codable, Hashable {
				
				
				public var quantity: Int
				public var typeID: Int
				
				public init(quantity: Int, typeID: Int) {
					self.quantity = quantity
					self.typeID = typeID
				}
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: quantity.hashValue)
					hashCombine(seed: &hash, value: typeID.hashValue)
					return hash
				}
				
				public static func ==(lhs: Loyalty.Offer.GetLoyaltyStoresCorporationIDOffersRequiredItems, rhs: Loyalty.Offer.GetLoyaltyStoresCorporationIDOffersRequiredItems) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case quantity
					case typeID = "type_id"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public var akCost: Int?
			public var iskCost: Int64
			public var lpCost: Int
			public var offerID: Int
			public var quantity: Int
			public var requiredItems: [Loyalty.Offer.GetLoyaltyStoresCorporationIDOffersRequiredItems]
			public var typeID: Int
			
			public init(akCost: Int?, iskCost: Int64, lpCost: Int, offerID: Int, quantity: Int, requiredItems: [Loyalty.Offer.GetLoyaltyStoresCorporationIDOffersRequiredItems], typeID: Int) {
				self.akCost = akCost
				self.iskCost = iskCost
				self.lpCost = lpCost
				self.offerID = offerID
				self.quantity = quantity
				self.requiredItems = requiredItems
				self.typeID = typeID
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: akCost?.hashValue ?? 0)
				hashCombine(seed: &hash, value: iskCost.hashValue)
				hashCombine(seed: &hash, value: lpCost.hashValue)
				hashCombine(seed: &hash, value: offerID.hashValue)
				hashCombine(seed: &hash, value: quantity.hashValue)
				self.requiredItems.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: typeID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Loyalty.Offer, rhs: Loyalty.Offer) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetLoyaltyStoresCorporationIDOffersNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Loyalty.GetLoyaltyStoresCorporationIDOffersNotFound, rhs: Loyalty.GetLoyaltyStoresCorporationIDOffersNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case error
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
	}
	
}
