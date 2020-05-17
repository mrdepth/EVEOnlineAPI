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
		
		
		public func get(categories: [ESI.Search.Categories], language: ESI.Corporations.Language? = nil, search: String, strict: Bool? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<ESI.Search.Success>, AFError> {
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
				
				let session = esi.session
				
				return Deferred { () -> AnyPublisher<ESIResponse<ESI.Search.Success>, AFError> in
					var request = session.request(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
					
					if let progress = progress {
						request = request.downloadProgress(closure: progress)
					}
					
					return request.publishDecodable(queue: session.serializationQueue, decoder: ESI.jsonDecoder)
					.tryMap { response in
						try ESIResponse(value: response.result.get(), httpHeaders: response.response?.headers)
					}
					.mapError{$0 as! AFError}
					.handleEvents(receiveCompletion: { (_) in
						withExtendedLifetime(session) {}
					}).eraseToAnyPublisher()
				}.eraseToAnyPublisher()
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
			
			
			public var agent: [Int]?
			public var alliance: [Int]?
			public var character: [Int]?
			public var constellation: [Int]?
			public var corporation: [Int]?
			public var faction: [Int]?
			public var inventoryType: [Int]?
			public var region: [Int]?
			public var solarSystem: [Int]?
			public var station: [Int]?
			public init(agent: [Int]?, alliance: [Int]?, character: [Int]?, constellation: [Int]?, corporation: [Int]?, faction: [Int]?, inventoryType: [Int]?, region: [Int]?, solarSystem: [Int]?, station: [Int]?) {
				self.agent = agent
				self.alliance = alliance
				self.character = character
				self.constellation = constellation
				self.corporation = corporation
				self.faction = faction
				self.inventoryType = inventoryType
				self.region = region
				self.solarSystem = solarSystem
				self.station = station
			}
			
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
