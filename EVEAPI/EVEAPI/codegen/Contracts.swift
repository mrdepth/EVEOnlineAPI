import Foundation
import Alamofire
import Combine


extension ESI {
	public var contracts: Contracts {
		return Contracts(esi: self, route: .path("contracts", next: .root(ESI.apiURL)))
	}
	
	public struct Contracts {
		let esi: ESI
		let route: APIRoute
		
		
		
		public func `public`() -> Public {
			Public(esi: esi, route: .path("public", next: route))
		}
		
		public struct Public {
			let esi: ESI
			let route: APIRoute
			
			
			
			public func bids() -> Bids {
				Bids(esi: esi, route: .path("bids", next: route))
			}
			public func items() -> Items {
				Items(esi: esi, route: .path("items", next: route))
			}
			public func regionID(_ value: Int) -> RegionID {
				RegionID(esi: esi, route: .parameter(value, next: route))
			}
			
			public struct Bids {
				let esi: ESI
				let route: APIRoute
				
				
				
				public func contractID(_ value: Int) -> ContractID {
					ContractID(esi: esi, route: .parameter(value, next: route))
				}
				
				public struct ContractID {
					let esi: ESI
					let route: APIRoute
					
					
					public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
						do {
							
							
							
							
							var headers = HTTPHeaders()
							headers["Accept"] = "application/json"
							
							
							var query = [URLQueryItem]()
							query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
							if let page = page {
								query.append(URLQueryItem(name: "page", value: page.description))
							}
							
							let url = try route.asURL()
							var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
							components.queryItems = query
							
							return esi.session.publisher(components,
							method: .get,
							encoding: URLEncoding.default,
							headers: headers,
							interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
							
						}
						catch {
							return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
						}
					}
					
					
					
					
					
					
					public struct Success: Codable, Hashable {
						
						
						public let amount: Double
						public let bidID: Int
						public let dateBid: Date
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case amount
							case bidID = "bid_id"
							case dateBid = "date_bid"
							
							var dateFormatter: DateFormatter? {
								switch self {
									case .dateBid:
									return DateFormatter.esiDateTimeFormatter
									default:
									return nil
								}
							}
						}
					}
					
				}
				
				
				
			}
			
			public struct Items {
				let esi: ESI
				let route: APIRoute
				
				
				
				public func contractID(_ value: Int) -> ContractID {
					ContractID(esi: esi, route: .parameter(value, next: route))
				}
				
				public struct ContractID {
					let esi: ESI
					let route: APIRoute
					
					
					public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
						do {
							
							
							
							
							var headers = HTTPHeaders()
							headers["Accept"] = "application/json"
							
							
							var query = [URLQueryItem]()
							query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
							if let page = page {
								query.append(URLQueryItem(name: "page", value: page.description))
							}
							
							let url = try route.asURL()
							var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
							components.queryItems = query
							
							return esi.session.publisher(components,
							method: .get,
							encoding: URLEncoding.default,
							headers: headers,
							interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
							
						}
						catch {
							return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
						}
					}
					
					
					
					
					
					
					public struct Success: Codable, Hashable {
						
						
						public let isBlueprintCopy: Bool?
						public let isIncluded: Bool
						public let itemID: Int64?
						public let materialEfficiency: Int?
						public let quantity: Int
						public let recordID: Int64
						public let runs: Int?
						public let timeEfficiency: Int?
						public let typeID: Int
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case isBlueprintCopy = "is_blueprint_copy"
							case isIncluded = "is_included"
							case itemID = "item_id"
							case materialEfficiency = "material_efficiency"
							case quantity
							case recordID = "record_id"
							case runs
							case timeEfficiency = "time_efficiency"
							case typeID = "type_id"
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
				}
				
				
				
			}
			
			public struct RegionID {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
					do {
						
						
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						if let page = page {
							query.append(URLQueryItem(name: "page", value: page.description))
						}
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public let buyout: Double?
					public let collateral: Double?
					public let contractID: Int
					public let dateExpired: Date
					public let dateIssued: Date
					public let daysToComplete: Int?
					public let endLocationID: Int64?
					public let forCorporation: Bool?
					public let issuerCorporationID: Int
					public let issuerID: Int
					public let price: Double?
					public let reward: Double?
					public let startLocationID: Int64?
					public let title: String?
					public let type: ESI.Contracts.ValueType
					public let volume: Double?
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case buyout
						case collateral
						case contractID = "contract_id"
						case dateExpired = "date_expired"
						case dateIssued = "date_issued"
						case daysToComplete = "days_to_complete"
						case endLocationID = "end_location_id"
						case forCorporation = "for_corporation"
						case issuerCorporationID = "issuer_corporation_id"
						case issuerID = "issuer_id"
						case price
						case reward
						case startLocationID = "start_location_id"
						case title
						case type
						case volume
						
						var dateFormatter: DateFormatter? {
							switch self {
								case .dateExpired:
								return DateFormatter.esiDateTimeFormatter
								case .dateIssued:
								return DateFormatter.esiDateTimeFormatter
								default:
								return nil
							}
						}
					}
				}
				
			}
			
			
			
		}
		
		
		public enum ValueType: String, Codable, CustomStringConvertible {
			case unknown
			case itemExchange = "item_exchange"
			case auction
			case courier
			case loan
			
			public var description: String {
				return rawValue
			}
			
		}
		
	}
	
}
