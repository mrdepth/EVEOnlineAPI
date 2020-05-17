//
//  ZKillboard.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 26.06.17.
//  Copyright © 2017 Artem Shimanski. All rights reserved.
//

import Foundation
import Alamofire
import Combine

enum ZKillboardError: Error {
	case invalidRequest(URLRequest)
	case internalError
	case network(error: Error)
	case objectSerialization(reason: String)
	case serialization(error: Error)
	case notFound
	case invalidFormat(Any.Type, Any)
}

extension DateFormatter {
	static var zKillboardDateFormatter: DateFormatter {
		return .esiDateTimeFormatter
//		let dateFormatter = DateFormatter()
//		dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//		dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
//		dateFormatter.locale = Locale(identifier: "en_US_POSIX")
//		return dateFormatter
	}
}


public class ZKillboard {
	let baseURL = "https://zkillboard.com/api/"
	
	public let session: Session
    
	public init() {
        let interceptor = Interceptor(adapters: [ESI.EtagAdapter()], retriers: [])
        session = Session(interceptor: interceptor)
	}
}

extension ZKillboard {
    public struct Kills {
        let zKillboard: ZKillboard
        
        public func get(filter: [Filter], page: Int?, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ZKillboard.Killmail]>, AFError>{
            var args = filter.map {$0.value}
            if let page = page, page > 1 {
                args.append("page/\(page)")
            }
            
            let url = zKillboard.baseURL + args.joined(separator: "/") + "/"
            
            let session = zKillboard.session
            
            return Deferred { () -> AnyPublisher<ESIResponse<[ZKillboard.Killmail]>, AFError> in
                var request = session.request(url, method: .get, encoding: URLEncoding.default, interceptor: ESI.CachePolicyAdapter(cachePolicy: cachePolicy))
                
                if let progress = progress {
                    request = request.downloadProgress(closure: progress)
                }
                
                return request.publishDecodable(type: Killmails.self, queue: session.serializationQueue, decoder: ESI.jsonDecoder)
                    .tryMap { response in
                        try ESIResponse(value: response.result.get().records, httpHeaders: response.response?.headers)
                }
                .mapError{$0 as! AFError}
                .handleEvents(receiveCompletion: { (_) in
                    withExtendedLifetime(session) {}
                }).eraseToAnyPublisher()
            }.eraseToAnyPublisher()
        }
    }
    
    public var kills: Kills {
        Kills(zKillboard: self)
    }
}

extension ZKillboard {
	
	public enum Sorting {
		case ascending
		case descending
	}
	
