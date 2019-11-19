import Foundation
import Alamofire
import Combine


extension ESI {
	public var loyalty: Loyalty {
		return Loyalty(esi: self)
	}
	
	public struct Loyalty {
		let esi: ESI
		
		
		public func listLoyaltyStoreOffers(corporationID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Loyalty.Offer], AFError> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/loyalty/stores/\(corporationID)/offers/")
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
		
		
		public func getLoyaltyPoints(characterID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Loyalty.Point], AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-characters.read_loyalty.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/characters/\(characterID)/loyalty/points/")
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
		
		
	}
	
}
