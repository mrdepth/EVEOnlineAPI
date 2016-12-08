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
	case internalError
	case invalidResponse
	case unauthorized(String?)
	case server(String?, String?)
}

public struct ESScope {
	public static let assetsRead = ESScope("esi-assets.read_assets.v1")
	public static let readCharacterBookmarks = ESScope("esi-bookmarks.read_character_bookmarks.v1")
	public static let readCalendarEvents = ESScope("esi-calendar.read_calendar_events.v1")
	public static let respondCalendarEvents = ESScope("esi-calendar.respond_calendar_events.v1")
	public static let readContacts = ESScope("esi-characters.read_contacts.v1")
	public static let readClones = ESScope("esi-clones.read_clones.v1")
	public static let corporationMembership = ESScope("esi-corporations.read_corporation_membership.v1")
	public static let readKillmails = ESScope("esi-killmails.read_killmails.v1")
	public static let readLocation = ESScope("esi-location.read_location.v1")
	public static let readShipType = ESScope("esi-location.read_ship_type.v1")
	public static let organizeMail = ESScope("esi-mail.organize_mail.v1")
	public static let readMail = ESScope("esi-mail.read_mail.v1")
	public static let sendMail = ESScope("esi-mail.send_mail.v1")
	public static let searchStructures = ESScope("esi-search.search_structures.v1")
	public static let readSkillQueue = ESScope("esi-skills.read_skillqueue.v1")
	public static let readSkills = ESScope("esi-skills.read_skills.v1")
	public static let readStructures = ESScope("esi-universe.read_structures.v1")
	public static let readCharacterWallet = ESScope("esi-wallet.read_character_wallet.v1")
	
	let rawValue: String
	
	init(_ value: String) {
		rawValue = value
	}

	public static var all: [ESScope]  {
		get {
			return [assetsRead,
			        readCharacterBookmarks,
			        readCalendarEvents,
			        respondCalendarEvents,
			        readContacts,
			        readClones,
			        corporationMembership,
			        readKillmails,
			        readLocation,
			        readShipType,
//			        organizeMail,
//			        readMail,
//			        sendMail,
			        searchStructures,
			        readSkillQueue,
			        readSkills,
			        readStructures,
			        readCharacterWallet
			]
		}
	}
}

public enum ESServer: String {
	case tranquility = "tranquility"
	case singularity = "singularity"
}

public class ESAPI: NSObject {
	
	public let cachePolicy: URLRequest.CachePolicy
	public let token: OAToken?
	public let server: ESServer
	
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
	
	public init(token: OAToken?, server: ESServer = .tranquility, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) {
		if token?.tokenType != nil && token?.accessToken != nil {
			self.token = token
		}
		else {
			self.token = nil
		}
		self.server = server
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
			completionBlock?(nil, ESAPIError.unauthorized(nil))
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
					throw ESAPIError.unauthorized(message)
				default:
					throw ESAPIError.server(exceptionType, message)
				}
			}
			else if let obj = T.init(dictionary:result) {
				return obj
			}
			else {
				throw ESAPIError.invalidResponse
			}
		}
		else {
			throw ESAPIError.internalError
		}
	}
	
	private func get<T:CRResult>(_ path: String, parameters: [String:Any]?, completionBlock: ((T?, Error?) -> Void)?) -> Void {
		let path = "/v1/" + path
		var parameters = parameters ?? [:]
		parameters["datasource"] = self.server.rawValue

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
				catch ESAPIError.unauthorized(let message) {
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
						completionBlock?(nil, ESAPIError.unauthorized(message))
					}
				}
				catch let error {
					completionBlock?(nil, error ?? ESAPIError.internalError)
				}
			}
		})
	}
}
