//
//  ESI.swift
//  Test
//
//  Created by Artem Shimanski on 09.04.17.
//  Copyright © 2017 Artem Shimanski. All rights reserved.
//

import Foundation
import Alamofire

struct Weak<T: AnyObject> {
	typealias Value = T
	private(set) weak var value: T?
	init(_ value: T?) {
		self.value = value
	}
}


fileprivate class LoadBalancer {
	let maxConcurentRequestsCount = 1
	static let shared = LoadBalancer()
	var queue: [DataRequest] = []
	var active: [DataRequest] = []
	private var lock = NSLock()
	
	func add(_ request: DataRequest) {
		lock.lock()
		queue.append(request)
		lock.unlock()
		dispatch()
	}
	
	private func dispatch() {
		lock.lock(); defer {lock.unlock()}
		guard !queue.isEmpty && active.count < maxConcurentRequestsCount else {return}
		let request = queue.removeFirst()
		active.append(request)
		request.response { [weak self, weak request] _ in
			guard let strongSelf = self else {return}
			strongSelf.lock.lock()
			if let i = strongSelf.active.index(where: {$0 === request}) {
				strongSelf.active.remove(at: i)
			}
			strongSelf.lock.unlock()
			strongSelf.dispatch()
		}
		request.resume()
	}
}

public class ESI: SessionManager {
	
	private static var helpers: [String: Weak<OAuth2Helper>] = [:]
	private static let helpersLock = NSLock()

	fileprivate class CachePolicyAdapter: RequestAdapter {
		let cachePolicy: URLRequest.CachePolicy
		let next: RequestAdapter?
		init(cachePolicy: URLRequest.CachePolicy, next: RequestAdapter?) {
			self.cachePolicy = cachePolicy
			self.next = next
		}
		
		public func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
			var request = urlRequest
			request.cachePolicy = cachePolicy
			return try next?.adapt(request) ?? request
		}
	}

	
	public enum Server: String {
		case tranquility = "tranquility"
		case singularity = "singularity"
	}

	let baseURL = "https://esi.tech.ccp.is"
	let server: Server
	
	public init(token: OAuth2Token? = nil, clientID: String? = nil, secretKey: String? = nil, server: Server = .tranquility, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) {
		self.server = server
		let configuration = URLSessionConfiguration.default
		configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
		configuration.requestCachePolicy = cachePolicy
		
		super.init(configuration: configuration)
		
		if let token = token, let clientID = clientID, let secretKey = secretKey {
			ESI.helpersLock.lock(); defer {ESI.helpersLock.unlock()}
			let helper = ESI.helpers[token.refreshToken]?.value ?? {
				let helper = OAuth2Helper(token: token, clientID: clientID, secretKey: secretKey)
				ESI.helpers[token.refreshToken] = Weak(helper)
				return helper
			}()
			adapter = helper
			retrier = helper
		}
		startRequestsImmediately = false
	}
	
	deinit {
		if let token = (adapter as? OAuth2Helper)?.token {
			adapter = nil
			retrier = nil
			if ESI.helpers[token.refreshToken]?.value == nil {
				ESI.helpers[token.refreshToken] = nil
			}
		}
	}
	
	@discardableResult
	open override func request(
		_ url: URLConvertible,
		method: HTTPMethod = .get,
		parameters: Parameters? = nil,
		encoding: ParameterEncoding = URLEncoding.default,
		headers: HTTPHeaders? = nil)
		-> DataRequest
	{
		let request = super.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
		LoadBalancer.shared.add(request)
		return request
	}
	
//	public class func initialize() {
//		loadClassess()
//	}
//
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

	public struct Scope: Hashable {

		public let rawValue: String
		
		public init(_ value: String) {
			rawValue = value
		}
		
		public var hashValue: Int {
			return rawValue.hashValue
		}
		
		public static func ==(lhs: ESI.Scope, rhs: ESI.Scope) -> Bool {
			return lhs.rawValue == rhs.rawValue
		}
	
	}
}

struct SSOError: Codable {
	var error: String?
	var status: Int?
	
	enum CodingKeys: String, CodingKey {
		case error
		case status = "sso_status"
	}
}

extension DataRequest {
	
	
	@discardableResult
	public func validateESI() -> Self {
		let statusCode = IndexSet(200..<300)
		
		return validate() {(request, response, data) -> ValidationResult in
			if statusCode.contains(response.statusCode) {
				return .success
			}
			else {
				let error: SSOError? = {
					guard let data = data else {return nil}
					return try? JSONDecoder().decode(SSOError.self, from: data)
				}()
				
				switch (response.statusCode, error?.error, error?.status) {
				case (403, "expired"?, _), (403, _, 400?):
					return .failure(OAuth2Error.tokenExpired)
				case let (_, error?, status):
					return .failure(ESIError.server(error: error, ssoStatus: status))
				default:
					return .success
				}
			}
		}.validate(statusCode: statusCode)
	}
	

	@discardableResult
	public func responseESI<T: Decodable>(queue: DispatchQueue? = nil,
		completionHandler: @escaping (DataResponse<T>) -> Void)
		-> Self
	{
		let decoder = JSONDecoder()
		decoder.dateDecodingStrategy = .custom { (decoder) -> Date in
			if let formatter = (decoder.codingPath.last as? DateFormatted)?.dateFormatter {
				guard let date = try formatter.date(from: decoder.singleValueContainer().decode(String.self)) else {throw ESIError.dateFormatError}
				return date
			}
			else {
				return try Date(from: decoder)
			}
		}
		
		return responseJSONDecodable(queue: queue, decoder: decoder, completionHandler: completionHandler)
		/*let serializer = DataResponseSerializer<T> { (request, response, data, error) -> Result<T> in
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
		)*/
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
//				.characterClonesRead,
//				.characterIndustryJobsRead,
//				.characterMarketOrdersRead,
//				.characterSkillsRead,
//				.characterContractsRead,
//				.characterStatsRead,
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
//				.esiMailOrganizeMailV1,
				.esiKillmailsReadKillmailsV1,
				.esiMailSendMailV1,
				.esiMailOrganizeMailV1,
				.esiWalletReadCharacterWalletV1,
//				.esiCharactersReadAgentsResearchV1,
				.esiFittingsReadFittingsV1,
				.esiCalendarReadCalendarEventsV1,
				.esiSkillsReadSkillsV1,
				.esiLocationReadShipTypeV1,
//				.esiCharactersWriteContactsV1,
//				.esiCharactersReadContactsV1,
				.esiPlanetsManagePlanetsV1,
				.esiSearchSearchStructuresV1,
				.esiLocationReadLocationV1,
//				.esiBookmarksReadCharacterBookmarksV1,
				.esiCharactersReadLoyaltyV1,
				.esiMarketsReadCharacterOrdersV1,
				.esiIndustryReadCharacterJobsV1,
				.esiCharactersReadBlueprintsV1,
				.esiContractsReadCharacterContractsV1,
				
				.esiClonesReadImplantsV1,

			]
		}
	}
}
