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
		
		public func getRoute(avoid: [Int]? = nil, connections: [[Int]]? = nil, destination: Int, flag: Routes.Flag? = nil, origin: Int, completionBlock:((Result<[Int]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
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
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Int]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		public enum Flag: String, JSONCoding, HTTPQueryable {
			case insecure = "insecure"
			case secure = "secure"
			case shortest = "shortest"
			
			public init() {
				self = .shortest
			}
			
			public var json: Any {
				return self.rawValue
			}
			
			public init(json: Any) throws {
				guard let s = json as? String, let v = Flag(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				self = v
			}
			
			public var httpQuery: String? {
				return rawValue
			}
			
		}
		
		
		@objc(ESIRoutesGetRouteOriginDestinationNotFound) public class GetRouteOriginDestinationNotFound: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.error?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Routes.GetRouteOriginDestinationNotFound, rhs: Routes.GetRouteOriginDestinationNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Routes.GetRouteOriginDestinationNotFound) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Routes.GetRouteOriginDestinationNotFound(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetRouteOriginDestinationNotFound)?.hashValue == hashValue
			}
			
		}
		
		
	}
	
}
