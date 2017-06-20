//
//  main.swift
//  evecodegen
//
//  Created by Artem Shimanski on 29.04.17.
//  Copyright © 2017 Artem Shimanski. All rights reserved.
//

import Foundation

let classURL = URL(fileURLWithPath: CommandLine.arguments[0]).deletingLastPathComponent().appendingPathComponent("class.swft")
let enumURL = URL(fileURLWithPath: CommandLine.arguments[0]).deletingLastPathComponent().appendingPathComponent("enum.swft")
let operationURL = URL(fileURLWithPath: CommandLine.arguments[0]).deletingLastPathComponent().appendingPathComponent("operation.swft")
let scopeURL = URL(fileURLWithPath: CommandLine.arguments[0]).deletingLastPathComponent().appendingPathComponent("scope.swft")
let securityURL = URL(fileURLWithPath: CommandLine.arguments[0]).deletingLastPathComponent().appendingPathComponent("security.swft")


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

extension String {
	
	var camelCaps: String {
		return components(separatedBy: CharacterSet(charactersIn: "_-. ")).enumerated().map { (i, s) -> String in
			let s = s.replacingOccurrences(of: "'", with: "")
			guard !s.isEmpty else {return ""}
			if i > 0 {
				if s.compare("id", options: [.caseInsensitive]) == .orderedSame {
					return "ID"
				}
				else if s.compare("sp", options: [.caseInsensitive]) == .orderedSame {
					return "SP"
				}
			}
			if s.compare("a", options: [.caseInsensitive]) == .orderedSame {
				return ""
			}
			else {
				let r = s.startIndex..<s.index(after: s.startIndex)
				return s.replacingCharacters(in: r, with: s.substring(with: r).uppercased())
			}
			}.joined()
	}
	
	var camelBack: String {
		guard !isEmpty else {return self}
		let s = camelCaps
		let r = s.startIndex..<s.index(after: s.startIndex)
		return s.replacingCharacters(in: r, with: s.substring(with: r).lowercased())
	}
	
	var indented: String {
		var indentation = 0
		var c = [String]()
		
		for s in self.components(separatedBy: "\n") {
			let s = s.trimmingCharacters(in: CharacterSet(charactersIn: "\t"))
			let i = indentation - (s.characters.first == "}" ? 1 : 0)
			c.append(String(repeating: "\t", count: i) + s)
			
			for c in s.characters {
				if c == "}" {
					indentation -= 1
				}
				else if c == "{" {
					indentation += 1
				}
			}
			
		}
		return c.joined(separator: "\n")
	}
}

fileprivate let salt = Int(truncatingBitPattern: 0x9e3779b9 as UInt64)

func hashCombine(seed: inout Int, value: Int) {
	seed ^= value &+ salt &+ (seed << 6) &+ (seed >> 2);
}


extension Array: Hashable {
	public static func ==(lhs: Array<Element>, rhs: Array<Element>) -> Bool {
		return lhs.hashValue == rhs.hashValue
	}
	
	public var hashValue: Int {
		get {
			var seed = 1
			for (element) in self {
				if let v = element as? AnyHashable {
					hashCombine(seed: &seed, value: v.hashValue)
				}
				else if let h = (element as AnyObject).hashValue {
					hashCombine(seed: &seed, value: h)
				}
			}
			return seed
		}}
}

guard let data = try? Data.init(contentsOf: URL(fileURLWithPath: CommandLine.arguments[1])) else {
	print("Input file not found")
	exit(1)
}

let schema: [String: Any]
do {
	schema = (try JSONSerialization.jsonObject(with: data, options: [])) as! [String: Any]
}
catch {
	print("Error: \(error)")
	exit(1)
}

var scopes = [Scope]()
var classLoaders = Set<String>()

do {
	for (key, value) in schema {
		let scope = try Scope(value, name: key)
		scopes.append(scope)
	}
}
catch {
}


var outURL = URL(fileURLWithPath: CommandLine.arguments[2])

for scope in scopes {
	do {
		let name = scope.name + ".swift"
		let url = outURL.appendingPathComponent(name)
		let s = try scope.scopeDefinition().indented
		try s.write(to: url, atomically: true, encoding: .utf8)
	}
	catch {
		print("\(error)")
	}
}

do {
	let name = "EVEGlobal.swift"
	let url = outURL.appendingPathComponent(name)

	var s = "import Foundation\n"
	s += "import Alamofire\n\n"
	s += "public extension EVE {\n\n"
	s += "class func loadClassess() {\n"
	s += classLoaders.joined(separator: "\n")
	s += "\n}"
	
	s += "\n}\n\n"
	try s.indented.write(to: url, atomically: true, encoding: .utf8)
}
catch {
	print("\(error)")
}
