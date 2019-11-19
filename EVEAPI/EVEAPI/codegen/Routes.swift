import Foundation
import Alamofire
import Combine


extension ESI {
	public var routes: Routes {
		return Routes(esi: self)
	}
	
	public struct Routes {
		let esi: ESI
		
		
		public func getRoute(avoid: [Int]? = nil, connections: [[Int]]? = nil, destination: Int, flag: Routes.Flag? = nil, origin: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Int], AFError> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = avoid, !v.isEmpty {
				query.append(URLQueryItem(name: "avoid", value: v.lazy.map{$0.description}.joined(separator: ",")))
			}
			if let v = connections, !v.isEmpty {
				query.append(URLQueryItem(name: "connections", value: v.lazy.map{$0.description}.joined(separator: ",")))
			}
			if let v = flag?.description {
				query.append(URLQueryItem(name: "flag", value: v.lazy.map{$0.description}.joined(separator: ",")))
			}
			
			        let url = ESI.apiURL.appendingPathComponent("/route/\(origin)/\(destination)/")
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
		
		
		public enum Flag: String, Codable, CustomStringConvertible {
			case insecure = "insecure"
			case secure = "secure"
			case shortest = "shortest"
			
			public var description: String {
				return rawValue
			}
			
		}
		
		
		public struct GetRouteOriginDestinationNotFound: Codable, Hashable {
			
			
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
		
		
	}
	
}
