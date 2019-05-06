import Foundation
import Alamofire
import Futures


public extension ESI {
	var fittings: Fittings {
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
			
			let promise = Promise<ESI.Result<String>>()
			esi.request(components.url!, method: .delete, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<String>) in
				promise.set(response: response, cached: nil)
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
			
			
			let url = esi.baseURL + "/v2/characters/\(characterID)/fittings/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<Fittings.CreateFittingResult>>()
			esi.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<Fittings.CreateFittingResult>) in
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
			
			
			let url = esi.baseURL + "/v2/characters/\(characterID)/fittings/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<[Fittings.Fitting]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<[Fittings.Fitting]>) in
				promise.set(response: response, cached: 300.0)
			}
			return promise.future
		}
		
		
		public struct Fitting: Codable, Hashable {
			
			public struct Item: Codable, Hashable {
				
				public enum GetCharactersCharacterIDFittingsFlag: String, Codable, HTTPQueryable {
					case cargo = "Cargo"
					case droneBay = "DroneBay"
					case fighterBay = "FighterBay"
					case hiSlot0 = "HiSlot0"
					case hiSlot1 = "HiSlot1"
					case hiSlot2 = "HiSlot2"
					case hiSlot3 = "HiSlot3"
					case hiSlot4 = "HiSlot4"
					case hiSlot5 = "HiSlot5"
					case hiSlot6 = "HiSlot6"
					case hiSlot7 = "HiSlot7"
					case invalid = "Invalid"
					case loSlot0 = "LoSlot0"
					case loSlot1 = "LoSlot1"
					case loSlot2 = "LoSlot2"
					case loSlot3 = "LoSlot3"
					case loSlot4 = "LoSlot4"
					case loSlot5 = "LoSlot5"
					case loSlot6 = "LoSlot6"
					case loSlot7 = "LoSlot7"
					case medSlot0 = "MedSlot0"
					case medSlot1 = "MedSlot1"
					case medSlot2 = "MedSlot2"
					case medSlot3 = "MedSlot3"
					case medSlot4 = "MedSlot4"
					case medSlot5 = "MedSlot5"
					case medSlot6 = "MedSlot6"
					case medSlot7 = "MedSlot7"
					case rigSlot0 = "RigSlot0"
					case rigSlot1 = "RigSlot1"
					case rigSlot2 = "RigSlot2"
					case serviceSlot0 = "ServiceSlot0"
					case serviceSlot1 = "ServiceSlot1"
					case serviceSlot2 = "ServiceSlot2"
					case serviceSlot3 = "ServiceSlot3"
					case serviceSlot4 = "ServiceSlot4"
					case serviceSlot5 = "ServiceSlot5"
					case serviceSlot6 = "ServiceSlot6"
					case serviceSlot7 = "ServiceSlot7"
					case subSystemSlot0 = "SubSystemSlot0"
					case subSystemSlot1 = "SubSystemSlot1"
					case subSystemSlot2 = "SubSystemSlot2"
					case subSystemSlot3 = "SubSystemSlot3"
					
					public var httpQuery: String? {
						return rawValue
					}
					
				}
				
				public var flag: Fittings.Fitting.Item.GetCharactersCharacterIDFittingsFlag
				public var quantity: Int
				public var typeID: Int
				
				public init(flag: Fittings.Fitting.Item.GetCharactersCharacterIDFittingsFlag, quantity: Int, typeID: Int) {
					self.flag = flag
					self.quantity = quantity
					self.typeID = typeID
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
			
			public var localizedDescription: String
			public var fittingID: Int
			public var items: [Fittings.Fitting.Item]
			public var name: String
			public var shipTypeID: Int
			
			public init(localizedDescription: String, fittingID: Int, items: [Fittings.Fitting.Item], name: String, shipTypeID: Int) {
				self.localizedDescription = localizedDescription
				self.fittingID = fittingID
				self.items = items
				self.name = name
				self.shipTypeID = shipTypeID
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
			
			public struct Item: Codable, Hashable {
				
				public enum PostCharactersCharacterIDFittingsFlag: String, Codable, HTTPQueryable {
					case cargo = "Cargo"
					case droneBay = "DroneBay"
					case fighterBay = "FighterBay"
					case hiSlot0 = "HiSlot0"
					case hiSlot1 = "HiSlot1"
					case hiSlot2 = "HiSlot2"
					case hiSlot3 = "HiSlot3"
					case hiSlot4 = "HiSlot4"
					case hiSlot5 = "HiSlot5"
					case hiSlot6 = "HiSlot6"
					case hiSlot7 = "HiSlot7"
					case invalid = "Invalid"
					case loSlot0 = "LoSlot0"
					case loSlot1 = "LoSlot1"
					case loSlot2 = "LoSlot2"
					case loSlot3 = "LoSlot3"
					case loSlot4 = "LoSlot4"
					case loSlot5 = "LoSlot5"
					case loSlot6 = "LoSlot6"
					case loSlot7 = "LoSlot7"
					case medSlot0 = "MedSlot0"
					case medSlot1 = "MedSlot1"
					case medSlot2 = "MedSlot2"
					case medSlot3 = "MedSlot3"
					case medSlot4 = "MedSlot4"
					case medSlot5 = "MedSlot5"
					case medSlot6 = "MedSlot6"
					case medSlot7 = "MedSlot7"
					case rigSlot0 = "RigSlot0"
					case rigSlot1 = "RigSlot1"
					case rigSlot2 = "RigSlot2"
					case serviceSlot0 = "ServiceSlot0"
					case serviceSlot1 = "ServiceSlot1"
					case serviceSlot2 = "ServiceSlot2"
					case serviceSlot3 = "ServiceSlot3"
					case serviceSlot4 = "ServiceSlot4"
					case serviceSlot5 = "ServiceSlot5"
					case serviceSlot6 = "ServiceSlot6"
					case serviceSlot7 = "ServiceSlot7"
					case subSystemSlot0 = "SubSystemSlot0"
					case subSystemSlot1 = "SubSystemSlot1"
					case subSystemSlot2 = "SubSystemSlot2"
					case subSystemSlot3 = "SubSystemSlot3"
					
					public var httpQuery: String? {
						return rawValue
					}
					
				}
				
				public var flag: Fittings.MutableFitting.Item.PostCharactersCharacterIDFittingsFlag
				public var quantity: Int
				public var typeID: Int
				
				public init(flag: Fittings.MutableFitting.Item.PostCharactersCharacterIDFittingsFlag, quantity: Int, typeID: Int) {
					self.flag = flag
					self.quantity = quantity
					self.typeID = typeID
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
			
			public var localizedDescription: String
			public var items: [Fittings.MutableFitting.Item]
			public var name: String
			public var shipTypeID: Int
			
			public init(localizedDescription: String, items: [Fittings.MutableFitting.Item], name: String, shipTypeID: Int) {
				self.localizedDescription = localizedDescription
				self.items = items
				self.name = name
				self.shipTypeID = shipTypeID
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
