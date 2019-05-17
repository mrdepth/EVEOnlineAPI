import Foundation
import Alamofire
import Futures


public extension ESI {
	var location: Location {
		return Location(esi: self)
	}
	
	struct Location {
		let esi: ESI
		
		@discardableResult
		public func getCurrentShip(characterID: Int, ifNoneMatch: String? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<Location.CharacterShip>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-location.read_ship_type.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/characters/\(characterID)/ship/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<Location.CharacterShip>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<Location.CharacterShip>) in
				promise.set(response: response, cached: 5.0)
			}
			return promise.future
		}
		
		@discardableResult
		public func getCharacterOnline(characterID: Int, ifNoneMatch: String? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<Location.GetCharactersCharacterIDOnlineOk>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-location.read_online.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/characters/\(characterID)/online/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<Location.GetCharactersCharacterIDOnlineOk>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<Location.GetCharactersCharacterIDOnlineOk>) in
				promise.set(response: response, cached: 60.0)
			}
			return promise.future
		}
		
		@discardableResult
		public func getCharacterLocation(characterID: Int, ifNoneMatch: String? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<Location.CharacterLocation>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-location.read_location.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/characters/\(characterID)/location/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<Location.CharacterLocation>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<Location.CharacterLocation>) in
				promise.set(response: response, cached: 5.0)
			}
			return promise.future
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
		
		
	}
	
}
