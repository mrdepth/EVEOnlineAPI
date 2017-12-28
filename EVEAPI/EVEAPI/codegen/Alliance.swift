import Foundation
import Alamofire


public extension ESI {
	public var alliance: Alliance {
		return Alliance(sessionManager: self)
	}
	
	class Alliance {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		public func listAlliancesCorporations(allianceID: Int, completionBlock:((Result<[Int]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/alliances/\(allianceID)/corporations/"
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
		
		public func listAllAlliances(completionBlock:((Result<[Int]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/alliances/"
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
		
		public func getAllianceNames(allianceIds: [Int], completionBlock:((Result<[Alliance.Name]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = allianceIds.httpQuery {
				query.append(URLQueryItem(name: "alliance_ids", value: v))
			}
			
			let url = session!.baseURL + "/v2/alliances/names/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Alliance.Name]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getAllianceIcon(allianceID: Int, completionBlock:((Result<Alliance.Icon>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/alliances/\(allianceID)/icons/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Alliance.Icon>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getAllianceInformation(allianceID: Int, completionBlock:((Result<Alliance.Information>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v3/alliances/\(allianceID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Alliance.Information>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		@objc(ESIAllianceInformation) public class Information: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var creatorCorporationID: Int = Int()
			public var creatorID: Int = Int()
			public var dateFounded: Date = Date()
			public var executorCorporationID: Int? = nil
			public var factionID: Int? = nil
			public var name: String = String()
			public var ticker: String = String()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let creatorCorporationID = dictionary["creator_corporation_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.creatorCorporationID = creatorCorporationID
				guard let creatorID = dictionary["creator_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.creatorID = creatorID
				guard let dateFounded = DateFormatter.esiDateTimeFormatter.date(from: dictionary["date_founded"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.dateFounded = dateFounded
				executorCorporationID = dictionary["executor_corporation_id"] as? Int
				factionID = dictionary["faction_id"] as? Int
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.name = name
				guard let ticker = dictionary["ticker"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.ticker = ticker
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				creatorCorporationID = aDecoder.decodeInteger(forKey: "creator_corporation_id")
				creatorID = aDecoder.decodeInteger(forKey: "creator_id")
				dateFounded = aDecoder.decodeObject(forKey: "date_founded") as? Date ?? Date()
				executorCorporationID = aDecoder.containsValue(forKey: "executor_corporation_id") ? aDecoder.decodeInteger(forKey: "executor_corporation_id") : nil
				factionID = aDecoder.containsValue(forKey: "faction_id") ? aDecoder.decodeInteger(forKey: "faction_id") : nil
				name = aDecoder.decodeObject(forKey: "name") as? String ?? String()
				ticker = aDecoder.decodeObject(forKey: "ticker") as? String ?? String()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(creatorCorporationID, forKey: "creator_corporation_id")
				aCoder.encode(creatorID, forKey: "creator_id")
				aCoder.encode(dateFounded, forKey: "date_founded")
				if let v = executorCorporationID {
					aCoder.encode(v, forKey: "executor_corporation_id")
				}
				if let v = factionID {
					aCoder.encode(v, forKey: "faction_id")
				}
				aCoder.encode(name, forKey: "name")
				aCoder.encode(ticker, forKey: "ticker")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["creator_corporation_id"] = creatorCorporationID.json
				json["creator_id"] = creatorID.json
				json["date_founded"] = dateFounded.json
				if let v = executorCorporationID?.json {
					json["executor_corporation_id"] = v
				}
				if let v = factionID?.json {
					json["faction_id"] = v
				}
				json["name"] = name.json
				json["ticker"] = ticker.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.creatorCorporationID.hashValue)
				hashCombine(seed: &hash, value: self.creatorID.hashValue)
				hashCombine(seed: &hash, value: self.dateFounded.hashValue)
				hashCombine(seed: &hash, value: self.executorCorporationID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.factionID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.name.hashValue)
				hashCombine(seed: &hash, value: self.ticker.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Alliance.Information, rhs: Alliance.Information) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Alliance.Information) {
				creatorCorporationID = other.creatorCorporationID
				creatorID = other.creatorID
				dateFounded = other.dateFounded
				executorCorporationID = other.executorCorporationID
				factionID = other.factionID
				name = other.name
				ticker = other.ticker
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Alliance.Information(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Information)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIAllianceIcon) public class Icon: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var px128x128: String? = nil
			public var px64x64: String? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				px128x128 = dictionary["px128x128"] as? String
				px64x64 = dictionary["px64x64"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				px128x128 = aDecoder.decodeObject(forKey: "px128x128") as? String
				px64x64 = aDecoder.decodeObject(forKey: "px64x64") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = px128x128 {
					aCoder.encode(v, forKey: "px128x128")
				}
				if let v = px64x64 {
					aCoder.encode(v, forKey: "px64x64")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = px128x128?.json {
					json["px128x128"] = v
				}
				if let v = px64x64?.json {
					json["px64x64"] = v
				}
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.px128x128?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.px64x64?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Alliance.Icon, rhs: Alliance.Icon) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Alliance.Icon) {
				px128x128 = other.px128x128
				px64x64 = other.px64x64
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Alliance.Icon(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Icon)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIAllianceName) public class Name: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var allianceID: Int = Int()
			public var allianceName: String = String()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let allianceID = dictionary["alliance_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.allianceID = allianceID
				guard let allianceName = dictionary["alliance_name"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.allianceName = allianceName
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				allianceID = aDecoder.decodeInteger(forKey: "alliance_id")
				allianceName = aDecoder.decodeObject(forKey: "alliance_name") as? String ?? String()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(allianceID, forKey: "alliance_id")
				aCoder.encode(allianceName, forKey: "alliance_name")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["alliance_id"] = allianceID.json
				json["alliance_name"] = allianceName.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.allianceID.hashValue)
				hashCombine(seed: &hash, value: self.allianceName.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Alliance.Name, rhs: Alliance.Name) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Alliance.Name) {
				allianceID = other.allianceID
				allianceName = other.allianceName
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Alliance.Name(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Name)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIAllianceGetAlliancesAllianceIDIconsNotFound) public class GetAlliancesAllianceIDIconsNotFound: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.error?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Alliance.GetAlliancesAllianceIDIconsNotFound, rhs: Alliance.GetAlliancesAllianceIDIconsNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Alliance.GetAlliancesAllianceIDIconsNotFound) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Alliance.GetAlliancesAllianceIDIconsNotFound(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetAlliancesAllianceIDIconsNotFound)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIAllianceGetAlliancesAllianceIDNotFound) public class GetAlliancesAllianceIDNotFound: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.error?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Alliance.GetAlliancesAllianceIDNotFound, rhs: Alliance.GetAlliancesAllianceIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Alliance.GetAlliancesAllianceIDNotFound) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Alliance.GetAlliancesAllianceIDNotFound(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetAlliancesAllianceIDNotFound)?.hashValue == hashValue
			}
			
		}
		
		
	}
	
}
