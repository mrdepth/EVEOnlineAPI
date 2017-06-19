//
//  ESI.swift
//  Test
//
//  Created by Artem Shimanski on 09.04.17.
//  Copyright © 2017 Artem Shimanski. All rights reserved.
//

import Foundation
import Alamofire

public enum ESServer: String {
	case tranquility = "tranquility"
	case singularity = "singularity"
}

public class ESI: SessionManager {
	let baseURL = "https://esi.tech.ccp.is/"
	let server: ESServer
	
	public init(token: OAuth2Token? = nil, clientID: String? = nil, secretKey: String? = nil, server: ESServer = .tranquility, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, adapter: OAuth2Adapter? = nil, retrier: OAuth2Retrier? = nil) {
		self.server = server
		let configuration = URLSessionConfiguration.default
		configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
		configuration.requestCachePolicy = cachePolicy
		
		super.init(configuration: configuration)
		
		if let token = token, let clientID = clientID, let secretKey = secretKey {
			self.adapter = adapter ?? OAuth2Adapter(token: token)
			self.retrier = retrier ?? OAuth2Retrier(token: token, clientID: clientID, secretKey: secretKey)
		}
	}
	
	public class func initialize() {
		loadClassess()
	}

	public func image(characterID: Int, dimension: Int, completionBlock:((Result<Data>) -> Void)?) {
		let dimensions = [32, 64, 128, 256, 512, 1024]
		var bestDimension = dimensions.last!
		for d in dimensions {
			if d >= dimension {
				bestDimension = d
				break
			}
		}
		
		request("https://imageserver.eveonline.com/Character/\(characterID)_\(bestDimension).jpg").validate().responseData { response in
			completionBlock?(response.result)
		}
	}
	
	public func image(corporationID: Int, dimension: Int, completionBlock:((Result<Data>) -> Void)?) {
		let dimensions = [32, 64, 128, 256]
		var bestDimension = dimensions.last!
		for d in dimensions {
			if d >= dimension {
				bestDimension = d
				break
			}
		}
		
		request("https://imageserver.eveonline.com/Corporation/\(corporationID)_\(bestDimension).png").validate().responseData { response in
			completionBlock?(response.result)
		}
	}
	
	public func image(allianceID: Int, dimension: Int, completionBlock:((Result<Data>) -> Void)?) {
		let dimensions = [32, 64, 128]
		var bestDimension = dimensions.last!
		for d in dimensions {
			if d >= dimension {
				bestDimension = d
				break
			}
		}
		
		request("https://imageserver.eveonline.com/Alliance/\(allianceID)_\(bestDimension).png").validate().responseData { response in
			completionBlock?(response.result)
		}
	}
	
	public func image(typeID: Int, dimension: Int, completionBlock:((Result<Data>) -> Void)?) {
		let dimensions = [32, 64, 128, 256, 512]
		var bestDimension = dimensions.last!
		for d in dimensions {
			if d >= dimension {
				bestDimension = d
				break
			}
		}
		
		request("https://imageserver.eveonline.com/Render/\(typeID)_\(bestDimension).png").validate().responseData { response in
			if response.response?.url?.lastPathComponent != "\(typeID)_\(bestDimension).png" {
				completionBlock?(.failure(ESIError.notFound))
			}
			else {
				completionBlock?(response.result)
			}
		}
	}

	public struct Scope {
		public let rawValue: String
		
		public init(_ value: String) {
			rawValue = value
		}
	}
}


extension DataRequest {
	
	
	@discardableResult
	public func validateESI() -> Self {
		var statusCode = IndexSet(200..<300)
		statusCode.insert(403)
		
		return validate(statusCode: statusCode).validate() {(request, response, data) -> ValidationResult in
			if response.statusCode == 403 {
				guard let data = data else {return .success}
				if let result = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String: Any] {
					if let error = result["error"] as? String, error == "Forbidden" {
						return .failure(ESIError.forbidden)
					}
				}
				return .failure(OAuth2Error.tokenExpired)
			}
			else {
				return .success
			}
		}
	}
	

	@discardableResult
	public func responseESI<T: JSONCoding>(queue: DispatchQueue? = nil,
		options: JSONSerialization.ReadingOptions = .allowFragments,
		completionHandler: @escaping (DataResponse<T>) -> Void)
		-> Self
	{
		let serializer = DataResponseSerializer<T> { (request, response, data, error) -> Result<T> in
			let result = DataRequest.jsonResponseSerializer().serializeResponse(request, response, data, error)
			switch result {
			case let .success(value):
				do {
					return .success(try T(json: value))
				}
				catch {
					return .failure(error)
				}
			case let .failure(error):
				return .failure(error)
			}
		}
		
		return response(
			queue: queue,
			responseSerializer: serializer,
			completionHandler: completionHandler
		)
	}
}

