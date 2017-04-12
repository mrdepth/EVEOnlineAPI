//
//  Scope.swift
//  ESI
//
//  Created by Artem Shimanski on 12.04.17.
//  Copyright © 2017 Artem Shimanski. All rights reserved.
//

import Foundation

class Scope: Namespace {
	let tag: String
	
	var operations = [Operation]()
	
	init(tag: String, parent: Namespace?) {
		self.tag = tag.camelCaps
		super.init(self.tag, parent: parent)
	}
	
	func typeDefinitions() throws -> String {
		var definitions = [String: String]()
		
		for schema in namespaces[self] ?? [] {
			guard let s = schema.typeDefinition else {continue}
			definitions[schema.typeName] = s
		}
		
		return definitions.values.joined(separator: "\n\n")
	}
	
	func scopeDefinition() throws -> String {
		if tag.isEmpty {
			var s = "import Foundation\n"
			s += "import Alamofire\n\n"
			s += "public extension ESI {\n\n"
			s += try typeDefinitions()
			s += "\n\n"
			
			var template = try! String(contentsOf: securityURL)
			
			var scopes = [String]()
			var values = [String]()
			
			for (_, array) in security {
				for scope in array {
					values.append("public static let \(scope.camelBack) = Scope(\"\(scope)\")")
					scopes.append(".\(scope.camelBack)")
				}
			}
			
			template = template.replacingOccurrences(of: "{values}", with: values.joined(separator: "\n"))
			template = template.replacingOccurrences(of: "{scopes}", with: scopes.joined(separator: ",\n"))
			s += template
			
			s += "\n}"
			return s
		}
		else {
			var template = try! String(contentsOf: scopeURL)
			let variable = tag.camelBack
			
			var operations = [String]()
			
			for operation in self.operations {
				operations.append(operation.definition)
			}
			
			template = template.replacingOccurrences(of: "{classes}", with: try typeDefinitions())
			template = template.replacingOccurrences(of: "{variable}", with: variable)
			template = template.replacingOccurrences(of: "{scope}", with: tag)
			template = template.replacingOccurrences(of: "{operations}", with: operations.joined(separator: "\n"))
			
			return template
		}
	}
	
}
