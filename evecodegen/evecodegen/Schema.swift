//
//  Schema.swift
//  evecodegen
//
//  Created by Artem Shimanski on 29.04.17.
//  Copyright © 2017 Artem Shimanski. All rights reserved.
//

import Foundation

class Property: Hashable {
	let name: String
	let type: Type
	let key: String
	let `class`: Class
	
	init(name: String, type: String, class: Class) throws {
		let c = name.components(separatedBy: "=")
		if c.count == 2 {
			self.name = c[0]
			self.key = c[1]
		}
		else if c.count == 1 {
			self.name = name
			self.key = name
		}
		else {
			throw ParserError.format(type(of:self).self, name)
		}
		self.type = try Type(type, namespace: `class`)
		self.class = `class`
	}
	
	var hashValue: Int {
		if case .schema = type {
			let schema = self.class.schema(name: type.typeName)
			return [name, type, schema!, key].hashValue
		}
		else {
			return [name, type, key].hashValue
		}
	}
	
	public static func ==(lhs: Property, rhs: Property) -> Bool {
		return lhs.hashValue == rhs.hashValue
	}
	
	lazy var propertyName: String = {
		var propertyName = self.name.camelBack
		return propertyName
	}()
	
	var defaultValue: String {
		switch type {
		case .array:
			return "[]"
		default:
			return "\(type.typeIdentifier)()"
		}
	}
	
	/*var typeName: String {
		return self.class.schema(name: type.typeName)!.namespaceIdentifier
	}
	
	var typeIdentifier: String {
		return typeName + (type.isOptional ? "?" : "")
	}*/
	
	var definition: String {
		return "public var \(propertyName): \(type.typeIdentifier)\(type.isOptional ? "?" : "") = \(type.isOptional ? "nil" : defaultValue)"
	}
	
	var initialization: String {
		switch type {
		case let .array(item, isOptional):
			return isOptional ?
			"\(propertyName) = try dictionary.rowset(name: \"\(key)\")?.map {try \(item.typeIdentifier)(json: $0)}" :
			"guard let \(propertyName) = try dictionary.rowset(name: \"\(key)\")?.map ({try \(item.typeIdentifier)(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}\n" +
			"self.\(propertyName) = \(propertyName)"
		case let .schema(_, _, isOptional):
			if type.isEnum {
				let item = self.class.schema(name: type.typeName) as! Enum
				return !isOptional ?
					"guard let \(propertyName) = \(type.typeIdentifier)(rawValue: dictionary[\"\(key)\"] as? \(item.type.typeIdentifier) ?? \(item.type.typeIdentifier)()) else {throw ESIError.invalidFormat(type(of: self), dictionary)}\n" +
					"self.\(propertyName) = \(propertyName)" :
				"\(propertyName) = \(type.typeIdentifier)(rawValue: dictionary[\"\(key)\"] as? \(item.type.typeIdentifier) ?? \(item.type.typeIdentifier)())"

			}
			else {
				return "\(propertyName) = \(isOptional ? "try?" : "try") \(type.typeIdentifier)(json: dictionary[\"\(key)\"] as? [String: Any] ?? [:])"
			}
		case let .date(isOptional):
			return isOptional ?
				"\(propertyName) = DateFormatter.eveDateFormatter.date(from: dictionary[\"\(key)\"] as? String ?? \"\")" :
				"guard let \(propertyName) = DateFormatter.eveDateFormatter.date(from: dictionary[\"\(key)\"] as? String ?? \"\") else {throw ESIError.invalidFormat(type(of: self), dictionary)}\n" +
				"self.\(propertyName) = \(propertyName)"
		default:
			return type.isOptional ?
				"\(propertyName) = dictionary[\"\(key)\"] as? \(type.typeIdentifier)" :
				"guard let \(propertyName) = dictionary[\"\(key)\"] as? \(type.typeIdentifier) else {throw EVEError.invalidFormat(type(of: self), dictionary)}\n" +
				"self.\(propertyName) = \(propertyName)"
		}
		
	}
	
