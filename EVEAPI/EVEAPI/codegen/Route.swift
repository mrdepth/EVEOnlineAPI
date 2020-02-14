import Foundation
import Alamofire
import Combine


extension ESI {
	public var route: Route {
		return Route(esi: self, route: .path("route", next: .root(ESI.apiURL)))
	}
	
	public struct Route {
		let esi: ESI
		let route: APIRoute
		
		
		
		public func origin(_ value: Int) -> Origin {
			Origin(esi: esi, route: .parameter(value, next: route))
		}
		
		public struct Origin {
			let esi: ESI
			let route: APIRoute
			
			
			
			public func destination(_ value: Int) -> Destination {
				Destination(esi: esi, route: .parameter(value, next: route))
			}
			
			public struct Destination {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(avoid: [Int]?, connections: [[Int]]?, flag: ESI.Route.Origin.Destination.Flag? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[Int]>, AFError> {
					do {
						
						
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						if let avoid = avoid {
							if !avoid.isEmpty {
								query.append(URLQueryItem(name: "avoid", value: avoid.lazy.map{$0.description}.joined(separator: ",")))
							}
						}
						if let connections = connections {
							if !connections.isEmpty {
								query.append(URLQueryItem(name: "connections", value: connections.lazy.map{$0.description}.joined(separator: ",")))
							}
						}
						if let flag = flag {
							query.append(URLQueryItem(name: "flag", value: flag.description))
						}
						
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
				
				
				
				
				
				
				public enum Flag: String, Codable, CustomStringConvertible {
					case shortest
					case secure
					case insecure
					
					public var description: String {
						return rawValue
					}
					
				}
				
			}
			
			
			
		}
		
		
		
	}
	
}
