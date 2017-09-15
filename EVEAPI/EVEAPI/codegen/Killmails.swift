import Foundation
import Alamofire


public extension ESI {
	public var killmails: Killmails {
		return Killmails(sessionManager: self)
	}
	
	class Killmails {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		public func getSingleKillmail(killmailHash: String, killmailID: Int, completionBlock:((Result<Killmails.Killmail>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/killmails/\(killmailID)/\(killmailHash)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Killmails.Killmail>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getCharacterKillsAndLosses(characterID: Int, maxCount: Int? = nil, maxKillID: Int? = nil, completionBlock:((Result<[Killmails.Recent]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-killmails.read_killmails.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = maxCount?.httpQuery {
				query.append(URLQueryItem(name: "max_count", value: v))
			}
			if let v = maxKillID?.httpQuery {
				query.append(URLQueryItem(name: "max_kill_id", value: v))
			}
			
			let url = session!.baseURL + "latest/characters/\(characterID)/killmails/recent/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Killmails.Recent]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getCorporationKillsAndLosses(corporationID: Int, maxKillID: Int? = nil, completionBlock:((Result<[Killmails.GetCorporationsCorporationIDKillmailsRecentOk]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-killmails.read_corporation_killmails.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = maxKillID?.httpQuery {
				query.append(URLQueryItem(name: "max_kill_id", value: v))
			}
			
			let url = session!.baseURL + "latest/corporations/\(corporationID)/killmails/recent/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Killmails.GetCorporationsCorporationIDKillmailsRecentOk]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		@objc(ESIKillmailsGetCorporationsCorporationIDKillmailsRecentOk) public class GetCorporationsCorporationIDKillmailsRecentOk: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var killmailHash: String = String()
			public var killmailID: Int = Int()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let killmailHash = dictionary["killmail_hash"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.killmailHash = killmailHash
				guard let killmailID = dictionary["killmail_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.killmailID = killmailID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				killmailHash = aDecoder.decodeObject(forKey: "killmail_hash") as? String ?? String()
				killmailID = aDecoder.decodeInteger(forKey: "killmail_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(killmailHash, forKey: "killmail_hash")
				aCoder.encode(killmailID, forKey: "killmail_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["killmail_hash"] = killmailHash.json
				json["killmail_id"] = killmailID.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.killmailHash.hashValue)
				hashCombine(seed: &hash, value: self.killmailID.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Killmails.GetCorporationsCorporationIDKillmailsRecentOk, rhs: Killmails.GetCorporationsCorporationIDKillmailsRecentOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Killmails.GetCorporationsCorporationIDKillmailsRecentOk) {
				killmailHash = other.killmailHash
				killmailID = other.killmailID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Killmails.GetCorporationsCorporationIDKillmailsRecentOk(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCorporationsCorporationIDKillmailsRecentOk)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIKillmailsGetKillmailsKillmailIDKillmailHashUnprocessableEntity) public class GetKillmailsKillmailIDKillmailHashUnprocessableEntity: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				error = aDecoder.decodeObject(forKey: "error") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = error {
					aCoder.encode(v, forKey: "error")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = error?.json {
					json["error"] = v
				}
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.error?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Killmails.GetKillmailsKillmailIDKillmailHashUnprocessableEntity, rhs: Killmails.GetKillmailsKillmailIDKillmailHashUnprocessableEntity) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Killmails.GetKillmailsKillmailIDKillmailHashUnprocessableEntity) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Killmails.GetKillmailsKillmailIDKillmailHashUnprocessableEntity(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetKillmailsKillmailIDKillmailHashUnprocessableEntity)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIKillmailsKillmail) public class Killmail: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			@objc(ESIKillmailsKillmailAttacker) public class Attacker: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var allianceID: Int? = nil
				public var characterID: Int? = nil
				public var corporationID: Int? = nil
				public var damageDone: Int = Int()
				public var factionID: Int? = nil
				public var finalBlow: Bool = Bool()
				public var securityStatus: Float = Float()
				public var shipTypeID: Int? = nil
				public var weaponTypeID: Int? = nil
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					allianceID = dictionary["alliance_id"] as? Int
					characterID = dictionary["character_id"] as? Int
					corporationID = dictionary["corporation_id"] as? Int
					guard let damageDone = dictionary["damage_done"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.damageDone = damageDone
					factionID = dictionary["faction_id"] as? Int
					guard let finalBlow = dictionary["final_blow"] as? Bool else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.finalBlow = finalBlow
					guard let securityStatus = dictionary["security_status"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.securityStatus = securityStatus
					shipTypeID = dictionary["ship_type_id"] as? Int
					weaponTypeID = dictionary["weapon_type_id"] as? Int
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init?(coder aDecoder: NSCoder) {
					allianceID = aDecoder.containsValue(forKey: "alliance_id") ? aDecoder.decodeInteger(forKey: "alliance_id") : nil
					characterID = aDecoder.containsValue(forKey: "character_id") ? aDecoder.decodeInteger(forKey: "character_id") : nil
					corporationID = aDecoder.containsValue(forKey: "corporation_id") ? aDecoder.decodeInteger(forKey: "corporation_id") : nil
					damageDone = aDecoder.decodeInteger(forKey: "damage_done")
					factionID = aDecoder.containsValue(forKey: "faction_id") ? aDecoder.decodeInteger(forKey: "faction_id") : nil
					finalBlow = aDecoder.decodeBool(forKey: "final_blow")
					securityStatus = aDecoder.decodeFloat(forKey: "security_status")
					shipTypeID = aDecoder.containsValue(forKey: "ship_type_id") ? aDecoder.decodeInteger(forKey: "ship_type_id") : nil
					weaponTypeID = aDecoder.containsValue(forKey: "weapon_type_id") ? aDecoder.decodeInteger(forKey: "weapon_type_id") : nil
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					if let v = allianceID {
						aCoder.encode(v, forKey: "alliance_id")
					}
					if let v = characterID {
						aCoder.encode(v, forKey: "character_id")
					}
					if let v = corporationID {
						aCoder.encode(v, forKey: "corporation_id")
					}
					aCoder.encode(damageDone, forKey: "damage_done")
					if let v = factionID {
						aCoder.encode(v, forKey: "faction_id")
					}
					aCoder.encode(finalBlow, forKey: "final_blow")
					aCoder.encode(securityStatus, forKey: "security_status")
					if let v = shipTypeID {
						aCoder.encode(v, forKey: "ship_type_id")
					}
					if let v = weaponTypeID {
						aCoder.encode(v, forKey: "weapon_type_id")
					}
				}
				
				public var json: Any {
					var json = [String: Any]()
					if let v = allianceID?.json {
						json["alliance_id"] = v
					}
					if let v = characterID?.json {
						json["character_id"] = v
					}
					if let v = corporationID?.json {
						json["corporation_id"] = v
					}
					json["damage_done"] = damageDone.json
					if let v = factionID?.json {
						json["faction_id"] = v
					}
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
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.allianceID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.characterID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.corporationID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.damageDone.hashValue)
					hashCombine(seed: &hash, value: self.factionID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.finalBlow.hashValue)
					hashCombine(seed: &hash, value: self.securityStatus.hashValue)
					hashCombine(seed: &hash, value: self.shipTypeID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.weaponTypeID?.hashValue ?? 0)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: Killmails.Killmail.Attacker, rhs: Killmails.Killmail.Attacker) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Killmails.Killmail.Attacker) {
					allianceID = other.allianceID
					characterID = other.characterID
					corporationID = other.corporationID
					damageDone = other.damageDone
					factionID = other.factionID
					finalBlow = other.finalBlow
					securityStatus = other.securityStatus
					shipTypeID = other.shipTypeID
					weaponTypeID = other.weaponTypeID
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Killmails.Killmail.Attacker(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? Attacker)?.hashValue == hashValue
				}
				
			}
			
			@objc(ESIKillmailsKillmailVictim) public class Victim: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				@objc(ESIKillmailsKillmailVictimGetKillmailsKillmailIDKillmailHashPosition) public class GetKillmailsKillmailIDKillmailHashPosition: NSObject, NSSecureCoding, NSCopying, JSONCoding {
					
					
					public var x: Float = Float()
					public var y: Float = Float()
					public var z: Float = Float()
					
					
					public required init(json: Any) throws {
						guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
						
						guard let x = dictionary["x"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
						self.x = x
						guard let y = dictionary["y"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
						self.y = y
						guard let z = dictionary["z"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
						self.z = z
						
						super.init()
					}
					
					override public init() {
						super.init()
					}
					
					public static var supportsSecureCoding: Bool {
						return true
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
					
					private lazy var _hashValue: Int = {
						var hash: Int = 0
						hashCombine(seed: &hash, value: self.x.hashValue)
						hashCombine(seed: &hash, value: self.y.hashValue)
						hashCombine(seed: &hash, value: self.z.hashValue)
						return hash
					}()
					
					override public var hashValue: Int {
						return _hashValue
					}
					
					public static func ==(lhs: Killmails.Killmail.Victim.GetKillmailsKillmailIDKillmailHashPosition, rhs: Killmails.Killmail.Victim.GetKillmailsKillmailIDKillmailHashPosition) -> Bool {
						return lhs.hashValue == rhs.hashValue
					}
					
					init(_ other: Killmails.Killmail.Victim.GetKillmailsKillmailIDKillmailHashPosition) {
						x = other.x
						y = other.y
						z = other.z
					}
					
					public func copy(with zone: NSZone? = nil) -> Any {
						return Killmails.Killmail.Victim.GetKillmailsKillmailIDKillmailHashPosition(self)
					}
					
					
					public override func isEqual(_ object: Any?) -> Bool {
						return (object as? GetKillmailsKillmailIDKillmailHashPosition)?.hashValue == hashValue
					}
					
				}
				
				@objc(ESIKillmailsKillmailVictimItem) public class Item: NSObject, NSSecureCoding, NSCopying, JSONCoding {
					
					@objc(ESIKillmailsKillmailVictimItemItem) public class Item: NSObject, NSSecureCoding, NSCopying, JSONCoding {
						
						
						public var flag: Int = Int()
						public var itemTypeID: Int = Int()
						public var quantityDestroyed: Int64? = nil
						public var quantityDropped: Int64? = nil
						public var singleton: Int = Int()
						
						
						public required init(json: Any) throws {
							guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
							
							guard let flag = dictionary["flag"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
							self.flag = flag
							guard let itemTypeID = dictionary["item_type_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
							self.itemTypeID = itemTypeID
							quantityDestroyed = dictionary["quantity_destroyed"] as? Int64
							quantityDropped = dictionary["quantity_dropped"] as? Int64
							guard let singleton = dictionary["singleton"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
							self.singleton = singleton
							
							super.init()
						}
						
						override public init() {
							super.init()
						}
						
						public static var supportsSecureCoding: Bool {
							return true
						}
						
						public required init?(coder aDecoder: NSCoder) {
							flag = aDecoder.decodeInteger(forKey: "flag")
							itemTypeID = aDecoder.decodeInteger(forKey: "item_type_id")
							quantityDestroyed = aDecoder.containsValue(forKey: "quantity_destroyed") ? aDecoder.decodeInt64(forKey: "quantity_destroyed") : nil
							quantityDropped = aDecoder.containsValue(forKey: "quantity_dropped") ? aDecoder.decodeInt64(forKey: "quantity_dropped") : nil
							singleton = aDecoder.decodeInteger(forKey: "singleton")
							
							super.init()
						}
						
						public func encode(with aCoder: NSCoder) {
							aCoder.encode(flag, forKey: "flag")
							aCoder.encode(itemTypeID, forKey: "item_type_id")
							if let v = quantityDestroyed {
								aCoder.encode(v, forKey: "quantity_destroyed")
							}
							if let v = quantityDropped {
								aCoder.encode(v, forKey: "quantity_dropped")
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
						
						private lazy var _hashValue: Int = {
							var hash: Int = 0
							hashCombine(seed: &hash, value: self.flag.hashValue)
							hashCombine(seed: &hash, value: self.itemTypeID.hashValue)
							hashCombine(seed: &hash, value: self.quantityDestroyed?.hashValue ?? 0)
							hashCombine(seed: &hash, value: self.quantityDropped?.hashValue ?? 0)
							hashCombine(seed: &hash, value: self.singleton.hashValue)
							return hash
						}()
						
						override public var hashValue: Int {
							return _hashValue
						}
						
						public static func ==(lhs: Killmails.Killmail.Victim.Item.Item, rhs: Killmails.Killmail.Victim.Item.Item) -> Bool {
							return lhs.hashValue == rhs.hashValue
						}
						
						init(_ other: Killmails.Killmail.Victim.Item.Item) {
							flag = other.flag
							itemTypeID = other.itemTypeID
							quantityDestroyed = other.quantityDestroyed
							quantityDropped = other.quantityDropped
							singleton = other.singleton
						}
						
						public func copy(with zone: NSZone? = nil) -> Any {
							return Killmails.Killmail.Victim.Item.Item(self)
						}
						
						
						public override func isEqual(_ object: Any?) -> Bool {
							return (object as? Item)?.hashValue == hashValue
						}
						
					}
					
					public var flag: Int = Int()
					public var itemTypeID: Int = Int()
					public var items: [Killmails.Killmail.Victim.Item.Item]? = nil
					public var quantityDestroyed: Int64? = nil
					public var quantityDropped: Int64? = nil
					public var singleton: Int = Int()
					
					
					public required init(json: Any) throws {
						guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
						
						guard let flag = dictionary["flag"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
						self.flag = flag
						guard let itemTypeID = dictionary["item_type_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
						self.itemTypeID = itemTypeID
						items = try (dictionary["items"] as? [Any])?.map {try Killmails.Killmail.Victim.Item.Item(json: $0)}
						quantityDestroyed = dictionary["quantity_destroyed"] as? Int64
						quantityDropped = dictionary["quantity_dropped"] as? Int64
						guard let singleton = dictionary["singleton"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
						self.singleton = singleton
						
						super.init()
					}
					
					override public init() {
						super.init()
					}
					
					public static var supportsSecureCoding: Bool {
						return true
					}
					
					public required init?(coder aDecoder: NSCoder) {
						flag = aDecoder.decodeInteger(forKey: "flag")
						itemTypeID = aDecoder.decodeInteger(forKey: "item_type_id")
						items = aDecoder.decodeObject(of: [Killmails.Killmail.Victim.Item.Item.self], forKey: "items") as? [Killmails.Killmail.Victim.Item.Item]
						quantityDestroyed = aDecoder.containsValue(forKey: "quantity_destroyed") ? aDecoder.decodeInt64(forKey: "quantity_destroyed") : nil
						quantityDropped = aDecoder.containsValue(forKey: "quantity_dropped") ? aDecoder.decodeInt64(forKey: "quantity_dropped") : nil
						singleton = aDecoder.decodeInteger(forKey: "singleton")
						
						super.init()
					}
					
					public func encode(with aCoder: NSCoder) {
						aCoder.encode(flag, forKey: "flag")
						aCoder.encode(itemTypeID, forKey: "item_type_id")
						if let v = items {
							aCoder.encode(v, forKey: "items")
						}
						if let v = quantityDestroyed {
							aCoder.encode(v, forKey: "quantity_destroyed")
						}
						if let v = quantityDropped {
							aCoder.encode(v, forKey: "quantity_dropped")
						}
						aCoder.encode(singleton, forKey: "singleton")
					}
					
					public var json: Any {
						var json = [String: Any]()
						json["flag"] = flag.json
						json["item_type_id"] = itemTypeID.json
						if let v = items?.json {
							json["items"] = v
						}
						if let v = quantityDestroyed?.json {
							json["quantity_destroyed"] = v
						}
						if let v = quantityDropped?.json {
							json["quantity_dropped"] = v
						}
						json["singleton"] = singleton.json
						return json
					}
					
					private lazy var _hashValue: Int = {
						var hash: Int = 0
						hashCombine(seed: &hash, value: self.flag.hashValue)
						hashCombine(seed: &hash, value: self.itemTypeID.hashValue)
						self.items?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
						hashCombine(seed: &hash, value: self.quantityDestroyed?.hashValue ?? 0)
						hashCombine(seed: &hash, value: self.quantityDropped?.hashValue ?? 0)
						hashCombine(seed: &hash, value: self.singleton.hashValue)
						return hash
					}()
					
					override public var hashValue: Int {
						return _hashValue
					}
					
					public static func ==(lhs: Killmails.Killmail.Victim.Item, rhs: Killmails.Killmail.Victim.Item) -> Bool {
						return lhs.hashValue == rhs.hashValue
					}
					
					init(_ other: Killmails.Killmail.Victim.Item) {
						flag = other.flag
						itemTypeID = other.itemTypeID
						items = other.items?.flatMap { Killmails.Killmail.Victim.Item.Item($0) }
						quantityDestroyed = other.quantityDestroyed
						quantityDropped = other.quantityDropped
						singleton = other.singleton
					}
					
					public func copy(with zone: NSZone? = nil) -> Any {
						return Killmails.Killmail.Victim.Item(self)
					}
					
					
					public override func isEqual(_ object: Any?) -> Bool {
						return (object as? Item)?.hashValue == hashValue
					}
					
				}
				
				public var allianceID: Int? = nil
				public var characterID: Int? = nil
				public var corporationID: Int? = nil
				public var damageTaken: Int = Int()
				public var factionID: Int? = nil
				public var items: [Killmails.Killmail.Victim.Item]? = nil
				public var position: Killmails.Killmail.Victim.GetKillmailsKillmailIDKillmailHashPosition? = nil
				public var shipTypeID: Int = Int()
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					allianceID = dictionary["alliance_id"] as? Int
					characterID = dictionary["character_id"] as? Int
					corporationID = dictionary["corporation_id"] as? Int
					guard let damageTaken = dictionary["damage_taken"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.damageTaken = damageTaken
					factionID = dictionary["faction_id"] as? Int
					items = try (dictionary["items"] as? [Any])?.map {try Killmails.Killmail.Victim.Item(json: $0)}
					position = try? Killmails.Killmail.Victim.GetKillmailsKillmailIDKillmailHashPosition(json: dictionary["position"] as? [String: Any] ?? [:])
					guard let shipTypeID = dictionary["ship_type_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.shipTypeID = shipTypeID
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init?(coder aDecoder: NSCoder) {
					allianceID = aDecoder.containsValue(forKey: "alliance_id") ? aDecoder.decodeInteger(forKey: "alliance_id") : nil
					characterID = aDecoder.containsValue(forKey: "character_id") ? aDecoder.decodeInteger(forKey: "character_id") : nil
					corporationID = aDecoder.containsValue(forKey: "corporation_id") ? aDecoder.decodeInteger(forKey: "corporation_id") : nil
					damageTaken = aDecoder.decodeInteger(forKey: "damage_taken")
					factionID = aDecoder.containsValue(forKey: "faction_id") ? aDecoder.decodeInteger(forKey: "faction_id") : nil
					items = aDecoder.decodeObject(of: [Killmails.Killmail.Victim.Item.self], forKey: "items") as? [Killmails.Killmail.Victim.Item]
					position = aDecoder.decodeObject(of: Killmails.Killmail.Victim.GetKillmailsKillmailIDKillmailHashPosition.self, forKey: "position") 
					shipTypeID = aDecoder.decodeInteger(forKey: "ship_type_id")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					if let v = allianceID {
						aCoder.encode(v, forKey: "alliance_id")
					}
					if let v = characterID {
						aCoder.encode(v, forKey: "character_id")
					}
					if let v = corporationID {
						aCoder.encode(v, forKey: "corporation_id")
					}
					aCoder.encode(damageTaken, forKey: "damage_taken")
					if let v = factionID {
						aCoder.encode(v, forKey: "faction_id")
					}
					if let v = items {
						aCoder.encode(v, forKey: "items")
					}
					if let v = position {
						aCoder.encode(v, forKey: "position")
					}
					aCoder.encode(shipTypeID, forKey: "ship_type_id")
				}
				
				public var json: Any {
					var json = [String: Any]()
					if let v = allianceID?.json {
						json["alliance_id"] = v
					}
					if let v = characterID?.json {
						json["character_id"] = v
					}
					if let v = corporationID?.json {
						json["corporation_id"] = v
					}
					json["damage_taken"] = damageTaken.json
					if let v = factionID?.json {
						json["faction_id"] = v
					}
					if let v = items?.json {
						json["items"] = v
					}
					if let v = position?.json {
						json["position"] = v
					}
					json["ship_type_id"] = shipTypeID.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.allianceID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.characterID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.corporationID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.damageTaken.hashValue)
					hashCombine(seed: &hash, value: self.factionID?.hashValue ?? 0)
					self.items?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					hashCombine(seed: &hash, value: self.position?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.shipTypeID.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: Killmails.Killmail.Victim, rhs: Killmails.Killmail.Victim) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Killmails.Killmail.Victim) {
					allianceID = other.allianceID
					characterID = other.characterID
					corporationID = other.corporationID
					damageTaken = other.damageTaken
					factionID = other.factionID
					items = other.items?.flatMap { Killmails.Killmail.Victim.Item($0) }
					position = other.position != nil ? Killmails.Killmail.Victim.GetKillmailsKillmailIDKillmailHashPosition(other.position!) : nil
					shipTypeID = other.shipTypeID
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Killmails.Killmail.Victim(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? Victim)?.hashValue == hashValue
				}
				
			}
			
			public var attackers: [Killmails.Killmail.Attacker] = []
			public var killmailID: Int = Int()
			public var killmailTime: Date = Date()
			public var moonID: Int? = nil
			public var solarSystemID: Int = Int()
			public var victim: Killmails.Killmail.Victim = Killmails.Killmail.Victim()
			public var warID: Int? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				attackers = try (dictionary["attackers"] as? [Any])?.map {try Killmails.Killmail.Attacker(json: $0)} ?? []
				guard let killmailID = dictionary["killmail_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.killmailID = killmailID
				guard let killmailTime = DateFormatter.esiDateTimeFormatter.date(from: dictionary["killmail_time"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.killmailTime = killmailTime
				moonID = dictionary["moon_id"] as? Int
				guard let solarSystemID = dictionary["solar_system_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.solarSystemID = solarSystemID
				victim = try Killmails.Killmail.Victim(json: dictionary["victim"] as? [String: Any] ?? [:])
				warID = dictionary["war_id"] as? Int
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				attackers = aDecoder.decodeObject(of: [Killmails.Killmail.Attacker.self], forKey: "attackers") as? [Killmails.Killmail.Attacker] ?? []
				killmailID = aDecoder.decodeInteger(forKey: "killmail_id")
				killmailTime = aDecoder.decodeObject(forKey: "killmail_time") as? Date ?? Date()
				moonID = aDecoder.containsValue(forKey: "moon_id") ? aDecoder.decodeInteger(forKey: "moon_id") : nil
				solarSystemID = aDecoder.decodeInteger(forKey: "solar_system_id")
				victim = aDecoder.decodeObject(of: Killmails.Killmail.Victim.self, forKey: "victim")  ?? Killmails.Killmail.Victim()
				warID = aDecoder.containsValue(forKey: "war_id") ? aDecoder.decodeInteger(forKey: "war_id") : nil
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(attackers, forKey: "attackers")
				aCoder.encode(killmailID, forKey: "killmail_id")
				aCoder.encode(killmailTime, forKey: "killmail_time")
				if let v = moonID {
					aCoder.encode(v, forKey: "moon_id")
				}
				aCoder.encode(solarSystemID, forKey: "solar_system_id")
				aCoder.encode(victim, forKey: "victim")
				if let v = warID {
					aCoder.encode(v, forKey: "war_id")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["attackers"] = attackers.json
				json["killmail_id"] = killmailID.json
				json["killmail_time"] = killmailTime.json
				if let v = moonID?.json {
					json["moon_id"] = v
				}
				json["solar_system_id"] = solarSystemID.json
				json["victim"] = victim.json
				if let v = warID?.json {
					json["war_id"] = v
				}
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.attackers.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: self.killmailID.hashValue)
				hashCombine(seed: &hash, value: self.killmailTime.hashValue)
				hashCombine(seed: &hash, value: self.moonID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.solarSystemID.hashValue)
				hashCombine(seed: &hash, value: self.victim.hashValue)
				hashCombine(seed: &hash, value: self.warID?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Killmails.Killmail, rhs: Killmails.Killmail) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Killmails.Killmail) {
				attackers = other.attackers.flatMap { Killmails.Killmail.Attacker($0) }
				killmailID = other.killmailID
				killmailTime = other.killmailTime
				moonID = other.moonID
				solarSystemID = other.solarSystemID
				victim = Killmails.Killmail.Victim(other.victim)
				warID = other.warID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Killmails.Killmail(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Killmail)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIKillmailsRecent) public class Recent: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var killmailHash: String = String()
			public var killmailID: Int = Int()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let killmailHash = dictionary["killmail_hash"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.killmailHash = killmailHash
				guard let killmailID = dictionary["killmail_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.killmailID = killmailID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				killmailHash = aDecoder.decodeObject(forKey: "killmail_hash") as? String ?? String()
				killmailID = aDecoder.decodeInteger(forKey: "killmail_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(killmailHash, forKey: "killmail_hash")
				aCoder.encode(killmailID, forKey: "killmail_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["killmail_hash"] = killmailHash.json
				json["killmail_id"] = killmailID.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.killmailHash.hashValue)
				hashCombine(seed: &hash, value: self.killmailID.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Killmails.Recent, rhs: Killmails.Recent) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Killmails.Recent) {
				killmailHash = other.killmailHash
				killmailID = other.killmailID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Killmails.Recent(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Recent)?.hashValue == hashValue
			}
			
		}
		
		
	}
	
}
