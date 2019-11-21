//
//  Model.swift
//  esicodegen
//
//  Created by Artem Shimanski on 11/20/19.
//  Copyright © 2019 Artem Shimanski. All rights reserved.
//

import Foundation

struct Model {
//    var name: String
//    var operations: [Operation]
    
    struct Operation: Hashable {
		var name: String
        var parameters: [String: Parameter]
        var method: Swagger.Method
        var security: [String]
		var response: MetaType?
    }

    indirect enum MetaType: Hashable {
        case int
        case int64
        case double
        case string
        case bool
        case object(String, Struct)
        case `enum`(String, [String])
        case array(MetaType)
        case optional(MetaType)
        case date
        case dateTime
    }

    struct Struct: Hashable {
        var properties: [String: MetaType]
    }

    struct Parameter: Hashable {
        var type: MetaType
        var `default`: Swagger.Parameter.Default?
        var location: Swagger.Parameter.In
    }
}


extension Model.MetaType {
    init?(from parameter: Swagger.Parameter, prefix: String) {
        switch parameter.format {
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
            switch parameter.type {
            case .array:
                self = .array(Model.MetaType(from: parameter.items!, name: parameter.name, prefix: prefix)!)
            case .boolean:
                self = .bool
            case .integer, .number:
                self = .int
            case .object:
                self = .object(Self.getName(from: parameter.schema!.title!, prefix: prefix), Model.Struct(from: parameter.schema!, prefix: prefix))
            case .string:
                if let `enum` = parameter.enum {
                    self = .enum(Self.getName(from: parameter.name, prefix: prefix), `enum`)
                }
                else {
                    self = .string
                }
            }
        }
    }
    
    private static func getName(from id: String, prefix: String) -> String {
        let id = typeNames[id] ?? {
            if id.hasPrefix(prefix) {
                return String(id.dropFirst(prefix.count)).camelCaps
            }
            else {
                return id.camelCaps
            }
        }()
        return id == "200Ok" || id == "Ok" ? "Success" : id
    }
    
    init?(from property: Swagger.Property, name: String?, prefix: String) {

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
                self = .array(Model.MetaType(from: property.items!, name: name, prefix: prefix)!)
            case .boolean:
                self = .bool
            case .integer, .number:
                self = .int
            case .object:
                self = .object(Self.getName(from: property.title!, prefix: prefix), Model.Struct(from: property, prefix: prefix))
            case .string:
                if let `enum` = property.enum {
                    self = .enum(Self.getName(from: property.title ?? name!, prefix: prefix), `enum`)
                }
                else {
                    self = .string
                }
            }
        }
    }
}

extension Model.Struct {
    init(from property: Swagger.Property, prefix: String) {
        let pairs = property.properties?.map { i -> (String, Model.MetaType) in
            if property.required?.contains(i.key) == true {
                return (i.key, Model.MetaType(from: i.value, name: i.key, prefix: prefix)!)
            }
            else {
                return (i.key, .optional(Model.MetaType(from: i.value, name: i.key, prefix: prefix)!))
            }
        }
        properties = Dictionary(uniqueKeysWithValues: pairs ?? [])
    }
}

extension Model.Parameter {
    init(_ parameter: Swagger.Parameter, prefix: String) {
        self.default = parameter.default
        type = Model.MetaType(from: parameter, prefix: prefix)!
        location = parameter.in
    }
}

extension Model.Operation {
    init(_ operation: Swagger.Operation, method: Swagger.Method) {
        self.method = method
        name = operation.operationId
        let pairs = operation.parameters.map { i -> (String, Model.Parameter) in
            let parameter = extract(from: i)
            return (parameter.name, Model.Parameter(parameter, prefix: operation.operationId))
        }
        parameters = Dictionary(uniqueKeysWithValues: pairs)
        security = operation.security?.flatMap{$0.evesso} ?? []
        response = ((200..<300).lazy.compactMap{operation.responses[$0]}.first?.schema).map {
            Model.MetaType(from: extract(from: $0), name: nil, prefix: operation.operationId)! }
    }
}

extension Model {
    struct Route: Hashable {
        enum Node: Hashable {
            case root
            case name(String)
            case parameter(String)
            init(_ string: String) {
                if string.hasPrefix("{") {
                    assert(string.hasSuffix("}"))
                    self = .parameter(String(string.dropFirst().dropLast()))
                }
                else {
                    self = .name(string)
                }
            }
        }
        
        let subpaths: [String: Route]
        let operations: [Model.Operation]
        let node: Node
        
        init(node: Node, paths: [[String]: [Swagger.Method: Swagger.Operation]]) {
            let operations = paths.filter{$0.key.isEmpty}
            let subpaths = paths.filter{!$0.key.isEmpty}
            self.node = node
            self.subpaths = Dictionary(grouping: subpaths, by: {$0.key[0]}).mapValues{Route(node: Node($0.first!.key.first!) ,paths: Dictionary(uniqueKeysWithValues: $0.map{(Array($0.key.dropFirst()), $0.value)}))}
            self.operations = operations.values.flatMap{$0.map{Model.Operation($0.value, method: $0.key)}}
        }
    }
}

