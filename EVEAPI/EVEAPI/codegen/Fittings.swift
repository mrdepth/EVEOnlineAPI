import Foundation
import Alamofire


public extension ESI {
	public var fittings: Fittings {
		return Fittings(sessionManager: self)
	}
	
	class Fittings {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		public func deleteFitting(characterID: Int, fittingID: Int, completionBlock:((Result<String>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-fittings.write_fittings.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/fittings/\(fittingID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .delete, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<String>) in
					completionBlock?(response.result)
					session = nil
				}
			}
		}
		
		public func createFitting(characterID: Int, fitting: Fittings.MutableFitting? = nil, completionBlock:((Result<Fittings.CreateFittingResult>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-fittings.write_fittings.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body = fitting != nil ? try? JSONEncoder().encode(fitting) : nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/fittings/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Fittings.CreateFittingResult>) in
					completionBlock?(response.result)
					session = nil
				}
			}
		}
		
		public func getFittings(characterID: Int, completionBlock:((Result<[Fittings.Fitting]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-fittings.read_fittings.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/fittings/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Fittings.Fitting]>) in
					completionBlock?(response.result)
					session = nil
				}
			}
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
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: flag.hashValue)
				hashCombine(seed: &hash, value: quantity.hashValue)
				hashCombine(seed: &hash, value: typeID.hashValue)
				return hash
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
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: localizedDescription.hashValue)
				hashCombine(seed: &hash, value: fittingID.hashValue)
				self.items.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: name.hashValue)
				hashCombine(seed: &hash, value: shipTypeID.hashValue)
				return hash
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
		
		
		public struct CreateFittingResult: Codable, Hashable {
			
			
			public var fittingID: Int
			
			public init(fittingID: Int) {
				self.fittingID = fittingID
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: fittingID.hashValue)
				return hash
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
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: localizedDescription.hashValue)
				self.items.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: name.hashValue)
				hashCombine(seed: &hash, value: shipTypeID.hashValue)
				return hash
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
