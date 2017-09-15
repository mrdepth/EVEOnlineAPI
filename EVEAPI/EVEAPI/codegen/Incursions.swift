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
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/incursions/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Incursions.Incursion]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		@objc(ESIIncursionsIncursion) public class Incursion: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public enum State: String, JSONCoding, HTTPQueryable {
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
					guard let s = json as? String, let v = State(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var constellationID: Int = Int()
			public var factionID: Int = Int()
			public var hasBoss: Bool = Bool()
			public var infestedSolarSystems: [Int] = []
			public var influence: Float = Float()
			public var stagingSolarSystemID: Int = Int()
			public var state: Incursions.Incursion.State = Incursions.Incursion.State()
			public var type: String = String()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let constellationID = dictionary["constellation_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.constellationID = constellationID
				guard let factionID = dictionary["faction_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.factionID = factionID
				guard let hasBoss = dictionary["has_boss"] as? Bool else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.hasBoss = hasBoss
				infestedSolarSystems = try (dictionary["infested_solar_systems"] as? [Any])?.map {try Int(json: $0)} ?? []
				guard let influence = dictionary["influence"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.influence = influence
				guard let stagingSolarSystemID = dictionary["staging_solar_system_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.stagingSolarSystemID = stagingSolarSystemID
				guard let state = Incursions.Incursion.State(rawValue: dictionary["state"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.state = state
				guard let type = dictionary["type"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.type = type
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				constellationID = aDecoder.decodeInteger(forKey: "constellation_id")
				factionID = aDecoder.decodeInteger(forKey: "faction_id")
				hasBoss = aDecoder.decodeBool(forKey: "has_boss")
				infestedSolarSystems = aDecoder.decodeObject(forKey: "infested_solar_systems") as? [Int] ?? []
				influence = aDecoder.decodeFloat(forKey: "influence")
				stagingSolarSystemID = aDecoder.decodeInteger(forKey: "staging_solar_system_id")
				state = Incursions.Incursion.State(rawValue: aDecoder.decodeObject(forKey: "state") as? String ?? "") ?? Incursions.Incursion.State()
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
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.constellationID.hashValue)
				hashCombine(seed: &hash, value: self.factionID.hashValue)
				hashCombine(seed: &hash, value: self.hasBoss.hashValue)
				self.infestedSolarSystems.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: self.influence.hashValue)
				hashCombine(seed: &hash, value: self.stagingSolarSystemID.hashValue)
				hashCombine(seed: &hash, value: self.state.hashValue)
				hashCombine(seed: &hash, value: self.type.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Incursions.Incursion, rhs: Incursions.Incursion) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Incursions.Incursion) {
				constellationID = other.constellationID
				factionID = other.factionID
				hasBoss = other.hasBoss
				infestedSolarSystems = other.infestedSolarSystems.flatMap { $0 }
				influence = other.influence
				stagingSolarSystemID = other.stagingSolarSystemID
				state = other.state
				type = other.type
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Incursions.Incursion(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Incursion)?.hashValue == hashValue
			}
			
		}
		
		
	}
	
}
