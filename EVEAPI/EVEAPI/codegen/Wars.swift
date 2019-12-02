import Foundation
import Alamofire
import Combine


extension ESI {
	public var wars: Wars {
		return Wars(esi: self, route: .path("wars", next: .root(ESI.apiURL)))
	}
	
	public struct Wars {
		let esi: ESI
		let route: APIRoute
		
		
		public func get(maxWarID: Int?, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Int], AFError> {
			do {
				
				
				
				
				var headers = HTTPHeaders()
				headers["Accept"] = "application/json"
				
				
				var query = [URLQueryItem]()
				query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
				if let maxWarID = maxWarID {
					query.append(URLQueryItem(name: "max_war_id", value: maxWarID.description))
				}
				
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
		
		
		public func warID(_ value: Int) -> WarID {
			WarID(esi: esi, route: .parameter(value, next: route))
		}
		
		public struct WarID {
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
			
			
			public func killmails() -> Killmails {
				Killmails(esi: esi, route: .path("killmails", next: route))
			}
			
			public struct Killmails {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Success], AFError> {
					do {
						
						
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						if let page = page {
							query.append(URLQueryItem(name: "page", value: page.description))
						}
						
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
				
				
				
				
				
				
				
			}
			
			
			public struct Success: Codable, Hashable {
				
				
				public var aggressor: ESI.Wars.WarID.Aggressor
				public var allies: [ESI.Wars.WarID.Ally]?
				public var declared: Date
				public var defender: ESI.Wars.WarID.Defender
				public var finished: Date?
				public var id: Int
				public var mutual: Bool
				public var openForAllies: Bool
				public var retracted: Date?
				public var started: Date?
				public init(aggressor: ESI.Wars.WarID.Aggressor, allies: [ESI.Wars.WarID.Ally]?, declared: Date, defender: ESI.Wars.WarID.Defender, finished: Date?, id: Int, mutual: Bool, openForAllies: Bool, retracted: Date?, started: Date?) {
					self.aggressor = aggressor
					self.allies = allies
					self.declared = declared
					self.defender = defender
					self.finished = finished
					self.id = id
					self.mutual = mutual
					self.openForAllies = openForAllies
					self.retracted = retracted
					self.started = started
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case aggressor
					case allies
					case declared
					case defender
					case finished
					case id
					case mutual
					case openForAllies = "open_for_allies"
					case retracted
					case started
					
					var dateFormatter: DateFormatter? {
						switch self {
							case .declared:
							return DateFormatter.esiDateTimeFormatter
							case .finished:
							return DateFormatter.esiDateTimeFormatter
							case .retracted:
							return DateFormatter.esiDateTimeFormatter
							case .started:
							return DateFormatter.esiDateTimeFormatter
							default:
							return nil
						}
					}
				}
			}
			
			public struct Aggressor: Codable, Hashable {
				
				
				public var allianceID: Int?
				public var corporationID: Int?
				public var iskDestroyed: Double
				public var shipsKilled: Int
				public init(allianceID: Int?, corporationID: Int?, iskDestroyed: Double, shipsKilled: Int) {
					self.allianceID = allianceID
					self.corporationID = corporationID
					self.iskDestroyed = iskDestroyed
					self.shipsKilled = shipsKilled
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case allianceID = "alliance_id"
					case corporationID = "corporation_id"
					case iskDestroyed = "isk_destroyed"
					case shipsKilled = "ships_killed"
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
			public struct Ally: Codable, Hashable {
				
				
				public var allianceID: Int?
				public var corporationID: Int?
				public init(allianceID: Int?, corporationID: Int?) {
					self.allianceID = allianceID
					self.corporationID = corporationID
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case allianceID = "alliance_id"
					case corporationID = "corporation_id"
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
			public struct Defender: Codable, Hashable {
				
				
				public var allianceID: Int?
				public var corporationID: Int?
				public var iskDestroyed: Double
				public var shipsKilled: Int
				public init(allianceID: Int?, corporationID: Int?, iskDestroyed: Double, shipsKilled: Int) {
					self.allianceID = allianceID
					self.corporationID = corporationID
					self.iskDestroyed = iskDestroyed
					self.shipsKilled = shipsKilled
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case allianceID = "alliance_id"
					case corporationID = "corporation_id"
					case iskDestroyed = "isk_destroyed"
					case shipsKilled = "ships_killed"
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
		}
		
		
		public struct Success: Codable, Hashable {
			
			
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
					return nil
				}
			}
		}
		
	}
	
}
