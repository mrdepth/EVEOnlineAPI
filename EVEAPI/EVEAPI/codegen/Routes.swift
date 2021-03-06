import Foundation
import Alamofire
import Futures


public extension ESI {
	var routes: Routes {
		return Routes(esi: self)
	}
	
	struct Routes {
		let esi: ESI
		
		@discardableResult
		public func getRoute(avoid: [Int]? = nil, connections: [[Int]]? = nil, destination: Int, flag: Routes.Flag? = nil, ifNoneMatch: String? = nil, origin: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Int]>> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = avoid?.httpQuery {
				query.append(URLQueryItem(name: "avoid", value: v))
			}
			if let v = connections?.httpQuery {
				query.append(URLQueryItem(name: "connections", value: v))
			}
			if let v = flag?.httpQuery {
				query.append(URLQueryItem(name: "flag", value: v))
			}
			
			let url = esi.baseURL + "/route/\(origin)/\(destination)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<[Int]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<[Int]>) in
				promise.set(response: response, cached: 86400.0)
			}
			return promise.future
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
		
		
		public enum Flag: String, Codable, HTTPQueryable {
			case insecure = "insecure"
			case secure = "secure"
			case shortest = "shortest"
			
			public var httpQuery: String? {
				return rawValue
			}
			
		}
		
		
	}
	
}
