//
//  Operation.swift
//  evecodegen
//
//  Created by Artem Shimanski on 29.04.17.
//  Copyright © 2017 Artem Shimanski. All rights reserved.
//

import Foundation

class Parameter {
	let name: String
	let type: Type
	
	init(name: String, type: String, namespace: Namespace) throws {
		self.name = name
		self.type = try Type(type, namespace: namespace)
	}
	
	var definition: String {
		let typeName = type.typeIdentifier
		return "\(name): \(typeName)\(!type.isOptional ? "" : "? = nil")"
	}

	var parameterString: String {
		return !type.isOptional ?
			"parameters[\"\(name)\"] = \(name)" :
			"if let v = \(name) {\n" +
		"parameters[\"\(name)\"] = v\n}"
	}
	

}

class Operation {
	weak var scope: Scope?
	let name: String
	let result: Class
	let parameters: [Parameter]
	let security: [String]
	
	init(_ dictionary: Any, name: String, scope: Scope) throws {
		self.scope = scope
		self.name = name
		
		guard let dic = dictionary as? [String: Any] else {throw ParserError.format(Swift.type(of: self).self, dictionary)}
		let resultDic: [String: Any] = try dic.safeGet(key: "result")
		
		guard let (key, value) = resultDic.first else {throw ParserError.missing("result", dic)}
		
		result = try Class(value, name: key, namespace: scope)
		parameters = try (dic["parameters"] as? [String: String])?.map
			{try Parameter(name: $0.key, type: $0.value, namespace: scope)}.sorted
			{$0.name < $1.name} ?? []
		security = dic["security"] as? [String] ?? []
	}
	
	var definition: String {
		var template = try! String(contentsOf: operationURL)
		
		let url = "\(self.scope!.name)/\(name).xml.aspx"
		var parameterStrings = [String]()
		var definitions = [String]()
		var security = [String]()
		
		let result = self.result.namespaceIdentifier
		
		for parameter in parameters {
			parameterStrings.append(parameter.parameterString)
			definitions.append(parameter.definition)
		}
		
		for scope in self.security {
			let s = "guard scopes.contains(\"\(scope)\") else {completionBlock?(.failure(EVEError.forbidden)); return}"
			security.append(s)
		}
		
		if parameterStrings.isEmpty {
			parameterStrings.insert("let parameters = Parameters()", at: 0)
		}
		else {
			parameterStrings.insert("var parameters = Parameters()", at: 0)
		}
		
		template = template.replacingOccurrences(of: "{operation}", with: name.camelBack)
		template = template.replacingOccurrences(of: "{definitions}", with: definitions.joined(separator: ", ") + (definitions.count > 0 ? ", " : ""))
		template = template.replacingOccurrences(of: "{result}", with: result)
		template = template.replacingOccurrences(of: "{parameters}", with: parameterStrings.joined(separator: "\n"))
		
		if security.count > 0 {
			var s = "let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []\n"
			s += security.joined(separator: "\n")
			template = template.replacingOccurrences(of: "{security}", with: s)
		}
		else {
			template = template.replacingOccurrences(of: "{security}", with: "")
		}
		template = template.replacingOccurrences(of: "{url}", with: url)
		
		return template
	}
}
