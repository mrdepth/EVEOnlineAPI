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
import Alamofire

public enum ESError: Error {
	case network(error: Error)
	case objectSerialization(reason: String)
	case serialization(error: Error)
	case unauthorized(reason: String?)
	case server(exceptionType: String, reason: String?)
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

public class ESRouter {
	public let sessionManager: SessionManager
	public let token: OAuth2Token?
	public let server: ESServer

	let baseURL = "https://esi.tech.ccp.is/"
	
	init(sessionManager: SessionManager, token: OAuth2Token?, server: ESServer) {
		self.sessionManager = sessionManager
		self.token = token
		self.server = server
	}
	
	func get<T>(_ path: String, parameters: [String:Any]?, completionBlock: ((Result<[T]>) -> Void)?) -> Void {
		var parameters = parameters ?? [:]
		parameters["datasource"] = server.rawValue
		sessionManager.request(baseURL + path, parameters: parameters).responseESI { (response: DataResponse<[T]>) in
			completionBlock?(response.result)
		}
	}
	
	func get<T:ESResult>(_ path: String, parameters: [String:Any]?, completionBlock: ((Result<T>) -> Void)?) -> Void {
		var parameters = parameters ?? [:]
		parameters["datasource"] = server.rawValue
		sessionManager.request(baseURL + path, parameters: parameters).responseESI { (response: DataResponse<T>) in
			completionBlock?(response.result)
		}
	}
}

public class ESAPI: ESRouter {
	
	
	public init(token: OAuth2Token? = nil, clientID: String? = nil, secretKey: String? = nil, server: ESServer = .tranquility, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) {
		
		
		let configuration = URLSessionConfiguration.default
		configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
		configuration.requestCachePolicy = cachePolicy
		let sessionManager = SessionManager(configuration: configuration)

		if let token = token, let clientID = clientID, let secretKey = secretKey {
			let handler = OAuth2Handler(token: token, clientID: clientID, secretKey: secretKey)
			sessionManager.adapter = handler
			sessionManager.retrier = handler
		}
		super.init(sessionManager: sessionManager, token: token, server: server)
	}
	
	public class func oauth2url(clientID: String, callbackURL: URL, scope: [ESScope]) -> URL {
		var query = [URLQueryItem] ()
		let callback = callbackURL.absoluteString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)

		query.append(URLQueryItem(name: "response_type", value: "code"))
		query.append(URLQueryItem(name: "redirect_uri", value: callback))
		query.append(URLQueryItem(name: "client_id", value: clientID))
		query.append(URLQueryItem(name: "scope", value: scope.map{$0.rawValue}.joined(separator: "+").addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)))
		query.append(URLQueryItem(name: "state", value: "esi"))
		query.append(URLQueryItem(name: "realm", value: "esi"))
		
		var components = URLComponents(string: "https://login.eveonline.com/oauth/authorize/")!
		components.queryItems = query
		return components.url!
	}
	
	public private(set) lazy var alliances: ESAlliancesRouter = {
		return ESAlliancesRouter(sessionManager: self.sessionManager, token: self.token, server: self.server)
	}()

	public func alliances(completionBlock:((Result<[Int64]>) -> Void)?) {
		get("v1/alliances/", parameters: nil, completionBlock: completionBlock)
	}
	
	public func alliance(allianceID: Int64, completionBlock:((Result<ESAlliance>) -> Void)?) {
		get("v2/alliances/\(allianceID)/", parameters: nil, completionBlock: completionBlock)
	}

	public func assets(completionBlock:((Result<[ESAsset]>) -> Void)?) {
		if let token = token {
			get("v1/characters/\(token.characterID)/assets/", parameters: nil, completionBlock: completionBlock)
		}
		else {
			completionBlock?(.failure(ESError.unauthorized(reason: "Access token required")))
		}
	}

	public private(set) lazy var bookmarks: ESBookmarksRouter = {
		return ESBookmarksRouter(sessionManager: self.sessionManager, token: self.token, server: self.server)
	}()

	public func bookmarks(completionBlock:((Result<[ESBookmark]>) -> Void)?) {
		if let token = token {
			get("v1/characters/\(token.characterID)/bookmarks/", parameters: nil, completionBlock: completionBlock)
		}
		else {
			completionBlock?(.failure(ESError.unauthorized(reason: "Access token required")))
		}
	}

	public private(set) lazy var calendar: ESCalendarRouter = {
		return ESCalendarRouter(sessionManager: self.sessionManager, token: self.token, server: self.server)
	}()

	public private(set) lazy var markets: ESMarketsRouter = {
		return ESMarketsRouter(sessionManager: self.sessionManager, token: self.token, server: self.server)
	}()

}

public class ESAlliancesRouter: ESRouter {

	public func corporations(allianceID: Int64, completionBlock:((Result<[Int64]>) -> Void)?) {
		get("v1/alliances/\(allianceID)/corporations/", parameters: nil, completionBlock: completionBlock)
	}
	
	public func icons(allianceID: Int64, completionBlock:((Result<ESAllianceIcons>) -> Void)?) {
		get("v1/alliances/\(allianceID)/icons/", parameters: nil, completionBlock: completionBlock)
	}
	
	public func names(allianceIDs: [Int64], completionBlock:((Result<ESAllianceNames>) -> Void)?) {
		if allianceIDs.count > 0 {
			let ids = allianceIDs.map {String($0)}
			get("v1/alliances/names/", parameters: ["alliance_ids":ids.joined(separator: ",")], completionBlock: completionBlock)
		}
		else {
			completionBlock?(.success(ESAllianceNames(dictionary: [:])!))
		}
	}

}

