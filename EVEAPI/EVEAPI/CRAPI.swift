//
//  CRAPI.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 06.12.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation

public class CRToken: NSObject, NSSecureCoding {
	public var accessToken: String
	public var refreshToken: String
	public var tokenType: String
	public var expiresOn: Date
	public var characterID: Int
	public var characterName: String
	public var expired: Bool {
		get {
			return expiresOn <= Date()
		}
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
	static let characterFittingsRead = CRAPIScope("characterFittingsRead")
	static let characterFittingsWrite = CRAPIScope("characterFittingsWrite")
	static let characterKillsRead = CRAPIScope("characterKillsRead")
	
	let rawValue: String
	
	init(_ value: String) {
		rawValue = value
	}
	
	static var all: [CRAPIScope]  {
		get {
			return [CRAPIScope.characterFittingsRead]
		}
	}
}

private class CRState {
	public let clientID: String?
	public let secretKey: String?
}

public class CRAPI: NSObject {
	public enum CRAPIError: Error {
		case InternalError
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
	
	public class func authenticate(clientID: String, secretKey: String, callbackURL: URL, scope: [CRAPIScope], completionBlock:((_ token: CRToken?, _ error: Error?) -> Void)?) {
		let scope = scope.map {$0.rawValue}.joined(separator: ",")
		let state = UUID().uuidString
		if let url = URL(string:"https://login-tq.eveonline.com/oauth/authorize/?response_type=code&redirect_uri=\(callbackURL.absoluteString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed))&client_id=\(clientID)&scope=\(scope)&state=\(state)") {
			UIApplication.shared.open(url, options: [:], completionHandler: nil)
		}
		else {
			completionBlock?(nil, CRAPIError.InternalError)
		}
	}
}
