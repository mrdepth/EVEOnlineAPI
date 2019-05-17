import Foundation
import Alamofire
import Futures


public extension ESI {
	var market: Market {
		return Market(esi: self)
	}
	
	struct Market {
		let esi: ESI
		
		@discardableResult
		public func getItemGroupInformation(acceptLanguage: AcceptLanguage? = nil, ifNoneMatch: String? = nil, language: Language? = nil, marketGroupID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<Market.ItemGroupInformation>> {
			
			
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
			
			let url = esi.baseURL + "/markets/groups/\(marketGroupID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<Market.ItemGroupInformation>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<Market.ItemGroupInformation>) in
				promise.set(response: response, cached: nil)
			}
			return promise.future
		}
		
		@discardableResult
		public func listMarketPrices(ifNoneMatch: String? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Market.Price]>> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/markets/prices/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<[Market.Price]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<[Market.Price]>) in
				promise.set(response: response, cached: 3600.0)
			}
			return promise.future
		}
		
		@discardableResult
		public func listHistoricalMarketStatisticsInRegion(ifNoneMatch: String? = nil, regionID: Int, typeID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Market.History]>> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = typeID.httpQuery {
				query.append(URLQueryItem(name: "type_id", value: v))
			}
			
			let url = esi.baseURL + "/markets/\(regionID)/history/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<[Market.History]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<[Market.History]>) in
				promise.set(response: response, cached: nil)
			}
			return promise.future
		}
		
		@discardableResult
		public func listTypeIDsRelevantToMarket(ifNoneMatch: String? = nil, page: Int? = nil, regionID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Int]>> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = esi.baseURL + "/markets/\(regionID)/types/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<[Int]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<[Int]>) in
				promise.set(response: response, cached: 600.0)
			}
			return promise.future
		}
		
		@discardableResult
		public func getItemGroups(ifNoneMatch: String? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Int]>> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/markets/groups/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<[Int]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<[Int]>) in
				promise.set(response: response, cached: nil)
			}
			return promise.future
		}
		
		@discardableResult
		public func listOpenOrdersFromCharacter(characterID: Int, ifNoneMatch: String? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Market.CharacterOrder]>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-markets.read_character_orders.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/characters/\(characterID)/orders/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<[Market.CharacterOrder]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<[Market.CharacterOrder]>) in
				promise.set(response: response, cached: 1200.0)
			}
			return promise.future
		}
		
		@discardableResult
		public func listHistoricalOrdersByCharacter(characterID: Int, ifNoneMatch: String? = nil, page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Market.GetCharactersCharacterIDOrdersHistoryOk]>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-markets.read_character_orders.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = esi.baseURL + "/characters/\(characterID)/orders/history/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<[Market.GetCharactersCharacterIDOrdersHistoryOk]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<[Market.GetCharactersCharacterIDOrdersHistoryOk]>) in
				promise.set(response: response, cached: 3600.0)
			}
			return promise.future
		}
		
		@discardableResult
		public func listOrdersInRegion(ifNoneMatch: String? = nil, orderType: Market.OrderType, page: Int? = nil, regionID: Int, typeID: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Market.Order]>> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = orderType.httpQuery {
				query.append(URLQueryItem(name: "order_type", value: v))
			}
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			if let v = typeID?.httpQuery {
				query.append(URLQueryItem(name: "type_id", value: v))
			}
			
			let url = esi.baseURL + "/markets/\(regionID)/orders/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<[Market.Order]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<[Market.Order]>) in
				promise.set(response: response, cached: 300.0)
			}
			return promise.future
		}
		
		@discardableResult
		public func listHistoricalOrdersFromCorporation(corporationID: Int, ifNoneMatch: String? = nil, page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Market.GetCorporationsCorporationIDOrdersHistoryOk]>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-markets.read_corporation_orders.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = esi.baseURL + "/corporations/\(corporationID)/orders/history/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<[Market.GetCorporationsCorporationIDOrdersHistoryOk]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<[Market.GetCorporationsCorporationIDOrdersHistoryOk]>) in
				promise.set(response: response, cached: 3600.0)
			}
			return promise.future
		}
		
		@discardableResult
		public func listOpenOrdersFromCorporation(corporationID: Int, ifNoneMatch: String? = nil, page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Market.CorpOrder]>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-markets.read_corporation_orders.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = esi.baseURL + "/corporations/\(corporationID)/orders/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<[Market.CorpOrder]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<[Market.CorpOrder]>) in
				promise.set(response: response, cached: 1200.0)
			}
			return promise.future
		}
		
		@discardableResult
		public func listOrdersInStructure(ifNoneMatch: String? = nil, page: Int? = nil, structureID: Int64, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Market.Structure]>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-markets.structure_markets.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = esi.baseURL + "/markets/structures/\(structureID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<[Market.Structure]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<[Market.Structure]>) in
				promise.set(response: response, cached: 300.0)
			}
			return promise.future
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
		
		
		public struct GetCharactersCharacterIDOrdersHistoryOk: Codable, Hashable {
			
			public enum GetCharactersCharacterIDOrdersHistoryState: String, Codable, HTTPQueryable {
				case cancelled = "cancelled"
				case expired = "expired"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCharactersCharacterIDOrdersHistoryRange: String, Codable, HTTPQueryable {
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
				
				public var httpQuery: String? {
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
		
		
		public struct GetCorporationsCorporationIDOrdersHistoryOk: Codable, Hashable {
			
			public enum GetCorporationsCorporationIDOrdersHistoryRange: String, Codable, HTTPQueryable {
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
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDOrdersHistoryState: String, Codable, HTTPQueryable {
				case cancelled = "cancelled"
				case expired = "expired"
				
				public var httpQuery: String? {
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
		
		
		public struct CharacterOrder: Codable, Hashable {
			
			public enum GetCharactersCharacterIDOrdersRange: String, Codable, HTTPQueryable {
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
				
				public var httpQuery: String? {
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
		
		
		public struct Structure: Codable, Hashable {
			
			public enum GetMarketsStructuresStructureIDRange: String, Codable, HTTPQueryable {
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
				
				public var httpQuery: String? {
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
		
		
		public struct CorpOrder: Codable, Hashable {
			
			public enum GetCorporationsCorporationIDOrdersRange: String, Codable, HTTPQueryable {
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
				
				public var httpQuery: String? {
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
		
		
		public struct Order: Codable, Hashable {
			
			public enum GetMarketsRegionIDOrdersRange: String, Codable, HTTPQueryable {
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
				
				public var httpQuery: String? {
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
		
		
		public enum OrderType: String, Codable, HTTPQueryable {
			case all = "all"
			case buy = "buy"
			case sell = "sell"
			
			public var httpQuery: String? {
				return rawValue
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
		
		
	}
	
}
