//
//  CRAPI.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 06.12.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation
import AFNetworking

public class CRToken: NSObject, NSSecureCoding {
	public var accessToken: String = ""
	public var refreshToken: String = ""
	public var tokenType: String = ""
	public var expiresOn: Date?
	public var characterID: Int = 0
	public var characterName: String = ""
	public var expired: Bool {
		get {
			if let expiresOn = expiresOn {
				return expiresOn <= Date()
			}
			else {
				return true
			}
		}
	}
	
	public init() {
		super.init()
	}
	
	public func encode(with aCoder: NSCoder) {
		aCoder.encode(accessToken, forKey:"accessToken")
		aCoder.encode(refreshToken, forKey:"refreshToken")
		aCoder.encode(tokenType, forKey:"tokenType")
		aCoder.encode(expiresOn, forKey:"expiresOn")
		aCoder.encode(characterID, forKey: "characterID")
		aCoder.encode(characterName, forKey: "characterName")
	}
	
	public required init?(coder aDecoder: NSCoder) {
		guard let accessToken = aDecoder.decodeObject(forKey: "accessToken") as? String else {return nil}
		guard let refreshToken = aDecoder.decodeObject(forKey: "refreshToken") as? String else {return nil}
		guard let tokenType = aDecoder.decodeObject(forKey: "tokenType") as? String else {return nil}
		guard let expiresOn = aDecoder.decodeObject(forKey: "expiresOn") as? Date else {return nil}
		characterID = aDecoder.decodeInteger(forKey: "characterID")
		guard let characterName = aDecoder.decodeObject(forKey: "characterName") as? String else {return nil}
		
		self.accessToken = accessToken
		self.refreshToken = refreshToken
		self.tokenType = tokenType
		self.expiresOn = expiresOn
		self.characterName = characterName
		super.init()
	}
	
	public static var supportsSecureCoding: Bool {
		get {
			return true
		}
	}
}

public struct CRAPIScope {
	public static let characterFittingsRead = CRAPIScope("characterFittingsRead")
	public static let characterFittingsWrite = CRAPIScope("characterFittingsWrite")
	public static let characterKillsRead = CRAPIScope("characterKillsRead")
	
	let rawValue: String
	
	init(_ value: String) {
		rawValue = value
	}
	
	public static var all: [CRAPIScope]  {
		get {
			return [CRAPIScope.characterFittingsRead]
		}
	}
}

private struct CRState {
	let clientID: String
	let secretKey: String
	let uuid: String
	let completionBlock: ((_ token: CRToken?, _ error: Error?) -> Void)?
}

public class CRAPI: NSObject {
	public enum CRAPIError: Error {
		case Internal
		case AuthenticationTimeout
		case InvalidServerResponse
		case Server(String)
	}
	
	public lazy var sessionManager: EVEHTTPSessionManager = {
		let manager = EVEHTTPSessionManager(baseURL: URL(string: "https://crest-tq.eveonline.com")!, sessionConfiguration: nil)
		return manager
	}()
	
	public let clientID: String?
	public let secretKey: String?
	public let token: CRToken?
	public let callbackURL: URL?
	public let cachePolicy: URLRequest.CachePolicy
	
	public init(clientID: String, secretKey: String, token: CRToken?, callbackURL: URL, cachePolicy: URLRequest.CachePolicy) {
		self.clientID = clientID
		self.secretKey = secretKey
		self.token = token
		self.callbackURL = callbackURL
		self.cachePolicy = cachePolicy
		super.init()
	}
	
	private static var state: CRState?
	
	public class func authenticate(clientID: String, secretKey: String, callbackURL: URL, scope: [CRAPIScope], completionBlock:((_ token: CRToken?, _ error: Error?) -> Void)?) {
		let scope = scope.map {$0.rawValue}.joined(separator: ",")
		
		if let currentState = state, let completionBlock = currentState.completionBlock {
			completionBlock(nil, CRAPIError.AuthenticationTimeout)
		}
		
		let currentState = CRState(clientID: clientID, secretKey: secretKey, uuid: UUID().uuidString, completionBlock: completionBlock)
		let callback = callbackURL.absoluteString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
		if let url = URL(string:"https://login-tq.eveonline.com/oauth/authorize/?response_type=code&redirect_uri=\(callback!)&client_id=\(clientID)&scope=\(scope)&state=\(currentState.uuid)") {
			state = currentState
			UIApplication.shared.open(url, options: [:], completionHandler: nil)
			let center = NotificationCenter.default
			var observer: NSObjectProtocol?
			observer = center.addObserver(forName: NSNotification.Name.UIApplicationDidBecomeActive, object: nil, queue: OperationQueue.main, using: { (note) in
				center.removeObserver(observer)
			})
		}
		else {
			completionBlock?(nil, CRAPIError.Internal)
		}
	}
	
	public class func handleOpenURL(_ url: URL) -> Bool {
		guard let components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {return false}
		guard let query = components.queryItems else {return false}
		var code: String?
		var uuid: String?
		
		for item in query {
			if item.name == "code" {
				code = item.value
			}
			else if item.name == "state" {
				uuid = item.value
			}
		}
		
		if let code = code, let uuid = uuid, let state = state, state.uuid == uuid {
			CRAPI.state = nil
			
			let session = AFHTTPSessionManager(baseURL: URL(string:"https://login-tq.eveonline.com"))

			let auth = "\(state.clientID):\(state.secretKey)".data(using: .utf8)?.base64EncodedString()
			session.requestSerializer = AFJSONRequestSerializer()
			session.requestSerializer.setValue("Basic \(auth!)", forHTTPHeaderField: "Authorization")
			
			session.responseSerializer = AFJSONResponseSerializer()
			var acceptableStatusCodes = session.responseSerializer.acceptableStatusCodes
			acceptableStatusCodes?.insert(400)
			session.responseSerializer.acceptableStatusCodes = acceptableStatusCodes
			
			session.post("oauth/token", parameters: ["grant_type": "authorization_code", "code": code], progress: nil, success: { (task, result) in
				do {
					if let result = result as? [String: Any] {
						if let error = result["error_description"] as? String {
							throw CRAPIError.Server(error)
						}
						else {
							guard let accessToken = result["access_token"] as? String else {throw CRAPIError.InvalidServerResponse}
							guard let refreshToken = result["refresh_token"] as? String else {throw CRAPIError.InvalidServerResponse}
							guard let tokenType = result["token_type"] as? String else {throw CRAPIError.InvalidServerResponse}
							guard let expiresIn = result["expires_in"] as? Double else {throw CRAPIError.InvalidServerResponse}
							let expiresOn = Date.init(timeIntervalSinceNow: expiresIn)
							
							let token = CRToken()
							token.accessToken = accessToken
							token.refreshToken = refreshToken
							token.tokenType = tokenType
							token.expiresOn = expiresOn
							verify
						}
					}
					else {
						throw CRAPIError.InvalidServerResponse
					}
				}
				catch let error {
					state.completionBlock?(nil, error)
				}
				
			}, failure: { (task, error) in
				state.completionBlock?(nil, error)
			})
			
			return true
		}
		else {
			return false
		}
	}
}
