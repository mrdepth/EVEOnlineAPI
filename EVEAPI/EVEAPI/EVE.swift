//
//  EVE.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 30.04.17.
//  Copyright © 2017 Artem Shimanski. All rights reserved.
//

import Foundation
import Alamofire

enum EVEError: Error {
	case invalidRequest(URLRequest)
	case internalError
	case network(error: Error)
	case objectSerialization(reason: String)
	case serialization(error: Error)
	case unauthorized(reason: String)
	case server(exceptionType: String, reason: String?)
	case notFound
	case forbidden
	case invalidFormat(Any.Type, Any)
}

extension Dictionary where Key == String {
	func rowset(name: String) -> [Any]? {
		guard let item = self["rowset"] else {return nil}
		let rowset: [String: Any]?
		if let array = item as? [Any] {
			rowset = array.first { ($0 as? [String: Any])?["name"] as? String == name } as? [String: Any]
		}
		else if let dic = item as? [String: Any], dic["name"] as? String == name {
			rowset = dic
		}
		else {
			rowset = nil
		}
		guard let rows = rowset?["row"] else {return []}
		if let rows = rows as? [Any] {
			return rows
		}
		else {
			return [rows]
		}
	}
}

public class EVE: SessionManager {
	let baseURL = "https://api.eveonline.com/"
	
	public init(token: OAuth2Token? = nil, clientID: String? = nil, secretKey: String? = nil, server: ESServer = .tranquility, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, adapter: OAuth2Helper? = nil, retrier: OAuth2Retrier? = nil) {

		let configuration = URLSessionConfiguration.default
		configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
		configuration.requestCachePolicy = cachePolicy
		
		super.init(configuration: configuration)
		
		if let token = token, let clientID = clientID, let secretKey = secretKey {
			self.adapter = adapter ?? OAuth2EVEAdapter(token: token)
			self.retrier = retrier ?? OAuth2Retrier(token: token, clientID: clientID, secretKey: secretKey)
		}
	}
	
	
	public class func initialize() {
		loadClassess()
	}
	
}

extension DataRequest {
	
	
	@discardableResult
	public func validateEVE() -> Self {
		var statusCode = IndexSet(200..<300)
		statusCode.insert(403)
		
		return validate(statusCode: statusCode).validate() {(request, response, data) -> ValidationResult in
			if response.statusCode == 403 {
				guard let data = data,
					let value = (try? XMLParser.xmlObject(data: data)) as? [String: Any],
					let error = ((value["eveapi"] as? [String:Any])?["error"] as? [String: Any])?["code"] as? Int,
					error == 224
				else { return .failure(AFError.responseValidationFailed(reason: .unacceptableStatusCode(code: 403)))}
				return .failure(OAuth2Error.tokenExpired)
			}
			else {
				return .success
			}
		}
	}
	
	
	@discardableResult
	public func responseEVE<T: JSONCoding>(queue: DispatchQueue? = nil,
	                        options: JSONSerialization.ReadingOptions = .allowFragments,
	                        completionHandler: @escaping (DataResponse<T>) -> Void) -> Self
	{
		let serializer = DataResponseSerializer<T> { (request, response, data, error) -> Result<T> in
			do {
				guard let data = data,
				let value = try XMLParser.xmlObject(data: data) as? [String: Any],
				let result = (value["eveapi"] as? [String: Any])?["result"] else {throw EVEError.objectSerialization(reason: "No XML Data")}
				return .success(try T(json: result))
			}
			catch {
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

public class OAuth2EVEAdapter: OAuth2Helper {
	
	override public func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
		guard let url = urlRequest.url,
			var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {throw EVEError.invalidRequest(urlRequest)}
		var queryItems = components.queryItems ?? []
		let accessToken = URLQueryItem(name: "accessToken", value: token.accessToken)
		if let i = queryItems.index(where: {$0.name == "accessToken"}) {
			queryItems[i] = accessToken
		}
		else {
			queryItems.append(accessToken)
		}
		components.queryItems = queryItems
		var request = urlRequest
		request.url = components.url
		return request
	}
}
