//
//  ESI.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 11/18/19.
//  Copyright © 2019 Artem Shimanski. All rights reserved.
//

import Foundation
import Alamofire
import Combine

public enum ESIError: LocalizedError {
    case imageDecodeFailed
    case internalError
    case server(error: String, ssoStatus: Int?)
    case notFound
    case forbidden
    case invalidFormat(Any.Type, Any)
    case objectSerialization(reason: String)
    case dateFormatError
    
    public var errorDescription: String? {
        switch self {
        case let .server(error, ssoStatus?):
            return String(format: NSLocalizedString("%@ (Status: %d)", comment: ""), error, ssoStatus)
        case let .server(error, nil):
            return error
        default:
            return nil
        }
    }
}

public protocol ESIDelegate: AnyObject {
    func tokenDidRefresh(_ token: OAuth2Token)
    func tokenDidBecomeInvalid(_ token: OAuth2Token)
}


public class ESI: OAuth2InterceptorDelegate {

    public enum Server: String {
        case tranquility = "tranquility"
        case singularity = "singularity"
    }

    static let apiURL = URL(string: "https://esi.evetech.net/latest")!
    static let imagesURL = URL(string: "https://images.evetech.net/")!
    public let session: Session
    public let token: OAuth2Token?
    public let server: Server
    public weak var delegate: ESIDelegate?
	
	public init(server: Server = .tranquility) {
		let interceptor = Interceptor(adapters: [EtagAdapter()], retriers: [])
        session = Session(interceptor: interceptor)
		token = nil
        self.server = server
	}

    public init(token: OAuth2Token, clientID: String, secretKey: String, server: Server = .tranquility) {
        self.token = token
        let oauth2 = OAuth2Interceptor(token: token, clientID: clientID, secretKey: secretKey)
		let interceptor = Interceptor(adapters: [EtagAdapter(), oauth2], retriers: [oauth2])
        session = Session(interceptor: interceptor)
        self.server = server
        oauth2.delegate = self
    }
    
    func tokenDidRefresh(_ token: OAuth2Token) {
        delegate?.tokenDidRefresh(token)
        NotificationCenter.default.post(name: ESI.didRefreshTokenNotification, object: self, userInfo: [ESI.tokenUserInfoKey: token])
    }
    
    func tokenDidBecomeInvalid(_ token: OAuth2Token) {
        delegate?.tokenDidBecomeInvalid(token)
        NotificationCenter.default.post(name: ESI.didInvalidateTokenNotification, object: self, userInfo: [ESI.tokenUserInfoKey: token])
    }
}

extension ESI {
    public static let didRefreshTokenNotification = Notification.Name(rawValue: "com.shimanski.eveapi.didRefreshToken")
    public static let didInvalidateTokenNotification = Notification.Name(rawValue: "com.shimanski.eveapi.didInvaldateToken")
    public static let tokenUserInfoKey: String = "token"
}


extension ESI {
    struct CachePolicyAdapter: RequestInterceptor {
        let cachePolicy: URLRequest.CachePolicy

