//
//  ESI.swift
//  Test
//
//  Created by Artem Shimanski on 09.04.17.
//  Copyright © 2017 Artem Shimanski. All rights reserved.
//

import Foundation
import Alamofire
import Futures

struct RequestConvertible: URLRequestConvertible {
	let url: URLConvertible
	let method: HTTPMethod
	let parameters: Parameters?
	let encoding: ParameterEncoding
	let headers: HTTPHeaders?
	let cachePolicy: URLRequest.CachePolicy
	
	func asURLRequest() throws -> URLRequest {
		var request = try URLRequest(url: url, method: method, headers: headers)
		request.cachePolicy = cachePolicy
		return try encoding.encode(request, with: parameters)
	}
}

struct Weak<T: AnyObject> {
	typealias Value = T
	private(set) weak var value: T?
	init(_ value: T?) {
		self.value = value
	}
}

public class ESI {
	
	public struct Result<Value> {
		public var value: Value
		public var expires: Date?
		
		public init(value: Value, expires: Date?) {
			self.value = value
			self.expires = expires
		}
	}
	
	private static var helpers: [String: Weak<OAuth2Helper>] = [:]
	private static let helpersLock = NSLock()

	fileprivate class CachePolicyAdapter: RequestAdapter {
		let next: RequestAdapter?
		init(next: RequestAdapter?) {
			self.next = next
		}
		
		public func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
			guard (urlRequest.cachePolicy != .reloadIgnoringLocalCacheData && urlRequest.cachePolicy != .reloadIgnoringLocalAndRemoteCacheData),
				let cachedResponse = URLCache.shared.cachedResponse(for: urlRequest)?.response as? HTTPURLResponse,
				let etag = cachedResponse.allHeaderFields["Etag"] as? String else {
					return try next?.adapt(urlRequest) ?? urlRequest
			}
			var request = urlRequest
			request.setValue(etag, forHTTPHeaderField: "If-None-Match")
			return try next?.adapt(request) ?? request
		}
	}

	
	public enum Server: String {
		case tranquility = "tranquility"
		case singularity = "singularity"
	}

	let baseURL = "https://esi.tech.ccp.is"
	let server: Server
	var sessionManager: SessionManager!
	
	public init(token: OAuth2Token? = nil, clientID: String? = nil, secretKey: String? = nil, server: Server = .tranquility) {
		self.server = server

		
		if let token = token, let clientID = clientID, let secretKey = secretKey {
			ESI.helpersLock.lock(); defer {ESI.helpersLock.unlock()}
			let helper = ESI.helpers[token.refreshToken]?.value ?? {
				let helper = OAuth2Helper(token: token, clientID: clientID, secretKey: secretKey)
				ESI.helpers[token.refreshToken] = Weak(helper)
				return helper
			}()
			sessionManager = SessionManager(adapter: CachePolicyAdapter(next: helper), retrier: helper)
		}
		else {
			sessionManager = SessionManager(adapter: CachePolicyAdapter(next: nil))
		}
	}
	
	public var token: OAuth2Token? {
		return (sessionManager.retrier as? OAuth2Helper)?.token
	}
	
	deinit {
		if let token = self.token {
			sessionManager = nil
			if ESI.helpers[token.refreshToken]?.value == nil {
				ESI.helpers[token.refreshToken] = nil
			}
		}
	}
	
	open func request(_ url: URLConvertible,
					  method: HTTPMethod = .get,
					  parameters: Parameters? = nil,
					  encoding: ParameterEncoding = URLEncoding.default,
					  headers: HTTPHeaders? = nil,
					  cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> DataRequest {
		let convertible = RequestConvertible(url: url,
											 method: method,
											 parameters: parameters,
											 encoding: encoding,
											 headers: headers,
											 cachePolicy: cachePolicy)
		return sessionManager.request(convertible)
	}
	
	@discardableResult
	public func image(characterID: Int, dimension: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<Data>> {
		let dimensions = [32, 64, 128, 256, 512, 1024]
		var bestDimension = dimensions.last!
		for d in dimensions {
			if d >= dimension {
				bestDimension = d
				break
			}
		}
		
		let promise = Promise<ESI.Result<Data>>()
		request("https://imageserver.eveonline.com/Character/\(characterID)_\(bestDimension).jpg", cachePolicy: cachePolicy).validate().responseData { response in
			promise.set(response: response, cached: 3600 * 12)
		}
		return promise.future
	}
	
	public func image(corporationID: Int, dimension: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<Data>> {
		let dimensions = [32, 64, 128, 256]
		var bestDimension = dimensions.last!
		for d in dimensions {
			if d >= dimension {
				bestDimension = d
				break
			}
		}
		
		let promise = Promise<ESI.Result<Data>>()
		request("https://imageserver.eveonline.com/Corporation/\(corporationID)_\(bestDimension).png", cachePolicy: cachePolicy).validate().responseData { response in
			promise.set(response: response, cached: 3600 * 12)
		}
		return promise.future
	}
	
	public func image(allianceID: Int, dimension: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<Data>> {
		let dimensions = [32, 64, 128]
		var bestDimension = dimensions.last!
		for d in dimensions {
			if d >= dimension {
				bestDimension = d
				break
			}
		}
		
		let promise = Promise<ESI.Result<Data>>()
		request("https://imageserver.eveonline.com/Alliance/\(allianceID)_\(bestDimension).png", cachePolicy: cachePolicy).validate().responseData { response in
			promise.set(response: response, cached: 3600 * 12)
		}
		return promise.future
	}
	
	public func image(typeID: Int, dimension: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<Data>> {
		let dimensions = [32, 64, 128, 256, 512]
		var bestDimension = dimensions.last!
		for d in dimensions {
			if d >= dimension {
				bestDimension = d
				break
			}
		}
		
		let promise = Promise<ESI.Result<Data>>()
		request("https://imageserver.eveonline.com/Render/\(typeID)_\(bestDimension).png", cachePolicy: cachePolicy).validate().responseData { response in
			promise.set(response: response, cached: 3600 * 12)
		}
		return promise.future
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
	
	class NumberResponseSerializer {

		func number(request: URLRequest?, response: HTTPURLResponse?, data: Data?, error: Error?) throws -> NSDecimalNumber {
			guard error == nil else { throw error! }
			
			guard let validData = data,
				let s = String(data: validData, encoding: .utf8),
				let number = Decimal(string: s, locale: nil), !validData.isEmpty else {
				throw AFError.responseSerializationFailed(reason: .inputDataNilOrZeroLength)
			}
			return NSDecimalNumber(decimal: number)
		}
	}
	
	final class DoubleResponseSerializer: NumberResponseSerializer, DataResponseSerializerProtocol {
		public typealias SerializedObject = Double
		
		public func serialize(request: URLRequest?, response: HTTPURLResponse?, data: Data?, error: Error?) throws -> Double {
			return try number(request: request, response: response, data: data, error: error).doubleValue
		}
	}
	
	final class FloatResponseSerializer: NumberResponseSerializer, DataResponseSerializerProtocol {
		public typealias SerializedObject = Float
		
		public func serialize(request: URLRequest?, response: HTTPURLResponse?, data: Data?, error: Error?) throws -> Float {
			return try number(request: request, response: response, data: data, error: error).floatValue
		}
	}

	final class IntResponseSerializer: NumberResponseSerializer, DataResponseSerializerProtocol {
		public typealias SerializedObject = Int
		
		public func serialize(request: URLRequest?, response: HTTPURLResponse?, data: Data?, error: Error?) throws -> Int {
			return try number(request: request, response: response, data: data, error: error).intValue
		}
	}

	final class Int64ResponseSerializer: NumberResponseSerializer, DataResponseSerializerProtocol {
		public typealias SerializedObject = Int64
		
		public func serialize(request: URLRequest?, response: HTTPURLResponse?, data: Data?, error: Error?) throws -> Int64 {
			return try number(request: request, response: response, data: data, error: error).int64Value
		}
	}

	
	@discardableResult
	public func validateESI() -> Self {
		let statusCode = IndexSet(200..<300)
		
		return validate() {(request, response, data) -> ValidationResult in
			if statusCode.contains(response.statusCode) {
				return .success(Void())
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
					return .success(Void())
				}
			}
		}.validate(statusCode: statusCode)
	}
	

	@discardableResult
	public func responseESI<T: Decodable>(queue: DispatchQueue? = nil,
		completionHandler: @escaping (DataResponse<T>) -> Void)
		-> Self {
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
	}
	
	@discardableResult
	public func responseESI(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<Double>) -> Void)
		-> Self {
			return response(queue: queue, responseSerializer: DoubleResponseSerializer(), completionHandler: completionHandler)
	}
	
	@discardableResult
	public func responseESI(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<Float>) -> Void)
		-> Self {
			return response(queue: queue, responseSerializer: FloatResponseSerializer(), completionHandler: completionHandler)
	}

	@discardableResult
	public func responseESI(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<Int>) -> Void)
		-> Self {
			return response(queue: queue, responseSerializer: IntResponseSerializer(), completionHandler: completionHandler)
	}

	@discardableResult
	public func responseESI(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<Int64>) -> Void)
		-> Self {
			return response(queue: queue, responseSerializer: Int64ResponseSerializer(), completionHandler: completionHandler)
	}

}

