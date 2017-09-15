//
//  Path.swift
//  ESI
//
//  Created by Artem Shimanski on 12.04.17.
//  Copyright © 2017 Artem Shimanski. All rights reserved.
//

import Foundation

class Path {
	let operations: [Operation]
	let path: String
	
	init(path: String, dictionary: [String: Any]) throws {
		self.path = path
		
		var operations = [Operation]()
		for (method, dictionary) in dictionary {
			guard let dic = dictionary as? [String: Any] else {throw ESIParserError.format(Swift.type(of: self).self, dictionary)}
			try operations.append(Operation(dic, method: try HTTPMethod(method)))
		}
		self.operations = operations
		operations.forEach {$0.path = self}
	}
}
