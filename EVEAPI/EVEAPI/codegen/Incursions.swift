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
		
		
		public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[Success]>, AFError> {
			do {
				
				
				
				
				var headers = HTTPHeaders()
				headers["Accept"] = "application/json"
				
				
				var query = [URLQueryItem]()
				query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
				
				
				let url = try route.asURL()
				var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
				components.queryItems = query
				
				let publisher = esi.session.publisher(components,
				method: .get,
				encoding: URLEncoding.default,
				headers: headers,
				interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
				if let progress = progress {
					return publisher
					.downloadProgress(closure: progress)
					.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
					.eraseToAnyPublisher()
				}
				else {
					return publisher
					.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
					.eraseToAnyPublisher()
				}
			}
			catch {
				return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
			}
		}
		
		
		
		
		
		
		public struct Success: Codable, Hashable {
			
			
			public var constellationID: Int
			public var factionID: Int
			public var hasBoss: Bool
			public var infestedSolarSystems: [Int]
			public var influence: Double
			public var stagingSolarSystemID: Int
			public var state: ESI.Incursions.State
			public var type: String
			public init(constellationID: Int, factionID: Int, hasBoss: Bool, infestedSolarSystems: [Int], influence: Double, stagingSolarSystemID: Int, state: ESI.Incursions.State, type: String) {
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
					return nil
				}
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
		
	}
	
}
