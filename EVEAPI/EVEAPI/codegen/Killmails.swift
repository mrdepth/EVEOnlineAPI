import Foundation
import Alamofire
import Futures


public extension ESI {
	public var killmails: Killmails {
		return Killmails(esi: self)
	}
	
	class Killmails {
		weak var esi: ESI?
		
		init(esi: ESI) {
			self.esi = esi
		}
		
		@discardableResult
		public func getSingleKillmail(ifNoneMatch: String? = nil, killmailHash: String, killmailID: Int) -> Future<ESI.Result<Killmails.Killmail>> {
			guard let esi = self.esi else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<Killmails.Killmail>>()
			esi.perform { [weak esi] () -> DataRequest? in
				return esi?.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Killmails.Killmail>) in
					promise.set(result: response.result, cached: 1209600.0)
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCorporationsRecentKillsAndLosses(corporationID: Int, ifNoneMatch: String? = nil, page: Int? = nil) -> Future<ESI.Result<[Killmails.GetCorporationsCorporationIDKillmailsRecentOk]>> {
			guard let esi = self.esi else { return .init(.failure(ESIError.internalError)) }
			
			let scopes = (esi.sessionManager.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-killmails.read_corporation_killmails.v1") else {return .init(.failure(ESIError.forbidden))}
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
			
			let url = esi.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Killmails.GetCorporationsCorporationIDKillmailsRecentOk]>>()
			esi.perform { [weak esi] () -> DataRequest? in
				return esi?.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Killmails.GetCorporationsCorporationIDKillmailsRecentOk]>) in
					promise.set(result: response.result, cached: 300.0)
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCharactersRecentKillsAndLosses(characterID: Int, ifNoneMatch: String? = nil, page: Int? = nil) -> Future<ESI.Result<[Killmails.Recent]>> {
			guard let esi = self.esi else { return .init(.failure(ESIError.internalError)) }
			
			let scopes = (esi.sessionManager.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-killmails.read_killmails.v1") else {return .init(.failure(ESIError.forbidden))}
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
			
			let url = esi.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Killmails.Recent]>>()
			esi.perform { [weak esi] () -> DataRequest? in
				return esi?.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Killmails.Recent]>) in
					promise.set(result: response.result, cached: 300.0)
				}
			}
			return promise.future
		}
		
		
		public struct GetCorporationsCorporationIDKillmailsRecentOk: Codable, Hashable {
			
			
			public var killmailHash: String
			public var killmailID: Int
			
			public init(killmailHash: String, killmailID: Int) {
				self.killmailHash = killmailHash
				self.killmailID = killmailID
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: killmailHash.hashValue)
				hashCombine(seed: &hash, value: killmailID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Killmails.GetCorporationsCorporationIDKillmailsRecentOk, rhs: Killmails.GetCorporationsCorporationIDKillmailsRecentOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case killmailHash = "killmail_hash"
				case killmailID = "killmail_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetKillmailsKillmailIDKillmailHashUnprocessableEntity: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Killmails.GetKillmailsKillmailIDKillmailHashUnprocessableEntity, rhs: Killmails.GetKillmailsKillmailIDKillmailHashUnprocessableEntity) -> Bool {
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
		
		
		public struct Killmail: Codable, Hashable {
			
			public struct Attacker: Codable, Hashable {
				
				
				public var allianceID: Int?
				public var characterID: Int?
				public var corporationID: Int?
				public var damageDone: Int
				public var factionID: Int?
				public var finalBlow: Bool
				public var securityStatus: Float
				public var shipTypeID: Int?
				public var weaponTypeID: Int?
				
				public init(allianceID: Int?, characterID: Int?, corporationID: Int?, damageDone: Int, factionID: Int?, finalBlow: Bool, securityStatus: Float, shipTypeID: Int?, weaponTypeID: Int?) {
					self.allianceID = allianceID
					self.characterID = characterID
					self.corporationID = corporationID
					self.damageDone = damageDone
					self.factionID = factionID
					self.finalBlow = finalBlow
					self.securityStatus = securityStatus
					self.shipTypeID = shipTypeID
					self.weaponTypeID = weaponTypeID
				}
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: allianceID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: characterID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: corporationID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageDone.hashValue)
					hashCombine(seed: &hash, value: factionID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: finalBlow.hashValue)
					hashCombine(seed: &hash, value: securityStatus.hashValue)
					hashCombine(seed: &hash, value: shipTypeID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: weaponTypeID?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: Killmails.Killmail.Attacker, rhs: Killmails.Killmail.Attacker) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case allianceID = "alliance_id"
					case characterID = "character_id"
					case corporationID = "corporation_id"
					case damageDone = "damage_done"
					case factionID = "faction_id"
					case finalBlow = "final_blow"
					case securityStatus = "security_status"
					case shipTypeID = "ship_type_id"
					case weaponTypeID = "weapon_type_id"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct Victim: Codable, Hashable {
				
				public struct Items: Codable, Hashable {
					
					public struct Item: Codable, Hashable {
						
						
						public var flag: Int
						public var itemTypeID: Int
						public var quantityDestroyed: Int64?
						public var quantityDropped: Int64?
						public var singleton: Int
						
						public init(flag: Int, itemTypeID: Int, quantityDestroyed: Int64?, quantityDropped: Int64?, singleton: Int) {
							self.flag = flag
							self.itemTypeID = itemTypeID
							self.quantityDestroyed = quantityDestroyed
							self.quantityDropped = quantityDropped
							self.singleton = singleton
						}
						
						public var hashValue: Int {
							var hash: Int = 0
							hashCombine(seed: &hash, value: flag.hashValue)
							hashCombine(seed: &hash, value: itemTypeID.hashValue)
							hashCombine(seed: &hash, value: quantityDestroyed?.hashValue ?? 0)
							hashCombine(seed: &hash, value: quantityDropped?.hashValue ?? 0)
							hashCombine(seed: &hash, value: singleton.hashValue)
							return hash
						}
						
						public static func ==(lhs: Killmails.Killmail.Victim.Items.Item, rhs: Killmails.Killmail.Victim.Items.Item) -> Bool {
							return lhs.hashValue == rhs.hashValue
						}
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case flag
							case itemTypeID = "item_type_id"
							case quantityDestroyed = "quantity_destroyed"
							case quantityDropped = "quantity_dropped"
							case singleton
							
							var dateFormatter: DateFormatter? {
								switch self {
									
									default: return nil
								}
							}
						}
					}
					
					public var flag: Int
					public var itemTypeID: Int
					public var items: [Killmails.Killmail.Victim.Items.Item]?
					public var quantityDestroyed: Int64?
					public var quantityDropped: Int64?
					public var singleton: Int
					
					public init(flag: Int, itemTypeID: Int, items: [Killmails.Killmail.Victim.Items.Item]?, quantityDestroyed: Int64?, quantityDropped: Int64?, singleton: Int) {
						self.flag = flag
						self.itemTypeID = itemTypeID
						self.items = items
						self.quantityDestroyed = quantityDestroyed
						self.quantityDropped = quantityDropped
						self.singleton = singleton
					}
					
					public var hashValue: Int {
						var hash: Int = 0
						hashCombine(seed: &hash, value: flag.hashValue)
						hashCombine(seed: &hash, value: itemTypeID.hashValue)
						self.items?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
						hashCombine(seed: &hash, value: quantityDestroyed?.hashValue ?? 0)
						hashCombine(seed: &hash, value: quantityDropped?.hashValue ?? 0)
						hashCombine(seed: &hash, value: singleton.hashValue)
						return hash
					}
					
					public static func ==(lhs: Killmails.Killmail.Victim.Items, rhs: Killmails.Killmail.Victim.Items) -> Bool {
						return lhs.hashValue == rhs.hashValue
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case flag
						case itemTypeID = "item_type_id"
						case items
						case quantityDestroyed = "quantity_destroyed"
						case quantityDropped = "quantity_dropped"
						case singleton
						
						var dateFormatter: DateFormatter? {
							switch self {
								
								default: return nil
							}
						}
					}
				}
				
				public struct GetKillmailsKillmailIDKillmailHashPosition: Codable, Hashable {
					
					
					public var x: Double
					public var y: Double
					public var z: Double
					
					public init(x: Double, y: Double, z: Double) {
						self.x = x
						self.y = y
						self.z = z
					}
					
					public var hashValue: Int {
						var hash: Int = 0
						hashCombine(seed: &hash, value: x.hashValue)
						hashCombine(seed: &hash, value: y.hashValue)
						hashCombine(seed: &hash, value: z.hashValue)
						return hash
					}
					
					public static func ==(lhs: Killmails.Killmail.Victim.GetKillmailsKillmailIDKillmailHashPosition, rhs: Killmails.Killmail.Victim.GetKillmailsKillmailIDKillmailHashPosition) -> Bool {
						return lhs.hashValue == rhs.hashValue
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case x
						case y
						case z
						
						var dateFormatter: DateFormatter? {
							switch self {
								
								default: return nil
							}
						}
					}
				}
				
				public var allianceID: Int?
				public var characterID: Int?
				public var corporationID: Int?
				public var damageTaken: Int
				public var factionID: Int?
				public var items: [Killmails.Killmail.Victim.Items]?
				public var position: Killmails.Killmail.Victim.GetKillmailsKillmailIDKillmailHashPosition?
				public var shipTypeID: Int
				
				public init(allianceID: Int?, characterID: Int?, corporationID: Int?, damageTaken: Int, factionID: Int?, items: [Killmails.Killmail.Victim.Items]?, position: Killmails.Killmail.Victim.GetKillmailsKillmailIDKillmailHashPosition?, shipTypeID: Int) {
					self.allianceID = allianceID
					self.characterID = characterID
					self.corporationID = corporationID
					self.damageTaken = damageTaken
					self.factionID = factionID
					self.items = items
					self.position = position
					self.shipTypeID = shipTypeID
				}
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: allianceID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: characterID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: corporationID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: damageTaken.hashValue)
					hashCombine(seed: &hash, value: factionID?.hashValue ?? 0)
					self.items?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					hashCombine(seed: &hash, value: position?.hashValue ?? 0)
					hashCombine(seed: &hash, value: shipTypeID.hashValue)
					return hash
				}
				
				public static func ==(lhs: Killmails.Killmail.Victim, rhs: Killmails.Killmail.Victim) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case allianceID = "alliance_id"
					case characterID = "character_id"
					case corporationID = "corporation_id"
					case damageTaken = "damage_taken"
					case factionID = "faction_id"
					case items
					case position
					case shipTypeID = "ship_type_id"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public var attackers: [Killmails.Killmail.Attacker]
			public var killmailID: Int
			public var killmailTime: Date
			public var moonID: Int?
			public var solarSystemID: Int
			public var victim: Killmails.Killmail.Victim
			public var warID: Int?
			
			public init(attackers: [Killmails.Killmail.Attacker], killmailID: Int, killmailTime: Date, moonID: Int?, solarSystemID: Int, victim: Killmails.Killmail.Victim, warID: Int?) {
				self.attackers = attackers
				self.killmailID = killmailID
				self.killmailTime = killmailTime
				self.moonID = moonID
				self.solarSystemID = solarSystemID
				self.victim = victim
				self.warID = warID
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				self.attackers.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: killmailID.hashValue)
				hashCombine(seed: &hash, value: killmailTime.hashValue)
				hashCombine(seed: &hash, value: moonID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: solarSystemID.hashValue)
				hashCombine(seed: &hash, value: victim.hashValue)
				hashCombine(seed: &hash, value: warID?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Killmails.Killmail, rhs: Killmails.Killmail) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case attackers
				case killmailID = "killmail_id"
				case killmailTime = "killmail_time"
				case moonID = "moon_id"
				case solarSystemID = "solar_system_id"
				case victim
				case warID = "war_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .killmailTime: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct Recent: Codable, Hashable {
			
			
			public var killmailHash: String
			public var killmailID: Int
			
			public init(killmailHash: String, killmailID: Int) {
				self.killmailHash = killmailHash
				self.killmailID = killmailID
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: killmailHash.hashValue)
				hashCombine(seed: &hash, value: killmailID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Killmails.Recent, rhs: Killmails.Recent) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case killmailHash = "killmail_hash"
				case killmailID = "killmail_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
	}
	
}
