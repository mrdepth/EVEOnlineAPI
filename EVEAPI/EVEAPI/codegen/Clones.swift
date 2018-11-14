import Foundation
import Alamofire
import Futures


public extension ESI {
	public var clones: Clones {
		return Clones(esi: self)
	}
	
	struct Clones {
		let esi: ESI
		
		@discardableResult
		public func getActiveImplants(characterID: Int, ifNoneMatch: String? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Int]>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-clones.read_implants.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/characters/\(characterID)/implants/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Int]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Int]>) in
				promise.set(response: response, cached: 300.0)
			}
			return promise.future
		}
		
		@discardableResult
		public func getClones(characterID: Int, ifNoneMatch: String? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<Clones.JumpClones>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-clones.read_clones.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v3/characters/\(characterID)/clones/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<Clones.JumpClones>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Clones.JumpClones>) in
				promise.set(response: response, cached: 120.0)
			}
			return promise.future
		}
		
		
		public struct JumpClones: Codable, Hashable {
			
			public struct JumpClone: Codable, Hashable {
				
				public enum GetCharactersCharacterIDClonesJumpCloneLocationType: String, Codable, HTTPQueryable {
					case station = "station"
					case structure = "structure"
					
					public var httpQuery: String? {
						return rawValue
					}
					
				}
				
				public var implants: [Int]
				public var jumpCloneID: Int
				public var locationID: Int64
				public var locationType: Clones.JumpClones.JumpClone.GetCharactersCharacterIDClonesJumpCloneLocationType
				public var name: String?
				
				public init(implants: [Int], jumpCloneID: Int, locationID: Int64, locationType: Clones.JumpClones.JumpClone.GetCharactersCharacterIDClonesJumpCloneLocationType, name: String?) {
					self.implants = implants
					self.jumpCloneID = jumpCloneID
					self.locationID = locationID
					self.locationType = locationType
					self.name = name
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
			
			public struct Location: Codable, Hashable {
				
				public enum LocationType: String, Codable, HTTPQueryable {
					case station = "station"
					case structure = "structure"
					
					public var httpQuery: String? {
						return rawValue
					}
					
				}
				
				public var locationID: Int64?
				public var locationType: Clones.JumpClones.Location.LocationType?
				
				public init(locationID: Int64?, locationType: Clones.JumpClones.Location.LocationType?) {
					self.locationID = locationID
					self.locationType = locationType
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
