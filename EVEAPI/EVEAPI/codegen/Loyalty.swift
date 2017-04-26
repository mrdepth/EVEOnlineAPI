import Foundation
import Alamofire


public extension ESI {
	public var loyalty: Loyalty {
		return Loyalty(sessionManager: self)
	}
	
	class Loyalty {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		public func listLoyaltyStoreOffers(corporationID: Int, completionBlock:((Result<[Loyalty.Offer]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/loyalty/stores/\(corporationID)/offers/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Loyalty.Offer]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getLoyaltyPoints(characterID: Int, completionBlock:((Result<[Loyalty.Point]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-characters.read_loyalty.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/loyalty/points/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Loyalty.Point]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		public class GetCharactersCharacterIDLoyaltyPointsForbidden: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			public static func ==(lhs: Loyalty.GetCharactersCharacterIDLoyaltyPointsForbidden, rhs: Loyalty.GetCharactersCharacterIDLoyaltyPointsForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Loyalty.GetCharactersCharacterIDLoyaltyPointsForbidden) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Loyalty.GetCharactersCharacterIDLoyaltyPointsForbidden(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCharactersCharacterIDLoyaltyPointsForbidden)?.hashValue == hashValue
			}
			
		}
		
		
		public class GetLoyaltyStoresCorporationIDOffersInternalServerError: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			public static func ==(lhs: Loyalty.GetLoyaltyStoresCorporationIDOffersInternalServerError, rhs: Loyalty.GetLoyaltyStoresCorporationIDOffersInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Loyalty.GetLoyaltyStoresCorporationIDOffersInternalServerError) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Loyalty.GetLoyaltyStoresCorporationIDOffersInternalServerError(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetLoyaltyStoresCorporationIDOffersInternalServerError)?.hashValue == hashValue
			}
			
		}
		
		
		public class Offer: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class GetLoyaltyStoresCorporationIDOffersRequiredItems: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var quantity: Int = Int()
				public var typeID: Int = Int()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let quantity = dictionary["quantity"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.quantity = quantity
					guard let typeID = dictionary["type_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.typeID = typeID
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					quantity = aDecoder.decodeInteger(forKey: "quantity")
					typeID = aDecoder.decodeInteger(forKey: "type_id")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(quantity, forKey: "quantity")
					aCoder.encode(typeID, forKey: "type_id")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["quantity"] = quantity.json
					json["type_id"] = typeID.json
					return json
				}
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: quantity.hashValue)
					hashCombine(seed: &hash, value: typeID.hashValue)
					return hash
				}
				
				public static func ==(lhs: Loyalty.Offer.GetLoyaltyStoresCorporationIDOffersRequiredItems, rhs: Loyalty.Offer.GetLoyaltyStoresCorporationIDOffersRequiredItems) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Loyalty.Offer.GetLoyaltyStoresCorporationIDOffersRequiredItems) {
					quantity = other.quantity
					typeID = other.typeID
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Loyalty.Offer.GetLoyaltyStoresCorporationIDOffersRequiredItems(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetLoyaltyStoresCorporationIDOffersRequiredItems)?.hashValue == hashValue
				}
				
			}
			
			public var iskCost: Int = Int()
			public var lpCost: Int = Int()
			public var offerID: Int = Int()
			public var quantity: Int = Int()
			public var requiredItems: [Loyalty.Offer.GetLoyaltyStoresCorporationIDOffersRequiredItems] = []
			public var typeID: Int = Int()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let iskCost = dictionary["isk_cost"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.iskCost = iskCost
				guard let lpCost = dictionary["lp_cost"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.lpCost = lpCost
				guard let offerID = dictionary["offer_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.offerID = offerID
				guard let quantity = dictionary["quantity"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.quantity = quantity
				requiredItems = try (dictionary["required_items"] as? [Any])?.map {try Loyalty.Offer.GetLoyaltyStoresCorporationIDOffersRequiredItems(json: $0)} ?? []
				guard let typeID = dictionary["type_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.typeID = typeID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				iskCost = aDecoder.decodeInteger(forKey: "isk_cost")
				lpCost = aDecoder.decodeInteger(forKey: "lp_cost")
				offerID = aDecoder.decodeInteger(forKey: "offer_id")
				quantity = aDecoder.decodeInteger(forKey: "quantity")
				requiredItems = aDecoder.decodeObject(of: [Loyalty.Offer.GetLoyaltyStoresCorporationIDOffersRequiredItems.self], forKey: "required_items") as? [Loyalty.Offer.GetLoyaltyStoresCorporationIDOffersRequiredItems] ?? []
				typeID = aDecoder.decodeInteger(forKey: "type_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(iskCost, forKey: "isk_cost")
				aCoder.encode(lpCost, forKey: "lp_cost")
				aCoder.encode(offerID, forKey: "offer_id")
				aCoder.encode(quantity, forKey: "quantity")
				aCoder.encode(requiredItems, forKey: "required_items")
				aCoder.encode(typeID, forKey: "type_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["isk_cost"] = iskCost.json
				json["lp_cost"] = lpCost.json
				json["offer_id"] = offerID.json
				json["quantity"] = quantity.json
				json["required_items"] = requiredItems.json
				json["type_id"] = typeID.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: iskCost.hashValue)
				hashCombine(seed: &hash, value: lpCost.hashValue)
				hashCombine(seed: &hash, value: offerID.hashValue)
				hashCombine(seed: &hash, value: quantity.hashValue)
				requiredItems.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: typeID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Loyalty.Offer, rhs: Loyalty.Offer) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Loyalty.Offer) {
				iskCost = other.iskCost
				lpCost = other.lpCost
				offerID = other.offerID
				quantity = other.quantity
				requiredItems = other.requiredItems.flatMap { Loyalty.Offer.GetLoyaltyStoresCorporationIDOffersRequiredItems($0) }
				typeID = other.typeID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Loyalty.Offer(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Offer)?.hashValue == hashValue
			}
			
		}
		
		
		public class Point: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var corporationID: Int = Int()
			public var loyaltyPoints: Int = Int()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let corporationID = dictionary["corporation_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.corporationID = corporationID
				guard let loyaltyPoints = dictionary["loyalty_points"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.loyaltyPoints = loyaltyPoints
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				corporationID = aDecoder.decodeInteger(forKey: "corporation_id")
				loyaltyPoints = aDecoder.decodeInteger(forKey: "loyalty_points")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(corporationID, forKey: "corporation_id")
				aCoder.encode(loyaltyPoints, forKey: "loyalty_points")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["corporation_id"] = corporationID.json
				json["loyalty_points"] = loyaltyPoints.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: corporationID.hashValue)
				hashCombine(seed: &hash, value: loyaltyPoints.hashValue)
				return hash
			}
			
			public static func ==(lhs: Loyalty.Point, rhs: Loyalty.Point) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Loyalty.Point) {
				corporationID = other.corporationID
				loyaltyPoints = other.loyaltyPoints
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Loyalty.Point(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Point)?.hashValue == hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDLoyaltyPointsInternalServerError: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			public static func ==(lhs: Loyalty.GetCharactersCharacterIDLoyaltyPointsInternalServerError, rhs: Loyalty.GetCharactersCharacterIDLoyaltyPointsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Loyalty.GetCharactersCharacterIDLoyaltyPointsInternalServerError) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Loyalty.GetCharactersCharacterIDLoyaltyPointsInternalServerError(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCharactersCharacterIDLoyaltyPointsInternalServerError)?.hashValue == hashValue
			}
			
		}
		
		
	}
	
}
