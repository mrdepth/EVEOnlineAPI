import Foundation
import Alamofire
import Combine


extension ESI {
	public var wars: Wars {
		return Wars(esi: self)
	}
	
	public struct Wars {
		let esi: ESI
		
		
		public func listWars(maxWarID: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Int], AFError> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = maxWarID?.description {
				query.append(URLQueryItem(name: "max_war_id", value: v.lazy.map{$0.description}.joined(separator: ",")))
			}
			
			        let url = ESI.apiURL.appendingPathComponent("/wars/")
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
		
		
		public func getWarInformation(warID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Wars.WarInformation, AFError> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/wars/\(warID)/")
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
		
		
		public func listKillsForWar(page: Int? = nil, warID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Wars.Kills], AFError> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = page?.description {
				query.append(URLQueryItem(name: "page", value: v.lazy.map{$0.description}.joined(separator: ",")))
			}
			
			        let url = ESI.apiURL.appendingPathComponent("/wars/\(warID)/killmails/")
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
		
		
		public struct GetWarsWarIDUnprocessableEntity: Codable, Hashable {
			
			
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
		
		
		public struct GetWarsWarIDKillmailsUnprocessableEntity: Codable, Hashable {
			
			
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
		
		
		public struct WarInformation: Codable, Hashable {
			
			public struct GetWarsWarIDAllies: Codable, Hashable {
				
				
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
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct GetWarsWarIDDefender: Codable, Hashable {
				
				
				public var allianceID: Int?
				public var corporationID: Int?
				public var iskDestroyed: Float
				public var shipsKilled: Int
				
				public init(allianceID: Int?, corporationID: Int?, iskDestroyed: Float, shipsKilled: Int) {
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
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct GetWarsWarIDAggressor: Codable, Hashable {
				
				
				public var allianceID: Int?
				public var corporationID: Int?
				public var iskDestroyed: Float
				public var shipsKilled: Int
				
				public init(allianceID: Int?, corporationID: Int?, iskDestroyed: Float, shipsKilled: Int) {
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
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public var aggressor: Wars.WarInformation.GetWarsWarIDAggressor
			public var allies: [Wars.WarInformation.GetWarsWarIDAllies]?
			public var declared: Date
			public var defender: Wars.WarInformation.GetWarsWarIDDefender
			public var finished: Date?
			public var id: Int
			public var mutual: Bool
			public var openForAllies: Bool
			public var retracted: Date?
			public var started: Date?
			
			public init(aggressor: Wars.WarInformation.GetWarsWarIDAggressor, allies: [Wars.WarInformation.GetWarsWarIDAllies]?, declared: Date, defender: Wars.WarInformation.GetWarsWarIDDefender, finished: Date?, id: Int, mutual: Bool, openForAllies: Bool, retracted: Date?, started: Date?) {
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
						case .declared: return DateFormatter.esiDateTimeFormatter
						case .finished: return DateFormatter.esiDateTimeFormatter
						case .retracted: return DateFormatter.esiDateTimeFormatter
						case .started: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct Kills: Codable, Hashable {
			
			
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
