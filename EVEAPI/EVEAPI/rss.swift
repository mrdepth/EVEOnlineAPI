//
//  rss.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.06.17.
//  Copyright © 2017 Artem Shimanski. All rights reserved.
//

import Foundation
import Alamofire

enum RSSError: Error {
	case invalidFormat(Any.Type, Any)
}

extension URL {
	init?(string: String?) {
		guard let string = string else {return nil}
		self.init(string: string)
	}
}




public enum RSS {
	
	static let dateFormatters: [DateFormatter] = {
		return ["yyyy-MM-dd'T'HH:mmZZZ",
		        "yyyy-MM-dd'T'HH:mm:ssZZZ",
		        "yyyy-MM-dd'T'HH:mm:ss.SZZZ",
		        "yyyy-MM-dd"].map { format -> DateFormatter in
					let formatter = DateFormatter()
					formatter.locale = Locale(identifier: "en_US_POSIX")
					formatter.dateFormat = format
					return formatter
		}
	}()
	
	public class Feed: NSObject, NSSecureCoding, JSONCoding {
		public var title: String?
		public var feedDescription: String?
		public var copyright: String?
		public var language: String?
		public var link: URL?
		public var publisher: String?
		public var updated: Date?
		public var image: Image?
		public var items: [Item]?
		
		public static var supportsSecureCoding: Bool {
			return true
		}
		
		public required convenience init(json: Any) throws {
			guard let dic = json as? [String: Any] else {throw RSSError.invalidFormat(type(of: self), json)}
			if let rdf = dic["RDF"] {
				try self.init(rdf: rdf)
			}
			else if let rss = dic["rss"] {
				try self.init(rss: rss)
			}
			else if let feed = dic["feed"] {
				try self.init(atom: feed)
			}
			else {
				self.init()
			}
		}
		
		public init(rss: Any) throws {
			guard let channel = (rss as? [String: Any])?["channel"] as? [String: Any] else {throw RSSError.invalidFormat(type(of: self), rss)}
			title = channel["title"] as? String
			feedDescription = channel["description"] as? String
			copyright = channel["copyright"] as? String
			language = channel["language"] as? String
			link = URL(string: channel["link"] as? String)
			publisher = channel["publisher"] as? String
			updated = DateFormatter.rfc822DateFormatter.date(from: channel["pubDate"] as? String ?? "")
			
			if let items = channel["item"] {
				self.items = (items as? [Any] ?? [items]).flatMap {
					return try? Item(rss: $0)
				}
			}
			else {
				self.items = nil
			}

			super.init()
		}
		
		public init(rdf: Any) throws {
			guard let dic = rdf as? [String: Any] else {throw RSSError.invalidFormat(type(of: self), rdf)}
			guard let channel = dic["channel"] as? [String: Any] else {throw RSSError.invalidFormat(type(of: self), rdf)}
			title = channel["title"] as? String
			link = URL(string: channel["link"] as? String)
			feedDescription = channel["description"] as? String
			if let image = dic["image"] {
				self.image = try? Image(rdf: image)
			}
			if let items = dic["item"] {
				self.items = (items as? [Any] ?? [items]).flatMap {
					return try? Item(rdf: $0)
				}
			}
			else {
				self.items = nil
			}
			super.init()
		}
		
		public init(atom: Any) throws {
			guard let dic = atom as? [String: Any] else {throw RSSError.invalidFormat(type(of: self), atom)}
			title = dic["title"] as? String
			link = URL(string: (dic["link"] as? [String: Any])?["href"] as? String)
			feedDescription = dic["subtitle"] as? String
			if let image = dic["image"] {
				self.image = try? Image(atom: image)
			}
			updated = DateFormatter.rfc822DateFormatter.date(from: dic["updated"] as? String ?? "")

			if let items = dic["entry"] {
				self.items = (items as? [Any] ?? [items]).flatMap {
					return try? Item(atom: $0)
				}
			}
			else {
				self.items = nil
			}
			super.init()
		}
		
		override public init() {
			super.init()
		}
		
		public required init?(coder aDecoder: NSCoder) {
			title = aDecoder.decodeObject(forKey: "title") as? String
			feedDescription = aDecoder.decodeObject(forKey: "feedDescription") as? String
			copyright = aDecoder.decodeObject(forKey: "copyright") as? String
			language = aDecoder.decodeObject(forKey: "language") as? String
			link = aDecoder.decodeObject(forKey: "link") as? URL
			publisher = aDecoder.decodeObject(forKey: "publisher") as? String
			updated = aDecoder.decodeObject(forKey: "updated") as? Date
			image = aDecoder.decodeObject(of: Image.self, forKey: "image")
			items = aDecoder.decodeObject(of: [Item.self], forKey: "items") as? [Item]

			super.init()
		}
		
