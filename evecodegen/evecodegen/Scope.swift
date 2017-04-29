//
//  Scope.swift
//  evecodegen
//
//  Created by Artem Shimanski on 29.04.17.
//  Copyright © 2017 Artem Shimanski. All rights reserved.
//

import Foundation

class Scope {
	let name: String
	var operations: [Operation] = []
	
	init(_ dictionary: Any, name: String) throws {
		guard let dic = dictionary as? [String: Any] else {throw ParserError.format(type(of: self).self, dictionary)}
		self.name = name
		
		var operations = [Operation]()
		for (key, value) in dic {
			operations.append(try Operation(value, name: key, scope: self))
		}
		
		self.operations = operations
	}
}
