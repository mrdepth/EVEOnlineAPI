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
	
	public class func initialize() {
		_ = Killmail.classForCoder()
		_ = Killmail.Victim.classForCoder()
		_ = Killmail.Attacker.classForCoder()
		_ = Killmail.Item.classForCoder()
		_ = Killmail.Position.classForCoder()
	}
	
	
	
}

extension DataRequest {
	
	
	@discardableResult
	public func responseZKillboard<T: JSONCoding>(queue: DispatchQueue? = nil,
	                        options: JSONSerialization.ReadingOptions = .allowFragments,
	                        completionHandler: @escaping (DataResponse<T>) -> Void) -> Self
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


extension ZKillboard {
	
	public enum Sorting {
		case ascending
		case descending
	}
	
	private static let dateFormatter: DateFormatter = {
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
	
	

	@objc(ZKillboardKillmail) public class Killmail: NSObject, NSCoding, NSCopying, JSONCoding {
		
		@objc(ZKillboardKillmailAttacker) public class Attacker: NSObject, NSCoding, NSCopying, JSONCoding {

			public var characterID: Int? = nil
			public var corporationID: Int? = nil
			public var allianceID: Int? = nil
			public var factionID: Int? = nil
			public var securityStatus: Float = Float()
			public var damageDone: Int = Int()
			public var finalBlow: Bool = Bool()
			public var shipTypeID: Int? = nil
			public var weaponTypeID: Int? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ZKillboardError.invalidFormat(type(of: self), json)}
				
				characterID = dictionary["character_id"] as? Int
				corporationID = dictionary["corporation_id"] as? Int
				allianceID = dictionary["alliance_id"] as? Int
				factionID = dictionary["faction_id"] as? Int
				
				guard let damageDone = dictionary["damage_done"] as? Int else {throw ZKillboardError.invalidFormat(type(of: self), dictionary)}
				self.damageDone = damageDone
				
				guard let finalBlow = dictionary["final_blow"] as? Bool else {throw ZKillboardError.invalidFormat(type(of: self), dictionary)}
				self.finalBlow = finalBlow
				guard let securityStatus = dictionary["security_status"] as? Float else {throw ZKillboardError.invalidFormat(type(of: self), dictionary)}
				self.securityStatus = securityStatus
				shipTypeID = dictionary["ship_type_id"] as? Int
				weaponTypeID = dictionary["weapon_type_id"] as? Int
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				characterID = aDecoder.containsValue(forKey: "characterID") ? aDecoder.decodeInteger(forKey: "characterID") : nil
				corporationID = aDecoder.containsValue(forKey: "corporationID") ? aDecoder.decodeInteger(forKey: "corporationID") : nil
				allianceID = aDecoder.containsValue(forKey: "allianceID") ? aDecoder.decodeInteger(forKey: "allianceID") : nil
				factionID = aDecoder.containsValue(forKey: "factionID") ? aDecoder.decodeInteger(forKey: "factionID") : nil
				
				damageDone = aDecoder.decodeInteger(forKey: "damageDone")
				finalBlow = aDecoder.decodeBool(forKey: "finalBlow")
				securityStatus = aDecoder.decodeFloat(forKey: "securityStatus")
				shipTypeID = aDecoder.containsValue(forKey: "shipTypeID") ? aDecoder.decodeInteger(forKey: "shipTypeID") : nil
				weaponTypeID = aDecoder.containsValue(forKey: "weaponTypeID") ? aDecoder.decodeInteger(forKey: "weaponTypeID") : nil
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = characterID {
					aCoder.encode(v, forKey: "characterID")
				}
				if let v = corporationID {
					aCoder.encode(v, forKey: "corporationID")
				}
				if let v = allianceID {
					aCoder.encode(v, forKey: "allianceID")
				}
				if let v = factionID {
					aCoder.encode(v, forKey: "factionID")
				}
				aCoder.encode(damageDone, forKey: "damageDone")
				aCoder.encode(finalBlow, forKey: "finalBlow")
				aCoder.encode(securityStatus, forKey: "securityStatus")
				if let v = shipTypeID {
					aCoder.encode(v, forKey: "shipTypeID")
				}
				if let v = weaponTypeID {
					aCoder.encode(v, forKey: "weaponTypeID")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = characterID?.json {
					json["character_id"] = v
				}
				if let v = corporationID?.json {
					json["corporation_id"] = v
				}
				if let v = allianceID?.json {
					json["alliance_id"] = v
				}
				if let v = factionID?.json {
					json["faction_id"] = v
				}
				json["damage_done"] = damageDone.json
				json["final_blow"] = finalBlow.json
				json["security_status"] = securityStatus.json
				if let v = shipTypeID?.json {
					json["ship_type_id"] = v
				}
				if let v = weaponTypeID?.json {
					json["weapon_type_id"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
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
			
			init(_ other: Killmail.Attacker) {
				characterID = other.characterID
				corporationID = other.corporationID
				allianceID = other.allianceID
				factionID = other.factionID
				damageDone = other.damageDone
				finalBlow = other.finalBlow
				securityStatus = other.securityStatus
				shipTypeID = other.shipTypeID
				weaponTypeID = other.weaponTypeID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Killmail.Attacker(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Attacker)?.hashValue == hashValue
			}
			
		}
		
		@objc(ZKillboardKillmailVictim) public class Victim: NSObject, NSCoding, NSCopying, JSONCoding {
			
			
			public var characterID: Int? = nil
			public var corporationID: Int? = nil
			public var allianceID: Int? = nil
			public var factionID: Int? = nil
			public var damageTaken: Int = Int()
			public var shipTypeID: Int = Int()
			public var items: [Killmail.Item]? = nil

			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ZKillboardError.invalidFormat(type(of: self), json)}
				
				characterID = dictionary["character_id"] as? Int
				corporationID = dictionary["corporation_id"] as? Int
				allianceID = dictionary["alliance_id"] as? Int
				factionID = dictionary["faction_id"] as? Int

				items = try (dictionary["items"] as? [Any])?.map {try Killmail.Item(json: $0)}

				guard let damageTaken = dictionary["damage_taken"] as? Int else {throw ZKillboardError.invalidFormat(type(of: self), dictionary)}
				self.damageTaken = damageTaken
				guard let shipTypeID = dictionary["ship_type_id"] as? Int else {throw ZKillboardError.invalidFormat(type(of: self), dictionary)}
				self.shipTypeID = shipTypeID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				characterID = aDecoder.containsValue(forKey: "characterID") ? aDecoder.decodeInteger(forKey: "characterID") : nil
				corporationID = aDecoder.containsValue(forKey: "corporationID") ? aDecoder.decodeInteger(forKey: "corporationID") : nil
				allianceID = aDecoder.containsValue(forKey: "allianceID") ? aDecoder.decodeInteger(forKey: "allianceID") : nil
				factionID = aDecoder.containsValue(forKey: "factionID") ? aDecoder.decodeInteger(forKey: "factionID") : nil

				damageTaken = aDecoder.decodeInteger(forKey: "damageTaken")
				shipTypeID = aDecoder.decodeInteger(forKey: "shipTypeID")
				items = aDecoder.decodeObject(of: [Killmail.Item.self], forKey: "items") as? [Killmail.Item]

				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = characterID {
					aCoder.encode(v, forKey: "characterID")
				}
				if let v = corporationID {
					aCoder.encode(v, forKey: "corporationID")
				}
				if let v = allianceID {
					aCoder.encode(v, forKey: "allianceID")
				}
				if let v = factionID {
					aCoder.encode(v, forKey: "factionID")
				}
				aCoder.encode(damageTaken, forKey: "damageTaken")
				aCoder.encode(shipTypeID, forKey: "shipTypeID")
				if let v = items {
					aCoder.encode(v, forKey: "items")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = characterID?.json {
					json["character_id"] = v
				}
				if let v = corporationID?.json {
					json["corporation_id"] = v
				}
				if let v = allianceID?.json {
					json["alliance_id"] = v
				}
				if let v = factionID?.json {
					json["faction_id"] = v
				}

				json["damage_taken"] = damageTaken.json
				json["ship_type_id"] = shipTypeID.json
				if let v = items?.json {
					json["items"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
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
			
			init(_ other: Killmail.Victim) {
				characterID = other.characterID
				corporationID = other.corporationID
				allianceID = other.allianceID
				factionID = other.factionID
				damageTaken = other.damageTaken
				shipTypeID = other.shipTypeID
				items = other.items?.flatMap { Killmail.Item($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Killmail.Victim(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Victim)?.hashValue == hashValue
			}
			
		}
		
		@objc(ZKillboardKillmailItem) public class Item: NSObject, NSCoding, NSCopying, JSONCoding {
			
			public var flag: Int = Int()
			public var itemTypeID: Int = Int()
			public var quantityDestroyed: Int64? = nil
			public var quantityDropped: Int64? = nil
			public var singleton: Int = Int()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ZKillboardError.invalidFormat(type(of: self), json)}
				
				guard let flag = dictionary["flag"] as? Int else {throw ZKillboardError.invalidFormat(type(of: self), dictionary)}
				self.flag = flag
				guard let itemTypeID = dictionary["item_type_id"] as? Int else {throw ZKillboardError.invalidFormat(type(of: self), dictionary)}
				self.itemTypeID = itemTypeID
				quantityDestroyed = dictionary["quantity_destroyed"] as? Int64
				quantityDropped = dictionary["quantity_dropped"] as? Int64
				guard let singleton = dictionary["singleton"] as? Int else {throw ZKillboardError.invalidFormat(type(of: self), dictionary)}
				self.singleton = singleton
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				flag = aDecoder.decodeInteger(forKey: "flag")
				itemTypeID = aDecoder.decodeInteger(forKey: "typeID")
				quantityDestroyed = aDecoder.containsValue(forKey: "qtyDestroyed") ? aDecoder.decodeInt64(forKey: "qtyDestroyed") : nil
				quantityDropped = aDecoder.containsValue(forKey: "qtyDropped") ? aDecoder.decodeInt64(forKey: "qtyDropped") : nil
				singleton = aDecoder.decodeInteger(forKey: "singleton")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(flag, forKey: "flag")
				aCoder.encode(itemTypeID, forKey: "typeID")
				if let v = quantityDestroyed {
					aCoder.encode(v, forKey: "qtyDestroyed")
				}
				if let v = quantityDropped {
					aCoder.encode(v, forKey: "qtyDropped")
				}
				aCoder.encode(singleton, forKey: "singleton")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["flag"] = flag.json
				json["item_type_id"] = itemTypeID.json
				if let v = quantityDestroyed?.json {
					json["quantity_destroyed"] = v
				}
				if let v = quantityDropped?.json {
					json["quantity_dropped"] = v
				}
				json["singleton"] = singleton.json
				return json
			}
			
			override public var hashValue: Int {
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
			
			init(_ other: Killmail.Item) {
				flag = other.flag
				itemTypeID = other.itemTypeID
				quantityDestroyed = other.quantityDestroyed
				quantityDropped = other.quantityDropped
				singleton = other.singleton
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Killmail.Item(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Item)?.hashValue == hashValue
			}
			
		}

		@objc(ZKillboardKillmailPosition) public class Position: NSObject, NSCoding, NSCopying, JSONCoding {
			
			
			public var x: Float = Float()
			public var y: Float = Float()
			public var z: Float = Float()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ZKillboardError.invalidFormat(type(of: self), json)}
				
				guard let x = dictionary["x"] as? Float else {throw ZKillboardError.invalidFormat(type(of: self), dictionary)}
				self.x = x
				guard let y = dictionary["y"] as? Float else {throw ZKillboardError.invalidFormat(type(of: self), dictionary)}
				self.y = y
				guard let z = dictionary["z"] as? Float else {throw ZKillboardError.invalidFormat(type(of: self), dictionary)}
				self.z = z
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				x = aDecoder.decodeFloat(forKey: "x")
				y = aDecoder.decodeFloat(forKey: "y")
				z = aDecoder.decodeFloat(forKey: "z")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(x, forKey: "x")
				aCoder.encode(y, forKey: "y")
				aCoder.encode(z, forKey: "z")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["x"] = x.json
				json["y"] = y.json
				json["z"] = z.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: x.hashValue)
				hashCombine(seed: &hash, value: y.hashValue)
				hashCombine(seed: &hash, value: z.hashValue)
				return hash
			}
			
			public static func ==(lhs: Killmail.Position, rhs: Killmail.Position) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Killmail.Position) {
				x = other.x
				y = other.y
				z = other.z
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Killmail.Position(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Killmail.Position)?.hashValue == hashValue
			}
			
		}

		
		public var attackers: [Killmail.Attacker] = []
		public var killmailID: Int = Int()
		public var killmailTime: Date = Date()
		public var solarSystemID: Int = Int()
		public var victim: Killmail.Victim = Killmail.Victim()
		public var position: Killmail.Position? = nil

		public static var supportsSecureCoding: Bool {
			return true
		}
		
		public required init(json: Any) throws {
			guard let dictionary = json as? [String: Any] else {throw ZKillboardError.invalidFormat(type(of: self), json)}
			
			attackers = try (dictionary["attackers"] as? [Any])?.map {try Killmail.Attacker(json: $0)} ?? []
			guard let killmailID = dictionary["killmail_id"] as? Int else {throw ZKillboardError.invalidFormat(type(of: self), dictionary)}
			self.killmailID = killmailID
			guard let killmailTime = DateFormatter.zKillboardDateFormatter.date(from: dictionary["killmail_time"] as? String ?? "") else {throw ZKillboardError.invalidFormat(type(of: self), dictionary)}
			self.killmailTime = killmailTime
			guard let solarSystemID = dictionary["solar_system_id"] as? Int else {throw ZKillboardError.invalidFormat(type(of: self), dictionary)}
			self.solarSystemID = solarSystemID
			victim = try Killmail.Victim(json: dictionary["victim"] as? [String: Any] ?? [:])
			position = try? Killmail.Position(json: dictionary["position"] as? [String: Any] ?? [:])

			super.init()
		}
		
		override public init() {
			super.init()
		}
		
		public required init?(coder aDecoder: NSCoder) {
			attackers = aDecoder.decodeObject(of: [Killmail.Attacker.self], forKey: "attackers") as? [Killmail.Attacker] ?? []
			killmailID = aDecoder.decodeInteger(forKey: "killID")
			killmailTime = aDecoder.decodeObject(forKey: "killTime") as? Date ?? Date()
			solarSystemID = aDecoder.decodeInteger(forKey: "solarSystemID")
			victim = aDecoder.decodeObject(of: Killmail.Victim.self, forKey: "victim")  ?? Killmail.Victim()
			position = aDecoder.decodeObject(of: Killmail.Position.self, forKey: "position")

			super.init()
		}
		
		public func encode(with aCoder: NSCoder) {
			aCoder.encode(attackers, forKey: "attackers")
			aCoder.encode(killmailID, forKey: "killID")
			aCoder.encode(killmailTime, forKey: "killTime")
			aCoder.encode(solarSystemID, forKey: "solarSystemID")
			aCoder.encode(victim, forKey: "victim")
			if let v = position {
				aCoder.encode(v, forKey: "position")
			}
		}
		
		public var json: Any {
			var json = [String: Any]()
			json["attackers"] = attackers.json
			json["killmail_id"] = killmailID.json
			json["killmail_time"] = killmailTime.json
			json["solar_system_id"] = solarSystemID.json
			json["victim"] = victim.json
			if let v = position?.json {
				json["position"] = v
			}
			return json
		}
		
		override public var hashValue: Int {
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
		
		init(_ other: Killmail) {
			attackers = other.attackers.flatMap { Killmail.Attacker($0) }
			killmailID = other.killmailID
			killmailTime = other.killmailTime
			solarSystemID = other.solarSystemID
			victim = Killmail.Victim(other.victim)
			position = other.position != nil ? Killmail.Position(other.position!) : nil
		}
		
		public func copy(with zone: NSZone? = nil) -> Any {
			return Killmail(self)
		}
		
		
		public override func isEqual(_ object: Any?) -> Bool {
			return (object as? Killmail)?.hashValue == hashValue
		}
		
	}

}

