//
//  OAuth2.swift
//  ESI
//
//  Created by Artem Shimanski on 09.04.17.
//  Copyright © 2017 Artem Shimanski. All rights reserved.
//

import Foundation
import Alamofire

fileprivate let OAuthBaseURL: String = "https://login.eveonline.com/oauth/"

public enum OAuth2Error: Error {
	case invalidServerResponse(response: Any)
	case server(message: String)
	case tokenExpired
}

public extension Notification.Name {
	public static let OAuth2TokenDidRefresh = Notification.Name(rawValue: "OAuth2TokenDidRefresh")
}

fileprivate struct Token: Decodable {
	var accessToken: String
	var refreshToken: String
	var tokenType: String
	var expiresIn: Double
	
	enum CodingKeys: String, CodingKey {
		case accessToken = "access_token"
		case refreshToken = "refresh_token"
		case tokenType = "token_type"
		case expiresIn = "expires_in"
	}
}

fileprivate struct TokenVerify: Decodable {
	var characterID: Int64
	var characterName: String
	var scopes: [String]
	var expiresOn: Date?
	
	enum CodingKeys: String, CodingKey {
		case characterID = "CharacterID"
		case characterName = "CharacterName"
		case scopes = "Scopes"
		case expiresOn = "ExpiresOn"
	}
	
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		characterID = try container.decode(Int64.self, forKey: .characterID)
		characterName = try container.decode(String.self, forKey: .characterName)
		scopes = try container.decode(String.self, forKey: .scopes).components(separatedBy: .whitespaces)
		try? expiresOn = OAuth2Retrier.dateFormatter.date(from: container.decode(String.self, forKey: .expiresOn))
	}
}

public class OAuth2Token: NSObject, NSSecureCoding {
	public var accessToken: String
	public var refreshToken: String
	public var tokenType: String
	public var expiresOn: Date?
	public let characterID: Int64
	public let characterName: String
	public let realm: String
	public let scopes: [String]
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
	
	public init(accessToken: String, refreshToken: String, tokenType: String, scopes: [String], characterID: Int64, characterName: String, realm: String) {
		self.accessToken = accessToken
		self.refreshToken = refreshToken
		self.tokenType = tokenType
		self.scopes = scopes
		self.characterID = characterID
		self.characterName = characterName
		self.realm = realm
		super.init()
	}
	
	public func encode(with aCoder: NSCoder) {
		aCoder.encode(accessToken, forKey:"accessToken")
		aCoder.encode(refreshToken, forKey:"refreshToken")
		aCoder.encode(tokenType, forKey:"tokenType")
		aCoder.encode(scopes, forKey:"scopes")
		aCoder.encode(expiresOn, forKey:"expiresOn")
		aCoder.encode(characterID, forKey: "characterID")
		aCoder.encode(characterName, forKey: "characterName")
		aCoder.encode(realm, forKey: "realm")
	}
	
	public required init?(coder aDecoder: NSCoder) {
		guard let accessToken = aDecoder.decodeObject(forKey: "accessToken") as? String else {return nil}
		guard let refreshToken = aDecoder.decodeObject(forKey: "refreshToken") as? String else {return nil}
		guard let tokenType = aDecoder.decodeObject(forKey: "tokenType") as? String else {return nil}
		guard let scopes = aDecoder.decodeObject(forKey: "scopes") as? [String] else {return nil}
		expiresOn = aDecoder.decodeObject(forKey: "expiresOn") as? Date
		characterID = aDecoder.decodeInt64(forKey: "characterID")
		guard let characterName = aDecoder.decodeObject(forKey: "characterName") as? String else {return nil}
		guard let realm = aDecoder.decodeObject(forKey: "realm") as? String else {return nil}
		
		self.accessToken = accessToken
		self.refreshToken = refreshToken
		self.tokenType = tokenType
		self.scopes = scopes
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

public class OAuth2Adapter: RequestAdapter {
	public let token: OAuth2Token
	
	public init(token: OAuth2Token) {
		self.token = token
	}
	
	public func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
		var request = urlRequest
		request.addValue("\(token.tokenType) \(token.accessToken)", forHTTPHeaderField: "Authorization")
		return request
	}
}

public class OAuth2 {
	public class func authURL(clientID: String, callbackURL: URL, scope: [ESI.Scope], state: String) -> URL {
		var query = [URLQueryItem] ()
		let callback = callbackURL.absoluteString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
		
		query.append(URLQueryItem(name: "response_type", value: "code"))
		query.append(URLQueryItem(name: "redirect_uri", value: callback))
		query.append(URLQueryItem(name: "client_id", value: clientID))
		query.append(URLQueryItem(name: "scope", value: scope.map{$0.rawValue}.joined(separator: "+")))
		query.append(URLQueryItem(name: "state", value: state))
		query.append(URLQueryItem(name: "realm", value: state))
		
