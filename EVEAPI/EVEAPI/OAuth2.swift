//
//  OAuth.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 07.12.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation
import AFNetworking
import Alamofire

public enum OAuth2Error: Error {
	case invalidServerResponse(response: Any)
	case server(message: String)
}

public class OAuth2Token: NSObject, NSSecureCoding {
	public var accessToken: String
	public var refreshToken: String
	public var tokenType: String
	public var expiresOn: Date?
	public let characterID: Int64
	public let characterName: String
	public let realm: String
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
	
	public init(accessToken: String, refreshToken: String, tokenType: String, characterID: Int64, characterName: String, realm: String) {
		self.accessToken = accessToken
		self.refreshToken = refreshToken
		self.tokenType = tokenType
		self.characterID = characterID
		self.characterName = characterName
		self.realm = realm
		super.init()
	}
	
	public func encode(with aCoder: NSCoder) {
		aCoder.encode(accessToken, forKey:"accessToken")
		aCoder.encode(refreshToken, forKey:"refreshToken")
		aCoder.encode(tokenType, forKey:"tokenType")
		aCoder.encode(expiresOn, forKey:"expiresOn")
		aCoder.encode(characterID, forKey: "characterID")
		aCoder.encode(characterName, forKey: "characterName")
		aCoder.encode(realm, forKey: "realm")
	}
	
	public required init?(coder aDecoder: NSCoder) {
		guard let accessToken = aDecoder.decodeObject(forKey: "accessToken") as? String else {return nil}
		guard let refreshToken = aDecoder.decodeObject(forKey: "refreshToken") as? String else {return nil}
		guard let tokenType = aDecoder.decodeObject(forKey: "tokenType") as? String else {return nil}
		expiresOn = aDecoder.decodeObject(forKey: "expiresOn") as? Date
		characterID = aDecoder.decodeInt64(forKey: "characterID")
		guard let characterName = aDecoder.decodeObject(forKey: "characterName") as? String else {return nil}
		guard let realm = aDecoder.decodeObject(forKey: "realm") as? String else {return nil}
		
		self.accessToken = accessToken
		self.refreshToken = refreshToken
		self.tokenType = tokenType
		self.characterName = characterName
		self.realm = realm
		super.init()
	}
	
	public static var supportsSecureCoding: Bool {
		get {
			return true
		}
	}
	
}

/*
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
*/

public class OAuth2Handler: RequestAdapter, RequestRetrier {
	
	public class func handleOpenURL(_ url: URL, clientID: String, secretKey: String, completionHandler: @escaping (_ result: Result<OAuth2Token>) -> Void) -> Bool {
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
		
		if let code = code, let state = state {
			let auth = "\(clientID):\(secretKey)".data(using: .utf8)?.base64EncodedString()

			Alamofire.request("https://login.eveonline.com/oauth/token",
			                  method: .post,
			                  parameters:["grant_type": "authorization_code", "code": code],
			                  headers:["Authorization":"Basic \(auth!)"]).validate().responseOAuth2 {response in
								switch(response.result) {
								case let .success(value):
									do {
										guard let result = value as? [String: Any] else {throw OAuth2Error.invalidServerResponse(response: response)}
										guard let accessToken = result["access_token"] as? String else {throw OAuth2Error.invalidServerResponse(response: response)}
										guard let refreshToken = result["refresh_token"] as? String else {throw OAuth2Error.invalidServerResponse(response: response)}
										guard let tokenType = result["token_type"] as? String else {throw OAuth2Error.invalidServerResponse(response: response)}
										guard let expiresIn = result["expires_in"] as? Double else {throw OAuth2Error.invalidServerResponse(response: response)}
										let expiresOn = Date.init(timeIntervalSinceNow: expiresIn)
										Alamofire.request("https://login.eveonline.com/oauth/verify", headers: ["Authorization":"\(tokenType) \(accessToken)"]).validate().responseOAuth2 {response in
											switch(response.result) {
											case let .success(value):
												do {
													guard let result = value as? [String: Any] else {throw OAuth2Error.invalidServerResponse(response: response)}
													guard let characterID = result["CharacterID"] as? Int64 else {throw OAuth2Error.invalidServerResponse(response: response)}
													guard let characterName = result["CharacterName"] as? String else {throw OAuth2Error.invalidServerResponse(response: response)}
													
													let token = OAuth2Token(accessToken: accessToken, refreshToken: refreshToken, tokenType: tokenType, characterID: characterID, characterName: characterName, realm: state)
													
													if let expiresOn = result["ExpiresOn"] as? String, let date = DateFormatter.crestDateFormatter.date(from: expiresOn) {
														token.expiresOn = date
													}
													else {
														token.expiresOn = expiresOn
													}
													
													completionHandler(.success(token))
												}
												catch {
													completionHandler(.failure(error))
												}
												break
											case let .failure(err):
												completionHandler(.failure(err))
												break
											}
										}
									}
									catch {
										completionHandler(.failure(error))
									}
									break
								case let .failure(err):
									completionHandler(.failure(err))
									break
								}
			}
			return true
		}
		else {
			return false
		}
	}
	
