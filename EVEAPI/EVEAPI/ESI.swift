//
//  ESI.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 11/18/19.
//  Copyright © 2019 Artem Shimanski. All rights reserved.
//

import Foundation
import Alamofire

public class ESI {
    public enum Server: String {
        case tranquility = "tranquility"
        case singularity = "singularity"
    }

    static let baseURL = "https://esi.evetech.net/latest"
    public let session: Session
    public let token: OAuth2Token?
	
	public init(server: Server = .tranquility) {
		let interceptor = Interceptor(adapters: [CachePolicyAdapter()], retriers: [])
        session = Session(interceptor: interceptor)
		token = nil
	}

    public init(token: OAuth2Token, clientID: String, secretKey: String, server: Server = .tranquility) {
        self.token = token
		let oauth2 = OAuth2Interceptor(token: token, clientID: clientID, secretKey: secretKey)
		let interceptor = Interceptor(adapters: [CachePolicyAdapter(), oauth2], retriers: [oauth2])
        session = Session(interceptor: interceptor)
    }
	
	struct CachePolicyAdapter: RequestAdapter {
		let cache: URLCache = .shared
		func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
			guard (urlRequest.cachePolicy != .reloadIgnoringLocalCacheData && urlRequest.cachePolicy != .reloadIgnoringLocalAndRemoteCacheData),
				let cachedResponse = cache.cachedResponse(for: urlRequest)?.response as? HTTPURLResponse,
				let etag = cachedResponse.allHeaderFields["Etag"] as? String else {
					completion(.success(urlRequest))
					return
			}
			var request = urlRequest
			request.setValue(etag, forHTTPHeaderField: "If-None-Match")
			completion(.success(request))
		}
		
		
	}
}
