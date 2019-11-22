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
				
				
				
				
				
				
				public struct Kills: Codable, Hashable {
					
					public struct YesterdayYesterday: Codable, Hashable {
						
						
						public let amount: Int?
						public let characterID: Int?
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case amount
							case characterID = "character_id"
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
					public struct LastWeekLastWeek: Codable, Hashable {
						
						
						public let amount: Int?
						public let characterID: Int?
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case amount
							case characterID = "character_id"
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
					public struct ActiveTotalActiveTotal: Codable, Hashable {
						
						
						public let amount: Int?
						public let characterID: Int?
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case amount
							case characterID = "character_id"
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
					public let activeTotal: [ESI.Fw.Leaderboards.Characters.Kills.ActiveTotalActiveTotal]
					public let lastWeek: [ESI.Fw.Leaderboards.Characters.Kills.LastWeekLastWeek]
					public let yesterday: [ESI.Fw.Leaderboards.Characters.Kills.YesterdayYesterday]
					
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
					
					
					public let kills: ESI.Fw.Leaderboards.Characters.Kills
					public let victoryPoints: ESI.Fw.Leaderboards.Characters.VictoryPoints
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case kills
						case victoryPoints = "victory_points"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct VictoryPoints: Codable, Hashable {
					
					public struct ActiveTotalActiveTotal1: Codable, Hashable {
						
						
						public let amount: Int?
						public let characterID: Int?
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case amount
							case characterID = "character_id"
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
					public struct YesterdayYesterday1: Codable, Hashable {
						
						
						public let amount: Int?
						public let characterID: Int?
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case amount
							case characterID = "character_id"
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
					public struct LastWeekLastWeek1: Codable, Hashable {
						
						
						public let amount: Int?
						public let characterID: Int?
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case amount
							case characterID = "character_id"
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
					public let activeTotal: [ESI.Fw.Leaderboards.Characters.VictoryPoints.ActiveTotalActiveTotal1]
					public let lastWeek: [ESI.Fw.Leaderboards.Characters.VictoryPoints.LastWeekLastWeek1]
					public let yesterday: [ESI.Fw.Leaderboards.Characters.VictoryPoints.YesterdayYesterday1]
					
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
				
				
				
				
				
				
				public struct Kills: Codable, Hashable {
					
					public struct ActiveTotalActiveTotal: Codable, Hashable {
						
						
						public let amount: Int?
						public let corporationID: Int?
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case amount
							case corporationID = "corporation_id"
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
					public struct YesterdayYesterday: Codable, Hashable {
						
						
						public let amount: Int?
						public let corporationID: Int?
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case amount
							case corporationID = "corporation_id"
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
					public struct LastWeekLastWeek: Codable, Hashable {
						
						
						public let amount: Int?
						public let corporationID: Int?
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case amount
							case corporationID = "corporation_id"
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
					public let activeTotal: [ESI.Fw.Leaderboards.Corporations.Kills.ActiveTotalActiveTotal]
					public let lastWeek: [ESI.Fw.Leaderboards.Corporations.Kills.LastWeekLastWeek]
					public let yesterday: [ESI.Fw.Leaderboards.Corporations.Kills.YesterdayYesterday]
					
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
					
					
					public let kills: ESI.Fw.Leaderboards.Corporations.Kills
					public let victoryPoints: ESI.Fw.Leaderboards.Corporations.VictoryPoints
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case kills
						case victoryPoints = "victory_points"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct VictoryPoints: Codable, Hashable {
					
					public struct ActiveTotalActiveTotal1: Codable, Hashable {
						
						
						public let amount: Int?
						public let corporationID: Int?
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case amount
							case corporationID = "corporation_id"
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
					public struct YesterdayYesterday1: Codable, Hashable {
						
						
						public let amount: Int?
						public let corporationID: Int?
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case amount
							case corporationID = "corporation_id"
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
					public struct LastWeekLastWeek1: Codable, Hashable {
						
						
						public let amount: Int?
						public let corporationID: Int?
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case amount
							case corporationID = "corporation_id"
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
					public let activeTotal: [ESI.Fw.Leaderboards.Corporations.VictoryPoints.ActiveTotalActiveTotal1]
					public let lastWeek: [ESI.Fw.Leaderboards.Corporations.VictoryPoints.LastWeekLastWeek1]
					public let yesterday: [ESI.Fw.Leaderboards.Corporations.VictoryPoints.YesterdayYesterday1]
					
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
			
			
			public struct VictoryPoints: Codable, Hashable {
				
				public struct LastWeekLastWeek1: Codable, Hashable {
					
					
					public let amount: Int?
					public let factionID: Int?
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case amount
						case factionID = "faction_id"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct YesterdayYesterday1: Codable, Hashable {
					
					
					public let amount: Int?
					public let factionID: Int?
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case amount
						case factionID = "faction_id"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct ActiveTotalActiveTotal1: Codable, Hashable {
					
					
					public let amount: Int?
					public let factionID: Int?
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case amount
						case factionID = "faction_id"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public let activeTotal: [ESI.Fw.Leaderboards.VictoryPoints.ActiveTotalActiveTotal1]
				public let lastWeek: [ESI.Fw.Leaderboards.VictoryPoints.LastWeekLastWeek1]
				public let yesterday: [ESI.Fw.Leaderboards.VictoryPoints.YesterdayYesterday1]
				
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
				
				
				public let kills: ESI.Fw.Leaderboards.Kills
				public let victoryPoints: ESI.Fw.Leaderboards.VictoryPoints
				
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
					
					
					public let amount: Int?
					public let factionID: Int?
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case amount
						case factionID = "faction_id"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct YesterdayYesterday: Codable, Hashable {
					
					
					public let amount: Int?
					public let factionID: Int?
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case amount
						case factionID = "faction_id"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public struct LastWeekLastWeek: Codable, Hashable {
					
					
					public let amount: Int?
					public let factionID: Int?
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case amount
						case factionID = "faction_id"
						
						var dateFormatter: DateFormatter? {
							return nil
						}
					}
				}
				
				public let activeTotal: [ESI.Fw.Leaderboards.Kills.ActiveTotalActiveTotal]
				public let lastWeek: [ESI.Fw.Leaderboards.Kills.LastWeekLastWeek]
				public let yesterday: [ESI.Fw.Leaderboards.Kills.YesterdayYesterday]
				
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
				
				
				public let factionID: Int
				public let kills: ESI.Fw.Kills
				public let pilots: Int
				public let systemsControlled: Int
				public let victoryPoints: ESI.Fw.VictoryPoints
				
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
			
			
			
			
			
			
			public enum Contested: String, Codable, CustomStringConvertible {
				case captured
				case contested
				case uncontested
				case vulnerable
				
				public var description: String {
					return rawValue
				}
				
			}
			
			public struct Success: Codable, Hashable {
				
				
				public let contested: ESI.Fw.Systems.Contested
				public let occupierFactionID: Int
				public let ownerFactionID: Int
				public let solarSystemID: Int
				public let victoryPoints: Int
				public let victoryPointsThreshold: Int
				
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
				
				
				public let againstID: Int
				public let factionID: Int
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case againstID = "against_id"
					case factionID = "faction_id"
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
		}
		
		
		public struct Kills: Codable, Hashable {
			
			
			public let lastWeek: Int
			public let total: Int
			public let yesterday: Int
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case lastWeek = "last_week"
				case total
				case yesterday
				
				var dateFormatter: DateFormatter? {
					return nil
				}
			}
		}
		
		public struct VictoryPoints: Codable, Hashable {
			
			
			public let lastWeek: Int
			public let total: Int
			public let yesterday: Int
			
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
