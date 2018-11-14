import Foundation
import Alamofire
import Futures


public extension ESI {
	public var incursions: Incursions {
		return Incursions(esi: self)
	}
	
	struct Incursions {
		let esi: ESI
		
		@discardableResult
		public func listIncursions(ifNoneMatch: String? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Incursions.Incursion]>> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/incursions/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Incursions.Incursion]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Incursions.Incursion]>) in
				promise.set(response: response, cached: 300.0)
			}
			return promise.future
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
			
			public var constellationID: Int
			public var factionID: Int
			public var hasBoss: Bool
			public var infestedSolarSystems: [Int]
			public var influence: Float
			public var stagingSolarSystemID: Int
			public var state: Incursions.Incursion.State
			public var type: String
			
			public init(constellationID: Int, factionID: Int, hasBoss: Bool, infestedSolarSystems: [Int], influence: Float, stagingSolarSystemID: Int, state: Incursions.Incursion.State, type: String) {
				self.constellationID = constellationID
				self.factionID = factionID
				self.hasBoss = hasBoss
				self.infestedSolarSystems = infestedSolarSystems
				self.influence = influence
				self.stagingSolarSystemID = stagingSolarSystemID
				self.state = state
				self.type = type
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
