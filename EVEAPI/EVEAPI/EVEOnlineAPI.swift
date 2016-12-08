//
//  EVEOnlineAPI.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 30.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit
import AFNetworking

public class EVEAPIKey: NSObject {
	public let keyID: Int
	public let vCode: String
	public let characterID: Int
	public let corporate: Bool
	
	public init(keyID:Int, vCode:String, characterID: Int, corporate: Bool) {
		self.keyID = keyID
		self.vCode = vCode
		self.characterID = characterID
		self.corporate = corporate
		super.init()
	}
	
	public init(keyID:Int, vCode:String) {
		self.keyID = keyID
		self.vCode = vCode
		self.characterID = 0
		self.corporate = false
		super.init()
	}
}

public class EVEOnlineAPI: NSObject {
	public let apiKey: EVEAPIKey?
	public let cachePolicy: URLRequest.CachePolicy
	public let sessionManager: EVEHTTPSessionManager = EVEHTTPSessionManager(baseURL: URL(string:"https://api.eveonline.com"), sessionConfiguration: nil)
	
	public init(apiKey: EVEAPIKey? = nil
		, cachePolicy:URLRequest.CachePolicy = .useProtocolCachePolicy) {
		self.apiKey = apiKey
		self.cachePolicy = cachePolicy
		self.sessionManager.requestSerializer = AFHTTPRequestSerializer()
		self.sessionManager.requestSerializer.cachePolicy = cachePolicy
		super.init()
	}
	
	//MARK: Account
	
	public func accountStatus(completionBlock:((EVEAccountStatus?, Error?) -> Void)?) {
		get("AccountStatus", scope: "Account", parameters: nil, completionBlock: completionBlock)
	}

	public func apiKeyInfo(completionBlock:((EVEAPIKeyInfo?, Error?) -> Void)?) {
		get("APIKeyInfo", scope: "Account", parameters: nil, completionBlock: completionBlock)
	}

	public func characters(completionBlock:((EVECharacters?, Error?) -> Void)?) {
		get("Characters", scope: "Account", parameters: nil, completionBlock: completionBlock)
	}
	
	//MARK: Character
	
	public func accountBalance(completionBlock:((EVEAccountBalance?, Error?) -> Void)?) {
		get("AccountBalance", scope: self.corporate ? "Corp" : "Char", parameters: nil, completionBlock: completionBlock)
	}
	
	public func assetList(completionBlock:((EVEAssetList?, Error?) -> Void)?) {
		get("AssetList", scope: self.corporate ? "Corp" : "Char", parameters: nil, completionBlock: completionBlock)
	}

	public func blueprints(completionBlock:((EVEBlueprints?, Error?) -> Void)?) {
		get("Blueprints", scope: self.corporate ? "Corp" : "Char", parameters: nil, completionBlock: completionBlock)
	}

	public func bookmarks(completionBlock:((EVEBookmarks?, Error?) -> Void)?) {
		get("Bookmarks", scope: self.corporate ? "Corp" : "Char", parameters: nil, completionBlock: completionBlock)
	}

	public func calendarEventAttendees(completionBlock:((EVECalendarEventAttendees?, Error?) -> Void)?) {
		get("CalendarEventAttendees", scope: "Char", parameters: nil, completionBlock: completionBlock)
	}

	public func characterSheet(completionBlock:((EVECharacterSheet?, Error?) -> Void)?) {
		get("CharacterSheet", scope: "Char", parameters: nil, completionBlock: completionBlock)
	}

	public func chatChannels(completionBlock:((EVEChatChannels?, Error?) -> Void)?) {
		get("ChatChannels", scope: "Char", parameters: nil, completionBlock: completionBlock)
	}

	public func clones(completionBlock:((EVEClones?, Error?) -> Void)?) {
		get("Clones", scope: "Char", parameters: nil, completionBlock: completionBlock)
	}

	public func contactList(completionBlock:((EVEContactList?, Error?) -> Void)?) {
		get("ContactList", scope: self.corporate ? "Corp" : "Char", parameters: nil, completionBlock: completionBlock)
	}

