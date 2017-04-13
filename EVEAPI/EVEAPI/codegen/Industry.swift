import Foundation
import Alamofire


public extension ESI {
	public var industry: Industry {
		return Industry(sessionManager: self)
	}
	
	class Industry {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		public func listIndustryFacilities(completionBlock:((Result<[Industry.Facilities]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			let headers = HTTPHeaders()
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/industry/facilities/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Industry.Facilities]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func listSolarSystemCostIndices(completionBlock:((Result<[Industry.SolarSystemCostIndices]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			let headers = HTTPHeaders()
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/industry/systems/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Industry.SolarSystemCostIndices]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		public class Facilities: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var facilityID: Int64 = Int64()
			public var ownerID: Int = Int()
			public var regionID: Int = Int()
			public var solarSystemID: Int = Int()
			public var tax: Float? = nil
			public var typeID: Int = Int()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let facilityID = dictionary["facility_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.facilityID = facilityID
				guard let ownerID = dictionary["owner_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.ownerID = ownerID
				guard let regionID = dictionary["region_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.regionID = regionID
				guard let solarSystemID = dictionary["solar_system_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.solarSystemID = solarSystemID
				tax = dictionary["tax"] as? Float
				guard let typeID = dictionary["type_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.typeID = typeID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				facilityID = aDecoder.decodeInt64(forKey: "facility_id")
				ownerID = aDecoder.decodeInteger(forKey: "owner_id")
				regionID = aDecoder.decodeInteger(forKey: "region_id")
				solarSystemID = aDecoder.decodeInteger(forKey: "solar_system_id")
				tax = aDecoder.containsValue(forKey: "tax") ? aDecoder.decodeFloat(forKey: "tax") : nil
				typeID = aDecoder.decodeInteger(forKey: "type_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(facilityID, forKey: "facility_id")
				aCoder.encode(ownerID, forKey: "owner_id")
				aCoder.encode(regionID, forKey: "region_id")
				aCoder.encode(solarSystemID, forKey: "solar_system_id")
				if let v = tax {
					aCoder.encode(v, forKey: "tax")
				}
				aCoder.encode(typeID, forKey: "type_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["facility_id"] = facilityID.json
				json["owner_id"] = ownerID.json
				json["region_id"] = regionID.json
				json["solar_system_id"] = solarSystemID.json
				if let v = tax?.json {
					json["tax"] = v
				}
				json["type_id"] = typeID.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: facilityID.hashValue)
				hashCombine(seed: &hash, value: ownerID.hashValue)
				hashCombine(seed: &hash, value: regionID.hashValue)
				hashCombine(seed: &hash, value: solarSystemID.hashValue)
				hashCombine(seed: &hash, value: tax?.hashValue ?? 0)
				hashCombine(seed: &hash, value: typeID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Industry.Facilities, rhs: Industry.Facilities) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetIndustrySystemsInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Industry.GetIndustrySystemsInternalServerError, rhs: Industry.GetIndustrySystemsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetIndustryFacilitiesInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Industry.GetIndustryFacilitiesInternalServerError, rhs: Industry.GetIndustryFacilitiesInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class SolarSystemCostIndices: NSObject, NSSecureCoding , JSONCoding {
			
			public class GetIndustrySystemsCostIndices: NSObject, NSSecureCoding , JSONCoding {
				
				public enum GetIndustrySystemsActivity: String, JSONCoding, HTTPQueryable {
					case copying = "copying"
					case duplicating = "duplicating"
					case invention = "invention"
					case manufacturing = "manufacturing"
					case none = "none"
					case researchingMaterialEfficiency = "researching_material_efficiency"
					case researchingTechnology = "researching_technology"
					case researchingTimeEfficiency = "researching_time_efficiency"
					case reverseEngineering = "reverse_engineering"
					
					public init() {
						self = .none
					}
					
					public var json: Any {
						return self.rawValue
					}
					
					public init(json: Any) throws {
						guard let s = json as? String, let v = GetIndustrySystemsActivity(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
						self = v
					}
					
					public var httpQuery: String? {
						return rawValue
					}
					
				}
				
				public var activity: Industry.SolarSystemCostIndices.GetIndustrySystemsCostIndices.GetIndustrySystemsActivity = Industry.SolarSystemCostIndices.GetIndustrySystemsCostIndices.GetIndustrySystemsActivity()
				public var costIndex: Float = Float()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let activity = Industry.SolarSystemCostIndices.GetIndustrySystemsCostIndices.GetIndustrySystemsActivity(rawValue: dictionary["activity"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.activity = activity
					guard let costIndex = dictionary["cost_index"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.costIndex = costIndex
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					activity = Industry.SolarSystemCostIndices.GetIndustrySystemsCostIndices.GetIndustrySystemsActivity(rawValue: aDecoder.decodeObject(forKey: "activity") as? String ?? "") ?? Industry.SolarSystemCostIndices.GetIndustrySystemsCostIndices.GetIndustrySystemsActivity()
					costIndex = aDecoder.decodeFloat(forKey: "cost_index")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(activity.rawValue, forKey: "activity")
					aCoder.encode(costIndex, forKey: "cost_index")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["activity"] = activity.json
					json["cost_index"] = costIndex.json
					return json
				}
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: activity.hashValue)
					hashCombine(seed: &hash, value: costIndex.hashValue)
					return hash
				}
				
				public static func ==(lhs: Industry.SolarSystemCostIndices.GetIndustrySystemsCostIndices, rhs: Industry.SolarSystemCostIndices.GetIndustrySystemsCostIndices) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
			}
			
			public var costIndices: [Industry.SolarSystemCostIndices.GetIndustrySystemsCostIndices] = []
			public var solarSystemID: Int = Int()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				costIndices = try (dictionary["cost_indices"] as? [Any])?.map {try Industry.SolarSystemCostIndices.GetIndustrySystemsCostIndices(json: $0)} ?? []
				guard let solarSystemID = dictionary["solar_system_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.solarSystemID = solarSystemID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				costIndices = aDecoder.decodeObject(of: [Industry.SolarSystemCostIndices.GetIndustrySystemsCostIndices.self], forKey: "cost_indices") as? [Industry.SolarSystemCostIndices.GetIndustrySystemsCostIndices] ?? []
				solarSystemID = aDecoder.decodeInteger(forKey: "solar_system_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(costIndices, forKey: "cost_indices")
				aCoder.encode(solarSystemID, forKey: "solar_system_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["cost_indices"] = costIndices.json
				json["solar_system_id"] = solarSystemID.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				costIndices.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: solarSystemID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Industry.SolarSystemCostIndices, rhs: Industry.SolarSystemCostIndices) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
	}
	
}
