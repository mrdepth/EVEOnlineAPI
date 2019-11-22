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
    var c4: AnyCancellable?
    var esi = ESI()
    
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let s = Deferred{CurrentValueSubject<String, Never>("sdf").handleEvents(receiveCancel: {
            print("cancel")
        })}
        
        s.sink {
            print($0)
        }
        
        
        c4 = esi.characters.characterID(1554561480).get().flatMap { character in
            CurrentValueSubject(character).combineLatest(self.esi.corporations.corporationID(character.corporationID).get())
        }.sink(receiveCompletion: {c in
            print(c)
        }, receiveValue: { (a, b) in
            print(a, b)
        })
        
        
        
        var r = AF.request("http://worldclockapi.com/api/json/est/now")
        print(r.isResumed)
//        r = r.responseString { result in
//            print(result)
//        }
        print(r.isResumed)
        
        /*let p = URLSession.shared.dataTaskPublisher(for: URL(string: "http://worldclockapi.com/api/json/est/now")!)
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
        c3 = session.publisher("http://worldclockapi.com/api/json/est/now").responseDecodable(of: Time.self)
            .sink(receiveCompletion: { (c) in
                print(c)
            }) { (d) in
                print(d)
            }
//        let r = session.request("http://google.com").validate().stringPublisher().catch{_ in Just("")}.sink { result in
//            print(result)
//        }
//        c = r*/
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