	public func contactNotifications(completionBlock:((EVEContactNotifications?, Error?) -> Void)?) {
		get("ContactNotifications", scope: "Char", parameters: nil, completionBlock: completionBlock)
	}

	public func contractBids(contractID: Int64, completionBlock:((EVEContractBids?, Error?) -> Void)?) {
		get("ContractBids", scope: self.corporate ? "Corp" : "Char", parameters: ["contractID": contractID], completionBlock: completionBlock)
	}

	public func contractItems(contractID: Int64, completionBlock:((EVEContractItems?, Error?) -> Void)?) {
		get("ContractItems", scope: self.corporate ? "Corp" : "Char", parameters: ["contractID": contractID], completionBlock: completionBlock)
	}

	public func contracts(contractID: Int64, completionBlock:((EVEContracts?, Error?) -> Void)?) {
		get("Contracts", scope: self.corporate ? "Corp" : "Char", parameters: contractID > 0 ? ["contractID": contractID] : nil, completionBlock: completionBlock)
	}

	public func facWarStats(completionBlock:((EVEFacWarStats?, Error?) -> Void)?) {
		get("FacWarStats", scope: self.corporate ? "Corp" : "Char", parameters: nil, completionBlock: completionBlock)
	}

	public func industryJobs(completionBlock:((EVEIndustryJobs?, Error?) -> Void)?) {
		get("IndustryJobs", scope: self.corporate ? "Corp" : "Char", parameters: nil, completionBlock: completionBlock)
	}

	public func industryJobsHistory(completionBlock:((EVEIndustryJobsHistory?, Error?) -> Void)?) {
		get("IndustryJobsHistory", scope: self.corporate ? "Corp" : "Char", parameters: nil, completionBlock: completionBlock)
	}

	public func killMails(fromID:Int64?, rowCount:Int?, completionBlock:((EVEKillMails?, Error?) -> Void)?) {
		var parameters = [String: Any]()
		if let fromID = fromID, let rowCount = rowCount {
			parameters["fromID"] = fromID
			parameters["rowCount"] = rowCount
		}
		get("KillMails", scope: self.corporate ? "Corp" : "Char", parameters: parameters, completionBlock: completionBlock)
	}

	public func locations(ids:[Int64], completionBlock:((EVELocations?, Error?) -> Void)?) {
		let s = ids.map {(i) in
			return String(i)
		}.joined(separator: ",")
		
		get("Locations", scope: self.corporate ? "Corp" : "Char", parameters: ["ids":s], completionBlock: completionBlock)
	}

	public func mailBodies(ids:[Int64], completionBlock:((EVEMailBodies?, Error?) -> Void)?) {
		let s = ids.map {(i) in
			return String(i)
			}.joined(separator: ",")
		
		get("MailBodies", scope: "Char", parameters: ["ids":s], completionBlock: completionBlock)
	}

	public func mailingLists(completionBlock:((EVEMailingLists?, Error?) -> Void)?) {
		get("MailingLists", scope: "Char", parameters: nil, completionBlock: completionBlock)
	}

	public func mailMessages(completionBlock:((EVEMailMessages?, Error?) -> Void)?) {
		get("MailMessages", scope: "Char", parameters: nil, completionBlock: completionBlock)
	}
	
	public func marketOrders(orderID:Int64?, completionBlock:((EVEMarketOrders?, Error?) -> Void)?) {
		var parameters = [String: Any]()
		if let orderID = orderID {
			parameters["orderID"] = orderID
		}
		get("MarketOrders", scope: self.corporate ? "Corp" : "Char", parameters: parameters, completionBlock: completionBlock)
	}

	public func charMedals(completionBlock:((EVECharMedals?, Error?) -> Void)?) {
		get("Medals", scope: "Char", parameters: nil, completionBlock: completionBlock)
	}

	public func notifications(completionBlock:((EVENotifications?, Error?) -> Void)?) {
		get("Notifications", scope: "Char", parameters: nil, completionBlock: completionBlock)
	}

	public func notificationTexts(ids:[Int], completionBlock:((EVENotificationTexts?, Error?) -> Void)?) {
		let s = ids.map {(i) in
			return String(i)
			}.joined(separator: ",")

		get("NotificationTexts", scope: "Char", parameters: ["ids":s], completionBlock: completionBlock)
	}

