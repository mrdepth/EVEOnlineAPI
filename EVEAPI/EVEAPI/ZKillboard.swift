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
		
		session?.request(url + args.joined(separator: "/") + "/", method: .get).downloadProgress { p in
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
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyyMMddHH00"
		return formatter
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
				return "wSpace"
			case .solo:
				return "solo"
			case .finalBlowOnly:
				return "finalblow-only"
			}
		}
	}
	
	

	public class Killmail: NSObject, NSSecureCoding, NSCopying, JSONCoding {
		
		public class Attacker: NSObject, NSSecureCoding, NSCopying, JSONCoding {

			public var characterID: Int? = nil
			public var characterName: String? = nil
			public var corporationID: Int? = nil
			public var corporationName: String? = nil
			public var allianceID: Int? = nil
			public var allianceName: String? = nil
			public var factionID: Int? = nil
			public var factionName: String? = nil
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
				
				characterID = dictionary["characterID"] as? Int
				characterName = dictionary["characterName"] as? String
				corporationID = dictionary["corporationID"] as? Int
				corporationName = dictionary["corporationName"] as? String
				allianceID = dictionary["allianceID"] as? Int
				allianceName = dictionary["allianceName"] as? String
				factionID = dictionary["factionID"] as? Int
				factionName = dictionary["factionName"] as? String
				
				guard let damageDone = dictionary["damageDone"] as? Int else {throw ZKillboardError.invalidFormat(type(of: self), dictionary)}
				self.damageDone = damageDone
				
				guard let finalBlow = dictionary["finalBlow"] as? Bool else {throw ZKillboardError.invalidFormat(type(of: self), dictionary)}
				self.finalBlow = finalBlow
				guard let securityStatus = dictionary["securityStatus"] as? Float else {throw ZKillboardError.invalidFormat(type(of: self), dictionary)}
				self.securityStatus = securityStatus
				shipTypeID = dictionary["shipTypeID"] as? Int
				weaponTypeID = dictionary["weaponTypeID"] as? Int
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				characterID = aDecoder.containsValue(forKey: "characterID") ? aDecoder.decodeInteger(forKey: "characterID") : nil
				characterName = aDecoder.containsValue(forKey: "characterName") ? aDecoder.decodeObject(forKey: "characterName") as? String : nil
				corporationID = aDecoder.containsValue(forKey: "corporationID") ? aDecoder.decodeInteger(forKey: "corporationID") : nil
				corporationName = aDecoder.containsValue(forKey: "corporationName") ? aDecoder.decodeObject(forKey: "corporationName") as? String : nil
				allianceID = aDecoder.containsValue(forKey: "allianceID") ? aDecoder.decodeInteger(forKey: "allianceID") : nil
				allianceName = aDecoder.containsValue(forKey: "allianceName") ? aDecoder.decodeObject(forKey: "allianceName") as? String : nil
				factionID = aDecoder.containsValue(forKey: "factionID") ? aDecoder.decodeInteger(forKey: "factionID") : nil
				factionName = aDecoder.containsValue(forKey: "factionName") ? aDecoder.decodeObject(forKey: "factionName") as? String : nil
				
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
				if let v = characterName {
					aCoder.encode(v, forKey: "characterName")
				}
				if let v = corporationID {
					aCoder.encode(v, forKey: "corporationID")
				}
				if let v = corporationName {
					aCoder.encode(v, forKey: "corporationName")
				}
				if let v = allianceID {
					aCoder.encode(v, forKey: "allianceID")
				}
				if let v = allianceName {
					aCoder.encode(v, forKey: "allianceName")
				}
				if let v = factionID {
					aCoder.encode(v, forKey: "factionID")
				}
				if let v = factionName {
					aCoder.encode(v, forKey: "factionName")
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
					json["characterID"] = v
				}
				if let v = characterName?.json {
					json["characterName"] = v
				}
				if let v = corporationID?.json {
					json["corporationID"] = v
				}
				if let v = corporationName?.json {
					json["corporationName"] = v
				}
				if let v = allianceID?.json {
					json["allianceID"] = v
				}
				if let v = allianceName?.json {
					json["allianceName"] = v
				}
				if let v = factionID?.json {
					json["factionID"] = v
				}
				if let v = factionName?.json {
					json["factionName"] = v
				}
				json["damageDone"] = damageDone.json
				json["finalBlow"] = finalBlow.json
				json["securityStatus"] = securityStatus.json
				if let v = shipTypeID?.json {
					json["shipTypeID"] = v
				}
				if let v = weaponTypeID?.json {
					json["weaponTypeID"] = v
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
				characterName = other.characterName
				corporationID = other.corporationID
				corporationName = other.corporationName
				allianceID = other.allianceID
				allianceName = other.allianceName
				factionID = other.factionID
				factionName = other.factionName
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
		
		public class Victim: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var characterID: Int? = nil
			public var characterName: String? = nil
			public var corporationID: Int? = nil
			public var corporationName: String? = nil
			public var allianceID: Int? = nil
			public var allianceName: String? = nil
			public var factionID: Int? = nil
			public var factionName: String? = nil
			public var damageTaken: Int = Int()
			public var shipTypeID: Int = Int()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ZKillboardError.invalidFormat(type(of: self), json)}
				
				characterID = dictionary["characterID"] as? Int
				characterName = dictionary["characterName"] as? String
				corporationID = dictionary["corporationID"] as? Int
				corporationName = dictionary["corporationName"] as? String
				allianceID = dictionary["allianceID"] as? Int
				allianceName = dictionary["allianceName"] as? String
				factionID = dictionary["factionID"] as? Int
				factionName = dictionary["factionName"] as? String

				guard let damageTaken = dictionary["damageTaken"] as? Int else {throw ZKillboardError.invalidFormat(type(of: self), dictionary)}
				self.damageTaken = damageTaken
				guard let shipTypeID = dictionary["shipTypeID"] as? Int else {throw ZKillboardError.invalidFormat(type(of: self), dictionary)}
				self.shipTypeID = shipTypeID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				characterID = aDecoder.containsValue(forKey: "characterID") ? aDecoder.decodeInteger(forKey: "characterID") : nil
				characterName = aDecoder.containsValue(forKey: "characterName") ? aDecoder.decodeObject(forKey: "characterName") as? String : nil
				corporationID = aDecoder.containsValue(forKey: "corporationID") ? aDecoder.decodeInteger(forKey: "corporationID") : nil
				corporationName = aDecoder.containsValue(forKey: "corporationName") ? aDecoder.decodeObject(forKey: "corporationName") as? String : nil
				allianceID = aDecoder.containsValue(forKey: "allianceID") ? aDecoder.decodeInteger(forKey: "allianceID") : nil
				allianceName = aDecoder.containsValue(forKey: "allianceName") ? aDecoder.decodeObject(forKey: "allianceName") as? String : nil
				factionID = aDecoder.containsValue(forKey: "factionID") ? aDecoder.decodeInteger(forKey: "factionID") : nil
				factionName = aDecoder.containsValue(forKey: "factionName") ? aDecoder.decodeObject(forKey: "factionName") as? String : nil

				damageTaken = aDecoder.decodeInteger(forKey: "damageTaken")
				shipTypeID = aDecoder.decodeInteger(forKey: "shipTypeID")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = characterID {
					aCoder.encode(v, forKey: "characterID")
				}
				if let v = characterName {
					aCoder.encode(v, forKey: "characterName")
				}
				if let v = corporationID {
					aCoder.encode(v, forKey: "corporationID")
				}
				if let v = corporationName {
					aCoder.encode(v, forKey: "corporationName")
				}
				if let v = allianceID {
					aCoder.encode(v, forKey: "allianceID")
				}
				if let v = allianceName {
					aCoder.encode(v, forKey: "allianceName")
				}
				if let v = factionID {
					aCoder.encode(v, forKey: "factionID")
				}
				if let v = factionName {
					aCoder.encode(v, forKey: "factionName")
				}
				aCoder.encode(damageTaken, forKey: "damageTaken")
				aCoder.encode(shipTypeID, forKey: "shipTypeID")
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = characterID?.json {
					json["characterID"] = v
				}
				if let v = characterName?.json {
					json["characterName"] = v
				}
				if let v = corporationID?.json {
					json["corporationID"] = v
				}
				if let v = corporationName?.json {
					json["corporationName"] = v
				}
				if let v = allianceID?.json {
					json["allianceID"] = v
				}
				if let v = allianceName?.json {
					json["allianceName"] = v
				}
				if let v = factionID?.json {
					json["factionID"] = v
				}
				if let v = factionName?.json {
					json["factionName"] = v
				}
				json["damageTaken"] = damageTaken.json
				json["shipTypeID"] = shipTypeID.json
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
				return hash
			}
			
			public static func ==(lhs: Killmail.Victim, rhs: Killmail.Victim) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Killmail.Victim) {
				characterID = other.characterID
				characterName = other.characterName
				corporationID = other.corporationID
				corporationName = other.corporationName
				allianceID = other.allianceID
				allianceName = other.allianceName
				factionID = other.factionID
				factionName = other.factionName
				damageTaken = other.damageTaken
				shipTypeID = other.shipTypeID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Killmail.Victim(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Victim)?.hashValue == hashValue
			}
			
		}
		
		public class Item: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
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
				guard let itemTypeID = dictionary["typeID"] as? Int else {throw ZKillboardError.invalidFormat(type(of: self), dictionary)}
				self.itemTypeID = itemTypeID
				quantityDestroyed = dictionary["qtyDestroyed"] as? Int64
				quantityDropped = dictionary["qtyDropped"] as? Int64
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
				json["typeID"] = itemTypeID.json
				if let v = quantityDestroyed?.json {
					json["qtyDestroyed"] = v
				}
				if let v = quantityDropped?.json {
					json["qtyDropped"] = v
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

		public class Position: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
		public var moonID: Int? = nil
		public var solarSystemID: Int = Int()
		public var victim: Killmail.Victim = Killmail.Victim()
		public var items: [Killmail.Item]? = nil
		public var position: Killmail.Position? = nil

		public static var supportsSecureCoding: Bool {
			return true
		}
		
		public required init(json: Any) throws {
			guard let dictionary = json as? [String: Any] else {throw ZKillboardError.invalidFormat(type(of: self), json)}
			
			attackers = try (dictionary["attackers"] as? [Any])?.map {try Killmail.Attacker(json: $0)} ?? []
			guard let killmailID = dictionary["killID"] as? Int else {throw ZKillboardError.invalidFormat(type(of: self), dictionary)}
			self.killmailID = killmailID
			guard let killmailTime = DateFormatter.esiDateTimeFormatter.date(from: dictionary["killTime"] as? String ?? "") else {throw ZKillboardError.invalidFormat(type(of: self), dictionary)}
			self.killmailTime = killmailTime
			moonID = dictionary["moonID"] as? Int
			guard let solarSystemID = dictionary["solarSystemID"] as? Int else {throw ZKillboardError.invalidFormat(type(of: self), dictionary)}
			self.solarSystemID = solarSystemID
			victim = try Killmail.Victim(json: dictionary["victim"] as? [String: Any] ?? [:])
			items = try (dictionary["items"] as? [Any])?.map {try Killmail.Item(json: $0)}
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
			moonID = aDecoder.containsValue(forKey: "moonID") ? aDecoder.decodeInteger(forKey: "moonID") : nil
			solarSystemID = aDecoder.decodeInteger(forKey: "solarSystemID")
			victim = aDecoder.decodeObject(of: Killmail.Victim.self, forKey: "victim")  ?? Killmail.Victim()
			items = aDecoder.decodeObject(of: [Killmail.Item.self], forKey: "items") as? [Killmail.Item]
			position = aDecoder.decodeObject(of: Killmail.Position.self, forKey: "position")

			super.init()
		}
		
		public func encode(with aCoder: NSCoder) {
			aCoder.encode(attackers, forKey: "attackers")
			aCoder.encode(killmailID, forKey: "killID")
			aCoder.encode(killmailTime, forKey: "killTime")
			if let v = moonID {
				aCoder.encode(v, forKey: "moonID")
			}
			aCoder.encode(solarSystemID, forKey: "solarSystemID")
			aCoder.encode(victim, forKey: "victim")
			if let v = items {
				aCoder.encode(v, forKey: "items")
			}
			if let v = position {
				aCoder.encode(v, forKey: "position")
			}
		}
		
		public var json: Any {
			var json = [String: Any]()
			json["attackers"] = attackers.json
			json["killID"] = killmailID.json
			json["killTime"] = killmailTime.json
			if let v = moonID?.json {
				json["moonID"] = v
			}
			json["solarSystemID"] = solarSystemID.json
			json["victim"] = victim.json
			if let v = items?.json {
				json["items"] = v
			}
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
			hashCombine(seed: &hash, value: moonID?.hashValue ?? 0)
			hashCombine(seed: &hash, value: solarSystemID.hashValue)
			hashCombine(seed: &hash, value: victim.hashValue)
			items?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
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
			moonID = other.moonID
			solarSystemID = other.solarSystemID
			victim = Killmail.Victim(other.victim)
			items = other.items?.flatMap { Killmail.Item($0) }
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