		public func encode(with aCoder: NSCoder) {
			aCoder.encode(title, forKey: "title")
			aCoder.encode(feedDescription, forKey: "feedDescription")
			aCoder.encode(copyright, forKey: "copyright")
			aCoder.encode(language, forKey: "language")
			aCoder.encode(link, forKey: "link")
			aCoder.encode(publisher, forKey: "publisher")
			aCoder.encode(updated, forKey: "updated")
			aCoder.encode(image, forKey: "image")
			aCoder.encode(items, forKey: "items")
		}
		
		public var json: Any {
			return ""
		}
		
		override public var hashValue: Int {
			var hash: Int = 0
			hashCombine(seed: &hash, value: title?.hashValue ?? 0)
			hashCombine(seed: &hash, value: feedDescription?.hashValue ?? 0)
			hashCombine(seed: &hash, value: copyright?.hashValue ?? 0)
			hashCombine(seed: &hash, value: language?.hashValue ?? 0)
			hashCombine(seed: &hash, value: link?.hashValue ?? 0)
			hashCombine(seed: &hash, value: publisher?.hashValue ?? 0)
			hashCombine(seed: &hash, value: updated?.hashValue ?? 0)
			hashCombine(seed: &hash, value: image?.hashValue ?? 0)
			items?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
			return hash
		}
		
		public static func ==(lhs: Feed, rhs: Feed) -> Bool {
			return lhs.hashValue == rhs.hashValue
		}
		
		init(_ other: Feed) {
			title = other.title
			feedDescription = other.feedDescription
			copyright = other.copyright
			link = other.link
			publisher = other.publisher
			updated = other.updated
			image = other.image
			items = other.items
		}
		
		public func copy(with zone: NSZone? = nil) -> Any {
			return Feed(self)
		}
		
		
		public override func isEqual(_ object: Any?) -> Bool {
			return (object as? Feed)?.hashValue == hashValue
		}
		
	}
	
	public class Image: NSObject, NSSecureCoding {
		public var title: String?
		public var link: URL?
		public var url: URL?
		
		public init(rss: Any) throws {
			guard let dic = rss as? [String: Any] else {throw RSSError.invalidFormat(type(of: self), rss)}
			title = dic["title"] as? String
			link = URL(string: dic["link"] as? String)
			url = URL(string: dic["url"] as? String)
			super.init()
		}
		
		public init(rdf: Any) throws {
			guard let dic = rdf as? [String: Any] else {throw RSSError.invalidFormat(type(of: self), rdf)}
			title = dic["title"] as? String
			link = URL(string: dic["link"] as? String)
			url = URL(string: dic["url"] as? String)
			super.init()
		}
		
		public init(atom: Any) throws {
			guard let s = atom as? String else {throw RSSError.invalidFormat(type(of: self), atom)}
			link = URL(string: s)
			url = URL(string: s)
			super.init()
		}
		
		public static var supportsSecureCoding: Bool {
			return true
		}
		
		public required init?(coder aDecoder: NSCoder) {
			title = aDecoder.decodeObject(forKey: "title") as? String
			link = aDecoder.decodeObject(forKey: "link") as? URL
			url = aDecoder.decodeObject(forKey: "url") as? URL
			super.init()
		}
		
		public func encode(with aCoder: NSCoder) {
			aCoder.encode(title, forKey: "title")
			aCoder.encode(link, forKey: "link")
			aCoder.encode(url, forKey: "url")
		}

		override public var hashValue: Int {
			var hash: Int = 0
			hashCombine(seed: &hash, value: title?.hashValue ?? 0)
			hashCombine(seed: &hash, value: link?.hashValue ?? 0)
			hashCombine(seed: &hash, value: url?.hashValue ?? 0)
			return hash
		}
		
		public static func ==(lhs: Image, rhs: Image) -> Bool {
			return lhs.hashValue == rhs.hashValue
		}
	}
	
	public class Enclosure: NSObject, NSSecureCoding {
		public var url: URL?
		public var length: Int?
		public var type: String?
		
		public init(rss: Any) throws {
			guard let dic = rss as? [String: Any] else {throw RSSError.invalidFormat(type(of: self), rss)}
			url = URL(string: dic["url"] as? String)
			length = dic["length"] as? Int
			type = dic["type"] as? String
			super.init()
		}
		
