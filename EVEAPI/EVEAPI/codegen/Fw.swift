import Foundation
import Alamofire
import Combine


extension ESI {
	public var fw: Fw {
		return Fw(esi: self, route: .path("fw", next: .root(ESI.apiURL)))
	}
	
	public struct Fw {
		let esi: ESI
		let route: APIRoute
		
		
		
		public func leaderboards() -> Leaderboards {
			Leaderboards(esi: esi, route: .path("leaderboards", next: route))
		}
		public func stats() -> Stats {
			Stats(esi: esi, route: .path("stats", next: route))
		}
		public func systems() -> Systems {
			Systems(esi: esi, route: .path("systems", next: route))
		}
		public func wars() -> Wars {
			Wars(esi: esi, route: .path("wars", next: route))
		}
		
		public struct Leaderboards {
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
			
			
			public func characters() -> Characters {
				Characters(esi: esi, route: .path("characters", next: route))
			}
			public func corporations() -> Corporations {
				Corporations(esi: esi, route: .path("corporations", next: route))
			}
			
			public struct Characters {
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
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public var kills: ESI.Fw.Leaderboards.Characters.Kills
					public var victoryPoints: ESI.Fw.Leaderboards.Characters.VictoryPoints
					public init(kills: ESI.Fw.Leaderboards.Characters.Kills, victoryPoints: ESI.Fw.Leaderboards.Characters.VictoryPoints) {
						self.kills = kills
						self.victoryPoints = victoryPoints
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case kills
						case victoryPoints = "victory_points"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct Kills: Codable, Hashable {
					
					public struct LastWeekLastWeek: Codable, Hashable {
						
						
						public var amount: Int?
						public var characterID: Int?
						public init(amount: Int?, characterID: Int?) {
							self.amount = amount
							self.characterID = characterID
						}
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case amount
							case characterID = "character_id"
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
					public struct YesterdayYesterday: Codable, Hashable {
						
						
						public var amount: Int?
						public var characterID: Int?
						public init(amount: Int?, characterID: Int?) {
							self.amount = amount
							self.characterID = characterID
						}
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case amount
							case characterID = "character_id"
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
					public struct ActiveTotalActiveTotal: Codable, Hashable {
						
						
						public var amount: Int?
						public var characterID: Int?
						public init(amount: Int?, characterID: Int?) {
							self.amount = amount
							self.characterID = characterID
						}
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case amount
							case characterID = "character_id"
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
					public var activeTotal: [ESI.Fw.Leaderboards.Characters.Kills.ActiveTotalActiveTotal]
					public var lastWeek: [ESI.Fw.Leaderboards.Characters.Kills.LastWeekLastWeek]
					public var yesterday: [ESI.Fw.Leaderboards.Characters.Kills.YesterdayYesterday]
					public init(activeTotal: [ESI.Fw.Leaderboards.Characters.Kills.ActiveTotalActiveTotal], lastWeek: [ESI.Fw.Leaderboards.Characters.Kills.LastWeekLastWeek], yesterday: [ESI.Fw.Leaderboards.Characters.Kills.YesterdayYesterday]) {
						self.activeTotal = activeTotal
						self.lastWeek = lastWeek
						self.yesterday = yesterday
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case activeTotal = "active_total"
						case lastWeek = "last_week"
						case yesterday
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct VictoryPoints: Codable, Hashable {
					
					public struct LastWeekLastWeek1: Codable, Hashable {
						
						
						public var amount: Int?
						public var characterID: Int?
						public init(amount: Int?, characterID: Int?) {
							self.amount = amount
							self.characterID = characterID
						}
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case amount
							case characterID = "character_id"
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
					public struct YesterdayYesterday1: Codable, Hashable {
						
						
						public var amount: Int?
						public var characterID: Int?
						public init(amount: Int?, characterID: Int?) {
							self.amount = amount
							self.characterID = characterID
						}
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case amount
							case characterID = "character_id"
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
					public struct ActiveTotalActiveTotal1: Codable, Hashable {
						
						
						public var amount: Int?
						public var characterID: Int?
						public init(amount: Int?, characterID: Int?) {
							self.amount = amount
							self.characterID = characterID
						}
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case amount
							case characterID = "character_id"
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
					public var activeTotal: [ESI.Fw.Leaderboards.Characters.VictoryPoints.ActiveTotalActiveTotal1]
					public var lastWeek: [ESI.Fw.Leaderboards.Characters.VictoryPoints.LastWeekLastWeek1]
					public var yesterday: [ESI.Fw.Leaderboards.Characters.VictoryPoints.YesterdayYesterday1]
					public init(activeTotal: [ESI.Fw.Leaderboards.Characters.VictoryPoints.ActiveTotalActiveTotal1], lastWeek: [ESI.Fw.Leaderboards.Characters.VictoryPoints.LastWeekLastWeek1], yesterday: [ESI.Fw.Leaderboards.Characters.VictoryPoints.YesterdayYesterday1]) {
						self.activeTotal = activeTotal
						self.lastWeek = lastWeek
						self.yesterday = yesterday
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case activeTotal = "active_total"
						case lastWeek = "last_week"
						case yesterday
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
			}
			
			public struct Corporations {
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
				
				
				
				
				
				
				public struct VictoryPoints: Codable, Hashable {
					
					public struct LastWeekLastWeek1: Codable, Hashable {
						
						
						public var amount: Int?
						public var corporationID: Int?
						public init(amount: Int?, corporationID: Int?) {
							self.amount = amount
							self.corporationID = corporationID
						}
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case amount
							case corporationID = "corporation_id"
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
					public struct YesterdayYesterday1: Codable, Hashable {
						
						
						public var amount: Int?
						public var corporationID: Int?
						public init(amount: Int?, corporationID: Int?) {
							self.amount = amount
							self.corporationID = corporationID
						}
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case amount
							case corporationID = "corporation_id"
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
					public struct ActiveTotalActiveTotal1: Codable, Hashable {
						
						
						public var amount: Int?
						public var corporationID: Int?
						public init(amount: Int?, corporationID: Int?) {
							self.amount = amount
							self.corporationID = corporationID
						}
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case amount
							case corporationID = "corporation_id"
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
					public var activeTotal: [ESI.Fw.Leaderboards.Corporations.VictoryPoints.ActiveTotalActiveTotal1]
					public var lastWeek: [ESI.Fw.Leaderboards.Corporations.VictoryPoints.LastWeekLastWeek1]
					public var yesterday: [ESI.Fw.Leaderboards.Corporations.VictoryPoints.YesterdayYesterday1]
					public init(activeTotal: [ESI.Fw.Leaderboards.Corporations.VictoryPoints.ActiveTotalActiveTotal1], lastWeek: [ESI.Fw.Leaderboards.Corporations.VictoryPoints.LastWeekLastWeek1], yesterday: [ESI.Fw.Leaderboards.Corporations.VictoryPoints.YesterdayYesterday1]) {
						self.activeTotal = activeTotal
						self.lastWeek = lastWeek
						self.yesterday = yesterday
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case activeTotal = "active_total"
						case lastWeek = "last_week"
						case yesterday
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct Kills: Codable, Hashable {
					
					public struct LastWeekLastWeek: Codable, Hashable {
						
						
						public var amount: Int?
						public var corporationID: Int?
						public init(amount: Int?, corporationID: Int?) {
							self.amount = amount
							self.corporationID = corporationID
						}
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case amount
							case corporationID = "corporation_id"
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
					public struct YesterdayYesterday: Codable, Hashable {
						
						
						public var amount: Int?
						public var corporationID: Int?
						public init(amount: Int?, corporationID: Int?) {
							self.amount = amount
							self.corporationID = corporationID
						}
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case amount
							case corporationID = "corporation_id"
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
					public struct ActiveTotalActiveTotal: Codable, Hashable {
						
						
						public var amount: Int?
						public var corporationID: Int?
						public init(amount: Int?, corporationID: Int?) {
							self.amount = amount
							self.corporationID = corporationID
						}
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case amount
							case corporationID = "corporation_id"
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
					public var activeTotal: [ESI.Fw.Leaderboards.Corporations.Kills.ActiveTotalActiveTotal]
					public var lastWeek: [ESI.Fw.Leaderboards.Corporations.Kills.LastWeekLastWeek]
					public var yesterday: [ESI.Fw.Leaderboards.Corporations.Kills.YesterdayYesterday]
					public init(activeTotal: [ESI.Fw.Leaderboards.Corporations.Kills.ActiveTotalActiveTotal], lastWeek: [ESI.Fw.Leaderboards.Corporations.Kills.LastWeekLastWeek], yesterday: [ESI.Fw.Leaderboards.Corporations.Kills.YesterdayYesterday]) {
						self.activeTotal = activeTotal
						self.lastWeek = lastWeek
						self.yesterday = yesterday
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case activeTotal = "active_total"
						case lastWeek = "last_week"
						case yesterday
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct Success: Codable, Hashable {
					
					
					public var kills: ESI.Fw.Leaderboards.Corporations.Kills
					public var victoryPoints: ESI.Fw.Leaderboards.Corporations.VictoryPoints
					public init(kills: ESI.Fw.Leaderboards.Corporations.Kills, victoryPoints: ESI.Fw.Leaderboards.Corporations.VictoryPoints) {
						self.kills = kills
						self.victoryPoints = victoryPoints
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case kills
						case victoryPoints = "victory_points"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
			}
			
			
			public struct VictoryPoints: Codable, Hashable {
				
				public struct ActiveTotalActiveTotal1: Codable, Hashable {
					
					
					public var amount: Int?
					public var factionID: Int?
					public init(amount: Int?, factionID: Int?) {
						self.amount = amount
						self.factionID = factionID
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case amount
						case factionID = "faction_id"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct YesterdayYesterday1: Codable, Hashable {
					
					
					public var amount: Int?
					public var factionID: Int?
					public init(amount: Int?, factionID: Int?) {
						self.amount = amount
						self.factionID = factionID
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case amount
						case factionID = "faction_id"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct LastWeekLastWeek1: Codable, Hashable {
					
					
					public var amount: Int?
					public var factionID: Int?
					public init(amount: Int?, factionID: Int?) {
						self.amount = amount
						self.factionID = factionID
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case amount
						case factionID = "faction_id"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public var activeTotal: [ESI.Fw.Leaderboards.VictoryPoints.ActiveTotalActiveTotal1]
				public var lastWeek: [ESI.Fw.Leaderboards.VictoryPoints.LastWeekLastWeek1]
				public var yesterday: [ESI.Fw.Leaderboards.VictoryPoints.YesterdayYesterday1]
				public init(activeTotal: [ESI.Fw.Leaderboards.VictoryPoints.ActiveTotalActiveTotal1], lastWeek: [ESI.Fw.Leaderboards.VictoryPoints.LastWeekLastWeek1], yesterday: [ESI.Fw.Leaderboards.VictoryPoints.YesterdayYesterday1]) {
					self.activeTotal = activeTotal
					self.lastWeek = lastWeek
					self.yesterday = yesterday
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case activeTotal = "active_total"
					case lastWeek = "last_week"
					case yesterday
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
			public struct Success: Codable, Hashable {
				
				
				public var kills: ESI.Fw.Leaderboards.Kills
				public var victoryPoints: ESI.Fw.Leaderboards.VictoryPoints
				public init(kills: ESI.Fw.Leaderboards.Kills, victoryPoints: ESI.Fw.Leaderboards.VictoryPoints) {
					self.kills = kills
					self.victoryPoints = victoryPoints
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case kills
					case victoryPoints = "victory_points"
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
			public struct Kills: Codable, Hashable {
				
				public struct ActiveTotalActiveTotal: Codable, Hashable {
					
					
					public var amount: Int?
					public var factionID: Int?
					public init(amount: Int?, factionID: Int?) {
						self.amount = amount
						self.factionID = factionID
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case amount
						case factionID = "faction_id"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct YesterdayYesterday: Codable, Hashable {
					
					
					public var amount: Int?
					public var factionID: Int?
					public init(amount: Int?, factionID: Int?) {
						self.amount = amount
						self.factionID = factionID
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case amount
						case factionID = "faction_id"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct LastWeekLastWeek: Codable, Hashable {
					
					
					public var amount: Int?
					public var factionID: Int?
					public init(amount: Int?, factionID: Int?) {
						self.amount = amount
						self.factionID = factionID
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case amount
						case factionID = "faction_id"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public var activeTotal: [ESI.Fw.Leaderboards.Kills.ActiveTotalActiveTotal]
				public var lastWeek: [ESI.Fw.Leaderboards.Kills.LastWeekLastWeek]
				public var yesterday: [ESI.Fw.Leaderboards.Kills.YesterdayYesterday]
				public init(activeTotal: [ESI.Fw.Leaderboards.Kills.ActiveTotalActiveTotal], lastWeek: [ESI.Fw.Leaderboards.Kills.LastWeekLastWeek], yesterday: [ESI.Fw.Leaderboards.Kills.YesterdayYesterday]) {
					self.activeTotal = activeTotal
					self.lastWeek = lastWeek
					self.yesterday = yesterday
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case activeTotal = "active_total"
					case lastWeek = "last_week"
					case yesterday
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
		}
		
		public struct Stats {
			let esi: ESI
			let route: APIRoute
			
			
			public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
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
				
				
				public var factionID: Int
				public var kills: ESI.Fw.Kills
				public var pilots: Int
				public var systemsControlled: Int
				public var victoryPoints: ESI.Fw.VictoryPoints
				public init(factionID: Int, kills: ESI.Fw.Kills, pilots: Int, systemsControlled: Int, victoryPoints: ESI.Fw.VictoryPoints) {
					self.factionID = factionID
					self.kills = kills
					self.pilots = pilots
					self.systemsControlled = systemsControlled
					self.victoryPoints = victoryPoints
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case factionID = "faction_id"
					case kills
					case pilots
					case systemsControlled = "systems_controlled"
					case victoryPoints = "victory_points"
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
		}
		
		public struct Systems {
			let esi: ESI
			let route: APIRoute
			
			
			public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
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
				
				
				public var contested: ESI.Fw.Systems.Contested
				public var occupierFactionID: Int
				public var ownerFactionID: Int
				public var solarSystemID: Int
				public var victoryPoints: Int
				public var victoryPointsThreshold: Int
				public init(contested: ESI.Fw.Systems.Contested, occupierFactionID: Int, ownerFactionID: Int, solarSystemID: Int, victoryPoints: Int, victoryPointsThreshold: Int) {
					self.contested = contested
					self.occupierFactionID = occupierFactionID
					self.ownerFactionID = ownerFactionID
					self.solarSystemID = solarSystemID
					self.victoryPoints = victoryPoints
					self.victoryPointsThreshold = victoryPointsThreshold
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case contested
					case occupierFactionID = "occupier_faction_id"
					case ownerFactionID = "owner_faction_id"
					case solarSystemID = "solar_system_id"
					case victoryPoints = "victory_points"
					case victoryPointsThreshold = "victory_points_threshold"
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
			public enum Contested: String, Codable, CustomStringConvertible {
				case captured
				case contested
				case uncontested
				case vulnerable
				
				public var description: String {
					return rawValue
				}
				
			}
			
		}
		
		public struct Wars {
			let esi: ESI
			let route: APIRoute
			
			
			public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
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
				
				
				public var againstID: Int
				public var factionID: Int
				public init(againstID: Int, factionID: Int) {
					self.againstID = againstID
					self.factionID = factionID
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case againstID = "against_id"
					case factionID = "faction_id"
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
		}
		
		
		public struct VictoryPoints: Codable, Hashable {
			
			
			public var lastWeek: Int
			public var total: Int
			public var yesterday: Int
			public init(lastWeek: Int, total: Int, yesterday: Int) {
				self.lastWeek = lastWeek
				self.total = total
				self.yesterday = yesterday
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case lastWeek = "last_week"
				case total
				case yesterday
				
				var dateFormatter: DateFormatter? {
					return nil
				}
			}
		}
		
		public struct Kills: Codable, Hashable {
			
			
			public var lastWeek: Int
			public var total: Int
			public var yesterday: Int
			public init(lastWeek: Int, total: Int, yesterday: Int) {
				self.lastWeek = lastWeek
				self.total = total
				self.yesterday = yesterday
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case lastWeek = "last_week"
				case total
				case yesterday
				
				var dateFormatter: DateFormatter? {
					return nil
				}
			}
		}
		
	}
	
}
