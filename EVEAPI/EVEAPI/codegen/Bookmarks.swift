import Foundation
import Alamofire


public extension ESI {
	public var bookmarks: Bookmarks {
		return Bookmarks(sessionManager: self)
	}
	
	class Bookmarks {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		@discardableResult
		public func listBookmarks(characterID: Int, page: Int? = nil) -> Future<ESI.Result<[Bookmarks.Bookmark]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Bookmarks.Bookmark]>>()
			guard session != nil else {
				try! promise.set(.failure(ESIError.internalError))
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-bookmarks.read_character_bookmarks.v1") else {
				try! promise.set(.failure(ESIError.forbidden))
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v2/characters/\(characterID)/bookmarks/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Bookmarks.Bookmark]>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func listCorporationBookmarks(corporationID: Int, page: Int? = nil) -> Future<ESI.Result<[Bookmarks.GetCorporationsCorporationIDBookmarksOk]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Bookmarks.GetCorporationsCorporationIDBookmarksOk]>>()
			guard session != nil else {
				try! promise.set(.failure(ESIError.internalError))
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-bookmarks.read_corporation_bookmarks.v1") else {
				try! promise.set(.failure(ESIError.forbidden))
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/bookmarks/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Bookmarks.GetCorporationsCorporationIDBookmarksOk]>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func listBookmarkFolders(characterID: Int, page: Int? = nil) -> Future<ESI.Result<[Bookmarks.Folder]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Bookmarks.Folder]>>()
			guard session != nil else {
				try! promise.set(.failure(ESIError.internalError))
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-bookmarks.read_character_bookmarks.v1") else {
				try! promise.set(.failure(ESIError.forbidden))
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v2/characters/\(characterID)/bookmarks/folders/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Bookmarks.Folder]>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func listCorporationBookmarkFolders(corporationID: Int, page: Int? = nil) -> Future<ESI.Result<[Bookmarks.GetCorporationsCorporationIDBookmarksFoldersOk]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Bookmarks.GetCorporationsCorporationIDBookmarksFoldersOk]>>()
			guard session != nil else {
				try! promise.set(.failure(ESIError.internalError))
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-bookmarks.read_corporation_bookmarks.v1") else {
				try! promise.set(.failure(ESIError.forbidden))
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/bookmarks/folders/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Bookmarks.GetCorporationsCorporationIDBookmarksFoldersOk]>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		
		public struct Bookmark: Codable, Hashable {
			
			public struct GetCharactersCharacterIDBookmarksItem: Codable, Hashable {
				
				
				public var itemID: Int64
				public var typeID: Int
				
				public init(itemID: Int64, typeID: Int) {
					self.itemID = itemID
					self.typeID = typeID
				}
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: itemID.hashValue)
					hashCombine(seed: &hash, value: typeID.hashValue)
					return hash
				}
				
				public static func ==(lhs: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksItem, rhs: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksItem) -> Bool {
					return lhs.hashValue == rhs.hashValue
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
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: x.hashValue)
					hashCombine(seed: &hash, value: y.hashValue)
					hashCombine(seed: &hash, value: z.hashValue)
					return hash
				}
				
				public static func ==(lhs: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksCoordinates, rhs: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksCoordinates) -> Bool {
					return lhs.hashValue == rhs.hashValue
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
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: bookmarkID.hashValue)
				hashCombine(seed: &hash, value: coordinates?.hashValue ?? 0)
				hashCombine(seed: &hash, value: created.hashValue)
				hashCombine(seed: &hash, value: creatorID.hashValue)
				hashCombine(seed: &hash, value: folderID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: item?.hashValue ?? 0)
				hashCombine(seed: &hash, value: label.hashValue)
				hashCombine(seed: &hash, value: locationID.hashValue)
				hashCombine(seed: &hash, value: notes.hashValue)
				return hash
			}
			
			public static func ==(lhs: Bookmarks.Bookmark, rhs: Bookmarks.Bookmark) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: folderID.hashValue)
				hashCombine(seed: &hash, value: name.hashValue)
				return hash
			}
			
			public static func ==(lhs: Bookmarks.Folder, rhs: Bookmarks.Folder) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: creatorID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: folderID.hashValue)
				hashCombine(seed: &hash, value: name.hashValue)
				return hash
			}
			
			public static func ==(lhs: Bookmarks.GetCorporationsCorporationIDBookmarksFoldersOk, rhs: Bookmarks.GetCorporationsCorporationIDBookmarksFoldersOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
		
		
		public struct GetCorporationsCorporationIDBookmarksOk: Codable, Hashable {
			
			public struct GetCorporationsCorporationIDBookmarksItem: Codable, Hashable {
				
				
				public var itemID: Int64
				public var typeID: Int
				
				public init(itemID: Int64, typeID: Int) {
					self.itemID = itemID
					self.typeID = typeID
				}
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: itemID.hashValue)
					hashCombine(seed: &hash, value: typeID.hashValue)
					return hash
				}
				
				public static func ==(lhs: Bookmarks.GetCorporationsCorporationIDBookmarksOk.GetCorporationsCorporationIDBookmarksItem, rhs: Bookmarks.GetCorporationsCorporationIDBookmarksOk.GetCorporationsCorporationIDBookmarksItem) -> Bool {
					return lhs.hashValue == rhs.hashValue
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
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: x.hashValue)
					hashCombine(seed: &hash, value: y.hashValue)
					hashCombine(seed: &hash, value: z.hashValue)
					return hash
				}
				
				public static func ==(lhs: Bookmarks.GetCorporationsCorporationIDBookmarksOk.GetCorporationsCorporationIDBookmarksCoordinates, rhs: Bookmarks.GetCorporationsCorporationIDBookmarksOk.GetCorporationsCorporationIDBookmarksCoordinates) -> Bool {
					return lhs.hashValue == rhs.hashValue
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
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: bookmarkID.hashValue)
				hashCombine(seed: &hash, value: coordinates?.hashValue ?? 0)
				hashCombine(seed: &hash, value: created.hashValue)
				hashCombine(seed: &hash, value: creatorID.hashValue)
				hashCombine(seed: &hash, value: folderID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: item?.hashValue ?? 0)
				hashCombine(seed: &hash, value: label.hashValue)
				hashCombine(seed: &hash, value: locationID.hashValue)
				hashCombine(seed: &hash, value: notes.hashValue)
				return hash
			}
			
			public static func ==(lhs: Bookmarks.GetCorporationsCorporationIDBookmarksOk, rhs: Bookmarks.GetCorporationsCorporationIDBookmarksOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
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
