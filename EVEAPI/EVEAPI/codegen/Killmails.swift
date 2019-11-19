import Foundation
import Alamofire
import Combine


extension ESI {
	public var killmails: Killmails {
		return Killmails(esi: self)
	}
	
	public struct Killmails {
		let esi: ESI
		
		
		public func getCharactersRecentKillsAndLosses(characterID: Int, page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Killmails.Recent], AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-killmails.read_killmails.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = page?.description {
				query.append(URLQueryItem(name: "page", value: v.lazy.map{$0.description}.joined(separator: ",")))
			}
			
			        let url = ESI.apiURL.appendingPathComponent("/characters/\(characterID)/killmails/recent/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .get,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
			            .eraseToAnyPublisher()
		}
		
		
		public func getSingleKillmail(killmailHash: String, killmailID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Killmails.Killmail, AFError> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/killmails/\(killmailID)/\(killmailHash)/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .get,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
			            .eraseToAnyPublisher()
		}
		
		
		public func getCorporationsRecentKillsAndLosses(corporationID: Int, page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Killmails.GetCorporationsCorporationIDKillmailsRecentOk], AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-killmails.read_corporation_killmails.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = page?.description {
				query.append(URLQueryItem(name: "page", value: v.lazy.map{$0.description}.joined(separator: ",")))
			}
			
			        let url = ESI.apiURL.appendingPathComponent("/corporations/\(corporationID)/killmails/recent/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .get,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
			            .eraseToAnyPublisher()
		}
		
		
		public struct Killmail: Codable, Hashable {
			
			public struct Victim: Codable, Hashable {
				
				public struct GetKillmailsKillmailIDKillmailHashPosition: Codable, Hashable {
					
					
					public var x: Double
					public var y: Double
					public var z: Double
					
					public init(x: Double, y: Double, z: Double) {
						self.x = x
						self.y = y
						self.z = z
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
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case error
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCorporationsCorporationIDKillmailsRecentOk: Codable, Hashable {
			
			
			public var killmailHash: String
			public var killmailID: Int
			
			public init(killmailHash: String, killmailID: Int) {
				self.killmailHash = killmailHash
				self.killmailID = killmailID
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