		public init(rdf: Any) throws {
			guard let dic = rdf as? [String: Any] else {throw RSSError.invalidFormat(type(of: self), rdf)}
			url = URL(string: dic["url"] as? String)
			length = dic["length"] as? Int
			type = dic["type"] as? String
			super.init()
		}
		
		public init(atom: Any) throws {
			guard let dic = atom as? [String: Any] else {throw RSSError.invalidFormat(type(of: self), atom)}
			url = URL(string: dic["href"] as? String)
			length = dic["length"] as? Int
			type = dic["type"] as? String
			super.init()
		}
		
		public static var supportsSecureCoding: Bool {
			return true
		}
		
		public required init?(coder aDecoder: NSCoder) {
			url = aDecoder.decodeObject(forKey: "url") as? URL
			length = aDecoder.decodeObject(forKey: "length") as? Int
			type = aDecoder.decodeObject(forKey: "type") as? String
			super.init()
		}
		
		public func encode(with aCoder: NSCoder) {
			aCoder.encode(url, forKey: "url")
			aCoder.encode(length, forKey: "length")
			aCoder.encode(type, forKey: "type")
		}
		
		override public var hashValue: Int {
			var hash: Int = 0
			hashCombine(seed: &hash, value: url?.hashValue ?? 0)
			hashCombine(seed: &hash, value: length?.hashValue ?? 0)
			hashCombine(seed: &hash, value: type?.hashValue ?? 0)
			return hash
		}
		
		public static func ==(lhs: Enclosure, rhs: Enclosure) -> Bool {
			return lhs.hashValue == rhs.hashValue
		}
	}
	
	public class Item: NSObject, NSSecureCoding {
		public var title: String?
		public var link: URL?
		public var summary: String?
		public var author: String?
		public var category: String?
		public var guid: String?
		public var updated: Date?
		public var source: Source?
		public var enclosure: Enclosure?
		
		public init(rss: Any) throws {
			guard let dic = rss as? [String: Any] else {throw RSSError.invalidFormat(type(of: self), rss)}
			title = dic["title"] as? String
			link = URL(string: dic["link"] as? String)
			summary = (dic["description"] as? String) ?? (dic["summary"] as? [String: Any])?["_"] as? String
			author = dic["author"] as? String
			category = dic["category"] as? String
			guid = dic["guid"] as? String
			updated = DateFormatter.rfc822DateFormatter.date(from: dic["pubDate"] as? String ?? "")
			if let enclosure = dic["enclosure"] {
				self.enclosure = try? Enclosure(rss: enclosure)
			}
			super.init()
		}
		
		public init(rdf: Any) throws {
			guard let dic = rdf as? [String: Any] else {throw RSSError.invalidFormat(type(of: self), rdf)}
			title = dic["title"] as? String
			link = URL(string: dic["url"] as? String)
			summary = dic["description"] as? String
			updated = DateFormatter.rfc822DateFormatter.date(from: dic["pubDate"] as? String ?? "")
			super.init()
		}
		
		public init(atom: Any) throws {
			guard let dic = atom as? [String: Any] else {throw RSSError.invalidFormat(type(of: self), atom)}
			title = (dic["title"] as? String) ?? (dic["title"] as? [String: Any])?["_"] as? String
			
			link = {
				guard let link = dic["link"] else {return nil}
				switch link {
				case let s as String:
					return URL(string: s)
				case let dic as [String: Any]:
					return URL(string: (dic["href"] ?? dic["_"]) as? String)
				case let array as [[String: Any]]:
					let i = array.first {$0["rel"] as? String == "alternate"} ?? array.first
					return URL(string: (i?["href"] ?? i?["_"]) as? String)
				case let array as [String]:
					return URL(string: array.first)
				default:
					return nil
				}
			}()
			
			if let content = dic["content"],
				let text = content as? String ?? (content as? [String: Any])?["_"] as? String {
					summary = text
			}
			else {
				summary = dic["summary"] as? String
			}
			guid = dic["id"] as? String
			updated = {
				guard let updated = dic["updated"] as? String else {return nil}
				for formatter in RSS.dateFormatters {
					if let date = formatter.date(from: updated) {
						return date
					}
				}
				return nil
			}()
			if let enclosure = dic["enclosure"] {
				self.enclosure = try? Enclosure(rss: enclosure)
			}
			super.init()
		}
		
		public static var supportsSecureCoding: Bool {
			return true
		}
		
