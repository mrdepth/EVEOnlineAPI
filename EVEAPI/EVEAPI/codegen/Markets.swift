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
			
			
			public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[Int]>, AFError> {
				do {
					
					
					
					
					var headers = HTTPHeaders()
					headers["Accept"] = "application/json"
					
					
					var query = [URLQueryItem]()
					query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
					
					
					let url = try route.asURL()
					var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
					components.queryItems = query
					
					let session = esi.session
					
					return Deferred { () -> AnyPublisher<ESIResponse<[Int]>, AFError> in
						var request = session.request(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						
						if let progress = progress {
							request = request.downloadProgress(closure: progress)
						}
						
						return request.publishDecodable(queue: session.serializationQueue, decoder: ESI.jsonDecoder)
						.tryMap { response in
							try ESIResponse(value: response.result.get(), httpHeaders: response.response?.headers)
						}
						.mapError{$0 as! AFError}
						.handleEvents(receiveCompletion: { (_) in
							withExtendedLifetime(session) {}
						}).eraseToAnyPublisher()
					}.eraseToAnyPublisher()
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
				
				
				public func get(language: ESI.Corporations.Language? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<ESI.Markets.Groups.MarketGroupID.Success>, AFError> {
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
						
						let session = esi.session
						
						return Deferred { () -> AnyPublisher<ESIResponse<ESI.Markets.Groups.MarketGroupID.Success>, AFError> in
							var request = session.request(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
							
							if let progress = progress {
								request = request.downloadProgress(closure: progress)
							}
							
							return request.publishDecodable(queue: session.serializationQueue, decoder: ESI.jsonDecoder)
							.tryMap { response in
								try ESIResponse(value: response.result.get(), httpHeaders: response.response?.headers)
							}
							.mapError{$0 as! AFError}
							.handleEvents(receiveCompletion: { (_) in
								withExtendedLifetime(session) {}
							}).eraseToAnyPublisher()
						}.eraseToAnyPublisher()
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public var localizedDescription: String
					public var marketGroupID: Int
					public var name: String
					public var parentGroupID: Int?
					public var types: [Int]
					public init(localizedDescription: String, marketGroupID: Int, name: String, parentGroupID: Int?, types: [Int]) {
						self.localizedDescription = localizedDescription
						self.marketGroupID = marketGroupID
						self.name = name
						self.parentGroupID = parentGroupID
						self.types = types
					}
					
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
			
			
			public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Markets.Prices.Success]>, AFError> {
				do {
					
					
					
					
					var headers = HTTPHeaders()
					headers["Accept"] = "application/json"
					
					
					var query = [URLQueryItem]()
					query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
					
					
					let url = try route.asURL()
					var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
					components.queryItems = query
					
					let session = esi.session
					
					return Deferred { () -> AnyPublisher<ESIResponse<[ESI.Markets.Prices.Success]>, AFError> in
						var request = session.request(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						
						if let progress = progress {
							request = request.downloadProgress(closure: progress)
						}
						
						return request.publishDecodable(queue: session.serializationQueue, decoder: ESI.jsonDecoder)
						.tryMap { response in
							try ESIResponse(value: response.result.get(), httpHeaders: response.response?.headers)
						}
						.mapError{$0 as! AFError}
						.handleEvents(receiveCompletion: { (_) in
							withExtendedLifetime(session) {}
						}).eraseToAnyPublisher()
					}.eraseToAnyPublisher()
				}
				catch {
					return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
				}
			}
			
			
			
			
			
			
			public struct Success: Codable, Hashable {
				
				
				public var adjustedPrice: Double?
				public var averagePrice: Double?
				public var typeID: Int
				public init(adjustedPrice: Double?, averagePrice: Double?, typeID: Int) {
					self.adjustedPrice = adjustedPrice
					self.averagePrice = averagePrice
					self.typeID = typeID
				}
				
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
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Markets.Structures.StructureID.Success]>, AFError> {
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
						
						let session = esi.session
						
						return Deferred { () -> AnyPublisher<ESIResponse<[ESI.Markets.Structures.StructureID.Success]>, AFError> in
							var request = session.request(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
							
							if let progress = progress {
								request = request.downloadProgress(closure: progress)
							}
							
							return request.publishDecodable(queue: session.serializationQueue, decoder: ESI.jsonDecoder)
							.tryMap { response in
								try ESIResponse(value: response.result.get(), httpHeaders: response.response?.headers)
							}
							.mapError{$0 as! AFError}
							.handleEvents(receiveCompletion: { (_) in
								withExtendedLifetime(session) {}
							}).eraseToAnyPublisher()
						}.eraseToAnyPublisher()
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public var duration: Int
					public var isBuyOrder: Bool
					public var issued: Date
					public var locationID: Int64
					public var minVolume: Int
					public var orderID: Int64
					public var price: Double
					public var range: ESI.Markets.Range
					public var typeID: Int
					public var volumeRemain: Int
					public var volumeTotal: Int
					public init(duration: Int, isBuyOrder: Bool, issued: Date, locationID: Int64, minVolume: Int, orderID: Int64, price: Double, range: ESI.Markets.Range, typeID: Int, volumeRemain: Int, volumeTotal: Int) {
						self.duration = duration
						self.isBuyOrder = isBuyOrder
						self.issued = issued
						self.locationID = locationID
						self.minVolume = minVolume
						self.orderID = orderID
						self.price = price
						self.range = range
						self.typeID = typeID
						self.volumeRemain = volumeRemain
						self.volumeTotal = volumeTotal
					}
					
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
				
				
				public func get(typeID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Markets.RegionID.History.Success]>, AFError> {
					do {
						
						
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						query.append(URLQueryItem(name: "type_id", value: typeID.description))
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						let session = esi.session
						
						return Deferred { () -> AnyPublisher<ESIResponse<[ESI.Markets.RegionID.History.Success]>, AFError> in
							var request = session.request(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
							
							if let progress = progress {
								request = request.downloadProgress(closure: progress)
							}
							
							return request.publishDecodable(queue: session.serializationQueue, decoder: ESI.jsonDecoder)
							.tryMap { response in
								try ESIResponse(value: response.result.get(), httpHeaders: response.response?.headers)
							}
							.mapError{$0 as! AFError}
							.handleEvents(receiveCompletion: { (_) in
								withExtendedLifetime(session) {}
							}).eraseToAnyPublisher()
						}.eraseToAnyPublisher()
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public var average: Double
					public var date: Date
					public var highest: Double
					public var lowest: Double
					public var orderCount: Int64
					public var volume: Int64
					public init(average: Double, date: Date, highest: Double, lowest: Double, orderCount: Int64, volume: Int64) {
						self.average = average
						self.date = date
						self.highest = highest
						self.lowest = lowest
						self.orderCount = orderCount
						self.volume = volume
					}
					
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
				
				
				public func get(orderType: ESI.Markets.RegionID.Orders.OrderType = .all, page: Int? = nil, typeID: Int?, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Markets.RegionID.Orders.Success]>, AFError> {
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
						
						let session = esi.session
						
						return Deferred { () -> AnyPublisher<ESIResponse<[ESI.Markets.RegionID.Orders.Success]>, AFError> in
							var request = session.request(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
							
							if let progress = progress {
								request = request.downloadProgress(closure: progress)
							}
							
							return request.publishDecodable(queue: session.serializationQueue, decoder: ESI.jsonDecoder)
							.tryMap { response in
								try ESIResponse(value: response.result.get(), httpHeaders: response.response?.headers)
							}
							.mapError{$0 as! AFError}
							.handleEvents(receiveCompletion: { (_) in
								withExtendedLifetime(session) {}
							}).eraseToAnyPublisher()
						}.eraseToAnyPublisher()
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
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
				
				public struct Success: Codable, Hashable {
					
					
					public var duration: Int
					public var isBuyOrder: Bool
					public var issued: Date
					public var locationID: Int64
					public var minVolume: Int
					public var orderID: Int64
					public var price: Double
					public var range: ESI.Markets.Range
					public var systemID: Int
					public var typeID: Int
					public var volumeRemain: Int
					public var volumeTotal: Int
					public init(duration: Int, isBuyOrder: Bool, issued: Date, locationID: Int64, minVolume: Int, orderID: Int64, price: Double, range: ESI.Markets.Range, systemID: Int, typeID: Int, volumeRemain: Int, volumeTotal: Int) {
						self.duration = duration
						self.isBuyOrder = isBuyOrder
						self.issued = issued
						self.locationID = locationID
						self.minVolume = minVolume
						self.orderID = orderID
						self.price = price
						self.range = range
						self.systemID = systemID
						self.typeID = typeID
						self.volumeRemain = volumeRemain
						self.volumeTotal = volumeTotal
					}
					
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
				
			}
			
			public struct Types {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[Int]>, AFError> {
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
						
						let session = esi.session
						
						return Deferred { () -> AnyPublisher<ESIResponse<[Int]>, AFError> in
							var request = session.request(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
							
							if let progress = progress {
								request = request.downloadProgress(closure: progress)
							}
							
							return request.publishDecodable(queue: session.serializationQueue, decoder: ESI.jsonDecoder)
							.tryMap { response in
								try ESIResponse(value: response.result.get(), httpHeaders: response.response?.headers)
							}
							.mapError{$0 as! AFError}
							.handleEvents(receiveCompletion: { (_) in
								withExtendedLifetime(session) {}
							}).eraseToAnyPublisher()
						}.eraseToAnyPublisher()
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				
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
