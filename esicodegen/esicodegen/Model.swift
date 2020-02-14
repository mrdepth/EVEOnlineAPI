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
		let name: String
        let parameters: [String: Parameter]
        let method: Swagger.Method
        let security: Set<String>
		let response: MetaType?
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
        let properties: [String: MetaType]
    }

    struct Parameter: Hashable {
        let type: MetaType
        let `default`: Swagger.Parameter.Default?
        let location: Swagger.Parameter.In
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
            default:
                self = Model.MetaType(from: parameter.schema!, name: parameter.name, prefix: prefix)!
            }
        }
    }
    
    private static func getName(from id: String, prefix: String) -> String {
        let id = typeNames[id] ?? {
            if id.hasPrefix(prefix) {
                return String(id.dropFirst(prefix.count)).camelCaps.validIdentifier
            }
            else {
                return id.camelCaps.validIdentifier
            }
        }()
        return id == "i200Ok" || id == "Ok" ? "Success" : id
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
        if parameter.required {
            type = Model.MetaType(from: parameter, prefix: prefix)!
        }
        else {
            type = .optional(Model.MetaType(from: parameter, prefix: prefix)!)
        }
//        type = Model.MetaType(from: parameter, prefix: prefix)!
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
        security = Set(operation.security?.flatMap{$0}.flatMap{$0.value} ?? [])
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
			assert(typeIdentifiers[self] != nil)
            return (["ESI"] + typeIdentifiers[self]!.map{$0.camelCaps.validIdentifier}).joined(separator: ".")
        case let .array(type):
            return "[\(type.id())]"
        case let .optional(type):
            return "\(type.id())?"
        default:
            return name()
        }
    }
}

extension Model.Parameter {
    func body(_ name: String) -> String {
        let parameterName = name.camelBack.validIdentifier
        switch type {
        case .optional:
            return "let body = try \(parameterName).map{JSONEncoder().encode($0)} ?? nil"
        default:
            return "let body = try JSONEncoder().encode(\(parameterName))"
        }
    }
    
