import Foundation
import Alamofire
import Combine


extension ESI {
	public var market: Market {
		return Market(esi: self)
	}
	
	public struct Market {
		let esi: ESI
		
		
		public func listHistoricalOrdersFromCorporation(corporationID: Int, page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Market.GetCorporationsCorporationIDOrdersHistoryOk], AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-markets.read_corporation_orders.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = page?.description {
				query.append(URLQueryItem(name: "page", value: v.lazy.map{$0.description}.joined(separator: ",")))
			}
			
			        let url = ESI.apiURL.appendingPathComponent("/corporations/\(corporationID)/orders/history/")
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
		
		
		public func listOpenOrdersFromCharacter(characterID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Market.CharacterOrder], AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-markets.read_character_orders.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/characters/\(characterID)/orders/")
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
		
		
		public func listTypeIDsRelevantToMarket(page: Int? = nil, regionID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Int], AFError> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = page?.description {
				query.append(URLQueryItem(name: "page", value: v.lazy.map{$0.description}.joined(separator: ",")))
			}
			
			        let url = ESI.apiURL.appendingPathComponent("/markets/\(regionID)/types/")
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
		
		
		public func getItemGroups(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Int], AFError> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/markets/groups/")
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
		
		
		public func listOrdersInRegion(orderType: Market.OrderType, page: Int? = nil, regionID: Int, typeID: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Market.Order], AFError> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			query.append(URLQueryItem(name: "order_type", value: orderType.description))
			if let v = page?.description {
				query.append(URLQueryItem(name: "page", value: v.lazy.map{$0.description}.joined(separator: ",")))
			}
			if let v = typeID?.description {
				query.append(URLQueryItem(name: "type_id", value: v.lazy.map{$0.description}.joined(separator: ",")))
			}
			
			        let url = ESI.apiURL.appendingPathComponent("/markets/\(regionID)/orders/")
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
		
		
		public func listOrdersInStructure(page: Int? = nil, structureID: Int64, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Market.Structure], AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-markets.structure_markets.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = page?.description {
				query.append(URLQueryItem(name: "page", value: v.lazy.map{$0.description}.joined(separator: ",")))
			}
			
			        let url = ESI.apiURL.appendingPathComponent("/markets/structures/\(structureID)/")
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
		
		
		public func listOpenOrdersFromCorporation(corporationID: Int, page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Market.CorpOrder], AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-markets.read_corporation_orders.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = page?.description {
				query.append(URLQueryItem(name: "page", value: v.lazy.map{$0.description}.joined(separator: ",")))
			}
			
