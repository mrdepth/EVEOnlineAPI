//
//  Type.swift
//  evecodegen
//
//  Created by Artem Shimanski on 29.04.17.
//  Copyright © 2017 Artem Shimanski. All rights reserved.
//

import Foundation

enum Type {
	case int(Bool)
	case int64(Bool)
	case string(Bool)
	case float(Bool)
	case double(Bool)
	case date(Bool)
	indirect case array(Type,Bool)
	case `class`(String,Bool)
	
	init(_ string: String) {
		let typeName: String
		let isOptional: Bool
		if string.hasSuffix("?") {
			typeName = string.substring(to: string.index(before: string.endIndex))
			isOptional = true
		}
		else {
			typeName = string
			isOptional = false
		}
	}
}
