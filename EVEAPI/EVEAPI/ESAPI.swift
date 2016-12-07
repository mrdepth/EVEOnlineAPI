//
//  ESAPI.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 07.12.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation

import Foundation
import AFNetworking

public enum ESAPIError: Error {
	case Internal
	case InvalidResponse
	case Unauthorized(String?)
	case Server(String?, String?)
}

public struct ESScope {
	public static let assetsRead = ESScope("esi-assets.read_assets.v1")
	public static let characterFittingsWrite = ESScope("characterFittingsWrite")
	public static let characterKillsRead = ESScope("characterKillsRead")
	
	let rawValue: String
	
	init(_ value: String) {
		rawValue = value
	}
	
	public static var all: [ESScope]  {
		get {
			return [.assetsRead]
		}
	}
}

public class ESAPI: NSObject {
	
	public let cachePolicy: URLRequest.CachePolicy
	public let token: OAToken?
	
	public lazy var sessionManager: EVEHTTPSessionManager = {
		let manager = EVEHTTPSessionManager(baseURL: URL(string: "https://esi.tech.ccp.is")!, sessionConfiguration: nil)
		manager.responseSerializer = AFJSONResponseSerializer()
		manager.requestSerializer = AFHTTPRequestSerializer()
		manager.requestSerializer.cachePolicy = self.cachePolicy
		if let token = self.token {
			manager.requestSerializer.setValue("\(token.tokenType!) \(token.accessToken!)", forHTTPHeaderField: "Authorization")
		}
		return manager
	}()
	
	public init(token: OAToken?, cachePolicy: URLRequest.CachePolicy) {
		if token?.tokenType != nil && token?.accessToken != nil {
			self.token = token
		}
		else {
			self.token = nil
		}
		self.cachePolicy = cachePolicy
		super.init()
	}
	
	public class func oauth(clientID: String, secretKey: String, callbackURL: URL, scope: [ESScope]) -> OAuth {
		let scope = scope.map {$0.rawValue}
		return OAuth(clientID: clientID, secretKey: secretKey, callbackURL: callbackURL, scope: scope, realm: "ESI")
	}
	
	public func character(completionBlock:((CRFittingCollection?, Error?) -> Void)?) {
		if let token = token {
			get("characters/\(token.characterID)/assets/", parameters: nil, completionBlock: completionBlock)
		}
		else {
			completionBlock?(nil, CRAPIError.Unauthorized(nil))
		}
		//get("CalendarEventAttendees", scope: "Char", parameters: nil, completionBlock: completionBlock)
	}
	
	
	//MARK: Private
	
	private func validate<T:CRResult>(result: Any?) throws -> T {
		if let result = result as? [String: Any] {
			if let exceptionType = result["exceptionType"] as? String {
				let message = result["message"] as? String
				switch exceptionType {
				case "UnauthorizedError":
					throw CRAPIError.Unauthorized(message)
				default:
					throw CRAPIError.Server(exceptionType, message)
				}
			}
			else if let obj = T.init(dictionary:result) {
				return obj
			}
			else {
				throw CRAPIError.InvalidResponse
			}
		}
		else {
			throw CRAPIError.Internal
		}
	}
	
	private func get<T:CRResult>(_ path: String, parameters: [String:Any]?, completionBlock: ((T?, Error?) -> Void)?) -> Void {
		let path = "/latest/" + path
		var parameters = parameters ?? [:]
		parameters["datasource"] = "tranquility"

		let contentType = "\(T.contentType); charset=utf-8"
		self.sessionManager.requestSerializer.setValue(contentType, forHTTPHeaderField: "Accept")
		self.sessionManager.responseSerializer.acceptableContentTypes = nil
		
		
		self.sessionManager.get(path, parameters: parameters, responseSerializer: nil, completionBlock: {(result, error) -> Void in
			if let error = error {
				completionBlock?(nil, error)
			}
			else {
				do {
					let obj: T = try self.validate(result: result)
					completionBlock?(obj, nil)
				}
				catch CRAPIError.Unauthorized(let message) {
					if let token = self.token {
						token.refresh(completionBlock: { (error) in
							if let error = error {
								completionBlock?(nil, error)
							}
							else {
								self.sessionManager.requestSerializer.setValue("\(token.tokenType!) \(token.accessToken!)", forHTTPHeaderField: "Authorization")
								self.sessionManager.requestSerializer.setValue(contentType, forHTTPHeaderField: "Accept")
								self.sessionManager.responseSerializer.acceptableContentTypes = Set([T.contentType])
								self.sessionManager.get(path, parameters: parameters, responseSerializer: nil, completionBlock: {(result, error) -> Void in
									if let error = error {
										completionBlock?(nil, error)
									}
									else {
										do {
											let obj: T = try self.validate(result: result)
											completionBlock?(obj, nil)
										}
										catch let error {
											completionBlock?(nil, error)
										}
									}
								})
							}
						})
					}
					else {
						completionBlock?(nil, CRAPIError.Unauthorized(message))
					}
				}
				catch let error {
					completionBlock?(nil, error ?? CRAPIError.Internal)
				}
			}
		})
	}
}
