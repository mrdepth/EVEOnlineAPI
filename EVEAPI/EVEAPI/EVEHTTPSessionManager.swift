//
//  EVEHTTPSessionManager.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 26.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit
import AFNetworking

public enum EVEHTTPSessionManagerError: Error {
	case InternalError
}

public class EVEHTTPSessionManager: AFHTTPSessionManager {
	enum Result {
		case Success(Any)
		case Fail(Error)
	}
	
	struct ResultHolder {
		var result: Result?
	}

	public override init(baseURL url: URL?, sessionConfiguration configuration: URLSessionConfiguration?) {
		super.init(baseURL:url, sessionConfiguration:configuration);
		self.responseSerializer = AFHTTPResponseSerializer()
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	public func get(_ URLString: String, parameters: [String:Any]?, responseSerializer:AFHTTPResponseSerializer?, completionBlock: ((Any?, Error?) -> Void)?) -> Void {
		dataTask(HTTPMethod: "GET", URLString: URLString, parameters: parameters, responseSerializer: responseSerializer, completionBlock: completionBlock)
	}
	public func post(_ URLString: String, parameters: [String:Any]?, responseSerializer:AFHTTPResponseSerializer?, completionBlock: ((Any?, Error?) -> Void)?) -> Void {
		dataTask(HTTPMethod: "POST", URLString: URLString, parameters: parameters, responseSerializer: responseSerializer, completionBlock: completionBlock)
	}
	public func delete(_ URLString: String, parameters: [String:Any]?, responseSerializer:AFHTTPResponseSerializer?, completionBlock:((Any?, Error?) -> Void)?) -> Void {
		dataTask(HTTPMethod: "DELETE", URLString: URLString, parameters: parameters, responseSerializer: responseSerializer, completionBlock: completionBlock)
		
	}
	
	lazy private var dispatchGroups = [Int:DispatchGroup]()
	lazy private var progresses = [Int:[Progress]]()
	lazy private var dateFormatter = DateFormatter.rfc822DateFormatter()
	lazy private var results = [Int:ResultHolder]()
	
	public func dataTask(HTTPMethod method: String, URLString: String, parameters: [String:Any]?, responseSerializer:AFHTTPResponseSerializer?, completionBlock: ((Any?, Error?) -> Void)?) -> Void {
		let key = ["method": method, "url": URLString, "headers": self.requestSerializer.httpRequestHeaders, "parameters": parameters ?? [:]].hashValue
		
		var dispatchGroup: DispatchGroup!
		var load = false
		var result: ResultHolder!
		
		synchronized(self) {
			if progresses[key]?.append(Progress(totalUnitCount: 100)) == nil {
				progresses[key] = [Progress(totalUnitCount: 100)]
			}

			if let dg = dispatchGroups[key] {
				dispatchGroup = dg
			}
			else {
				load = true
				dispatchGroup = DispatchGroup();
				dispatchGroup.enter()
				dispatchGroups[key] = dispatchGroup;
			}
			if let res = results[key] {
				result = res;
			}
			else {
				result = ResultHolder(result:nil)
				results[key] = result
			}
		}
		
		if let block = completionBlock {
			dispatchGroup.notify(queue: DispatchQueue.main, execute: {
				if let res = result.result {
					switch res {
					case let .Success(object):
						block(object, nil)
					case let .Fail(error):
						block(nil, error)
					}
				}
				else {
					block(nil, EVEHTTPSessionManagerError.InternalError)
				}
			})
		}
		
		if load {
			if let rs = responseSerializer {
				self.responseSerializer.acceptableStatusCodes = rs.acceptableStatusCodes
			}
			
			let failure = {(task:URLSessionDataTask?, error:Error) in
				result.result = Result.Fail(error)
				dispatchGroup.leave()
				synchronized(self) {
					self.dispatchGroups[key] = nil
					self.progresses[key] = nil
					self.results[key] = nil
				}
			}
			
			let progress = {(progress:Progress) -> Void in
				synchronized(self) {
					if let array = self.progresses[key] {
						for p in array {
							p.completedUnitCount = Int64(Int(progress.fractionCompleted * 100.0))
						}
					}
				}
			}
			
			let success = {(task: URLSessionDataTask, responseObject: Any?) -> Void in
				var object = responseObject
				var error:NSError?
				
				defer {
					if error != nil {
						result.result = Result.Fail(error!)
					}
					else if object != nil {
						result.result = Result.Success(object!)
					}
					else {
						result.result = Result.Fail(EVEHTTPSessionManagerError.InternalError)
					}

					synchronized(self) {
						if let array = self.progresses[key] {
							for p in array {
								p.completedUnitCount = 100
							}
						}

						self.dispatchGroups[key] = nil
						self.progresses[key] = nil
					}
					dispatchGroup.leave()
				}
				
				guard let data = responseObject as? Data else {return}
				if let rs = responseSerializer {
					object = rs.responseObject(for: task.response, data: data, error: &error)
				}

				guard let cachedContent = object as? EVEHTTPCachedContent else {return}
				guard let response = task.response as? HTTPURLResponse else {return}
				guard var headers = response.allHeaderFields as? [String:String] else {return}
				guard let md5 = task.currentRequest?.url?.absoluteString.md5 else {return}
				
				if let etag = headers["Etag"],
					etag == md5,
					let cacheDate = headers["X-Cache-Date"],
					let date = self.dateFormatter.date(from: cacheDate) {
					cachedContent.cacheDate = date
				}
				else {
					cachedContent.cacheDate = Date()
					guard let currentTime = cachedContent.currentTime else {return}
					guard let cachedUntil = cachedContent.cachedUntil else {return}
					guard let cacheDate = cachedContent.cacheDate else {return}
					headers["Date"] = self.dateFormatter.string(from: currentTime)
					headers["Expires"] = self.dateFormatter.string(from: cachedUntil)
					headers["X-Cache-Date"] = self.dateFormatter.string(from: cacheDate)
					headers["Etag"] = md5
					let newResponse = HTTPURLResponse(url: response.url!, statusCode: response.statusCode, httpVersion: "HTTP/1.1", headerFields: headers)!
					let cachedResponse = CachedURLResponse(response: newResponse, data: data, userInfo: nil, storagePolicy: .allowed)
					URLCache.shared.storeCachedResponse(cachedResponse, for: task)
				}
			}
			
			switch method {
			case "GET":
				get(URLString, parameters: parameters, progress: progress, success: success, failure: failure)
			case "POST":
				post(URLString, parameters: parameters, progress: progress, success: success, failure: failure)
			case "DELETE":
				delete(URLString, parameters: parameters, success: success, failure: failure)
			default:
				break
			}
		}
		
	}
}
