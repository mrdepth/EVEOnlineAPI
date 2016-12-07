//
//  CRAPI.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 06.12.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation
import AFNetworking

public enum CRAPIError: Error {
	case Internal
	case InvalidResponse
	case Unauthorized(String?)
	case Server(String?, String?)
}

public struct CRScope {
	public static let characterFittingsRead = CRScope("characterFittingsRead")
	public static let characterFittingsWrite = CRScope("characterFittingsWrite")
	public static let characterKillsRead = CRScope("characterKillsRead")
	
	let rawValue: String
	
	init(_ value: String) {
		rawValue = value
	}
	
	public static var all: [CRScope]  {
		get {
			return [.characterFittingsRead, .characterFittingsWrite, .characterKillsRead]
		}
	}
}

public class CRAPI: NSObject {

	public let cachePolicy: URLRequest.CachePolicy
	public let token: OAToken?

	public lazy var sessionManager: EVEHTTPSessionManager = {
		let manager = EVEHTTPSessionManager(baseURL: URL(string: "https://crest.eveonline.com")!, sessionConfiguration: nil)
		manager.responseSerializer = AFJSONResponseSerializer()
		manager.requestSerializer = AFHTTPRequestSerializer()
		manager.requestSerializer.cachePolicy = self.cachePolicy
		if let token = self.token {
			manager.requestSerializer.setValue("\(token.tokenType!) \(token.accessToken!)", forHTTPHeaderField: "Authorization")
		}
		return manager
	}()

	public init(token: OAToken?, cachePolicy: URLRequest.CachePolicy) {
		if token?.tokenType != nil && token?.accessToken != nil {
			self.token = token
		}
		else {
			self.token = nil
		}
		self.cachePolicy = cachePolicy
		super.init()
	}
	
	public class func oauth(clientID: String, secretKey: String, callbackURL: URL, scope: [CRScope]) -> OAuth {
		let scope = scope.map {$0.rawValue}
		return OAuth(clientID: clientID, secretKey: secretKey, callbackURL: callbackURL, scope: scope, realm: nil)
	}
	
	public func fittings(completionBlock:((CRFittingCollection?, Error?) -> Void)?) {
		if let token = token {
			get("characters/\(token.characterID)/fittings/", parameters: nil, completionBlock: completionBlock)
		}
		else {
			completionBlock?(nil, CRAPIError.Unauthorized(nil))
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
					throw CRAPIError.Unauthorized(message)
				default:
					throw CRAPIError.Server(exceptionType, message)
				}
			}
			else if let obj = T.init(dictionary:result) {
				return obj
			}
			else {
				throw CRAPIError.InvalidResponse
			}
		}
		else {
			throw CRAPIError.Internal
		}
	}
	
	private func get<T:CRResult>(_ path: String, parameters: [String:Any]?, completionBlock: ((T?, Error?) -> Void)?) -> Void {
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
				catch CRAPIError.Unauthorized(let message) {
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
						completionBlock?(nil, CRAPIError.Unauthorized(message))
					}
				}
				catch let error {
					completionBlock?(nil, error ?? CRAPIError.Internal)
				}
			}
		})
	}
}

/*
Requested Scopes List
characterAccountRead: Read your account subscription status.
characterAssetsRead: Read your asset list.
characterBookmarksRead: List your bookmarks and their coordinates.
characterCalendarRead: Read your calendar events and attendees.
characterChatChannelsRead: List chat channels you own or operate.
characterClonesRead: List your jump clones, implants, attributes, and jump fatigue timer.
characterContactsRead: Allows access to reading your characters contacts.
characterContactsWrite: Allows applications to add, modify, and delete contacts for your character.
characterContractsRead: Read your contracts.
characterFactionalWarfareRead: Read your factional warfare statistics.
characterFittingsRead: Allows an application to view all of your character's saved fits.
characterFittingsWrite: Allows an application to create and delete the saved fits for your character.
characterIndustryJobsRead: List your industry jobs.
characterKillsRead: Read your kill mails.
characterLocationRead: Allows an application to read your characters real time location in EVE.
characterLoyaltyPointsRead: List loyalty points your character has for the different corporations.
characterMailRead: Read your EVE Mail.
characterMarketOrdersRead: Read your market orders.
characterMedalsRead: List your public and private medals.
characterNavigationWrite: Allows an application to set your ships autopilot destination.
characterNotificationsRead: Receive in-game notifications.
characterOpportunitiesRead: List the opportunities your character has completed.
characterResearchRead: List your research agents working for you and research progress.
characterSkillsRead: Read your skills and skill queue.
characterStatsRead: Yearly aggregated stats about your character.
characterWalletRead: Read your wallet status, transaction, and journal history.
corporationAssetsRead: Read your corporation's asset list.
corporationBookmarksRead: List your corporation's bookmarks and their coordinates.
corporationContactsRead: Read your corporation’s contact list and standings
corporationContractsRead: List your corporation's contracts.
corporationFactionalWarfareRead: Read your corporation's factional warfare statistics.
corporationIndustryJobsRead: List your corporation's industry jobs.
corporationKillsRead: Read your corporation's kill mails.
corporationMarketOrdersRead: List your corporation's market orders.
corporationMedalsRead: List your corporation's issued medals.
corporationMembersRead: List your corporation's members, their titles, and roles.
corporationShareholdersRead: List your corporation's shareholders and their shares.
corporationStructuresRead: List your corporation's structures, outposts, and starbases.
corporationWalletRead: Read your corporation's wallet status, transaction, and journal history.
fleetRead: Allows real time reading of your fleet information (members, ship types, etc.) if you're the boss of the fleet.
fleetWrite: Allows the ability to invite, kick, and update fleet information if you're the boss of the fleet.
esi-planets.manage_planets.v1: Allows reading a list of a characters planetary colonies, and the details of those colonies
publicData: Allows access to public data.
esi-assets.read_assets.v1: Allows reading a list of assets that the character owns
esi-calendar.read_calendar_events.v1: Allows reading a character's calendar, including corporation events
esi-bookmarks.read_character_bookmarks.v1: Allows reading of a character's bookmarks and bookmark folders
esi-wallet.read_character_wallet.v1: Allows reading of a character's wallet, journal and transaction history.
esi-clones.read_clones.v1: Allows reading the locations of a character's jump clones and their implants.
esi-characters.read_contacts.v1: Allows reading of a characters contacts list, and calculation of CSPA charges
esi-corporations.read_corporation_membership.v1: Allows reading a list of the ID's and roles of a character's fellow corporation members
esi-killmails.read_killmails.v1: Allows reading of a character's kills and losses
esi-location.read_location.v1: Allows reading of a character's active ship location
esi-location.read_ship_type.v1: Allows reading of a character's active ship class
esi-skills.read_skillqueue.v1: Allows reading of a character's currently training skill queue.
esi-skills.read_skills.v1: Allows reading of a character's currently known skills.
esi-universe.read_structures.v1: Allows querying the location and type of structures that the character has docking access at.
remoteClientUI: Allows applications to control the UI of your EVE Online client.
esi-calendar.respond_calendar_events.v1: Allows updating of a character's calendar event responses
esi-search.search_structures.v1: Allows searching over all structures that a character can see in the structure browser.
structureVulnUpdate: Allows updating your structures' vulnerability timers.

*/
