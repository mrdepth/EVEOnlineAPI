//
//  Operation.swift
//  ESI
//
//  Created by Artem Shimanski on 12.04.17.
//  Copyright © 2017 Artem Shimanski. All rights reserved.
//

import Foundation

fileprivate let Skip = ["datasource", "token", "user_agent", "X-User-Agent"]

class Security {
	let security: [String]
	init(_ array: [Any]) throws {
		guard let a = array as? [[String: [String]]] else { throw ESIParserError.format(type(of: self).self, array)}
		var scopes = [String]()
		for i in a {
			for (_, j) in i {
				scopes.append(contentsOf: j)
			}
		}
		self.security = scopes
	}
}


class Operation {
	
	let method: HTTPMethod
	let operationID: String
	let parameters: [Parameter]
	let tags: [String]?
	let responses: [String: Response]
	let summary: String
	let security: Security?
	weak var path: Path?
	
	init (_ dictionary: [String: Any], method: HTTPMethod) throws {
		self.method = method
		
		try operationID = dictionary.safeGet(key: "operationId")
		try summary = dictionary.safeGet(key: "summary")
		
		security = try? Security(dictionary["security"] as? [Any] ?? [])
		
		tags = dictionary["tags"] as? [String]
		
		let tag = (Array(tags?.prefix(1) ?? [])).first?.camelCaps ?? ""
		
		let scope = scopes[tag] ?? {
			let scope = Scope(tag: tag, parent: globalScope)
			scopes[tag] = scope
			return scope
			}()
		
		
		var responses = [String: Response]()
		for (status, response) in try dictionary.safeGet(key: "responses") as [String: [String: Any]] {
			try responses[status] = Response(response, parent: scope)
		}
		self.responses = responses
		
		var parameters = [Parameter]()
		
		for parameter in dictionary["parameters"] as? [[String: Any]] ?? [] {
			parameters.append(try Parameter(parameter, parent: scope))
		}
		
		self.parameters = parameters
		
		scope.operations.append(self)
	}
	
	var name: String {
		return operationNames[operationID] ?? summary.camelBack
	}
	
	var definition: String {
		var template = try! String(contentsOf: operationURL)
		
		var url = path!.path
		var parameterStrings = [String]()
		var definitions = [String]()
		var security = [String]()
		
		let response = responses["200"] ?? responses.first {(Int($0.key) ?? 500) < 300}?.value
		let result = response?.schema?.typeIdentifier ?? "String"
		
		var hasHeaders = false
		for parameter in parameters {
			guard !Skip.contains(parameter.name) else {continue}
			
			if case .path = parameter.location {
				url = url.replacingOccurrences(of: "{\(parameter.name)}", with: "\\(\(parameter.parameterName + (parameter.isRequired ? "" : "!")))")
			}
			else if let s = parameter.parameterString {
				parameterStrings.append(s)
			}
			if case .header = parameter.location {
				hasHeaders = true
			}
			definitions.append(parameter.definition)
		}
		
		for scope in self.security?.security ?? [] {
			let s = "guard scopes.contains(\"\(scope)\") else {completionBlock?(.failure(ESIError.forbidden)); return}"
			security.append(s)
		}
		
		template = template.replacingOccurrences(of: "{operation}", with: name)
		template = template.replacingOccurrences(of: "{definitions}", with: definitions.joined(separator: ", ") + (definitions.count > 0 ? ", " : ""))
		template = template.replacingOccurrences(of: "{result}", with: result)
		template = template.replacingOccurrences(of: "{parameters}", with: parameterStrings.joined(separator: "\n"))
		
		if security.count > 0 {
			var s = "let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []\n"
			s += security.joined(separator: "\n")
			template = template.replacingOccurrences(of: "{security}", with: s)
		}
		else {
			template = template.replacingOccurrences(of: "{security}", with: "")
		}
		template = template.replacingOccurrences(of: "{headers}", with: hasHeaders ? "var headers = HTTPHeaders()" : "let headers = HTTPHeaders()")
		template = template.replacingOccurrences(of: "{method}", with: method.rawValue)
		template = template.replacingOccurrences(of: "{encoding}", with: method.encoding)
		template = template.replacingOccurrences(of: "{url}", with: url)
		
		return template
	}
}
