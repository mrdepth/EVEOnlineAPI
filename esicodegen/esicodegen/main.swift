//
//  main.swift
//  ESI
//
//  Created by Artem Shimanski on 12.04.17.
//  Copyright © 2017 Artem Shimanski. All rights reserved.
//

import Foundation

let classURL = URL(fileURLWithPath: CommandLine.arguments[0]).deletingLastPathComponent().appendingPathComponent("class.swft")
let enumURL = URL(fileURLWithPath: CommandLine.arguments[0]).deletingLastPathComponent().appendingPathComponent("enum.swft")
let operationURL = URL(fileURLWithPath: CommandLine.arguments[0]).deletingLastPathComponent().appendingPathComponent("operation.swft")
let scopeURL = URL(fileURLWithPath: CommandLine.arguments[0]).deletingLastPathComponent().appendingPathComponent("scope.swft")
let securityURL = URL(fileURLWithPath: CommandLine.arguments[0]).deletingLastPathComponent().appendingPathComponent("security.swft")



guard let data = try? Data.init(contentsOf: URL(fileURLWithPath: CommandLine.arguments[1])) else {
	print("Input file not found")
	exit(1)
}

guard let swagger = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String: Any] else {exit(1)}

var scopes = [String: Scope]()
var paths = [Path]()
var allSchemes = [String: [Int:[Schema]]]()

let globalScope = Scope(tag: "", parent: nil)
scopes[""] = globalScope

for path in (swagger["paths"] as? [String: Any]) ?? [:] {
	guard let dic = path.value as? [String: Any] else {continue}
	do {
		let path = try Path(path: path.key, dictionary: dic)
		paths.append(path)
		
		for operation in path.operations {
//			guard let tag = operation.tags?.first else {throw ESIParserError.missingTag(path)}
//			let scope = scopes[tag] ?? {
//				let scope = Scope(tag: tag)
//				scopes[tag] = scope
//				return scope
//				}()
//			scope.operations.append(operation)
		}
	}
	catch {
		print ("error: \(path) \(error)")
	}
}

var security = [String: [String]]()
for (key, value) in (swagger["securityDefinitions"] as? [String: Any]) ?? [:] {
	guard let dictionary = value as? [String: Any] else {continue}
	guard let array = (dictionary["scopes"] as? [String: String])?.map({$0.key}) else {continue}
	security[key] = array
}

var namespaces = [Namespace: Set<Schema>]()

for (title, map) in allSchemes {
	for (key, schemes) in map {
		let scopes = schemes.map { i -> [Namespace] in
			return i.parent?.namespaceChain ?? []
		}
		
		guard !scopes.isEmpty else {continue}
		var prefix = scopes[0]
		for i in scopes.suffix(from: 1) {
			let p = i.enumerated().prefix(while: { (i, e) -> Bool in
				return prefix.count > i && prefix[i].namespaceName == e.namespaceName
			})
			prefix = p.map {$0.element}
		}
		let ns = prefix.last!
		schemes.forEach {$0.parent = ns}
		let a = namespaces[ns] ?? Set()
		namespaces[ns] = a.union(schemes)
	}
}

var classLoaders = Set<String>()

for (_, schemes) in namespaces {
	var set = Set<String>()
	for scheme in schemes {
		var id = scheme.typeIdentifier
		var i = 0
		while set.contains(id) {
			i += 1
			id = scheme.typeIdentifier + "\(i)"
		}
		if i > 0 {
			var title = scheme.title + "\(i)"
			title = conflicts[title] ?? title
			scheme.title = title
			scheme.namespaceName = title
		}
		set.insert(scheme.typeIdentifier)
		if let loader = scheme.classLoader {
			classLoaders.insert(loader)
		}
	}
}

var outURL = URL(fileURLWithPath: CommandLine.arguments[2])

for (_, scope) in scopes {
	do {
		let name = scope.tag.isEmpty ? "Global.swift" : scope.tag + ".swift"
		let url = outURL.appendingPathComponent(name)
		let s = try scope.scopeDefinition().indented
		try s.write(to: url, atomically: true, encoding: .utf8)
	}
	catch {
		print("\(error)")
	}
}


//print("\(namespaces[["Search"]]!.map{$0.typePath.joined(separator: ".")})")

//print ("\(Array(allSchemes.keys))")
