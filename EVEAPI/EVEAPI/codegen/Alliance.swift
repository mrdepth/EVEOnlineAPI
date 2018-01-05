import Foundation
import Alamofire


public extension ESI {
	public var alliance: Alliance {
		return Alliance(sessionManager: self)
	}
	
	class Alliance {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		public func listAlliancesCorporations(allianceID: Int, completionBlock:((Result<[Int]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/alliances/\(allianceID)/corporations/"
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
		
		public func listAllAlliances(completionBlock:((Result<[Int]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/alliances/"
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
		
		public func getAllianceNames(allianceIds: [Int], completionBlock:((Result<[Alliance.Name]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = allianceIds.httpQuery {
				query.append(URLQueryItem(name: "alliance_ids", value: v))
			}
			
			let url = session!.baseURL + "/v2/alliances/names/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Alliance.Name]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getAllianceIcon(allianceID: Int, completionBlock:((Result<Alliance.Icon>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/alliances/\(allianceID)/icons/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Alliance.Icon>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getAllianceInformation(allianceID: Int, completionBlock:((Result<Alliance.Information>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v3/alliances/\(allianceID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Alliance.Information>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		public struct Information: Codable, Hashable {
			
			
			public let creatorCorporationID: Int
			public let creatorID: Int
			public let dateFounded: Date
			public let executorCorporationID: Int?
			public let factionID: Int?
			public let name: String
			public let ticker: String
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: creatorCorporationID.hashValue)
				hashCombine(seed: &hash, value: creatorID.hashValue)
				hashCombine(seed: &hash, value: dateFounded.hashValue)
				hashCombine(seed: &hash, value: executorCorporationID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: factionID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: name.hashValue)
				hashCombine(seed: &hash, value: ticker.hashValue)
				return hash
			}
			
			public static func ==(lhs: Alliance.Information, rhs: Alliance.Information) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case creatorCorporationID = "creator_corporation_id"
				case creatorID = "creator_id"
				case dateFounded = "date_founded"
				case executorCorporationID = "executor_corporation_id"
				case factionID = "faction_id"
				case name
				case ticker
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .dateFounded: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct Icon: Codable, Hashable {
			
			
			public let px128x128: String?
			public let px64x64: String?
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: px128x128?.hashValue ?? 0)
				hashCombine(seed: &hash, value: px64x64?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Alliance.Icon, rhs: Alliance.Icon) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case px128x128
				case px64x64
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct Name: Codable, Hashable {
			
			
			public let allianceID: Int
			public let allianceName: String
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: allianceID.hashValue)
				hashCombine(seed: &hash, value: allianceName.hashValue)
				return hash
			}
			
			public static func ==(lhs: Alliance.Name, rhs: Alliance.Name) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case allianceID = "alliance_id"
				case allianceName = "alliance_name"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetAlliancesAllianceIDIconsNotFound: Codable, Hashable {
			
			
			public let error: String?
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Alliance.GetAlliancesAllianceIDIconsNotFound, rhs: Alliance.GetAlliancesAllianceIDIconsNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case error
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetAlliancesAllianceIDNotFound: Codable, Hashable {
			
			
			public let error: String?
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Alliance.GetAlliancesAllianceIDNotFound, rhs: Alliance.GetAlliancesAllianceIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case error
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
	}
	
}
