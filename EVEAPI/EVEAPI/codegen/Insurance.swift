import Foundation
import Alamofire


public extension ESI {
	public var insurance: Insurance {
		return Insurance(sessionManager: self)
	}
	
	class Insurance {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		public func listInsuranceLevels(language: Language? = nil, completionBlock:((Result<[Insurance.Price]>) -> Void)?) {
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
			
			let url = session!.baseURL + "latest/insurance/prices/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Insurance.Price]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		@objc(ESIInsurancePrice) public class Price: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			@objc(ESIInsurancePriceGetInsurancePricesLevels) public class GetInsurancePricesLevels: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var cost: Float = Float()
				public var name: String = String()
				public var payout: Float = Float()
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let cost = dictionary["cost"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.cost = cost
					guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.name = name
					guard let payout = dictionary["payout"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.payout = payout
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init?(coder aDecoder: NSCoder) {
					cost = aDecoder.decodeFloat(forKey: "cost")
					name = aDecoder.decodeObject(forKey: "name") as? String ?? String()
					payout = aDecoder.decodeFloat(forKey: "payout")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(cost, forKey: "cost")
					aCoder.encode(name, forKey: "name")
					aCoder.encode(payout, forKey: "payout")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["cost"] = cost.json
					json["name"] = name.json
					json["payout"] = payout.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.cost.hashValue)
					hashCombine(seed: &hash, value: self.name.hashValue)
					hashCombine(seed: &hash, value: self.payout.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: Insurance.Price.GetInsurancePricesLevels, rhs: Insurance.Price.GetInsurancePricesLevels) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Insurance.Price.GetInsurancePricesLevels) {
					cost = other.cost
					name = other.name
					payout = other.payout
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Insurance.Price.GetInsurancePricesLevels(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetInsurancePricesLevels)?.hashValue == hashValue
				}
				
			}
			
			public var levels: [Insurance.Price.GetInsurancePricesLevels] = []
			public var typeID: Int = Int()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				levels = try (dictionary["levels"] as? [Any])?.map {try Insurance.Price.GetInsurancePricesLevels(json: $0)} ?? []
				guard let typeID = dictionary["type_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.typeID = typeID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				levels = aDecoder.decodeObject(of: [Insurance.Price.GetInsurancePricesLevels.self], forKey: "levels") as? [Insurance.Price.GetInsurancePricesLevels] ?? []
				typeID = aDecoder.decodeInteger(forKey: "type_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(levels, forKey: "levels")
				aCoder.encode(typeID, forKey: "type_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["levels"] = levels.json
				json["type_id"] = typeID.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.levels.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: self.typeID.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Insurance.Price, rhs: Insurance.Price) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Insurance.Price) {
				levels = other.levels.flatMap { Insurance.Price.GetInsurancePricesLevels($0) }
				typeID = other.typeID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Insurance.Price(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Price)?.hashValue == hashValue
			}
			
		}
		
		
	}
	
}
