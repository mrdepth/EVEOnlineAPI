import Foundation
import Alamofire


public extension ESI {
	public var fittings: Fittings {
		return Fittings(sessionManager: self)
	}
	
	class Fittings {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		public func createFitting(characterID: Int, fitting: Fittings.MutableFitting? = nil, completionBlock:((Result<Fittings.CreateFittingResult>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-fittings.write_fittings.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body = fitting != nil ? (try? JSONSerialization.data(withJSONObject: fitting!.json, options: [])) : nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/fittings/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Fittings.CreateFittingResult>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getFittings(characterID: Int, completionBlock:((Result<[Fittings.Fitting]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-fittings.read_fittings.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/fittings/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Fittings.Fitting]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func deleteFitting(characterID: Int, fittingID: Int, completionBlock:((Result<String>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-fittings.write_fittings.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/fittings/\(fittingID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .delete, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<String>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		@objc(ESIFittingsItem) public class Item: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var flag: Int = Int()
			public var quantity: Int = Int()
			public var typeID: Int = Int()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let flag = dictionary["flag"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.flag = flag
				guard let quantity = dictionary["quantity"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.quantity = quantity
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
				flag = aDecoder.decodeInteger(forKey: "flag")
				quantity = aDecoder.decodeInteger(forKey: "quantity")
				typeID = aDecoder.decodeInteger(forKey: "type_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(flag, forKey: "flag")
				aCoder.encode(quantity, forKey: "quantity")
				aCoder.encode(typeID, forKey: "type_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["flag"] = flag.json
				json["quantity"] = quantity.json
				json["type_id"] = typeID.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.flag.hashValue)
				hashCombine(seed: &hash, value: self.quantity.hashValue)
				hashCombine(seed: &hash, value: self.typeID.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Fittings.Item, rhs: Fittings.Item) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Fittings.Item) {
				flag = other.flag
				quantity = other.quantity
				typeID = other.typeID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Fittings.Item(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Item)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIFittingsFitting) public class Fitting: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var localizedDescription: String = String()
			public var fittingID: Int = Int()
			public var items: [Fittings.Item] = []
			public var name: String = String()
			public var shipTypeID: Int = Int()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let localizedDescription = dictionary["description"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.localizedDescription = localizedDescription
				guard let fittingID = dictionary["fitting_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.fittingID = fittingID
				items = try (dictionary["items"] as? [Any])?.map {try Fittings.Item(json: $0)} ?? []
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.name = name
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
				localizedDescription = aDecoder.decodeObject(forKey: "description") as? String ?? String()
				fittingID = aDecoder.decodeInteger(forKey: "fitting_id")
				items = aDecoder.decodeObject(of: [Fittings.Item.self], forKey: "items") as? [Fittings.Item] ?? []
				name = aDecoder.decodeObject(forKey: "name") as? String ?? String()
				shipTypeID = aDecoder.decodeInteger(forKey: "ship_type_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(localizedDescription, forKey: "description")
				aCoder.encode(fittingID, forKey: "fitting_id")
				aCoder.encode(items, forKey: "items")
				aCoder.encode(name, forKey: "name")
				aCoder.encode(shipTypeID, forKey: "ship_type_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["description"] = localizedDescription.json
				json["fitting_id"] = fittingID.json
				json["items"] = items.json
				json["name"] = name.json
				json["ship_type_id"] = shipTypeID.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.localizedDescription.hashValue)
				hashCombine(seed: &hash, value: self.fittingID.hashValue)
				self.items.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: self.name.hashValue)
				hashCombine(seed: &hash, value: self.shipTypeID.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Fittings.Fitting, rhs: Fittings.Fitting) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Fittings.Fitting) {
				localizedDescription = other.localizedDescription
				fittingID = other.fittingID
				items = other.items.flatMap { Fittings.Item($0) }
				name = other.name
				shipTypeID = other.shipTypeID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Fittings.Fitting(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Fitting)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIFittingsCreateFittingResult) public class CreateFittingResult: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var fittingID: Int = Int()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let fittingID = dictionary["fitting_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.fittingID = fittingID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				fittingID = aDecoder.decodeInteger(forKey: "fitting_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(fittingID, forKey: "fitting_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["fitting_id"] = fittingID.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.fittingID.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Fittings.CreateFittingResult, rhs: Fittings.CreateFittingResult) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Fittings.CreateFittingResult) {
				fittingID = other.fittingID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Fittings.CreateFittingResult(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? CreateFittingResult)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIFittingsMutableFitting) public class MutableFitting: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var localizedDescription: String = String()
			public var items: [Fittings.Item] = []
			public var name: String = String()
			public var shipTypeID: Int = Int()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let localizedDescription = dictionary["description"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.localizedDescription = localizedDescription
				items = try (dictionary["items"] as? [Any])?.map {try Fittings.Item(json: $0)} ?? []
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.name = name
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
				localizedDescription = aDecoder.decodeObject(forKey: "description") as? String ?? String()
				items = aDecoder.decodeObject(of: [Fittings.Item.self], forKey: "items") as? [Fittings.Item] ?? []
				name = aDecoder.decodeObject(forKey: "name") as? String ?? String()
				shipTypeID = aDecoder.decodeInteger(forKey: "ship_type_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(localizedDescription, forKey: "description")
				aCoder.encode(items, forKey: "items")
				aCoder.encode(name, forKey: "name")
				aCoder.encode(shipTypeID, forKey: "ship_type_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["description"] = localizedDescription.json
				json["items"] = items.json
				json["name"] = name.json
				json["ship_type_id"] = shipTypeID.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.localizedDescription.hashValue)
				self.items.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: self.name.hashValue)
				hashCombine(seed: &hash, value: self.shipTypeID.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Fittings.MutableFitting, rhs: Fittings.MutableFitting) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Fittings.MutableFitting) {
				localizedDescription = other.localizedDescription
				items = other.items.flatMap { Fittings.Item($0) }
				name = other.name
				shipTypeID = other.shipTypeID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Fittings.MutableFitting(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? MutableFitting)?.hashValue == hashValue
			}
			
		}
		
		
	}
	
}
