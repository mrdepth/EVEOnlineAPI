//
//  Scope.swift
//  evecodegen
//
//  Created by Artem Shimanski on 29.04.17.
//  Copyright © 2017 Artem Shimanski. All rights reserved.
//

import Foundation

class Global: Namespace {
	override init() {
		super.init()
		self.name = "EVE"
	}
}

let global = Global()

class Scope: Namespace {
	var operations: [Operation] = []
	
	init(_ dictionary: Any, name: String) throws {
		super.init()
		guard let dic = dictionary as? [String: Any] else {throw ParserError.format(type(of: self).self, dictionary)}
		self.name = name.camelCaps
		
		var operations = [Operation]()
		for (key, value) in dic {
			operations.append(try Operation(value, name: key, scope: self))
		}
		
		parent = global
		self.operations = operations
		children = operations.map {$0.result}
		global.children.append(self)
	}
	
	func typeDefinitions() throws -> String {
		var definitions = [String]()
		
		for child in children.sorted(by: {$0.name < $1.name}) {
			if let item = child as? Class {
				let s = item.typeDefinition
				definitions.append(s)
			}
			else if let item = child as? Enum {
				let s = item.enumDefinition
				definitions.append(s)
			}
		}
		
		return definitions.joined(separator: "\n\n")
	}
	
	func scopeDefinition() throws -> String {
		var template = try! String(contentsOf: scopeURL)
		let variable = name.camelBack
		
		var operations = [String]()
		
		for operation in self.operations.sorted(by: {$0.name < $1.name}) {
			operations.append(operation.definition)
		}
		
		template = template.replacingOccurrences(of: "{classes}", with: try typeDefinitions())
		template = template.replacingOccurrences(of: "{variable}", with: variable)
		template = template.replacingOccurrences(of: "{scope}", with: name)
		template = template.replacingOccurrences(of: "{operations}", with: operations.joined(separator: "\n"))
		
		return template
	}
	
}
