import Foundation
import Alamofire
import Combine


extension ESI {
	public var markets: Markets {
		return Markets(esi: self, route: .path("markets", next: .root(ESI.apiURL)))
	}
	
	public struct Markets {
		let esi: ESI
		let route: APIRoute
		
		
		
		public func groups() -> Groups {
			Groups(esi: esi, route: .path("groups", next: route))
		}
		public func prices() -> Prices {
			Prices(esi: esi, route: .path("prices", next: route))
		}
		public func structures() -> Structures {
			Structures(esi: esi, route: .path("structures", next: route))
		}
		public func regionID(_ value: Int) -> RegionID {
			RegionID(esi: esi, route: .parameter(value, next: route))
		}
		
		public struct Groups {
			let esi: ESI
			let route: APIRoute
			
			
			public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Int], AFError> {
				do {
					
					
					
					
					var headers = HTTPHeaders()
					headers["Accept"] = "application/json"
					
					
					var query = [URLQueryItem]()
					query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
					
					
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
			
			
			public func marketGroupID(_ value: Int) -> MarketGroupID {
				MarketGroupID(esi: esi, route: .parameter(value, next: route))
			}
			
			public struct MarketGroupID {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(language: ESI.Markets.Language? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Success, AFError> {
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
					
					
					public let localizedDescription: String
					public let marketGroupID: Int
					public let name: String
					public let parentGroupID: Int?
					public let types: [Int]
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case localizedDescription = "description"
						case marketGroupID = "market_group_id"
						case name
						case parentGroupID = "parent_group_id"
						case types
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
			}
			
			
			
		}
		
		public struct Prices {
			let esi: ESI
			let route: APIRoute
			
			
			public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
				do {
					
					
					
					
					var headers = HTTPHeaders()
					headers["Accept"] = "application/json"
					
					
					var query = [URLQueryItem]()
					query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
					
					
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
				
				
				public let adjustedPrice: Double?
				public let averagePrice: Double?
				public let typeID: Int
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case adjustedPrice = "adjusted_price"
					case averagePrice = "average_price"
					case typeID = "type_id"
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
		}
		
		public struct Structures {
			let esi: ESI
			let route: APIRoute
			
			
			
			public func structureID(_ value: Int64) -> StructureID {
				StructureID(esi: esi, route: .parameter(value, next: route))
			}
			
			public struct StructureID {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
					do {
						
						let scopes = esi.token?.scopes ?? []
						guard scopes.contains("esi-markets.structure_markets.v1") else {throw ESIError.forbidden}
						
						
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
					
					
					public let duration: Int
					public let isBuyOrder: Bool
					public let issued: Date
					public let locationID: Int64
					public let minVolume: Int
					public let orderID: Int64
					public let price: Double
					public let range: ESI.Markets.Range
					public let typeID: Int
					public let volumeRemain: Int
					public let volumeTotal: Int
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case duration
						case isBuyOrder = "is_buy_order"
						case issued
						case locationID = "location_id"
						case minVolume = "min_volume"
						case orderID = "order_id"
						case price
						case range
						case typeID = "type_id"
						case volumeRemain = "volume_remain"
						case volumeTotal = "volume_total"
						
						var dateFormatter: DateFormatter? {
							switch self {
								case .issued:
								return DateFormatter.esiDateTimeFormatter
								default:
								return nil
							}
						}
					}
				}
				
			}
			
			
			
		}
		
		public struct RegionID {
			let esi: ESI
			let route: APIRoute
			
			
			
			public func history() -> History {
				History(esi: esi, route: .path("history", next: route))
			}
			public func orders() -> Orders {
				Orders(esi: esi, route: .path("orders", next: route))
			}
			public func types() -> Types {
				Types(esi: esi, route: .path("types", next: route))
			}
			
			public struct History {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(typeID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
					do {
						
						
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						query.append(URLQueryItem(name: "type_id", value: typeID.description))
						
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
					
					
					public let average: Double
					public let date: Date
					public let highest: Double
					public let lowest: Double
					public let orderCount: Int64
					public let volume: Int64
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case average
						case date
						case highest
						case lowest
						case orderCount = "order_count"
						case volume
						
						var dateFormatter: DateFormatter? {
							switch self {
								case .date:
								return DateFormatter.esiDateFormatter
								default:
								return nil
							}
						}
					}
				}
				
			}
			
			public struct Orders {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(orderType: ESI.Markets.RegionID.Orders.OrderType = .all, page: Int? = nil, typeID: Int?, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
					do {
						
						
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						query.append(URLQueryItem(name: "order_type", value: orderType.description))
						if let page = page {
							query.append(URLQueryItem(name: "page", value: page.description))
						}
						if let typeID = typeID {
							query.append(URLQueryItem(name: "type_id", value: typeID.description))
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
					
					
					public let duration: Int
					public let isBuyOrder: Bool
					public let issued: Date
					public let locationID: Int64
					public let minVolume: Int
					public let orderID: Int64
					public let price: Double
					public let range: ESI.Markets.Range
					public let systemID: Int
					public let typeID: Int
					public let volumeRemain: Int
					public let volumeTotal: Int
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case duration
						case isBuyOrder = "is_buy_order"
						case issued
						case locationID = "location_id"
						case minVolume = "min_volume"
						case orderID = "order_id"
						case price
						case range
						case systemID = "system_id"
						case typeID = "type_id"
						case volumeRemain = "volume_remain"
						case volumeTotal = "volume_total"
						
						var dateFormatter: DateFormatter? {
							switch self {
								case .issued:
								return DateFormatter.esiDateTimeFormatter
								default:
								return nil
							}
						}
					}
				}
				
				public enum OrderType: String, Codable, CustomStringConvertible {
					case buy
					case sell
					case all
					
					public var description: String {
						return rawValue
					}
					
				}
				
			}
			
			public struct Types {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Int], AFError> {
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
				
				
				
				
				
				
				
			}
			
			
			
		}
		
		
		public enum AcceptLanguage: String, Codable, CustomStringConvertible {
			case de
			case enUS = "en-us"
			case fr
			case ja
			case ru
			case zh
			case ko
			
			public var description: String {
				return rawValue
			}
			
		}
		
		public enum Language: String, Codable, CustomStringConvertible {
			case de
			case enUS = "en-us"
			case fr
			case ja
			case ru
			case zh
			case ko
			
			public var description: String {
				return rawValue
			}
			
		}
		
		public enum Range: String, Codable, CustomStringConvertible {
			case station
			case region
			case solarsystem
			case i1 = "1"
			case i2 = "2"
			case i3 = "3"
			case i4 = "4"
			case i5 = "5"
			case i10 = "10"
			case i20 = "20"
			case i30 = "30"
			case i40 = "40"
			
			public var description: String {
				return rawValue
			}
			
		}
		
	}
	
}
