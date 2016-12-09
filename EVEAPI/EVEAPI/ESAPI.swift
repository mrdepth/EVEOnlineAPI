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
	
	public init(token: OAToken? = nil, server: ESServer = .tranquility, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) {
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
	
	public func marketPrices(completionBlock:(([ESMarketPrice]?, Error?) -> Void)?) {
		get("v1/markets/prices/", parameters: nil, completionBlock: completionBlock)
	}

	
	public func alliances(completionBlock:(([Int64]?, Error?) -> Void)?) {
		get("v1/alliances/", parameters: nil, completionBlock: completionBlock)
	}

	public func allianceNames(allianceIDs: [Int64], completionBlock:((ESAllianceNames?, Error?) -> Void)?) {
		if allianceIDs.count > 0 {
			let ids = allianceIDs.map {String($0)}
			get("v1/alliances/names/", parameters: ["alliance_ids":ids.joined(separator: ",")], completionBlock: completionBlock)
		}
		else {
			completionBlock?(ESAllianceNames(dictionary: [:]), nil)
		}
	}

	public func alliance(allianceID: Int64, completionBlock:((ESAlliance?, Error?) -> Void)?) {
		get("v2/alliances/\(allianceID)/", parameters: nil, completionBlock: completionBlock)
	}

	public func allianceCorporations(allianceID: Int64, completionBlock:(([Int64]?, Error?) -> Void)?) {
		get("v1/alliances/\(allianceID)/corporations/", parameters: nil, completionBlock: completionBlock)
	}

	public func allianceIcons(allianceID: Int64, completionBlock:((ESAllianceIcons?, Error?) -> Void)?) {
		get("v1/alliances/\(allianceID)/icons/", parameters: nil, completionBlock: completionBlock)
	}

	public func assets(completionBlock:(([ESAsset]?, Error?) -> Void)?) {
		if let token = token {
			get("v1/characters/\(token.characterID)/assets/", parameters: nil, completionBlock: completionBlock)
		}
		else {
			completionBlock?(nil, ESAPIError.unauthorized(nil))
		}
	}

	public func bookmarks(completionBlock:(([ESBookmark]?, Error?) -> Void)?) {
		if let token = token {
			get("v1/characters/\(token.characterID)/bookmarks/", parameters: nil, completionBlock: completionBlock)
		}
		else {
			completionBlock?(nil, ESAPIError.unauthorized(nil))
		}
	}

	public func bookmarkFolders(completionBlock:(([ESBookmarkFolder]?, Error?) -> Void)?) {
		if let token = token {
			get("v1/characters/\(token.characterID)/bookmarks/folders/", parameters: nil, completionBlock: completionBlock)
		}
		else {
			completionBlock?(nil, ESAPIError.unauthorized(nil))
		}
	}

	public func calendarEvents(fromEvent: Int64?, completionBlock:(([ESCalendarEvent]?, Error?) -> Void)?) {
		if let token = token {
			let parameters: [String: Int64]?
			if let fromEvent = fromEvent {
				parameters = ["from_event": fromEvent]
			}
			else {
				parameters = nil
			}
			get("v1/characters/\(token.characterID)/calendar/", parameters: parameters, completionBlock: completionBlock)
		}
		else {
			completionBlock?(nil, ESAPIError.unauthorized(nil))
		}
	}

	public func calendarEventDetails(eventID: Int64, completionBlock:((ESCalendarEventDetails?, Error?) -> Void)?) {
		if let token = token {
			get("v1/characters/\(token.characterID)/calendar/\(eventID)/", parameters: nil, completionBlock: completionBlock)
		}
		else {
			completionBlock?(nil, ESAPIError.unauthorized(nil))
		}
	}
	
	
	public func marketHistory(typeID: Int, regionID: Int, completionBlock:(([ESMarketHistory]?, Error?) -> Void)?) {
		get("v1/markets/\(regionID)/history/", parameters: ["type_id": typeID], completionBlock: completionBlock)
	}

	
	//MARK: Private
	
	private func validate<T:ESResult>(result: Any?) throws -> T {
		if let array = result as? [Any] {
			let result = ["items": array]
			if let obj = T.init(dictionary:result) {
				return obj
			}
			else {
				throw CRAPIError.invalidResponse
			}
		}
		else if let result = result as? [String: Any] {
			if let exceptionType = result["exceptionType"] as? String {
				let message = result["message"] as? String
				switch exceptionType {
				case "UnauthorizedError":
					throw CRAPIError.unauthorized(message)
				default:
					throw CRAPIError.server(exceptionType, message)
				}
			}
			else if let error = result["error"] as? String {
				throw CRAPIError.server("ServerError", error)
			}
			else if let obj = T.init(dictionary:result) {
				return obj
			}
			else {
				throw CRAPIError.invalidResponse
			}
		}
		else {
			throw CRAPIError.internalError
		}
	}
	
	private func get<T>(_ path: String, parameters: [String:Any]?, completionBlock: (([T]?, Error?) -> Void)?) -> Void {
		
		get(path, parameters: parameters, completionBlock: {(_ result: ESArray<T>?, _ error: Error?) -> Void in
			completionBlock?(result?.array as? [T], error)
		})
	}

	
	private func get<T:ESResult>(_ path: String, parameters: [String:Any]?, completionBlock: ((T?, Error?) -> Void)?) -> Void {
		var parameters = parameters ?? [:]
		parameters["datasource"] = self.server.rawValue

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
