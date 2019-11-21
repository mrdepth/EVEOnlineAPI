//
//  Swagger.swift
//  esicodegen
//
//  Created by Artem Shimanski on 11/20/19.
//  Copyright © 2019 Artem Shimanski. All rights reserved.
//

import Foundation

//struct StringCodingKey: CodingKey {
//    var stringValue: String
//    var intValue: Int?
//    init?(stringValue: String) {
//        self.stringValue = stringValue
//    }
//
//
//    init?(intValue: Int) {
//        return nil
//    }
//}

struct Swagger: Decodable, Hashable {
    var basePath: String
    var host: String
    var swagger: String
    var consumes: [String]
    var definitions: [String: Property]
    var info: Info
    var parameters: [String: Parameter]
    var paths: [String: [Method: Operation]]
    var produces: [String]
    var schemes: [String]
    var securityDefinitions: SecurityDefinitions
    
    enum CodingKeys: String, CodingKey {
        case basePath
        case host
        case swagger
        case consumes
        case definitions
        case info
        case parameters
        case paths
        case produces
        case schemes
        case securityDefinitions
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        basePath = try container.decode(String.self, forKey: .basePath)
        host = try container.decode(String.self, forKey: .host)
        swagger = try container.decode(String.self, forKey: .swagger)
        consumes = try container.decode([String].self, forKey: .consumes)
        info = try container.decode(Info.self, forKey: .info)
        produces = try container.decode([String].self, forKey: .produces)
        schemes = try container.decode([String].self, forKey: .schemes)
        securityDefinitions = try container.decode(SecurityDefinitions.self, forKey: .securityDefinitions)
        definitions = try container.decode([String: Property].self, forKey: .definitions)
        parameters = try container.decode([String: Parameter].self, forKey: .parameters)
        paths = try container.decode([String: [String: Operation]].self, forKey: .paths).mapValues { value -> [Method: Operation] in
            Dictionary(uniqueKeysWithValues: value.map{(Method(rawValue: $0.key)!, $0.value)})
        }
    }
}

extension Swagger {
    enum Method: String {
        case get
        case post
        case put
        case delete
    }
    
    struct Info: Decodable, Hashable {
        var description: String
        var title: String
        var version: String
    }
    
    struct SecurityDefinitions: Decodable, Hashable {
        struct Evesso: Decodable, Hashable {
            var authorizationUrl: String
            var flow: String
            var scopes: [String: String]
            var type: String
        }
        var evesso: Evesso
    }
}

extension Swagger {
    enum ValueType: String, Decodable, Hashable {
        case string
        case object
        case integer
        case array
        case boolean
        case number
    }
    
    enum ValueFormat: String, Decodable, Hashable {
        case int32
        case int64
        case float
        case double
        case dateTime = "date-time"
        case date
    }
    
    class Property: Decodable, Hashable {
        var description: String?
        var type: ValueType
        var format: ValueFormat?
        var properties: [String: Property]?
        var items: Property?
        var maxItems: Int?
        var title: String?
        var required: [String]?
        var uniqueItems: Bool?
        var `enum`: [String]?
        
        static func == (lhs: Swagger.Property, rhs: Swagger.Property) -> Bool {
            lhs.description == rhs.description
                && lhs.type == rhs.type
                && lhs.format == rhs.format
                && lhs.properties == rhs.properties
                && lhs.items == rhs.items
                && lhs.maxItems == rhs.maxItems
                && lhs.title == rhs.title
                && lhs.required == rhs.required
                && lhs.uniqueItems == rhs.uniqueItems
                && lhs.enum == rhs.enum
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(description)
            hasher.combine(type)
            hasher.combine(format)
            hasher.combine(properties)
            hasher.combine(items)
            hasher.combine(maxItems)
            hasher.combine(description)
            hasher.combine(required)
            hasher.combine(uniqueItems)
            hasher.combine(`enum`)
        }
    }
    
    struct Parameter: Decodable, Hashable {
        enum In: String, Decodable, Hashable {
            case header
            case path
            case query
            case body
        }
        
        enum Default: Hashable, CustomStringConvertible {
            var description: String {
                switch self {
                case let .integer(value):
                    return String(describing: value)
                case let .boolean(value):
                    return String(describing: value)
                case let .number(value):
                    return String(describing: value)
                case let .string(value):
                    return String(describing: value)
                }
            }
            
            case integer(Int)
            case number(Double)
            case boolean(Bool)
            case string(String)
        }
        
        var `default`: Default?
        var description: String
        var `enum`: [String]?
        var `in`: In
        var name: String
        var type: ValueType
        var required: Bool
        var minimum: Int?
        var format: ValueFormat?
        var schema: Property?
		var items: Property?
        
        enum CodingKeys: String, CodingKey {
            case `default`
            case description
            case `enum`
            case `in`
            case name
            case type
            case required
            case minimum
            case format
            case schema
			case items
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            description = try container.decode(String.self, forKey: .description)
            `enum` = try container.decodeIfPresent([String].self, forKey: .enum)
            `in` = try container.decode(In.self, forKey: .in)
            name = try container.decode(String.self, forKey: .name)
            required = try container.decodeIfPresent(Bool.self, forKey: .required) ?? false
            minimum = try container.decodeIfPresent(Int.self, forKey: .minimum)
            format = try container.decodeIfPresent(ValueFormat.self, forKey: .format)
            schema = try container.decodeIfPresent(Property.self, forKey: .schema)
			items = try container.decodeIfPresent(Property.self, forKey: .items)
            
            let type = try container.decodeIfPresent(ValueType.self, forKey: .type) ?? .object
            self.type = type
            switch type {
            case .integer:
                `default` = try container.decodeIfPresent(Int.self, forKey: .default).map{.integer($0)}
            case .string:
                `default` = try container.decodeIfPresent(String.self, forKey: .default).map{.string($0)}
            case .boolean:
                `default` = try container.decodeIfPresent(Bool.self, forKey: .default).map{.boolean($0)}
            case .number:
                `default` = try container.decodeIfPresent(Double.self, forKey: .default).map{.number($0)}
            case .object, .array:
                break
            }
        }
    }
    
    enum Link<Content: Decodable & Hashable>: Decodable, Hashable {
        case ref(String)
        case value(Content)
        
        enum CodingKeys: String, CodingKey {
            case ref = "$ref"
        }
        
        init(from decoder: Decoder) throws {
            do {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                self = try .ref(container.decode(String.self, forKey: .ref))
            } catch {
                self = try .value(Content(from: decoder))
            }
        }
    }
    
    struct Operation: Decodable, Hashable {
        
        var description: String
        var operationId: String
        var parameters: [Link<Parameter>]
        var responses: [Int: Response]
        var summary: String
        var tags: [String]
        var xAlternateVersions: [String]
        var xCachedSeconds: Int?
		var security: [Security]?
        
        enum CodingKeys: String, CodingKey {
            case description
            case operationId
            case parameters
            case responses
            case summary
            case tags
            case xAlternateVersions = "x-alternate-versions"
            case xCachedSeconds = "x-cached-seconds"
			case security
        }
        
        struct Response: Decodable, Hashable {
            var description: String
            var schema: Link<Property>?
            var headers: [String: Property]?
        }
		
		struct Security: Decodable, Hashable {
			var evesso: [String]
		}
    }
}
