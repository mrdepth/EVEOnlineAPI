//
//  main.swift
//  ESI
//
//  Created by Artem Shimanski on 12.04.17.
//  Copyright © 2017 Artem Shimanski. All rights reserved.
//

import Foundation

let url = URL(fileURLWithPath: CommandLine.arguments[0]).deletingLastPathComponent().appendingPathComponent("swagger.json")
let classURL = URL(fileURLWithPath: CommandLine.arguments[0]).deletingLastPathComponent().appendingPathComponent("class.swft")
let enumURL = URL(fileURLWithPath: CommandLine.arguments[0]).deletingLastPathComponent().appendingPathComponent("enum.swft")
let operationURL = URL(fileURLWithPath: CommandLine.arguments[0]).deletingLastPathComponent().appendingPathComponent("operation.swft")
let scopeURL = URL(fileURLWithPath: CommandLine.arguments[0]).deletingLastPathComponent().appendingPathComponent("scope.swft")
let securityURL = URL(fileURLWithPath: CommandLine.arguments[0]).deletingLastPathComponent().appendingPathComponent("security.swft")



let operationTemplate = try! String(contentsOf: operationURL)
let enumTemplate = try! String(contentsOf: enumURL)
let classTemplate = try! String(contentsOf: classURL)

let data = try! Data(contentsOf: url)
let swagger = try! JSONDecoder().decode(Swagger.self, from: data)

func extract(from link: Swagger.Link<Swagger.Property>) -> Swagger.Property {
    switch link {
    case let .ref(id):
        return swagger.definitions[id.components(separatedBy: "/").last!]!
    case let .value(value):
        return value
    }
}

func extract(from link: Swagger.Link<Swagger.Parameter>) -> Swagger.Parameter {
    switch link {
    case let .ref(id):
        return swagger.parameters[id.components(separatedBy: "/").last!]!
    case let .value(value):
        return value
    }
}

extension String {
    
