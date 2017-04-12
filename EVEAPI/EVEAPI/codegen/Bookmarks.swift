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
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-bookmarks.read_character_bookmarks.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/bookmarks/folders/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Bookmarks.Folder]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func listBookmarks(characterID: Int, completionBlock:((Result<[Bookmarks.Bookmark]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-bookmarks.read_character_bookmarks.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/bookmarks/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Bookmarks.Bookmark]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		public class GetCharactersCharacterIDBookmarksFoldersForbidden: NSObject, NSCoding , JSONCoding {
			
			
			public var error: String?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				error = nil
				
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Bookmarks.GetCharactersCharacterIDBookmarksFoldersForbidden, rhs: Bookmarks.GetCharactersCharacterIDBookmarksFoldersForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDBookmarksFoldersInternalServerError: NSObject, NSCoding , JSONCoding {
			
			
			public var error: String?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				error = nil
				
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Bookmarks.GetCharactersCharacterIDBookmarksFoldersInternalServerError, rhs: Bookmarks.GetCharactersCharacterIDBookmarksFoldersInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class Bookmark: NSObject, NSCoding , JSONCoding {
			
			public class GetCharactersCharacterIDBookmarksTarget: NSObject, NSCoding , JSONCoding {
				
				public class GetCharactersCharacterIDBookmarksCoordinates: NSObject, NSCoding , JSONCoding {
					
					
					public var x: Double
					public var y: Double
					public var z: Double
					
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
						x = Double()
						y = Double()
						z = Double()
						
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
					
					override public var hashValue: Int {
						var hash: Int = 0
						hashCombine(seed: &hash, value: x.hashValue)
						hashCombine(seed: &hash, value: y.hashValue)
						hashCombine(seed: &hash, value: z.hashValue)
						return hash
					}
					
					public static func ==(lhs: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget.GetCharactersCharacterIDBookmarksCoordinates, rhs: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget.GetCharactersCharacterIDBookmarksCoordinates) -> Bool {
						return lhs.hashValue == rhs.hashValue
					}
					
				}
				
				public class GetCharactersCharacterIDBookmarksItem: NSObject, NSCoding , JSONCoding {
					
					
					public var itemID: Int64
					public var typeID: Int
					
					public required init(json: Any) throws {
						guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
						
						guard let itemID = dictionary["item_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
						self.itemID = itemID
						guard let typeID = dictionary["type_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
						self.typeID = typeID
						
						super.init()
					}
					
					override public init() {
						itemID = Int64()
						typeID = Int()
						
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
					
					override public var hashValue: Int {
						var hash: Int = 0
						hashCombine(seed: &hash, value: itemID.hashValue)
						hashCombine(seed: &hash, value: typeID.hashValue)
						return hash
					}
					
					public static func ==(lhs: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget.GetCharactersCharacterIDBookmarksItem, rhs: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget.GetCharactersCharacterIDBookmarksItem) -> Bool {
						return lhs.hashValue == rhs.hashValue
					}
					
				}
				
				public var coordinates: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget.GetCharactersCharacterIDBookmarksCoordinates?
				public var item: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget.GetCharactersCharacterIDBookmarksItem?
				public var locationID: Int64
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					coordinates = try? Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget.GetCharactersCharacterIDBookmarksCoordinates(json: dictionary["coordinates"] as? [String: Any] ?? [:])
					item = try? Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget.GetCharactersCharacterIDBookmarksItem(json: dictionary["item"] as? [String: Any] ?? [:])
					guard let locationID = dictionary["location_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.locationID = locationID
					
					super.init()
				}
				
				override public init() {
					coordinates = nil
					item = nil
					locationID = Int64()
					
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					coordinates = aDecoder.decodeObject(of: [Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget.GetCharactersCharacterIDBookmarksCoordinates.self], forKey: "coordinates") as? Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget.GetCharactersCharacterIDBookmarksCoordinates
					item = aDecoder.decodeObject(of: [Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget.GetCharactersCharacterIDBookmarksItem.self], forKey: "item") as? Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget.GetCharactersCharacterIDBookmarksItem
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: coordinates?.hashValue ?? 0)
					hashCombine(seed: &hash, value: item?.hashValue ?? 0)
					hashCombine(seed: &hash, value: locationID.hashValue)
					return hash
				}
				
				public static func ==(lhs: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget, rhs: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
			}
			
			public var bookmarkID: Int64
			public var createDate: Date
			public var creatorID: Int
			public var folderID: Int?
			public var memo: String
			public var note: String
			public var ownerID: Int
			public var target: Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let bookmarkID = dictionary["bookmark_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.bookmarkID = bookmarkID
				guard let createDate = DateFormatter.esiDateFormatter.date(from: dictionary["create_date"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
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
				bookmarkID = Int64()
				createDate = Date()
				creatorID = Int()
				folderID = nil
				memo = String()
				note = String()
				ownerID = Int()
				target = Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget()
				
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
				target = aDecoder.decodeObject(of: [Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget.self], forKey: "target") as? Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget ?? Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget()
				
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: bookmarkID.hashValue)
				hashCombine(seed: &hash, value: createDate.hashValue)
				hashCombine(seed: &hash, value: creatorID.hashValue)
				hashCombine(seed: &hash, value: folderID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: memo.hashValue)
				hashCombine(seed: &hash, value: note.hashValue)
				hashCombine(seed: &hash, value: ownerID.hashValue)
				hashCombine(seed: &hash, value: target.hashValue)
				return hash
			}
			
			public static func ==(lhs: Bookmarks.Bookmark, rhs: Bookmarks.Bookmark) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class Folder: NSObject, NSCoding , JSONCoding {
			
			
			public var folderID: Int?
			public var name: String?
			public var ownerID: Int?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				folderID = dictionary["folder_id"] as? Int
				name = dictionary["name"] as? String
				ownerID = dictionary["owner_id"] as? Int
				
				super.init()
			}
			
			override public init() {
				folderID = nil
				name = nil
				ownerID = nil
				
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: folderID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: name?.hashValue ?? 0)
				hashCombine(seed: &hash, value: ownerID?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Bookmarks.Folder, rhs: Bookmarks.Folder) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDBookmarksInternalServerError: NSObject, NSCoding , JSONCoding {
			
			
			public var error: String?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				error = nil
				
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Bookmarks.GetCharactersCharacterIDBookmarksInternalServerError, rhs: Bookmarks.GetCharactersCharacterIDBookmarksInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDBookmarksForbidden: NSObject, NSCoding , JSONCoding {
			
			
			public var error: String?
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				error = nil
				
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Bookmarks.GetCharactersCharacterIDBookmarksForbidden, rhs: Bookmarks.GetCharactersCharacterIDBookmarksForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
	}
	
}
