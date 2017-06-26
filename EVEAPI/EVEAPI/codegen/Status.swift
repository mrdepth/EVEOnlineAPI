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
		
		public func retrieveTheUptimeAndPlayerCounts(completionBlock:((Result<Status.GetStatusOk>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Status.GetStatusOk>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		public class GetStatusOk: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var players: Int = Int()
			public var serverVersion: String = String()
			public var startTime: Date = Date()
			public var vip: Bool? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let players = dictionary["players"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.players = players
				guard let serverVersion = dictionary["server_version"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.serverVersion = serverVersion
				guard let startTime = DateFormatter.esiDateTimeFormatter.date(from: dictionary["start_time"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.startTime = startTime
				vip = dictionary["vip"] as? Bool
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				players = aDecoder.decodeInteger(forKey: "players")
				serverVersion = aDecoder.decodeObject(forKey: "server_version") as? String ?? String()
				startTime = aDecoder.decodeObject(forKey: "start_time") as? Date ?? Date()
				vip = aDecoder.containsValue(forKey: "vip") ? aDecoder.decodeBool(forKey: "vip") : nil
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(players, forKey: "players")
				aCoder.encode(serverVersion, forKey: "server_version")
				aCoder.encode(startTime, forKey: "start_time")
				if let v = vip {
					aCoder.encode(v, forKey: "vip")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["players"] = players.json
				json["server_version"] = serverVersion.json
				json["start_time"] = startTime.json
				if let v = vip?.json {
					json["vip"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: players.hashValue)
				hashCombine(seed: &hash, value: serverVersion.hashValue)
				hashCombine(seed: &hash, value: startTime.hashValue)
				hashCombine(seed: &hash, value: vip?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Status.GetStatusOk, rhs: Status.GetStatusOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Status.GetStatusOk) {
				players = other.players
				serverVersion = other.serverVersion
				startTime = other.startTime
				vip = other.vip
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Status.GetStatusOk(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetStatusOk)?.hashValue == hashValue
			}
			
		}
		
		
	}
	
}
