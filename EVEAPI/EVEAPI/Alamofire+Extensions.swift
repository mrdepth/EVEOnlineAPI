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

public protocol ResponseDecoder {
    associatedtype Item
    associatedtype Failure: Error
    func decode<T: DataRequest>(request: T, queue: DispatchQueue, completionHandler: @escaping (Result<Item, Failure>) -> Void) -> T
}

public struct DecodableDecoder<Item: Decodable>: ResponseDecoder {
    public var decoder: DataDecoder
    public typealias Failure = AFError
    
    public func decode<T: DataRequest>(request: T, queue: DispatchQueue, completionHandler: @escaping (Result<Item, Failure>) -> Void) -> T {
        request.responseDecodable(of: Item.self, decoder: decoder) { (response) in
            completionHandler(response.result)
        }
    }
}

public struct StringDecoder: ResponseDecoder {
    public typealias Item = String
    public typealias Failure = AFError
    
    public func decode<T: DataRequest>(request: T, queue: DispatchQueue, completionHandler: @escaping (Result<Item, Failure>) -> Void) -> T {
        request.responseString(queue: queue) { response in
            completionHandler(response.result)
        }
    }
}

extension Publisher where Output: DataRequest, Failure == AFError {
    public func validate(_ validation: @escaping DataRequest.Validation) -> Validate<Self> {
        Validate(upstream: self, validation: validation)
    }
    
    public func responseDecodable<Item: Decodable>(of type: Item.Type, queue: DispatchQueue = .main, decoder: DataDecoder = JSONDecoder()) -> Decode<Self, DecodableDecoder<Item>> {
        Decode(upstream: self, queue: queue, decoder: DecodableDecoder(decoder: decoder))
    }
    
    public func responseString(queue: DispatchQueue = .main) -> Decode<Self, StringDecoder> {
        return Decode(upstream: self, queue: queue, decoder: StringDecoder())
    }
}

public struct Validate<Upstream> : Publisher where Upstream : Publisher, Upstream.Output: DataRequest, Upstream.Failure == AFError {

    public typealias Failure = Upstream.Failure
    public typealias Output = Upstream.Output
    public let upstream: Upstream

    /// The closure that transforms elements from the upstream publisher.
    public let validation: DataRequest.Validation

    public init(upstream: Upstream, validation: @escaping DataRequest.Validation) {
        self.upstream = upstream
        self.validation = validation
    }
    
    class Inner<Downstream: Subscriber>: Subscription, Subscriber where Downstream.Input == Validate.Output, Downstream.Failure == Validate.Failure {
        typealias Input = Upstream.Output
        typealias Failure = Upstream.Failure

        var downstream: Downstream?
        var upstream: Subscription?
        var validation: DataRequest.Validation
        
        init(_ subscriber: Downstream, validation block: @escaping DataRequest.Validation) {
            downstream = subscriber
            validation = block
        }

        func receive(subscription: Subscription) {
            upstream = subscription
            downstream?.receive(subscription: self)
        }
        
        func receive(_ input: Upstream.Output) -> Subscribers.Demand {
            downstream?.receive(input.validate(validation)) ?? .none
        }
        
        func receive(completion: Subscribers.Completion<Failure>) {
            downstream?.receive(completion: completion)
        }

        func request(_ demand: Subscribers.Demand) {
            upstream?.request(demand)
        }
        
        func cancel() {
            upstream?.cancel()
            downstream = nil
            upstream = nil
        }
        
    }
    
    public func receive<S>(subscriber: S) where Output == S.Input, S : Subscriber, Upstream.Failure == S.Failure {
        let inner = Inner(subscriber, validation: validation)
        upstream.receive(subscriber: inner)
    }
}

public struct DataRequestPublisher: Publisher {
    public typealias Output = DataRequest
    public typealias Failure = AFError
    public var session: Session
    public let url: URLConvertible
    public let method: HTTPMethod
    public let parameters: Parameters?
    public let encoding: ParameterEncoding
    public let headers: HTTPHeaders?

    public func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Output == S.Input {
        let request = session.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
        let subscription = Subscription(downstream: subscriber, request: request)
        subscriber.receive(subscription: subscription)
    }
    
    class Subscription<Downstream: Subscriber>: Combine.Subscription where Downstream.Input == Output, Downstream.Failure == Failure {
        var request: Output
        var downstream: Downstream?
        
        init(downstream: Downstream, request: Output) {
            self.downstream = downstream
            self.request = request
        }

        func request(_ demand: Subscribers.Demand) {
            guard demand > 0 else {return}
            _ = downstream?.receive(request)
        }
        
        func cancel() {
            downstream = nil
            guard request.state == .resumed else {return}
            request.cancel()
        }
        
    }
    
}

public struct Decode<Upstream, Decoder: ResponseDecoder> : Publisher where Upstream: Publisher, Decoder.Item: Decodable, Upstream.Output: DataRequest, Upstream.Failure == AFError, Decoder.Failure == Upstream.Failure {
    public typealias Output = Decoder.Item
    public typealias Failure = Upstream.Failure
    public let upstream: Upstream
    public let queue: DispatchQueue
    public let decoder: Decoder
    
    public func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Output == S.Input {
        let subscription = Inner(subscriber, queue: queue, decoder: decoder)
        upstream.receive(subscriber: subscription)
    }
    
    class Inner<Downstream: Subscriber>: Subscription, Subscriber where Downstream.Input == Decode.Output, Downstream.Failure == Decode.Failure {
        typealias Input = Upstream.Output
        typealias Failure = Upstream.Failure

        var downstream: Downstream?
        var upstream: Subscription?
        var decoder: Decoder
        var queue: DispatchQueue
        
        init(_ subscriber: Downstream, queue: DispatchQueue, decoder: Decoder) {
            downstream = subscriber
            self.decoder = decoder
            self.queue = queue
        }

        func receive(subscription: Subscription) {
            upstream = subscription
            downstream?.receive(subscription: self)
        }
        
        func receive(_ input: Upstream.Output) -> Subscribers.Demand {
            let r = decoder.decode(request: input, queue: queue) { result in
                switch result {
                case let .success(value):
                    _ = self.downstream?.receive(value)
                    self.downstream?.receive(completion: .finished)
                case let .failure(error):
                    self.downstream?.receive(completion: .failure(error))
                }
            }
            /*let r = input.responseDecodable(of: Output.self, queue: queue, decoder: decoder) { (response) in
                switch response.result {
                case let .success(value):
                    _ = self.downstream?.receive(value)
                    self.downstream?.receive(completion: .finished)
                case let .failure(error):
                    self.downstream?.receive(completion: .failure(error))
                }
                
            }*/
            if r.state == .initialized {
                r.resume()
            }
            
            return .none
        }
        
        func receive(completion: Subscribers.Completion<Failure>) {
            downstream?.receive(completion: completion)
        }

        func request(_ demand: Subscribers.Demand) {
            upstream?.request(demand)
        }
        
        func cancel() {
            upstream?.cancel()
            downstream = nil
            upstream = nil
        }
    }
}

extension Session {
    public func publisher(_ convertible: URLConvertible,
                   method: HTTPMethod = .get,
                   parameters: Parameters? = nil,
                   encoding: ParameterEncoding = URLEncoding.default,
                   headers: HTTPHeaders? = nil,
                   interceptor: RequestInterceptor? = nil) -> DataRequestPublisher {
        
        DataRequestPublisher(session: self, url: convertible, method: method, parameters: parameters, encoding: encoding, headers: headers)
    }
}