	public func planetaryColonies(completionBlock:((EVEPlanetaryColonies?, Error?) -> Void)?) {
		get("PlanetaryColonies", scope: "Char", parameters: nil, completionBlock: completionBlock)
	}

	public func planetaryLinks(planetID: Int, completionBlock:((EVEPlanetaryLinks?, Error?) -> Void)?) {
		get("PlanetaryLinks", scope: "Char", parameters: ["planetID": planetID], completionBlock: completionBlock)
	}

	public func planetaryPins(planetID: Int, completionBlock:((EVEPlanetaryPins?, Error?) -> Void)?) {
		get("PlanetaryPins", scope: "Char", parameters: ["planetID": planetID], completionBlock: completionBlock)
	}

	public func planetaryRoutes(planetID: Int, completionBlock:((EVEPlanetaryRoutes?, Error?) -> Void)?) {
		get("PlanetaryRoutes", scope: "Char", parameters: ["planetID": planetID], completionBlock: completionBlock)
	}

	public func research(completionBlock:((EVEResearch?, Error?) -> Void)?) {
		get("Research", scope: "Char", parameters: nil, completionBlock: completionBlock)
	}

	public func skillInTraining(completionBlock:((EVESkillInTraining?, Error?) -> Void)?) {
		get("SkillInTraining", scope: "Char", parameters: nil, completionBlock: completionBlock)
	}

	public func skillQueue(completionBlock:((EVESkillQueue?, Error?) -> Void)?) {
		get("SkillQueue", scope: "Char", parameters: nil, completionBlock: completionBlock)
	}

	public func skills(completionBlock:((EVESkills?, Error?) -> Void)?) {
		get("Skills", scope: "Char", parameters: nil, completionBlock: completionBlock)
	}

	public func charStandings(completionBlock:((EVECharStandings?, Error?) -> Void)?) {
		get("Standings", scope: "Char", parameters: nil, completionBlock: completionBlock)
	}

	public func upcomingCalendarEvents(completionBlock:((EVEUpcomingCalendarEvents?, Error?) -> Void)?) {
		get("UpcomingCalendarEvents", scope: "Char", parameters: nil, completionBlock: completionBlock)
	}
	
	public func walletJournal(fromID:Int64?, rowCount:Int?, account:Int?, completionBlock:((EVEWalletJournal?, Error?) -> Void)?) {
		var parameters = [String: Any]()
		if let fromID = fromID, let rowCount = rowCount {
			parameters["fromID"] = fromID
			parameters["rowCount"] = rowCount
		}
		if let account = account {
			parameters["account"] = account
		}
		
		get("WalletJournal", scope: self.corporate ? "Corp" : "Char", parameters: parameters, completionBlock: completionBlock)
	}

	public func walletTransactions(fromID:Int64?, rowCount:Int?, account:Int?, completionBlock:((EVEWalletTransactions?, Error?) -> Void)?) {
		var parameters = [String: Any]()
		if let fromID = fromID, let rowCount = rowCount {
			parameters["fromID"] = fromID
			parameters["rowCount"] = rowCount
		}
		if let account = account {
			parameters["account"] = account
		}

		get("WalletTransactions", scope: self.corporate ? "Corp" : "Char", parameters: parameters, completionBlock: completionBlock)
	}
	
	//MARK: Corporate

	public func containerLog(completionBlock:((EVEContainerLog?, Error?) -> Void)?) {
		get("ContainerLog", scope: "Corp", parameters: nil, completionBlock: completionBlock)
	}

	public func corporationSheet(corporationID:Int64?, completionBlock:((EVECorporationSheet?, Error?) -> Void)?) {
		var parameters = [String: Int64]()
		if let corporationID = corporationID {
			parameters["corporationID"] = corporationID
		}

		get("CorporationSheet", scope: "Corp", parameters: parameters, completionBlock: completionBlock)
	}

	public func customsOffices(completionBlock:((EVECustomsOffices?, Error?) -> Void)?) {
		get("CustomsOffices", scope: "Corp", parameters: nil, completionBlock: completionBlock)
	}
	