extension Model.MetaType {
    func name() -> String {
        switch self {
        case let .array(type):
            return "[\(type.name())]"
        case .bool:
            return "Bool"
        case .date, .dateTime:
            return "Date"
        case .double:
            return "Double"
        case let .enum(name, _):
            return name
        case .int:
            return "Int"
        case .int64:
            return "Int64"
        case let .object(name, _):
            return name
        case let .optional(type):
            return "\(type.name())?"
        case .string:
            return "String"
        }
    }
    func id() -> String {
        switch self {
        case .enum, .object:
            return typeIdentifiers[self]!.map{ $0.hasPrefix("{") ? String($0.dropFirst().dropLast()) : $0 }.map{$0.camelCaps}.joined(separator: ".")
        case let .optional(type):
            return "\(type.id())?"
        default:
            return name()
        }
    }
}

extension Model.Parameter {
    func body(_ name: String) -> String {
        let parameterName = name.camelBack
        switch type {
        case .optional:
            return "let body = try \(parameterName).map{JSONEncoder().encode($0)} ?? nil"
        default:
            return "let body = try JSONEncoder().encode(\(parameterName))"
        }
    }
    
    func header(_ name: String) -> String {
        let parameterName = name.camelBack

        func header(_ type: Model.MetaType) -> String {
            switch type {
            case let .optional(nested):
                return "if let parameterName = \(parameterName) {\n" +
                    header(nested) +
                "\n}"
            case .array:
                return "headers[\"\(name)\"] = \(parameterName).isEmpty ? nil : \(parameterName).lazy.map{$0.description}.joined(separator: \",\")"
            default:
                return "headers[\"\(name)\"] = \(parameterName).description"
            }
        }
        return header(type)
    }

    func query(_ name: String) -> String {
        let parameterName = name.camelBack
        
        func query(_ type: Model.MetaType) -> String {
            switch type {
            case let .optional(nested):
                return "if let parameterName = \(parameterName) {\n" +
                query(nested) +
                "\n}"
            case .array:
                return "if !\(parameterName).isEmpty {\n" +
                "query.append(URLQueryItem(name: \"\(name)\", value: \(parameterName).lazy.map{$0.description}.joined(separator: \",\")))\n}"
            default:
                return "query.append(URLQueryItem(name: \"\(name)\", value: \(parameterName).description))"
            }
        }
        return query(type)
    }
}

extension Model.MetaType {
    func definition() -> String? {
        switch self {
        case let .array(type):
            return type.definition()
        case let .enum(name, cases):
            var swift = enumTemplate
            swift = swift.replacingOccurrences(of: "{enum}", with: name.camelCaps)
            swift = swift.replacingOccurrences(of: "{enum}", with: cases.map{($0.camelBack, $0)}.map{
                $0 == $1 ? $0 : "\($0) = \"\($1)\""
            }.joined(separator: "\n"))
            return swift
        case let .object(name, _):
            return name
        case let .optional(type):
            return type.definition()
        default:
            return nil
        }
    }
}

extension Model.Operation {
    func swift() -> String {
        var swift = operationTemplate
        
        var arguments: [String] = []
        var headers: [String] = []
        var queries: [String] = []
        var body: String?
        var securityCheck: [String] = []
        
        for (name, parameter) in parameters.filter({$0.value.location != .path}).sorted(by: {$0.key < $1.key}) {
            if let defaults = parameter.default {
                arguments.append("\(name): \(parameter.type.id()) = \(defaults)")
            }
            else {
                arguments.append("\(name): \(parameter.type.id())")
            }
            switch parameter.location {
            case .body:
                body = parameter.body(name)
            case .header:
                headers.append(parameter.header(name))
            case .path:
                break
            case .query:
                queries.append(parameter.query(name))
            }
        }
        
        if method != .get {
            headers.append("headers[\"Content-Type\"] = \"application/json\"")
        }
        

        arguments.append("cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy")
        
        let result = response?.name() ?? "Void"
        
        swift = swift.replacingOccurrences(of: "{operation}", with: method.rawValue)
        swift = swift.replacingOccurrences(of: "{method}", with: method.rawValue)
        swift = swift.replacingOccurrences(of: "{arguments}", with: arguments.joined(separator: ", "))
        swift = swift.replacingOccurrences(of: "{result}", with: result)
        swift = swift.replacingOccurrences(of: "{body}", with: body ?? "let body: Data? = nil")
        swift = swift.replacingOccurrences(of: "{headers}", with: headers.joined(separator: "\n"))
        swift = swift.replacingOccurrences(of: "{queries}", with: queries.joined(separator: "\n"))

        if !security.isEmpty {
            for scope in security {
                let s = "guard scopes.contains(\"\(scope)\") else {throw ESIError.forbidden}"
                securityCheck.append(s)
            }
            var s = "let scopes = esi.token?.scopes ?? []\n"
            s += securityCheck.joined(separator: "\n")
            swift = swift.replacingOccurrences(of: "{security}", with: s)
        }
        else {
            swift = swift.replacingOccurrences(of: "{security}", with: "")
        }

        let decode: String
        if result == "String" {
            decode = "responseString(queue: esi.session.serializationQueue)"
        }
        else {
            decode = "responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)"
        }
        
        swift = swift.replacingOccurrences(of: "{decode}", with: decode)
        return swift
    }
}