public extension ESI.Scope {
	public static let characterAccountRead = ESI.Scope("characterAccountRead")
	public static let characterAssetsRead = ESI.Scope("characterAssetsRead")
	public static let characterBookmarksRead = ESI.Scope("characterBookmarksRead")
	public static let characterCalendarRead = ESI.Scope("characterCalendarRead")
	public static let characterChatChannelsRead = ESI.Scope("characterChatChannelsRead")
	public static let characterClonesRead = ESI.Scope("characterClonesRead")
	public static let characterContactsRead = ESI.Scope("characterContactsRead")
	public static let characterContactsWrite = ESI.Scope("characterContactsWrite")
	public static let characterContractsRead = ESI.Scope("characterContractsRead")
	public static let characterFactionalWarfareRead = ESI.Scope("characterFactionalWarfareRead")
	public static let characterFittingsRead = ESI.Scope("characterFittingsRead")
	public static let characterFittingsWrite = ESI.Scope("characterFittingsWrite")
	public static let characterIndustryJobsRead = ESI.Scope("characterIndustryJobsRead")
	public static let characterKillsRead = ESI.Scope("characterKillsRead")
	public static let characterLocationRead = ESI.Scope("characterLocationRead")
	public static let characterLoyaltyPointsRead = ESI.Scope("characterLoyaltyPointsRead")
	public static let characterMailRead = ESI.Scope("characterMailRead")
	public static let characterMarketOrdersRead = ESI.Scope("characterMarketOrdersRead")
	public static let characterMedalsRead = ESI.Scope("characterMedalsRead")
	public static let characterNavigationWrite = ESI.Scope("characterNavigationWrite")
	public static let characterNotificationsRead = ESI.Scope("characterNotificationsRead")
	public static let characterOpportunitiesRead = ESI.Scope("characterOpportunitiesRead")
	public static let characterResearchRead = ESI.Scope("characterResearchRead")
	public static let characterSkillsRead = ESI.Scope("characterSkillsRead")
	public static let characterStatsRead = ESI.Scope("characterStatsRead")
	public static let characterWalletRead = ESI.Scope("characterWalletRead")
	public static let corporationAssetsRead = ESI.Scope("corporationAssetsRead")
	public static let corporationBookmarksRead = ESI.Scope("corporationBookmarksRead")
	public static let corporationContactsRead = ESI.Scope("corporationContactsRead")
	public static let corporationContractsRead = ESI.Scope("corporationContractsRead")
	public static let corporationFactionalWarfareRead = ESI.Scope("corporationFactionalWarfareRead")
	public static let corporationIndustryJobsRead = ESI.Scope("corporationIndustryJobsRead")
	public static let corporationKillsRead = ESI.Scope("corporationKillsRead")
	public static let corporationMarketOrdersRead = ESI.Scope("corporationMarketOrdersRead")
	public static let corporationMedalsRead = ESI.Scope("corporationMedalsRead")
	public static let corporationMembersRead = ESI.Scope("corporationMembersRead")
	public static let corporationShareholdersRead = ESI.Scope("corporationShareholdersRead")
	public static let corporationStructuresRead = ESI.Scope("corporationStructuresRead")
	public static let corporationWalletRead = ESI.Scope("corporationWalletRead")
	public static let fleetRead = ESI.Scope("fleetRead")
	public static let fleetWrite = ESI.Scope("fleetWrite")
	public static let publicData = ESI.Scope("publicData")
	public static let remoteClientUI = ESI.Scope("remoteClientUI")
	public static let structureVulnUpdate = ESI.Scope("structureVulnUpdate")
	
	public static var `default`: [ESI.Scope]  {
		get {
			return [
//				.characterAccountRead,
				.characterClonesRead,
//				.characterIndustryJobsRead,
//				.characterMarketOrdersRead,
//				.characterSkillsRead,
//				.characterContractsRead,
				.characterStatsRead,
				.characterWalletRead,
				.esiClonesReadClonesV1,
				.esiFittingsWriteFittingsV1,
				.esiCharactersReadStandingsV1,
				.esiUniverseReadStructuresV1,
				.esiMarketsStructureMarketsV1,
				.esiMailReadMailV1,
				.esiSkillsReadSkillqueueV1,
				.esiAssetsReadAssetsV1,
				.esiCalendarRespondCalendarEventsV1,
				.esiMailOrganizeMailV1,
				.esiKillmailsReadKillmailsV1,
				.esiMailSendMailV1,
				.esiWalletReadCharacterWalletV1,
//				.esiCharactersReadAgentsResearchV1,
				.esiFittingsReadFittingsV1,
				.esiCalendarReadCalendarEventsV1,
				.esiSkillsReadSkillsV1,
				.esiLocationReadShipTypeV1,
				.esiCharactersWriteContactsV1,
				.esiCharactersReadContactsV1,
				.esiPlanetsManagePlanetsV1,
				.esiSearchSearchStructuresV1,
				.esiLocationReadLocationV1,
//				.esiBookmarksReadCharacterBookmarksV1,
				.esiCharactersReadLoyaltyV1,
				.esiMarketsReadCharacterOrdersV1,
				.esiIndustryReadCharacterJobsV1,
				.esiCharactersReadBlueprintsV1,
			]
		}
	}
}
