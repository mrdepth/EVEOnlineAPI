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
			
			
			
			let url = session!.baseURL + "/v3/characters/\(characterID)/planets/\(planetID)/"
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
		
		public func getSchematicInformation(schematicID: Int, completionBlock:((Result<PlanetaryInteraction.SchematicInformation>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/universe/schematics/\(schematicID)/"
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
			
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/planets/"
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
		
		public func listCorporationCustomsOffices(corporationID: Int, page: Int? = nil, completionBlock:((Result<[PlanetaryInteraction.GetCorporationsCorporationIDCustomsOfficesOk]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-planets.read_customs_offices.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/customs_offices/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[PlanetaryInteraction.GetCorporationsCorporationIDCustomsOfficesOk]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		public struct GetCharactersCharacterIDPlanetsPlanetIDNotFound: Codable, Hashable {
			
			
			public let error: String?
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: PlanetaryInteraction.GetCharactersCharacterIDPlanetsPlanetIDNotFound, rhs: PlanetaryInteraction.GetCharactersCharacterIDPlanetsPlanetIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case error
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetUniverseSchematicsSchematicIDNotFound: Codable, Hashable {
			
			
			public let error: String?
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: PlanetaryInteraction.GetUniverseSchematicsSchematicIDNotFound, rhs: PlanetaryInteraction.GetUniverseSchematicsSchematicIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case error
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct Colony: Codable, Hashable {
			
			public enum PlanetType: String, Codable, HTTPQueryable {
				case barren = "barren"
				case gas = "gas"
				case ice = "ice"
				case lava = "lava"
				case oceanic = "oceanic"
				case plasma = "plasma"
				case storm = "storm"
				case temperate = "temperate"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public let lastUpdate: Date
			public let numPins: Int
			public let ownerID: Int
			public let planetID: Int
			public let planetType: PlanetaryInteraction.Colony.PlanetType
			public let solarSystemID: Int
			public let upgradeLevel: Int
			
			public var hashValue: Int {
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
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case lastUpdate = "last_update"
				case numPins = "num_pins"
				case ownerID = "owner_id"
				case planetID = "planet_id"
				case planetType = "planet_type"
				case solarSystemID = "solar_system_id"
				case upgradeLevel = "upgrade_level"
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .lastUpdate: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct ColonyLayout: Codable, Hashable {
			
			public struct Pin: Codable, Hashable {
				
				public struct ExtractorDetails: Codable, Hashable {
					
					public struct Head: Codable, Hashable {
						
						
						public let headID: Int
						public let latitude: Float
						public let longitude: Float
						
						public var hashValue: Int {
							var hash: Int = 0
							hashCombine(seed: &hash, value: headID.hashValue)
							hashCombine(seed: &hash, value: latitude.hashValue)
							hashCombine(seed: &hash, value: longitude.hashValue)
							return hash
						}
						
						public static func ==(lhs: PlanetaryInteraction.ColonyLayout.Pin.ExtractorDetails.Head, rhs: PlanetaryInteraction.ColonyLayout.Pin.ExtractorDetails.Head) -> Bool {
							return lhs.hashValue == rhs.hashValue
						}
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case headID = "head_id"
							case latitude
							case longitude
							
							var dateFormatter: DateFormatter? {
								switch self {
									
									default: return nil
								}
							}
						}
					}
					
					public let cycleTime: Int?
					public let headRadius: Float?
					public let heads: [PlanetaryInteraction.ColonyLayout.Pin.ExtractorDetails.Head]
					public let productTypeID: Int?
					public let qtyPerCycle: Int?
					
					public var hashValue: Int {
						var hash: Int = 0
						hashCombine(seed: &hash, value: cycleTime?.hashValue ?? 0)
						hashCombine(seed: &hash, value: headRadius?.hashValue ?? 0)
						self.heads.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
						hashCombine(seed: &hash, value: productTypeID?.hashValue ?? 0)
						hashCombine(seed: &hash, value: qtyPerCycle?.hashValue ?? 0)
						return hash
					}
					
					public static func ==(lhs: PlanetaryInteraction.ColonyLayout.Pin.ExtractorDetails, rhs: PlanetaryInteraction.ColonyLayout.Pin.ExtractorDetails) -> Bool {
						return lhs.hashValue == rhs.hashValue
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case cycleTime = "cycle_time"
						case headRadius = "head_radius"
						case heads
						case productTypeID = "product_type_id"
						case qtyPerCycle = "qty_per_cycle"
						
						var dateFormatter: DateFormatter? {
							switch self {
								
								default: return nil
							}
						}
					}
				}
				
				public struct Contents: Codable, Hashable {
					
					
					public let amount: Int64
					public let typeID: Int
					
					public var hashValue: Int {
						var hash: Int = 0
						hashCombine(seed: &hash, value: amount.hashValue)
						hashCombine(seed: &hash, value: typeID.hashValue)
						return hash
					}
					
					public static func ==(lhs: PlanetaryInteraction.ColonyLayout.Pin.Contents, rhs: PlanetaryInteraction.ColonyLayout.Pin.Contents) -> Bool {
						return lhs.hashValue == rhs.hashValue
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case amount
						case typeID = "type_id"
						
						var dateFormatter: DateFormatter? {
							switch self {
								
								default: return nil
							}
						}
					}
				}
				
				public struct FactoryDetails: Codable, Hashable {
					
					
					public let schematicID: Int
					
					public var hashValue: Int {
						var hash: Int = 0
						hashCombine(seed: &hash, value: schematicID.hashValue)
						return hash
					}
					
					public static func ==(lhs: PlanetaryInteraction.ColonyLayout.Pin.FactoryDetails, rhs: PlanetaryInteraction.ColonyLayout.Pin.FactoryDetails) -> Bool {
						return lhs.hashValue == rhs.hashValue
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case schematicID = "schematic_id"
						
						var dateFormatter: DateFormatter? {
							switch self {
								
								default: return nil
							}
						}
					}
				}
				
				public let contents: [PlanetaryInteraction.ColonyLayout.Pin.Contents]?
				public let expiryTime: Date?
				public let extractorDetails: PlanetaryInteraction.ColonyLayout.Pin.ExtractorDetails?
				public let factoryDetails: PlanetaryInteraction.ColonyLayout.Pin.FactoryDetails?
				public let installTime: Date?
				public let lastCycleStart: Date?
				public let latitude: Float
				public let longitude: Float
				public let pinID: Int64
				public let schematicID: Int?
				public let typeID: Int
				
				public var hashValue: Int {
					var hash: Int = 0
					self.contents?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
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
				
				public static func ==(lhs: PlanetaryInteraction.ColonyLayout.Pin, rhs: PlanetaryInteraction.ColonyLayout.Pin) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case contents
					case expiryTime = "expiry_time"
					case extractorDetails = "extractor_details"
					case factoryDetails = "factory_details"
					case installTime = "install_time"
					case lastCycleStart = "last_cycle_start"
					case latitude
					case longitude
					case pinID = "pin_id"
					case schematicID = "schematic_id"
					case typeID = "type_id"
					
					var dateFormatter: DateFormatter? {
						switch self {
							case .expiryTime: return DateFormatter.esiDateTimeFormatter
							case .installTime: return DateFormatter.esiDateTimeFormatter
							case .lastCycleStart: return DateFormatter.esiDateTimeFormatter
							default: return nil
						}
					}
				}
			}
			
			public struct Link: Codable, Hashable {
				
				
				public let destinationPinID: Int64
				public let linkLevel: Int
				public let sourcePinID: Int64
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: destinationPinID.hashValue)
					hashCombine(seed: &hash, value: linkLevel.hashValue)
					hashCombine(seed: &hash, value: sourcePinID.hashValue)
					return hash
				}
				
				public static func ==(lhs: PlanetaryInteraction.ColonyLayout.Link, rhs: PlanetaryInteraction.ColonyLayout.Link) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case destinationPinID = "destination_pin_id"
					case linkLevel = "link_level"
					case sourcePinID = "source_pin_id"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct Route: Codable, Hashable {
				
				
				public let contentTypeID: Int
				public let destinationPinID: Int64
				public let quantity: Float
				public let routeID: Int64
				public let sourcePinID: Int64
				public let waypoints: [Int64]?
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: contentTypeID.hashValue)
					hashCombine(seed: &hash, value: destinationPinID.hashValue)
					hashCombine(seed: &hash, value: quantity.hashValue)
					hashCombine(seed: &hash, value: routeID.hashValue)
					hashCombine(seed: &hash, value: sourcePinID.hashValue)
					self.waypoints?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					return hash
				}
				
				public static func ==(lhs: PlanetaryInteraction.ColonyLayout.Route, rhs: PlanetaryInteraction.ColonyLayout.Route) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case contentTypeID = "content_type_id"
					case destinationPinID = "destination_pin_id"
					case quantity
					case routeID = "route_id"
					case sourcePinID = "source_pin_id"
					case waypoints
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public let links: [PlanetaryInteraction.ColonyLayout.Link]
			public let pins: [PlanetaryInteraction.ColonyLayout.Pin]
			public let routes: [PlanetaryInteraction.ColonyLayout.Route]
			
			public var hashValue: Int {
				var hash: Int = 0
				self.links.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.pins.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.routes.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}
			
			public static func ==(lhs: PlanetaryInteraction.ColonyLayout, rhs: PlanetaryInteraction.ColonyLayout) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case links
				case pins
				case routes
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct SchematicInformation: Codable, Hashable {
			
			
			public let cycleTime: Int
			public let schematicName: String
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: cycleTime.hashValue)
				hashCombine(seed: &hash, value: schematicName.hashValue)
				return hash
			}
			
			public static func ==(lhs: PlanetaryInteraction.SchematicInformation, rhs: PlanetaryInteraction.SchematicInformation) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case cycleTime = "cycle_time"
				case schematicName = "schematic_name"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCorporationsCorporationIDCustomsOfficesOk: Codable, Hashable {
			
			public enum GetCorporationsCorporationIDCustomsOfficesStandingLevel: String, Codable, HTTPQueryable {
				case bad = "bad"
				case excellent = "excellent"
				case good = "good"
				case neutral = "neutral"
				case terrible = "terrible"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public let allianceTaxRate: Float?
			public let allowAccessWithStandings: Bool
			public let allowAllianceAccess: Bool
			public let badStandingTaxRate: Float?
			public let corporationTaxRate: Float?
			public let excellentStandingTaxRate: Float?
			public let goodStandingTaxRate: Float?
			public let neutralStandingTaxRate: Float?
			public let officeID: Int64
			public let reinforceExitEnd: Int
			public let reinforceExitStart: Int
			public let standingLevel: PlanetaryInteraction.GetCorporationsCorporationIDCustomsOfficesOk.GetCorporationsCorporationIDCustomsOfficesStandingLevel?
			public let systemID: Int
			public let terribleStandingTaxRate: Float?
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: allianceTaxRate?.hashValue ?? 0)
				hashCombine(seed: &hash, value: allowAccessWithStandings.hashValue)
				hashCombine(seed: &hash, value: allowAllianceAccess.hashValue)
				hashCombine(seed: &hash, value: badStandingTaxRate?.hashValue ?? 0)
				hashCombine(seed: &hash, value: corporationTaxRate?.hashValue ?? 0)
				hashCombine(seed: &hash, value: excellentStandingTaxRate?.hashValue ?? 0)
				hashCombine(seed: &hash, value: goodStandingTaxRate?.hashValue ?? 0)
				hashCombine(seed: &hash, value: neutralStandingTaxRate?.hashValue ?? 0)
				hashCombine(seed: &hash, value: officeID.hashValue)
				hashCombine(seed: &hash, value: reinforceExitEnd.hashValue)
				hashCombine(seed: &hash, value: reinforceExitStart.hashValue)
				hashCombine(seed: &hash, value: standingLevel?.hashValue ?? 0)
				hashCombine(seed: &hash, value: systemID.hashValue)
				hashCombine(seed: &hash, value: terribleStandingTaxRate?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: PlanetaryInteraction.GetCorporationsCorporationIDCustomsOfficesOk, rhs: PlanetaryInteraction.GetCorporationsCorporationIDCustomsOfficesOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case allianceTaxRate = "alliance_tax_rate"
				case allowAccessWithStandings = "allow_access_with_standings"
				case allowAllianceAccess = "allow_alliance_access"
				case badStandingTaxRate = "bad_standing_tax_rate"
				case corporationTaxRate = "corporation_tax_rate"
				case excellentStandingTaxRate = "excellent_standing_tax_rate"
				case goodStandingTaxRate = "good_standing_tax_rate"
				case neutralStandingTaxRate = "neutral_standing_tax_rate"
				case officeID = "office_id"
				case reinforceExitEnd = "reinforce_exit_end"
				case reinforceExitStart = "reinforce_exit_start"
				case standingLevel = "standing_level"
				case systemID = "system_id"
				case terribleStandingTaxRate = "terrible_standing_tax_rate"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
	}
	
}
