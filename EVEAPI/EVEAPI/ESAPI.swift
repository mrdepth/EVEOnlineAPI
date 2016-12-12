//
//  ESAPI.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 07.12.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation

import Foundation
import Alamofire

public enum ESError: Error {
	case network(error: Error)
	case objectSerialization(reason: String)
	case serialization(error: Error)
	case unauthorized(reason: String)
	case server(exceptionType: String, reason: String?)
	case notFound
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

public enum ESLanguage: String {
	case de = "de"
	case en = "en"
	case fr = "fr"
	case ja = "ja"
	case ru = "ru"
	case zh = "zh"
}

public enum ESMarketOrderType: String {
	case buy = "buy"
	case sell = "sell"
	case all = "all"
}

public enum ESSearchLocale: String {
	case de = "de"
	case en = "en-us"
	case fr = "fr"
	case ja = "ja"
	case ru = "ru"
	case zh = "zh"
}

public struct ESSearchCategory: OptionSet {
	public let rawValue: Int
	
	public init(rawValue: Int) {
		self.rawValue = rawValue
		
	}
	
	static let agent = ESSearchCategory(rawValue: 1 << 0)
	static let alliance = ESSearchCategory(rawValue: 1 << 1)
	static let character = ESSearchCategory(rawValue: 1 << 2)
	static let constellation = ESSearchCategory(rawValue: 1 << 3)
	static let corporation = ESSearchCategory(rawValue: 1 << 4)
	static let faction = ESSearchCategory(rawValue: 1 << 5)
	static let inventoryType = ESSearchCategory(rawValue: 1 << 6)
	static let region = ESSearchCategory(rawValue: 1 << 7)
	static let solarSystem = ESSearchCategory(rawValue: 1 << 8)
	static let station = ESSearchCategory(rawValue: 1 << 9)
	static let wormhole = ESSearchCategory(rawValue: 1 << 10)
	
	public var array: [String] {
		get {
			var strings = [String]()
			if contains(.agent) {strings.append("agent")}
			if contains(.alliance) {strings.append("alliance")}
			if contains(.character) {strings.append("character")}
			if contains(.constellation) {strings.append("constellation")}
			if contains(.corporation) {strings.append("corporation")}
			if contains(.faction) {strings.append("faction")}
			if contains(.inventoryType) {strings.append("inventorytype")}
			if contains(.region) {strings.append("region")}
			if contains(.solarSystem) {strings.append("solarsystem")}
			if contains(.station) {strings.append("station")}
			if contains(.wormhole) {strings.append("wormhole")}
			return strings
		}
	}
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
	
	func get<T>(_ path: String, parameters: [String:Any]?, headers: [String: String]? = nil, completionBlock: ((Result<[T]>) -> Void)?) -> Void {
		var parameters = parameters ?? [:]
		parameters["datasource"] = server.rawValue
		sessionManager.request(baseURL + path, parameters: parameters, headers: headers).validate().responseESI { (response: DataResponse<[T]>) in
			completionBlock?(response.result)
		}
	}

	func get<T>(_ path: String, parameters: [String:Any]?, headers: [String: String]? = nil, completionBlock: ((Result<T>) -> Void)?) -> Void {
		var parameters = parameters ?? [:]
		parameters["datasource"] = server.rawValue
		sessionManager.request(baseURL + path, parameters: parameters, headers: headers).validate().responseESI { (response: DataResponse<T>) in
			completionBlock?(response.result)
		}
	}

	func get<T:EVEObject>(_ path: String, parameters: [String:Any]?, headers: [String: String]? = nil, completionBlock: ((Result<[T]>) -> Void)?) -> Void {
		var parameters = parameters ?? [:]
		parameters["datasource"] = server.rawValue
		sessionManager.request(baseURL + path, parameters: parameters, headers: headers).validate().responseESI { (response: DataResponse<[T]>) in
			completionBlock?(response.result)
		}
	}
	