        func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
            var request = urlRequest
            request.cachePolicy = cachePolicy
            completion(.success(request))
        }
    }
    
    struct EtagAdapter: RequestAdapter {
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

extension ESI {
    public var image: Image {
        Image(esi: self)
    }
    
    public struct Image {
        public struct Size: Equatable {
            let rawValue: Int
            init(_ size: CGSize) {
                let dimension = Int(max(size.width, size.height).rounded(.up))
                let size = Image.Size.allSizes.map{($0, abs($0.rawValue - dimension))}.min{$0.1 < $1.1}?.0 ?? .size1024
                self = size
            }
            
            init(rawValue: Int) {
                self.rawValue = rawValue
            }
            public static let size32 = Size(rawValue: 32)
            public static let size64 = Size(rawValue: 64)
            public static let size128 = Size(rawValue: 128)
            public static let size256 = Size(rawValue: 256)
            public static let size512 = Size(rawValue: 512)
            public static let size1024 = Size(rawValue: 1024)
            public static let allSizes: [Size] = [.size32, .size64, .size128, .size256, .size512, .size1024]

			static func * (lhs: Size, rhs: CGFloat) -> Size {
				let dimension = Int((CGFloat(lhs.rawValue) * rhs).rounded(.up))
                return Image.Size.allSizes.map{($0, abs($0.rawValue - dimension))}.min{$0.1 < $1.1}?.0 ?? .size1024
			}
        }
        
        
        let esi: ESI
        
        public func character(_ id: Int, size: Size, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<UIImage, AFError> {
            return image(ESI.imagesURL.appendingPathComponent("characters/\(id)/portrait"), size: size, cachePolicy: cachePolicy)
        }
        
        public func corporation(_ id: Int, size: Size, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<UIImage, AFError> {
            return image(ESI.imagesURL.appendingPathComponent("corporations/\(id)/logo"), size: size, cachePolicy: cachePolicy)
        }
        
        public func alliance(_ id: Int, size: Size, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<UIImage, AFError> {
            return image(ESI.imagesURL.appendingPathComponent("alliances/\(id)/logo"), size: size, cachePolicy: cachePolicy)
        }
        
        public func type(_ id: Int, size: Size, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<UIImage, AFError> {
            return image(ESI.imagesURL.appendingPathComponent("types/\(id)/render"), size: size, cachePolicy: cachePolicy)
        }
        
        private func image(_ url: URL, size: Size, cachePolicy: URLRequest.CachePolicy) -> AnyPublisher<UIImage, AFError> {
            var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
            components.queryItems = [URLQueryItem(name: "size", value: "\(size.rawValue)")]
            
            let session = esi.session
            return Deferred {
                session.request(components, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
                    .publishData()
                    .tryMap{try $0.result.get()}
                    .tryMap { data -> UIImage in
                        guard let image = UIImage(data: data) else {throw AFError.responseSerializationFailed(reason: AFError.ResponseSerializationFailureReason.decodingFailed(error: ESIError.imageDecodeFailed))}
                        return image
                }
                .mapError{$0 as! AFError}
                .handleEvents(receiveCompletion: { (_) in
                    withExtendedLifetime(session) {}
                })
            }.eraseToAnyPublisher()
        }
    }
}

protocol DateFormatted {
    var dateFormatter: DateFormatter? {get}
}

extension ESI {
    
    public struct Scope: Hashable {
        public let rawValue: String
        public init(_ rawValue: String) {
            self.rawValue = rawValue
        }
    }
    
    public static let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .custom { decoder -> Date in
            if let formatter = (decoder.codingPath.last as? DateFormatted)?.dateFormatter {
                guard let date = try formatter.date(from: decoder.singleValueContainer().decode(String.self)) else {throw ESIError.dateFormatError}
                return date
            }
            else {
                return try Date(from: decoder)
            }
        }
        
        return decoder
    }()
}

struct BodyDataEncoding: ParameterEncoding {
    let data: Data
    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var request = try urlRequest.asURLRequest()
        request.httpBody = data
        return request
    }
}


//extension ESI {
//    var character1: Characters {
//        Characters(esi: self, route: .root(ESI.apiURL))
//    }
//    struct Characters {
//        var esi: ESI
//        let route: Route
//
//        func characterID(_ value: Int) -> CharacterID {
//            CharacterID(esi: esi, route: .parameter(value, next: route))
//        }
//
//        public struct CharacterID {
//            let esi: ESI
//            let route: Route
//
//            public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Character.Information, AFError> {
//
//
//                let body: Data? = nil
//
//                var headers = HTTPHeaders()
//                headers["Accept"] = "application/json"
//
//
//                var query = [URLQueryItem]()
//                query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
//
//
//                do {
//                    let url = try route.asURL()
//                    var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
//                    components.queryItems = query
//
//                    return esi.session.publisher(components,
//                                                 method: .get,
//                                                 encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
//                                                 headers: headers,
//                                                 interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
//                        .responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
//                        .eraseToAnyPublisher()
//
//                }
//                catch {
//                    return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
//                }
//
//            }
//        }
//
//
//    }
//}

extension ESI {
    indirect enum APIRoute: URLConvertible {
        func asURL() throws -> URL {
            switch self {
            case let .root(url):
                return url
            case let .path(path, next):
                return try next.asURL().appendingPathComponent(path)
            case let .parameter(value, next: next):
                return try next.asURL().appendingPathComponent(String(describing: value))
            }
        }
        
        case root(URL)
        case path(String, next: APIRoute)
        case parameter(CustomStringConvertible, next: APIRoute)
    }
}
