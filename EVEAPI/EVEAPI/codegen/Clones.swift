import Foundation
import Alamofire


public extension ESI {
	public var clones: Clones {
		return Clones(sessionManager: self)
	}
	
	class Clones {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		public func getActiveImplants(characterID: Int, completionBlock:((Result<[Int]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-clones.read_implants.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/implants/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Int]>) in
					completionBlock?(response.result)
					session = nil
				}
			}
		}
		
		public func getClones(characterID: Int, completionBlock:((Result<Clones.JumpClones>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-clones.read_clones.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v3/characters/\(characterID)/clones/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Clones.JumpClones>) in
					completionBlock?(response.result)
					session = nil
				}
			}
		}
		
		
		public struct JumpClones: Codable, Hashable {
			
			public struct Location: Codable, Hashable {
				
				
				public var locationID: Int64?
				public var locationType: Clones.JumpClones.LocationType?
				
				public init(locationID: Int64?, locationType: Clones.JumpClones.LocationType?) {
					self.locationID = locationID
					self.locationType = locationType
				}
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: locationID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: locationType?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: Clones.JumpClones.Location, rhs: Clones.JumpClones.Location) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case locationID = "location_id"
					case locationType = "location_type"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public enum LocationType: String, Codable, HTTPQueryable {
				case station = "station"
				case structure = "structure"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public struct JumpClone: Codable, Hashable {
				
				
				public var implants: [Int]
				public var jumpCloneID: Int
				public var locationID: Int64
				public var locationType: Clones.JumpClones.LocationType
				public var name: String?
				
				public init(implants: [Int], jumpCloneID: Int, locationID: Int64, locationType: Clones.JumpClones.LocationType, name: String?) {
					self.implants = implants
					self.jumpCloneID = jumpCloneID
					self.locationID = locationID
					self.locationType = locationType
					self.name = name
				}
				
				public var hashValue: Int {
					var hash: Int = 0
					self.implants.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					hashCombine(seed: &hash, value: jumpCloneID.hashValue)
					hashCombine(seed: &hash, value: locationID.hashValue)
					hashCombine(seed: &hash, value: locationType.hashValue)
					hashCombine(seed: &hash, value: name?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: Clones.JumpClones.JumpClone, rhs: Clones.JumpClones.JumpClone) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case implants
					case jumpCloneID = "jump_clone_id"
					case locationID = "location_id"
					case locationType = "location_type"
					case name
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public var homeLocation: Clones.JumpClones.Location?
			public var jumpClones: [Clones.JumpClones.JumpClone]
			public var lastCloneJumpDate: Date?
			public var lastStationChangeDate: Date?
			
			public init(homeLocation: Clones.JumpClones.Location?, jumpClones: [Clones.JumpClones.JumpClone], lastCloneJumpDate: Date?, lastStationChangeDate: Date?) {
				self.homeLocation = homeLocation
				self.jumpClones = jumpClones
				self.lastCloneJumpDate = lastCloneJumpDate
				self.lastStationChangeDate = lastStationChangeDate
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: homeLocation?.hashValue ?? 0)
				self.jumpClones.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: lastCloneJumpDate?.hashValue ?? 0)
				hashCombine(seed: &hash, value: lastStationChangeDate?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Clones.JumpClones, rhs: Clones.JumpClones) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case homeLocation = "home_location"
				case jumpClones = "jump_clones"
				case lastCloneJumpDate = "last_clone_jump_date"
				case lastStationChangeDate = "last_station_change_date"
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .lastCloneJumpDate: return DateFormatter.esiDateTimeFormatter
						case .lastStationChangeDate: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
	}
	
}