	func get<T:ESResult>(_ path: String, parameters: [String:Any]?, headers: [String: String]? = nil, completionBlock: ((Result<T>) -> Void)?) -> Void {
		var parameters = parameters ?? [:]
		parameters["datasource"] = server.rawValue
		sessionManager.request(baseURL + path, parameters: parameters, headers: headers).validate().responseESI { (response: DataResponse<T>) in
			completionBlock?(response.result)
		}
	}
	
	func post<T:EVEObject>(_ path: String, parameters: [String:Any]?, headers: [String: String]? = nil, completionBlock: ((Result<[T]>) -> Void)?) -> Void {
		var parameters = parameters ?? [:]
		parameters["datasource"] = server.rawValue
		sessionManager.request(baseURL + path, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).validate().responseESI { (response: DataResponse<[T]>) in
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
	
	public func character(characterID: Int64? = nil, completionBlock:((Result<ESCharacter>) -> Void)?) {
		guard let characterID = characterID ?? token?.characterID else {
			completionBlock?(.failure(ESError.unauthorized(reason: "Access token required")))
			return
		}
		get("v3/characters/\(characterID)/", parameters: nil, completionBlock: completionBlock)
	}

	public private(set) lazy var character: ESCharacterRouter = {
		return ESCharacterRouter(sessionManager: self.sessionManager, token: self.token, server: self.server)
	}()

	public func clones(completionBlock:((Result<ESClones>) -> Void)?) {
		if let token = token {
			get("v2/characters/\(token.characterID)/clones/", parameters: nil, completionBlock: completionBlock)
		}
		else {
			completionBlock?(.failure(ESError.unauthorized(reason: "Access token required")))
		}
	}
	
	public private(set) lazy var corporation: ESCorporationRouter = {
		return ESCorporationRouter(sessionManager: self.sessionManager, token: self.token, server: self.server)
	}()
	
	public func corporation(corporationID: Int64, completionBlock:((Result<ESCorporation>) -> Void)?) {
		get("v1/corporations/\(corporationID)/", parameters: nil, completionBlock: completionBlock)
	}

	public func incursions(completionBlock:((Result<[ESIncursion]>) -> Void)?) {
		get("v1/incursions/", parameters: nil, completionBlock: completionBlock)
	}

	public func insurance(language: ESLanguage = .en, completionBlock:((Result<[ESInsurance]>) -> Void)?) {
		get("v1/insurance/", parameters: nil, headers: ["Accept-Language": language.rawValue], completionBlock: completionBlock)
	}

	public func recentKillMails(maxCount: Int = 5000, maxKillID: Int64? = nil, completionBlock:((Result<[ESKillMail]>) -> Void)?) {
		if let token = token {
			var parameters: [String: Any] = ["max_count": maxCount]
			if let maxKillID = maxKillID {
				parameters["max_kill_id"] = maxKillID
			}
			get("v1/characters/\(token.characterID)/killmails/recent/", parameters: parameters, completionBlock: completionBlock)
		}
		else {
			completionBlock?(.failure(ESError.unauthorized(reason: "Access token required")))
		}
	}
	
	public func killMail(killMailID: Int64, killMailHash: String, completionBlock:((Result<ESKillMailDetails>) -> Void)?) {
		get("v1/killmails/\(killMailID)/\(killMailHash)/", parameters: nil, completionBlock: completionBlock)
	}

	public func mail(labels: [Int64]? = nil, lastMailID: Int64? = nil, completionBlock:((Result<[ESMail]>) -> Void)?) {
		if let token = token {
			var parameters = [String: Any]()
			if let labels = labels {
				parameters["labels"] = labels.map {return String($0)}.joined(separator: ",")
			}
			if let lastMailID = lastMailID {
				parameters["last_mail_id"] = lastMailID
			}
			get("v1/characters/\(token.characterID)/mail/", parameters: parameters, completionBlock: completionBlock)
		}
		else {
			completionBlock?(.failure(ESError.unauthorized(reason: "Access token required")))
		}
	}
	
	public private(set) lazy var mail: ESMailRouter = {
		return ESMailRouter(sessionManager: self.sessionManager, token: self.token, server: self.server)
	}()
	
	public func planets(completionBlock:((Result<[ESPlanet]>) -> Void)?) {
		if let token = token {
			get("v1/characters/\(token.characterID)/planets/", parameters: nil, completionBlock: completionBlock)
		}
		else {
			completionBlock?(.failure(ESError.unauthorized(reason: "Access token required")))
		}
	}
	
	public func planetDetails(planetID: Int, completionBlock:((Result<ESPlanetDetails>) -> Void)?) {
		if let token = token {
			get("v1/characters/\(token.characterID)/planets/\(planetID)", parameters: nil, completionBlock: completionBlock)
		}
		else {
			completionBlock?(.failure(ESError.unauthorized(reason: "Access token required")))
		}
	}
	
	public func search(search: String, language: ESSearchLocale = .en, categories: ESSearchCategory, strict: Bool = false, completionBlock:((Result<ESSearch>) -> Void)?) {
		let parameters = ["search": search,
		                  "categories": categories.array.joined(separator: ","),
		                  "language": language.rawValue,
		                  "strict": strict ? "true" : "false"]
		get("v1/search/", parameters: parameters, completionBlock: completionBlock)
	}
	
	public private(set) lazy var market: ESMarketRouter = {
		return ESMarketRouter(sessionManager: self.sessionManager, token: self.token, server: self.server)
	}()

	public private(set) lazy var sovereignty: ESSovereigntyRouter = {
		return ESSovereigntyRouter(sessionManager: self.sessionManager, token: self.token, server: self.server)
	}()

	public private(set) lazy var universe: ESUniverseRouter = {
		return ESUniverseRouter(sessionManager: self.sessionManager, token: self.token, server: self.server)
	}()

	public func wars(completionBlock:((Result<[Int]>) -> Void)?) {
		get("v1/wars/", parameters: nil, completionBlock: completionBlock)
	}
	
	public func war(warID: Int, completionBlock:((Result<ESWar>) -> Void)?) {
		get("v1/wars/\(warID)/", parameters: nil, completionBlock: completionBlock)
	}

	public private(set) lazy var war: ESWarRouter = {
		return ESWarRouter(sessionManager: self.sessionManager, token: self.token, server: self.server)
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

public class ESMarketRouter: ESRouter {
	public func prices(completionBlock:((Result<[ESMarketPrice]>) -> Void)?) {
		get("v1/markets/prices/", parameters: nil, completionBlock: completionBlock)
	}
	
	public func history(typeID: Int, regionID: Int, completionBlock:((Result<[ESMarketHistory]>) -> Void)?) {
		get("v1/markets/\(regionID)/history/", parameters: ["type_id": typeID], completionBlock: completionBlock)
	}
	
	public func orders(typeID: Int? = nil, regionID: Int, orderType: ESMarketOrderType = .all, page: Int? = nil, completionBlock:((Result<[ESMarketOrder]>) -> Void)?) {
		var parameters = [String: Any]()
		parameters["order_type"] = orderType.rawValue
		if let typeID = typeID {
			parameters["type_id"] = typeID
		}
		else if let page = page {
			parameters["page"] = page
		}

		get("v1/markets/\(regionID)/orders/", parameters: parameters, completionBlock: completionBlock)
	}

}

public class ESCharacterRouter: ESRouter {
	
	public func names(characterIDs: [Int64], completionBlock:((Result<ESCharacterNames>) -> Void)?) {
		if characterIDs.count > 0 {
			let ids = characterIDs.map {String($0)}
			get("v1/characters/names/", parameters: ["character_ids":ids.joined(separator: ",")], completionBlock: completionBlock)
		}
		else {
			completionBlock?(.success(ESCharacterNames(dictionary: [:])!))
		}
	}
	
	public func history(characterID: Int64? = nil, completionBlock:((Result<[ESCharacterCorporationHistory]>) -> Void)?) {
		guard let characterID = characterID ?? token?.characterID else {
			completionBlock?(.failure(ESError.unauthorized(reason: "Access token required")))
			return
		}
		get("v1/characters/\(characterID)/corporationhistory/", parameters: nil, completionBlock: completionBlock)
	}
	
	public func icons(characterID: Int64, completionBlock:((Result<ESCharacterPortraits>) -> Void)?) {
		get("v2/characters/\(characterID)/portrait/", parameters: nil, completionBlock: completionBlock)
	}
	
	public func location(completionBlock:((Result<ESCharacterLocation>) -> Void)?) {
		guard let characterID = token?.characterID else {
			completionBlock?(.failure(ESError.unauthorized(reason: "Access token required")))
			return
		}
		get("v1/characters/\(characterID)/location/", parameters: nil, completionBlock: completionBlock)
	}

	public func ship(completionBlock:((Result<ESCharacterShip>) -> Void)?) {
		guard let characterID = token?.characterID else {
			completionBlock?(.failure(ESError.unauthorized(reason: "Access token required")))
			return
		}
		get("v1/characters/\(characterID)/ship/", parameters: nil, completionBlock: completionBlock)
	}

	public func skillQueue(completionBlock:((Result<[ESSkillQueueItem]>) -> Void)?) {
		guard let characterID = token?.characterID else {
			completionBlock?(.failure(ESError.unauthorized(reason: "Access token required")))
			return
		}
		get("v2/characters/\(characterID)/skillqueue/", parameters: nil, completionBlock: completionBlock)
	}
	
	public func skills(completionBlock:((Result<ESSkills>) -> Void)?) {
		guard let characterID = token?.characterID else {
			completionBlock?(.failure(ESError.unauthorized(reason: "Access token required")))
			return
		}
		get("v3/characters/\(characterID)/skills/", parameters: nil, completionBlock: completionBlock)
	}
	
	public func wallets(completionBlock:((Result<[ESWallet]>) -> Void)?) {
		guard let characterID = token?.characterID else {
			completionBlock?(.failure(ESError.unauthorized(reason: "Access token required")))
			return
		}
		get("v1/characters/\(characterID)/wallets/", parameters: nil, completionBlock: completionBlock)
	}

}

public class ESCorporationRouter: ESRouter {
	
	public func names(corporationIDs: [Int64], completionBlock:((Result<ESCorporationNames>) -> Void)?) {
		if corporationIDs.count > 0 {
			let ids = corporationIDs.map {String($0)}
			get("v1/corporations/names/", parameters: ["corporation_ids":ids.joined(separator: ",")], completionBlock: completionBlock)
		}
		else {
			completionBlock?(.success(ESCorporationNames(dictionary: [:])!))
		}
	}
	
	public func history(corporationID: Int64, completionBlock:((Result<[ESCorporationAllianceHistory]>) -> Void)?) {
		get("v1/corporations/\(corporationID)/alliancehistory/", parameters: nil, completionBlock: completionBlock)
	}
	
	public func icons(corporationID: Int64, completionBlock:((Result<ESCorporationIcons>) -> Void)?) {
		get("v1/corporations/\(corporationID)/icons/", parameters: nil, completionBlock: completionBlock)
	}
	
	public func members(corporationID: Int64, completionBlock:((Result<[Int64]>) -> Void)?) {
		get("v2/corporations/\(corporationID)/members/", parameters: nil) { (result: Result<[[String:Int64]]>) in
			switch result {
			case let .success(value):
				completionBlock?(.success(value.map {return $0["character_id"] ?? 0}))
			case let .failure(error):
				completionBlock?(.failure(error))
			}
		}
	}

	public func roles(corporationID: Int64, completionBlock:((Result<[ESCorporationRole]>) -> Void)?) {
		get("v1/corporations/\(corporationID)/roles/", parameters: nil, completionBlock: completionBlock)
	}

}


public class ESMailRouter: ESRouter {
	
	public func body(mailID: Int64, completionBlock:((Result<ESMailBody>) -> Void)?) {
		if let token = token {
			get("v1/characters/\(token.characterID)/mail/\(mailID)/", parameters: nil, completionBlock: completionBlock)
		}
		else {
			completionBlock?(.failure(ESError.unauthorized(reason: "Access token required")))
		}
	}
	
	public func labels(completionBlock:((Result<ESMailLabels>) -> Void)?) {
		if let token = token {
			get("v1/characters/\(token.characterID)/mail/labels/", parameters: nil, completionBlock: completionBlock)
		}
		else {
			completionBlock?(.failure(ESError.unauthorized(reason: "Access token required")))
		}
	}

	public func lists(completionBlock:((Result<[ESMailingList]>) -> Void)?) {
		if let token = token {
			get("v1/characters/\(token.characterID)/mail/lists/", parameters: nil, completionBlock: completionBlock)
		}
		else {
			completionBlock?(.failure(ESError.unauthorized(reason: "Access token required")))
		}
	}

}

public class ESSovereigntyRouter: ESRouter {
	
	public func campaigns(completionBlock:((Result<[ESSovereigntyCampaign]>) -> Void)?) {
		get("v1/sovereignty/campaigns/", parameters: nil, completionBlock: completionBlock)
	}
	
	public func structures(completionBlock:((Result<[ESSovereigntyStructure]>) -> Void)?) {
		get("v1/sovereignty/structures/", parameters: nil, completionBlock: completionBlock)
	}
	
}

public class ESUniverseRouter: ESRouter {
	
	public func names(ids:[Int64], completionBlock:((Result<[ESName]>) -> Void)?) {
		if ids.count > 0 {
			let ids = ids.map {String($0)}
			post("v1/universe/names/", parameters: ["ids":ids.joined(separator: ",")], completionBlock: completionBlock)
		}
		else {
			completionBlock?(.success([]))
		}
	}
	
	public func station(stationID: Int, completionBlock:((Result<ESStation>) -> Void)?) {
		get("v1/universe/stations/\(stationID)/", parameters: nil, completionBlock:completionBlock)
	}
	
	public func structures(completionBlock:((Result<[Int64]>) -> Void)?) {
		get("v1/universe/structures/", parameters: nil, completionBlock:completionBlock)
	}

	public func structure(structureID: Int64, completionBlock:((Result<ESStructure>) -> Void)?) {
		get("v1/universe/structures/\(structureID)/", parameters: nil, completionBlock:completionBlock)
	}
	
	public func system(systemID: Int, completionBlock:((Result<String>) -> Void)?) {
		get("v1/universe/systems/\(systemID)/", parameters: nil) { (result: Result<[String: String]>) in
			switch result {
			case let .success(value):
				if let name = value["solar_system_name"] {
					completionBlock?(.success(name))
				}
				else {
					completionBlock?(.failure(ESError.notFound))
				}
			case let .failure(error):
				completionBlock?(.failure(error))
			}
		}
	}
	
	public func type(typeID: Int, completionBlock:((Result<ESType>) -> Void)?) {
		get("v1/universe/types/\(typeID)/", parameters: nil, completionBlock:completionBlock)
	}
}

public class ESWarRouter: ESRouter {
	
	public func killMails(warID: Int, completionBlock:((Result<[ESKillMail]>) -> Void)?) {
		get("v1/wars/\(warID)/killmails/", parameters: nil, completionBlock: completionBlock)
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
							return .failure(ESError.unauthorized(reason: message ?? "Authorization failed"))
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

	public func responseESI<T:Any>(
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
				guard let response = response, let responseObject = jsonObject as? T else {
					return .failure(ESError.objectSerialization(reason: "JSON could not be serialized: \(jsonObject)"))
				}
				
				return .success(responseObject)
			}
			
			return response(queue: queue, responseSerializer: responseSerializer, completionHandler: completionHandler)
	}
}
