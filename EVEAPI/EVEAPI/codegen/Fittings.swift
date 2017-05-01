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
		
		public func createFitting(characterID: Int, fitting: Fittings.PostFitting? = nil, completionBlock:((Result<Fittings.PostFittingResult>) -> Void)?) {
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
			}.validateESI().responseESI { (response: DataResponse<Fittings.PostFittingResult>) in
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
		
		
		public class Fitting: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class GetCharactersCharacterIDFittingsItems: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var flag: Int = Int()
				public var quantity: Int = Int()
				public var typeID: Int = Int()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let flag = dictionary["flag"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.flag = flag
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: flag.hashValue)
					hashCombine(seed: &hash, value: quantity.hashValue)
					hashCombine(seed: &hash, value: typeID.hashValue)
					return hash
				}
				
				public static func ==(lhs: Fittings.Fitting.GetCharactersCharacterIDFittingsItems, rhs: Fittings.Fitting.GetCharactersCharacterIDFittingsItems) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Fittings.Fitting.GetCharactersCharacterIDFittingsItems) {
					flag = other.flag
					quantity = other.quantity
					typeID = other.typeID
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Fittings.Fitting.GetCharactersCharacterIDFittingsItems(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetCharactersCharacterIDFittingsItems)?.hashValue == hashValue
				}
				
			}
			
			public var localizedDescription: String = String()
			public var fittingID: Int = Int()
			public var items: [Fittings.Fitting.GetCharactersCharacterIDFittingsItems] = []
			public var name: String = String()
			public var shipTypeID: Int = Int()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let localizedDescription = dictionary["description"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.localizedDescription = localizedDescription
				guard let fittingID = dictionary["fitting_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.fittingID = fittingID
				items = try (dictionary["items"] as? [Any])?.map {try Fittings.Fitting.GetCharactersCharacterIDFittingsItems(json: $0)} ?? []
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.name = name
				guard let shipTypeID = dictionary["ship_type_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.shipTypeID = shipTypeID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				localizedDescription = aDecoder.decodeObject(forKey: "description") as? String ?? String()
				fittingID = aDecoder.decodeInteger(forKey: "fitting_id")
				items = aDecoder.decodeObject(of: [Fittings.Fitting.GetCharactersCharacterIDFittingsItems.self], forKey: "items") as? [Fittings.Fitting.GetCharactersCharacterIDFittingsItems] ?? []
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: localizedDescription.hashValue)
				hashCombine(seed: &hash, value: fittingID.hashValue)
				items.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: name.hashValue)
				hashCombine(seed: &hash, value: shipTypeID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Fittings.Fitting, rhs: Fittings.Fitting) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Fittings.Fitting) {
				localizedDescription = other.localizedDescription
				fittingID = other.fittingID
				items = other.items.flatMap { Fittings.Fitting.GetCharactersCharacterIDFittingsItems($0) }
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
		
		
		public class GetCharactersCharacterIDFittingsForbidden: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			public static func ==(lhs: Fittings.GetCharactersCharacterIDFittingsForbidden, rhs: Fittings.GetCharactersCharacterIDFittingsForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Fittings.GetCharactersCharacterIDFittingsForbidden) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Fittings.GetCharactersCharacterIDFittingsForbidden(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCharactersCharacterIDFittingsForbidden)?.hashValue == hashValue
			}
			
		}
		
		
		public class DeleteCharactersCharacterIDFittingsFittingIDInternalServerError: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			public static func ==(lhs: Fittings.DeleteCharactersCharacterIDFittingsFittingIDInternalServerError, rhs: Fittings.DeleteCharactersCharacterIDFittingsFittingIDInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Fittings.DeleteCharactersCharacterIDFittingsFittingIDInternalServerError) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Fittings.DeleteCharactersCharacterIDFittingsFittingIDInternalServerError(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? DeleteCharactersCharacterIDFittingsFittingIDInternalServerError)?.hashValue == hashValue
			}
			
		}
		
		
		public class PostFitting: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class PostCharactersCharacterIDFittingsItems: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var flag: Int = Int()
				public var quantity: Int = Int()
				public var typeID: Int = Int()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let flag = dictionary["flag"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.flag = flag
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: flag.hashValue)
					hashCombine(seed: &hash, value: quantity.hashValue)
					hashCombine(seed: &hash, value: typeID.hashValue)
					return hash
				}
				
				public static func ==(lhs: Fittings.PostFitting.PostCharactersCharacterIDFittingsItems, rhs: Fittings.PostFitting.PostCharactersCharacterIDFittingsItems) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Fittings.PostFitting.PostCharactersCharacterIDFittingsItems) {
					flag = other.flag
					quantity = other.quantity
					typeID = other.typeID
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Fittings.PostFitting.PostCharactersCharacterIDFittingsItems(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? PostCharactersCharacterIDFittingsItems)?.hashValue == hashValue
				}
				
			}
			
			public var localizedDescription: String = String()
			public var items: [Fittings.PostFitting.PostCharactersCharacterIDFittingsItems] = []
			public var name: String = String()
			public var shipTypeID: Int = Int()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let localizedDescription = dictionary["description"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.localizedDescription = localizedDescription
				items = try (dictionary["items"] as? [Any])?.map {try Fittings.PostFitting.PostCharactersCharacterIDFittingsItems(json: $0)} ?? []
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.name = name
				guard let shipTypeID = dictionary["ship_type_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.shipTypeID = shipTypeID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				localizedDescription = aDecoder.decodeObject(forKey: "description") as? String ?? String()
				items = aDecoder.decodeObject(of: [Fittings.PostFitting.PostCharactersCharacterIDFittingsItems.self], forKey: "items") as? [Fittings.PostFitting.PostCharactersCharacterIDFittingsItems] ?? []
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: localizedDescription.hashValue)
				items.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: name.hashValue)
				hashCombine(seed: &hash, value: shipTypeID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Fittings.PostFitting, rhs: Fittings.PostFitting) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Fittings.PostFitting) {
				localizedDescription = other.localizedDescription
				items = other.items.flatMap { Fittings.PostFitting.PostCharactersCharacterIDFittingsItems($0) }
				name = other.name
				shipTypeID = other.shipTypeID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Fittings.PostFitting(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? PostFitting)?.hashValue == hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDFittingsInternalServerError: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			public static func ==(lhs: Fittings.GetCharactersCharacterIDFittingsInternalServerError, rhs: Fittings.GetCharactersCharacterIDFittingsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Fittings.GetCharactersCharacterIDFittingsInternalServerError) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Fittings.GetCharactersCharacterIDFittingsInternalServerError(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCharactersCharacterIDFittingsInternalServerError)?.hashValue == hashValue
			}
			
		}
		
		
		public class DeleteCharactersCharacterIDFittingsFittingIDForbidden: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			public static func ==(lhs: Fittings.DeleteCharactersCharacterIDFittingsFittingIDForbidden, rhs: Fittings.DeleteCharactersCharacterIDFittingsFittingIDForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Fittings.DeleteCharactersCharacterIDFittingsFittingIDForbidden) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Fittings.DeleteCharactersCharacterIDFittingsFittingIDForbidden(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? DeleteCharactersCharacterIDFittingsFittingIDForbidden)?.hashValue == hashValue
			}
			
		}
		
		
		public class PostCharactersCharacterIDFittingsInternalServerError: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			public static func ==(lhs: Fittings.PostCharactersCharacterIDFittingsInternalServerError, rhs: Fittings.PostCharactersCharacterIDFittingsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Fittings.PostCharactersCharacterIDFittingsInternalServerError) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Fittings.PostCharactersCharacterIDFittingsInternalServerError(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? PostCharactersCharacterIDFittingsInternalServerError)?.hashValue == hashValue
			}
			
		}
		
		
		public class PostCharactersCharacterIDFittingsForbidden: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			public static func ==(lhs: Fittings.PostCharactersCharacterIDFittingsForbidden, rhs: Fittings.PostCharactersCharacterIDFittingsForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Fittings.PostCharactersCharacterIDFittingsForbidden) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Fittings.PostCharactersCharacterIDFittingsForbidden(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? PostCharactersCharacterIDFittingsForbidden)?.hashValue == hashValue
			}
			
		}
		
		
		public class PostFittingResult: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var fittingID: Int = Int()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let fittingID = dictionary["fitting_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.fittingID = fittingID
				
				super.init()
			}
			
			override public init() {
				super.init()
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: fittingID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Fittings.PostFittingResult, rhs: Fittings.PostFittingResult) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Fittings.PostFittingResult) {
				fittingID = other.fittingID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Fittings.PostFittingResult(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? PostFittingResult)?.hashValue == hashValue
			}
			
		}
		
		
	}
	
}
