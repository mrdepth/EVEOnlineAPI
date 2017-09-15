//
//  Property.swift
//  ESI
//
//  Created by Artem Shimanski on 12.04.17.
//  Copyright © 2017 Artem Shimanski. All rights reserved.
//

import Foundation

class Property: Schema {
	let isRequired: Bool
	let name: String
	
	init (_ dictionary: [String: Any], name: String, title: String?, required: Bool, parent: Namespace?) throws {
		self.name = name
		isRequired = required
		try super.init(dictionary, title: title, parent: parent)
	}

	lazy var propertyName: String = {
		var propertyName = self.name.camelBack
		propertyName = propertyName.replacingOccurrences(of: "#", with: "Ox")
		
		switch propertyName.lowercased() {
		case "func":
			return "`func`"
		case "operator":
			return "`operator`"
		case "description":
			return "localizedDescription"
		case "id":
			return "id"
		default:
			return propertyName
		}
	}()

	var defaultValue: String {
		switch type {
		case .array:
			return "[]"
		default:
			return "\(typeIdentifier)()"
		}
		
	}

	var definition: String {
		return "public var \(propertyName): \(typeIdentifier)\(!isRequired ? "?" : "") = \(isRequired ? defaultValue : "nil")"
	}

	var initialization: String {
		switch type {
		case .array:
			return "\(propertyName) = try (dictionary[\"\(name)\"] as? [Any])?.map {try \(array!.typeIdentifier)(json: $0)}\(isRequired ? " ?? \(defaultValue)" : "")"
		case .object:
			return "\(propertyName) = \(isRequired ? "try" : "try?") \(typeIdentifier)(json: dictionary[\"\(name)\"] as? [String: Any] ?? [:])"
		case .base64Data:
			break
		case .octetsData:
			break
		case .date:
			return isRequired ?
				"guard let \(propertyName) = DateFormatter.esiDateFormatter.date(from: dictionary[\"\(name)\"] as? String ?? \"\") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}\n" +
				"self.\(propertyName) = \(propertyName)" :
			"\(propertyName) = DateFormatter.esiDateFormatter.date(from: dictionary[\"\(name)\"] as? String ?? \"\")"
		case .dateTime:
			return isRequired ?
				"guard let \(propertyName) = DateFormatter.esiDateTimeFormatter.date(from: dictionary[\"\(name)\"] as? String ?? \"\") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}\n" +
				"self.\(propertyName) = \(propertyName)" :
			"\(propertyName) = DateFormatter.esiDateTimeFormatter.date(from: dictionary[\"\(name)\"] as? String ?? \"\")"
		case .enum:
			return isRequired ?
				"guard let \(propertyName) = \(typeIdentifier)(rawValue: dictionary[\"\(name)\"] as? String ?? \"\") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}\n" +
				"self.\(propertyName) = \(propertyName)" :
			"\(propertyName) = \(typeIdentifier)(rawValue: dictionary[\"\(name)\"] as? String ?? \"\")"
		default:
			return isRequired ?
				"guard let \(propertyName) = dictionary[\"\(name)\"] as? \(typeIdentifier) else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}\n" +
				"self.\(propertyName) = \(propertyName)" :
			"\(propertyName) = dictionary[\"\(name)\"] as? \(typeIdentifier)"
		}
		return ""
	}
	
//	var defaultInitialization: String {
//		return "\(propertyName) = \(isRequired ? defaultValue : "nil")"
//	}
	
	var decoding: String {
		switch type {
		case .integer:
			return !isRequired ?
				"\(propertyName) = aDecoder.containsValue(forKey: \"\(name)\") ? aDecoder.decodeInteger(forKey: \"\(name)\") : nil" :
			"\(propertyName) = aDecoder.decodeInteger(forKey: \"\(name)\")"
			
		case .long:
			return !isRequired ?
				"\(propertyName) = aDecoder.containsValue(forKey: \"\(name)\") ? aDecoder.decodeInt64(forKey: \"\(name)\") : nil" :
			"\(propertyName) = aDecoder.decodeInt64(forKey: \"\(name)\")"
		case .double:
			return !isRequired ?
				"\(propertyName) = aDecoder.containsValue(forKey: \"\(name)\") ? aDecoder.decodeDouble(forKey: \"\(name)\") : nil" :
			"\(propertyName) = aDecoder.decodeDouble(forKey: \"\(name)\")"
		case .float:
			return !isRequired ?
				"\(propertyName) = aDecoder.containsValue(forKey: \"\(name)\") ? aDecoder.decodeFloat(forKey: \"\(name)\") : nil" :
			"\(propertyName) = aDecoder.decodeFloat(forKey: \"\(name)\")"
		case .boolean:
			return !isRequired ?
				"\(propertyName) = aDecoder.containsValue(forKey: \"\(name)\") ? aDecoder.decodeBool(forKey: \"\(name)\") : nil" :
			"\(propertyName) = aDecoder.decodeBool(forKey: \"\(name)\")"
		case .date, .dateTime, .base64Data, .octetsData, .string:
			return "\(propertyName) = aDecoder.decodeObject(forKey: \"\(name)\") as? \(typeIdentifier)\(isRequired ? " ?? \(defaultValue)" : "")"
		case .array:
			var scheme = array
			while scheme != nil && scheme!.type != .object {
				scheme = scheme?.array
			}
			return scheme != nil ?
				"\(propertyName) = aDecoder.decodeObject(of: [\(scheme!.typeIdentifier).self], forKey: \"\(name)\") as? \(typeIdentifier)\(isRequired ? " ?? \(defaultValue)" : "")" :
				"\(propertyName) = aDecoder.decodeObject(forKey: \"\(name)\") as? \(typeIdentifier)\(isRequired ? " ?? \(defaultValue)" : "")"
		case .object:
			return "\(propertyName) = aDecoder.decodeObject(of: \(typeIdentifier).self, forKey: \"\(name)\") \(isRequired ? " ?? \(defaultValue)" : "")"
		case .enum:
			return "\(propertyName) = \(typeIdentifier)(rawValue: aDecoder.decodeObject(forKey: \"\(name)\") as? String ?? \"\")\(isRequired ? " ?? \(defaultValue)" : "")"
		}
	}
	
	var encoding: String {
		if isRequired {
			switch type {
			case .enum:
				return "aCoder.encode(\(propertyName).rawValue, forKey: \"\(name)\")"
			default:
				return "aCoder.encode(\(propertyName), forKey: \"\(name)\")"
			}
		}
		else {
			switch type {
			case .enum:
				return "if let v = \(propertyName) {\n" +
					"aCoder.encode(v.rawValue, forKey: \"\(name)\")\n}"
			default:
				return "if let v = \(propertyName) {\n" +
					"aCoder.encode(v, forKey: \"\(name)\")\n}"
			}
		}
	}
	
	var json: String {
		return isRequired ?
			"json[\"\(name)\"] = \(propertyName).json":
		"if let v = \(propertyName)?.json {\njson[\"\(name)\"] = v\n}"
	}
	
	var hash: String {
		switch type {
		case .array:
			return "self.\(propertyName)\(isRequired ? "" : "?").forEach {hashCombine(seed: &hash, value: $0.hashValue)}"
		default:
			return isRequired ?
				"hashCombine(seed: &hash, value: self.\(propertyName).hashValue)" :
			"hashCombine(seed: &hash, value: self.\(propertyName)?.hashValue ?? 0)"
		}
	}
	
	var copy: String {
		return "\(propertyName) = \(copy(from: "other." + propertyName, isRequired: isRequired))"
	}

}
