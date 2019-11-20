//
//  main.swift
//  ESI
//
//  Created by Artem Shimanski on 12.04.17.
//  Copyright © 2017 Artem Shimanski. All rights reserved.
//

import Foundation


let url = "/Users/artem.shimanski/Downloads/swagger.json"

let data = try! Data(contentsOf: URL(fileURLWithPath: url))
let swagger = try! JSONDecoder().decode(Swagger.self, from: data)

func extract(from link: Swagger.Link<Swagger.Property>) -> Swagger.Property {
    switch link {
    case let .ref(id):
        return swagger.definitions[id.components(separatedBy: "/").last!]!
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

extension Namespace.MetaType {
    init?(from property: Swagger.Property) {
        guard let title = property.title else {return nil}

        switch property.format {
        case .int32:
            self = .int
        case .int64:
            self = .int64
        case .double, .float:
            self = .double
        case .date:
            self = .date
        case .dateTime:
            self = .dateTime
        default:
            switch property.type {
            case .array:
                self = .array(Namespace.MetaType(from: property.items!)!)
            case .boolean:
                self = .bool
            case .integer, .number:
                self = .int
            case .object:
                self = .object(title.camelBack, Namespace.Struct(from: property))
            case .string:
                self = .string
            }
        }
    }
}

extension Namespace.Struct {
    init(from property: Swagger.Property) {
        properties = property.properties?.mapValues{ i -> Namespace.MetaType in
            Namespace.MetaType(from: $0)!
        } ?? [:]
    }
}



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
