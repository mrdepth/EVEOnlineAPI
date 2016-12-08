//
//  OAuth.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 07.12.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation
import AFNetworking

public enum OAuthError: Error {
	case internalError
	case authenticationTimeout
	case invalidServerResponse
	case server(String)
	case invalidToken
	case invalidRefreshToken
}

public class OAToken: NSObject, NSSecureCoding {
	public var clientID: String
	public var secretKey: String
	public var accessToken: String?
	public var refreshToken: String?
	public var tokenType: String?
	public var expiresOn: Date?
	public var characterID: Int = 0
	public var characterName: String?
	public var realm: String?
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
	
	public init(clientID: String, secretKey: String) {
		self.clientID = clientID
		self.secretKey = secretKey
		super.init()
	}
	
	public func encode(with aCoder: NSCoder) {
		aCoder.encode(clientID, forKey:"clientID")
		aCoder.encode(secretKey, forKey:"secretKey")
		aCoder.encode(accessToken, forKey:"accessToken")
		aCoder.encode(refreshToken, forKey:"refreshToken")
		aCoder.encode(tokenType, forKey:"tokenType")
		aCoder.encode(expiresOn, forKey:"expiresOn")
		aCoder.encode(characterID, forKey: "characterID")
		aCoder.encode(characterName, forKey: "characterName")
		aCoder.encode(realm, forKey: "realm")
	}
	
	public required init?(coder aDecoder: NSCoder) {
		guard let clientID = aDecoder.decodeObject(forKey: "clientID") as? String else {return nil}
		guard let secretKey = aDecoder.decodeObject(forKey: "secretKey") as? String else {return nil}
		self.clientID = clientID
		self.secretKey = secretKey

		accessToken = aDecoder.decodeObject(forKey: "accessToken") as? String
		refreshToken = aDecoder.decodeObject(forKey: "refreshToken") as? String
		tokenType = aDecoder.decodeObject(forKey: "tokenType") as? String
		expiresOn = aDecoder.decodeObject(forKey: "expiresOn") as? Date
		characterID = aDecoder.decodeInteger(forKey: "characterID")
		characterName = aDecoder.decodeObject(forKey: "characterName") as? String
		realm = aDecoder.decodeObject(forKey: "realm") as? String
		
		super.init()
	}
	
	public static var supportsSecureCoding: Bool {
		get {
			return true
		}
	}
	
	public func refresh(completionBlock:((_ error: Error?) -> Void)?) {
		if let refreshToken = refreshToken {
			self.obtain(refreshToken: refreshToken, completionBlock: {(error) -> Void in
				completionBlock?(error)
			})
		}
		else {
			completionBlock?(OAuthError.invalidRefreshToken)
		}
	}
	
	fileprivate func obtain(authorizationCode: String, completionBlock: @escaping (Error?) -> Void) {
		self.obtain(parameters: ["grant_type": "authorization_code", "code": authorizationCode], completionBlock: completionBlock)
	}

	fileprivate func obtain(refreshToken: String, completionBlock: @escaping (Error?) -> Void) {
		self.obtain(parameters: ["grant_type": "refresh_token", "refresh_token": refreshToken], completionBlock: completionBlock)
	}

	private func obtain(parameters: [String: String], completionBlock: @escaping (Error?) -> Void) {
		let session = AFHTTPSessionManager(baseURL: URL(string:"https://login.eveonline.com")!)
		session.requestSerializer = AFJSONRequestSerializer()
		
		session.responseSerializer = AFJSONResponseSerializer()
		var acceptableStatusCodes = session.responseSerializer.acceptableStatusCodes
		acceptableStatusCodes?.insert(400)
		session.responseSerializer.acceptableStatusCodes = acceptableStatusCodes
		
		let auth = "\(clientID):\(secretKey)".data(using: .utf8)?.base64EncodedString()
		session.requestSerializer.setValue("Basic \(auth!)", forHTTPHeaderField: "Authorization")
		
		session.post("oauth/token", parameters: parameters, progress: nil, success: { (task, result) in
			do {
				if let result = result as? [String: Any] {
					if let error = result["error_description"] as? String {
						throw OAuthError.server(error)
					}
					else {
						guard let accessToken = result["access_token"] as? String else {throw OAuthError.invalidServerResponse}
						guard let refreshToken = result["refresh_token"] as? String else {throw OAuthError.invalidServerResponse}
						guard let tokenType = result["token_type"] as? String else {throw OAuthError.invalidServerResponse}
						guard let expiresIn = result["expires_in"] as? Double else {throw OAuthError.invalidServerResponse}
						let expiresOn = Date.init(timeIntervalSinceNow: expiresIn)
						
						self.accessToken = accessToken
						self.refreshToken = refreshToken
						self.tokenType = tokenType
						self.expiresOn = expiresOn
						self.verify(session: session, completionBlock: { (error) in
							if let error = error {
								completionBlock(error)
							}
							else {
								completionBlock(nil)
							}
						})
					}
				}
				else {
					throw OAuthError.invalidServerResponse
				}
			}
			catch let error {
				completionBlock(error)
			}
			
		}, failure: { (task, error) in
			completionBlock(error)
		})
	}
	
