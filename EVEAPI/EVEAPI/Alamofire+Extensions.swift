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

extension Publisher where Output: DataRequest, Failure == AFError {
    
    public func validate(_ validation: @escaping DataRequest.Validation) -> Publishers.Map<Self, Output> {
        map { request in
            request.validate(validation)
        }
    }
    
    public func responseDecodable<Item: Decodable>(of type: Item.Type = Item.self, queue: DispatchQueue = .main, decoder: DataDecoder = JSONDecoder()) -> Publishers.FlatMap<Future<Item, AFError>, Self> {
        flatMap { request -> Future<Item, AFError> in
            Future { promise in
                request.responseDecodable(of: Item.self, queue: queue, decoder: decoder) { response in
                    promise(response.result)
                }
            }
        }
    }
    
    public func responseString(queue: DispatchQueue = .main) -> Publishers.FlatMap<Future<String, AFError>, Self> {
        flatMap { request -> Future<String, AFError> in
            Future { promise in
                request.responseString(queue: queue) { response in
                    promise(response.result)
                }
            }
        }
    }
    
    public func responseData(queue: DispatchQueue = .main) -> Publishers.FlatMap<Future<Data, AFError>, Self> {
        flatMap { request -> Future<Data, AFError> in
            Future { promise in
                request.responseData(queue: queue) { response in
                    promise(response.result)
                }
            }
        }
    }
    
    public func downloadProgress(queue: DispatchQueue = .main, closure: @escaping Request.ProgressHandler) -> Publishers.Map<Self, Output> {
        map { request in
            request.downloadProgress(queue: queue, closure: closure)
        }
    }

}

extension Session {
    public func publisher(_ convertible: URLConvertible,
                   method: HTTPMethod = .get,
                   parameters: Parameters? = nil,
                   encoding: ParameterEncoding = URLEncoding.default,
                   headers: HTTPHeaders? = nil,
                   interceptor: RequestInterceptor? = nil) -> Deferred<Publishers.HandleEvents<CurrentValueSubject<DataRequest, AFError>>> {
        Deferred { () -> Publishers.HandleEvents<CurrentValueSubject<DataRequest, AFError>> in
            let request = self.request(convertible, method: method, parameters: parameters, encoding: encoding, headers: headers, interceptor: interceptor)
            return CurrentValueSubject<DataRequest, AFError>(request).handleEvents(receiveCancel:  {
                request.cancel()
            })
        }
    }
}
