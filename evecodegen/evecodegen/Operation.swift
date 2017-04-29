//
//  Operation.swift
//  evecodegen
//
//  Created by Artem Shimanski on 29.04.17.
//  Copyright © 2017 Artem Shimanski. All rights reserved.
//

import Foundation

class Operation {
	init(_ dictionary: Any, name: String, scope: Scope) throws {
		guard let dic = dictionary as? [String: Any] else {throw ParserError.format(type(of: self).self, dictionary)}
		let resultDic: [String: Any] = try dic.safeGet(key: "result")
		
	}
}
