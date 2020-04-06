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

extension Publisher where Output: DataRequest, Failure == AFError {
    
    public func validate(_ validation: @escaping DataRequest.Validation) -> Publishers.Map<Self, Output> {
        map { request in
            request.validate(validation)
        }
    }
    
    public func responseDecodable<Item: Decodable>(of type: Item.Type = Item.self, queue: DispatchQueue = .main, decoder: DataDecoder = JSONDecoder()) -> Publishers.FlatMap<Future<ESIResponse<Item>, AFError>, Self> {
        flatMap { request -> Future<ESIResponse<Item>, AFError> in
            Future { promise in
                request.responseDecodable(of: Item.self, queue: queue, decoder: decoder) { response in
                    promise(response.result.map{ESIResponse(value: $0, httpHeaders: response.response?.headers)})
                }
            }
        }
    }
    
    public func responseString(queue: DispatchQueue = .main) -> Publishers.FlatMap<Future<ESIResponse<String>, AFError>, Self> {
        flatMap { request -> Future<ESIResponse<String>, AFError> in
            Future { promise in
                request.responseString(queue: queue) { response in
                    promise(response.result.map{ESIResponse(value: $0, httpHeaders: response.response?.headers)})
                }
            }
        }
    }
    
    public func responseData(queue: DispatchQueue = .main) -> Publishers.FlatMap<Future<ESIResponse<Data>, AFError>, Self> {
        flatMap { request -> Future<ESIResponse<Data>, AFError> in
            Future { promise in
                request.responseData(queue: queue) { response in
                    promise(response.result.map{ESIResponse(value: $0, httpHeaders: response.response?.headers)})
                }
            }
        }
    }

    public func responseVoid(queue: DispatchQueue = .main) -> Publishers.FlatMap<Future<ESIResponse<Void>, AFError>, Self> {
        flatMap { request -> Future<ESIResponse<Void>, AFError> in
            Future { promise in
                request.response(queue: queue) { response in
                    promise(response.result.map{_ in ESIResponse(value: (), httpHeaders: response.response?.headers)})
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

extension ESI {
    public func publisher(_ convertible: URLConvertible,
                   method: HTTPMethod = .get,
                   parameters: Parameters? = nil,
                   encoding: ParameterEncoding = URLEncoding.default,
                   headers: HTTPHeaders? = nil,
                   interceptor: RequestInterceptor? = nil) -> Deferred<Publishers.HandleEvents<CurrentValueSubject<DataRequest, AFError>>> {
        Deferred { () -> Publishers.HandleEvents<CurrentValueSubject<DataRequest, AFError>> in
            let request = self.session.request(convertible, method: method, parameters: parameters, encoding: encoding, headers: headers, interceptor: interceptor)
            let subject = CurrentValueSubject<DataRequest, AFError>(request)
            var esi: ESI? = self
            let publisher = subject.handleEvents(receiveCancel:  {
                _ = withExtendedLifetime(esi) {
                    request.cancel()
                }
                esi = nil
            })
            
            request.response { [weak subject] response in
                _ = withExtendedLifetime(esi) {
                    switch response.result {
                    case .success:
                        subject?.send(completion: .finished)
                    case let .failure(error):
                        subject?.send(completion: .failure(error))
                    }
                }
                esi = nil
            }
            return publisher
        }
    }
}
