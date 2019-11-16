//
//  AppDelegate.swift
//  Develop
//
//  Created by Artem Shimanski on 27.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit
import EVEAPI
import Alamofire
import Futures
import Combine


let clientID = "a0cc80b7006944249313dc22205ec645"
let secretKey = "deUqMep7TONp68beUoC1c71oabAdKQOJdbiKpPcC"

class MyCache: URLCache {
	override func cachedResponse(for request: URLRequest) -> CachedURLResponse? {
		print("\(#function): \(request)")
		return super.cachedResponse(for: request)
	}
	
	override func storeCachedResponse(_ cachedResponse: CachedURLResponse, for request: URLRequest) {
		print("\(#function): \(request)")
		let original = cachedResponse.response as! HTTPURLResponse
		
		let fields = original.allHeaderFields.map {($0.key as! String, $0.value as! String)}
		var headers = Dictionary(uniqueKeysWithValues: fields)
		headers["cached"] = "true"
		
		let response = HTTPURLResponse(url: original.url!, statusCode: original.statusCode, httpVersion: nil, headerFields: headers)!
		let other = CachedURLResponse(response: response, data: cachedResponse.data, userInfo: cachedResponse.userInfo, storagePolicy: cachedResponse.storagePolicy)
		super.storeCachedResponse(other, for: request)
	}
}
/*
protocol ResponseDecoder {
    associatedtype Success
    associatedtype Failure: Error
    associatedtype RequestType: Request
    
    func response(from request: RequestType, completion: @escaping (Result<Success, Failure>) -> Void) -> RequestType
}

struct DecodableResponseDecoder<Success>: ResponseDecoder where Success: Decodable {
    var queue: DispatchQueue = .main
    var decoder: DataDecoder = JSONDecoder()
    
    func response(from request: DataRequest, completion: @escaping (Result<Success, AFError>) -> Void) -> DataRequest {
        request.responseDecodable(of: Success.self, queue: queue, decoder: decoder) { response in
            completion(response.result)
        }
    }
}

struct StringResponseDecoder: ResponseDecoder {
    func response(from request: DataRequest, completion: @escaping (Result<String, AFError>) -> Void) -> DataRequest {
        request.responseString { response in
            completion(response.result)
        }
    }
}

class RequestPublisher<Decoder: ResponseDecoder>: Publisher {
    typealias Output = Decoder.Success
    typealias Failure = Decoder.Failure
    typealias RequestType = Decoder.RequestType
    
    private class Subscription<SubscriberType: Subscriber>: Combine.Subscription where SubscriberType.Input == Output, SubscriberType.Failure == Failure {
        var publisher: RequestPublisher?
        var subscriber: SubscriberType?
        
        init(publisher: RequestPublisher, subscriber: SubscriberType) {
            self.publisher = publisher
            self.subscriber = subscriber
        }
        
        func request(_ demand: Subscribers.Demand) {
            publisher?.request(self) { [weak self] result in
                switch result {
                case let .success(value):
                    if demand > 0 {
                        _ = self?.subscriber?.receive(value)
                    }
                    self?.subscriber?.receive(completion: .finished)
                case let .failure(error):
                    self?.subscriber?.receive(completion: .failure(error))
                }
            }
        }
        
        func cancel() {
            publisher?.cancel(self)
            publisher = nil
            subscriber = nil
        }
    }
    
    func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Output == S.Input {
        subscriber.receive(subscription: Subscription(publisher: self, subscriber: subscriber))
    }
    
    private var request: RequestType!
    private let lock = NSLock()

    init(request: RequestType, decoder: Decoder) {
        self.request = decoder.response(from: request) { [weak self] (result) in
            self?.lock.lock()
            defer {self?.lock.unlock()}
            self?.result = result
            let requests = self?.requests
            self?.requests.removeAll()
            requests?.values.forEach {$0(result)}
        }
    }
    
    private var requests: [CombineIdentifier: (Result<Output, Failure>) -> Void] = [:]
    private var result: Result<Output, Failure>?
    
    private func request<S: Combine.Subscription>(_ subscription: S, block: @escaping (Result<Output, Failure>) -> Void ) {
        lock.lock()
        defer{lock.unlock()}
        if let result = result {
            block(result)
        }
        else {
            requests[subscription.combineIdentifier] = block
            if request.state == .initialized {
                request.resume()
            }
        }
    }
    
    deinit {
        request.cancel()
    }
    
    private func cancel<S: Combine.Subscription>(_ subscription: S) {
        lock.lock()
        defer{lock.unlock()}
        requests[subscription.combineIdentifier] = nil
        request.cancel()
    }
}

extension DataRequest {
    func stringPublisher() -> RequestPublisher<StringResponseDecoder> {
        return RequestPublisher(request: self, decoder: StringResponseDecoder())
    }
}
*/

