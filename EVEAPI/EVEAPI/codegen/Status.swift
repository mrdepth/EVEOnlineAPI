import Foundation
import Alamofire
import Combine


extension ESI {
	public var status: Status {
		return Status(esi: self, route: .path("status", next: .root(ESI.apiURL)))
	}
	
	public struct Status {
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
			
			
			public var players: Int
			public var serverVersion: String
			public var startTime: Date
			public var vip: Bool?
			public init(players: Int, serverVersion: String, startTime: Date, vip: Bool?) {
				self.players = players
				self.serverVersion = serverVersion
				self.startTime = startTime
				self.vip = vip
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case players
				case serverVersion = "server_version"
				case startTime = "start_time"
				case vip
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .startTime:
						return DateFormatter.esiDateTimeFormatter
						default:
						return nil
					}
				}
			}
		}
		
	}
	
}
