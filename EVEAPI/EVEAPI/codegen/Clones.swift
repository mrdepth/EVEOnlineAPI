import Foundation
import Alamofire
import Combine


extension ESI {
	public var clones: Clones {
		return Clones(esi: self)
	}
	
	public struct Clones {
		let esi: ESI
		
		
		public func getActiveImplants(characterID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Int], AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-clones.read_implants.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/characters/\(characterID)/implants/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .get,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
			            .eraseToAnyPublisher()
		}
		
		
		public func getClones(characterID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Clones.JumpClones, AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-clones.read_clones.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/characters/\(characterID)/clones/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .get,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
			            .eraseToAnyPublisher()
		}
		
		
		public struct JumpClones: Codable, Hashable {
			
			public struct Location: Codable, Hashable {
				
				public enum LocationType: String, Codable, CustomStringConvertible {
					case station = "station"
					case structure = "structure"
					
					public var description: String {
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
			
			public struct JumpClone: Codable, Hashable {
				
				public enum GetCharactersCharacterIDClonesJumpCloneLocationType: String, Codable, CustomStringConvertible {
					case station = "station"
					case structure = "structure"
					
					public var description: String {
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
