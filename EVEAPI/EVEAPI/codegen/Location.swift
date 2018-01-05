import Foundation
import Alamofire


public extension ESI {
	public var location: Location {
		return Location(sessionManager: self)
	}
	
	class Location {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		public func getCharacterLocation(characterID: Int, completionBlock:((Result<Location.CharacterLocation>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-location.read_location.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/location/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Location.CharacterLocation>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getCharacterOnline(characterID: Int, completionBlock:((Result<Location.GetCharactersCharacterIDOnlineOk>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-location.read_online.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v2/characters/\(characterID)/online/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Location.GetCharactersCharacterIDOnlineOk>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getCurrentShip(characterID: Int, completionBlock:((Result<Location.CharacterShip>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-location.read_ship_type.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/ship/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Location.CharacterShip>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		public struct CharacterShip: Codable, Hashable {
			
			
			public let shipItemID: Int64
			public let shipName: String
			public let shipTypeID: Int
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: shipItemID.hashValue)
				hashCombine(seed: &hash, value: shipName.hashValue)
				hashCombine(seed: &hash, value: shipTypeID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Location.CharacterShip, rhs: Location.CharacterShip) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
		
		
		public struct GetCharactersCharacterIDOnlineOk: Codable, Hashable {
			
			
			public let lastLogin: Date?
			public let lastLogout: Date?
			public let logins: Int?
			public let online: Bool
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: lastLogin?.hashValue ?? 0)
				hashCombine(seed: &hash, value: lastLogout?.hashValue ?? 0)
				hashCombine(seed: &hash, value: logins?.hashValue ?? 0)
				hashCombine(seed: &hash, value: online.hashValue)
				return hash
			}
			
			public static func ==(lhs: Location.GetCharactersCharacterIDOnlineOk, rhs: Location.GetCharactersCharacterIDOnlineOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
		
		
		public struct CharacterLocation: Codable, Hashable {
			
			
			public let solarSystemID: Int
			public let stationID: Int?
			public let structureID: Int64?
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: solarSystemID.hashValue)
				hashCombine(seed: &hash, value: stationID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: structureID?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Location.CharacterLocation, rhs: Location.CharacterLocation) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
		
		
	}
	
}
