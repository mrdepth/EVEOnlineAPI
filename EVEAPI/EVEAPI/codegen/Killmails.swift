import Foundation
import Alamofire


public extension ESI {
	public var killmails: Killmails {
		return Killmails(sessionManager: self)
	}
	
	class Killmails {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		public func getSingleKillmail(killmailHash: String, killmailID: Int, completionBlock:((Result<Killmails.Killmail>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/killmails/\(killmailID)/\(killmailHash)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Killmails.Killmail>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getCorporationKillsAndLosses(corporationID: Int, maxKillID: Int? = nil, completionBlock:((Result<[Killmails.GetCorporationsCorporationIDKillmailsRecentOk]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-killmails.read_corporation_killmails.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = maxKillID?.httpQuery {
				query.append(URLQueryItem(name: "max_kill_id", value: v))
			}
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/killmails/recent/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Killmails.GetCorporationsCorporationIDKillmailsRecentOk]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getCharacterKillsAndLosses(characterID: Int, maxCount: Int? = nil, maxKillID: Int? = nil, completionBlock:((Result<[Killmails.Recent]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-killmails.read_killmails.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = maxCount?.httpQuery {
				query.append(URLQueryItem(name: "max_count", value: v))
			}
			if let v = maxKillID?.httpQuery {
				query.append(URLQueryItem(name: "max_kill_id", value: v))
			}
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/killmails/recent/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Killmails.Recent]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		public struct GetCorporationsCorporationIDKillmailsRecentOk: Codable, Hashable {
			
			
			public let killmailHash: String
			public let killmailID: Int
			
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
			
			
			public let error: String?
			
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
			
			public struct Victim: Codable, Hashable {
				
				public struct Item: Codable, Hashable {
					
					public struct Item: Codable, Hashable {
						
						
						public let flag: Int
						public let itemTypeID: Int
						public let quantityDestroyed: Int64?
						public let quantityDropped: Int64?
						public let singleton: Int
						
						public var hashValue: Int {
							var hash: Int = 0
							hashCombine(seed: &hash, value: flag.hashValue)
							hashCombine(seed: &hash, value: itemTypeID.hashValue)
							hashCombine(seed: &hash, value: quantityDestroyed?.hashValue ?? 0)
							hashCombine(seed: &hash, value: quantityDropped?.hashValue ?? 0)
							hashCombine(seed: &hash, value: singleton.hashValue)
							return hash
						}
						
						public static func ==(lhs: Killmails.Killmail.Victim.Item.Item, rhs: Killmails.Killmail.Victim.Item.Item) -> Bool {
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
					
					public let flag: Int
					public let itemTypeID: Int
					public let items: [Killmails.Killmail.Victim.Item.Item]?
					public let quantityDestroyed: Int64?
					public let quantityDropped: Int64?
					public let singleton: Int
					
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
					
					public static func ==(lhs: Killmails.Killmail.Victim.Item, rhs: Killmails.Killmail.Victim.Item) -> Bool {
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
					
					
					public let x: Double
					public let y: Double
					public let z: Double
					
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
				
				public let allianceID: Int?
				public let characterID: Int?
				public let corporationID: Int?
				public let damageTaken: Int
				public let factionID: Int?
				public let items: [Killmails.Killmail.Victim.Item]?
				public let position: Killmails.Killmail.Victim.GetKillmailsKillmailIDKillmailHashPosition?
				public let shipTypeID: Int
				
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
			
			public struct Attacker: Codable, Hashable {
				
				
				public let allianceID: Int?
				public let characterID: Int?
				public let corporationID: Int?
				public let damageDone: Int
				public let factionID: Int?
				public let finalBlow: Bool
				public let securityStatus: Float
				public let shipTypeID: Int?
				public let weaponTypeID: Int?
				
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
			
			public let attackers: [Killmails.Killmail.Attacker]
			public let killmailID: Int
			public let killmailTime: Date
			public let moonID: Int?
			public let solarSystemID: Int
			public let victim: Killmails.Killmail.Victim
			public let warID: Int?
			
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
			
			
			public let killmailHash: String
			public let killmailID: Int
			
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
