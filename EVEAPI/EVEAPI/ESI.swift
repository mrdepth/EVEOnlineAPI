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
	
	public init(token: OAuth2Token? = nil, clientID: String? = nil, secretKey: String? = nil, server: ESServer = .tranquility, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) {
		self.server = server
		let configuration = URLSessionConfiguration.default
		configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
		configuration.requestCachePolicy = cachePolicy
		
		super.init(configuration: configuration)
		
		if let token = token, let clientID = clientID, let secretKey = secretKey {
			let handler = OAuth2Handler(token: token, clientID: clientID, secretKey: secretKey)
			self.adapter = handler
			self.retrier = handler
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
