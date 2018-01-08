//
//  helper.swift
//  ESI
//
//  Created by Artem Shimanski on 10.04.17.
//  Copyright © 2017 Artem Shimanski. All rights reserved.
//

import Foundation
import Alamofire

//fileprivate let salt = Int(truncatingBitPattern: 0x9e3779b9 as UInt64)
//
//func combine(seed: inout Int, value: Int) {
//	seed ^= value &+ salt &+ (seed << 6) &+ (seed >> 2);
//}


extension DateFormatter {
	static var esiDateFormatter: DateFormatter {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd"
		dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
		dateFormatter.locale = Locale(identifier: "en_US_POSIX")
		return dateFormatter
	}
	
	static var esiDateTimeFormatter: DateFormatter {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
		dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
		dateFormatter.locale = Locale(identifier: "en_US_POSIX")
		return dateFormatter
	}
}

extension Data: ParameterEncoding {
	
	public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
		var request = try urlRequest.asURLRequest()
		request.httpBody = self
		return request
	}
	
}

public enum ESIError: LocalizedError {
	case internalError
//	case network(error: Error)
//	case objectSerialization(reason: String)
//	case serialization(error: Error)
//	case unauthorized(reason: String)
	case server(error: String, ssoStatus: Int?)
	case notFound
	case forbidden
	case invalidFormat(Any.Type, Any)
	case objectSerialization(reason: String)
	case dateFormatError
	
	public var errorDescription: String? {
		switch self {
		case let .server(error, ssoStatus?):
			return String(format: NSLocalizedString("%@ (Status: %d)", comment: ""), error, ssoStatus)
		case let .server(error, nil):
			return error
		default:
			return nil
		}
	}
	
}

protocol DateFormatted {
	var dateFormatter: DateFormatter? {get}
}


public protocol JSONCoding {
	var json: Any {get}
	init(json: Any) throws
}

public protocol HTTPQueryable {
	var httpQuery: String? {get}
}

extension Int: JSONCoding, HTTPQueryable {
	public var json: Any {
		return self
	}
	
	public init(json: Any) throws {
		guard let v = json as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
		self = v
	}

	public var httpQuery: String? {
		return String(self)
	}

}

extension Int64: JSONCoding, HTTPQueryable {
	public var json: Any {
		return self
	}
	
	public init(json: Any) throws {
		guard let v = json as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
		self = v
	}

	public var httpQuery: String? {
		return String(self)
	}

}

extension Double: JSONCoding, HTTPQueryable {
	public var json: Any {
		return self
	}
	
	public init(json: Any) throws {
		guard let v = json as? Double else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
		self = v
	}

	public var httpQuery: String? {
		return String(self)
	}

}

extension Float: JSONCoding, HTTPQueryable {
	public var json: Any {
		return self
	}
	
	public init(json: Any) throws {
		guard let v = json as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
		self = v
	}

	public var httpQuery: String? {
		return String(self)
	}

}

extension Bool: JSONCoding, HTTPQueryable {
	public var json: Any {
		return self
	}
	
	public init(json: Any) throws {
		guard let v = json as? Bool else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
		self = v
	}
	
	public var httpQuery: String? {
		return String(self)
	}
	
}

extension Date: JSONCoding, HTTPQueryable {
	public var json: Any {
		return DateFormatter.esiDateTimeFormatter.string(from: self)
	}
	
	public init(json: Any) throws {
		guard let s = json as? String, let d = DateFormatter.esiDateTimeFormatter.date(from: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
		self = d
	}

	public var httpQuery: String? {
		return DateFormatter.esiDateFormatter.string(from: self)
	}

}

extension Data: JSONCoding {
	public var json: Any {
		return self
	}
	
	public init(json: Any) throws {
		guard let v = json as? Data else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
		self = v
	}

}

extension String: JSONCoding, HTTPQueryable {
	public var json: Any {
		return self
	}
	
	public init(json: Any) throws {
		if json is NSNull {
			self = ""
		}
		else {
			guard let v = json as? String else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
			self = v
		}
	}

	public var httpQuery: String? {
		return self
	}

}

extension Array: JSONCoding, HTTPQueryable {
	public var json: Any {
		return flatMap{($0 as? JSONCoding)?.json}
	}
	
	public init(json: Any) throws {
		guard let v = json as? [Any],
			let type = Element.self as? JSONCoding.Type else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
		
		self = try v.flatMap{try type.init(json: $0) as? Element}
	}

	public var httpQuery: String? {
		let a = flatMap{ ($0 as? HTTPQueryable)?.httpQuery }
		return !a.isEmpty ? a.joined(separator: ",") : nil
	}

}

/*struct AnyJSONCoding<T: JSONCoding>: JSONCoding {
	public init(_ base: T) {
		self.base = base
	}
	public var base: T
	
	var json: Any {
		return base.json
	}
}*/