	private func verify(session: AFHTTPSessionManager, completionBlock: @escaping (Error?) -> Void) {
		guard let tokenType = self.tokenType, let accessToken = self.accessToken else {
			completionBlock(OAuthError.invalidToken)
			return
		}
		let auth = "\(tokenType) \(accessToken)"
		
		session.requestSerializer.setValue(auth, forHTTPHeaderField: "Authorization")
		
		session.get("oauth/verify", parameters: nil, progress: nil, success: { (task, result) -> Void in
			do {
				if let result = result as? [String: Any] {
					if let error = result["error_description"] as? String {
						throw OAuthError.server(error)
					}
					else {
						guard let characterID = result["CharacterID"] as? Int else {throw OAuthError.invalidServerResponse}
						guard let characterName = result["CharacterName"] as? String else {throw OAuthError.invalidServerResponse}
						
						if let expiresOn = result["ExpiresOn"] as? String, let date = DateFormatter.crestDateFormatter.date(from: expiresOn) {
							self.expiresOn = date
						}
						
						self.characterID = characterID
						self.characterName = characterName
						completionBlock(nil)
					}
				}
				else {
					throw OAuthError.invalidServerResponse
				}
			}
			catch let error {
				self.expiresOn = nil
				completionBlock(error)
			}
		}, failure: { (task, error) -> Void in
			self.expiresOn = nil
			completionBlock(error)
		})
	}
}


public class OAuth: NSObject {
	
	@nonobjc private static var states: NSMapTable<NSString, OAuth> = NSMapTable<NSString, OAuth>.strongToWeakObjects()
	
	public let clientID: String
	public let secretKey: String
	public let callbackURL: URL
	public let scope: [String]
	public let realm: String?
	public let state: String = UUID().uuidString
	
	init (clientID: String, secretKey: String, callbackURL: URL, scope: [String], realm: String?) {
		self.clientID = clientID
		self.secretKey = secretKey
		self.callbackURL = callbackURL
		self.scope = scope
		self.realm = realm
		super.init()
		OAuth.states.setObject(self, forKey: self.state as NSString)
	}
	
	deinit {
		OAuth.states.removeObject(forKey: self.state as NSString)
	}
	
	public class func handleOpenURL(_ url: URL) -> Bool {
		guard let components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {return false}
		guard let query = components.queryItems else {return false}
		var code: String?
		var state: String?
		
		for item in query {
			if item.name == "code" {
				code = item.value
			}
			else if item.name == "state" {
				state = item.value
			}
		}
		
		if let code = code, let state = state, let oauth = OAuth.states.object(forKey: state as NSString) {
			let token = OAToken(clientID: oauth.clientID, secretKey: oauth.secretKey)
			token.obtain(authorizationCode: code, completionBlock: { (error) in
				if let error = error {
					oauth.completionBlock?(nil, error)
				}
				else {
					oauth.completionBlock?(token, nil)
				}
			})
			return true
		}
		else {
			return false
		}
	}

	private var completionBlock:((_ token: OAToken?, _ error: Error?) -> Void)?
	
	public func authenticate(completionBlock:((_ token: OAToken?, _ error: Error?) -> Void)?) {
		var parameters = [String: String]()
		
		let callback = callbackURL.absoluteString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
		var query = [URLQueryItem] ()
		query.append(URLQueryItem(name: "response_type", value: "code"))
		query.append(URLQueryItem(name: "redirect_uri", value: callback))
		query.append(URLQueryItem(name: "client_id", value: clientID))
		query.append(URLQueryItem(name: "scope", value: scope.joined(separator: "+").addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)))
		query.append(URLQueryItem(name: "state", value: state))
		if let realm = realm {
			query.append(URLQueryItem(name: "realm", value: realm))
		}
			
		var components = URLComponents(string: "https://login.eveonline.com/oauth/authorize/")!
		components.queryItems = query
		if let url = components.url {
			self.completionBlock = completionBlock
			UIApplication.shared.openURL(url)
		}
	}
}
