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
		
		public func listBookmarkFolders(characterID: Int, completionBlock:((Result<[Bookmarks.Folder]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-bookmarks.read_character_bookmarks.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/bookmarks/folders/"
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
		
		public func listBookmarks(characterID: Int, completionBlock:((Result<[Bookmarks.Bookmark]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-bookmarks.read_character_bookmarks.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/bookmarks/"
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
		
		
		public class Bookmark: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class GetCharactersCharacterIDBookmarksTarget: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				public class GetCharactersCharacterIDBookmarksItem: NSObject, NSSecureCoding, NSCopying, JSONCoding {
					
					
					public var itemID: Int64 = Int64()
					public var typeID: Int = Int()
					
					public static var supportsSecureCoding: Bool {
						return true
					}
					
					public required init(json: Any) throws {
						guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
						
						guard let itemID = dictionary["item_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
						self.itemID = itemID
						guard let typeID = dictionary["type_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
						self.typeID = typeID
						
						super.init()
					}
					
					override public init() {
						super.init()
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
					
					public static func ==(lhs: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget.GetCharactersCharacterIDBookmarksItem, rhs: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget.GetCharactersCharacterIDBookmarksItem) -> Bool {
						return lhs.hashValue == rhs.hashValue
					}
					
					init(_ other: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget.GetCharactersCharacterIDBookmarksItem) {
						itemID = other.itemID
						typeID = other.typeID
					}
					
					public func copy(with zone: NSZone? = nil) -> Any {
						return Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget.GetCharactersCharacterIDBookmarksItem(self)
					}
					
					
					public override func isEqual(_ object: Any?) -> Bool {
						return (object as? GetCharactersCharacterIDBookmarksItem)?.hashValue == hashValue
					}
					
				}
				
				public class GetCharactersCharacterIDBookmarksCoordinates: NSObject, NSSecureCoding, NSCopying, JSONCoding {
					
					
					public var x: Double = Double()
					public var y: Double = Double()
					public var z: Double = Double()
					
					public static var supportsSecureCoding: Bool {
						return true
					}
					
					public required init(json: Any) throws {
						guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
						
						guard let x = dictionary["x"] as? Double else {throw ESIError.invalidFormat(type(of: self), dictionary)}
						self.x = x
						guard let y = dictionary["y"] as? Double else {throw ESIError.invalidFormat(type(of: self), dictionary)}
						self.y = y
						guard let z = dictionary["z"] as? Double else {throw ESIError.invalidFormat(type(of: self), dictionary)}
						self.z = z
						
						super.init()
					}
					
					override public init() {
						super.init()
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
					
					public static func ==(lhs: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget.GetCharactersCharacterIDBookmarksCoordinates, rhs: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget.GetCharactersCharacterIDBookmarksCoordinates) -> Bool {
						return lhs.hashValue == rhs.hashValue
					}
					
					init(_ other: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget.GetCharactersCharacterIDBookmarksCoordinates) {
						x = other.x
						y = other.y
						z = other.z
					}
					
					public func copy(with zone: NSZone? = nil) -> Any {
						return Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget.GetCharactersCharacterIDBookmarksCoordinates(self)
					}
					
					
					public override func isEqual(_ object: Any?) -> Bool {
						return (object as? GetCharactersCharacterIDBookmarksCoordinates)?.hashValue == hashValue
					}
					
				}
				
				public var coordinates: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget.GetCharactersCharacterIDBookmarksCoordinates? = nil
				public var item: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget.GetCharactersCharacterIDBookmarksItem? = nil
				public var locationID: Int64 = Int64()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					coordinates = try? Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget.GetCharactersCharacterIDBookmarksCoordinates(json: dictionary["coordinates"] as? [String: Any] ?? [:])
					item = try? Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget.GetCharactersCharacterIDBookmarksItem(json: dictionary["item"] as? [String: Any] ?? [:])
					guard let locationID = dictionary["location_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.locationID = locationID
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					coordinates = aDecoder.decodeObject(of: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget.GetCharactersCharacterIDBookmarksCoordinates.self, forKey: "coordinates") 
					item = aDecoder.decodeObject(of: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget.GetCharactersCharacterIDBookmarksItem.self, forKey: "item") 
					locationID = aDecoder.decodeInt64(forKey: "location_id")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					if let v = coordinates {
						aCoder.encode(v, forKey: "coordinates")
					}
					if let v = item {
						aCoder.encode(v, forKey: "item")
					}
					aCoder.encode(locationID, forKey: "location_id")
				}
				
				public var json: Any {
					var json = [String: Any]()
					if let v = coordinates?.json {
						json["coordinates"] = v
					}
					if let v = item?.json {
						json["item"] = v
					}
					json["location_id"] = locationID.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.coordinates?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.item?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.locationID.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget, rhs: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget) {
					coordinates = other.coordinates != nil ? Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget.GetCharactersCharacterIDBookmarksCoordinates(other.coordinates!) : nil
					item = other.item != nil ? Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget.GetCharactersCharacterIDBookmarksItem(other.item!) : nil
					locationID = other.locationID
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetCharactersCharacterIDBookmarksTarget)?.hashValue == hashValue
				}
				
			}
			
			public var bookmarkID: Int64 = Int64()
			public var createDate: Date = Date()
			public var creatorID: Int = Int()
			public var folderID: Int? = nil
			public var memo: String = String()
			public var note: String = String()
			public var ownerID: Int = Int()
			public var target: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget = Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let bookmarkID = dictionary["bookmark_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.bookmarkID = bookmarkID
				guard let createDate = DateFormatter.esiDateTimeFormatter.date(from: dictionary["create_date"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.createDate = createDate
				guard let creatorID = dictionary["creator_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.creatorID = creatorID
				folderID = dictionary["folder_id"] as? Int
				guard let memo = dictionary["memo"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.memo = memo
				guard let note = dictionary["note"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.note = note
				guard let ownerID = dictionary["owner_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.ownerID = ownerID
				target = try Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget(json: dictionary["target"] as? [String: Any] ?? [:])
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				bookmarkID = aDecoder.decodeInt64(forKey: "bookmark_id")
				createDate = aDecoder.decodeObject(forKey: "create_date") as? Date ?? Date()
				creatorID = aDecoder.decodeInteger(forKey: "creator_id")
				folderID = aDecoder.containsValue(forKey: "folder_id") ? aDecoder.decodeInteger(forKey: "folder_id") : nil
				memo = aDecoder.decodeObject(forKey: "memo") as? String ?? String()
				note = aDecoder.decodeObject(forKey: "note") as? String ?? String()
				ownerID = aDecoder.decodeInteger(forKey: "owner_id")
				target = aDecoder.decodeObject(of: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget.self, forKey: "target")  ?? Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(bookmarkID, forKey: "bookmark_id")
				aCoder.encode(createDate, forKey: "create_date")
				aCoder.encode(creatorID, forKey: "creator_id")
				if let v = folderID {
					aCoder.encode(v, forKey: "folder_id")
				}
				aCoder.encode(memo, forKey: "memo")
				aCoder.encode(note, forKey: "note")
				aCoder.encode(ownerID, forKey: "owner_id")
				aCoder.encode(target, forKey: "target")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["bookmark_id"] = bookmarkID.json
				json["create_date"] = createDate.json
				json["creator_id"] = creatorID.json
				if let v = folderID?.json {
					json["folder_id"] = v
				}
				json["memo"] = memo.json
				json["note"] = note.json
				json["owner_id"] = ownerID.json
				json["target"] = target.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.bookmarkID.hashValue)
				hashCombine(seed: &hash, value: self.createDate.hashValue)
				hashCombine(seed: &hash, value: self.creatorID.hashValue)
				hashCombine(seed: &hash, value: self.folderID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.memo.hashValue)
				hashCombine(seed: &hash, value: self.note.hashValue)
				hashCombine(seed: &hash, value: self.ownerID.hashValue)
				hashCombine(seed: &hash, value: self.target.hashValue)
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
				createDate = other.createDate
				creatorID = other.creatorID
				folderID = other.folderID
				memo = other.memo
				note = other.note
				ownerID = other.ownerID
				target = Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget(other.target)
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Bookmarks.Bookmark(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Bookmark)?.hashValue == hashValue
			}
			
		}
		
		
		public class Folder: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var folderID: Int? = nil
			public var name: String? = nil
			public var ownerID: Int? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				folderID = dictionary["folder_id"] as? Int
				name = dictionary["name"] as? String
				ownerID = dictionary["owner_id"] as? Int
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				folderID = aDecoder.containsValue(forKey: "folder_id") ? aDecoder.decodeInteger(forKey: "folder_id") : nil
				name = aDecoder.decodeObject(forKey: "name") as? String
				ownerID = aDecoder.containsValue(forKey: "owner_id") ? aDecoder.decodeInteger(forKey: "owner_id") : nil
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = folderID {
					aCoder.encode(v, forKey: "folder_id")
				}
				if let v = name {
					aCoder.encode(v, forKey: "name")
				}
				if let v = ownerID {
					aCoder.encode(v, forKey: "owner_id")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = folderID?.json {
					json["folder_id"] = v
				}
				if let v = name?.json {
					json["name"] = v
				}
				if let v = ownerID?.json {
					json["owner_id"] = v
				}
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.folderID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.name?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.ownerID?.hashValue ?? 0)
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
				ownerID = other.ownerID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Bookmarks.Folder(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Folder)?.hashValue == hashValue
			}
			
		}
		
		
	}
	
}
