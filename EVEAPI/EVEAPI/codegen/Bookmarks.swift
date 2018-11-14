import Foundation
import Alamofire
import Futures


public extension ESI {
	public var bookmarks: Bookmarks {
		return Bookmarks(esi: self)
	}
	
	struct Bookmarks {
		let esi: ESI
		
		@discardableResult
		public func listBookmarkFolders(characterID: Int, ifNoneMatch: String? = nil, page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Bookmarks.Folder]>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-bookmarks.read_character_bookmarks.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = esi.baseURL + "/v2/characters/\(characterID)/bookmarks/folders/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<[Bookmarks.Folder]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<[Bookmarks.Folder]>) in
				promise.set(response: response, cached: 3600.0)
			}
			return promise.future
		}
		
		@discardableResult
		public func listCorporationBookmarks(corporationID: Int, ifNoneMatch: String? = nil, page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Bookmarks.GetCorporationsCorporationIDBookmarksOk]>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-bookmarks.read_corporation_bookmarks.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = esi.baseURL + "/v1/corporations/\(corporationID)/bookmarks/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<[Bookmarks.GetCorporationsCorporationIDBookmarksOk]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<[Bookmarks.GetCorporationsCorporationIDBookmarksOk]>) in
				promise.set(response: response, cached: 3600.0)
			}
			return promise.future
		}
		
		@discardableResult
		public func listCorporationBookmarkFolders(corporationID: Int, ifNoneMatch: String? = nil, page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Bookmarks.GetCorporationsCorporationIDBookmarksFoldersOk]>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-bookmarks.read_corporation_bookmarks.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = esi.baseURL + "/v1/corporations/\(corporationID)/bookmarks/folders/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<[Bookmarks.GetCorporationsCorporationIDBookmarksFoldersOk]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<[Bookmarks.GetCorporationsCorporationIDBookmarksFoldersOk]>) in
				promise.set(response: response, cached: 3600.0)
			}
			return promise.future
		}
		
		@discardableResult
		public func listBookmarks(characterID: Int, ifNoneMatch: String? = nil, page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Bookmarks.Bookmark]>> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-bookmarks.read_character_bookmarks.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = esi.baseURL + "/v2/characters/\(characterID)/bookmarks/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let promise = Promise<ESI.Result<[Bookmarks.Bookmark]>>()
			esi.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers, cachePolicy: cachePolicy).validateESI().responseESI { (response: DataResponse<[Bookmarks.Bookmark]>) in
				promise.set(response: response, cached: 3600.0)
			}
			return promise.future
		}
		
		
		public struct Bookmark: Codable, Hashable {
			
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
		
		
	}
	
}
