//
//  Response.swift
//  ESI
//
//  Created by Artem Shimanski on 12.04.17.
//  Copyright © 2017 Artem Shimanski. All rights reserved.
//

import Foundation

class Response {
	let schema: Schema?
	
	init(_ dictionary: [String: Any], parent: Namespace?) throws {
		if let dic = dictionary["schema"] as? [String: Any] {
			schema = try? Schema(dic, title: dic["title"] as? String, parent: parent)
		}
		else {
			schema = nil
		}
	}
}
