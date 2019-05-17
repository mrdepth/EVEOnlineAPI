import Foundation
import Alamofire
import Futures


public extension ESI {
	var planetaryInteraction: PlanetaryInteraction {
		return PlanetaryInteraction(esi: self)
	}
	
	struct PlanetaryInteraction {
		let esi: ESI
		
		@discardableResult
		public func getSchematicInformation(ifNoneMatch: String? = nil, schematicID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<PlanetaryInteraction.SchematicInformation>> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/universe/schematics/\(schematicID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<PlanetaryInteraction.SchematicInformation>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<PlanetaryInteraction.SchematicInformation>) in
				promise.set(response: response, cached: 3600.0)
			}
			return promise.future
		}
		
		@discardableResult
		public func getColonies(characterID: Int, ifNoneMatch: String? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[PlanetaryInteraction.Colony]>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-planets.manage_planets.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/characters/\(characterID)/planets/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<[PlanetaryInteraction.Colony]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<[PlanetaryInteraction.Colony]>) in
				promise.set(response: response, cached: 600.0)
			}
			return promise.future
		}
		
		@discardableResult
		public func listCorporationCustomsOffices(corporationID: Int, ifNoneMatch: String? = nil, page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[PlanetaryInteraction.GetCorporationsCorporationIDCustomsOfficesOk]>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-planets.read_customs_offices.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = esi.baseURL + "/corporations/\(corporationID)/customs_offices/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<[PlanetaryInteraction.GetCorporationsCorporationIDCustomsOfficesOk]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<[PlanetaryInteraction.GetCorporationsCorporationIDCustomsOfficesOk]>) in
				promise.set(response: response, cached: 3600.0)
			}
			return promise.future
		}
		
		@discardableResult
		public func getColonyLayout(characterID: Int, ifNoneMatch: String? = nil, planetID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<PlanetaryInteraction.ColonyLayout>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-planets.manage_planets.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/characters/\(characterID)/planets/\(planetID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<PlanetaryInteraction.ColonyLayout>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<PlanetaryInteraction.ColonyLayout>) in
				promise.set(response: response, cached: 600.0)
			}
			return promise.future
		}
		
		
		public struct SchematicInformation: Codable, Hashable {
			
			
			public var cycleTime: Int
			public var schematicName: String
			
			public init(cycleTime: Int, schematicName: String) {
				self.cycleTime = cycleTime
				self.schematicName = schematicName
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
			
			public var allianceTaxRate: Float?
			public var allowAccessWithStandings: Bool
			public var allowAllianceAccess: Bool
			public var badStandingTaxRate: Float?
			public var corporationTaxRate: Float?
			public var excellentStandingTaxRate: Float?
			public var goodStandingTaxRate: Float?
			public var neutralStandingTaxRate: Float?
			public var officeID: Int64
			public var reinforceExitEnd: Int
			public var reinforceExitStart: Int
			public var standingLevel: PlanetaryInteraction.GetCorporationsCorporationIDCustomsOfficesOk.GetCorporationsCorporationIDCustomsOfficesStandingLevel?
			public var systemID: Int
			public var terribleStandingTaxRate: Float?
			
			public init(allianceTaxRate: Float?, allowAccessWithStandings: Bool, allowAllianceAccess: Bool, badStandingTaxRate: Float?, corporationTaxRate: Float?, excellentStandingTaxRate: Float?, goodStandingTaxRate: Float?, neutralStandingTaxRate: Float?, officeID: Int64, reinforceExitEnd: Int, reinforceExitStart: Int, standingLevel: PlanetaryInteraction.GetCorporationsCorporationIDCustomsOfficesOk.GetCorporationsCorporationIDCustomsOfficesStandingLevel?, systemID: Int, terribleStandingTaxRate: Float?) {
				self.allianceTaxRate = allianceTaxRate
				self.allowAccessWithStandings = allowAccessWithStandings
				self.allowAllianceAccess = allowAllianceAccess
				self.badStandingTaxRate = badStandingTaxRate
				self.corporationTaxRate = corporationTaxRate
				self.excellentStandingTaxRate = excellentStandingTaxRate
				self.goodStandingTaxRate = goodStandingTaxRate
				self.neutralStandingTaxRate = neutralStandingTaxRate
				self.officeID = officeID
				self.reinforceExitEnd = reinforceExitEnd
				self.reinforceExitStart = reinforceExitStart
				self.standingLevel = standingLevel
				self.systemID = systemID
				self.terribleStandingTaxRate = terribleStandingTaxRate
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
		
		
		public struct GetUniverseSchematicsSchematicIDNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
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
		
		
		public struct ColonyLayout: Codable, Hashable {
			
			public struct Pin: Codable, Hashable {
				
				public struct ExtractorDetails: Codable, Hashable {
					
					public struct Head: Codable, Hashable {
						
						
						public var headID: Int
						public var latitude: Float
						public var longitude: Float
						
						public init(headID: Int, latitude: Float, longitude: Float) {
							self.headID = headID
							self.latitude = latitude
							self.longitude = longitude
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
					
					public var cycleTime: Int?
					public var headRadius: Float?
					public var heads: [PlanetaryInteraction.ColonyLayout.Pin.ExtractorDetails.Head]
					public var productTypeID: Int?
					public var qtyPerCycle: Int?
					
					public init(cycleTime: Int?, headRadius: Float?, heads: [PlanetaryInteraction.ColonyLayout.Pin.ExtractorDetails.Head], productTypeID: Int?, qtyPerCycle: Int?) {
						self.cycleTime = cycleTime
						self.headRadius = headRadius
						self.heads = heads
						self.productTypeID = productTypeID
						self.qtyPerCycle = qtyPerCycle
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
					
					
					public var amount: Int64
					public var typeID: Int
					
					public init(amount: Int64, typeID: Int) {
						self.amount = amount
						self.typeID = typeID
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
					
					
					public var schematicID: Int
					
					public init(schematicID: Int) {
						self.schematicID = schematicID
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
				
				public var contents: [PlanetaryInteraction.ColonyLayout.Pin.Contents]?
				public var expiryTime: Date?
				public var extractorDetails: PlanetaryInteraction.ColonyLayout.Pin.ExtractorDetails?
				public var factoryDetails: PlanetaryInteraction.ColonyLayout.Pin.FactoryDetails?
				public var installTime: Date?
				public var lastCycleStart: Date?
				public var latitude: Float
				public var longitude: Float
				public var pinID: Int64
				public var schematicID: Int?
				public var typeID: Int
				
				public init(contents: [PlanetaryInteraction.ColonyLayout.Pin.Contents]?, expiryTime: Date?, extractorDetails: PlanetaryInteraction.ColonyLayout.Pin.ExtractorDetails?, factoryDetails: PlanetaryInteraction.ColonyLayout.Pin.FactoryDetails?, installTime: Date?, lastCycleStart: Date?, latitude: Float, longitude: Float, pinID: Int64, schematicID: Int?, typeID: Int) {
					self.contents = contents
					self.expiryTime = expiryTime
					self.extractorDetails = extractorDetails
					self.factoryDetails = factoryDetails
					self.installTime = installTime
					self.lastCycleStart = lastCycleStart
					self.latitude = latitude
					self.longitude = longitude
					self.pinID = pinID
					self.schematicID = schematicID
					self.typeID = typeID
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
				
				
				public var destinationPinID: Int64
				public var linkLevel: Int
				public var sourcePinID: Int64
				
				public init(destinationPinID: Int64, linkLevel: Int, sourcePinID: Int64) {
					self.destinationPinID = destinationPinID
					self.linkLevel = linkLevel
					self.sourcePinID = sourcePinID
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
				
				
				public var contentTypeID: Int
				public var destinationPinID: Int64
				public var quantity: Float
				public var routeID: Int64
				public var sourcePinID: Int64
				public var waypoints: [Int64]?
				
				public init(contentTypeID: Int, destinationPinID: Int64, quantity: Float, routeID: Int64, sourcePinID: Int64, waypoints: [Int64]?) {
					self.contentTypeID = contentTypeID
					self.destinationPinID = destinationPinID
					self.quantity = quantity
					self.routeID = routeID
					self.sourcePinID = sourcePinID
					self.waypoints = waypoints
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
			
			public var links: [PlanetaryInteraction.ColonyLayout.Link]
			public var pins: [PlanetaryInteraction.ColonyLayout.Pin]
			public var routes: [PlanetaryInteraction.ColonyLayout.Route]
			
			public init(links: [PlanetaryInteraction.ColonyLayout.Link], pins: [PlanetaryInteraction.ColonyLayout.Pin], routes: [PlanetaryInteraction.ColonyLayout.Route]) {
				self.links = links
				self.pins = pins
				self.routes = routes
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
		
		
		public struct GetCharactersCharacterIDPlanetsPlanetIDNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
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
			
			public var lastUpdate: Date
			public var numPins: Int
			public var ownerID: Int
			public var planetID: Int
			public var planetType: PlanetaryInteraction.Colony.PlanetType
			public var solarSystemID: Int
			public var upgradeLevel: Int
			
			public init(lastUpdate: Date, numPins: Int, ownerID: Int, planetID: Int, planetType: PlanetaryInteraction.Colony.PlanetType, solarSystemID: Int, upgradeLevel: Int) {
				self.lastUpdate = lastUpdate
				self.numPins = numPins
				self.ownerID = ownerID
				self.planetID = planetID
				self.planetType = planetType
				self.solarSystemID = solarSystemID
				self.upgradeLevel = upgradeLevel
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
		
		
	}
	
}
