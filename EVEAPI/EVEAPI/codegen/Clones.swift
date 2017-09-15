import Foundation
import Alamofire


public extension ESI {
	public var clones: Clones {
		return Clones(sessionManager: self)
	}
	
	class Clones {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		public func getClones(characterID: Int, completionBlock:((Result<Clones.JumpClones>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-clones.read_clones.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/clones/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Clones.JumpClones>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getActiveImplants(characterID: Int, completionBlock:((Result<[Int]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-clones.read_implants.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/implants/"
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
		
		
		@objc(ESIClonesJumpClones) public class JumpClones: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public enum LocationType: String, JSONCoding, HTTPQueryable {
				case station = "station"
				case structure = "structure"
				
				public init() {
					self = .station
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = LocationType(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			@objc(ESIClonesJumpClonesLocation) public class Location: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var locationID: Int64? = nil
				public var locationType: Clones.JumpClones.LocationType? = nil
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					locationID = dictionary["location_id"] as? Int64
					locationType = Clones.JumpClones.LocationType(rawValue: dictionary["location_type"] as? String ?? "")
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init?(coder aDecoder: NSCoder) {
					locationID = aDecoder.containsValue(forKey: "location_id") ? aDecoder.decodeInt64(forKey: "location_id") : nil
					locationType = Clones.JumpClones.LocationType(rawValue: aDecoder.decodeObject(forKey: "location_type") as? String ?? "")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					if let v = locationID {
						aCoder.encode(v, forKey: "location_id")
					}
					if let v = locationType {
						aCoder.encode(v.rawValue, forKey: "location_type")
					}
				}
				
				public var json: Any {
					var json = [String: Any]()
					if let v = locationID?.json {
						json["location_id"] = v
					}
					if let v = locationType?.json {
						json["location_type"] = v
					}
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.locationID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.locationType?.hashValue ?? 0)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: Clones.JumpClones.Location, rhs: Clones.JumpClones.Location) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Clones.JumpClones.Location) {
					locationID = other.locationID
					locationType = other.locationType
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Clones.JumpClones.Location(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? Location)?.hashValue == hashValue
				}
				
			}
			
			@objc(ESIClonesJumpClonesJumpClone) public class JumpClone: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var implants: [Int]? = nil
				public var locationID: Int64? = nil
				public var locationType: Clones.JumpClones.LocationType? = nil
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					implants = try (dictionary["implants"] as? [Any])?.map {try Int(json: $0)}
					locationID = dictionary["location_id"] as? Int64
					locationType = Clones.JumpClones.LocationType(rawValue: dictionary["location_type"] as? String ?? "")
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init?(coder aDecoder: NSCoder) {
					implants = aDecoder.decodeObject(forKey: "implants") as? [Int]
					locationID = aDecoder.containsValue(forKey: "location_id") ? aDecoder.decodeInt64(forKey: "location_id") : nil
					locationType = Clones.JumpClones.LocationType(rawValue: aDecoder.decodeObject(forKey: "location_type") as? String ?? "")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					if let v = implants {
						aCoder.encode(v, forKey: "implants")
					}
					if let v = locationID {
						aCoder.encode(v, forKey: "location_id")
					}
					if let v = locationType {
						aCoder.encode(v.rawValue, forKey: "location_type")
					}
				}
				
				public var json: Any {
					var json = [String: Any]()
					if let v = implants?.json {
						json["implants"] = v
					}
					if let v = locationID?.json {
						json["location_id"] = v
					}
					if let v = locationType?.json {
						json["location_type"] = v
					}
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					self.implants?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					hashCombine(seed: &hash, value: self.locationID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.locationType?.hashValue ?? 0)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: Clones.JumpClones.JumpClone, rhs: Clones.JumpClones.JumpClone) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Clones.JumpClones.JumpClone) {
					implants = other.implants?.flatMap { $0 }
					locationID = other.locationID
					locationType = other.locationType
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Clones.JumpClones.JumpClone(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? JumpClone)?.hashValue == hashValue
				}
				
			}
			
			public var homeLocation: Clones.JumpClones.Location? = nil
			public var jumpClones: [Clones.JumpClones.JumpClone] = []
			public var lastJumpDate: Date? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				homeLocation = try? Clones.JumpClones.Location(json: dictionary["home_location"] as? [String: Any] ?? [:])
				jumpClones = try (dictionary["jump_clones"] as? [Any])?.map {try Clones.JumpClones.JumpClone(json: $0)} ?? []
				lastJumpDate = DateFormatter.esiDateTimeFormatter.date(from: dictionary["last_jump_date"] as? String ?? "")
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				homeLocation = aDecoder.decodeObject(of: Clones.JumpClones.Location.self, forKey: "home_location") 
				jumpClones = aDecoder.decodeObject(of: [Clones.JumpClones.JumpClone.self], forKey: "jump_clones") as? [Clones.JumpClones.JumpClone] ?? []
				lastJumpDate = aDecoder.decodeObject(forKey: "last_jump_date") as? Date
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = homeLocation {
					aCoder.encode(v, forKey: "home_location")
				}
				aCoder.encode(jumpClones, forKey: "jump_clones")
				if let v = lastJumpDate {
					aCoder.encode(v, forKey: "last_jump_date")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = homeLocation?.json {
					json["home_location"] = v
				}
				json["jump_clones"] = jumpClones.json
				if let v = lastJumpDate?.json {
					json["last_jump_date"] = v
				}
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.homeLocation?.hashValue ?? 0)
				self.jumpClones.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: self.lastJumpDate?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Clones.JumpClones, rhs: Clones.JumpClones) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Clones.JumpClones) {
				homeLocation = other.homeLocation != nil ? Clones.JumpClones.Location(other.homeLocation!) : nil
				jumpClones = other.jumpClones.flatMap { Clones.JumpClones.JumpClone($0) }
				lastJumpDate = other.lastJumpDate
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Clones.JumpClones(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? JumpClones)?.hashValue == hashValue
			}
			
		}
		
		
	}
	
}