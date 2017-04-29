//
//  main.swift
//  evecodegen
//
//  Created by Artem Shimanski on 29.04.17.
//  Copyright © 2017 Artem Shimanski. All rights reserved.
//

import Foundation

enum ParserError: Error {
	case format(Any.Type, Any)
	case missing(Any, Any)
}

extension Dictionary {
	func safeGet<T> (key: Key) throws -> T {
		guard let value = self[key] as? T else {
			throw ParserError.missing(key, self)
		}
		return value
	}
}

guard let data = try? Data.init(contentsOf: URL(fileURLWithPath: CommandLine.arguments[1])) else {
	print("Input file not found")
	exit(1)
}

guard let schema = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String: Any] else {exit(1)}

for (key, value) in schema {
	
}