    func header(_ name: String) -> String {
        let parameterName = name.camelBack.validIdentifier

        func header(_ type: Model.MetaType) -> String {
            switch type {
            case let .optional(nested):
                return "if let \(parameterName) = \(parameterName) {\n" +
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
        let parameterName = name.camelBack.validIdentifier
        
        func query(_ type: Model.MetaType) -> String {
            switch type {
            case let .optional(nested):
                return "if let \(parameterName) = \(parameterName) {\n" +
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

extension Model.Operation {
    func swift() -> String {
        var swift = operationTemplate
        
        var arguments: [String] = []
        var headers: [String] = []
        var queries: [String] = []
        var body: String?
        
		for (name, parameter) in parameters.filter({$0.value.location != .path && !skip.contains($0.key)}).sorted(by: {$0.key < $1.key}) {
            if let defaults = parameter.default {
                let value = parameter.type.default(defaults)
				arguments.append("\(name.camelBack.validIdentifier): \(parameter.type.id()) = \(value)")
            }
            else {
                arguments.append("\(name.camelBack.validIdentifier): \(parameter.type.id())")
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
        arguments.append("progress: Request.ProgressHandler? = nil")
        
        let result = response?.name() ?? "Void"
        
        swift = swift.replacingOccurrences(of: "{operation}", with: method.rawValue)
        swift = swift.replacingOccurrences(of: "{method}", with: method.rawValue)
        swift = swift.replacingOccurrences(of: "{arguments}", with: arguments.joined(separator: ", "))
        swift = swift.replacingOccurrences(of: "{result}", with: result)
        swift = swift.replacingOccurrences(of: "{body}", with: body ?? "")
        swift = swift.replacingOccurrences(of: "{headers}", with: headers.joined(separator: "\n"))
        swift = swift.replacingOccurrences(of: "{queries}", with: queries.joined(separator: "\n"))
        swift = swift.replacingOccurrences(of: "{encoding}", with: body != nil ? "BodyDataEncoding(data: body)" : "URLEncoding.default")

        if !security.isEmpty {
            let securityCheck: [String] = security.sorted().map{
                "guard scopes.contains(\"\($0)\") else {throw ESIError.forbidden}"
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
        else if result == "Void" {
            decode = "responseVoid(queue: esi.session.serializationQueue)"
        }
        else {
            decode = "responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)"
        }
        
        swift = swift.replacingOccurrences(of: "{decode}", with: decode)
        return swift
    }
}

extension Model.Route {
	func swift(keyPath: [String]) -> String {
		var swift = routeTemplate
		
		var s = operations.sorted{$0.name < $1.name}.map{$0.swift()}.joined(separator: "\n")
		swift = swift.replacingOccurrences(of: "{operations}", with: s)

		let subpaths = self.subpaths.sorted(by: {$0.key < $1.key})
		
		func findParameter(_ parameter: String, in route: Model.Route) -> Model.Parameter? {
			route.operations.flatMap{$0.parameters}.first{$0.key == parameter}?.value ??
				route.subpaths.values.lazy.compactMap{findParameter(parameter, in: $0)}.first
		}
		
		s = subpaths.map{$0.value.swift(keyPath: keyPath + [$0.key])}.joined(separator: "\n")
		swift = swift.replacingOccurrences(of: "{paths}", with: s)

		s = subpaths.map { (key, route) -> String in
			if key.hasPrefix("{") {
				let name = String(key.dropLast().dropFirst())
				let parameter = findParameter(name, in: route)!
				let s: String
				if let defaults = parameter.default {
                    let value = parameter.type.default(defaults)
					s = "public func \(key.camelBack.validIdentifier)(_ value: \(parameter.type.id()) = \(value)) -> \(key.camelCaps.validIdentifier) {\n"
				}
				else {
					s = "public func \(key.camelBack.validIdentifier)(_ value: \(parameter.type.id())) -> \(key.camelCaps.validIdentifier) {\n"
				}
				return s + "\(key.camelCaps.validIdentifier)(esi: esi, route: .parameter(value, next: route))\n}"

			}
			else {
				return "public func \(key.camelBack.validIdentifier)() -> \(key.camelCaps.validIdentifier) {\n" +
				"\(key.camelCaps.validIdentifier)(esi: esi, route: .path(\"\(key)\", next: route))\n}"
			}
		}.joined(separator: "\n")
		
		swift = swift.replacingOccurrences(of: "{routes}", with: s)
		if !keyPath.isEmpty {
			swift = swift.replacingOccurrences(of: "{name}", with: keyPath.last!.camelCaps.validIdentifier)
		}
		
		let nested = typeIdentifiers.filter{Array($0.value.prefix(keyPath.count)) == keyPath && $0.value.count == keyPath.count + 1}.compactMap{$0.key.swift(keyPath: keyPath)}

		swift = swift.replacingOccurrences(of: "{classes}", with: nested.joined(separator: "\n"))

		return swift
	}
}

extension Model.MetaType {
    func `default`(_ defaults: Swagger.Parameter.Default) -> String {
        switch (self, defaults) {
        case let (.enum, .string(s)):
            return ".\(s.camelBack.validIdentifier)"
        case (.optional, _):
            return "nil"
        default:
            return String(describing: defaults)
        }
    }
    
    func unwrap() -> Self {
        switch self {
        case let .array(type):
            return type.unwrap()
        case let .optional(type):
            return type.unwrap()
        default:
            return self
        }
    }
    
	func swift(keyPath: [String]) -> String? {
        switch self {
        case let .array(type):
			return type.swift(keyPath: keyPath)
        case let .enum(name, cases):
            var swift = enumTemplate
            swift = swift.replacingOccurrences(of: "{name}", with: name.camelCaps.validIdentifier)
            swift = swift.replacingOccurrences(of: "{cases}", with: cases.map{($0.camelBack.validIdentifier, $0)}.map{
                $0 == $1 ? "case \($0)" : "case \($0) = \"\($1)\""
            }.joined(separator: "\n"))
            return swift
        case let .object(name, object):
			var swift = classTemplate
            swift = swift.replacingOccurrences(of: "{name}", with: name.camelCaps.validIdentifier)
			let properties = object.properties.sorted(by: {$0.key < $1.key})
			var rows = properties.map { (name, property) in
				"public var \(name.camelBack.validIdentifier): \(property.id())"
			}
			
			swift = swift.replacingOccurrences(of: "{properties}", with: rows.joined(separator: "\n"))
            
            rows = properties.map { (name, property) in
                "\(name.camelBack.validIdentifier): \(property.id())"
            }
            let arguments = rows.joined(separator: ", ")
            rows = properties.map { (name, property) in
                "self.\(name.camelBack.validIdentifier) = \(name.camelBack.validIdentifier)"
            }
            let assigns = rows.joined(separator: "\n")
            let constructor = "public init(\(arguments)) {\n\(assigns)\n}"
            swift = swift.replacingOccurrences(of: "{constructor}", with: constructor)

			
			let codingKeys = properties.map{$0.key}.map{($0.camelBack.validIdentifier, $0)}.map{
                $0 == $1 ? "case \($0)" : "case \($0) = \"\($1)\""
            }
            
            let dateFormatters = properties.compactMap{ (name, property) -> String? in
                switch property.unwrap() {
                case .date:
                    return "case .\(name.camelBack.validIdentifier):\nreturn DateFormatter.esiDateFormatter"
                case .dateTime:
                    return "case .\(name.camelBack.validIdentifier):\nreturn DateFormatter.esiDateTimeFormatter"
                default:
                    return nil
                }
            }
            
            if !dateFormatters.isEmpty {
                let s = "switch self {\n" +
                "\(dateFormatters.joined(separator: "\n"))\n" +
                "default:\nreturn nil\n}"
                swift = swift.replacingOccurrences(of: "{dateFormatters}", with: s)
            }
            else {
                swift = swift.replacingOccurrences(of: "{dateFormatters}", with: "return nil")
            }
			
			swift = swift.replacingOccurrences(of: "{codingKeys}", with: codingKeys.joined(separator: "\n"))
			
			let newKeyPath = keyPath + [name]
			let nested = typeIdentifiers.filter{Array($0.value.prefix(newKeyPath.count)) == newKeyPath && $0.value.count == newKeyPath.count + 1}.compactMap{$0.key.swift(keyPath: newKeyPath)}

			swift = swift.replacingOccurrences(of: "{classes}", with: nested.joined(separator: "\n"))
			
            return swift
        case let .optional(type):
            return type.swift(keyPath: keyPath)
        default:
            return nil
        }
    }
}
