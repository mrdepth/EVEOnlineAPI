import Foundation
import Alamofire
import Combine


extension ESI {
	public var location: Location {
		return Location(esi: self)
	}
	
	public struct Location {
		let esi: ESI
		
		
		public func getCharacterOnline(characterID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Location.GetCharactersCharacterIDOnlineOk, AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-location.read_online.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/characters/\(characterID)/online/")
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
		
		
		public func getCharacterLocation(characterID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Location.CharacterLocation, AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-location.read_location.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/characters/\(characterID)/location/")
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
		
		
		public func getCurrentShip(characterID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Location.CharacterShip, AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-location.read_ship_type.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/characters/\(characterID)/ship/")
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
		
		
		public struct CharacterLocation: Codable, Hashable {
			
			
			public var solarSystemID: Int
			public var stationID: Int?
			public var structureID: Int64?
			
			public init(solarSystemID: Int, stationID: Int?, structureID: Int64?) {
				self.solarSystemID = solarSystemID
				self.stationID = stationID
				self.structureID = structureID
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case solarSystemID = "solar_system_id"
				case stationID = "station_id"
				case structureID = "structure_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCharactersCharacterIDOnlineOk: Codable, Hashable {
			
			
			public var lastLogin: Date?
			public var lastLogout: Date?
			public var logins: Int?
			public var online: Bool
			
			public init(lastLogin: Date?, lastLogout: Date?, logins: Int?, online: Bool) {
				self.lastLogin = lastLogin
				self.lastLogout = lastLogout
				self.logins = logins
				self.online = online
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case lastLogin = "last_login"
				case lastLogout = "last_logout"
				case logins
				case online
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .lastLogin: return DateFormatter.esiDateTimeFormatter
						case .lastLogout: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct CharacterShip: Codable, Hashable {
			
			
			public var shipItemID: Int64
			public var shipName: String
			public var shipTypeID: Int
			
			public init(shipItemID: Int64, shipName: String, shipTypeID: Int) {
				self.shipItemID = shipItemID
				self.shipName = shipName
				self.shipTypeID = shipTypeID
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case shipItemID = "ship_item_id"
				case shipName = "ship_name"
				case shipTypeID = "ship_type_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
	}
	
}
