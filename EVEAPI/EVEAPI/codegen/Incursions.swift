import Foundation
import Alamofire


public extension ESI {
	public var incursions: Incursions {
		return Incursions(sessionManager: self)
	}
	
	class Incursions {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		public func listIncursions(completionBlock:((Result<[Incursions.Incursion]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/incursions/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Incursions.Incursion]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		public struct Incursion: Codable, Hashable {
			
			public enum State: String, Codable, HTTPQueryable {
				case established = "established"
				case mobilizing = "mobilizing"
				case withdrawing = "withdrawing"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public let constellationID: Int
			public let factionID: Int
			public let hasBoss: Bool
			public let infestedSolarSystems: [Int]
			public let influence: Float
			public let stagingSolarSystemID: Int
			public let state: Incursions.Incursion.State
			public let type: String
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: constellationID.hashValue)
				hashCombine(seed: &hash, value: factionID.hashValue)
				hashCombine(seed: &hash, value: hasBoss.hashValue)
				self.infestedSolarSystems.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: influence.hashValue)
				hashCombine(seed: &hash, value: stagingSolarSystemID.hashValue)
				hashCombine(seed: &hash, value: state.hashValue)
				hashCombine(seed: &hash, value: type.hashValue)
				return hash
			}
			
			public static func ==(lhs: Incursions.Incursion, rhs: Incursions.Incursion) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
	}
	
}
