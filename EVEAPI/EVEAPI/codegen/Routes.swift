import Foundation
import Alamofire


public extension ESI {
	public var routes: Routes {
		return Routes(sessionManager: self)
	}
	
	class Routes {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		@discardableResult
		public func getRoute(avoid: [Int]? = nil, connections: [[Int]]? = nil, destination: Int, flag: Routes.Flag? = nil, ifNoneMatch: String? = nil, origin: Int) -> Future<ESI.Result<[Int]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Int]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(describing: v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			if let v = avoid?.httpQuery {
				query.append(URLQueryItem(name: "avoid", value: v))
			}
			if let v = connections?.httpQuery {
				query.append(URLQueryItem(name: "connections", value: v))
			}
			if let v = flag?.httpQuery {
				query.append(URLQueryItem(name: "flag", value: v))
			}
			
			let url = session!.baseURL + "/v1/route/\(origin)/\(destination)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Int]>) in
					promise.set(result: response.result, cached: 86400.0)
					session = nil
				}
			}
			return promise.future
		}
		
		
		public enum Flag: String, Codable, HTTPQueryable {
			case insecure = "insecure"
			case secure = "secure"
			case shortest = "shortest"
			
			public var httpQuery: String? {
				return rawValue
			}
			
		}
		
		
		public struct GetRouteOriginDestinationNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Routes.GetRouteOriginDestinationNotFound, rhs: Routes.GetRouteOriginDestinationNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
