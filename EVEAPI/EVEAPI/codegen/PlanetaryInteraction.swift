import Foundation
import Alamofire


public extension ESI {
	public var planetaryInteraction: PlanetaryInteraction {
		return PlanetaryInteraction(sessionManager: self)
	}
	
	class PlanetaryInteraction {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		public func getColonies(characterID: Int, completionBlock:((Result<[PlanetaryInteraction.Colony]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-planets.manage_planets.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/planets/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[PlanetaryInteraction.Colony]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getSchematicInformation(schematicID: Int, completionBlock:((Result<PlanetaryInteraction.SchematicInformation>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/universe/schematics/\(schematicID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<PlanetaryInteraction.SchematicInformation>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getColonyLayout(characterID: Int, planetID: Int, completionBlock:((Result<PlanetaryInteraction.ColonyLayout>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-planets.manage_planets.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/planets/\(planetID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<PlanetaryInteraction.ColonyLayout>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		public class Colony: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public enum PlanetType: String, JSONCoding, HTTPQueryable {
				case barren = "barren"
				case gas = "gas"
				case ice = "ice"
				case lava = "lava"
				case oceanic = "oceanic"
				case plasma = "plasma"
				case storm = "storm"
				case temperate = "temperate"
				
				public init() {
					self = .temperate
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = PlanetType(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var lastUpdate: Date = Date()
			public var numPins: Int = Int()
			public var ownerID: Int = Int()
			public var planetID: Int = Int()
			public var planetType: PlanetaryInteraction.Colony.PlanetType = PlanetaryInteraction.Colony.PlanetType()
			public var solarSystemID: Int = Int()
			public var upgradeLevel: Int = Int()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let lastUpdate = DateFormatter.esiDateTimeFormatter.date(from: dictionary["last_update"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.lastUpdate = lastUpdate
				guard let numPins = dictionary["num_pins"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.numPins = numPins
				guard let ownerID = dictionary["owner_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.ownerID = ownerID
				guard let planetID = dictionary["planet_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.planetID = planetID
				guard let planetType = PlanetaryInteraction.Colony.PlanetType(rawValue: dictionary["planet_type"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.planetType = planetType
				guard let solarSystemID = dictionary["solar_system_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.solarSystemID = solarSystemID
				guard let upgradeLevel = dictionary["upgrade_level"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.upgradeLevel = upgradeLevel
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				lastUpdate = aDecoder.decodeObject(forKey: "last_update") as? Date ?? Date()
				numPins = aDecoder.decodeInteger(forKey: "num_pins")
				ownerID = aDecoder.decodeInteger(forKey: "owner_id")
				planetID = aDecoder.decodeInteger(forKey: "planet_id")
				planetType = PlanetaryInteraction.Colony.PlanetType(rawValue: aDecoder.decodeObject(forKey: "planet_type") as? String ?? "") ?? PlanetaryInteraction.Colony.PlanetType()
				solarSystemID = aDecoder.decodeInteger(forKey: "solar_system_id")
				upgradeLevel = aDecoder.decodeInteger(forKey: "upgrade_level")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(lastUpdate, forKey: "last_update")
				aCoder.encode(numPins, forKey: "num_pins")
				aCoder.encode(ownerID, forKey: "owner_id")
				aCoder.encode(planetID, forKey: "planet_id")
				aCoder.encode(planetType.rawValue, forKey: "planet_type")
				aCoder.encode(solarSystemID, forKey: "solar_system_id")
				aCoder.encode(upgradeLevel, forKey: "upgrade_level")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["last_update"] = lastUpdate.json
				json["num_pins"] = numPins.json
				json["owner_id"] = ownerID.json
				json["planet_id"] = planetID.json
				json["planet_type"] = planetType.json
				json["solar_system_id"] = solarSystemID.json
				json["upgrade_level"] = upgradeLevel.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.lastUpdate.hashValue)
				hashCombine(seed: &hash, value: self.numPins.hashValue)
				hashCombine(seed: &hash, value: self.ownerID.hashValue)
				hashCombine(seed: &hash, value: self.planetID.hashValue)
				hashCombine(seed: &hash, value: self.planetType.hashValue)
				hashCombine(seed: &hash, value: self.solarSystemID.hashValue)
				hashCombine(seed: &hash, value: self.upgradeLevel.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: PlanetaryInteraction.Colony, rhs: PlanetaryInteraction.Colony) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: PlanetaryInteraction.Colony) {
				lastUpdate = other.lastUpdate
				numPins = other.numPins
				ownerID = other.ownerID
				planetID = other.planetID
				planetType = other.planetType
				solarSystemID = other.solarSystemID
				upgradeLevel = other.upgradeLevel
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return PlanetaryInteraction.Colony(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Colony)?.hashValue == hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDPlanetsPlanetIDNotFound: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.error?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: PlanetaryInteraction.GetCharactersCharacterIDPlanetsPlanetIDNotFound, rhs: PlanetaryInteraction.GetCharactersCharacterIDPlanetsPlanetIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: PlanetaryInteraction.GetCharactersCharacterIDPlanetsPlanetIDNotFound) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return PlanetaryInteraction.GetCharactersCharacterIDPlanetsPlanetIDNotFound(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCharactersCharacterIDPlanetsPlanetIDNotFound)?.hashValue == hashValue
			}
			
		}
		
		
		public class GetUniverseSchematicsSchematicIDNotFound: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.error?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: PlanetaryInteraction.GetUniverseSchematicsSchematicIDNotFound, rhs: PlanetaryInteraction.GetUniverseSchematicsSchematicIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: PlanetaryInteraction.GetUniverseSchematicsSchematicIDNotFound) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return PlanetaryInteraction.GetUniverseSchematicsSchematicIDNotFound(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetUniverseSchematicsSchematicIDNotFound)?.hashValue == hashValue
			}
			
		}
		
		
		public class ColonyLayout: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class Pin: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				public class Contents: NSObject, NSSecureCoding, NSCopying, JSONCoding {
					
					
					public var amount: Int64 = Int64()
					public var typeID: Int = Int()
					
					public static var supportsSecureCoding: Bool {
						return true
					}
					
					public required init(json: Any) throws {
						guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
						
						guard let amount = dictionary["amount"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
						self.amount = amount
						guard let typeID = dictionary["type_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
						self.typeID = typeID
						
						super.init()
					}
					
					override public init() {
						super.init()
					}
					
					public required init?(coder aDecoder: NSCoder) {
						amount = aDecoder.decodeInt64(forKey: "amount")
						typeID = aDecoder.decodeInteger(forKey: "type_id")
						
						super.init()
					}
					
					public func encode(with aCoder: NSCoder) {
						aCoder.encode(amount, forKey: "amount")
						aCoder.encode(typeID, forKey: "type_id")
					}
					
					public var json: Any {
						var json = [String: Any]()
						json["amount"] = amount.json
						json["type_id"] = typeID.json
						return json
					}
					
					private lazy var _hashValue: Int = {
						var hash: Int = 0
						hashCombine(seed: &hash, value: self.amount.hashValue)
						hashCombine(seed: &hash, value: self.typeID.hashValue)
						return hash
					}()
					
					override public var hashValue: Int {
						return _hashValue
					}
					
					public static func ==(lhs: PlanetaryInteraction.ColonyLayout.Pin.Contents, rhs: PlanetaryInteraction.ColonyLayout.Pin.Contents) -> Bool {
						return lhs.hashValue == rhs.hashValue
					}
					
					init(_ other: PlanetaryInteraction.ColonyLayout.Pin.Contents) {
						amount = other.amount
						typeID = other.typeID
					}
					
					public func copy(with zone: NSZone? = nil) -> Any {
						return PlanetaryInteraction.ColonyLayout.Pin.Contents(self)
					}
					
					
					public override func isEqual(_ object: Any?) -> Bool {
						return (object as? Contents)?.hashValue == hashValue
					}
					
				}
				
				public class ExtractorDetails: NSObject, NSSecureCoding, NSCopying, JSONCoding {
					
					public class Head: NSObject, NSSecureCoding, NSCopying, JSONCoding {
						
						
						public var headID: Int = Int()
						public var latitude: Float = Float()
						public var longitude: Float = Float()
						
						public static var supportsSecureCoding: Bool {
							return true
						}
						
						public required init(json: Any) throws {
							guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
							
							guard let headID = dictionary["head_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
							self.headID = headID
							guard let latitude = dictionary["latitude"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
							self.latitude = latitude
							guard let longitude = dictionary["longitude"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
							self.longitude = longitude
							
							super.init()
						}
						
						override public init() {
							super.init()
						}
						
						public required init?(coder aDecoder: NSCoder) {
							headID = aDecoder.decodeInteger(forKey: "head_id")
							latitude = aDecoder.decodeFloat(forKey: "latitude")
							longitude = aDecoder.decodeFloat(forKey: "longitude")
							
							super.init()
						}
						
						public func encode(with aCoder: NSCoder) {
							aCoder.encode(headID, forKey: "head_id")
							aCoder.encode(latitude, forKey: "latitude")
							aCoder.encode(longitude, forKey: "longitude")
						}
						
						public var json: Any {
							var json = [String: Any]()
							json["head_id"] = headID.json
							json["latitude"] = latitude.json
							json["longitude"] = longitude.json
							return json
						}
						
						private lazy var _hashValue: Int = {
							var hash: Int = 0
							hashCombine(seed: &hash, value: self.headID.hashValue)
							hashCombine(seed: &hash, value: self.latitude.hashValue)
							hashCombine(seed: &hash, value: self.longitude.hashValue)
							return hash
						}()
						
						override public var hashValue: Int {
							return _hashValue
						}
						
						public static func ==(lhs: PlanetaryInteraction.ColonyLayout.Pin.ExtractorDetails.Head, rhs: PlanetaryInteraction.ColonyLayout.Pin.ExtractorDetails.Head) -> Bool {
							return lhs.hashValue == rhs.hashValue
						}
						
						init(_ other: PlanetaryInteraction.ColonyLayout.Pin.ExtractorDetails.Head) {
							headID = other.headID
							latitude = other.latitude
							longitude = other.longitude
						}
						
						public func copy(with zone: NSZone? = nil) -> Any {
							return PlanetaryInteraction.ColonyLayout.Pin.ExtractorDetails.Head(self)
						}
						
						
						public override func isEqual(_ object: Any?) -> Bool {
							return (object as? Head)?.hashValue == hashValue
						}
						
					}
					
					public var cycleTime: Int? = nil
					public var headRadius: Float? = nil
					public var heads: [PlanetaryInteraction.ColonyLayout.Pin.ExtractorDetails.Head] = []
					public var productTypeID: Int? = nil
					public var qtyPerCycle: Int? = nil
					
					public static var supportsSecureCoding: Bool {
						return true
					}
					
					public required init(json: Any) throws {
						guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
						
						cycleTime = dictionary["cycle_time"] as? Int
						headRadius = dictionary["head_radius"] as? Float
						heads = try (dictionary["heads"] as? [Any])?.map {try PlanetaryInteraction.ColonyLayout.Pin.ExtractorDetails.Head(json: $0)} ?? []
						productTypeID = dictionary["product_type_id"] as? Int
						qtyPerCycle = dictionary["qty_per_cycle"] as? Int
						
						super.init()
					}
					
					override public init() {
						super.init()
					}
					
					public required init?(coder aDecoder: NSCoder) {
						cycleTime = aDecoder.containsValue(forKey: "cycle_time") ? aDecoder.decodeInteger(forKey: "cycle_time") : nil
						headRadius = aDecoder.containsValue(forKey: "head_radius") ? aDecoder.decodeFloat(forKey: "head_radius") : nil
						heads = aDecoder.decodeObject(of: [PlanetaryInteraction.ColonyLayout.Pin.ExtractorDetails.Head.self], forKey: "heads") as? [PlanetaryInteraction.ColonyLayout.Pin.ExtractorDetails.Head] ?? []
						productTypeID = aDecoder.containsValue(forKey: "product_type_id") ? aDecoder.decodeInteger(forKey: "product_type_id") : nil
						qtyPerCycle = aDecoder.containsValue(forKey: "qty_per_cycle") ? aDecoder.decodeInteger(forKey: "qty_per_cycle") : nil
						
						super.init()
					}
					
					public func encode(with aCoder: NSCoder) {
						if let v = cycleTime {
							aCoder.encode(v, forKey: "cycle_time")
						}
						if let v = headRadius {
							aCoder.encode(v, forKey: "head_radius")
						}
						aCoder.encode(heads, forKey: "heads")
						if let v = productTypeID {
							aCoder.encode(v, forKey: "product_type_id")
						}
						if let v = qtyPerCycle {
							aCoder.encode(v, forKey: "qty_per_cycle")
						}
					}
					
					public var json: Any {
						var json = [String: Any]()
						if let v = cycleTime?.json {
							json["cycle_time"] = v
						}
						if let v = headRadius?.json {
							json["head_radius"] = v
						}
						json["heads"] = heads.json
						if let v = productTypeID?.json {
							json["product_type_id"] = v
						}
						if let v = qtyPerCycle?.json {
							json["qty_per_cycle"] = v
						}
						return json
					}
					
					private lazy var _hashValue: Int = {
						var hash: Int = 0
						hashCombine(seed: &hash, value: self.cycleTime?.hashValue ?? 0)
						hashCombine(seed: &hash, value: self.headRadius?.hashValue ?? 0)
						self.heads.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
						hashCombine(seed: &hash, value: self.productTypeID?.hashValue ?? 0)
						hashCombine(seed: &hash, value: self.qtyPerCycle?.hashValue ?? 0)
						return hash
					}()
					
					override public var hashValue: Int {
						return _hashValue
					}
					
					public static func ==(lhs: PlanetaryInteraction.ColonyLayout.Pin.ExtractorDetails, rhs: PlanetaryInteraction.ColonyLayout.Pin.ExtractorDetails) -> Bool {
						return lhs.hashValue == rhs.hashValue
					}
					
					init(_ other: PlanetaryInteraction.ColonyLayout.Pin.ExtractorDetails) {
						cycleTime = other.cycleTime
						headRadius = other.headRadius
						heads = other.heads.flatMap { PlanetaryInteraction.ColonyLayout.Pin.ExtractorDetails.Head($0) }
						productTypeID = other.productTypeID
						qtyPerCycle = other.qtyPerCycle
					}
					
					public func copy(with zone: NSZone? = nil) -> Any {
						return PlanetaryInteraction.ColonyLayout.Pin.ExtractorDetails(self)
					}
					
					
					public override func isEqual(_ object: Any?) -> Bool {
						return (object as? ExtractorDetails)?.hashValue == hashValue
					}
					
				}
				
				public class FactoryDetails: NSObject, NSSecureCoding, NSCopying, JSONCoding {
					
					
					public var schematicID: Int = Int()
					
					public static var supportsSecureCoding: Bool {
						return true
					}
					
					public required init(json: Any) throws {
						guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
						
						guard let schematicID = dictionary["schematic_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
						self.schematicID = schematicID
						
						super.init()
					}
					
					override public init() {
						super.init()
					}
					
					public required init?(coder aDecoder: NSCoder) {
						schematicID = aDecoder.decodeInteger(forKey: "schematic_id")
						
						super.init()
					}
					
					public func encode(with aCoder: NSCoder) {
						aCoder.encode(schematicID, forKey: "schematic_id")
					}
					
					public var json: Any {
						var json = [String: Any]()
						json["schematic_id"] = schematicID.json
						return json
					}
					
					private lazy var _hashValue: Int = {
						var hash: Int = 0
						hashCombine(seed: &hash, value: self.schematicID.hashValue)
						return hash
					}()
					
					override public var hashValue: Int {
						return _hashValue
					}
					
					public static func ==(lhs: PlanetaryInteraction.ColonyLayout.Pin.FactoryDetails, rhs: PlanetaryInteraction.ColonyLayout.Pin.FactoryDetails) -> Bool {
						return lhs.hashValue == rhs.hashValue
					}
					
					init(_ other: PlanetaryInteraction.ColonyLayout.Pin.FactoryDetails) {
						schematicID = other.schematicID
					}
					
					public func copy(with zone: NSZone? = nil) -> Any {
						return PlanetaryInteraction.ColonyLayout.Pin.FactoryDetails(self)
					}
					
					
					public override func isEqual(_ object: Any?) -> Bool {
						return (object as? FactoryDetails)?.hashValue == hashValue
					}
					
				}
				
				public var contents: [PlanetaryInteraction.ColonyLayout.Pin.Contents]? = nil
				public var expiryTime: Date? = nil
				public var extractorDetails: PlanetaryInteraction.ColonyLayout.Pin.ExtractorDetails? = nil
				public var factoryDetails: PlanetaryInteraction.ColonyLayout.Pin.FactoryDetails? = nil
				public var installTime: Date? = nil
				public var lastCycleStart: Date? = nil
				public var latitude: Float = Float()
				public var longitude: Float = Float()
				public var pinID: Int64 = Int64()
				public var schematicID: Int? = nil
				public var typeID: Int = Int()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					contents = try (dictionary["contents"] as? [Any])?.map {try PlanetaryInteraction.ColonyLayout.Pin.Contents(json: $0)}
					expiryTime = DateFormatter.esiDateTimeFormatter.date(from: dictionary["expiry_time"] as? String ?? "")
					extractorDetails = try? PlanetaryInteraction.ColonyLayout.Pin.ExtractorDetails(json: dictionary["extractor_details"] as? [String: Any] ?? [:])
					factoryDetails = try? PlanetaryInteraction.ColonyLayout.Pin.FactoryDetails(json: dictionary["factory_details"] as? [String: Any] ?? [:])
					installTime = DateFormatter.esiDateTimeFormatter.date(from: dictionary["install_time"] as? String ?? "")
					lastCycleStart = DateFormatter.esiDateTimeFormatter.date(from: dictionary["last_cycle_start"] as? String ?? "")
					guard let latitude = dictionary["latitude"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.latitude = latitude
					guard let longitude = dictionary["longitude"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.longitude = longitude
					guard let pinID = dictionary["pin_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.pinID = pinID
					schematicID = dictionary["schematic_id"] as? Int
					guard let typeID = dictionary["type_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.typeID = typeID
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					contents = aDecoder.decodeObject(of: [PlanetaryInteraction.ColonyLayout.Pin.Contents.self], forKey: "contents") as? [PlanetaryInteraction.ColonyLayout.Pin.Contents]
					expiryTime = aDecoder.decodeObject(forKey: "expiry_time") as? Date
					extractorDetails = aDecoder.decodeObject(of: PlanetaryInteraction.ColonyLayout.Pin.ExtractorDetails.self, forKey: "extractor_details") 
					factoryDetails = aDecoder.decodeObject(of: PlanetaryInteraction.ColonyLayout.Pin.FactoryDetails.self, forKey: "factory_details") 
					installTime = aDecoder.decodeObject(forKey: "install_time") as? Date
					lastCycleStart = aDecoder.decodeObject(forKey: "last_cycle_start") as? Date
					latitude = aDecoder.decodeFloat(forKey: "latitude")
					longitude = aDecoder.decodeFloat(forKey: "longitude")
					pinID = aDecoder.decodeInt64(forKey: "pin_id")
					schematicID = aDecoder.containsValue(forKey: "schematic_id") ? aDecoder.decodeInteger(forKey: "schematic_id") : nil
					typeID = aDecoder.decodeInteger(forKey: "type_id")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					if let v = contents {
						aCoder.encode(v, forKey: "contents")
					}
					if let v = expiryTime {
						aCoder.encode(v, forKey: "expiry_time")
					}
					if let v = extractorDetails {
						aCoder.encode(v, forKey: "extractor_details")
					}
					if let v = factoryDetails {
						aCoder.encode(v, forKey: "factory_details")
					}
					if let v = installTime {
						aCoder.encode(v, forKey: "install_time")
					}
					if let v = lastCycleStart {
						aCoder.encode(v, forKey: "last_cycle_start")
					}
					aCoder.encode(latitude, forKey: "latitude")
					aCoder.encode(longitude, forKey: "longitude")
					aCoder.encode(pinID, forKey: "pin_id")
					if let v = schematicID {
						aCoder.encode(v, forKey: "schematic_id")
					}
					aCoder.encode(typeID, forKey: "type_id")
				}
				
				public var json: Any {
					var json = [String: Any]()
					if let v = contents?.json {
						json["contents"] = v
					}
					if let v = expiryTime?.json {
						json["expiry_time"] = v
					}
					if let v = extractorDetails?.json {
						json["extractor_details"] = v
					}
					if let v = factoryDetails?.json {
						json["factory_details"] = v
					}
					if let v = installTime?.json {
						json["install_time"] = v
					}
					if let v = lastCycleStart?.json {
						json["last_cycle_start"] = v
					}
					json["latitude"] = latitude.json
					json["longitude"] = longitude.json
					json["pin_id"] = pinID.json
					if let v = schematicID?.json {
						json["schematic_id"] = v
					}
					json["type_id"] = typeID.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					self.contents?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					hashCombine(seed: &hash, value: self.expiryTime?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.extractorDetails?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.factoryDetails?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.installTime?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.lastCycleStart?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.latitude.hashValue)
					hashCombine(seed: &hash, value: self.longitude.hashValue)
					hashCombine(seed: &hash, value: self.pinID.hashValue)
					hashCombine(seed: &hash, value: self.schematicID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.typeID.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: PlanetaryInteraction.ColonyLayout.Pin, rhs: PlanetaryInteraction.ColonyLayout.Pin) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: PlanetaryInteraction.ColonyLayout.Pin) {
					contents = other.contents?.flatMap { PlanetaryInteraction.ColonyLayout.Pin.Contents($0) }
					expiryTime = other.expiryTime
					extractorDetails = other.extractorDetails != nil ? PlanetaryInteraction.ColonyLayout.Pin.ExtractorDetails(other.extractorDetails!) : nil
					factoryDetails = other.factoryDetails != nil ? PlanetaryInteraction.ColonyLayout.Pin.FactoryDetails(other.factoryDetails!) : nil
					installTime = other.installTime
					lastCycleStart = other.lastCycleStart
					latitude = other.latitude
					longitude = other.longitude
					pinID = other.pinID
					schematicID = other.schematicID
					typeID = other.typeID
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return PlanetaryInteraction.ColonyLayout.Pin(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? Pin)?.hashValue == hashValue
				}
				
			}
			
			public class Link: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var destinationPinID: Int64 = Int64()
				public var linkLevel: Int = Int()
				public var sourcePinID: Int64 = Int64()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let destinationPinID = dictionary["destination_pin_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.destinationPinID = destinationPinID
					guard let linkLevel = dictionary["link_level"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.linkLevel = linkLevel
					guard let sourcePinID = dictionary["source_pin_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.sourcePinID = sourcePinID
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					destinationPinID = aDecoder.decodeInt64(forKey: "destination_pin_id")
					linkLevel = aDecoder.decodeInteger(forKey: "link_level")
					sourcePinID = aDecoder.decodeInt64(forKey: "source_pin_id")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(destinationPinID, forKey: "destination_pin_id")
					aCoder.encode(linkLevel, forKey: "link_level")
					aCoder.encode(sourcePinID, forKey: "source_pin_id")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["destination_pin_id"] = destinationPinID.json
					json["link_level"] = linkLevel.json
					json["source_pin_id"] = sourcePinID.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.destinationPinID.hashValue)
					hashCombine(seed: &hash, value: self.linkLevel.hashValue)
					hashCombine(seed: &hash, value: self.sourcePinID.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: PlanetaryInteraction.ColonyLayout.Link, rhs: PlanetaryInteraction.ColonyLayout.Link) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: PlanetaryInteraction.ColonyLayout.Link) {
					destinationPinID = other.destinationPinID
					linkLevel = other.linkLevel
					sourcePinID = other.sourcePinID
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return PlanetaryInteraction.ColonyLayout.Link(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? Link)?.hashValue == hashValue
				}
				
			}
			
			public class Route: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var contentTypeID: Int = Int()
				public var destinationPinID: Int64 = Int64()
				public var quantity: Float = Float()
				public var routeID: Int64 = Int64()
				public var sourcePinID: Int64 = Int64()
				public var waypoints: [Int64]? = nil
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let contentTypeID = dictionary["content_type_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.contentTypeID = contentTypeID
					guard let destinationPinID = dictionary["destination_pin_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.destinationPinID = destinationPinID
					guard let quantity = dictionary["quantity"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.quantity = quantity
					guard let routeID = dictionary["route_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.routeID = routeID
					guard let sourcePinID = dictionary["source_pin_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.sourcePinID = sourcePinID
					waypoints = try (dictionary["waypoints"] as? [Any])?.map {try Int64(json: $0)}
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					contentTypeID = aDecoder.decodeInteger(forKey: "content_type_id")
					destinationPinID = aDecoder.decodeInt64(forKey: "destination_pin_id")
					quantity = aDecoder.decodeFloat(forKey: "quantity")
					routeID = aDecoder.decodeInt64(forKey: "route_id")
					sourcePinID = aDecoder.decodeInt64(forKey: "source_pin_id")
					waypoints = aDecoder.decodeObject(forKey: "waypoints") as? [Int64]
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(contentTypeID, forKey: "content_type_id")
					aCoder.encode(destinationPinID, forKey: "destination_pin_id")
					aCoder.encode(quantity, forKey: "quantity")
					aCoder.encode(routeID, forKey: "route_id")
					aCoder.encode(sourcePinID, forKey: "source_pin_id")
					if let v = waypoints {
						aCoder.encode(v, forKey: "waypoints")
					}
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["content_type_id"] = contentTypeID.json
					json["destination_pin_id"] = destinationPinID.json
					json["quantity"] = quantity.json
					json["route_id"] = routeID.json
					json["source_pin_id"] = sourcePinID.json
					if let v = waypoints?.json {
						json["waypoints"] = v
					}
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.contentTypeID.hashValue)
					hashCombine(seed: &hash, value: self.destinationPinID.hashValue)
					hashCombine(seed: &hash, value: self.quantity.hashValue)
					hashCombine(seed: &hash, value: self.routeID.hashValue)
					hashCombine(seed: &hash, value: self.sourcePinID.hashValue)
					self.waypoints?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: PlanetaryInteraction.ColonyLayout.Route, rhs: PlanetaryInteraction.ColonyLayout.Route) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: PlanetaryInteraction.ColonyLayout.Route) {
					contentTypeID = other.contentTypeID
					destinationPinID = other.destinationPinID
					quantity = other.quantity
					routeID = other.routeID
					sourcePinID = other.sourcePinID
					waypoints = other.waypoints?.flatMap { $0 }
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return PlanetaryInteraction.ColonyLayout.Route(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? Route)?.hashValue == hashValue
				}
				
			}
			
			public var links: [PlanetaryInteraction.ColonyLayout.Link] = []
			public var pins: [PlanetaryInteraction.ColonyLayout.Pin] = []
			public var routes: [PlanetaryInteraction.ColonyLayout.Route] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				links = try (dictionary["links"] as? [Any])?.map {try PlanetaryInteraction.ColonyLayout.Link(json: $0)} ?? []
				pins = try (dictionary["pins"] as? [Any])?.map {try PlanetaryInteraction.ColonyLayout.Pin(json: $0)} ?? []
				routes = try (dictionary["routes"] as? [Any])?.map {try PlanetaryInteraction.ColonyLayout.Route(json: $0)} ?? []
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				links = aDecoder.decodeObject(of: [PlanetaryInteraction.ColonyLayout.Link.self], forKey: "links") as? [PlanetaryInteraction.ColonyLayout.Link] ?? []
				pins = aDecoder.decodeObject(of: [PlanetaryInteraction.ColonyLayout.Pin.self], forKey: "pins") as? [PlanetaryInteraction.ColonyLayout.Pin] ?? []
				routes = aDecoder.decodeObject(of: [PlanetaryInteraction.ColonyLayout.Route.self], forKey: "routes") as? [PlanetaryInteraction.ColonyLayout.Route] ?? []
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(links, forKey: "links")
				aCoder.encode(pins, forKey: "pins")
				aCoder.encode(routes, forKey: "routes")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["links"] = links.json
				json["pins"] = pins.json
				json["routes"] = routes.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.links.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.pins.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.routes.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: PlanetaryInteraction.ColonyLayout, rhs: PlanetaryInteraction.ColonyLayout) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: PlanetaryInteraction.ColonyLayout) {
				links = other.links.flatMap { PlanetaryInteraction.ColonyLayout.Link($0) }
				pins = other.pins.flatMap { PlanetaryInteraction.ColonyLayout.Pin($0) }
				routes = other.routes.flatMap { PlanetaryInteraction.ColonyLayout.Route($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return PlanetaryInteraction.ColonyLayout(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? ColonyLayout)?.hashValue == hashValue
			}
			
		}
		
		
		public class SchematicInformation: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var cycleTime: Int = Int()
			public var schematicName: String = String()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let cycleTime = dictionary["cycle_time"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.cycleTime = cycleTime
				guard let schematicName = dictionary["schematic_name"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.schematicName = schematicName
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				cycleTime = aDecoder.decodeInteger(forKey: "cycle_time")
				schematicName = aDecoder.decodeObject(forKey: "schematic_name") as? String ?? String()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(cycleTime, forKey: "cycle_time")
				aCoder.encode(schematicName, forKey: "schematic_name")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["cycle_time"] = cycleTime.json
				json["schematic_name"] = schematicName.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.cycleTime.hashValue)
				hashCombine(seed: &hash, value: self.schematicName.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: PlanetaryInteraction.SchematicInformation, rhs: PlanetaryInteraction.SchematicInformation) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: PlanetaryInteraction.SchematicInformation) {
				cycleTime = other.cycleTime
				schematicName = other.schematicName
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return PlanetaryInteraction.SchematicInformation(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? SchematicInformation)?.hashValue == hashValue
			}
			
		}
		
		
	}
	
}
