import Foundation
import Alamofire


public extension ESI {
	public var location: Location {
		return Location(sessionManager: self)
	}
	
	class Location {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		public func getCharacterLocation(characterID: Int, completionBlock:((Result<Location.CharacterLocation>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-location.read_location.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/location/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Location.CharacterLocation>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getCharacterOnline(characterID: Int, completionBlock:((Result<Bool>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-location.read_online.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/online/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Bool>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getCurrentShip(characterID: Int, completionBlock:((Result<Location.CharacterShip>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-location.read_ship_type.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/ship/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Location.CharacterShip>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		@objc(ESILocationCharacterShip) public class CharacterShip: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var shipItemID: Int64 = Int64()
			public var shipName: String = String()
			public var shipTypeID: Int = Int()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let shipItemID = dictionary["ship_item_id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.shipItemID = shipItemID
				guard let shipName = dictionary["ship_name"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.shipName = shipName
				guard let shipTypeID = dictionary["ship_type_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.shipTypeID = shipTypeID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				shipItemID = aDecoder.decodeInt64(forKey: "ship_item_id")
				shipName = aDecoder.decodeObject(forKey: "ship_name") as? String ?? String()
				shipTypeID = aDecoder.decodeInteger(forKey: "ship_type_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(shipItemID, forKey: "ship_item_id")
				aCoder.encode(shipName, forKey: "ship_name")
				aCoder.encode(shipTypeID, forKey: "ship_type_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["ship_item_id"] = shipItemID.json
				json["ship_name"] = shipName.json
				json["ship_type_id"] = shipTypeID.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.shipItemID.hashValue)
				hashCombine(seed: &hash, value: self.shipName.hashValue)
				hashCombine(seed: &hash, value: self.shipTypeID.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Location.CharacterShip, rhs: Location.CharacterShip) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Location.CharacterShip) {
				shipItemID = other.shipItemID
				shipName = other.shipName
				shipTypeID = other.shipTypeID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Location.CharacterShip(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? CharacterShip)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESILocationCharacterLocation) public class CharacterLocation: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var solarSystemID: Int = Int()
			public var stationID: Int? = nil
			public var structureID: Int64? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let solarSystemID = dictionary["solar_system_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.solarSystemID = solarSystemID
				stationID = dictionary["station_id"] as? Int
				structureID = dictionary["structure_id"] as? Int64
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				solarSystemID = aDecoder.decodeInteger(forKey: "solar_system_id")
				stationID = aDecoder.containsValue(forKey: "station_id") ? aDecoder.decodeInteger(forKey: "station_id") : nil
				structureID = aDecoder.containsValue(forKey: "structure_id") ? aDecoder.decodeInt64(forKey: "structure_id") : nil
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(solarSystemID, forKey: "solar_system_id")
				if let v = stationID {
					aCoder.encode(v, forKey: "station_id")
				}
				if let v = structureID {
					aCoder.encode(v, forKey: "structure_id")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["solar_system_id"] = solarSystemID.json
				if let v = stationID?.json {
					json["station_id"] = v
				}
				if let v = structureID?.json {
					json["structure_id"] = v
				}
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.solarSystemID.hashValue)
				hashCombine(seed: &hash, value: self.stationID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.structureID?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Location.CharacterLocation, rhs: Location.CharacterLocation) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Location.CharacterLocation) {
				solarSystemID = other.solarSystemID
				stationID = other.stationID
				structureID = other.structureID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Location.CharacterLocation(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? CharacterLocation)?.hashValue == hashValue
			}
			
		}
		
		
	}
	
}
