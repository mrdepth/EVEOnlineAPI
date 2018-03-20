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
		
		@discardableResult
		public func getCharacterLocation(characterID: Int) -> Future<ESI.Result<Location.CharacterLocation>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<Location.CharacterLocation>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-location.read_location.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/location/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Location.CharacterLocation>) in
					promise.set(result: response.result, cached: 5.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCharacterOnline(characterID: Int) -> Future<ESI.Result<Location.GetCharactersCharacterIDOnlineOk>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<Location.GetCharactersCharacterIDOnlineOk>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-location.read_online.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v2/characters/\(characterID)/online/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Location.GetCharactersCharacterIDOnlineOk>) in
					promise.set(result: response.result, cached: 60.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCurrentShip(characterID: Int) -> Future<ESI.Result<Location.CharacterShip>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<Location.CharacterShip>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-location.read_ship_type.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/ship/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Location.CharacterShip>) in
					promise.set(result: response.result, cached: 5.0)
					session = nil
				}
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
			
			
			public var solarSystemID: Int
			public var stationID: Int?
			public var structureID: Int64?
			
			public init(solarSystemID: Int, stationID: Int?, structureID: Int64?) {
				self.solarSystemID = solarSystemID
				self.stationID = stationID
				self.structureID = structureID
			}
			
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
