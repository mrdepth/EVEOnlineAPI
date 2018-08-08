import Foundation
import Alamofire
import Futures


public extension ESI {
	public var alliance: Alliance {
		return Alliance(esi: self)
	}
	
	class Alliance {
		weak var esi: ESI?
		
		init(esi: ESI) {
			self.esi = esi
		}
		
		@discardableResult
		public func listAlliancesCorporations(allianceID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<[Int]>> {
			var esi = self.esi
			guard esi != nil else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi!.server.rawValue))
			
			
			let url = esi!.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Int]>>()
			esi!.perform { () -> DataRequest in
				return esi!.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Int]>) in
					promise.set(result: response.result, cached: 3600.0)
					esi = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func listAllAlliances(ifNoneMatch: String? = nil) -> Future<ESI.Result<[Int]>> {
			var esi = self.esi
			guard esi != nil else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi!.server.rawValue))
			
			
			let url = esi!.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Int]>>()
			esi!.perform { () -> DataRequest in
				return esi!.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Int]>) in
					promise.set(result: response.result, cached: 3600.0)
					esi = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getAllianceIcon(allianceID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<Alliance.Icon>> {
			var esi = self.esi
			guard esi != nil else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi!.server.rawValue))
			
			
			let url = esi!.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<Alliance.Icon>>()
			esi!.perform { () -> DataRequest in
				return esi!.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Alliance.Icon>) in
					promise.set(result: response.result, cached: 3600.0)
					esi = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getAllianceInformation(allianceID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<Alliance.Information>> {
			var esi = self.esi
			guard esi != nil else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi!.server.rawValue))
			
			
			let url = esi!.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<Alliance.Information>>()
			esi!.perform { () -> DataRequest in
				return esi!.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Alliance.Information>) in
					promise.set(result: response.result, cached: 3600.0)
					esi = nil
				}
			}
			return promise.future
		}
		
		
		public struct GetAlliancesAllianceIDNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
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
		
		
		public struct Icon: Codable, Hashable {
			
			
			public var px128x128: String?
			public var px64x64: String?
			
			public init(px128x128: String?, px64x64: String?) {
				self.px128x128 = px128x128
				self.px64x64 = px64x64
			}
			
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
		
		
		public struct GetAlliancesAllianceIDIconsNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
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
		
		
		public struct Information: Codable, Hashable {
			
			
			public var creatorCorporationID: Int
			public var creatorID: Int
			public var dateFounded: Date
			public var executorCorporationID: Int?
			public var factionID: Int?
			public var name: String
			public var ticker: String
			
			public init(creatorCorporationID: Int, creatorID: Int, dateFounded: Date, executorCorporationID: Int?, factionID: Int?, name: String, ticker: String) {
				self.creatorCorporationID = creatorCorporationID
				self.creatorID = creatorID
				self.dateFounded = dateFounded
				self.executorCorporationID = executorCorporationID
				self.factionID = factionID
				self.name = name
				self.ticker = ticker
			}
			
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
		
		
	}
	
}
