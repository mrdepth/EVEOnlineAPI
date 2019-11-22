import Foundation
import Alamofire
import Combine


extension ESI {
	public var incursions: Incursions {
		return Incursions(esi: self, route: .path("incursions", next: .root(ESI.apiURL)))
	}
	
	public struct Incursions {
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
		
		
		
		
		
		
		public enum State: String, Codable, CustomStringConvertible {
			case withdrawing
			case mobilizing
			case established
			
			public var description: String {
				return rawValue
			}
			
		}
		
		public struct Success: Codable, Hashable {
			
			
			public let constellationID: Int
			public let factionID: Int
			public let hasBoss: Bool
			public let infestedSolarSystems: [Int]
			public let influence: Double
			public let stagingSolarSystemID: Int
			public let state: ESI.Incursions.State
			public let type: String
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case constellationID = "constellation_id"
				case factionID = "faction_id"
				case hasBoss = "has_boss"
				case infestedSolarSystems = "infested_solar_systems"
				case influence
				case stagingSolarSystemID = "staging_solar_system_id"
				case state
				case type
				
				var dateFormatter: DateFormatter? {
					return nil
				}
			}
		}
		
	}
	
}