	public func facilities(completionBlock:((EVEFacilities?, Error?) -> Void)?) {
		get("Facilities", scope: "Corp", parameters: nil, completionBlock: completionBlock)
	}

	public func corpMedals(completionBlock:((EVECorpMedals?, Error?) -> Void)?) {
		get("Medals", scope: "Corp", parameters: nil, completionBlock: completionBlock)
	}

	public func memberMedals(completionBlock:((EVEMemberMedals?, Error?) -> Void)?) {
		get("MemberMedals", scope: "Corp", parameters: nil, completionBlock: completionBlock)
	}

	public func memberSecurity(completionBlock:((EVEMemberSecurity?, Error?) -> Void)?) {
		get("MemberSecurity", scope: "Corp", parameters: nil, completionBlock: completionBlock)
	}

	public func memberSecurityLog(completionBlock:((EVEMemberSecurityLog?, Error?) -> Void)?) {
		get("MemberSecurityLog", scope: "Corp", parameters: nil, completionBlock: completionBlock)
	}

	public func memberTracking(extended: Bool, completionBlock:((EVEMemberTracking?, Error?) -> Void)?) {
		get("MemberTracking", scope: "Corp", parameters: ["extended": extended ? 1 : 0], completionBlock: completionBlock)
	}

	public func outpostList(completionBlock:((EVEOutpostList?, Error?) -> Void)?) {
		get("OutpostList", scope: "Corp", parameters: nil, completionBlock: completionBlock)
	}

	public func outpostServiceDetail(stationID: Int, completionBlock:((EVEOutpostServiceDetail?, Error?) -> Void)?) {
		get("OutpostServiceDetail", scope: "Corp", parameters: ["itemID": stationID], completionBlock: completionBlock)
	}
	
	public func shareholders(completionBlock:((EVEShareholders?, Error?) -> Void)?) {
		get("Shareholders", scope: "Corp", parameters: nil, completionBlock: completionBlock)
	}

	public func corpStandings(completionBlock:((EVECorpStandings?, Error?) -> Void)?) {
		get("Standings", scope: "Corp", parameters: nil, completionBlock: completionBlock)
	}

	public func starbaseDetail(itemID:Int64, completionBlock:((EVEStarbaseDetail?, Error?) -> Void)?) {
		get("StarbaseDetail", scope: "Corp", parameters: ["itemID": itemID], completionBlock: completionBlock)
	}
	
	public func starbaseList(completionBlock:((EVEStarbaseList?, Error?) -> Void)?) {
		get("StarbaseList", scope: "Corp", parameters: nil, completionBlock: completionBlock)
	}

	public func titles(completionBlock:((EVETitles?, Error?) -> Void)?) {
		get("Titles", scope: "Corp", parameters: nil, completionBlock: completionBlock)
	}

	//MARK: Eve
	
	public func allianceList(completionBlock:((EVEAllianceList?, Error?) -> Void)?) {
		get("AllianceList", scope: "Eve", parameters: nil, completionBlock: completionBlock)
	}

	public func characterAffiliation(ids:[Int64], completionBlock:((EVECharacterAffiliation?, Error?) -> Void)?) {
		let s = ids.map {(i) in
			return String(i)
			}.joined(separator: ",")

		get("CharacterAffiliation", scope: "Eve", parameters: ["ids":s], completionBlock: completionBlock)
	}

	public func characterID(names:[String], completionBlock:((EVECharacterID?, Error?) -> Void)?) {
		let s = names.joined(separator: ",")
		
		get("CharacterID", scope: "Eve", parameters: ["names":s], completionBlock: completionBlock)
	}

	public func characterInfo(characterID:Int64, completionBlock:((EVECharacterInfo?, Error?) -> Void)?) {
		get("CharacterInfo", scope: "Eve", parameters: ["characterID":characterID], completionBlock: completionBlock)
	}

	public func characterName(ids:[Int64], completionBlock:((EVECharacterName?, Error?) -> Void)?) {
		let s = ids.map {(i) in
			return String(i)
			}.joined(separator: ",")
		
		get("CharacterName", scope: "Eve", parameters: ["ids":s], completionBlock: completionBlock)
	}
	
