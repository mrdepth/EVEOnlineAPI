//
//  main.swift
//  ESI
//
//  Created by Artem Shimanski on 12.04.17.
//  Copyright © 2017 Artem Shimanski. All rights reserved.
//

import Foundation

let outURL = URL(fileURLWithPath: CommandLine.arguments[2])

let baseURL = URL(fileURLWithPath: CommandLine.arguments[0]).deletingLastPathComponent()
//let url = baseURL.appendingPathComponent("swagger.json")
let url = URL(string: CommandLine.arguments[1])!
let classURL = baseURL.appendingPathComponent("class.swft")
let enumURL = baseURL.appendingPathComponent("enum.swft")
let operationURL = baseURL.appendingPathComponent("operation.swft")
let scopeURL = baseURL.appendingPathComponent("scope.swft")
let securityURL = baseURL.appendingPathComponent("security.swft")
let routeURL = baseURL.appendingPathComponent("route.swft")

let skip = Set(["datasource", "token", "user_agent", "X-User-Agent", "If-None-Match", "Accept-Language"])

let operationTemplate = try! String(contentsOf: operationURL)
let enumTemplate = try! String(contentsOf: enumURL)
let classTemplate = try! String(contentsOf: classURL)
let routeTemplate = try! String(contentsOf: routeURL)
let scopeTemplate = try! String(contentsOf: scopeURL)
let securityTemplate = try! String(contentsOf: securityURL)

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
			let s = s.replacingOccurrences(of: "'", with: "").replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "").replacingOccurrences(of: "{", with: "").replacingOccurrences(of: "}", with: "")
            
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
    
    var validIdentifier: String {
        switch self {
        case "func":
            return "`func`"
        case "operator":
            return "`operator`"
        case "description":
            return "localizedDescription"
        case "id":
            return "id"
        case "in":
            return "`in`"
        case "public":
            return "`public`"
        case "private":
            return "`private`"
        case "Type":
            return "ValueType"
        case "Ui":
            return "UI"
        case "enUs":
            return "enUS"
        default:
            let s = replacingOccurrences(of: "#", with: "h")
            if CharacterSet.decimalDigits.contains(UnicodeScalar(s.utf8[s.utf8.startIndex])) {
                return "i" + s
            }
            else {
                return s
            }
        }
    }
    
    var indented: String {
        var indentation = 0
        var c = [String]()
        
        for s in self.components(separatedBy: "\n") {
            let s = s.trimmingCharacters(in: CharacterSet(charactersIn: "\t "))
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
            var prefix = existing.indices.clamped(to: keyPath.indices).prefix(while: {existing[$0] == keyPath[$0]})
            if prefix.isEmpty {
                prefix = 0..<1
            }
            let newKeyPath = Array(existing[prefix] + [keyPath.last!])
            typeIdentifiers[type] = newKeyPath
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
	case let .optional(type):
		add(type: type, keyPath: keyPath)
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

for (key, path) in root.subpaths {
    var swift = scopeTemplate
    swift = swift.replacingOccurrences(of: "{variable}", with: key.camelBack.validIdentifier)
    swift = swift.replacingOccurrences(of: "{scope}", with: key.camelCaps.validIdentifier)
    swift = swift.replacingOccurrences(of: "{routes}", with: path.swift(keyPath: [key]))
    swift = swift.replacingOccurrences(of: "{name}", with: key)
    
    let url = outURL.appendingPathComponent("\(key.camelCaps).swift")
    try! swift.indented.write(to: url, atomically: true, encoding: .utf8)
//    print(swift.indented)
}

do {
    let security = Set(swagger.securityDefinitions.flatMap{$0.value.scopes.keys}).sorted().map {
        ("public static let \($0.camelBack) = ESI.Scope(\"\($0)\")",
            ".\($0.camelBack)")
    }

    let swift = securityTemplate.replacingOccurrences(of: "{values}", with: security.map{$0.0}.joined(separator: "\n"))
        .replacingOccurrences(of: "{scopes}", with: security.map{$0.1}.joined(separator: ",\n"))

    let url = outURL.appendingPathComponent("Global.swift")
    try! swift.indented.write(to: url, atomically: true, encoding: .utf8)

}