public class ESBookmarksRouter: ESRouter {
	public func folders(completionBlock:((Result<[ESBookmarkFolder]>) -> Void)?) {
		if let token = token {
			get("v1/characters/\(token.characterID)/bookmarks/folders/", parameters: nil, completionBlock: completionBlock)
		}
		else {
			completionBlock?(.failure(ESError.unauthorized(reason: "Access token required")))
		}
	}
}

public class ESCalendarRouter: ESRouter {
	public func events(fromEvent: Int64?, completionBlock:((Result<[ESCalendarEvent]>) -> Void)?) {
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
			completionBlock?(.failure(ESError.unauthorized(reason: "Access token required")))
		}
	}
	
	public func event(eventID: Int64, completionBlock:((Result<ESCalendarEventDetails>) -> Void)?) {
		if let token = token {
			get("v1/characters/\(token.characterID)/calendar/\(eventID)/", parameters: nil, completionBlock: completionBlock)
		}
		else {
			completionBlock?(.failure(ESError.unauthorized(reason: "Access token required")))
		}
	}
}

public class ESMarketsRouter: ESRouter {
	public func prices(completionBlock:((Result<[ESMarketPrice]>) -> Void)?) {
		get("v1/markets/prices/", parameters: nil, completionBlock: completionBlock)
	}
	
	public func history(typeID: Int, regionID: Int, completionBlock:((Result<[ESMarketHistory]>) -> Void)?) {
		get("v1/markets/\(regionID)/history/", parameters: ["type_id": typeID], completionBlock: completionBlock)
	}
}

extension DataRequest {

	@discardableResult
	
	static func esiResponseSerializer() -> DataResponseSerializer<Any> {
		return DataResponseSerializer { request, response, data, error in
			switch jsonResponseSerializer().serializeResponse(request, response, data, error) {
			case let .success(value):
				guard let result = value as? [String: Any] else {return .success(value)}
				if let result = result as? [String: Any] {
					if let exceptionType = result["exceptionType"] as? String {
						let message = result["message"] as? String
						switch exceptionType {
						case "UnauthorizedError":
							return .failure(ESError.unauthorized(reason: message))
						default:
							return .failure(ESError.server(exceptionType: exceptionType, reason: message))
						}
					}
					else if let error = result["error"] as? String {
						return .failure(ESError.server(exceptionType: "ServerError", reason: error))
					}
					else if let error = result["error_description"] as? String {
						return .failure(ESError.server(exceptionType: "ServerError", reason: error))
					}
				}
				
				return .success(value)
			case let .failure(error):
				return .failure(error)
			}
			guard error == nil else {return .failure(error!)}
			return Request.serializeResponseJSON(options: .allowFragments, response: response, data: data, error: error)
		}
	}
	
	public func responseESI<T:ESResult>(
		queue: DispatchQueue? = nil,
		options: JSONSerialization.ReadingOptions = .allowFragments,
		completionHandler: @escaping (DataResponse<T>) -> Void)
		-> Self {
		let responseSerializer = DataResponseSerializer<T> { request, response, data, error in
			guard error == nil else { return .failure(ESError.network(error: error!)) }
			
			let responseSerializer = DataRequest.esiResponseSerializer()
			let result = responseSerializer.serializeResponse(request, response, data, nil)
			
			guard case let .success(jsonObject) = result else {
				return .failure(ESError.serialization(error: result.error!))
			}
			guard let dic = jsonObject as? [String: Any] else {
				return .failure(ESError.objectSerialization(reason: "JSON could not be serialized: \(jsonObject)"))
			}
			guard let response = response, let responseObject = T(dictionary: dic) else {
				return .failure(ESError.objectSerialization(reason: "JSON could not be serialized: \(jsonObject)"))
			}
			
			return .success(responseObject)
		}
		
		return response(queue: queue, responseSerializer: responseSerializer, completionHandler: completionHandler)
	}
	
	public func responseESI<T:EVEObject>(
		queue: DispatchQueue? = nil,
		options: JSONSerialization.ReadingOptions = .allowFragments,
		completionHandler: @escaping (DataResponse<[T]>) -> Void)
		-> Self {
			let responseSerializer = DataResponseSerializer<[T]> { request, response, data, error in
				guard error == nil else { return .failure(ESError.network(error: error!)) }
				
				let responseSerializer = DataRequest.esiResponseSerializer()
				let result = responseSerializer.serializeResponse(request, response, data, nil)
				
				guard case let .success(jsonObject) = result else {
					return .failure(ESError.serialization(error: result.error!))
				}
				guard let array = jsonObject as? [[String: Any]] else {
					return .failure(ESError.objectSerialization(reason: "JSON could not be serialized: \(jsonObject)"))
				}
				var objects = [T]()
				for dic in array {
					if let object = T(dictionary: dic) {
						objects.append(object)
					}
					
				}
				
				return .success(objects)
			}
			
			return response(queue: queue, responseSerializer: responseSerializer, completionHandler: completionHandler)
	}
	
	public func responseESI<T:Any>(
		queue: DispatchQueue? = nil,
		options: JSONSerialization.ReadingOptions = .allowFragments,
		completionHandler: @escaping (DataResponse<[T]>) -> Void)
		-> Self {
			let responseSerializer = DataResponseSerializer<[T]> { request, response, data, error in
				guard error == nil else { return .failure(ESError.network(error: error!)) }
				
				let responseSerializer = DataRequest.esiResponseSerializer()
				let result = responseSerializer.serializeResponse(request, response, data, nil)
				
				guard case let .success(jsonObject) = result else {
					return .failure(ESError.serialization(error: result.error!))
				}
				guard let array = jsonObject as? [T] else {
					return .failure(ESError.objectSerialization(reason: "JSON could not be serialized: \(jsonObject)"))
				}
				return .success(array)
			}
			
			return response(queue: queue, responseSerializer: responseSerializer, completionHandler: completionHandler)
	}

}
