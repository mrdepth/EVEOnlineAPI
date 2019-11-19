import Foundation
import Alamofire
import Combine


extension ESI {
	public var incursions: Incursions {
		return Incursions(esi: self)
	}
	
	public struct Incursions {
		let esi: ESI
		
		
		public func listIncursions(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Incursions.Incursion], AFError> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/incursions/")
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
		
		
		public struct Incursion: Codable, Hashable {
			
			public enum State: String, Codable, CustomStringConvertible {
				case established = "established"
				case mobilizing = "mobilizing"
				case withdrawing = "withdrawing"
				
				public var description: String {
					return rawValue
				}
				
			}
			
			public var constellationID: Int
			public var factionID: Int
			public var hasBoss: Bool
			public var infestedSolarSystems: [Int]
			public var influence: Float
			public var stagingSolarSystemID: Int
			public var state: Incursions.Incursion.State
			public var type: String
			
			public init(constellationID: Int, factionID: Int, hasBoss: Bool, infestedSolarSystems: [Int], influence: Float, stagingSolarSystemID: Int, state: Incursions.Incursion.State, type: String) {
				self.constellationID = constellationID
				self.factionID = factionID
				self.hasBoss = hasBoss
				self.infestedSolarSystems = infestedSolarSystems
				self.influence = influence
				self.stagingSolarSystemID = stagingSolarSystemID
				self.state = state
				self.type = type
			}
			
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
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
	}
	
}
