//
//  Type.swift
//  evecodegen
//
//  Created by Artem Shimanski on 29.04.17.
//  Copyright © 2017 Artem Shimanski. All rights reserved.
//

import Foundation

enum Type: Hashable {
	case int(Bool)
	case int64(Bool)
	case bool(Bool)
	case string(Bool)
	case float(Bool)
	case double(Bool)
	case date(Bool)
	case yaml(Bool)
	indirect case array(Type, Bool)
	case schema(String, Namespace, Bool)
	
	init(_ string: String, namespace: Namespace) throws {
		let typeName: String
		let isOptional: Bool
		
		if string.hasSuffix("?") {
			typeName = String(string[..<string.index(before: string.endIndex)])
			isOptional = true
		}
		else {
			typeName = string
			isOptional = false
		}
		
		switch typeName {
		case "Int":
			self = .int(isOptional)
		case "Int64":
			self = .int64(isOptional)
		case "Bool":
			self = .bool(isOptional)
		case "String":
			self = .string(isOptional)
		case "Float":
			self = .float(isOptional)
		case "Double":
			self = .double(isOptional)
		case "Date":
			self = .date(isOptional)
		case "YAML":
			self = .yaml(isOptional)
		default:
			if typeName.hasPrefix("[") && typeName.hasSuffix("]") {
				let typeName = typeName[typeName.index(after: typeName.startIndex)..<typeName.index(before: typeName.endIndex)]
				self = .array(try Type(String(typeName), namespace: namespace), isOptional)
			}
			else if typeName.rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) == nil {
				self = .schema(typeName, namespace, isOptional)
			}
			else {
				throw ParserError.format(Swift.type(of:self).self, string)
			}
		}
	}
	
	var isOptional: Bool {
		switch self {
		case let .int(isOptional):
			return isOptional
		case let .int64(isOptional):
			return isOptional
		case let .bool(isOptional):
			return isOptional
		case let .string(isOptional):
			return isOptional
		case let .float(isOptional):
			return isOptional
		case let .double(isOptional):
			return isOptional
		case let .date(isOptional):
			return isOptional
		case let .yaml(isOptional):
			return isOptional
		case let .array(_, isOptional):
			return isOptional
		case let .schema(_, _, isOptional):
			return isOptional
		}
	}
	
	var typeName: String {
		switch self {
		case .int:
			return "Int"
		case .int64:
			return "Int64"
		case .bool:
			return "Bool"
		case .string:
			return "String"
		case .float:
			return "Float"
		case .double:
			return "Double"
		case .date:
			return "Date"
		case .yaml:
			return "String"
		case let .array(type, _):
			return "[\(type.typeIdentifier)]"
		case let .schema(name, _, _):
			return name
		}
	}
	
	var typeIdentifier: String {
		if case let .schema(name, namespace, _) = self {
			if namespace.name == name {
				return namespace.namespaceIdentifier
			}
			else {
				return namespace.namespaceIdentifier + "." + name
			}
		}
		else {
			return typeName
		}
	}
	
	var isEnum: Bool {
		if case let .schema(name, namespace, _) = self, namespace.schema(name: name) is Enum {
			return true
		}
		else {
			return false
		}
	}
	
	var hashValue: Int {
		return [typeName, self.isOptional].hashValue
	}
	
	public static func ==(lhs: Type, rhs: Type) -> Bool {
		return lhs.hashValue == rhs.hashValue
	}
	
	public func copy(from: String, isRequired: Bool) -> String {
		switch self {
		case let .array(item, isOptional):
			return "\(from)\(!isOptional ? "" : "?").flatMap { \(item.copy(from: "$0", isRequired: true)) }"
		case .schema(_,_,isOptional):
			if isEnum {
				return from
			}
			else {
				return !isOptional ? "\(typeIdentifier)(\(from))" :
				"\(from) != nil ? \(typeIdentifier)(\(from)!) : nil"
			}
		default:
			return from
		}
	}

	
}