		var components = URLComponents(string: OAuthBaseURL + "authorize/")!
		components.queryItems = query
		return components.url!
	}
	
	
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
			
			Alamofire.request(OAuthBaseURL + "token",
			                  method: .post,
			                  parameters:["grant_type": "authorization_code", "code": code],
							  headers:["Authorization":"Basic \(auth!)"]).validateOAuth2().responseJSONDecodable { (response: DataResponse<Token>) in
								switch(response.result) {
								case let .success(token):
									let date = Date(timeIntervalSinceNow: token.expiresIn)
									Alamofire.request(OAuthBaseURL + "verify", headers: ["Authorization":"\(token.tokenType) \(token.accessToken)"]).validateOAuth2().responseJSONDecodable { (response: DataResponse<TokenVerify>) in
										switch(response.result) {
										case let .success(verify):
											let oauth2Token = OAuth2Token(accessToken: token.accessToken, refreshToken: token.refreshToken, tokenType: token.tokenType, scopes: verify.scopes, characterID: verify.characterID, characterName: verify.characterName, realm: state)
											oauth2Token.expiresOn = verify.expiresOn ?? date
											completionHandler(.success(oauth2Token))
										case let .failure(error):
											completionHandler(.failure(error))
										}
									}
								case let .failure(error):
									completionHandler(.failure(error))
								}
			}
			return true
		}
		else {
			return false
		}
	}
}

public class OAuth2Retrier: RequestRetrier {
	
	static let dateFormatter: DateFormatter = {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSZ"
		dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
		dateFormatter.locale = Locale(identifier: "en_US_POSIX")
		return dateFormatter
	}()
	
	public let token: OAuth2Token
	public let clientID: String
	public let secretKey: String
	
	public init(token: OAuth2Token, clientID: String, secretKey: String) {
		self.token = token
		self.clientID = clientID
		self.secretKey = secretKey
	}
	
	private var isRefreshing = false
	private var requestsToRetry: [RequestRetryCompletion] = []
	private let lock = NSLock()
	
	public func should(_ manager: SessionManager, retry request: Request, with error: Error, completion: @escaping RequestRetryCompletion) {
		lock.lock(); defer {lock.unlock()}
		
		let shouldRefresh: Bool
		if case OAuth2Error.tokenExpired = error, request.retryCount == 0 {
			shouldRefresh = true
		}
		else {
			shouldRefresh = false
		}
		if shouldRefresh {
			requestsToRetry.append(completion)
			
			if !isRefreshing {
				refreshToken { [weak self] error in
					guard let strongSelf = self else { return }
					strongSelf.lock.lock(); defer {strongSelf.lock.unlock()}
					let succeeded = error == nil
					strongSelf.requestsToRetry.forEach { $0(succeeded, 0.0) }
					strongSelf.requestsToRetry.removeAll()
				}
			}
		} else {
			completion(false, 0.0)
		}
	}
	
	public func refreshToken(completion: @escaping (Error?) -> Void) {
		guard !isRefreshing else {return}
		isRefreshing = true
		let auth = "\(clientID):\(secretKey)".data(using: .utf8)?.base64EncodedString()
		Alamofire.request(OAuthBaseURL + "token",
		                  method: .post,
		                  parameters:["grant_type": "refresh_token", "refresh_token": token.refreshToken],
		                  headers:["Authorization":"Basic \(auth!)"]).validateOAuth2().responseJSONDecodable {[weak self] (response: DataResponse<Token>) in
							guard let strongSelf = self else { return }
							
							switch(response.result) {
							case let .success(value):
								let expiresOn = Date(timeIntervalSinceNow: value.expiresIn)
								let token = strongSelf.token
								token.accessToken = value.accessToken
								token.refreshToken = value.refreshToken
								token.tokenType = value.tokenType
								token.expiresOn = expiresOn
								NotificationCenter.default.post(name: .OAuth2TokenDidRefresh, object: token)
								completion(nil)
							case let .failure(error):
								completion(error)
							}
							
							strongSelf.lock.lock(); defer {strongSelf.lock.unlock()}
							strongSelf.isRefreshing = false
		}
	}
}

fileprivate struct OAuth2ServerError: Codable {
	var error: String
	var errorDescription: String
	
	enum CodingKeys: String, CodingKey {
		case error
		case errorDescription = "error_description"
	}
}

extension DataRequest {
	@discardableResult
	public func validateOAuth2() -> Self {
		let statusCode = IndexSet(200..<300)
		
		return validate() {(request, response, data) -> ValidationResult in
			if statusCode.contains(response.statusCode) {
				return .success
			}
			else if let data = data, let error = try? JSONDecoder().decode(OAuth2ServerError.self, from: data) {
				return .failure(OAuth2Error.server(message: error.errorDescription))
			}
			else {
				return .success
			}
		}.validate(statusCode: statusCode)
	}
}
