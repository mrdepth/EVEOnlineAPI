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
	
	public struct Feed: Codable, Hashable, JSONCoding {
		public var title: String?
		public var feedDescription: String?
		public var copyright: String?
		public var language: String?
		public var link: URL?
		public var publisher: String?
		public var updated: Date?
		public var image: Image?
		public var items: [Item]?
		
		enum CodingKeys: String, CodingKey {
			case title
			case feedDescription
			case copyright
			case language
			case link
			case publisher
			case updated
			case image
			case items
		}
		
		public static var supportsSecureCoding: Bool {
			return true
		}
		
		public init(json: Any) throws {
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
				throw RSSError.invalidFormat(type(of: self), json)
			}
		}
		
		public var json: Any {
			return [:]
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
				self.items = (items as? [Any] ?? [items]).compactMap {
					return try? Item(rss: $0)
				}
			}
			else {
				self.items = nil
			}
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
				self.items = (items as? [Any] ?? [items]).compactMap {
					return try? Item(rdf: $0)
				}
			}
			else {
				self.items = nil
			}
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
				self.items = (items as? [Any] ?? [items]).compactMap {
					return try? Item(atom: $0)
				}
			}
			else {
				self.items = nil
			}
		}
		

		public static func ==(lhs: Feed, rhs: Feed) -> Bool {
			return lhs.hashValue == rhs.hashValue
		}
	}
	
	public struct Image: Codable, Hashable {
		public var title: String?
		public var link: URL?
		public var url: URL?
		
		enum CodingKeys: String, CodingKey {
			case title
			case link
			case url
		}
		
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
		}
		
		public static func ==(lhs: Image, rhs: Image) -> Bool {
			return lhs.hashValue == rhs.hashValue
		}
	}
	
	public struct Enclosure: Codable, Hashable {
		public var url: URL?
		public var length: Int?
		public var type: String?
		
		enum CodingKeys: String, CodingKey {
			case url
			case length
			case type
		}
		
		public init(rss: Any) throws {
			guard let dic = rss as? [String: Any] else {throw RSSError.invalidFormat(Swift.type(of: self), rss)}
			url = URL(string: dic["url"] as? String)
			length = dic["length"] as? Int
			type = dic["type"] as? String
		}
		
		public init(rdf: Any) throws {
			guard let dic = rdf as? [String: Any] else {throw RSSError.invalidFormat(Swift.type(of: self), rdf)}
			url = URL(string: dic["url"] as? String)
			length = dic["length"] as? Int
			type = dic["type"] as? String
		}
		
		public init(atom: Any) throws {
			guard let dic = atom as? [String: Any] else {throw RSSError.invalidFormat(Swift.type(of: self), atom)}
			url = URL(string: dic["href"] as? String)
			length = dic["length"] as? Int
			type = dic["type"] as? String
		}
		

		public static func ==(lhs: Enclosure, rhs: Enclosure) -> Bool {
			return lhs.hashValue == rhs.hashValue
		}
	}
	
	public struct Item: Codable, Hashable {
		public var title: String?
		public var link: URL?
		public var summary: String?
		public var author: String?
		public var category: String?
		public var guid: String?
		public var updated: Date?
		public var source: Source?
		public var enclosure: Enclosure?
		
		enum CodingKeys: String, CodingKey {
			case title
			case link
			case summary
			case author
			case category
			case guid
			case updated
			case source
			case enclosure
		}
		
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
		}
		
		public init(rdf: Any) throws {
			guard let dic = rdf as? [String: Any] else {throw RSSError.invalidFormat(type(of: self), rdf)}
			title = dic["title"] as? String
			link = URL(string: dic["url"] as? String)
			summary = dic["description"] as? String
			updated = DateFormatter.rfc822DateFormatter.date(from: dic["pubDate"] as? String ?? "")
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
		}
		
		public static func ==(lhs: Item, rhs: Item) -> Bool {
			return lhs.hashValue == rhs.hashValue
		}
	}
	
	public struct Source: Codable, Hashable {
		var title: String?
		var url: URL?
		
		enum CodingKeys: String, CodingKey {
			case title
			case url
		}
		
		public init(rss: Any) throws {
			guard let dic = rss as? [String: Any] else {throw RSSError.invalidFormat(type(of: self), rss)}
			url = URL(string: dic["url"] as? String)
			title = dic["title"] as? String
		}
		
		public init(rdf: Any) throws {
			guard let dic = rdf as? [String: Any] else {throw RSSError.invalidFormat(type(of: self), rdf)}
			url = URL(string: dic["url"] as? String)
			title = dic["title"] as? String
		}
		
		public init(atom: Any) throws {
			guard let dic = atom as? [String: Any] else {throw RSSError.invalidFormat(type(of: self), atom)}
			url = URL(string: dic["href"] as? String)
			title = dic["title"] as? String
		}
		
		
		public static func ==(lhs: Source, rhs: Source) -> Bool {
			return lhs.hashValue == rhs.hashValue
		}
	}
	
}

extension DataRequest {
	
	class RSSSerializer<T: JSONCoding>: DataResponseSerializerProtocol {
		typealias SerializedObject = T
		func serialize(request: URLRequest?, response: HTTPURLResponse?, data: Data?, error: Error?) throws -> T {
			guard let data = data,
				let value = try XMLParser.xmlObject(data: data) as? [String: Any] else {throw ESIError.objectSerialization(reason: "No XML Data")}
			return try T(json: value)
		}
	}
	
	@discardableResult
	public func responseRSS<T: JSONCoding>(queue: DispatchQueue? = nil,
	                        options: JSONSerialization.ReadingOptions = .allowFragments,
	                        completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
		let serializer = RSSSerializer<T>()
		
		return response(
			queue: queue,
			responseSerializer: serializer,
			completionHandler: completionHandler
		)
	}
}