    var camelCaps: String {
        return components(separatedBy: CharacterSet(charactersIn: "_-. ")).enumerated().map { (i, s) -> String in
            let s = s.replacingOccurrences(of: "'", with: "").replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "")
            
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
                return s.replacingCharacters(in: r, with: s[r].uppercased())
            }
        }.joined()
    }
    
    var camelBack: String {
        guard !isEmpty else {return self}
        let s = camelCaps
        let r = s.startIndex..<s.index(after: s.startIndex)
        return s.replacingCharacters(in: r, with: s[r].lowercased())
    }
    
    var indented: String {
        var indentation = 0
        var c = [String]()
        
        for s in self.components(separatedBy: "\n") {
            let s = s.trimmingCharacters(in: CharacterSet(charactersIn: "\t"))
            let i = indentation - (s.first == "}" ? 1 : 0)
            c.append(String(repeating: "\t", count: i) + s)
            
            for c in s {
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


let paths = Dictionary(uniqueKeysWithValues: swagger.paths.map{(key: $0.key.components(separatedBy: "/").filter{!$0.isEmpty}, value: $0.value)})
let root = Model.Route(node: .root , paths: paths)

var typeIdentifiers: [Model.MetaType: [String]] = [:]
var rawIDs: [Model.MetaType: [[String]]] = [:]

func add(type: Model.MetaType, keyPath: [String]) {
    
    func store(_ type: Model.MetaType, _ keyPath: [String]) {
        rawIDs[type, default: []].append(keyPath)
        if let existing = typeIdentifiers[type] {
            let prefix = existing.indices.clamped(to: keyPath.indices).prefix(while: {existing[$0] == keyPath[$0]})
            let newKeyPath = Array(existing[prefix] + [keyPath.last!])
            typeIdentifiers[type] = newKeyPath
//            if newKeyPath != keyPath {
//                store(type, newKeyPath)
//            }
        }
        else {
            typeIdentifiers[type] = keyPath
        }
    }
    
    switch type {
    case let .enum(name, _):
        store(type, keyPath + [name])
    case let .array(type):
        add(type: type, keyPath: keyPath)
    case let .object(name, object):
        store(type, keyPath + [name])
        object.properties.values.forEach {
            if name == "Success" {
                add(type: $0, keyPath: keyPath)
            }
            else {
                add(type: $0, keyPath: keyPath + [name])
            }
        }
    default:
        break
    }
}

func add(route: Model.Route, keyPath: [String]) {
    for operation in route.operations {
        for parameter in operation.parameters.values {
            add(type: parameter.type, keyPath: keyPath)
        }
        if let response = operation.response {
            add(type: response, keyPath: keyPath)
        }
    }
    
    for (key, route) in route.subpaths {
        add(route: route, keyPath: keyPath + [key])
    }
}

add(route: root, keyPath: [])
let conflicts = Dictionary(grouping: typeIdentifiers, by: {$0.value}).filter{$0.value.count > 1}
for array in conflicts.values {
    for (type, _) in array {
        typeIdentifiers[type] = rawIDs[type]?.first
    }
}
let ids = typeIdentifiers.map{$0.key.id()}.sorted()
//let conflictIDs = conflicts.values.map{$0.map{rawIDs[$0.key]?.map{$0.map{$0.hasPrefix("{") ? String($0.dropFirst().dropLast()) : $0}.joined(separator: "_")} ?? []}}
//print(conflictIDs)
let names = Set(typeIdentifiers.values.flatMap{$0}).sorted()

//let group = Dictionary(grouping: queue, by: {$0.key[0]})
//print(group)


/*let paths = Dictionary(grouping: swagger.paths, by: {$0.key.components(separatedBy: "/")[1]}).mapValues{$0.map{$0.value}}

let namespaces = paths.map { i -> Namespace in
	let operations = i.value.flatMap{$0}.map{j in Namespace.Operation(j.value, method: j.key)}
	return Namespace(name: i.key.camelCaps, operations: operations)
}
for namespace in namespaces {
    for operation in namespace.operations {
        print(operation.name)
    }
}*/

/*struct Namespace: Hashable {
    var name: String
    var nested: [Namespace]
    
    init(name: String, nested: [Namespace]) {
        self.name = name
        self.nested = nested
    }
    
    init?(_ property: Swagger.Property) {
        guard let title = property.title else {return nil}
        name = title

        switch property.type {
        case .object:
            nested = property.properties?.values.compactMap{Namespace($0)} ?? []
        case .array:
            nested = property.items.flatMap{Namespace($0)}.map{[$0]} ?? []
        default:
            return nil
        }
    }
}

let paths = Dictionary(grouping: swagger.paths, by: {$0.key.components(separatedBy: "/")[1]}).mapValues{$0.map{$0.value}}
let namespaces = paths.map { i -> Namespace in
    let (name, methods) = i
    let nested = methods.flatMap{$0.values.compactMap { operation -> Namespace? in
            let response = operation.responses[200] ?? operation.responses[201] ?? operation.responses[204]!
            guard let schema = response.schema else {return nil}
            let result = extract(from: schema)
            return Namespace(result)
        }
    }
    return Namespace(name: name, nested: nested)
}

//let namespaces = swagger.paths.map { i -> Namespace in
//    let (path, methods) = i
//    return Namespace(name: path.components(separatedBy: "/")[1],
//                     nested: methods.flatMap { (method, operation) -> Namespace? in
//                        let response = operation.responses[200] ?? operation.responses[201] ?? operation.responses[204]!
//                        guard let schema = response.schema else {return nil}
//                        let result = extract(from: schema)
//                        return Namespace(result)
//    })
//}


//for (path, methods) in swagger.paths {
//    for (method, operation) in methods {
//        let response = operation.responses[200]!
//        guard let schema = response.schema else {continue}
//        let result = extract(from: schema)
//    }
//}
//
*/
