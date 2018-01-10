import Foundation
import Alamofire


public extension ESI {
	public var market: Market {
		return Market(sessionManager: self)
	}
	
	class Market {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		public func listHistoricalMarketStatisticsInRegion(regionID: Int, typeID: Int, completionBlock:((Result<[Market.History]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = typeID.httpQuery {
				query.append(URLQueryItem(name: "type_id", value: v))
			}
			
			let url = session!.baseURL + "/v1/markets/\(regionID)/history/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Market.History]>) in
					completionBlock?(response.result)
					session = nil
				}
			}
		}
		
		public func listOrdersFromCorporation(corporationID: Int, page: Int? = nil, completionBlock:((Result<[Market.GetCorporationsCorporationIDOrdersOk]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-markets.read_corporation_orders.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/orders/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Market.GetCorporationsCorporationIDOrdersOk]>) in
					completionBlock?(response.result)
					session = nil
				}
			}
		}
		
		public func listMarketPrices(completionBlock:((Result<[Market.Price]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/markets/prices/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Market.Price]>) in
					completionBlock?(response.result)
					session = nil
				}
			}
		}
		
		public func getItemGroups(completionBlock:((Result<[Int]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/markets/groups/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Int]>) in
					completionBlock?(response.result)
					session = nil
				}
			}
		}
		
		public func listOrdersInStructure(page: Int? = nil, structureID: Int64, completionBlock:((Result<[Market.Structure]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-markets.structure_markets.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v1/markets/structures/\(structureID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Market.Structure]>) in
					completionBlock?(response.result)
					session = nil
				}
			}
		}
		
		public func listOrdersFromCharacter(characterID: Int, completionBlock:((Result<[Market.CharacterOrder]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-markets.read_character_orders.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/orders/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Market.CharacterOrder]>) in
					completionBlock?(response.result)
					session = nil
				}
			}
		}
		
		public func getItemGroupInformation(language: Language? = nil, marketGroupID: Int, completionBlock:((Result<Market.ItemGroupInformation>) -> Void)?) {
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
			
			let url = session!.baseURL + "/v1/markets/groups/\(marketGroupID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Market.ItemGroupInformation>) in
					completionBlock?(response.result)
					session = nil
				}
			}
		}
		
		public func listTypeIDsRelevantToMarket(page: Int? = nil, regionID: Int, completionBlock:((Result<[Int]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v1/markets/\(regionID)/types/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Int]>) in
					completionBlock?(response.result)
					session = nil
				}
			}
		}
		
		public func listOrdersInRegion(orderType: Market.OrderType, page: Int? = nil, regionID: Int, typeID: Int? = nil, completionBlock:((Result<[Market.Order]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = orderType.httpQuery {
				query.append(URLQueryItem(name: "order_type", value: v))
			}
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			if let v = typeID?.httpQuery {
				query.append(URLQueryItem(name: "type_id", value: v))
			}
			
			let url = session!.baseURL + "/v1/markets/\(regionID)/orders/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Market.Order]>) in
					completionBlock?(response.result)
					session = nil
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
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: duration.hashValue)
				hashCombine(seed: &hash, value: isBuyOrder.hashValue)
				hashCombine(seed: &hash, value: issued.hashValue)
				hashCombine(seed: &hash, value: locationID.hashValue)
				hashCombine(seed: &hash, value: minVolume.hashValue)
				hashCombine(seed: &hash, value: orderID.hashValue)
				hashCombine(seed: &hash, value: price.hashValue)
				hashCombine(seed: &hash, value: range.hashValue)
				hashCombine(seed: &hash, value: typeID.hashValue)
				hashCombine(seed: &hash, value: volumeRemain.hashValue)
				hashCombine(seed: &hash, value: volumeTotal.hashValue)
				return hash
			}
			
			public static func ==(lhs: Market.Structure, rhs: Market.Structure) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
		
		
		public struct GetMarketsRegionIDOrdersUnprocessableEntity: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Market.GetMarketsRegionIDOrdersUnprocessableEntity, rhs: Market.GetMarketsRegionIDOrdersUnprocessableEntity) -> Bool {
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
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: localizedDescription.hashValue)
				hashCombine(seed: &hash, value: marketGroupID.hashValue)
				hashCombine(seed: &hash, value: name.hashValue)
				hashCombine(seed: &hash, value: parentGroupID?.hashValue ?? 0)
				self.types.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}
			
			public static func ==(lhs: Market.ItemGroupInformation, rhs: Market.ItemGroupInformation) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: average.hashValue)
				hashCombine(seed: &hash, value: date.hashValue)
				hashCombine(seed: &hash, value: highest.hashValue)
				hashCombine(seed: &hash, value: lowest.hashValue)
				hashCombine(seed: &hash, value: orderCount.hashValue)
				hashCombine(seed: &hash, value: volume.hashValue)
				return hash
			}
			
			public static func ==(lhs: Market.History, rhs: Market.History) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: adjustedPrice?.hashValue ?? 0)
				hashCombine(seed: &hash, value: averagePrice?.hashValue ?? 0)
				hashCombine(seed: &hash, value: typeID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Market.Price, rhs: Market.Price) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
		
		
		public struct GetMarketsGroupsMarketGroupIDNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Market.GetMarketsGroupsMarketGroupIDNotFound, rhs: Market.GetMarketsGroupsMarketGroupIDNotFound) -> Bool {
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
		
		
		public struct GetCorporationsCorporationIDOrdersOk: Codable, Hashable {
			
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
			
			public enum GetCorporationsCorporationIDOrdersState: String, Codable, HTTPQueryable {
				case cancelled = "cancelled"
				case characterDeleted = "character_deleted"
				case closed = "closed"
				case expired = "expired"
				case open = "open"
				case pending = "pending"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var duration: Int
			public var escrow: Double
			public var isBuyOrder: Bool
			public var issued: Date
			public var locationID: Int64
			public var minVolume: Int
			public var orderID: Int64
			public var price: Double
			public var range: Market.GetCorporationsCorporationIDOrdersOk.GetCorporationsCorporationIDOrdersRange
			public var regionID: Int
			public var state: Market.GetCorporationsCorporationIDOrdersOk.GetCorporationsCorporationIDOrdersState
			public var typeID: Int
			public var volumeRemain: Int
			public var volumeTotal: Int
			public var walletDivision: Int
			
			public init(duration: Int, escrow: Double, isBuyOrder: Bool, issued: Date, locationID: Int64, minVolume: Int, orderID: Int64, price: Double, range: Market.GetCorporationsCorporationIDOrdersOk.GetCorporationsCorporationIDOrdersRange, regionID: Int, state: Market.GetCorporationsCorporationIDOrdersOk.GetCorporationsCorporationIDOrdersState, typeID: Int, volumeRemain: Int, volumeTotal: Int, walletDivision: Int) {
				self.duration = duration
				self.escrow = escrow
				self.isBuyOrder = isBuyOrder
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
				self.walletDivision = walletDivision
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: duration.hashValue)
				hashCombine(seed: &hash, value: escrow.hashValue)
				hashCombine(seed: &hash, value: isBuyOrder.hashValue)
				hashCombine(seed: &hash, value: issued.hashValue)
				hashCombine(seed: &hash, value: locationID.hashValue)
				hashCombine(seed: &hash, value: minVolume.hashValue)
				hashCombine(seed: &hash, value: orderID.hashValue)
				hashCombine(seed: &hash, value: price.hashValue)
				hashCombine(seed: &hash, value: range.hashValue)
				hashCombine(seed: &hash, value: regionID.hashValue)
				hashCombine(seed: &hash, value: state.hashValue)
				hashCombine(seed: &hash, value: typeID.hashValue)
				hashCombine(seed: &hash, value: volumeRemain.hashValue)
				hashCombine(seed: &hash, value: volumeTotal.hashValue)
				hashCombine(seed: &hash, value: walletDivision.hashValue)
				return hash
			}
			
			public static func ==(lhs: Market.GetCorporationsCorporationIDOrdersOk, rhs: Market.GetCorporationsCorporationIDOrdersOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case duration
				case escrow
				case isBuyOrder = "is_buy_order"
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
				case walletDivision = "wallet_division"
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .issued: return DateFormatter.esiDateTimeFormatter
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
			public var typeID: Int
			public var volumeRemain: Int
			public var volumeTotal: Int
			
			public init(duration: Int, isBuyOrder: Bool, issued: Date, locationID: Int64, minVolume: Int, orderID: Int64, price: Double, range: Market.Order.GetMarketsRegionIDOrdersRange, typeID: Int, volumeRemain: Int, volumeTotal: Int) {
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
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: duration.hashValue)
				hashCombine(seed: &hash, value: isBuyOrder.hashValue)
				hashCombine(seed: &hash, value: issued.hashValue)
				hashCombine(seed: &hash, value: locationID.hashValue)
				hashCombine(seed: &hash, value: minVolume.hashValue)
				hashCombine(seed: &hash, value: orderID.hashValue)
				hashCombine(seed: &hash, value: price.hashValue)
				hashCombine(seed: &hash, value: range.hashValue)
				hashCombine(seed: &hash, value: typeID.hashValue)
				hashCombine(seed: &hash, value: volumeRemain.hashValue)
				hashCombine(seed: &hash, value: volumeTotal.hashValue)
				return hash
			}
			
			public static func ==(lhs: Market.Order, rhs: Market.Order) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
		
		
		public enum OrderType: String, Codable, HTTPQueryable {
			case all = "all"
			case buy = "buy"
			case sell = "sell"
			
			public var httpQuery: String? {
				return rawValue
			}
			
		}
		
		
		public struct CharacterOrder: Codable, Hashable {
			
			public enum GetCharactersCharacterIDOrdersState: String, Codable, HTTPQueryable {
				case cancelled = "cancelled"
				case characterDeleted = "character_deleted"
				case closed = "closed"
				case expired = "expired"
				case open = "open"
				case pending = "pending"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
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
			
			public var accountID: Int
			public var duration: Int
			public var escrow: Double
			public var isBuyOrder: Bool
			public var isCorp: Bool
			public var issued: Date
			public var locationID: Int64
			public var minVolume: Int
			public var orderID: Int64
			public var price: Double
			public var range: Market.CharacterOrder.GetCharactersCharacterIDOrdersRange
			public var regionID: Int
			public var state: Market.CharacterOrder.GetCharactersCharacterIDOrdersState
			public var typeID: Int
			public var volumeRemain: Int
			public var volumeTotal: Int
			
			public init(accountID: Int, duration: Int, escrow: Double, isBuyOrder: Bool, isCorp: Bool, issued: Date, locationID: Int64, minVolume: Int, orderID: Int64, price: Double, range: Market.CharacterOrder.GetCharactersCharacterIDOrdersRange, regionID: Int, state: Market.CharacterOrder.GetCharactersCharacterIDOrdersState, typeID: Int, volumeRemain: Int, volumeTotal: Int) {
				self.accountID = accountID
				self.duration = duration
				self.escrow = escrow
				self.isBuyOrder = isBuyOrder
				self.isCorp = isCorp
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
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: accountID.hashValue)
				hashCombine(seed: &hash, value: duration.hashValue)
				hashCombine(seed: &hash, value: escrow.hashValue)
				hashCombine(seed: &hash, value: isBuyOrder.hashValue)
				hashCombine(seed: &hash, value: isCorp.hashValue)
				hashCombine(seed: &hash, value: issued.hashValue)
				hashCombine(seed: &hash, value: locationID.hashValue)
				hashCombine(seed: &hash, value: minVolume.hashValue)
				hashCombine(seed: &hash, value: orderID.hashValue)
				hashCombine(seed: &hash, value: price.hashValue)
				hashCombine(seed: &hash, value: range.hashValue)
				hashCombine(seed: &hash, value: regionID.hashValue)
				hashCombine(seed: &hash, value: state.hashValue)
				hashCombine(seed: &hash, value: typeID.hashValue)
				hashCombine(seed: &hash, value: volumeRemain.hashValue)
				hashCombine(seed: &hash, value: volumeTotal.hashValue)
				return hash
			}
			
			public static func ==(lhs: Market.CharacterOrder, rhs: Market.CharacterOrder) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case accountID = "account_id"
				case duration
				case escrow
				case isBuyOrder = "is_buy_order"
				case isCorp = "is_corp"
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
		
		
		public struct GetMarketsRegionIDHistoryUnprocessableEntity: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Market.GetMarketsRegionIDHistoryUnprocessableEntity, rhs: Market.GetMarketsRegionIDHistoryUnprocessableEntity) -> Bool {
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
