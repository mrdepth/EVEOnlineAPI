import Foundation
import Alamofire


public extension ESI {
	public var incursions: Incursions {
		return Incursions(sessionManager: self)
	}
	
	class Incursions {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		public func listIncursions(completionBlock:((Result<[Incursions.Incursion]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			
			
			let url = session!.baseURL + "latest/incursions/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Incursions.Incursion]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		public class Incursion: NSObject, NSCoding , JSONCoding {
			
			public enum GetIncursionsState: String, JSONCoding {
				case established = "established"
				case mobilizing = "mobilizing"
				case withdrawing = "withdrawing"
				
				public init() {
					self = .withdrawing
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetIncursionsState(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
					self = v
				}
				
			}
			
			public var constellationID: Int
			public var factionID: Int
			public var hasBoss: Bool
			public var infestedSolarSystems: [Int]
			public var influence: Float
			public var stagingSolarSystemID: Int
			public var state: Incursions.Incursion.GetIncursionsState
			public var type: String
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let constellationID = dictionary["constellation_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.constellationID = constellationID
				guard let factionID = dictionary["faction_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.factionID = factionID
				guard let hasBoss = dictionary["has_boss"] as? Bool else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.hasBoss = hasBoss
				infestedSolarSystems = try (dictionary["infested_solar_systems"] as? [Any])?.map {try Int(json: $0)} ?? []
				guard let influence = dictionary["influence"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.influence = influence
				guard let stagingSolarSystemID = dictionary["staging_solar_system_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.stagingSolarSystemID = stagingSolarSystemID
				guard let state = Incursions.Incursion.GetIncursionsState(rawValue: dictionary["state"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.state = state
				guard let type = dictionary["type"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.type = type
				
				super.init()
			}
			
			override public init() {
				constellationID = Int()
				factionID = Int()
				hasBoss = Bool()
				infestedSolarSystems = []
				influence = Float()
				stagingSolarSystemID = Int()
				state = Incursions.Incursion.GetIncursionsState()
				type = String()
				
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				constellationID = aDecoder.decodeInteger(forKey: "constellation_id")
				factionID = aDecoder.decodeInteger(forKey: "faction_id")
				hasBoss = aDecoder.decodeBool(forKey: "has_boss")
				infestedSolarSystems = aDecoder.decodeObject(forKey: "infested_solar_systems") as? [Int] ?? []
				influence = aDecoder.decodeFloat(forKey: "influence")
				stagingSolarSystemID = aDecoder.decodeInteger(forKey: "staging_solar_system_id")
				state = Incursions.Incursion.GetIncursionsState(rawValue: aDecoder.decodeObject(forKey: "state") as? String ?? "") ?? Incursions.Incursion.GetIncursionsState()
				type = aDecoder.decodeObject(forKey: "type") as? String ?? String()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(constellationID, forKey: "constellation_id")
				aCoder.encode(factionID, forKey: "faction_id")
				aCoder.encode(hasBoss, forKey: "has_boss")
				aCoder.encode(infestedSolarSystems, forKey: "infested_solar_systems")
				aCoder.encode(influence, forKey: "influence")
				aCoder.encode(stagingSolarSystemID, forKey: "staging_solar_system_id")
				aCoder.encode(state.rawValue, forKey: "state")
				aCoder.encode(type, forKey: "type")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["constellation_id"] = constellationID.json
				json["faction_id"] = factionID.json
				json["has_boss"] = hasBoss.json
				json["infested_solar_systems"] = infestedSolarSystems.json
				json["influence"] = influence.json
				json["staging_solar_system_id"] = stagingSolarSystemID.json
				json["state"] = state.json
				json["type"] = type.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: constellationID.hashValue)
				hashCombine(seed: &hash, value: factionID.hashValue)
				hashCombine(seed: &hash, value: hasBoss.hashValue)
				infestedSolarSystems.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: influence.hashValue)
				hashCombine(seed: &hash, value: stagingSolarSystemID.hashValue)
				hashCombine(seed: &hash, value: state.hashValue)
				hashCombine(seed: &hash, value: type.hashValue)
				return hash
			}
			
			public static func ==(lhs: Incursions.Incursion, rhs: Incursions.Incursion) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetIncursionsInternalServerError: NSObject, NSCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Incursions.GetIncursionsInternalServerError, rhs: Incursions.GetIncursionsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
	}
	
}