		public required init?(coder aDecoder: NSCoder) {
			title = aDecoder.decodeObject(forKey: "title") as? String
			link = aDecoder.decodeObject(forKey: "link") as? URL
			summary = aDecoder.decodeObject(forKey: "summary") as? String
			author = aDecoder.decodeObject(forKey: "author") as? String
			category = aDecoder.decodeObject(forKey: "category") as? String
			guid = aDecoder.decodeObject(forKey: "guid") as? String
			updated = aDecoder.decodeObject(forKey: "updated") as? Date
			source = aDecoder.decodeObject(of: Source.self, forKey: "source")
			enclosure = aDecoder.decodeObject(of: Enclosure.self, forKey: "enclosure")
			super.init()
		}
		
		public func encode(with aCoder: NSCoder) {
			aCoder.encode(title, forKey: "title")
			aCoder.encode(link, forKey: "link")
			aCoder.encode(summary, forKey: "summary")
			aCoder.encode(author, forKey: "author")
			aCoder.encode(category, forKey: "category")
			aCoder.encode(guid, forKey: "guid")
			aCoder.encode(updated, forKey: "updated")
			aCoder.encode(source, forKey: "source")
			aCoder.encode(enclosure, forKey: "enclosure")
		}
		
		override public var hashValue: Int {
			var hash: Int = 0
			hashCombine(seed: &hash, value: title?.hashValue ?? 0)
			hashCombine(seed: &hash, value: link?.hashValue ?? 0)
			hashCombine(seed: &hash, value: summary?.hashValue ?? 0)
			hashCombine(seed: &hash, value: author?.hashValue ?? 0)
			hashCombine(seed: &hash, value: category?.hashValue ?? 0)
			hashCombine(seed: &hash, value: guid?.hashValue ?? 0)
			hashCombine(seed: &hash, value: updated?.hashValue ?? 0)
			hashCombine(seed: &hash, value: source?.hashValue ?? 0)
			hashCombine(seed: &hash, value: enclosure?.hashValue ?? 0)
			return hash
		}
		
		public static func ==(lhs: Item, rhs: Item) -> Bool {
			return lhs.hashValue == rhs.hashValue
		}
	}
	
	public class Source: NSObject, NSSecureCoding {
		var title: String?
		var url: URL?
		
		public init(rss: Any) throws {
			guard let dic = rss as? [String: Any] else {throw RSSError.invalidFormat(type(of: self), rss)}
			url = URL(string: dic["url"] as? String)
			title = dic["title"] as? String
			super.init()
		}
		
		public init(rdf: Any) throws {
			guard let dic = rdf as? [String: Any] else {throw RSSError.invalidFormat(type(of: self), rdf)}
			url = URL(string: dic["url"] as? String)
			title = dic["title"] as? String
			super.init()
		}
		
		public init(atom: Any) throws {
			guard let dic = atom as? [String: Any] else {throw RSSError.invalidFormat(type(of: self), atom)}
			url = URL(string: dic["href"] as? String)
			title = dic["title"] as? String
			super.init()
		}
		
		
		public static var supportsSecureCoding: Bool {
			return true
		}
		
		public required init?(coder aDecoder: NSCoder) {
			title = aDecoder.decodeObject(forKey: "title") as? String
			url = aDecoder.decodeObject(forKey: "url") as? URL
			super.init()
		}
		
		public func encode(with aCoder: NSCoder) {
			aCoder.encode(title, forKey: "title")
			aCoder.encode(url, forKey: "url")
		}
		
		override public var hashValue: Int {
			var hash: Int = 0
			hashCombine(seed: &hash, value: title?.hashValue ?? 0)
			hashCombine(seed: &hash, value: url?.hashValue ?? 0)
			return hash
		}
		
		public static func ==(lhs: Source, rhs: Source) -> Bool {
			return lhs.hashValue == rhs.hashValue
		}
	}
	
}

extension DataRequest {
	
	@discardableResult
	public func responseRSS<T: JSONCoding>(queue: DispatchQueue? = nil,
	                        options: JSONSerialization.ReadingOptions = .allowFragments,
	                        completionHandler: @escaping (DataResponse<T>) -> Void) -> Self
	{
		let serializer = DataResponseSerializer<T> { (request, response, data, error) -> Result<T> in
			do {
				guard let data = data,
					let value = try XMLParser.xmlObject(data: data) as? [String: Any] else {throw EVEError.objectSerialization(reason: "No XML Data")}
				return .success(try T(json: value))
			}
			catch {
				return .failure(error)
			}
		}
		
		return response(
			queue: queue,
			responseSerializer: serializer,
			completionHandler: completionHandler
		)
	}
}
