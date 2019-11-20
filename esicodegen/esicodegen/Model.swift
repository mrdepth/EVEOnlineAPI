//
//  Model.swift
//  esicodegen
//
//  Created by Artem Shimanski on 11/20/19.
//  Copyright © 2019 Artem Shimanski. All rights reserved.
//

import Foundation

struct Namespace {
    var name: String
    var operations: [String: Operation]
    
    struct Operation: Hashable {
        var parameters: [String: MetaType]
        var method: Swagger.Method
        var security: [String]
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

//    struct Property: Hashable {
//        var type: MetaType
//        var `default`: Swagger.Parameter.Default?
//    }
}