	var decoding: String {
		switch type {
		case let .int(isOptional):
			return isOptional ?
				"\(propertyName) = aDecoder.containsValue(forKey: \"\(key)\") ? aDecoder.decodeInteger(forKey: \"\(key)\") : nil" :
			"\(propertyName) = aDecoder.decodeInteger(forKey: \"\(key)\")"
			
		case let .int64(isOptional):
			return isOptional ?
				"\(propertyName) = aDecoder.containsValue(forKey: \"\(key)\") ? aDecoder.decodeInt64(forKey: \"\(key)\") : nil" :
			"\(propertyName) = aDecoder.decodeInt64(forKey: \"\(key)\")"
		case let .double(isOptional):
			return isOptional ?
				"\(propertyName) = aDecoder.containsValue(forKey: \"\(key)\") ? aDecoder.decodeDouble(forKey: \"\(key)\") : nil" :
			"\(propertyName) = aDecoder.decodeDouble(forKey: \"\(key)\")"
		case let .float(isOptional):
			return isOptional ?
				"\(propertyName) = aDecoder.containsValue(forKey: \"\(key)\") ? aDecoder.decodeFloat(forKey: \"\(key)\") : nil" :
			"\(propertyName) = aDecoder.decodeFloat(forKey: \"\(key)\")"
		case let .bool(isOptional):
			return isOptional ?
				"\(propertyName) = aDecoder.containsValue(forKey: \"\(key)\") ? aDecoder.decodeBool(forKey: \"\(key)\") : nil" :
			"\(propertyName) = aDecoder.decodeBool(forKey: \"\(key)\")"
		case .date, .string, .yaml:
			return "\(propertyName) = aDecoder.decodeObject(forKey: \"\(key)\") as? \(type.typeIdentifier)\(!type.isOptional ? " ?? \(defaultValue)" : "")"
		case let .array(item, isOptional):
			return "\(propertyName) = aDecoder.decodeObject(of: [\(item.typeIdentifier).self], forKey: \"\(key)\") as? \(type.typeIdentifier)\(!isOptional ? " ?? \(defaultValue)" : "")"
		case let .schema(_, _, isOptional):
			if type.isEnum {
				let item = self.class.schema(name: type.typeName) as! Enum

				return "\(propertyName) = \(type.typeIdentifier)(rawValue: aDecoder.decodeObject(forKey: \"\(key)\") as? \(item.type.typeIdentifier) ?? \(item.type.typeIdentifier)())\(!isOptional ? " ?? \(defaultValue)" : "")"
			}
			else {
				return "\(propertyName) = aDecoder.decodeObject(of: \(type.typeIdentifier).self, forKey: \"\(key)\") \(!isOptional ? " ?? \(defaultValue)" : "")"
			}
		}
	}
	
	var encoding: String {
		if type.isOptional {
			if case let .schema(name, namespace, _) = type, namespace.schema(name: name) is Enum {
				return "if let v = \(propertyName) {\n" +
				"aCoder.encode(v.rawValue, forKey: \"\(key)\")\n}"
			}
			else {
				return "if let v = \(propertyName) {\n" +
				"aCoder.encode(v, forKey: \"\(key)\")\n}"
			}
		}
		else {
			if case let .schema(name, namespace, _) = type, namespace.schema(name: name) is Enum {
				return "aCoder.encode(\(propertyName).rawValue, forKey: \"\(name)\")"
			}
			else {
				return "aCoder.encode(\(propertyName), forKey: \"\(name)\")"
			}
		}
	}
	
	var json: String {
		return !type.isOptional ?
			"json[\"\(name)\"] = \(propertyName).json":
		"if let v = \(propertyName)?.json {\njson[\"\(name)\"] = v\n}"
	}
	
	var hash: String {
		switch type {
		case .array:
			return "\(propertyName)\(!type.isOptional ? "" : "?").forEach {hashCombine(seed: &hash, value: $0.hashValue)}"
		default:
			return !type.isOptional ?
				"hashCombine(seed: &hash, value: \(propertyName).hashValue)" :
			"hashCombine(seed: &hash, value: \(propertyName)?.hashValue ?? 0)"
		}
	}
	
	var copy: String {
		return "\(propertyName) = \(type.copy(from: "other." + propertyName, isRequired: !type.isOptional))"
	}
}

class Schema: Namespace {
	
	init(name: String, namespace: Namespace) throws {
		super.init()
		self.name = name
		self.parent = namespace
	}
	
}

class Enum: Schema {
	let cases: [(String, Any)]
	let type: Type

	init(_ value: Any, name: String, namespace: Namespace) throws {
		guard let array = value as? [String] else {throw ParserError.format(type(of: self).self, value)}
		
		var type: Type = .string(false)
		var cases = [(String, Any)]()
		
		for s in array {
			let c = s.components(separatedBy: "=")
			if c.count == 2 {
				if let i = Int(c[1]) {
					cases.append((c[0].camelBack, i))
					type = .int(false)
				}
				else {
					cases.append((c[0].camelBack, c[1]))
					type = .string(false)
				}
			}
			else {
				cases.append((s.camelBack, s))
			}
		}
		cases.sort(by: {$0.0 < $1.0})
		
		self.type = type
		self.cases = cases
		
		try super.init(name: name, namespace: namespace)

	}
	
