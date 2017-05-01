//
//  Namespace.swift
//  evecodegen
//
//  Created by Artem Shimanski on 30.04.17.
//  Copyright © 2017 Artem Shimanski. All rights reserved.
//

import Foundation

class Namespace: Hashable {
	var children: [Namespace] = []
	var name: String = ""
	weak var parent: Namespace? = nil
	
	var hashValue: Int {
		return name.hashValue
	}
	
	public static func ==(lhs: Namespace, rhs: Namespace) -> Bool {
		return lhs.hashValue == rhs.hashValue
	}

}

extension Namespace {
	
	func schema(name: String) -> Schema? {
		if self.name == name && self is Schema {
			return self as? Schema
		}
		else if let schema = children.first(where: {$0 is Schema && $0.name == name}) {
			return schema as? Schema
		}
		else {
			return parent?.schema(name: name)
		}
	}
	
	var namespaceChain: [Namespace] {
		var chain = parent?.namespaceChain ?? []
		chain.append(self)
		return chain
	}
	
	var namespaceIdentifier: String {
		return namespaceChain.map{$0.name}.joined(separator: ".")
	}
	
}
