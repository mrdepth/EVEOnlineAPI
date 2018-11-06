import Foundation
import Alamofire
import Futures


public extension ESI {
	public var fittings: Fittings {
		return Fittings(esi: self)
	}
	
	struct Fittings {
		let esi: ESI
		
		@discardableResult
		public func deleteFitting(characterID: Int, fittingID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<String>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-fittings.write_fittings.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/characters/\(characterID)/fittings/\(fittingID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<String>>()
			esi.request(components.url!, method: .delete, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<String>) in
				promise.set(response: response, cached: nil)
			}
			return promise.future
		}
		
		@discardableResult
		public func getFittings(characterID: Int, ifNoneMatch: String? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Fittings.Fitting]>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-fittings.read_fittings.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/characters/\(characterID)/fittings/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Fittings.Fitting]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Fittings.Fitting]>) in
				promise.set(response: response, cached: 300.0)
			}
			return promise.future
		}
		
		@discardableResult
		public func createFitting(characterID: Int, fitting: Fittings.MutableFitting, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<Fittings.CreateFittingResult>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-fittings.write_fittings.v1") else {return .init(.failure(ESIError.forbidden))}
			let body = try? JSONEncoder().encode(fitting)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			let url = esi.baseURL + "/v1/characters/\(characterID)/fittings/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<Fittings.CreateFittingResult>>()
			esi.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Fittings.CreateFittingResult>) in
				promise.set(response: response, cached: nil)
			}
			return promise.future
		}
		
		
		public struct Item: Codable, Hashable {
			
			
			public var flag: Int
			public var quantity: Int
			public var typeID: Int
			
			public init(flag: Int, quantity: Int, typeID: Int) {
				self.flag = flag
				self.quantity = quantity
				self.typeID = typeID
			}
			
			public static func ==(lhs: Fittings.Item, rhs: Fittings.Item) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case flag
				case quantity
				case typeID = "type_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct CreateFittingResult: Codable, Hashable {
			
			
			public var fittingID: Int
			
			public init(fittingID: Int) {
				self.fittingID = fittingID
			}
			
			public static func ==(lhs: Fittings.CreateFittingResult, rhs: Fittings.CreateFittingResult) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case fittingID = "fitting_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct Fitting: Codable, Hashable {
			
			
			public var localizedDescription: String
			public var fittingID: Int
			public var items: [Fittings.Item]
			public var name: String
			public var shipTypeID: Int
			
			public init(localizedDescription: String, fittingID: Int, items: [Fittings.Item], name: String, shipTypeID: Int) {
				self.localizedDescription = localizedDescription
				self.fittingID = fittingID
				self.items = items
				self.name = name
				self.shipTypeID = shipTypeID
			}
			
			public static func ==(lhs: Fittings.Fitting, rhs: Fittings.Fitting) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case localizedDescription = "description"
				case fittingID = "fitting_id"
				case items
				case name
				case shipTypeID = "ship_type_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct MutableFitting: Codable, Hashable {
			
			
			public var localizedDescription: String
			public var items: [Fittings.Item]
			public var name: String
			public var shipTypeID: Int
			
			public init(localizedDescription: String, items: [Fittings.Item], name: String, shipTypeID: Int) {
				self.localizedDescription = localizedDescription
				self.items = items
				self.name = name
				self.shipTypeID = shipTypeID
			}
			
			public static func ==(lhs: Fittings.MutableFitting, rhs: Fittings.MutableFitting) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case localizedDescription = "description"
				case items
				case name
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
