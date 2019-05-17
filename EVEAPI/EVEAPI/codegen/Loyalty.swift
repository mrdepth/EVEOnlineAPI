import Foundation
import Alamofire
import Futures


public extension ESI {
	var loyalty: Loyalty {
		return Loyalty(esi: self)
	}
	
	struct Loyalty {
		let esi: ESI
		
		@discardableResult
		public func listLoyaltyStoreOffers(corporationID: Int, ifNoneMatch: String? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Loyalty.Offer]>> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/loyalty/stores/\(corporationID)/offers/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<[Loyalty.Offer]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<[Loyalty.Offer]>) in
				promise.set(response: response, cached: nil)
			}
			return promise.future
		}
		
		@discardableResult
		public func getLoyaltyPoints(characterID: Int, ifNoneMatch: String? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Loyalty.Point]>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-characters.read_loyalty.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/characters/\(characterID)/loyalty/points/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<[Loyalty.Point]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<[Loyalty.Point]>) in
				promise.set(response: response, cached: 3600.0)
			}
			return promise.future
		}
		
		
		public struct Offer: Codable, Hashable {
			
			public struct GetLoyaltyStoresCorporationIDOffersRequiredItems: Codable, Hashable {
				
				
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
		
		
		public struct Point: Codable, Hashable {
			
			
			public var corporationID: Int
			public var loyaltyPoints: Int
			
			public init(corporationID: Int, loyaltyPoints: Int) {
				self.corporationID = corporationID
				self.loyaltyPoints = loyaltyPoints
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
		
		
		public struct GetLoyaltyStoresCorporationIDOffersNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
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