extension Publisher where Output: DataRequest, Failure == AFError {
    func validate(_ validation: @escaping DataRequest.Validation) -> Validate<Self> {
        Validate(upstream: self, validation: validation)
    }
    
    func decode<Item: Decodable>(type: Item.Type, decoder: DataDecoder = JSONDecoder()) -> Decode<Self, Item> {
        Decode(upstream: self, decoder: decoder)
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
    let url: URLConvertible
    let method: HTTPMethod
    let parameters: Parameters?
    let encoding: ParameterEncoding
    let headers: HTTPHeaders?

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

public struct Decode<Upstream, Output> : Publisher where Upstream: Publisher, Output: Decodable, Upstream.Output: DataRequest, Upstream.Failure == AFError {
    public typealias Failure = Upstream.Failure
    public let upstream: Upstream
    public let decoder: DataDecoder
    
    public func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Output == S.Input {
        let subscription = Inner(subscriber, queue: .main, decoder: decoder)
        upstream.receive(subscriber: subscription)
    }
    
    class Inner<Downstream: Subscriber>: Subscription, Subscriber where Downstream.Input == Decode.Output, Downstream.Failure == Decode.Failure {
        typealias Input = Upstream.Output
        typealias Failure = Upstream.Failure

        var downstream: Downstream?
        var upstream: Subscription?
        var decoder: DataDecoder
        var queue: DispatchQueue
        
        init(_ subscriber: Downstream, queue: DispatchQueue, decoder: DataDecoder) {
            downstream = subscriber
            self.decoder = decoder
            self.queue = queue
        }

        func receive(subscription: Subscription) {
            upstream = subscription
            downstream?.receive(subscription: self)
        }
        
        func receive(_ input: Upstream.Output) -> Subscribers.Demand {
            let r = input.responseDecodable(of: Output.self, queue: queue, decoder: decoder) { (response) in
                switch response.result {
                case let .success(value):
                    _ = self.downstream?.receive(value)
                    self.downstream?.receive(completion: .finished)
                case let .failure(error):
                    self.downstream?.receive(completion: .failure(error))
                }
                
            }
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
    func publisher(_ convertible: URLConvertible,
                   method: HTTPMethod = .get,
                   parameters: Parameters? = nil,
                   encoding: ParameterEncoding = URLEncoding.default,
                   headers: HTTPHeaders? = nil,
                   interceptor: RequestInterceptor? = nil) -> DataRequestPublisher {
        
        DataRequestPublisher(session: self, url: convertible, method: method, parameters: parameters, encoding: encoding, headers: headers)
    }

    
}

struct Time: Codable {
    var currentDateTime: String
    var utcOffset: String
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	enum SerializationError: Error {
		case dateFormatError
	}

    let session = Session(startRequestsImmediately: false)
    var c1: AnyCancellable?
    var c2: AnyCancellable?
    var c3: AnyCancellable?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let p = URLSession.shared.dataTaskPublisher(for: URL(string: "http://worldclockapi.com/api/json/est/now")!)
        c1 = p.sink(receiveCompletion: { (c) in
            print(c)
        }) { (d) in
            print(d)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.c2 = p.sink(receiveCompletion: { (c) in
                print(c)
            }) { (d) in
                print(d)
            }
        }
        c3 = session.publisher("http://worldclockapi.com/api/json/est/now").decode(type: Time.self)
            .sink(receiveCompletion: { (c) in
                print(c)
            }) { (d) in
                print(d)
            }
//        let r = session.request("http://google.com").validate().stringPublisher().catch{_ in Just("")}.sink { result in
//            print(result)
//        }
//        c = r
        return true
    }

	func applicationWillResignActive(_ application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
	}

	func applicationDidEnterBackground(_ application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}

	func applicationWillEnterForeground(_ application: UIApplication) {
		// Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}

	func applicationWillTerminate(_ application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}
	
//	func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
//		return OAuth2.handleOpenURL(url, clientID: clientID, secretKey: secretKey) { (result) in
//			guard let token = result.value else {return}
//			let s = String(data: try! JSONEncoder().encode(token), encoding: .utf8)
//			print(s!)
//		}
//	}
}

