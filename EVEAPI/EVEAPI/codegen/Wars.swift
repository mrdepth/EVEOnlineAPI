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
				
				
				public let aggressor: ESI.Wars.WarID.Aggressor
				public let allies: [ESI.Wars.WarID.Ally]?
				public let declared: Date
				public let defender: ESI.Wars.WarID.Defender
				public let finished: Date?
				public let id: Int
				public let mutual: Bool
				public let openForAllies: Bool
				public let retracted: Date?
				public let started: Date?
				
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
			
			public struct Defender: Codable, Hashable {
				
				
				public let allianceID: Int?
				public let corporationID: Int?
				public let iskDestroyed: Double
				public let shipsKilled: Int
				
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
			
			public struct Aggressor: Codable, Hashable {
				
				
				public let allianceID: Int?
				public let corporationID: Int?
				public let iskDestroyed: Double
				public let shipsKilled: Int
				
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
				
				
				public let allianceID: Int?
				public let corporationID: Int?
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case allianceID = "alliance_id"
					case corporationID = "corporation_id"
					
					var dateFormatter: DateFormatter? {
						return nil
					}
				}
			}
			
		}
		
		
		
	}
	
}