	public let token: OAuth2Token
	public let clientID: String
	public let secretKey: String
	
	public init(token: OAuth2Token, clientID: String, secretKey: String) {
		self.token = token
		self.clientID = clientID
		self.secretKey = secretKey
	}
	
	public func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
		var request = urlRequest
		request.addValue("\(token.tokenType) \(token.accessToken)", forHTTPHeaderField: "Authorization")
		return request
	}

	private var isRefreshing = false
	private var requestsToRetry: [RequestRetryCompletion] = []

	public func should(_ manager: SessionManager, retry request: Request, with error: Error, completion: @escaping RequestRetryCompletion) {
		synchronized(self) {
			if let response = request.task?.response as? HTTPURLResponse, response.statusCode == 403 {
				requestsToRetry.append(completion)
				
				if !isRefreshing {
					refreshToken { [weak self] error in
						guard let strongSelf = self else { return }
						
						synchronized(strongSelf) {
							let succeeded = error == nil
							strongSelf.requestsToRetry.forEach { $0(succeeded, 0.0) }
							strongSelf.requestsToRetry.removeAll()
						}
					}
				}
			} else {
				completion(false, 0.0)
			}
		}
	}
	
	public func refreshToken(completion: @escaping (Error?) -> Void) {
		guard !isRefreshing else {return}
		isRefreshing = true
		let auth = "\(clientID):\(secretKey)".data(using: .utf8)?.base64EncodedString()
		Alamofire.request("https://login.eveonline.com/oauth/token",
		                  method: .post,
		                  parameters:["grant_type": "refresh_token", "refresh_token": token.refreshToken],
		                  headers:["Authorization":"Basic \(auth!)"]).validate().responseOAuth2 {[weak self] response in
							guard let strongSelf = self else { return }

							switch(response.result) {
							case let .success(value):
								do {

									guard let result = value as? [String: Any] else {throw OAuth2Error.invalidServerResponse(response: response)}
									guard let accessToken = result["access_token"] as? String else {throw OAuth2Error.invalidServerResponse(response: response)}
									guard let refreshToken = result["refresh_token"] as? String else {throw OAuth2Error.invalidServerResponse(response: response)}
									guard let tokenType = result["token_type"] as? String else {throw OAuth2Error.invalidServerResponse(response: response)}
									guard let expiresIn = result["expires_in"] as? Double else {throw OAuth2Error.invalidServerResponse(response: response)}
									let expiresOn = Date.init(timeIntervalSinceNow: expiresIn)
									let token = strongSelf.token
									token.accessToken = accessToken
									token.refreshToken = refreshToken
									token.tokenType = tokenType
									token.expiresOn = expiresOn
									completion(nil)
								}
								catch {
									completion(error)
								}
							case let .failure(error):
								completion(error)
							}
							synchronized(strongSelf) {
								strongSelf.isRefreshing = false
							}
		}
	}
}

extension DataRequest {
	static func oauth2ResponseSerializer() -> DataResponseSerializer<Any> {
		return DataResponseSerializer { request, response, data, error in
			switch jsonResponseSerializer().serializeResponse(request, response, data, error) {
			case let .success(value):
				guard let result = value as? [String: Any] else {return .success(value)}
				if let errorDescription = result["error_description"] as? String {
					return .failure(OAuth2Error.server(message: errorDescription))
				}
				
				return .success(value)
			case let .failure(error):
				return .failure(error)
			}
			guard error == nil else {return .failure(error!)}
			return Request.serializeResponseJSON(options: .allowFragments, response: response, data: data, error: error)
		}
	}
	
	@discardableResult
	public func responseOAuth2(
		queue: DispatchQueue? = nil,
		options: JSONSerialization.ReadingOptions = .allowFragments,
		completionHandler: @escaping (DataResponse<Any>) -> Void)
		-> Self
	{
		return response(
			queue: queue,
			responseSerializer: DataRequest.oauth2ResponseSerializer(),
			completionHandler: completionHandler
		)
	}

}
