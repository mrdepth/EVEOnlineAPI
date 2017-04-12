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
		
		public func listMarketPrices(completionBlock:((Result<[Market.Price]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			
			
			let url = session!.baseURL + "latest/markets/prices/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Market.Price]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func listHistoricalMarketStatisticsInRegion(regionID: Int, typeID: Int, completionBlock:((Result<[Market.History]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			parameters["type_id"] = typeID.json
			
			let url = session!.baseURL + "latest/markets/\(regionID)/history/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Market.History]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func listOrdersInStructure(page: Int? = nil, structureID: Int64, completionBlock:((Result<[Market.Structure]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-markets.structure_markets.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			if let v = page {
				parameters["page"] = v.json
			}
			
			let url = session!.baseURL + "latest/markets/structures/\(structureID)/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Market.Structure]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func listOrdersInRegion(orderType: Market.OrderType, page: Int? = nil, regionID: Int, typeID: Int? = nil, completionBlock:((Result<[Market.Order]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			parameters["order_type"] = orderType.json
			if let v = page {
				parameters["page"] = v.json
			}
			if let v = typeID {
				parameters["type_id"] = v.json
			}
			
			let url = session!.baseURL + "latest/markets/\(regionID)/orders/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Market.Order]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getItemGroupInformation(language: Language? = nil, marketGroupID: Int, completionBlock:((Result<Market.ItemGroupInformation>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			if let v = language {
				parameters["language"] = v.json
			}
			
			let url = session!.baseURL + "latest/markets/groups/\(marketGroupID)/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Market.ItemGroupInformation>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getItemGroups(completionBlock:((Result<[Int]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			
			
			let url = session!.baseURL + "latest/markets/groups/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Int]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		public class GetMarketsGroupsMarketGroupIDNotFound: NSObject, NSCoding , JSONCoding {
			
			
			public var error: String?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				error = nil
				
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Market.GetMarketsGroupsMarketGroupIDNotFound, rhs: Market.GetMarketsGroupsMarketGroupIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class Order: NSObject, NSCoding , JSONCoding {
			
			public enum GetMarketsRegionIDOrdersRange: String, JSONCoding {
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
				
				public init() {
					self = .station
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetMarketsRegionIDOrdersRange(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
					self = v
				}
				
			}
			
			public var duration: Int
			public var isBuyOrder: Bool
			public var issued: Date
			public var locationID: Int64
			public var minVolume: Int
			public var orderID: Int64
			public var price: Float
			public var range: Market.Order.GetMarketsRegionIDOrdersRange
			public var typeID: Int
			public var volumeRemain: Int
			public var volumeTotal: Int
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let duration = dictionary["duration"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.duration = duration
				guard let isBuyOrder = dictionary["is_buy_order"] as? Bool else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.isBuyOrder = isBuyOrder
				guard let issued = DateFormatter.esiDateFormatter.date(from: dictionary["issued"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.issued = issued
				guard let locationID = dictionary["location_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.locationID = locationID
				guard let minVolume = dictionary["min_volume"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.minVolume = minVolume
				guard let orderID = dictionary["order_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.orderID = orderID
				guard let price = dictionary["price"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.price = price
				guard let range = Market.Order.GetMarketsRegionIDOrdersRange(rawValue: dictionary["range"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.range = range
				guard let typeID = dictionary["type_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.typeID = typeID
				guard let volumeRemain = dictionary["volume_remain"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.volumeRemain = volumeRemain
				guard let volumeTotal = dictionary["volume_total"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.volumeTotal = volumeTotal
				
				super.init()
			}
			
			override public init() {
				duration = Int()
				isBuyOrder = Bool()
				issued = Date()
				locationID = Int64()
				minVolume = Int()
				orderID = Int64()
				price = Float()
				range = Market.Order.GetMarketsRegionIDOrdersRange()
				typeID = Int()
				volumeRemain = Int()
				volumeTotal = Int()
				
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				duration = aDecoder.decodeInteger(forKey: "duration")
				isBuyOrder = aDecoder.decodeBool(forKey: "is_buy_order")
				issued = aDecoder.decodeObject(forKey: "issued") as? Date ?? Date()
				locationID = aDecoder.decodeInt64(forKey: "location_id")
				minVolume = aDecoder.decodeInteger(forKey: "min_volume")
				orderID = aDecoder.decodeInt64(forKey: "order_id")
				price = aDecoder.decodeFloat(forKey: "price")
				range = Market.Order.GetMarketsRegionIDOrdersRange(rawValue: aDecoder.decodeObject(forKey: "range") as? String ?? "") ?? Market.Order.GetMarketsRegionIDOrdersRange()
				typeID = aDecoder.decodeInteger(forKey: "type_id")
				volumeRemain = aDecoder.decodeInteger(forKey: "volume_remain")
				volumeTotal = aDecoder.decodeInteger(forKey: "volume_total")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(duration, forKey: "duration")
				aCoder.encode(isBuyOrder, forKey: "is_buy_order")
				aCoder.encode(issued, forKey: "issued")
				aCoder.encode(locationID, forKey: "location_id")
				aCoder.encode(minVolume, forKey: "min_volume")
				aCoder.encode(orderID, forKey: "order_id")
				aCoder.encode(price, forKey: "price")
				aCoder.encode(range.rawValue, forKey: "range")
				aCoder.encode(typeID, forKey: "type_id")
				aCoder.encode(volumeRemain, forKey: "volume_remain")
				aCoder.encode(volumeTotal, forKey: "volume_total")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["duration"] = duration.json
				json["is_buy_order"] = isBuyOrder.json
				json["issued"] = issued.json
				json["location_id"] = locationID.json
				json["min_volume"] = minVolume.json
				json["order_id"] = orderID.json
				json["price"] = price.json
				json["range"] = range.json
				json["type_id"] = typeID.json
				json["volume_remain"] = volumeRemain.json
				json["volume_total"] = volumeTotal.json
				return json
			}
			
			override public var hashValue: Int {
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
			
		}
		
		
		public class GetMarketsStructuresStructureIDForbidden: NSObject, NSCoding , JSONCoding {
			
			
			public var error: String?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				error = nil
				
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Market.GetMarketsStructuresStructureIDForbidden, rhs: Market.GetMarketsStructuresStructureIDForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetMarketsRegionIDOrdersUnprocessableEntity: NSObject, NSCoding , JSONCoding {
			
			
			public var error: String?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				error = nil
				
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Market.GetMarketsRegionIDOrdersUnprocessableEntity, rhs: Market.GetMarketsRegionIDOrdersUnprocessableEntity) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class ItemGroupInformation: NSObject, NSCoding , JSONCoding {
			
			
			public var localizedDescription: String
			public var marketGroupID: Int
			public var name: String
			public var parentGroupID: Int?
			public var types: [Int]
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let localizedDescription = dictionary["description"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.localizedDescription = localizedDescription
				guard let marketGroupID = dictionary["market_group_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.marketGroupID = marketGroupID
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.name = name
				parentGroupID = dictionary["parent_group_id"] as? Int
				types = try (dictionary["types"] as? [Any])?.map {try Int(json: $0)} ?? []
				
				super.init()
			}
			
			override public init() {
				localizedDescription = String()
				marketGroupID = Int()
				name = String()
				parentGroupID = nil
				types = []
				
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				localizedDescription = aDecoder.decodeObject(forKey: "description") as? String ?? String()
				marketGroupID = aDecoder.decodeInteger(forKey: "market_group_id")
				name = aDecoder.decodeObject(forKey: "name") as? String ?? String()
				parentGroupID = aDecoder.containsValue(forKey: "parent_group_id") ? aDecoder.decodeInteger(forKey: "parent_group_id") : nil
				types = aDecoder.decodeObject(forKey: "types") as? [Int] ?? []
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(localizedDescription, forKey: "description")
				aCoder.encode(marketGroupID, forKey: "market_group_id")
				aCoder.encode(name, forKey: "name")
				if let v = parentGroupID {
					aCoder.encode(v, forKey: "parent_group_id")
				}
				aCoder.encode(types, forKey: "types")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["description"] = localizedDescription.json
				json["market_group_id"] = marketGroupID.json
				json["name"] = name.json
				if let v = parentGroupID?.json {
					json["parent_group_id"] = v
				}
				json["types"] = types.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: localizedDescription.hashValue)
				hashCombine(seed: &hash, value: marketGroupID.hashValue)
				hashCombine(seed: &hash, value: name.hashValue)
				hashCombine(seed: &hash, value: parentGroupID?.hashValue ?? 0)
				types.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}
			
			public static func ==(lhs: Market.ItemGroupInformation, rhs: Market.ItemGroupInformation) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetMarketsStructuresStructureIDInternalServerError: NSObject, NSCoding , JSONCoding {
			
			
			public var error: String?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				error = nil
				
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Market.GetMarketsStructuresStructureIDInternalServerError, rhs: Market.GetMarketsStructuresStructureIDInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class History: NSObject, NSCoding , JSONCoding {
			
			
			public var average: Float
			public var date: Date
			public var highest: Float
			public var lowest: Float
			public var orderCount: Int64
			public var volume: Int64
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let average = dictionary["average"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.average = average
				guard let date = DateFormatter.esiDateFormatter.date(from: dictionary["date"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.date = date
				guard let highest = dictionary["highest"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.highest = highest
				guard let lowest = dictionary["lowest"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.lowest = lowest
				guard let orderCount = dictionary["order_count"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.orderCount = orderCount
				guard let volume = dictionary["volume"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.volume = volume
				
				super.init()
			}
			
			override public init() {
				average = Float()
				date = Date()
				highest = Float()
				lowest = Float()
				orderCount = Int64()
				volume = Int64()
				
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				average = aDecoder.decodeFloat(forKey: "average")
				date = aDecoder.decodeObject(forKey: "date") as? Date ?? Date()
				highest = aDecoder.decodeFloat(forKey: "highest")
				lowest = aDecoder.decodeFloat(forKey: "lowest")
				orderCount = aDecoder.decodeInt64(forKey: "order_count")
				volume = aDecoder.decodeInt64(forKey: "volume")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(average, forKey: "average")
				aCoder.encode(date, forKey: "date")
				aCoder.encode(highest, forKey: "highest")
				aCoder.encode(lowest, forKey: "lowest")
				aCoder.encode(orderCount, forKey: "order_count")
				aCoder.encode(volume, forKey: "volume")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["average"] = average.json
				json["date"] = date.json
				json["highest"] = highest.json
				json["lowest"] = lowest.json
				json["order_count"] = orderCount.json
				json["volume"] = volume.json
				return json
			}
			
			override public var hashValue: Int {
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
			
		}
		
		
		public class Price: NSObject, NSCoding , JSONCoding {
			
			
			public var adjustedPrice: Float?
			public var averagePrice: Float?
			public var typeID: Int
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				adjustedPrice = dictionary["adjusted_price"] as? Float
				averagePrice = dictionary["average_price"] as? Float
				guard let typeID = dictionary["type_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.typeID = typeID
				
				super.init()
			}
			
			override public init() {
				adjustedPrice = nil
				averagePrice = nil
				typeID = Int()
				
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				adjustedPrice = aDecoder.containsValue(forKey: "adjusted_price") ? aDecoder.decodeFloat(forKey: "adjusted_price") : nil
				averagePrice = aDecoder.containsValue(forKey: "average_price") ? aDecoder.decodeFloat(forKey: "average_price") : nil
				typeID = aDecoder.decodeInteger(forKey: "type_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = adjustedPrice {
					aCoder.encode(v, forKey: "adjusted_price")
				}
				if let v = averagePrice {
					aCoder.encode(v, forKey: "average_price")
				}
				aCoder.encode(typeID, forKey: "type_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = adjustedPrice?.json {
					json["adjusted_price"] = v
				}
				if let v = averagePrice?.json {
					json["average_price"] = v
				}
				json["type_id"] = typeID.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: adjustedPrice?.hashValue ?? 0)
				hashCombine(seed: &hash, value: averagePrice?.hashValue ?? 0)
				hashCombine(seed: &hash, value: typeID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Market.Price, rhs: Market.Price) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetMarketsGroupsMarketGroupIDInternalServerError: NSObject, NSCoding , JSONCoding {
			
			
			public var error: String?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				error = nil
				
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Market.GetMarketsGroupsMarketGroupIDInternalServerError, rhs: Market.GetMarketsGroupsMarketGroupIDInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetMarketsRegionIDOrdersInternalServerError: NSObject, NSCoding , JSONCoding {
			
			
			public var error: String?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				error = nil
				
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Market.GetMarketsRegionIDOrdersInternalServerError, rhs: Market.GetMarketsRegionIDOrdersInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetMarketsRegionIDHistoryInternalServerError: NSObject, NSCoding , JSONCoding {
			
			
			public var error: String?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				error = nil
				
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Market.GetMarketsRegionIDHistoryInternalServerError, rhs: Market.GetMarketsRegionIDHistoryInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetMarketsGroupsInternalServerError: NSObject, NSCoding , JSONCoding {
			
			
			public var error: String?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				error = nil
				
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Market.GetMarketsGroupsInternalServerError, rhs: Market.GetMarketsGroupsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetMarketsPricesInternalServerError: NSObject, NSCoding , JSONCoding {
			
			
			public var error: String?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				error = nil
				
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Market.GetMarketsPricesInternalServerError, rhs: Market.GetMarketsPricesInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public enum OrderType: String, JSONCoding {
			case all = "all"
			case buy = "buy"
			case sell = "sell"
			
			public init() {
				self = .all
			}
			
			public var json: Any {
				return self.rawValue
			}
			
			public init(json: Any) throws {
				guard let s = json as? String, let v = OrderType(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
				self = v
			}
			
		}
		
		
		public class GetMarketsRegionIDHistoryUnprocessableEntity: NSObject, NSCoding , JSONCoding {
			
			
			public var error: String?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				error = nil
				
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Market.GetMarketsRegionIDHistoryUnprocessableEntity, rhs: Market.GetMarketsRegionIDHistoryUnprocessableEntity) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class Structure: NSObject, NSCoding , JSONCoding {
			
			public enum GetMarketsStructuresStructureIDRange: String, JSONCoding {
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
				
				public init() {
					self = .station
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetMarketsStructuresStructureIDRange(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
					self = v
				}
				
			}
			
			public var duration: Int
			public var isBuyOrder: Bool
			public var issued: Date
			public var locationID: Int64
			public var minVolume: Int
			public var orderID: Int64
			public var price: Float
			public var range: Market.Structure.GetMarketsStructuresStructureIDRange
			public var typeID: Int
			public var volumeRemain: Int
			public var volumeTotal: Int
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let duration = dictionary["duration"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.duration = duration
				guard let isBuyOrder = dictionary["is_buy_order"] as? Bool else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.isBuyOrder = isBuyOrder
				guard let issued = DateFormatter.esiDateFormatter.date(from: dictionary["issued"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.issued = issued
				guard let locationID = dictionary["location_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.locationID = locationID
				guard let minVolume = dictionary["min_volume"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.minVolume = minVolume
				guard let orderID = dictionary["order_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.orderID = orderID
				guard let price = dictionary["price"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.price = price
				guard let range = Market.Structure.GetMarketsStructuresStructureIDRange(rawValue: dictionary["range"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.range = range
				guard let typeID = dictionary["type_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.typeID = typeID
				guard let volumeRemain = dictionary["volume_remain"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.volumeRemain = volumeRemain
				guard let volumeTotal = dictionary["volume_total"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.volumeTotal = volumeTotal
				
				super.init()
			}
			
			override public init() {
				duration = Int()
				isBuyOrder = Bool()
				issued = Date()
				locationID = Int64()
				minVolume = Int()
				orderID = Int64()
				price = Float()
				range = Market.Structure.GetMarketsStructuresStructureIDRange()
				typeID = Int()
				volumeRemain = Int()
				volumeTotal = Int()
				
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				duration = aDecoder.decodeInteger(forKey: "duration")
				isBuyOrder = aDecoder.decodeBool(forKey: "is_buy_order")
				issued = aDecoder.decodeObject(forKey: "issued") as? Date ?? Date()
				locationID = aDecoder.decodeInt64(forKey: "location_id")
				minVolume = aDecoder.decodeInteger(forKey: "min_volume")
				orderID = aDecoder.decodeInt64(forKey: "order_id")
				price = aDecoder.decodeFloat(forKey: "price")
				range = Market.Structure.GetMarketsStructuresStructureIDRange(rawValue: aDecoder.decodeObject(forKey: "range") as? String ?? "") ?? Market.Structure.GetMarketsStructuresStructureIDRange()
				typeID = aDecoder.decodeInteger(forKey: "type_id")
				volumeRemain = aDecoder.decodeInteger(forKey: "volume_remain")
				volumeTotal = aDecoder.decodeInteger(forKey: "volume_total")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(duration, forKey: "duration")
				aCoder.encode(isBuyOrder, forKey: "is_buy_order")
				aCoder.encode(issued, forKey: "issued")
				aCoder.encode(locationID, forKey: "location_id")
				aCoder.encode(minVolume, forKey: "min_volume")
				aCoder.encode(orderID, forKey: "order_id")
				aCoder.encode(price, forKey: "price")
				aCoder.encode(range.rawValue, forKey: "range")
				aCoder.encode(typeID, forKey: "type_id")
				aCoder.encode(volumeRemain, forKey: "volume_remain")
				aCoder.encode(volumeTotal, forKey: "volume_total")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["duration"] = duration.json
				json["is_buy_order"] = isBuyOrder.json
				json["issued"] = issued.json
				json["location_id"] = locationID.json
				json["min_volume"] = minVolume.json
				json["order_id"] = orderID.json
				json["price"] = price.json
				json["range"] = range.json
				json["type_id"] = typeID.json
				json["volume_remain"] = volumeRemain.json
				json["volume_total"] = volumeTotal.json
				return json
			}
			
			override public var hashValue: Int {
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
			
		}
		
		
	}
	
}
