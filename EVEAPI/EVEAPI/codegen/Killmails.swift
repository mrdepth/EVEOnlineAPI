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
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Success, AFError> {
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
				
				
				
				
				
				
				public struct Victim: Codable, Hashable {
					
					public struct Item: Codable, Hashable {
						
						public struct ItemsItem: Codable, Hashable {
							
							
							public let flag: Int
							public let itemTypeID: Int
							public let quantityDestroyed: Int64?
							public let quantityDropped: Int64?
							public let singleton: Int
							
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
						
						public let flag: Int
						public let itemTypeID: Int
						public let items: [ESI.Killmails.KillmailID.KillmailHash.Victim.Item.ItemsItem]?
						public let quantityDestroyed: Int64?
						public let quantityDropped: Int64?
						public let singleton: Int
						
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
					
					public let allianceID: Int?
					public let characterID: Int?
					public let corporationID: Int?
					public let damageTaken: Int
					public let factionID: Int?
					public let items: [ESI.Killmails.KillmailID.KillmailHash.Victim.Item]?
					public let position: ESI.Characters.Position?
					public let shipTypeID: Int
					
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
					
					
					public let allianceID: Int?
					public let characterID: Int?
					public let corporationID: Int?
					public let damageDone: Int
					public let factionID: Int?
					public let finalBlow: Bool
					public let securityStatus: Double
					public let shipTypeID: Int?
					public let weaponTypeID: Int?
					
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
				
				public struct Success: Codable, Hashable {
					
					
					public let attackers: [ESI.Killmails.KillmailID.KillmailHash.Attacker]
					public let killmailID: Int
					public let killmailTime: Date
					public let moonID: Int?
					public let solarSystemID: Int
					public let victim: ESI.Killmails.KillmailID.KillmailHash.Victim
					public let warID: Int?
					
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
				
			}
			
			
			
		}
		
		
		
	}
	
}
