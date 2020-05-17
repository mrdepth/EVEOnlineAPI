//
//  Alamofire+Extensions.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 11/18/19.
//  Copyright © 2019 Artem Shimanski. All rights reserved.
//

import Foundation
import Alamofire
import Combine

public struct ESIResponse<Value> {
    public var value: Value
    public var httpHeaders: HTTPHeaders?
    
    func map<T>(_ transform: (Value) throws -> T) rethrows -> ESIResponse<T> {
        try ESIResponse<T>(value: transform(value), httpHeaders: httpHeaders)
    }
}

