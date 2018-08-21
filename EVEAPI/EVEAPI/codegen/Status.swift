import Foundation
import Alamofire
import Futures


public extension ESI {
	public var status: Status {
		return Status(esi: self)
	}
	
	class Status {
		weak var esi: ESI?
		
		init(esi: ESI) {
			self.esi = esi
		}
		
		@discardableResult
		public func retrieveTheUptimeAndPlayerCounts(ifNoneMatch: String? = nil) -> Future<ESI.Result<Status.ServerStatus>> {
			guard let esi = self.esi else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<Status.ServerStatus>>()
			esi.perform { [weak esi] () -> DataRequest? in
				return esi?.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Status.ServerStatus>) in
					promise.set(result: response.result, cached: 30.0)
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
