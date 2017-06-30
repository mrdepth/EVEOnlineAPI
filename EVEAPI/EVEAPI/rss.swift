//
//  rss.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.06.17.
//  Copyright © 2017 Artem Shimanski. All rights reserved.
//

import Foundation

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
	
	public class Feed: NSObject, NSSecureCoding, JSONCoding {
		var title: String?
		var feedDescription: String?
		var copyright: String?
		var language: String?
		var link: URL?
		var publisher: String?
		var updated: Date?
		var image: Image?
		var items: [Item]?
		
		public static var supportsSecureCoding: Bool {
			return true
		}
		
		public required convenience init(json: Any) throws {
			self.init()
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
			super.init()
		}

		public init(rdf: Any) throws {
			super.init()
		}

		public init(atom: Any) throws {
			super.init()
		}

		override public init() {
			super.init()
		}
		
		public required init?(coder aDecoder: NSCoder) {
			super.init()
		}
		
		public func encode(with aCoder: NSCoder) {
		}
		
		public var json: Any {
			var json = [String: Any]()
			return json
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
		}
		
		public func copy(with zone: NSZone? = nil) -> Any {
			return Feed(self)
		}
		
		
		public override func isEqual(_ object: Any?) -> Bool {
			return (object as? Feed)?.hashValue == hashValue
		}

	}
	
	public class Image: NSObject, NSSecureCoding {
		var title: String?
		var link: URL?
		var url: URL?
		
		public init(rss: Any) throws {
			guard let dic = rss as? [String: Any] else {throw RSSError.invalidFormat(type(of: self), rss)}
			title = dic["title"] as? String
			link = URL(string: dic["link"] as? String)
			url = URL(string: dic["url"] as? String)
		}

		public init(rdf: Any) throws {
			guard let dic = rdf as? [String: Any] else {throw RSSError.invalidFormat(type(of: self), rdf)}
			title = dic["title"] as? String
			link = URL(string: dic["link"] as? String)
			url = URL(string: dic["url"] as? String)
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
			super.init()
		}
		
		public func encode(with aCoder: NSCoder) {
		}
	}
	
	public class Enclosure: NSObject, NSSecureCoding {
		var url: URL?
		var length: Int?
		var type: String?

		public init(rss: Any) throws {
			guard let dic = rss as? [String: Any] else {throw RSSError.invalidFormat(type(of: self), rss)}
			url = URL(string: dic["url"] as? String)
			length = dic["length"] as? Int
			type = dic["type"] as? String
		}
		
		public init(rdf: Any) throws {
			guard let dic = rdf as? [String: Any] else {throw RSSError.invalidFormat(type(of: self), rdf)}
			url = URL(string: dic["url"] as? String)
			length = dic["length"] as? Int
			type = dic["type"] as? String
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
			super.init()
		}
		
		public func encode(with aCoder: NSCoder) {
		}
	}
	
	public class Item: NSObject, NSSecureCoding {
		var title: String?
		var link: URL?
		var itemDescription: String?
		var author: String?
		var category: String?
		var guid: String?
		var updated: Date?
		var source: Source?
		var enclosure: Enclosure?
		
		public static var supportsSecureCoding: Bool {
			return true
		}

		public required init?(coder aDecoder: NSCoder) {
			super.init()
		}
		
		public func encode(with aCoder: NSCoder) {
		}
	}
	
	public class Source: NSObject, NSSecureCoding {
		var title: String?
		var url: URL?

		public static var supportsSecureCoding: Bool {
			return true
		}

		public required init?(coder aDecoder: NSCoder) {
			super.init()
		}
		
		public func encode(with aCoder: NSCoder) {
		}
	}

}

