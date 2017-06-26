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
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/markets/prices/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Market.Price]>) in
				completionBlock?(response.result)
				session = nil
			}
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
			
			let url = session!.baseURL + "latest/markets/\(regionID)/history/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Market.History]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func listOrdersInStructure(page: Int? = nil, structureID: Int64, completionBlock:((Result<[Market.Structure]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-markets.structure_markets.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "latest/markets/structures/\(structureID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Market.Structure]>) in
				completionBlock?(response.result)
				session = nil
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
			
			let url = session!.baseURL + "latest/markets/\(regionID)/orders/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Market.Order]>) in
				completionBlock?(response.result)
				session = nil
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
			
			let url = session!.baseURL + "latest/markets/groups/\(marketGroupID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Market.ItemGroupInformation>) in
				completionBlock?(response.result)
				session = nil
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
			
			
			
			let url = session!.baseURL + "latest/markets/groups/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Int]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func listOrdersFromCharacter(characterID: Int, completionBlock:((Result<[Market.CharacterOrder]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-markets.read_character_orders.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/orders/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Market.CharacterOrder]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		public class CharacterOrder: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public enum GetCharactersCharacterIDOrdersState: String, JSONCoding, HTTPQueryable {
				case cancelled = "cancelled"
				case characterDeleted = "character_deleted"
				case closed = "closed"
				case expired = "expired"
				case open = "open"
				case pending = "pending"
				
				public init() {
					self = .open
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCharactersCharacterIDOrdersState(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCharactersCharacterIDOrdersRange: String, JSONCoding, HTTPQueryable {
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
					guard let s = json as? String, let v = GetCharactersCharacterIDOrdersRange(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var accountID: Int = Int()
			public var duration: Int = Int()
			public var escrow: Float = Float()
			public var isBuyOrder: Bool = Bool()
			public var isCorp: Bool = Bool()
			public var issued: Date = Date()
			public var locationID: Int64 = Int64()
			public var minVolume: Int = Int()
			public var orderID: Int64 = Int64()
			public var price: Float = Float()
			public var range: Market.CharacterOrder.GetCharactersCharacterIDOrdersRange = Market.CharacterOrder.GetCharactersCharacterIDOrdersRange()
			public var regionID: Int = Int()
			public var state: Market.CharacterOrder.GetCharactersCharacterIDOrdersState = Market.CharacterOrder.GetCharactersCharacterIDOrdersState()
			public var typeID: Int = Int()
			public var volumeRemain: Int = Int()
			public var volumeTotal: Int = Int()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let accountID = dictionary["account_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.accountID = accountID
				guard let duration = dictionary["duration"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.duration = duration
				guard let escrow = dictionary["escrow"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.escrow = escrow
				guard let isBuyOrder = dictionary["is_buy_order"] as? Bool else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.isBuyOrder = isBuyOrder
				guard let isCorp = dictionary["is_corp"] as? Bool else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.isCorp = isCorp
				guard let issued = DateFormatter.esiDateTimeFormatter.date(from: dictionary["issued"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.issued = issued
				guard let locationID = dictionary["location_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.locationID = locationID
				guard let minVolume = dictionary["min_volume"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.minVolume = minVolume
				guard let orderID = dictionary["order_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.orderID = orderID
				guard let price = dictionary["price"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.price = price
				guard let range = Market.CharacterOrder.GetCharactersCharacterIDOrdersRange(rawValue: dictionary["range"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.range = range
				guard let regionID = dictionary["region_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.regionID = regionID
				guard let state = Market.CharacterOrder.GetCharactersCharacterIDOrdersState(rawValue: dictionary["state"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.state = state
				guard let typeID = dictionary["type_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.typeID = typeID
				guard let volumeRemain = dictionary["volume_remain"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.volumeRemain = volumeRemain
				guard let volumeTotal = dictionary["volume_total"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.volumeTotal = volumeTotal
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				accountID = aDecoder.decodeInteger(forKey: "account_id")
				duration = aDecoder.decodeInteger(forKey: "duration")
				escrow = aDecoder.decodeFloat(forKey: "escrow")
				isBuyOrder = aDecoder.decodeBool(forKey: "is_buy_order")
				isCorp = aDecoder.decodeBool(forKey: "is_corp")
				issued = aDecoder.decodeObject(forKey: "issued") as? Date ?? Date()
				locationID = aDecoder.decodeInt64(forKey: "location_id")
				minVolume = aDecoder.decodeInteger(forKey: "min_volume")
				orderID = aDecoder.decodeInt64(forKey: "order_id")
				price = aDecoder.decodeFloat(forKey: "price")
				range = Market.CharacterOrder.GetCharactersCharacterIDOrdersRange(rawValue: aDecoder.decodeObject(forKey: "range") as? String ?? "") ?? Market.CharacterOrder.GetCharactersCharacterIDOrdersRange()
				regionID = aDecoder.decodeInteger(forKey: "region_id")
				state = Market.CharacterOrder.GetCharactersCharacterIDOrdersState(rawValue: aDecoder.decodeObject(forKey: "state") as? String ?? "") ?? Market.CharacterOrder.GetCharactersCharacterIDOrdersState()
				typeID = aDecoder.decodeInteger(forKey: "type_id")
				volumeRemain = aDecoder.decodeInteger(forKey: "volume_remain")
				volumeTotal = aDecoder.decodeInteger(forKey: "volume_total")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(accountID, forKey: "account_id")
				aCoder.encode(duration, forKey: "duration")
				aCoder.encode(escrow, forKey: "escrow")
				aCoder.encode(isBuyOrder, forKey: "is_buy_order")
				aCoder.encode(isCorp, forKey: "is_corp")
				aCoder.encode(issued, forKey: "issued")
				aCoder.encode(locationID, forKey: "location_id")
				aCoder.encode(minVolume, forKey: "min_volume")
				aCoder.encode(orderID, forKey: "order_id")
				aCoder.encode(price, forKey: "price")
				aCoder.encode(range.rawValue, forKey: "range")
				aCoder.encode(regionID, forKey: "region_id")
				aCoder.encode(state.rawValue, forKey: "state")
				aCoder.encode(typeID, forKey: "type_id")
				aCoder.encode(volumeRemain, forKey: "volume_remain")
				aCoder.encode(volumeTotal, forKey: "volume_total")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["account_id"] = accountID.json
				json["duration"] = duration.json
				json["escrow"] = escrow.json
				json["is_buy_order"] = isBuyOrder.json
				json["is_corp"] = isCorp.json
				json["issued"] = issued.json
				json["location_id"] = locationID.json
				json["min_volume"] = minVolume.json
				json["order_id"] = orderID.json
				json["price"] = price.json
				json["range"] = range.json
				json["region_id"] = regionID.json
				json["state"] = state.json
				json["type_id"] = typeID.json
				json["volume_remain"] = volumeRemain.json
				json["volume_total"] = volumeTotal.json
				return json
			}
			
			override public var hashValue: Int {
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
			
			init(_ other: Market.CharacterOrder) {
				accountID = other.accountID
				duration = other.duration
				escrow = other.escrow
				isBuyOrder = other.isBuyOrder
				isCorp = other.isCorp
				issued = other.issued
				locationID = other.locationID
				minVolume = other.minVolume
				orderID = other.orderID
				price = other.price
				range = other.range
				regionID = other.regionID
				state = other.state
				typeID = other.typeID
				volumeRemain = other.volumeRemain
				volumeTotal = other.volumeTotal
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Market.CharacterOrder(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? CharacterOrder)?.hashValue == hashValue
			}
			
		}
		
		
		public class GetMarketsRegionIDOrdersUnprocessableEntity: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
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
			
			init(_ other: Market.GetMarketsRegionIDOrdersUnprocessableEntity) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Market.GetMarketsRegionIDOrdersUnprocessableEntity(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetMarketsRegionIDOrdersUnprocessableEntity)?.hashValue == hashValue
			}
			
		}
		
		
		public class ItemGroupInformation: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var localizedDescription: String = String()
			public var marketGroupID: Int = Int()
			public var name: String = String()
			public var parentGroupID: Int? = nil
			public var types: [Int] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
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
			
			init(_ other: Market.ItemGroupInformation) {
				localizedDescription = other.localizedDescription
				marketGroupID = other.marketGroupID
				name = other.name
				parentGroupID = other.parentGroupID
				types = other.types.flatMap { $0 }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Market.ItemGroupInformation(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? ItemGroupInformation)?.hashValue == hashValue
			}
			
		}
		
		
		public class History: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var average: Float = Float()
			public var date: Date = Date()
			public var highest: Float = Float()
			public var lowest: Float = Float()
			public var orderCount: Int64 = Int64()
			public var volume: Int64 = Int64()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
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
			
			init(_ other: Market.History) {
				average = other.average
				date = other.date
				highest = other.highest
				lowest = other.lowest
				orderCount = other.orderCount
				volume = other.volume
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Market.History(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? History)?.hashValue == hashValue
			}
			
		}
		
		
		public class Price: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var adjustedPrice: Float? = nil
			public var averagePrice: Float? = nil
			public var typeID: Int = Int()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				adjustedPrice = dictionary["adjusted_price"] as? Float
				averagePrice = dictionary["average_price"] as? Float
				guard let typeID = dictionary["type_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.typeID = typeID
				
				super.init()
			}
			
			override public init() {
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
			
			init(_ other: Market.Price) {
				adjustedPrice = other.adjustedPrice
				averagePrice = other.averagePrice
				typeID = other.typeID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Market.Price(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Price)?.hashValue == hashValue
			}
			
		}
		
		
		public class GetMarketsGroupsMarketGroupIDNotFound: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
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
			
			init(_ other: Market.GetMarketsGroupsMarketGroupIDNotFound) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Market.GetMarketsGroupsMarketGroupIDNotFound(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetMarketsGroupsMarketGroupIDNotFound)?.hashValue == hashValue
			}
			
		}
		
		
		public class Order: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public enum GetMarketsRegionIDOrdersRange: String, JSONCoding, HTTPQueryable {
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
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var duration: Int = Int()
			public var isBuyOrder: Bool = Bool()
			public var issued: Date = Date()
			public var locationID: Int64 = Int64()
			public var minVolume: Int = Int()
			public var orderID: Int64 = Int64()
			public var price: Float = Float()
			public var range: Market.Order.GetMarketsRegionIDOrdersRange = Market.Order.GetMarketsRegionIDOrdersRange()
			public var typeID: Int = Int()
			public var volumeRemain: Int = Int()
			public var volumeTotal: Int = Int()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let duration = dictionary["duration"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.duration = duration
				guard let isBuyOrder = dictionary["is_buy_order"] as? Bool else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.isBuyOrder = isBuyOrder
				guard let issued = DateFormatter.esiDateTimeFormatter.date(from: dictionary["issued"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
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
			
			init(_ other: Market.Order) {
				duration = other.duration
				isBuyOrder = other.isBuyOrder
				issued = other.issued
				locationID = other.locationID
				minVolume = other.minVolume
				orderID = other.orderID
				price = other.price
				range = other.range
				typeID = other.typeID
				volumeRemain = other.volumeRemain
				volumeTotal = other.volumeTotal
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Market.Order(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Order)?.hashValue == hashValue
			}
			
		}
		
		
		public enum OrderType: String, JSONCoding, HTTPQueryable {
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
			
			public var httpQuery: String? {
				return rawValue
			}
			
		}
		
		
		public class GetMarketsRegionIDHistoryUnprocessableEntity: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
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
			
			init(_ other: Market.GetMarketsRegionIDHistoryUnprocessableEntity) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Market.GetMarketsRegionIDHistoryUnprocessableEntity(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetMarketsRegionIDHistoryUnprocessableEntity)?.hashValue == hashValue
			}
			
		}
		
		
		public class Structure: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public enum GetMarketsStructuresStructureIDRange: String, JSONCoding, HTTPQueryable {
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
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var duration: Int = Int()
			public var isBuyOrder: Bool = Bool()
			public var issued: Date = Date()
			public var locationID: Int64 = Int64()
			public var minVolume: Int = Int()
			public var orderID: Int64 = Int64()
			public var price: Float = Float()
			public var range: Market.Structure.GetMarketsStructuresStructureIDRange = Market.Structure.GetMarketsStructuresStructureIDRange()
			public var typeID: Int = Int()
			public var volumeRemain: Int = Int()
			public var volumeTotal: Int = Int()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let duration = dictionary["duration"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.duration = duration
				guard let isBuyOrder = dictionary["is_buy_order"] as? Bool else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.isBuyOrder = isBuyOrder
				guard let issued = DateFormatter.esiDateTimeFormatter.date(from: dictionary["issued"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
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
			
			init(_ other: Market.Structure) {
				duration = other.duration
				isBuyOrder = other.isBuyOrder
				issued = other.issued
				locationID = other.locationID
				minVolume = other.minVolume
				orderID = other.orderID
				price = other.price
				range = other.range
				typeID = other.typeID
				volumeRemain = other.volumeRemain
				volumeTotal = other.volumeTotal
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Market.Structure(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Structure)?.hashValue == hashValue
			}
			
		}
		
		
	}
	
}