	override var hashValue: Int {
		var h: [AnyHashable] = cases.map({$0.0})
		h.append(name)
		return h.hashValue
	}
	
	public var enumDefinition: String {

		func caseName(_ s: String) -> String {
			if s == "en-us" {
				return "enUS"
			}
			let s = s.replacingOccurrences(of: "#", with: "h").camelBack
			if CharacterSet.decimalDigits.contains(UnicodeScalar(s.utf8[s.utf8.startIndex])) {
				return "i" + s
			}
			switch s {
			case "public":
				return "`public`"
			case "private":
				return "`private`"
			default:
				let r = s.startIndex..<s.index(after: s.startIndex)
				return s.replacingCharacters(in: r, with: s.substring(with: r).lowercased())
			}
		}

		let enumName = name

		var template = try! String(contentsOf: enumURL)
		template = template.replacingOccurrences(of: "{enum}", with: enumName)
		let def = cases.first!
		
		template.replaceSubrange(template.range(of: "{default}")!, with: caseName(def.0))
		
		let s: String = {
			if case .string = type {
				return self.cases.map { "\tcase \(caseName($0.0)) = \"\($0.1)\"" }.joined(separator: "\n")
			}
			else {
				return self.cases.map { "\tcase \(caseName($0.0)) = \($0.1)" }.joined(separator: "\n")
			}
		}()
		template.replaceSubrange(template.range(of: "{cases}")!, with: s)
		template = template.replacingOccurrences(of: "{type}", with: type.typeName)
		return template
	}
	
}

class Class: Schema {
	
	var properties: [Property] = []
	
	init(_ dictionary: Any, name: String, namespace: Namespace) throws {
		guard let dic = dictionary as? [String: Any] else {throw ParserError.format(type(of: self).self, dictionary)}
		
		try super.init(name: name, namespace: namespace)

		var properties = [Property]()
		var children = [Schema]()
		
		for (key, value) in dic {
			if let dic = value as? [String: Any] {
				children.append(try Class(dic, name: key, namespace: self))
			}
			else if let string = value as? String {
				properties.append(try Property(name: key, type: string, class: self))
			}
			else if let array = value as? [String] {
				children.append(try Enum(array, name: key, namespace: self))
			}
			else {
				throw ParserError.format(type(of: self).self, value)
			}
		}
		properties.sort {$0.name < $1.name}
		self.properties = properties
		self.children = children
	}
	
	override var hashValue: Int {
		var h: [AnyHashable] = properties
		h.append(name)
		return h.hashValue
	}
	
	var typeDefinition: String {
		var template = try! String(contentsOf: classURL)
		var definitions = [String]()
		var initializations = [String]()
		var encodings = [String]()
		var decodings = [String]()
		var json = [String]()
		//		var defaults = [String]()
		var hashes = [String]()
		var nested = [String]()
		var copy = [String]()
		
		for value in properties {
			definitions.append(value.definition)
			initializations.append(value.initialization)
			encodings.append(value.encoding)
			decodings.append(value.decoding)
			json.append(value.json)
			//			defaults.append(value.defaultInitialization)
			hashes.append(value.hash)
			copy.append(value.copy)
		}
		
		for child in children.sorted(by: {$0.name < $1.name}) {
			if let item = child as? Class {
				let s = item.typeDefinition
				nested.append(s)
			}
			else if let item = child as? Enum {
				let s = item.enumDefinition
				nested.append(s)
			}
		}
		let typeIdentifier = namespaceIdentifier
		let className = name
		
		template = template.replacingOccurrences(of: "{className}", with: className)
		template = template.replacingOccurrences(of: "{classIdentifier}", with: typeIdentifier)
		template = template.replacingOccurrences(of: "{class}", with: typeIdentifier)
		template.replaceSubrange(template.range(of: "{definitions}")!, with: definitions.joined(separator: "\n"))
		template.replaceSubrange(template.range(of: "{initializations}")!, with: initializations.joined(separator: "\n"))
		//		template.replaceSubrange(template.range(of: "{defaults}")!, with: defaults.joined(separator: "\n"))
		template.replaceSubrange(template.range(of: "{encodings}")!, with: encodings.joined(separator: "\n"))
		template.replaceSubrange(template.range(of: "{decodings}")!, with: decodings.joined(separator: "\n"))
		template.replaceSubrange(template.range(of: "{json}")!, with: json.joined(separator: "\n"))
		template.replaceSubrange(template.range(of: "{hash}")!, with: hashes.joined(separator: "\n"))
		template.replaceSubrange(template.range(of: "{nested}")!, with: nested.joined(separator: "\n"))
		template.replaceSubrange(template.range(of: "{copy}")!, with: copy.joined(separator: "\n"))
		
		return template
	}

}
