//
//  ESI.swift
//  ESI
//
//  Created by Artem Shimanski on 12.04.17.
//  Copyright © 2017 Artem Shimanski. All rights reserved.
//

import Foundation

enum ESIParserError: Error {
	case format(Any.Type, Any)
	case missing(Any, Any)
	case missingTag(Path)
	case typeNameAlreadyExists(Any)
}

enum Type {
	case integer
	case long
	case float
	case double
	case string
	case base64Data
	case octetsData
	case boolean
	case date
	case dateTime
	case object
	case array
//	case `enum`([String], String)
	case `enum`
	
	init(_ dictionary: [String: Any]) throws {
		switch (dictionary["type"] as? String, dictionary["format"] as? String) {
		case ("integer"?, "int32"?):
			self = .integer
        case ("integer"?, nil):
            self = .integer
		case ("integer"?, "int64"?):
			self = .long
		case ("integer"?, "float"?):
			self = .float
		case ("number"?, "float"?):
			self = .float
		case ("number"?, "double"?):
			self = .double
		case ("number"?, "int32"?):
			self = .integer
		case ("number"?, "int64"?):
			self = .long
		case ("string"?, "byte"?):
			self = .base64Data
		case ("string"?, "binary"?):
			self = .octetsData
		case ("string"?, "date"?):
			self = .date
		case ("string"?, "date-time"?):
			self = .dateTime
		case ("string"?, _):
			if dictionary["enum"] as? [String] != nil {
				self = .enum
//				self = .enum(cases, dictionary["default"] as? String ?? cases[0])
			}
			else {
				self = .string
			}
		case ("boolean"?, _):
			self = .boolean
		case ("object"?, _):
			self = .object
		case ("array"?, _):
			self = .array
		default:
            if dictionary["properties"] != nil {
                self = .object
            }
            else {
                throw ESIParserError.format(Swift.type(of: self).self, dictionary)
            }
		}
	}
		
/*	public static func ==(lhs: Type, rhs: Type) -> Bool {
		switch (lhs, rhs) {
		case (.integer, .integer):
			return true
		case (.long, .long):
			return true
		case (.float, .float):
			return true
		case (.string, .string):
			return true
		case (.base64Data, .base64Data):
			return true
		case (.octetsData, .octetsData):
			return true
		case (.boolean, .boolean):
			return true
		case (.date, .date):
			return true
		case (.object, .object):
			return true
		case (.array, .array):
			return true
		case let (.enum(a, _), .enum(b, _)):
			return a == b
		default:
			return false
		}
	}*/
	
	var typeName: String? {
		switch self {
		case .integer:
			return "Int"
		case .long:
			return "Int64"
		case .float:
			return "Float"
		case .double:
			return "Double"
		case .string:
			return "String"
		case .base64Data, .octetsData:
			return "Data"
		case .boolean:
			return "Bool"
		case .date, .dateTime:
			return "Date"
		case .object, .array, .enum:
			return nil
		}
	}
}

enum ParameterLocation: String {
	case query = "query"
	case path = "path"
	case body = "body"
	case header = "header"
	
	init(_ value: String) throws {
		guard let location = ParameterLocation(rawValue: value) else {throw ESIParserError.format(Swift.type(of: self).self, value)}
		self = location
	}
	
}

enum HTTPMethod: String {
	case get = "get"
	case post = "post"
	case put = "put"
	case delete = "delete"
	
	init(_ value: String) throws {
		guard let method = HTTPMethod(rawValue: value) else {throw ESIParserError.format(Swift.type(of: self).self, value)}
		self = method
	}
	
	var encoding: String {
		switch self {
		case .get:
			return "URLEncoding.default"
		case .post, .put, .delete:
			return "JSONEncoding.default"
		}
	}
}

extension Dictionary {
	func safeGet<T> (key: Key) throws -> T {
		guard let value = self[key] as? T else {
			throw ESIParserError.missing(key, self)
		}
		return value
	}
}

extension String {
	
	var camelCaps: String {
		return components(separatedBy: CharacterSet(charactersIn: "_-. ")).enumerated().map { (i, s) -> String in
			let s = s.replacingOccurrences(of: "'", with: "").replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "")
			
			guard !s.isEmpty else {return ""}
			if i > 0 {
				if s.compare("id", options: [.caseInsensitive]) == .orderedSame {
					return "ID"
				}
				else if s.compare("sp", options: [.caseInsensitive]) == .orderedSame {
					return "SP"
				}
			}
			if s.compare("a", options: [.caseInsensitive]) == .orderedSame {
				return ""
			}
			else {
				let r = s.startIndex..<s.index(after: s.startIndex)
				return s.replacingCharacters(in: r, with: s[r].uppercased())
			}
		}.joined()
	}
	
	var camelBack: String {
		guard !isEmpty else {return self}
		let s = camelCaps
		let r = s.startIndex..<s.index(after: s.startIndex)
		return s.replacingCharacters(in: r, with: s[r].lowercased())
	}
	
	var indented: String {
		var indentation = 0
		var c = [String]()
		
		for s in self.components(separatedBy: "\n") {
			let s = s.trimmingCharacters(in: CharacterSet(charactersIn: "\t"))
			let i = indentation - (s.first == "}" ? 1 : 0)
			c.append(String(repeating: "\t", count: i) + s)
			
			for c in s {
				if c == "}" {
					indentation -= 1
				}
				else if c == "{" {
					indentation += 1
				}
			}

		}
		return c.joined(separator: "\n")
	}
}

var unnamedCounter = 0
func unnamed() -> String {
	unnamedCounter += 1
	return "Unnamed\(unnamedCounter)"
}

fileprivate let salt = Int(truncatingIfNeeded: 0x9e3779b9 as UInt64)

func hashCombine(seed: inout Int, value: Int) {
	seed ^= value &+ salt &+ (seed << 6) &+ (seed >> 2);
}


class Namespace: Hashable {
	var parent: Namespace?
	var namespaceName: String
	
	init (_ name: String, parent: Namespace?) {
		self.parent = parent
		namespaceName = name
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(namespaceName)
	}
	
	static func==(lhs: Namespace, rhs: Namespace) -> Bool {
		return lhs.namespaceName == rhs.namespaceName
	}
}

extension Namespace {
	
	var namespaceChain: [Namespace] {
		var a = parent?.namespaceChain ?? []
		a.append(self)
		return a
	}
	
	var namespaceIdentifier: String {
		return namespaceChain.map{ $0.namespaceName }.filter{ !$0.isEmpty }.joined(separator: ".")
	}
}
