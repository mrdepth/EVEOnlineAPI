//
//  Parameter.swift
//  ESI
//
//  Created by Artem Shimanski on 12.04.17.
//  Copyright © 2017 Artem Shimanski. All rights reserved.
//

import Foundation

class Parameter {
	let name: String
	let schema: Schema?
	let type: Type
	let description: String?
	let isRequired: Bool
	let location: ParameterLocation
	
	init (_ dictionary: [String: Any], parent: Namespace?) throws {
		let name: String = try dictionary.safeGet(key: "name")
		self.name = name

		description = dictionary["description"] as? String
		isRequired = dictionary["required"] as? Bool ?? false
		try location = ParameterLocation(dictionary.safeGet(key: "in"))
		
		if let dic = dictionary["schema"] as? [String: Any] {
			try schema = Schema(dic, title: dic["title"] as? String ?? name, parent: parent)
			type = .object
		}
		else {
			try schema = Schema(dictionary, title: dictionary["title"] as? String ?? name, parent: parent)
			try type = Type(dictionary)
		}
	}

	var parameterName: String {
		return name.camelBack
	}

	var typeName: String {
		var typeName: String
		
		switch self.type {
		case .array, .object, .enum:
			typeName = schema!.typeIdentifier
		default:
			typeName = type.typeName!
		}
		return typeName
	}
	
	var definition: String {
		let typeName = self.typeName
		return "\(parameterName): \(typeName)\(isRequired ? "" : "? = nil")"
	}
	
	var parameterString: String {
		return isRequired ?
		"let body = try? JSONEncoder().encode(\(parameterName))" :
		"let body = \(parameterName) != nil ? try? JSONEncoder().encode(\(parameterName)) : nil"
//		return isRequired ?
//		"let body = try? JSONSerialization.data(withJSONObject: \(parameterName).json, options: [])" :
//		"let body = \(parameterName) != nil ? (try? JSONSerialization.data(withJSONObject: \(parameterName)!.json, options: [])) : nil"
	}
	
	var headerString: String {
        if isRequired {
            if type == .array {
                return "headers[\"\(name)\"] = \(parameterName).isEmpty ? nil : \(parameterName).lazy.map{$0.description}.joined(separator: \",\")"
            }
            else {
                return "headers[\"\(name)\"] = \(parameterName).description"
            }
        }
        else {
            if type == .array {
                return "if let v = \(parameterName) {\n" +
                "headers[\"\(name)\"] = v.lazy.map{$0.description}.joined(separator: \",\")\n}"
            }
            else {
                return "if let v = \(parameterName)?.description {\n" +
                "headers[\"\(name)\"] = v\n}"
            }
        }
	}
	
	var queryString: String {
        if isRequired {
            if type == .array {
                return "if !\(parameterName).isEmpty {\n" +
                "query.append(URLQueryItem(name: \"\(name)\", value: \(parameterName).lazy.map{$0.description}.joined(separator: \",\")))\n}"
            }
            else {
                return "query.append(URLQueryItem(name: \"\(name)\", value: \(parameterName).description))"
            }
        }
        else {
            if type == .array {
                return "if let v = \(parameterName), !v.isEmpty {\n" +
                "query.append(URLQueryItem(name: \"\(name)\", value: v.lazy.map{$0.description}.joined(separator: \",\")))\n}"
            }
            else {
                return "if let v = \(parameterName)?.description {\n" +
                "query.append(URLQueryItem(name: \"\(name)\", value: v.lazy.map{$0.description}.joined(separator: \",\")))\n}"
            }
        }
//		return "if let v = \(parameterName)\(isRequired ? "" : "?").description {\n" +
//		"query.append(URLQueryItem(name: \"\(name)\", value: v))\n}"

		
//		let value: String = ""
//		switch type {
//		case .array:
//		case .enum:
//			value = "String(\(parameterName))"
//		default:
//			<#code#>
//		}
//		return isRequired ?
//			"query.append(URLQueryItem(name: \"\(name)\", value: \(value)))" :
//			"if let v = \(parameterName) {\n" +
//		"query.append(URLQueryItem(name: \"\(name)\", value: String(v)))\n}"
	}
}