    fileprivate static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMddHHmm00"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        return dateFormatter
    }()
	
	public enum Filter {
		case characterID([Int64])
		case corporationID([Int64])
		case allianceID([Int64])
		case factionID([Int64])
		case shipTypeID([Int])
		case groupID([Int])
		case solarSystemID([Int])
		case regionID([Int])
		case warID([Int])
		case iskValue(Int64)
        case startTime(Date)
        case endTime(Date)
		case noItems
		case noAttackers
		case zkbOnly
		case kills
		case losses
		case wSpace
		case solo
		case finalBlowOnly
		
		public var value: String {
			switch self {
			case let .characterID(id):
				return "characterID/\(id.map{String($0)}.joined(separator: ","))"
			case let .corporationID(id):
				return "corporationID/\(id.map{String($0)}.joined(separator: ","))"
			case let .allianceID(id):
				return "allianceID/\(id.map{String($0)}.joined(separator: ","))"
			case let .factionID(id):
				return "factionID/\(id.map{String($0)}.joined(separator: ","))"
			case let .shipTypeID(id):
				return "shipTypeID/\(id.map{String($0)}.joined(separator: ","))"
			case let .groupID(id):
				return "groupID/\(id.map{String($0)}.joined(separator: ","))"
			case let .solarSystemID(id):
				return "solarSystemID/\(id.map{String($0)}.joined(separator: ","))"
			case let .regionID(id):
				return "regionID/\(id.map{String($0)}.joined(separator: ","))"
			case let .warID(id):
				return "warID/\(id.map{String($0)}.joined(separator: ","))"
			case let .iskValue(id):
				return "iskValue/\(id)"
//            case let .startTime(date):
//                return "startTime/\(dateFormatter.string(from: date))"
//            case let .endTime(date):
//                return "endTime/\(dateFormatter.string(from: date))"
			case .noItems:
				return "no-items"
			case .noAttackers:
				return "no-attackers"
			case .zkbOnly:
				return "zkbOnly"
			case .kills:
				return "kills"
			case .losses:
				return "losses"
			case .wSpace:
				return "w-space"
			case .solo:
				return "solo"
			case .finalBlowOnly:
				return "finalblow-only"
            case let .startTime(date):
                return "startTime/\(ZKillboard.dateFormatter.string(from: date))"
            case let .endTime(date):
                return "endTime/\(ZKillboard.dateFormatter.string(from: date))"
			}
		}
	}
    
    public struct Killmail: Hashable {
        public var killmailID: Int64
        public var hash: String
    }

    private struct Killmails: Decodable, Hashable {
        var records: [Killmail]
        
        struct Record: CodingKey {
            var stringValue: String
            
            init?(stringValue: String) {
                self.stringValue = stringValue
                self.intValue = nil
            }
            
            var intValue: Int?
            
            init?(intValue: Int) {
                self.intValue = intValue
                self.stringValue = "\(intValue)"
            }
            
            
        }
        
        init(from decoder: Decoder) throws {
            do {
                let container = try decoder.singleValueContainer()
                let killmails = try container.decode([ZKBKillmail].self)
                records = killmails.map{Killmail(killmailID: $0.killmailID, hash: $0.hash)}
            }
            catch {
                let container = try decoder.singleValueContainer()
                records = try container.decode([Int: String].self).sorted{$0.key > $1.key}.map{Killmail(killmailID: Int64($0.key), hash: $0.value)}
            }
        }
    }

	private struct ZKBKillmail: Codable, Hashable {
		
		var killmailID: Int64
		var fittedValue: Double?
		var hash: String
		var locationID: Int?
		var points: Int
		var totalValue: Double?
		var npc: Bool
		var solo: Bool
		var awox: Bool
		
		enum CodingKeys: String, CodingKey {
			case killmailID = "killmail_id"
			case zkb
		}
		
		enum ZKBCodingKeys: String, CodingKey {
			case fittedValue
			case hash
			case locationID
			case points
			case totalValue
			case npc
			case solo
			case awox
		}
		
		init(from decoder: Decoder) throws {
			let container = try decoder.container(keyedBy: CodingKeys.self)
			killmailID = try container.decode(Int64.self, forKey: .killmailID)
			let zkb = try container.nestedContainer(keyedBy: ZKBCodingKeys.self, forKey: .zkb)
			
			fittedValue = try zkb.decodeIfPresent(Double.self, forKey: .fittedValue)
			hash = try zkb.decode(String.self, forKey: .hash)
			locationID = try zkb.decodeIfPresent(Int.self, forKey: .locationID)
			points = try zkb.decode(Int.self, forKey: .points)
			totalValue = try zkb.decodeIfPresent(Double.self, forKey: .totalValue)
			npc = try zkb.decode(Bool.self, forKey: .npc)
			solo = try zkb.decode(Bool.self, forKey: .solo)
			awox = try zkb.decode(Bool.self, forKey: .awox)
		}
		
		func encode(to encoder: Encoder) throws {
			var container = encoder.container(keyedBy: CodingKeys.self)
			try container.encode(killmailID, forKey: .killmailID)
			
			var zkb = container.nestedContainer(keyedBy: ZKBCodingKeys.self, forKey: .zkb)
			try zkb.encodeIfPresent(fittedValue, forKey: .fittedValue)
			try zkb.encode(hash, forKey: .hash)
			try zkb.encodeIfPresent(locationID, forKey: .locationID)
			try zkb.encode(points, forKey: .points)
			try zkb.encodeIfPresent(totalValue, forKey: .totalValue)
			try zkb.encode(npc, forKey: .npc)
			try zkb.encode(solo, forKey: .solo)
			try zkb.encode(awox, forKey: .awox)
		}
	}

}

