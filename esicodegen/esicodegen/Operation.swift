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
		guard let a = array as? [[String: [String]]] else { throw ESIParserError.format(Swift.type(of: self).self, array)}
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
	let cached: TimeInterval
	weak var path: Path?
	
	init (_ dictionary: [String: Any], method: HTTPMethod) throws {
		self.method = method
		
		try operationID = dictionary.safeGet(key: "operationId")
		try summary = dictionary.safeGet(key: "summary")
		cached = dictionary["x-cached-seconds"] as? Double ?? 3600
		
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
			if let refName = (parameter["$ref"] as? String)?.components(separatedBy: "/").last, let ref = refParameters[refName] {
				parameters.append(try Parameter(ref, parent: scope))
			}
			else {
				parameters.append(try Parameter(parameter, parent: scope))
			}
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
		var headerStrings = [String]()
		var queryStrings = [String]()
		var definitions = [String]()
		var security = [String]()
		
		let response = responses["200"] ?? responses.first {(Int($0.key) ?? 500) < 300}?.value
		let result = response?.schema?.typeIdentifier ?? "String"
		
		for parameter in parameters {
			guard !Skip.contains(parameter.name) else {continue}
			
			switch parameter.location {
			case .body:
				parameterStrings.append(parameter.parameterString)
			case .header:
				headerStrings.append(parameter.headerString)
			case .query:
				queryStrings.append(parameter.queryString)
			case .path:
				url = url.replacingOccurrences(of: "{\(parameter.name)}", with: "\\(\(parameter.parameterName + (parameter.isRequired ? "" : "!")))")
			}
			
			definitions.append(parameter.definition)
		}
		
//		parameterStrings.insert("\(parameterStrings.count > 0 ? "var" : "let") parameters = Parameters()", at: 0)
		if method != .get {
			headerStrings.append("headers[\"Content-Type\"] = \"application/json\"")
		}
//		headerStrings.insert("\(headerStrings.count > 0 ? "var" : "let") headers = HTTPHeaders()", at: 0)
		
		for scope in self.security?.security ?? [] {
			let s = "guard scopes.contains(\"\(scope)\") else {return .init(.failure(ESIError.forbidden))}"
			security.append(s)
		}
		
		template = template.replacingOccurrences(of: "{operation}", with: name)
		template = template.replacingOccurrences(of: "{definitions}", with: definitions.joined(separator: ", "))
		template = template.replacingOccurrences(of: "{result}", with: result)
		template = template.replacingOccurrences(of: "{body}", with: parameterStrings.first ?? "let body: Data? = nil")
		template = template.replacingOccurrences(of: "{headers}", with: headerStrings.joined(separator: "\n"))
		template = template.replacingOccurrences(of: "{queries}", with: queryStrings.joined(separator: "\n"))
		
		if security.count > 0 {
			
			var s = "let scopes = (esi.sessionManager.adapter as? OAuth2Helper)?.token.scopes ?? []\n"
			s += security.joined(separator: "\n")
			template = template.replacingOccurrences(of: "{security}", with: s)
		}
		else {
			template = template.replacingOccurrences(of: "{security}", with: "")
		}
		template = template.replacingOccurrences(of: "{method}", with: method.rawValue)
//		template = template.replacingOccurrences(of: "{encoding}", with: method.encoding)
		template = template.replacingOccurrences(of: "{url}", with: url)
		template = template.replacingOccurrences(of: "{cached}", with: "\(cached)")
		return template
	}
}
