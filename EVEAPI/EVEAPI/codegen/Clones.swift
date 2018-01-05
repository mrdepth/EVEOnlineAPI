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
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
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
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Int]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getClones(characterID: Int, completionBlock:((Result<Clones.JumpClones>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
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
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Clones.JumpClones>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		public struct JumpClones: Codable, Hashable {
			
			public struct Location: Codable, Hashable {
				
				
				public let locationID: Int64?
				public let locationType: Clones.JumpClones.LocationType?
				
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
				
				
				public let implants: [Int]
				public let jumpCloneID: Int
				public let locationID: Int64
				public let locationType: Clones.JumpClones.LocationType
				public let name: String?
				
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
			
			public let homeLocation: Clones.JumpClones.Location?
			public let jumpClones: [Clones.JumpClones.JumpClone]
			public let lastCloneJumpDate: Date?
			public let lastStationChangeDate: Date?
			
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
