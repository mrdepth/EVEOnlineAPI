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
		
		public func listBookmarks(characterID: Int, page: Int? = nil, completionBlock:((Result<[Bookmarks.Bookmark]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-bookmarks.read_character_bookmarks.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
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
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Bookmarks.Bookmark]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func listCorporationBookmarks(corporationID: Int, page: Int? = nil, completionBlock:((Result<[Bookmarks.GetCorporationsCorporationIDBookmarksOk]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-bookmarks.read_corporation_bookmarks.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
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
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Bookmarks.GetCorporationsCorporationIDBookmarksOk]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func listBookmarkFolders(characterID: Int, page: Int? = nil, completionBlock:((Result<[Bookmarks.Folder]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-bookmarks.read_character_bookmarks.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
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
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Bookmarks.Folder]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func listCorporationBookmarkFolders(corporationID: Int, page: Int? = nil, completionBlock:((Result<[Bookmarks.GetCorporationsCorporationIDBookmarksFoldersOk]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-bookmarks.read_corporation_bookmarks.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
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
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Bookmarks.GetCorporationsCorporationIDBookmarksFoldersOk]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		public struct Bookmark: Codable, Hashable {
			
			public struct GetCharactersCharacterIDBookmarksItem: Codable, Hashable {
				
				
				public let itemID: Int64
				public let typeID: Int
				
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
				
				
				public let x: Double
				public let y: Double
				public let z: Double
				
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
			
			public let bookmarkID: Int
			public let coordinates: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksCoordinates?
			public let created: Date
			public let creatorID: Int
			public let folderID: Int?
			public let item: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksItem?
			public let label: String
			public let locationID: Int
			public let notes: String
			
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
			
			
			public let folderID: Int
			public let name: String
			
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
			
			
			public let creatorID: Int?
			public let folderID: Int
			public let name: String
			
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
				
				
				public let itemID: Int64
				public let typeID: Int
				
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
				
				
				public let x: Double
				public let y: Double
				public let z: Double
				
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
			
			public let bookmarkID: Int
			public let coordinates: Bookmarks.GetCorporationsCorporationIDBookmarksOk.GetCorporationsCorporationIDBookmarksCoordinates?
			public let created: Date
			public let creatorID: Int
			public let folderID: Int?
			public let item: Bookmarks.GetCorporationsCorporationIDBookmarksOk.GetCorporationsCorporationIDBookmarksItem?
			public let label: String
			public let locationID: Int
			public let notes: String
			
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
