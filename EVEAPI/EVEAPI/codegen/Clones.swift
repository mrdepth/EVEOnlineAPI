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
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-clones.read_clones.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			let headers = HTTPHeaders()
			
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
		
		
		public class GetCharactersCharacterIDClonesInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Clones.GetCharactersCharacterIDClonesInternalServerError, rhs: Clones.GetCharactersCharacterIDClonesInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDClonesForbidden: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Clones.GetCharactersCharacterIDClonesForbidden, rhs: Clones.GetCharactersCharacterIDClonesForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class JumpClones: NSObject, NSSecureCoding , JSONCoding {
			
			public enum GetCharactersCharacterIDClonesLocationType: String, JSONCoding, HTTPQueryable {
				case station = "station"
				case structure = "structure"
				
				public init() {
					self = .station
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCharactersCharacterIDClonesLocationType(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public class GetCharactersCharacterIDClonesJumpClones: NSObject, NSSecureCoding , JSONCoding {
				
				
				public var implants: [Int]? = nil
				public var locationID: Int64? = nil
				public var locationType: Clones.JumpClones.GetCharactersCharacterIDClonesLocationType? = nil
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					implants = try (dictionary["implants"] as? [Any])?.map {try Int(json: $0)}
					locationID = dictionary["location_id"] as? Int64
					locationType = Clones.JumpClones.GetCharactersCharacterIDClonesLocationType(rawValue: dictionary["location_type"] as? String ?? "")
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					implants = aDecoder.decodeObject(forKey: "implants") as? [Int]
					locationID = aDecoder.containsValue(forKey: "location_id") ? aDecoder.decodeInt64(forKey: "location_id") : nil
					locationType = Clones.JumpClones.GetCharactersCharacterIDClonesLocationType(rawValue: aDecoder.decodeObject(forKey: "location_type") as? String ?? "")
					
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					implants?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					hashCombine(seed: &hash, value: locationID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: locationType?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: Clones.JumpClones.GetCharactersCharacterIDClonesJumpClones, rhs: Clones.JumpClones.GetCharactersCharacterIDClonesJumpClones) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
			}
			
			public class GetCharactersCharacterIDClonesHomeLocation: NSObject, NSSecureCoding , JSONCoding {
				
				
				public var locationID: Int64? = nil
				public var locationType: Clones.JumpClones.GetCharactersCharacterIDClonesLocationType? = nil
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					locationID = dictionary["location_id"] as? Int64
					locationType = Clones.JumpClones.GetCharactersCharacterIDClonesLocationType(rawValue: dictionary["location_type"] as? String ?? "")
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					locationID = aDecoder.containsValue(forKey: "location_id") ? aDecoder.decodeInt64(forKey: "location_id") : nil
					locationType = Clones.JumpClones.GetCharactersCharacterIDClonesLocationType(rawValue: aDecoder.decodeObject(forKey: "location_type") as? String ?? "")
					
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: locationID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: locationType?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: Clones.JumpClones.GetCharactersCharacterIDClonesHomeLocation, rhs: Clones.JumpClones.GetCharactersCharacterIDClonesHomeLocation) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
			}
			
			public var homeLocation: Clones.JumpClones.GetCharactersCharacterIDClonesHomeLocation? = nil
			public var jumpClones: [Clones.JumpClones.GetCharactersCharacterIDClonesJumpClones] = []
			public var lastJumpDate: Date? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				homeLocation = try? Clones.JumpClones.GetCharactersCharacterIDClonesHomeLocation(json: dictionary["home_location"] as? [String: Any] ?? [:])
				jumpClones = try (dictionary["jump_clones"] as? [Any])?.map {try Clones.JumpClones.GetCharactersCharacterIDClonesJumpClones(json: $0)} ?? []
				lastJumpDate = DateFormatter.esiDateFormatter.date(from: dictionary["last_jump_date"] as? String ?? "")
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				homeLocation = aDecoder.decodeObject(of: Clones.JumpClones.GetCharactersCharacterIDClonesHomeLocation.self, forKey: "home_location") 
				jumpClones = aDecoder.decodeObject(of: [Clones.JumpClones.GetCharactersCharacterIDClonesJumpClones.self], forKey: "jump_clones") as? [Clones.JumpClones.GetCharactersCharacterIDClonesJumpClones] ?? []
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: homeLocation?.hashValue ?? 0)
				jumpClones.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: lastJumpDate?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Clones.JumpClones, rhs: Clones.JumpClones) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
	}
	
}
