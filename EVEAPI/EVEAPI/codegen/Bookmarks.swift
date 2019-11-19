import Foundation
import Alamofire
import Combine


extension ESI {
	public var bookmarks: Bookmarks {
		return Bookmarks(esi: self)
	}
	
	public struct Bookmarks {
		let esi: ESI
		
		
		public func listCorporationBookmarks(corporationID: Int, page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Bookmarks.GetCorporationsCorporationIDBookmarksOk], AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-bookmarks.read_corporation_bookmarks.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = page?.description {
				query.append(URLQueryItem(name: "page", value: v.lazy.map{$0.description}.joined(separator: ",")))
			}
			
			        let url = ESI.apiURL.appendingPathComponent("/corporations/\(corporationID)/bookmarks/")
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
		
		
		public func listCorporationBookmarkFolders(corporationID: Int, page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Bookmarks.GetCorporationsCorporationIDBookmarksFoldersOk], AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-bookmarks.read_corporation_bookmarks.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = page?.description {
				query.append(URLQueryItem(name: "page", value: v.lazy.map{$0.description}.joined(separator: ",")))
			}
			
			        let url = ESI.apiURL.appendingPathComponent("/corporations/\(corporationID)/bookmarks/folders/")
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
		
		
		public func listBookmarks(characterID: Int, page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Bookmarks.Bookmark], AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-bookmarks.read_character_bookmarks.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = page?.description {
				query.append(URLQueryItem(name: "page", value: v.lazy.map{$0.description}.joined(separator: ",")))
			}
			
			        let url = ESI.apiURL.appendingPathComponent("/characters/\(characterID)/bookmarks/")
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
		
		
		public func listBookmarkFolders(characterID: Int, page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Bookmarks.Folder], AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-bookmarks.read_character_bookmarks.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = page?.description {
				query.append(URLQueryItem(name: "page", value: v.lazy.map{$0.description}.joined(separator: ",")))
			}
			
			        let url = ESI.apiURL.appendingPathComponent("/characters/\(characterID)/bookmarks/folders/")
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
		
		
		public struct GetCorporationsCorporationIDBookmarksOk: Codable, Hashable {
			
			public struct GetCorporationsCorporationIDBookmarksItem: Codable, Hashable {
				
				
				public var itemID: Int64
				public var typeID: Int
				
				public init(itemID: Int64, typeID: Int) {
					self.itemID = itemID
					self.typeID = typeID
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case itemID = "item_id"
					case typeID = "type_id"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct GetCorporationsCorporationIDBookmarksCoordinates: Codable, Hashable {
				
				
				public var x: Double
				public var y: Double
				public var z: Double
				
				public init(x: Double, y: Double, z: Double) {
					self.x = x
					self.y = y
					self.z = z
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case x
					case y
					case z
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public var bookmarkID: Int
			public var coordinates: Bookmarks.GetCorporationsCorporationIDBookmarksOk.GetCorporationsCorporationIDBookmarksCoordinates?
			public var created: Date
			public var creatorID: Int
			public var folderID: Int?
			public var item: Bookmarks.GetCorporationsCorporationIDBookmarksOk.GetCorporationsCorporationIDBookmarksItem?
			public var label: String
			public var locationID: Int
			public var notes: String
			
			public init(bookmarkID: Int, coordinates: Bookmarks.GetCorporationsCorporationIDBookmarksOk.GetCorporationsCorporationIDBookmarksCoordinates?, created: Date, creatorID: Int, folderID: Int?, item: Bookmarks.GetCorporationsCorporationIDBookmarksOk.GetCorporationsCorporationIDBookmarksItem?, label: String, locationID: Int, notes: String) {
				self.bookmarkID = bookmarkID
				self.coordinates = coordinates
				self.created = created
				self.creatorID = creatorID
				self.folderID = folderID
				self.item = item
				self.label = label
				self.locationID = locationID
				self.notes = notes
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case bookmarkID = "bookmark_id"
				case coordinates
				case created
				case creatorID = "creator_id"
				case folderID = "folder_id"
				case item
				case label
				case locationID = "location_id"
				case notes
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .created: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct Folder: Codable, Hashable {
			
			
			public var folderID: Int
			public var name: String
			
			public init(folderID: Int, name: String) {
				self.folderID = folderID
				self.name = name
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case folderID = "folder_id"
				case name
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCorporationsCorporationIDBookmarksFoldersOk: Codable, Hashable {
			
			
			public var creatorID: Int?
			public var folderID: Int
			public var name: String
			
			public init(creatorID: Int?, folderID: Int, name: String) {
				self.creatorID = creatorID
				self.folderID = folderID
				self.name = name
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case creatorID = "creator_id"
				case folderID = "folder_id"
				case name
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct Bookmark: Codable, Hashable {
			
			public struct GetCharactersCharacterIDBookmarksItem: Codable, Hashable {
				
				
				public var itemID: Int64
				public var typeID: Int
				
				public init(itemID: Int64, typeID: Int) {
					self.itemID = itemID
					self.typeID = typeID
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case itemID = "item_id"
					case typeID = "type_id"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct GetCharactersCharacterIDBookmarksCoordinates: Codable, Hashable {
				
				
				public var x: Double
				public var y: Double
				public var z: Double
				
				public init(x: Double, y: Double, z: Double) {
					self.x = x
					self.y = y
					self.z = z
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case x
					case y
					case z
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public var bookmarkID: Int
			public var coordinates: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksCoordinates?
			public var created: Date
			public var creatorID: Int
			public var folderID: Int?
			public var item: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksItem?
			public var label: String
			public var locationID: Int
			public var notes: String
			
			public init(bookmarkID: Int, coordinates: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksCoordinates?, created: Date, creatorID: Int, folderID: Int?, item: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksItem?, label: String, locationID: Int, notes: String) {
				self.bookmarkID = bookmarkID
				self.coordinates = coordinates
				self.created = created
				self.creatorID = creatorID
				self.folderID = folderID
				self.item = item
				self.label = label
				self.locationID = locationID
				self.notes = notes
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case bookmarkID = "bookmark_id"
				case coordinates
				case created
				case creatorID = "creator_id"
				case folderID = "folder_id"
				case item
				case label
				case locationID = "location_id"
				case notes
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .created: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
	}
	
}
