//
//  ZKillboard.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 26.06.17.
//  Copyright © 2017 Artem Shimanski. All rights reserved.
//

import Foundation
import Alamofire

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


public class ZKillboard: SessionManager {
	let baseURL = "https://zkillboard.com/api/"
	
	public init(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) {
		
		let configuration = URLSessionConfiguration.default
		configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
		configuration.requestCachePolicy = cachePolicy
		
		super.init(configuration: configuration)
	}
	
	public func kills(filter: [Filter], page: Int?, completionBlock:((Result<[Killmail]>) -> Void)?) {
		guard filter.count > 1 else {
			completionBlock?(.failure(ZKillboardError.notFound))
			return
		}
		var session: ZKillboard? = self
		
		var args = filter.map {$0.value}
		if let page = page {
			args.append("page/\(page)")
		}
		
		let url = session!.baseURL
		
		let progress = Progress(totalUnitCount: 100)
		
		session?.request(url + args.joined(separator: "/") + "/orderDirection/desc/", method: .get).downloadProgress { p in
			progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validate().responseZKillboard { (response: DataResponse<[Killmail]>) in
				completionBlock?(response.result)
				session = nil
		}
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


extension ZKillboard {
	
	public enum Sorting {
		case ascending
		case descending
	}
	
	fileprivate static let dateFormatter: DateFormatter = {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyyMMddHH00"
		dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
		dateFormatter.locale = Locale(identifier: "en_US_POSIX")
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
		
		public struct Attacker: Codable, Hashable {

			public var characterID: Int?
			public var corporationID: Int?
			public var allianceID: Int?
			public var factionID: Int?
			public var securityStatus: Float
			public var damageDone: Int
			public var finalBlow: Bool
			public var shipTypeID: Int?
			public var weaponTypeID: Int?
			
			enum CodingKeys: String, CodingKey {
				case characterID = "character_id"
				case corporationID = "corporation_id"
				case allianceID = "alliance_id"
				case factionID = "faction_id"
				case securityStatus = "security_status"
				case damageDone = "damage_done"
				case finalBlow = "final_blow"
				case shipTypeID = "ship_type_id"
				case weaponTypeID = "weapon_type_id"
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: allianceID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: characterID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: corporationID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: damageDone.hashValue)
				hashCombine(seed: &hash, value: factionID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: finalBlow.hashValue)
				hashCombine(seed: &hash, value: securityStatus.hashValue)
				hashCombine(seed: &hash, value: shipTypeID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: weaponTypeID?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Killmail.Attacker, rhs: Killmail.Attacker) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
		}
		
		public struct Victim: Codable, Hashable {
			
			public var characterID: Int?
			public var corporationID: Int?
			public var allianceID: Int?
			public var factionID: Int?
			public var damageTaken: Int
			public var shipTypeID: Int
			public var items: [Killmail.Item]? = nil

			enum CodingKeys: String, CodingKey {
				case characterID = "character_id"
				case corporationID = "corporation_id"
				case allianceID = "alliance_id"
				case factionID = "faction_id"
				case damageTaken = "damage_taken"
				case shipTypeID = "ship_type_id"
				case items
			}

			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: allianceID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: characterID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: corporationID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: damageTaken.hashValue)
				hashCombine(seed: &hash, value: factionID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: shipTypeID.hashValue)
				items?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}
			
			public static func ==(lhs: Killmail.Victim, rhs: Killmail.Victim) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
		}
		
		public struct Item: Codable, Hashable {
			
			public var flag: Int
			public var itemTypeID: Int
			public var quantityDestroyed: Int64?
			public var quantityDropped: Int64?
			public var singleton: Int
			
			enum CodingKeys: String, CodingKey {
				case flag
				case itemTypeID = "item_type_id"
				case quantityDestroyed = "quantity_destroyed"
				case quantityDropped = "quantity_dropped"
				case singleton
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: flag.hashValue)
				hashCombine(seed: &hash, value: itemTypeID.hashValue)
				hashCombine(seed: &hash, value: quantityDestroyed?.hashValue ?? 0)
				hashCombine(seed: &hash, value: quantityDropped?.hashValue ?? 0)
				hashCombine(seed: &hash, value: singleton.hashValue)
				return hash
			}
			
			public static func ==(lhs: Killmail.Item, rhs: Killmail.Item) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
		}

		public struct Position: Codable, Hashable {
			
			
			public var x: Float
			public var y: Float
			public var z: Float
			
			enum CodingKeys: String, CodingKey {
				case x
				case y
				case z
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: x.hashValue)
				hashCombine(seed: &hash, value: y.hashValue)
				hashCombine(seed: &hash, value: z.hashValue)
				return hash
			}
			
			public static func ==(lhs: Killmail.Position, rhs: Killmail.Position) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
		}

		
		public var attackers: [Killmail.Attacker]
		public var killmailID: Int
		public var killmailTime: Date
		public var solarSystemID: Int
		public var victim: Killmail.Victim
		public var position: Killmail.Position?

		enum CodingKeys: String, CodingKey {
			case attackers
			case killmailID = "killmail_id"
			case killmailTime = "killmail_time"
			case solarSystemID = "solar_system_id"
			case victim
			case position
		}
		
		public static var supportsSecureCoding: Bool {
			return true
		}
		
		public var hashValue: Int {
			var hash: Int = 0
			attackers.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
			hashCombine(seed: &hash, value: killmailID.hashValue)
			hashCombine(seed: &hash, value: killmailTime.hashValue)
			hashCombine(seed: &hash, value: solarSystemID.hashValue)
			hashCombine(seed: &hash, value: victim.hashValue)
			hashCombine(seed: &hash, value: position?.hashValue ?? 0)
			return hash
		}
		
		public static func ==(lhs: Killmail, rhs: Killmail) -> Bool {
			return lhs.hashValue == rhs.hashValue
		}
	}

}

