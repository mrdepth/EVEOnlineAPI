//
//  ZKillboard.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 26.06.17.
//  Copyright © 2017 Artem Shimanski. All rights reserved.
//

import Foundation
import Alamofire
import Futures

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
	
	var sessionManager = Session()
	
	public init() {
		
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
	
	public func kills(filter: [Filter], page: Int?, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> Future<ESI.Result<[Killmail]>> {
		let promise = Promise<ESI.Result<[Killmail]>>()
		guard filter.count > 1 else {
			try! promise.fail(ZKillboardError.notFound)
			return promise.future
		}
		var args = filter.map {$0.value}
		if let page = page {
			args.append("page/\(page)")
		}
		
		let url = baseURL
		
		let progress = Progress(totalUnitCount: 100)
		
		request(url + args.joined(separator: "/") + "/", method: .get, cachePolicy: cachePolicy).downloadProgress { p in
			progress.completedUnitCount = Int64(p.fractionCompleted * 100)
		}.validate().responseZKillboard { (response: DataResponse<[Killmail]>) in
			promise.set(response: response, cached: 600.0)
		}
		return promise.future
	}
	
}

extension DataRequest {
	
	
	@discardableResult
	public func responseZKillboard<T: Decodable>(queue: DispatchQueue? = nil,
	                        completionHandler: @escaping (DataResponse<T>) -> Void) -> Self
	{
		let decoder = JSONDecoder()
		decoder.dateDecodingStrategy = .formatted(ZKillboard.dateFormatter)
		return responseJSONDecodable(queue: queue, decoder: decoder, completionHandler: completionHandler)
	}
}


extension ZKillboard {
	
	public enum Sorting {
		case ascending
		case descending
	}
	
	fileprivate static let dateFormatter: DateFormatter = {
		return DateFormatter.esiDateTimeFormatter
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
			case let .startTime(date):
				return "startTime/\(dateFormatter.string(from: date))"
			case let .endTime(date):
				return "endTime/\(dateFormatter.string(from: date))"
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
			}
		}
	}
	
	

	public struct Killmail: Codable, Hashable {
		
		public var killmailID: Int64
		public var fittedValue: Double?
		public var hash: String
		public var locationID: Int
		public var points: Int
		public var totalValue: Double?
		public var npc: Bool
		public var solo: Bool
		public var awox: Bool
		
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
		
		public init(from decoder: Decoder) throws {
			let container = try decoder.container(keyedBy: CodingKeys.self)
			killmailID = try container.decode(Int64.self, forKey: .killmailID)
			let zkb = try container.nestedContainer(keyedBy: ZKBCodingKeys.self, forKey: .zkb)
			
			fittedValue = try zkb.decodeIfPresent(Double.self, forKey: .fittedValue)
			hash = try zkb.decode(String.self, forKey: .hash)
			locationID = try zkb.decode(Int.self, forKey: .locationID)
			points = try zkb.decode(Int.self, forKey: .points)
			totalValue = try zkb.decodeIfPresent(Double.self, forKey: .totalValue)
			npc = try zkb.decode(Bool.self, forKey: .npc)
			solo = try zkb.decode(Bool.self, forKey: .solo)
			awox = try zkb.decode(Bool.self, forKey: .awox)
		}
		
		public func encode(to encoder: Encoder) throws {
			var container = encoder.container(keyedBy: CodingKeys.self)
			try container.encode(killmailID, forKey: .killmailID)
			
			var zkb = container.nestedContainer(keyedBy: ZKBCodingKeys.self, forKey: .zkb)
			try zkb.encodeIfPresent(fittedValue, forKey: .fittedValue)
			try zkb.encode(hash, forKey: .hash)
			try zkb.encode(locationID, forKey: .locationID)
			try zkb.encode(points, forKey: .points)
			try zkb.encodeIfPresent(totalValue, forKey: .totalValue)
			try zkb.encode(npc, forKey: .npc)
			try zkb.encode(solo, forKey: .solo)
			try zkb.encode(awox, forKey: .awox)
		}
	}

}

