import Foundation
import Alamofire
import Combine


extension ESI {
	public var search: Search {
		return Search(esi: self, route: .path("search", next: .root(ESI.apiURL)))
	}
	
	public struct Search {
		let esi: ESI
		let route: APIRoute
		
		
		public func get(categories: [ESI.Search.Categories], language: ESI.Markets.Language? = nil, search: String, strict: Bool? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Success, AFError> {
			do {
				
				
				
				
				var headers = HTTPHeaders()
				headers["Accept"] = "application/json"
				
				
				var query = [URLQueryItem]()
				query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
				if !categories.isEmpty {
					query.append(URLQueryItem(name: "categories", value: categories.lazy.map{$0.description}.joined(separator: ",")))
				}
				if let language = language {
					query.append(URLQueryItem(name: "language", value: language.description))
				}
				query.append(URLQueryItem(name: "search", value: search.description))
				if let strict = strict {
					query.append(URLQueryItem(name: "strict", value: strict.description))
				}
				
				let url = try route.asURL()
				var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
				components.queryItems = query
				
				return esi.session.publisher(components,
				method: .get,
				encoding: URLEncoding.default,
				headers: headers,
				interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
				.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
				.eraseToAnyPublisher()
				
			}
			catch {
				return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
			}
		}
		
		
		
		
		
		
		public enum Categories: String, Codable, CustomStringConvertible {
			case agent
			case alliance
			case character
			case constellation
			case corporation
			case faction
			case inventoryType = "inventory_type"
			case region
			case solarSystem = "solar_system"
			case station
			
			public var description: String {
				return rawValue
			}
			
		}
		
		public struct Success: Codable, Hashable {
			
			
			public let agent: [Int]?
			public let alliance: [Int]?
			public let character: [Int]?
			public let constellation: [Int]?
			public let corporation: [Int]?
			public let faction: [Int]?
			public let inventoryType: [Int]?
			public let region: [Int]?
			public let solarSystem: [Int]?
			public let station: [Int]?
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case agent
				case alliance
				case character
				case constellation
				case corporation
				case faction
				case inventoryType = "inventory_type"
				case region
				case solarSystem = "solar_system"
				case station
				
				var dateFormatter: DateFormatter? {
					return nil
				}
			}
		}
		
	}
	
}
