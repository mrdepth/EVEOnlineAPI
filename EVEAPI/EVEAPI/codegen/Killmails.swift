import Foundation
import Alamofire
import Combine


extension ESI {
	public var killmails: Killmails {
		return Killmails(esi: self, route: .path("killmails", next: .root(ESI.apiURL)))
	}
	
	public struct Killmails {
		let esi: ESI
		let route: APIRoute
		
		
		
		public func killmailID(_ value: Int) -> KillmailID {
			KillmailID(esi: esi, route: .parameter(value, next: route))
		}
		
		public struct KillmailID {
			let esi: ESI
			let route: APIRoute
			
			
			
			public func killmailHash(_ value: String) -> KillmailHash {
				KillmailHash(esi: esi, route: .parameter(value, next: route))
			}
			
			public struct KillmailHash {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<ESIResponse<Success>, AFError> {
					do {
						
						
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public var attackers: [ESI.Killmails.KillmailID.KillmailHash.Attacker]
					public var killmailID: Int
					public var killmailTime: Date
					public var moonID: Int?
					public var solarSystemID: Int
					public var victim: ESI.Killmails.KillmailID.KillmailHash.Victim
					public var warID: Int?
					public init(attackers: [ESI.Killmails.KillmailID.KillmailHash.Attacker], killmailID: Int, killmailTime: Date, moonID: Int?, solarSystemID: Int, victim: ESI.Killmails.KillmailID.KillmailHash.Victim, warID: Int?) {
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
								case .killmailTime:
								return DateFormatter.esiDateTimeFormatter
								default:
								return nil
							}
						}
					}
				}
				
				public struct Victim: Codable, Hashable {
					
					public struct Item: Codable, Hashable {
						
						public struct ItemsItem: Codable, Hashable {
							
							
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
									return nil
								}
							}
						}
						
						public var flag: Int
						public var itemTypeID: Int
						public var items: [ESI.Killmails.KillmailID.KillmailHash.Victim.Item.ItemsItem]?
						public var quantityDestroyed: Int64?
						public var quantityDropped: Int64?
						public var singleton: Int
						public init(flag: Int, itemTypeID: Int, items: [ESI.Killmails.KillmailID.KillmailHash.Victim.Item.ItemsItem]?, quantityDestroyed: Int64?, quantityDropped: Int64?, singleton: Int) {
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
								return nil
							}
						}
					}
					
					public var allianceID: Int?
					public var characterID: Int?
					public var corporationID: Int?
					public var damageTaken: Int
					public var factionID: Int?
					public var items: [ESI.Killmails.KillmailID.KillmailHash.Victim.Item]?
					public var position: ESI.Characters.Position?
					public var shipTypeID: Int
					public init(allianceID: Int?, characterID: Int?, corporationID: Int?, damageTaken: Int, factionID: Int?, items: [ESI.Killmails.KillmailID.KillmailHash.Victim.Item]?, position: ESI.Characters.Position?, shipTypeID: Int) {
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
							return nil
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
					public var securityStatus: Double
					public var shipTypeID: Int?
					public var weaponTypeID: Int?
					public init(allianceID: Int?, characterID: Int?, corporationID: Int?, damageDone: Int, factionID: Int?, finalBlow: Bool, securityStatus: Double, shipTypeID: Int?, weaponTypeID: Int?) {
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
							return nil
						}
					}
				}
				
			}
			
			
			
		}
		
		
		
	}
	
}
