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
		
		
		@objc(ESIBookmarksBookmark) public class Bookmark: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			@objc(ESIBookmarksBookmarkGetCharactersCharacterIDBookmarksItem) public class GetCharactersCharacterIDBookmarksItem: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var itemID: Int64 = Int64()
				public var typeID: Int = Int()
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let itemID = dictionary["item_id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.itemID = itemID
					guard let typeID = dictionary["type_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.typeID = typeID
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init?(coder aDecoder: NSCoder) {
					itemID = aDecoder.decodeInt64(forKey: "item_id")
					typeID = aDecoder.decodeInteger(forKey: "type_id")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(itemID, forKey: "item_id")
					aCoder.encode(typeID, forKey: "type_id")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["item_id"] = itemID.json
					json["type_id"] = typeID.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.itemID.hashValue)
					hashCombine(seed: &hash, value: self.typeID.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksItem, rhs: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksItem) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksItem) {
					itemID = other.itemID
					typeID = other.typeID
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksItem(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetCharactersCharacterIDBookmarksItem)?.hashValue == hashValue
				}
				
			}
			
			@objc(ESIBookmarksBookmarkGetCharactersCharacterIDBookmarksCoordinates) public class GetCharactersCharacterIDBookmarksCoordinates: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var x: Double = Double()
				public var y: Double = Double()
				public var z: Double = Double()
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let x = dictionary["x"] as? Double else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.x = x
					guard let y = dictionary["y"] as? Double else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.y = y
					guard let z = dictionary["z"] as? Double else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.z = z
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init?(coder aDecoder: NSCoder) {
					x = aDecoder.decodeDouble(forKey: "x")
					y = aDecoder.decodeDouble(forKey: "y")
					z = aDecoder.decodeDouble(forKey: "z")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(x, forKey: "x")
					aCoder.encode(y, forKey: "y")
					aCoder.encode(z, forKey: "z")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["x"] = x.json
					json["y"] = y.json
					json["z"] = z.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.x.hashValue)
					hashCombine(seed: &hash, value: self.y.hashValue)
					hashCombine(seed: &hash, value: self.z.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksCoordinates, rhs: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksCoordinates) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksCoordinates) {
					x = other.x
					y = other.y
					z = other.z
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksCoordinates(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetCharactersCharacterIDBookmarksCoordinates)?.hashValue == hashValue
				}
				
			}
			
			public var bookmarkID: Int = Int()
			public var coordinates: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksCoordinates? = nil
			public var created: Date = Date()
			public var creatorID: Int = Int()
			public var folderID: Int? = nil
			public var item: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksItem? = nil
			public var label: String = String()
			public var locationID: Int = Int()
			public var notes: String = String()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let bookmarkID = dictionary["bookmark_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.bookmarkID = bookmarkID
				coordinates = try? Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksCoordinates(json: dictionary["coordinates"] as? [String: Any] ?? [:])
				guard let created = DateFormatter.esiDateTimeFormatter.date(from: dictionary["created"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.created = created
				guard let creatorID = dictionary["creator_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.creatorID = creatorID
				folderID = dictionary["folder_id"] as? Int
				item = try? Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksItem(json: dictionary["item"] as? [String: Any] ?? [:])
				guard let label = dictionary["label"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.label = label
				guard let locationID = dictionary["location_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.locationID = locationID
				guard let notes = dictionary["notes"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.notes = notes
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				bookmarkID = aDecoder.decodeInteger(forKey: "bookmark_id")
				coordinates = aDecoder.decodeObject(of: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksCoordinates.self, forKey: "coordinates") 
				created = aDecoder.decodeObject(forKey: "created") as? Date ?? Date()
				creatorID = aDecoder.decodeInteger(forKey: "creator_id")
				folderID = aDecoder.containsValue(forKey: "folder_id") ? aDecoder.decodeInteger(forKey: "folder_id") : nil
				item = aDecoder.decodeObject(of: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksItem.self, forKey: "item") 
				label = aDecoder.decodeObject(forKey: "label") as? String ?? String()
				locationID = aDecoder.decodeInteger(forKey: "location_id")
				notes = aDecoder.decodeObject(forKey: "notes") as? String ?? String()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(bookmarkID, forKey: "bookmark_id")
				if let v = coordinates {
					aCoder.encode(v, forKey: "coordinates")
				}
				aCoder.encode(created, forKey: "created")
				aCoder.encode(creatorID, forKey: "creator_id")
				if let v = folderID {
					aCoder.encode(v, forKey: "folder_id")
				}
				if let v = item {
					aCoder.encode(v, forKey: "item")
				}
				aCoder.encode(label, forKey: "label")
				aCoder.encode(locationID, forKey: "location_id")
				aCoder.encode(notes, forKey: "notes")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["bookmark_id"] = bookmarkID.json
				if let v = coordinates?.json {
					json["coordinates"] = v
				}
				json["created"] = created.json
				json["creator_id"] = creatorID.json
				if let v = folderID?.json {
					json["folder_id"] = v
				}
				if let v = item?.json {
					json["item"] = v
				}
				json["label"] = label.json
				json["location_id"] = locationID.json
				json["notes"] = notes.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.bookmarkID.hashValue)
				hashCombine(seed: &hash, value: self.coordinates?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.created.hashValue)
				hashCombine(seed: &hash, value: self.creatorID.hashValue)
				hashCombine(seed: &hash, value: self.folderID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.item?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.label.hashValue)
				hashCombine(seed: &hash, value: self.locationID.hashValue)
				hashCombine(seed: &hash, value: self.notes.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Bookmarks.Bookmark, rhs: Bookmarks.Bookmark) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Bookmarks.Bookmark) {
				bookmarkID = other.bookmarkID
				coordinates = other.coordinates != nil ? Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksCoordinates(other.coordinates!) : nil
				created = other.created
				creatorID = other.creatorID
				folderID = other.folderID
				item = other.item != nil ? Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksItem(other.item!) : nil
				label = other.label
				locationID = other.locationID
				notes = other.notes
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Bookmarks.Bookmark(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Bookmark)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIBookmarksFolder) public class Folder: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var folderID: Int = Int()
			public var name: String = String()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let folderID = dictionary["folder_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.folderID = folderID
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.name = name
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				folderID = aDecoder.decodeInteger(forKey: "folder_id")
				name = aDecoder.decodeObject(forKey: "name") as? String ?? String()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(folderID, forKey: "folder_id")
				aCoder.encode(name, forKey: "name")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["folder_id"] = folderID.json
				json["name"] = name.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.folderID.hashValue)
				hashCombine(seed: &hash, value: self.name.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Bookmarks.Folder, rhs: Bookmarks.Folder) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Bookmarks.Folder) {
				folderID = other.folderID
				name = other.name
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Bookmarks.Folder(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Folder)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIBookmarksGetCorporationsCorporationIDBookmarksFoldersOk) public class GetCorporationsCorporationIDBookmarksFoldersOk: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var creatorID: Int? = nil
			public var folderID: Int = Int()
			public var name: String = String()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				creatorID = dictionary["creator_id"] as? Int
				guard let folderID = dictionary["folder_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.folderID = folderID
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.name = name
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				creatorID = aDecoder.containsValue(forKey: "creator_id") ? aDecoder.decodeInteger(forKey: "creator_id") : nil
				folderID = aDecoder.decodeInteger(forKey: "folder_id")
				name = aDecoder.decodeObject(forKey: "name") as? String ?? String()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = creatorID {
					aCoder.encode(v, forKey: "creator_id")
				}
				aCoder.encode(folderID, forKey: "folder_id")
				aCoder.encode(name, forKey: "name")
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = creatorID?.json {
					json["creator_id"] = v
				}
				json["folder_id"] = folderID.json
				json["name"] = name.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.creatorID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.folderID.hashValue)
				hashCombine(seed: &hash, value: self.name.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Bookmarks.GetCorporationsCorporationIDBookmarksFoldersOk, rhs: Bookmarks.GetCorporationsCorporationIDBookmarksFoldersOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Bookmarks.GetCorporationsCorporationIDBookmarksFoldersOk) {
				creatorID = other.creatorID
				folderID = other.folderID
				name = other.name
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Bookmarks.GetCorporationsCorporationIDBookmarksFoldersOk(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCorporationsCorporationIDBookmarksFoldersOk)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIBookmarksGetCorporationsCorporationIDBookmarksOk) public class GetCorporationsCorporationIDBookmarksOk: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			@objc(ESIBookmarksGetCorporationsCorporationIDBookmarksOkGetCorporationsCorporationIDBookmarksItem) public class GetCorporationsCorporationIDBookmarksItem: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var itemID: Int64 = Int64()
				public var typeID: Int = Int()
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let itemID = dictionary["item_id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.itemID = itemID
					guard let typeID = dictionary["type_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.typeID = typeID
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init?(coder aDecoder: NSCoder) {
					itemID = aDecoder.decodeInt64(forKey: "item_id")
					typeID = aDecoder.decodeInteger(forKey: "type_id")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(itemID, forKey: "item_id")
					aCoder.encode(typeID, forKey: "type_id")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["item_id"] = itemID.json
					json["type_id"] = typeID.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.itemID.hashValue)
					hashCombine(seed: &hash, value: self.typeID.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: Bookmarks.GetCorporationsCorporationIDBookmarksOk.GetCorporationsCorporationIDBookmarksItem, rhs: Bookmarks.GetCorporationsCorporationIDBookmarksOk.GetCorporationsCorporationIDBookmarksItem) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Bookmarks.GetCorporationsCorporationIDBookmarksOk.GetCorporationsCorporationIDBookmarksItem) {
					itemID = other.itemID
					typeID = other.typeID
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Bookmarks.GetCorporationsCorporationIDBookmarksOk.GetCorporationsCorporationIDBookmarksItem(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetCorporationsCorporationIDBookmarksItem)?.hashValue == hashValue
				}
				
			}
			
			@objc(ESIBookmarksGetCorporationsCorporationIDBookmarksOkGetCorporationsCorporationIDBookmarksCoordinates) public class GetCorporationsCorporationIDBookmarksCoordinates: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var x: Double = Double()
				public var y: Double = Double()
				public var z: Double = Double()
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let x = dictionary["x"] as? Double else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.x = x
					guard let y = dictionary["y"] as? Double else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.y = y
					guard let z = dictionary["z"] as? Double else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.z = z
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init?(coder aDecoder: NSCoder) {
					x = aDecoder.decodeDouble(forKey: "x")
					y = aDecoder.decodeDouble(forKey: "y")
					z = aDecoder.decodeDouble(forKey: "z")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(x, forKey: "x")
					aCoder.encode(y, forKey: "y")
					aCoder.encode(z, forKey: "z")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["x"] = x.json
					json["y"] = y.json
					json["z"] = z.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.x.hashValue)
					hashCombine(seed: &hash, value: self.y.hashValue)
					hashCombine(seed: &hash, value: self.z.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: Bookmarks.GetCorporationsCorporationIDBookmarksOk.GetCorporationsCorporationIDBookmarksCoordinates, rhs: Bookmarks.GetCorporationsCorporationIDBookmarksOk.GetCorporationsCorporationIDBookmarksCoordinates) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Bookmarks.GetCorporationsCorporationIDBookmarksOk.GetCorporationsCorporationIDBookmarksCoordinates) {
					x = other.x
					y = other.y
					z = other.z
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Bookmarks.GetCorporationsCorporationIDBookmarksOk.GetCorporationsCorporationIDBookmarksCoordinates(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetCorporationsCorporationIDBookmarksCoordinates)?.hashValue == hashValue
				}
				
			}
			
			public var bookmarkID: Int = Int()
			public var coordinates: Bookmarks.GetCorporationsCorporationIDBookmarksOk.GetCorporationsCorporationIDBookmarksCoordinates? = nil
			public var created: Date = Date()
			public var creatorID: Int = Int()
			public var folderID: Int? = nil
			public var item: Bookmarks.GetCorporationsCorporationIDBookmarksOk.GetCorporationsCorporationIDBookmarksItem? = nil
			public var label: String = String()
			public var locationID: Int = Int()
			public var notes: String = String()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let bookmarkID = dictionary["bookmark_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.bookmarkID = bookmarkID
				coordinates = try? Bookmarks.GetCorporationsCorporationIDBookmarksOk.GetCorporationsCorporationIDBookmarksCoordinates(json: dictionary["coordinates"] as? [String: Any] ?? [:])
				guard let created = DateFormatter.esiDateTimeFormatter.date(from: dictionary["created"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.created = created
				guard let creatorID = dictionary["creator_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.creatorID = creatorID
				folderID = dictionary["folder_id"] as? Int
				item = try? Bookmarks.GetCorporationsCorporationIDBookmarksOk.GetCorporationsCorporationIDBookmarksItem(json: dictionary["item"] as? [String: Any] ?? [:])
				guard let label = dictionary["label"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.label = label
				guard let locationID = dictionary["location_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.locationID = locationID
				guard let notes = dictionary["notes"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.notes = notes
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				bookmarkID = aDecoder.decodeInteger(forKey: "bookmark_id")
				coordinates = aDecoder.decodeObject(of: Bookmarks.GetCorporationsCorporationIDBookmarksOk.GetCorporationsCorporationIDBookmarksCoordinates.self, forKey: "coordinates") 
				created = aDecoder.decodeObject(forKey: "created") as? Date ?? Date()
				creatorID = aDecoder.decodeInteger(forKey: "creator_id")
				folderID = aDecoder.containsValue(forKey: "folder_id") ? aDecoder.decodeInteger(forKey: "folder_id") : nil
				item = aDecoder.decodeObject(of: Bookmarks.GetCorporationsCorporationIDBookmarksOk.GetCorporationsCorporationIDBookmarksItem.self, forKey: "item") 
				label = aDecoder.decodeObject(forKey: "label") as? String ?? String()
				locationID = aDecoder.decodeInteger(forKey: "location_id")
				notes = aDecoder.decodeObject(forKey: "notes") as? String ?? String()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(bookmarkID, forKey: "bookmark_id")
				if let v = coordinates {
					aCoder.encode(v, forKey: "coordinates")
				}
				aCoder.encode(created, forKey: "created")
				aCoder.encode(creatorID, forKey: "creator_id")
				if let v = folderID {
					aCoder.encode(v, forKey: "folder_id")
				}
				if let v = item {
					aCoder.encode(v, forKey: "item")
				}
				aCoder.encode(label, forKey: "label")
				aCoder.encode(locationID, forKey: "location_id")
				aCoder.encode(notes, forKey: "notes")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["bookmark_id"] = bookmarkID.json
				if let v = coordinates?.json {
					json["coordinates"] = v
				}
				json["created"] = created.json
				json["creator_id"] = creatorID.json
				if let v = folderID?.json {
					json["folder_id"] = v
				}
				if let v = item?.json {
					json["item"] = v
				}
				json["label"] = label.json
				json["location_id"] = locationID.json
				json["notes"] = notes.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.bookmarkID.hashValue)
				hashCombine(seed: &hash, value: self.coordinates?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.created.hashValue)
				hashCombine(seed: &hash, value: self.creatorID.hashValue)
				hashCombine(seed: &hash, value: self.folderID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.item?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.label.hashValue)
				hashCombine(seed: &hash, value: self.locationID.hashValue)
				hashCombine(seed: &hash, value: self.notes.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Bookmarks.GetCorporationsCorporationIDBookmarksOk, rhs: Bookmarks.GetCorporationsCorporationIDBookmarksOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Bookmarks.GetCorporationsCorporationIDBookmarksOk) {
				bookmarkID = other.bookmarkID
				coordinates = other.coordinates != nil ? Bookmarks.GetCorporationsCorporationIDBookmarksOk.GetCorporationsCorporationIDBookmarksCoordinates(other.coordinates!) : nil
				created = other.created
				creatorID = other.creatorID
				folderID = other.folderID
				item = other.item != nil ? Bookmarks.GetCorporationsCorporationIDBookmarksOk.GetCorporationsCorporationIDBookmarksItem(other.item!) : nil
				label = other.label
				locationID = other.locationID
				notes = other.notes
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Bookmarks.GetCorporationsCorporationIDBookmarksOk(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCorporationsCorporationIDBookmarksOk)?.hashValue == hashValue
			}
			
		}
		
		
	}
	
}
