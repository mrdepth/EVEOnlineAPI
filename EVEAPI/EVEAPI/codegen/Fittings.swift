import Foundation
import Alamofire
import Combine


extension ESI {
	public var fittings: Fittings {
		return Fittings(esi: self)
	}
	
	public struct Fittings {
		let esi: ESI
		
		
		public func deleteFitting(characterID: Int, fittingID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<String, AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-fittings.write_fittings.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/characters/\(characterID)/fittings/\(fittingID)/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .delete,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseString(queue: esi.session.serializationQueue)
			            .eraseToAnyPublisher()
		}
		
		
		public func getFittings(characterID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Fittings.Fitting], AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-fittings.read_fittings.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/characters/\(characterID)/fittings/")
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
		
		
		public func createFitting(characterID: Int, fitting: Fittings.MutableFitting, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Fittings.CreateFittingResult, AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-fittings.write_fittings.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body = try? JSONEncoder().encode(fitting)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/characters/\(characterID)/fittings/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .post,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
			            .eraseToAnyPublisher()
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
		
		
		public struct Item: Codable, Hashable {
			
			
			public var flag: Fittings.Flag
			public var quantity: Int
			public var typeID: Int
			
			public init(flag: Fittings.Flag, quantity: Int, typeID: Int) {
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
		
		
		public enum Flag: String, Codable, CustomStringConvertible {
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
			
			public var description: String {
				return rawValue
			}
			
		}
		
		
	}
	
}