			        let url = ESI.apiURL.appendingPathComponent("/corporations/\(corporationID)/orders/")
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
		
		
		public func getItemGroupInformation(acceptLanguage: AcceptLanguage? = nil, language: Language? = nil, marketGroupID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Market.ItemGroupInformation, AFError> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = acceptLanguage?.description {
				headers["Accept-Language"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = language?.description {
				query.append(URLQueryItem(name: "language", value: v.lazy.map{$0.description}.joined(separator: ",")))
			}
			
			        let url = ESI.apiURL.appendingPathComponent("/markets/groups/\(marketGroupID)/")
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
		
		
		public func listHistoricalMarketStatisticsInRegion(regionID: Int, typeID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Market.History], AFError> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			query.append(URLQueryItem(name: "type_id", value: typeID.description))
			
			        let url = ESI.apiURL.appendingPathComponent("/markets/\(regionID)/history/")
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
		
		
		public func listMarketPrices(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Market.Price], AFError> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/markets/prices/")
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
		
		
		public func listHistoricalOrdersByCharacter(characterID: Int, page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Market.GetCharactersCharacterIDOrdersHistoryOk], AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-markets.read_character_orders.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = page?.description {
				query.append(URLQueryItem(name: "page", value: v.lazy.map{$0.description}.joined(separator: ",")))
			}
			
			        let url = ESI.apiURL.appendingPathComponent("/characters/\(characterID)/orders/history/")
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
		
		
		public struct GetMarketsRegionIDHistoryError520: Codable, Hashable {
			
			
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
		
		
		public struct GetMarketsGroupsMarketGroupIDNotFound: Codable, Hashable {
			
			
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
		
		
		public struct GetMarketsRegionIDOrdersUnprocessableEntity: Codable, Hashable {
			
			
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
		
		
		public struct GetMarketsRegionIDHistoryUnprocessableEntity: Codable, Hashable {
			
			
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
		
		
		public enum OrderType: String, Codable, CustomStringConvertible {
			case all = "all"
			case buy = "buy"
			case sell = "sell"
			
			public var description: String {
				return rawValue
			}
			
		}
		
		
		public struct CharacterOrder: Codable, Hashable {
			
			public enum GetCharactersCharacterIDOrdersRange: String, Codable, CustomStringConvertible {
				case i1 = "1"
				case i10 = "10"
				case i2 = "2"
				case i20 = "20"
				case i3 = "3"
				case i30 = "30"
				case i4 = "4"
				case i40 = "40"
				case i5 = "5"
				case region = "region"
				case solarsystem = "solarsystem"
				case station = "station"
				
				public var description: String {
					return rawValue
				}
				
			}
			
			public var duration: Int
			public var escrow: Double?
			public var isBuyOrder: Bool?
			public var isCorporation: Bool
			public var issued: Date
			public var locationID: Int64
			public var minVolume: Int?
			public var orderID: Int64
			public var price: Double
			public var range: Market.CharacterOrder.GetCharactersCharacterIDOrdersRange
			public var regionID: Int
			public var typeID: Int
			public var volumeRemain: Int
			public var volumeTotal: Int
			
			public init(duration: Int, escrow: Double?, isBuyOrder: Bool?, isCorporation: Bool, issued: Date, locationID: Int64, minVolume: Int?, orderID: Int64, price: Double, range: Market.CharacterOrder.GetCharactersCharacterIDOrdersRange, regionID: Int, typeID: Int, volumeRemain: Int, volumeTotal: Int) {
				self.duration = duration
				self.escrow = escrow
				self.isBuyOrder = isBuyOrder
				self.isCorporation = isCorporation
				self.issued = issued
				self.locationID = locationID
				self.minVolume = minVolume
				self.orderID = orderID
				self.price = price
				self.range = range
				self.regionID = regionID
				self.typeID = typeID
				self.volumeRemain = volumeRemain
				self.volumeTotal = volumeTotal
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case duration
				case escrow
				case isBuyOrder = "is_buy_order"
				case isCorporation = "is_corporation"
				case issued
				case locationID = "location_id"
				case minVolume = "min_volume"
				case orderID = "order_id"
				case price
				case range
				case regionID = "region_id"
				case typeID = "type_id"
				case volumeRemain = "volume_remain"
				case volumeTotal = "volume_total"
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .issued: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetMarketsRegionIDOrdersNotFound: Codable, Hashable {
			
			
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
		
		
		public struct ItemGroupInformation: Codable, Hashable {
			
			
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
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetMarketsRegionIDHistoryNotFound: Codable, Hashable {
			
			
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
		
		
		public struct History: Codable, Hashable {
			
			
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
						case .date: return DateFormatter.esiDateFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct Price: Codable, Hashable {
			
			
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
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct CorpOrder: Codable, Hashable {
			
			public enum GetCorporationsCorporationIDOrdersRange: String, Codable, CustomStringConvertible {
				case i1 = "1"
				case i10 = "10"
				case i2 = "2"
				case i20 = "20"
				case i3 = "3"
				case i30 = "30"
				case i4 = "4"
				case i40 = "40"
				case i5 = "5"
				case region = "region"
				case solarsystem = "solarsystem"
				case station = "station"
				
				public var description: String {
					return rawValue
				}
				
			}
			
			public var duration: Int
			public var escrow: Double?
			public var isBuyOrder: Bool?
			public var issued: Date
			public var issuedBy: Int
			public var locationID: Int64
			public var minVolume: Int?
			public var orderID: Int64
			public var price: Double
			public var range: Market.CorpOrder.GetCorporationsCorporationIDOrdersRange
			public var regionID: Int
			public var typeID: Int
			public var volumeRemain: Int
			public var volumeTotal: Int
			public var walletDivision: Int
			
			public init(duration: Int, escrow: Double?, isBuyOrder: Bool?, issued: Date, issuedBy: Int, locationID: Int64, minVolume: Int?, orderID: Int64, price: Double, range: Market.CorpOrder.GetCorporationsCorporationIDOrdersRange, regionID: Int, typeID: Int, volumeRemain: Int, volumeTotal: Int, walletDivision: Int) {
				self.duration = duration
				self.escrow = escrow
				self.isBuyOrder = isBuyOrder
				self.issued = issued
				self.issuedBy = issuedBy
				self.locationID = locationID
				self.minVolume = minVolume
				self.orderID = orderID
				self.price = price
				self.range = range
				self.regionID = regionID
				self.typeID = typeID
				self.volumeRemain = volumeRemain
				self.volumeTotal = volumeTotal
				self.walletDivision = walletDivision
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case duration
				case escrow
				case isBuyOrder = "is_buy_order"
				case issued
				case issuedBy = "issued_by"
				case locationID = "location_id"
				case minVolume = "min_volume"
				case orderID = "order_id"
				case price
				case range
				case regionID = "region_id"
				case typeID = "type_id"
				case volumeRemain = "volume_remain"
				case volumeTotal = "volume_total"
				case walletDivision = "wallet_division"
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .issued: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCorporationsCorporationIDOrdersHistoryOk: Codable, Hashable {
			
			public enum GetCorporationsCorporationIDOrdersHistoryState: String, Codable, CustomStringConvertible {
				case cancelled = "cancelled"
				case expired = "expired"
				
				public var description: String {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDOrdersHistoryRange: String, Codable, CustomStringConvertible {
				case i1 = "1"
				case i10 = "10"
				case i2 = "2"
				case i20 = "20"
				case i3 = "3"
				case i30 = "30"
				case i4 = "4"
				case i40 = "40"
				case i5 = "5"
				case region = "region"
				case solarsystem = "solarsystem"
				case station = "station"
				
				public var description: String {
					return rawValue
				}
				
			}
			
			public var duration: Int
			public var escrow: Double?
			public var isBuyOrder: Bool?
			public var issued: Date
			public var issuedBy: Int?
			public var locationID: Int64
			public var minVolume: Int?
			public var orderID: Int64
			public var price: Double
			public var range: Market.GetCorporationsCorporationIDOrdersHistoryOk.GetCorporationsCorporationIDOrdersHistoryRange
			public var regionID: Int
			public var state: Market.GetCorporationsCorporationIDOrdersHistoryOk.GetCorporationsCorporationIDOrdersHistoryState
			public var typeID: Int
			public var volumeRemain: Int
			public var volumeTotal: Int
			public var walletDivision: Int
			
			public init(duration: Int, escrow: Double?, isBuyOrder: Bool?, issued: Date, issuedBy: Int?, locationID: Int64, minVolume: Int?, orderID: Int64, price: Double, range: Market.GetCorporationsCorporationIDOrdersHistoryOk.GetCorporationsCorporationIDOrdersHistoryRange, regionID: Int, state: Market.GetCorporationsCorporationIDOrdersHistoryOk.GetCorporationsCorporationIDOrdersHistoryState, typeID: Int, volumeRemain: Int, volumeTotal: Int, walletDivision: Int) {
				self.duration = duration
				self.escrow = escrow
				self.isBuyOrder = isBuyOrder
				self.issued = issued
				self.issuedBy = issuedBy
				self.locationID = locationID
				self.minVolume = minVolume
				self.orderID = orderID
				self.price = price
				self.range = range
				self.regionID = regionID
				self.state = state
				self.typeID = typeID
				self.volumeRemain = volumeRemain
				self.volumeTotal = volumeTotal
				self.walletDivision = walletDivision
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case duration
				case escrow
				case isBuyOrder = "is_buy_order"
				case issued
				case issuedBy = "issued_by"
				case locationID = "location_id"
				case minVolume = "min_volume"
				case orderID = "order_id"
				case price
				case range
				case regionID = "region_id"
				case state
				case typeID = "type_id"
				case volumeRemain = "volume_remain"
				case volumeTotal = "volume_total"
				case walletDivision = "wallet_division"
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .issued: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCharactersCharacterIDOrdersHistoryOk: Codable, Hashable {
			
			public enum GetCharactersCharacterIDOrdersHistoryRange: String, Codable, CustomStringConvertible {
				case i1 = "1"
				case i10 = "10"
				case i2 = "2"
				case i20 = "20"
				case i3 = "3"
				case i30 = "30"
				case i4 = "4"
				case i40 = "40"
				case i5 = "5"
				case region = "region"
				case solarsystem = "solarsystem"
				case station = "station"
				
				public var description: String {
					return rawValue
				}
				
			}
			
			public enum GetCharactersCharacterIDOrdersHistoryState: String, Codable, CustomStringConvertible {
				case cancelled = "cancelled"
				case expired = "expired"
				
				public var description: String {
					return rawValue
				}
				
			}
			
			public var duration: Int
			public var escrow: Double?
			public var isBuyOrder: Bool?
			public var isCorporation: Bool
			public var issued: Date
			public var locationID: Int64
			public var minVolume: Int?
			public var orderID: Int64
			public var price: Double
			public var range: Market.GetCharactersCharacterIDOrdersHistoryOk.GetCharactersCharacterIDOrdersHistoryRange
			public var regionID: Int
			public var state: Market.GetCharactersCharacterIDOrdersHistoryOk.GetCharactersCharacterIDOrdersHistoryState
			public var typeID: Int
			public var volumeRemain: Int
			public var volumeTotal: Int
			
			public init(duration: Int, escrow: Double?, isBuyOrder: Bool?, isCorporation: Bool, issued: Date, locationID: Int64, minVolume: Int?, orderID: Int64, price: Double, range: Market.GetCharactersCharacterIDOrdersHistoryOk.GetCharactersCharacterIDOrdersHistoryRange, regionID: Int, state: Market.GetCharactersCharacterIDOrdersHistoryOk.GetCharactersCharacterIDOrdersHistoryState, typeID: Int, volumeRemain: Int, volumeTotal: Int) {
				self.duration = duration
				self.escrow = escrow
				self.isBuyOrder = isBuyOrder
				self.isCorporation = isCorporation
				self.issued = issued
				self.locationID = locationID
				self.minVolume = minVolume
				self.orderID = orderID
				self.price = price
				self.range = range
				self.regionID = regionID
				self.state = state
				self.typeID = typeID
				self.volumeRemain = volumeRemain
				self.volumeTotal = volumeTotal
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case duration
				case escrow
				case isBuyOrder = "is_buy_order"
				case isCorporation = "is_corporation"
				case issued
				case locationID = "location_id"
				case minVolume = "min_volume"
				case orderID = "order_id"
				case price
				case range
				case regionID = "region_id"
				case state
				case typeID = "type_id"
				case volumeRemain = "volume_remain"
				case volumeTotal = "volume_total"
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .issued: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct Structure: Codable, Hashable {
			
			public enum GetMarketsStructuresStructureIDRange: String, Codable, CustomStringConvertible {
				case i1 = "1"
				case i10 = "10"
				case i2 = "2"
				case i20 = "20"
				case i3 = "3"
				case i30 = "30"
				case i4 = "4"
				case i40 = "40"
				case i5 = "5"
				case region = "region"
				case solarsystem = "solarsystem"
				case station = "station"
				
				public var description: String {
					return rawValue
				}
				
			}
			
			public var duration: Int
			public var isBuyOrder: Bool
			public var issued: Date
			public var locationID: Int64
			public var minVolume: Int
			public var orderID: Int64
			public var price: Double
			public var range: Market.Structure.GetMarketsStructuresStructureIDRange
			public var typeID: Int
			public var volumeRemain: Int
			public var volumeTotal: Int
			
			public init(duration: Int, isBuyOrder: Bool, issued: Date, locationID: Int64, minVolume: Int, orderID: Int64, price: Double, range: Market.Structure.GetMarketsStructuresStructureIDRange, typeID: Int, volumeRemain: Int, volumeTotal: Int) {
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
						case .issued: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct Order: Codable, Hashable {
			
			public enum GetMarketsRegionIDOrdersRange: String, Codable, CustomStringConvertible {
				case i1 = "1"
				case i10 = "10"
				case i2 = "2"
				case i20 = "20"
				case i3 = "3"
				case i30 = "30"
				case i4 = "4"
				case i40 = "40"
				case i5 = "5"
				case region = "region"
				case solarsystem = "solarsystem"
				case station = "station"
				
				public var description: String {
					return rawValue
				}
				
			}
			
			public var duration: Int
			public var isBuyOrder: Bool
			public var issued: Date
			public var locationID: Int64
			public var minVolume: Int
			public var orderID: Int64
			public var price: Double
			public var range: Market.Order.GetMarketsRegionIDOrdersRange
			public var systemID: Int
			public var typeID: Int
			public var volumeRemain: Int
			public var volumeTotal: Int
			
			public init(duration: Int, isBuyOrder: Bool, issued: Date, locationID: Int64, minVolume: Int, orderID: Int64, price: Double, range: Market.Order.GetMarketsRegionIDOrdersRange, systemID: Int, typeID: Int, volumeRemain: Int, volumeTotal: Int) {
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
						case .issued: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
	}
	
}
