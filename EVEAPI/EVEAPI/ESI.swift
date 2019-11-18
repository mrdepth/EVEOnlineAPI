//
//  ESI.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 11/18/19.
//  Copyright © 2019 Artem Shimanski. All rights reserved.
//

import Foundation
import Alamofire

class ESI {
    public enum Server: String {
        case tranquility = "tranquility"
        case singularity = "singularity"
    }

    static let baseURL = "https://esi.evetech.net/latest"
    public let session: Session
    public let token: OAuth2Token?

    public init(token: OAuth2Token, clientID: String, secretKey: String, server: Server = .tranquility) {
        self.token = token
        session = Session(interceptor: OAuth2Interceptor(token: token, clientID: clientID, secretKey: secretKey))
    }
}