public extension ESI.Scope {

	public static var `default`: [ESI.Scope]  {
		get {
			return [
				.esiClonesReadClonesV1,
				.esiFittingsWriteFittingsV1,
				.esiCharactersReadStandingsV1,
				.esiUniverseReadStructuresV1,
				.esiMarketsStructureMarketsV1,
				.esiMailReadMailV1,
				.esiSkillsReadSkillqueueV1,
				.esiAssetsReadAssetsV1,
				.esiCalendarRespondCalendarEventsV1,
				.esiKillmailsReadKillmailsV1,
				.esiMailSendMailV1,
				.esiMailOrganizeMailV1,
				.esiWalletReadCharacterWalletV1,
				.esiFittingsReadFittingsV1,
				.esiCalendarReadCalendarEventsV1,
				.esiSkillsReadSkillsV1,
				.esiLocationReadShipTypeV1,
				.esiPlanetsManagePlanetsV1,
				.esiSearchSearchStructuresV1,
				.esiLocationReadLocationV1,
				.esiCharactersReadLoyaltyV1,
				.esiMarketsReadCharacterOrdersV1,
				.esiIndustryReadCharacterJobsV1,
				.esiCharactersReadBlueprintsV1,
				.esiContractsReadCharacterContractsV1,
				.esiClonesReadImplantsV1,

				.esiAssetsReadCorporationAssetsV1,
				.esiContractsReadCorporationContractsV1,
				.esiCorporationsReadBlueprintsV1,
				.esiCorporationsReadDivisionsV1,
				.esiIndustryReadCorporationJobsV1,
				.esiKillmailsReadCorporationKillmailsV1,
				.esiMarketsReadCorporationOrdersV1,
				.esiWalletReadCorporationWalletsV1
			]
		}
	}
}
