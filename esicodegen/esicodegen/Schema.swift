//
//  Schema.swift
//  ESI
//
//  Created by Artem Shimanski on 12.04.17.
//  Copyright © 2017 Artem Shimanski. All rights reserved.
//

import Foundation

class Enum: Hashable {
	let cases: [String]
	let `default`: String
	
	init(_ dictionary: [String: Any]) throws {
		let cases: [String] = try dictionary.safeGet(key: "enum")
		self.cases = cases.sorted()
		self.default = dictionary["default"] as? String ?? cases[0]
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(cases)
		hasher.combine(self.default)
	}
	
	public static func ==(lhs: Enum, rhs: Enum) -> Bool {
		return lhs.hashValue == rhs.hashValue
	}
}

class Schema: Namespace {
	private(set) var title: String
	let type: Type
	let description: String?
	private(set) var properties: [Property]?
	private(set) var array: Schema?
	private(set) var `enum`: Enum?

	
	init (_ dictionary: [String: Any], title: String?, parent: Namespace?) throws {
		let s = title?.camelCaps ?? unnamed()
		self.title = typeNames[s] ?? s
		
		type = (try? Type(dictionary)) ?? .object
		description = dictionary["description"] as? String
		
		super.init("", parent: parent)
		
		switch type {
		case .object:

			var properties = [Property]()
			let r = dictionary["required"] as? [String]
			for (key, value) in dictionary["properties"] as? [String: [String: Any]] ?? [:] {
				let isRequired = r?.contains(key) ?? false
				properties.append(try Property(value, name: key, title: value["title"] as? String ?? (s + key.camelCaps), required: isRequired, parent: self))
			}
			properties.sort {return $0.name < $1.name}
			
			self.properties = properties
		case .array:
			try array = Schema(dictionary.safeGet(key: "items"), title: dictionary["title"] as? String ?? s, parent: parent)
		case .enum:
			self.enum = try Enum(dictionary)
		default:
			break
		}
        
        namespaceName = typeName

		switch type {
		case .object, .enum:
            allSchemes[self.title, default: [:]][hashValue, default: []].append(self)
//			var a = allSchemes[self.title] ?? [:]
//			var b = a[hashValue] ?? []
//			b.append(self)
//			a[hashValue] = b
//			allSchemes[self.title] = a
		default:
			break
		}
		

	}
	
	override func hash(into hasher: inout Hasher) {
		super.hash(into: &hasher)
		hasher.combine(typeName)
		hasher.combine(type)
		
		if let properties = properties {
			hasher.combine(properties)
			hasher.combine(properties.map{$0.name})
			hasher.combine(properties.map{$0.isRequired})
		}
		if let array = array {
			hasher.combine(array)
		}
		if let e = self.enum {
			hasher.combine(e)
		}
	}

	
	
	var typeName: String {
		switch type {
		case .object, .enum:
			return title
		case .array:
			return "[\(array!.title)]"
		default:
			return type.typeName!
		}
	}
	
	var typeIdentifier: String {
		switch type {
		case .object, .enum:
			return namespaceIdentifier
		case .array:
			return "[\(self.array!.typeIdentifier)]"
		default:
			return type.typeName!
		}
	}
	
	public func typeDefinition(isPublic: Bool) -> String? {
		switch self.type {
		case .object:
			return self.classDefinition(isPublic: isPublic)
		case .enum:
			return self.enumDefinition(isPublic: isPublic)
		default:
			return nil
		}
	}
	
	public func enumDefinition(isPublic: Bool) -> String {
		guard let e = self.enum, !e.cases.isEmpty else {return ""}
		
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
				return s.replacingCharacters(in: r, with: s[r].lowercased())
			}
		}
		let cases = e.cases.map { s -> String in
			return caseName(s)
		}
		
		
		var template = try! String(contentsOf: enumURL)
		template = template.replacingOccurrences(of: "{enum}", with: typeName)
		template = template.replacingOccurrences(of: "{access}", with: isPublic ? "public " : "")
		
		let s = cases.enumerated().map { "\tcase \($0.element) = \"\(e.cases[$0.offset])\"" }.joined(separator: "\n")
		template.replaceSubrange(template.range(of: "{cases}")!, with: s)
		return template
	}
	
	public func classDefinition(isPublic: Bool) -> String {
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
		var parameters = [String]()
		
		var codingKeys = [String]()
		var dateFormats = [String]()
		
		for value in properties ?? [] {
			definitions.append(value.definition)
			initializations.append(value.initialization)
			encodings.append(value.encoding)
			decodings.append(value.decoding)
			json.append(value.json)
//			defaults.append(value.defaultInitialization)
			hashes.append(value.hash)
			copy.append(value.copy)
			parameters.append(value.parameter)
			
			codingKeys.append(value.codingKey)
			if let formatter = value.dateFormatter {
				dateFormats.append(formatter)
			}
		}
		
		for subSchema in namespaces[self] ?? [] {
			guard let s = subSchema.typeDefinition(isPublic: true) else {continue}
			nested.append(s)
		}

		
		template = template.replacingOccurrences(of: "{className}", with: typeName)
		template = template.replacingOccurrences(of: "{access}", with: isPublic ? "public " : "")
//		template = template.replacingOccurrences(of: "{classIdentifier}", with: typeIdentifier)
		template = template.replacingOccurrences(of: "{class}", with: typeIdentifier)
		template.replaceSubrange(template.range(of: "{definitions}")!, with: definitions.joined(separator: "\n"))
		template.replaceSubrange(template.range(of: "{initializations}")!, with: initializations.joined(separator: "\n"))
//		template.replaceSubrange(template.range(of: "{encodings}")!, with: encodings.joined(separator: "\n"))
//		template.replaceSubrange(template.range(of: "{decodings}")!, with: decodings.joined(separator: "\n"))
//		template.replaceSubrange(template.range(of: "{json}")!, with: json.joined(separator: "\n"))
//		template.replaceSubrange(template.range(of: "{hash}")!, with: hashes.joined(separator: "\n"))
		template.replaceSubrange(template.range(of: "{nested}")!, with: nested.joined(separator: "\n"))
//		template.replaceSubrange(template.range(of: "{copy}")!, with: copy.joined(separator: "\n"))
//		template.replaceSubrange(template.range(of: "{objcName}")!, with: typeIdentifier.replacingOccurrences(of: ".", with: ""))
		
		template.replaceSubrange(template.range(of: "{codingKeys}")!, with: codingKeys.joined(separator: "\n"))
		template.replaceSubrange(template.range(of: "{dateFormats}")!, with: dateFormats.joined(separator: "\n"))
		template.replaceSubrange(template.range(of: "{parameters}")!, with: parameters.joined(separator: ", "))
		return template
	}
	
	public var classLoader: String? {
		switch self.type {
		case .object:
			return "_ = \(typeIdentifier).classForCoder()"
		default:
			return nil
		}
	}
	
	public func copy(from: String, isRequired: Bool) -> String {
		switch type {
		case .array:
			return "\(from)\(isRequired ? "" : "?").flatMap { \(array!.copy(from: "$0", isRequired: true)) }"
		case .object:
			return isRequired ? "\(typeIdentifier)(\(from))" :
				"\(from) != nil ? \(typeIdentifier)(\(from)!) : nil"
		default:
			return from
		}
	}
}