	public func conquerableStationList(completionBlock:((EVEConquerableStationList?, Error?) -> Void)?) {
		get("ConquerableStationList", scope: "Eve", parameters: nil, completionBlock: completionBlock)
	}

	public func errorList(completionBlock:((EVEErrorList?, Error?) -> Void)?) {
		get("ErrorList", scope: "Eve", parameters: nil, completionBlock: completionBlock)
	}

	public func facWarGlobalStats(completionBlock:((EVEFacWarGlobalStats?, Error?) -> Void)?) {
		get("FacWarStats", scope: "Eve", parameters: nil, completionBlock: completionBlock)
	}

	public func facWarTopStats(completionBlock:((EVEFacWarTopStats?, Error?) -> Void)?) {
		get("FacWarTopStats", scope: "Eve", parameters: nil, completionBlock: completionBlock)
	}

	public func ownerID(names:[String], completionBlock:((EVEOwnerID?, Error?) -> Void)?) {
		let s = names.joined(separator: ",")

		get("OwnerID", scope: "Eve", parameters: ["names":s], completionBlock: completionBlock)
	}

	public func refTypes(completionBlock:((EVERefTypes?, Error?) -> Void)?) {
		get("RefTypes", scope: "Eve", parameters: nil, completionBlock: completionBlock)
	}

	public func skillTree(completionBlock:((EVESkillTree?, Error?) -> Void)?) {
		get("SkillTree", scope: "Eve", parameters: nil, completionBlock: completionBlock)
	}
	
	public func typeName(ids:[Int64], completionBlock:((EVETypeName?, Error?) -> Void)?) {
		let s = ids.map {(i) in
			return String(i)
			}.joined(separator: ",")
		
		get("TypeName", scope: "Eve", parameters: ["ids":s], completionBlock: completionBlock)
	}
	
	//MARK: Map

	public func facWarSystems(completionBlock:((EVEFacWarSystems?, Error?) -> Void)?) {
		get("FacWarSystems", scope: "Map", parameters: nil, completionBlock: completionBlock)
	}

	public func jumps(completionBlock:((EVEJumps?, Error?) -> Void)?) {
		get("Jumps", scope: "Map", parameters: nil, completionBlock: completionBlock)
	}

	public func kills(completionBlock:((EVEKills?, Error?) -> Void)?) {
		get("Kills", scope: "Map", parameters: nil, completionBlock: completionBlock)
	}

	public func sovereignty(completionBlock:((EVESovereignty?, Error?) -> Void)?) {
		get("Sovereignty", scope: "Map", parameters: nil, completionBlock: completionBlock)
	}
	
	//MARK: Server

	public func serverStatus(completionBlock:((EVEServerStatus?, Error?) -> Void)?) {
		get("ServerStatus", scope: "Map", parameters: nil, completionBlock: completionBlock)
	}
	
	//MARK: API

	public func callList(completionBlock:((EVECallList?, Error?) -> Void)?) {
		get("CallList", scope: "API", parameters: nil, completionBlock: completionBlock)
	}
	
	//MARK: Private
	
	var corporate: Bool {
		get {
			if let corporate = self.apiKey?.corporate {
				return corporate
			}
			else {
				return false
			}
		}
	}
	
	func get<T:EVEResult>(_ method: String, scope: String, parameters: [String:Any]?, completionBlock: ((T?, Error?) -> Void)?) -> Void {
		let urlString = "\(scope)/\(method).xml.aspx"
		var param = parameters ?? [:]
		if let apiKey = self.apiKey {
			param["keyID"] = apiKey.keyID
			param["vCode"] = apiKey.vCode
			param["characterID"] = apiKey.characterID
		}
		self.sessionManager.get(urlString, parameters: param, responseSerializer: EVEAPISerializer(type:T.self), completionBlock: { (responseObject, error) in
			if let result = responseObject as? T {
				completionBlock?(result, nil)
			}
			else {
				completionBlock?(nil, error)
			}
		})
	}
}
