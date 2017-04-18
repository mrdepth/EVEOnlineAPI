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
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-planets.manage_planets.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			let headers = HTTPHeaders()
			
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
			
			let headers = HTTPHeaders()
			
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
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-planets.manage_planets.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			let headers = HTTPHeaders()
			
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
		
		
		public class GetCharactersCharacterIDPlanetsPlanetIDForbidden: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: PlanetaryInteraction.GetCharactersCharacterIDPlanetsPlanetIDForbidden, rhs: PlanetaryInteraction.GetCharactersCharacterIDPlanetsPlanetIDForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetUniverseSchematicsSchematicIDNotFound: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: PlanetaryInteraction.GetUniverseSchematicsSchematicIDNotFound, rhs: PlanetaryInteraction.GetUniverseSchematicsSchematicIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class Colony: NSObject, NSSecureCoding , JSONCoding {
			
			public enum GetCharactersCharacterIDPlanetsPlanetType: String, JSONCoding, HTTPQueryable {
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
					guard let s = json as? String, let v = GetCharactersCharacterIDPlanetsPlanetType(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
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
			public var planetType: PlanetaryInteraction.Colony.GetCharactersCharacterIDPlanetsPlanetType = PlanetaryInteraction.Colony.GetCharactersCharacterIDPlanetsPlanetType()
			public var solarSystemID: Int = Int()
			public var upgradeLevel: Int = Int()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let lastUpdate = DateFormatter.esiDateFormatter.date(from: dictionary["last_update"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.lastUpdate = lastUpdate
				guard let numPins = dictionary["num_pins"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.numPins = numPins
				guard let ownerID = dictionary["owner_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.ownerID = ownerID
				guard let planetID = dictionary["planet_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.planetID = planetID
				guard let planetType = PlanetaryInteraction.Colony.GetCharactersCharacterIDPlanetsPlanetType(rawValue: dictionary["planet_type"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
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
				planetType = PlanetaryInteraction.Colony.GetCharactersCharacterIDPlanetsPlanetType(rawValue: aDecoder.decodeObject(forKey: "planet_type") as? String ?? "") ?? PlanetaryInteraction.Colony.GetCharactersCharacterIDPlanetsPlanetType()
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: lastUpdate.hashValue)
				hashCombine(seed: &hash, value: numPins.hashValue)
				hashCombine(seed: &hash, value: ownerID.hashValue)
				hashCombine(seed: &hash, value: planetID.hashValue)
				hashCombine(seed: &hash, value: planetType.hashValue)
				hashCombine(seed: &hash, value: solarSystemID.hashValue)
				hashCombine(seed: &hash, value: upgradeLevel.hashValue)
				return hash
			}
			
			public static func ==(lhs: PlanetaryInteraction.Colony, rhs: PlanetaryInteraction.Colony) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetUniverseSchematicsSchematicIDInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: PlanetaryInteraction.GetUniverseSchematicsSchematicIDInternalServerError, rhs: PlanetaryInteraction.GetUniverseSchematicsSchematicIDInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDPlanetsPlanetIDNotFound: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: PlanetaryInteraction.GetCharactersCharacterIDPlanetsPlanetIDNotFound, rhs: PlanetaryInteraction.GetCharactersCharacterIDPlanetsPlanetIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDPlanetsPlanetIDInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: PlanetaryInteraction.GetCharactersCharacterIDPlanetsPlanetIDInternalServerError, rhs: PlanetaryInteraction.GetCharactersCharacterIDPlanetsPlanetIDInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class ColonyLayout: NSObject, NSSecureCoding , JSONCoding {
			
			public class GetCharactersCharacterIDPlanetsPlanetIDRoutes: NSObject, NSSecureCoding , JSONCoding {
				
				public class GetCharactersCharacterIDPlanetsPlanetIDWaypoints: NSObject, NSSecureCoding , JSONCoding {
					
					
					public var order: Int = Int()
					public var pinID: Int64 = Int64()
					
					public static var supportsSecureCoding: Bool {
						return true
					}
					
					public required init(json: Any) throws {
						guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
						
						guard let order = dictionary["order"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
						self.order = order
						guard let pinID = dictionary["pin_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
						self.pinID = pinID
						
						super.init()
					}
					
					override public init() {
						super.init()
					}
					
					public required init?(coder aDecoder: NSCoder) {
						order = aDecoder.decodeInteger(forKey: "order")
						pinID = aDecoder.decodeInt64(forKey: "pin_id")
						
						super.init()
					}
					
					public func encode(with aCoder: NSCoder) {
						aCoder.encode(order, forKey: "order")
						aCoder.encode(pinID, forKey: "pin_id")
					}
					
					public var json: Any {
						var json = [String: Any]()
						json["order"] = order.json
						json["pin_id"] = pinID.json
						return json
					}
					
					override public var hashValue: Int {
						var hash: Int = 0
						hashCombine(seed: &hash, value: order.hashValue)
						hashCombine(seed: &hash, value: pinID.hashValue)
						return hash
					}
					
					public static func ==(lhs: PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDRoutes.GetCharactersCharacterIDPlanetsPlanetIDWaypoints, rhs: PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDRoutes.GetCharactersCharacterIDPlanetsPlanetIDWaypoints) -> Bool {
						return lhs.hashValue == rhs.hashValue
					}
					
				}
				
				public var contentTypeID: Int = Int()
				public var destinationPinID: Int64 = Int64()
				public var quantity: Float = Float()
				public var routeID: Int64 = Int64()
				public var sourcePinID: Int64 = Int64()
				public var waypoints: [PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDRoutes.GetCharactersCharacterIDPlanetsPlanetIDWaypoints]? = nil
				
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
					waypoints = try (dictionary["waypoints"] as? [Any])?.map {try PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDRoutes.GetCharactersCharacterIDPlanetsPlanetIDWaypoints(json: $0)}
					
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
					waypoints = aDecoder.decodeObject(of: [PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDRoutes.GetCharactersCharacterIDPlanetsPlanetIDWaypoints.self], forKey: "waypoints") as? [PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDRoutes.GetCharactersCharacterIDPlanetsPlanetIDWaypoints]
					
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: contentTypeID.hashValue)
					hashCombine(seed: &hash, value: destinationPinID.hashValue)
					hashCombine(seed: &hash, value: quantity.hashValue)
					hashCombine(seed: &hash, value: routeID.hashValue)
					hashCombine(seed: &hash, value: sourcePinID.hashValue)
					waypoints?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					return hash
				}
				
				public static func ==(lhs: PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDRoutes, rhs: PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDRoutes) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
			}
			
			public class GetCharactersCharacterIDPlanetsPlanetIDLinks: NSObject, NSSecureCoding , JSONCoding {
				
				
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: destinationPinID.hashValue)
					hashCombine(seed: &hash, value: linkLevel.hashValue)
					hashCombine(seed: &hash, value: sourcePinID.hashValue)
					return hash
				}
				
				public static func ==(lhs: PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDLinks, rhs: PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDLinks) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
			}
			
			public class GetCharactersCharacterIDPlanetsPlanetIDPins: NSObject, NSSecureCoding , JSONCoding {
				
				public class GetCharactersCharacterIDPlanetsPlanetIDExtractorDetails: NSObject, NSSecureCoding , JSONCoding {
					
					public class GetCharactersCharacterIDPlanetsPlanetIDHeads: NSObject, NSSecureCoding , JSONCoding {
						
						
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
						
						override public var hashValue: Int {
							var hash: Int = 0
							hashCombine(seed: &hash, value: headID.hashValue)
							hashCombine(seed: &hash, value: latitude.hashValue)
							hashCombine(seed: &hash, value: longitude.hashValue)
							return hash
						}
						
						public static func ==(lhs: PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDPins.GetCharactersCharacterIDPlanetsPlanetIDExtractorDetails.GetCharactersCharacterIDPlanetsPlanetIDHeads, rhs: PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDPins.GetCharactersCharacterIDPlanetsPlanetIDExtractorDetails.GetCharactersCharacterIDPlanetsPlanetIDHeads) -> Bool {
							return lhs.hashValue == rhs.hashValue
						}
						
					}
					
					public var cycleTime: Int? = nil
					public var headRadius: Float? = nil
					public var heads: [PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDPins.GetCharactersCharacterIDPlanetsPlanetIDExtractorDetails.GetCharactersCharacterIDPlanetsPlanetIDHeads] = []
					public var productTypeID: Int? = nil
					public var qtyPerCycle: Int? = nil
					
					public static var supportsSecureCoding: Bool {
						return true
					}
					
					public required init(json: Any) throws {
						guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
						
						cycleTime = dictionary["cycle_time"] as? Int
						headRadius = dictionary["head_radius"] as? Float
						heads = try (dictionary["heads"] as? [Any])?.map {try PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDPins.GetCharactersCharacterIDPlanetsPlanetIDExtractorDetails.GetCharactersCharacterIDPlanetsPlanetIDHeads(json: $0)} ?? []
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
						heads = aDecoder.decodeObject(of: [PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDPins.GetCharactersCharacterIDPlanetsPlanetIDExtractorDetails.GetCharactersCharacterIDPlanetsPlanetIDHeads.self], forKey: "heads") as? [PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDPins.GetCharactersCharacterIDPlanetsPlanetIDExtractorDetails.GetCharactersCharacterIDPlanetsPlanetIDHeads] ?? []
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
					
					override public var hashValue: Int {
						var hash: Int = 0
						hashCombine(seed: &hash, value: cycleTime?.hashValue ?? 0)
						hashCombine(seed: &hash, value: headRadius?.hashValue ?? 0)
						heads.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
						hashCombine(seed: &hash, value: productTypeID?.hashValue ?? 0)
						hashCombine(seed: &hash, value: qtyPerCycle?.hashValue ?? 0)
						return hash
					}
					
					public static func ==(lhs: PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDPins.GetCharactersCharacterIDPlanetsPlanetIDExtractorDetails, rhs: PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDPins.GetCharactersCharacterIDPlanetsPlanetIDExtractorDetails) -> Bool {
						return lhs.hashValue == rhs.hashValue
					}
					
				}
				
				public class GetCharactersCharacterIDPlanetsPlanetIDFactoryDetails: NSObject, NSSecureCoding , JSONCoding {
					
					
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
					
					override public var hashValue: Int {
						var hash: Int = 0
						hashCombine(seed: &hash, value: schematicID.hashValue)
						return hash
					}
					
					public static func ==(lhs: PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDPins.GetCharactersCharacterIDPlanetsPlanetIDFactoryDetails, rhs: PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDPins.GetCharactersCharacterIDPlanetsPlanetIDFactoryDetails) -> Bool {
						return lhs.hashValue == rhs.hashValue
					}
					
				}
				
				public var expiryTime: Date? = nil
				public var extractorDetails: PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDPins.GetCharactersCharacterIDPlanetsPlanetIDExtractorDetails? = nil
				public var factoryDetails: PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDPins.GetCharactersCharacterIDPlanetsPlanetIDFactoryDetails? = nil
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
					
					expiryTime = DateFormatter.esiDateFormatter.date(from: dictionary["expiry_time"] as? String ?? "")
					extractorDetails = try? PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDPins.GetCharactersCharacterIDPlanetsPlanetIDExtractorDetails(json: dictionary["extractor_details"] as? [String: Any] ?? [:])
					factoryDetails = try? PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDPins.GetCharactersCharacterIDPlanetsPlanetIDFactoryDetails(json: dictionary["factory_details"] as? [String: Any] ?? [:])
					installTime = DateFormatter.esiDateFormatter.date(from: dictionary["install_time"] as? String ?? "")
					lastCycleStart = DateFormatter.esiDateFormatter.date(from: dictionary["last_cycle_start"] as? String ?? "")
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
					expiryTime = aDecoder.decodeObject(forKey: "expiry_time") as? Date
					extractorDetails = aDecoder.decodeObject(of: PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDPins.GetCharactersCharacterIDPlanetsPlanetIDExtractorDetails.self, forKey: "extractor_details") 
					factoryDetails = aDecoder.decodeObject(of: PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDPins.GetCharactersCharacterIDPlanetsPlanetIDFactoryDetails.self, forKey: "factory_details") 
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: expiryTime?.hashValue ?? 0)
					hashCombine(seed: &hash, value: extractorDetails?.hashValue ?? 0)
					hashCombine(seed: &hash, value: factoryDetails?.hashValue ?? 0)
					hashCombine(seed: &hash, value: installTime?.hashValue ?? 0)
					hashCombine(seed: &hash, value: lastCycleStart?.hashValue ?? 0)
					hashCombine(seed: &hash, value: latitude.hashValue)
					hashCombine(seed: &hash, value: longitude.hashValue)
					hashCombine(seed: &hash, value: pinID.hashValue)
					hashCombine(seed: &hash, value: schematicID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: typeID.hashValue)
					return hash
				}
				
				public static func ==(lhs: PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDPins, rhs: PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDPins) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
			}
			
			public var links: [PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDLinks] = []
			public var pins: [PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDPins] = []
			public var routes: [PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDRoutes] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				links = try (dictionary["links"] as? [Any])?.map {try PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDLinks(json: $0)} ?? []
				pins = try (dictionary["pins"] as? [Any])?.map {try PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDPins(json: $0)} ?? []
				routes = try (dictionary["routes"] as? [Any])?.map {try PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDRoutes(json: $0)} ?? []
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				links = aDecoder.decodeObject(of: [PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDLinks.self], forKey: "links") as? [PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDLinks] ?? []
				pins = aDecoder.decodeObject(of: [PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDPins.self], forKey: "pins") as? [PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDPins] ?? []
				routes = aDecoder.decodeObject(of: [PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDRoutes.self], forKey: "routes") as? [PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDRoutes] ?? []
				
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				links.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				pins.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				routes.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}
			
			public static func ==(lhs: PlanetaryInteraction.ColonyLayout, rhs: PlanetaryInteraction.ColonyLayout) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDPlanetsInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: PlanetaryInteraction.GetCharactersCharacterIDPlanetsInternalServerError, rhs: PlanetaryInteraction.GetCharactersCharacterIDPlanetsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDPlanetsForbidden: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: PlanetaryInteraction.GetCharactersCharacterIDPlanetsForbidden, rhs: PlanetaryInteraction.GetCharactersCharacterIDPlanetsForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class SchematicInformation: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: cycleTime.hashValue)
				hashCombine(seed: &hash, value: schematicName.hashValue)
				return hash
			}
			
			public static func ==(lhs: PlanetaryInteraction.SchematicInformation, rhs: PlanetaryInteraction.SchematicInformation) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
	}
	
}
