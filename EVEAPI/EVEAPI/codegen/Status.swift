import Foundation
import Alamofire


public extension ESI {
	public var status: Status {
		return Status(sessionManager: self)
	}
	
	class Status {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		@discardableResult
		public func retrieveTheUptimeAndPlayerCounts(ifNoneMatch: String? = nil) -> Future<ESI.Result<Status.ServerStatus>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<Status.ServerStatus>>()
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
			
			
			let url = session!.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Status.ServerStatus>) in
					promise.set(result: response.result, cached: 30.0)
					session = nil
				}
			}
			return promise.future
		}
		
		
		public struct ServerStatus: Codable, Hashable {
			
			
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
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: players.hashValue)
				hashCombine(seed: &hash, value: serverVersion.hashValue)
				hashCombine(seed: &hash, value: startTime.hashValue)
				hashCombine(seed: &hash, value: vip?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Status.ServerStatus, rhs: Status.ServerStatus) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case players
				case serverVersion = "server_version"
				case startTime = "start_time"
				case vip
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .startTime: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
	}
	
}
