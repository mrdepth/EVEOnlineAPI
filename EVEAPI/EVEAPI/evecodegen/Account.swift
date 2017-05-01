import Foundation
import Alamofire


public extension EVE {
	public var account: Account {
		return Account(sessionManager: self)
	}
	
	class Account {
		weak var sessionManager: EVE?
		
		init(sessionManager: EVE) {
			self.sessionManager = sessionManager
		}
		
		public func aPIKeyInfo(completionBlock:((Result<EVE.Account.APIKeyInfo>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let parameters = Parameters()
			
			let url = session!.baseURL + "Account/APIKeyInfo.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Account.APIKeyInfo>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func accountStatus(completionBlock:((Result<EVE.Account.AccountStatus>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let parameters = Parameters()
			
			let url = session!.baseURL + "Account/AccountStatus.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Account.AccountStatus>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func characters(completionBlock:((Result<EVE.Account.Characters>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let parameters = Parameters()
			
			let url = session!.baseURL + "Account/Characters.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Account.Characters>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		public class APIKeyInfo: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class APIKey: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				public enum APIKeyType: String, JSONCoding {
					case account = "Account"
					case character = "Character"
					case corporation = "Corporation"
					
					public init() {
						self = .account
					}
					
					public var json: Any {
						return self.rawValue
					}
					
					public init(json: Any) throws {
						guard let s = json as? String, let v = APIKeyType(rawValue: s) else {throw EVEError.invalidFormat(type(of: self), json)}
						self = v
					}
					
				}
				
				public class Character: NSObject, NSSecureCoding, NSCopying, JSONCoding {
					
					
					public var allianceID: Int64? = nil
					public var allianceName: String? = nil
					public var characterID: Int64 = Int64()
					public var characterName: String = String()
					public var corporationID: Int64 = Int64()
					public var corporationName: String = String()
					public var factionID: Int? = nil
					public var factionName: String? = nil
					
					public static var supportsSecureCoding: Bool {
						return true
					}
					
					public required init(json: Any) throws {
						guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
						
						allianceID = dictionary["allianceID"] as? Int64
						allianceName = dictionary["allianceName"] as? String
						guard let characterID = dictionary["characterID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
						self.characterID = characterID
						guard let characterName = dictionary["characterName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
						self.characterName = characterName
						guard let corporationID = dictionary["corporationID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
						self.corporationID = corporationID
						guard let corporationName = dictionary["corporationName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
						self.corporationName = corporationName
						factionID = dictionary["factionID"] as? Int
						factionName = dictionary["factionName"] as? String
						
						super.init()
					}
					
					override public init() {
						super.init()
					}
					
					public required init?(coder aDecoder: NSCoder) {
						allianceID = aDecoder.containsValue(forKey: "allianceID") ? aDecoder.decodeInt64(forKey: "allianceID") : nil
						allianceName = aDecoder.decodeObject(forKey: "allianceName") as? String
						characterID = aDecoder.decodeInt64(forKey: "characterID")
						characterName = aDecoder.decodeObject(forKey: "characterName") as? String ?? String()
						corporationID = aDecoder.decodeInt64(forKey: "corporationID")
						corporationName = aDecoder.decodeObject(forKey: "corporationName") as? String ?? String()
						factionID = aDecoder.containsValue(forKey: "factionID") ? aDecoder.decodeInteger(forKey: "factionID") : nil
						factionName = aDecoder.decodeObject(forKey: "factionName") as? String
						
						super.init()
					}
					
					public func encode(with aCoder: NSCoder) {
						if let v = allianceID {
							aCoder.encode(v, forKey: "allianceID")
						}
						if let v = allianceName {
							aCoder.encode(v, forKey: "allianceName")
						}
						aCoder.encode(characterID, forKey: "characterID")
						aCoder.encode(characterName, forKey: "characterName")
						aCoder.encode(corporationID, forKey: "corporationID")
						aCoder.encode(corporationName, forKey: "corporationName")
						if let v = factionID {
							aCoder.encode(v, forKey: "factionID")
						}
						if let v = factionName {
							aCoder.encode(v, forKey: "factionName")
						}
					}
					
					public var json: Any {
						var json = [String: Any]()
						if let v = allianceID?.json {
							json["allianceID"] = v
						}
						if let v = allianceName?.json {
							json["allianceName"] = v
						}
						json["characterID"] = characterID.json
						json["characterName"] = characterName.json
						json["corporationID"] = corporationID.json
						json["corporationName"] = corporationName.json
						if let v = factionID?.json {
							json["factionID"] = v
						}
						if let v = factionName?.json {
							json["factionName"] = v
						}
						return json
					}
					
					override public var hashValue: Int {
						var hash: Int = 0
						hashCombine(seed: &hash, value: allianceID?.hashValue ?? 0)
						hashCombine(seed: &hash, value: allianceName?.hashValue ?? 0)
						hashCombine(seed: &hash, value: characterID.hashValue)
						hashCombine(seed: &hash, value: characterName.hashValue)
						hashCombine(seed: &hash, value: corporationID.hashValue)
						hashCombine(seed: &hash, value: corporationName.hashValue)
						hashCombine(seed: &hash, value: factionID?.hashValue ?? 0)
						hashCombine(seed: &hash, value: factionName?.hashValue ?? 0)
						return hash
					}
					
					public static func ==(lhs: EVE.Account.APIKeyInfo.APIKey.Character, rhs: EVE.Account.APIKeyInfo.APIKey.Character) -> Bool {
						return lhs.hashValue == rhs.hashValue
					}
					
					init(_ other: EVE.Account.APIKeyInfo.APIKey.Character) {
						allianceID = other.allianceID
						allianceName = other.allianceName
						characterID = other.characterID
						characterName = other.characterName
						corporationID = other.corporationID
						corporationName = other.corporationName
						factionID = other.factionID
						factionName = other.factionName
					}
					
					public func copy(with zone: NSZone? = nil) -> Any {
						return EVE.Account.APIKeyInfo.APIKey.Character(self)
					}
					
					
					public override func isEqual(_ object: Any?) -> Bool {
						return (object as? EVE.Account.APIKeyInfo.APIKey.Character)?.hashValue == hashValue
					}
					
				}
				
				public var accessMask: Int = Int()
				public var characters: [EVE.Account.APIKeyInfo.APIKey.Character] = []
				public var expires: Date? = nil
				public var type: EVE.Account.APIKeyInfo.APIKey.APIKeyType = EVE.Account.APIKeyInfo.APIKey.APIKeyType()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let accessMask = dictionary["accessMask"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.accessMask = accessMask
					guard let characters = try dictionary.rowset(name: "characters")?.map ({try EVE.Account.APIKeyInfo.APIKey.Character(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.characters = characters
					expires = DateFormatter.eveDateFormatter.date(from: dictionary["expires"] as? String ?? "")
					guard let type = EVE.Account.APIKeyInfo.APIKey.APIKeyType(rawValue: dictionary["type"] as? String ?? String()) else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.type = type
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					accessMask = aDecoder.decodeInteger(forKey: "accessMask")
					characters = aDecoder.decodeObject(of: [EVE.Account.APIKeyInfo.APIKey.Character.self], forKey: "characters") as? [EVE.Account.APIKeyInfo.APIKey.Character] ?? []
					expires = aDecoder.decodeObject(forKey: "expires") as? Date
					type = EVE.Account.APIKeyInfo.APIKey.APIKeyType(rawValue: aDecoder.decodeObject(forKey: "type") as? String ?? String()) ?? EVE.Account.APIKeyInfo.APIKey.APIKeyType()
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(accessMask, forKey: "accessMask")
					aCoder.encode(characters, forKey: "characters")
					if let v = expires {
						aCoder.encode(v, forKey: "expires")
					}
					aCoder.encode(type.rawValue, forKey: "APIKeyType")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["accessMask"] = accessMask.json
					json["characters"] = characters.json
					if let v = expires?.json {
						json["expires"] = v
					}
					json["type"] = type.json
					return json
				}
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: accessMask.hashValue)
					characters.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					hashCombine(seed: &hash, value: expires?.hashValue ?? 0)
					hashCombine(seed: &hash, value: type.hashValue)
					return hash
				}
				
				public static func ==(lhs: EVE.Account.APIKeyInfo.APIKey, rhs: EVE.Account.APIKeyInfo.APIKey) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Account.APIKeyInfo.APIKey) {
					accessMask = other.accessMask
					characters = other.characters.flatMap { EVE.Account.APIKeyInfo.APIKey.Character($0) }
					expires = other.expires
					type = other.type
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Account.APIKeyInfo.APIKey(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Account.APIKeyInfo.APIKey)?.hashValue == hashValue
				}
				
			}
			
			public var key: EVE.Account.APIKeyInfo.APIKey = EVE.Account.APIKeyInfo.APIKey()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				key = try EVE.Account.APIKeyInfo.APIKey(json: dictionary["key"] as? [String: Any] ?? [:])
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				key = aDecoder.decodeObject(of: EVE.Account.APIKeyInfo.APIKey.self, forKey: "key")  ?? EVE.Account.APIKeyInfo.APIKey()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(key, forKey: "key")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["key"] = key.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: key.hashValue)
				return hash
			}
			
			public static func ==(lhs: EVE.Account.APIKeyInfo, rhs: EVE.Account.APIKeyInfo) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Account.APIKeyInfo) {
				key = EVE.Account.APIKeyInfo.APIKey(other.key)
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Account.APIKeyInfo(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Account.APIKeyInfo)?.hashValue == hashValue
			}
			
		}
		
		
		public class AccountStatus: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class MultiCharacterTraining: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var trainingEnd: Date = Date()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let trainingEnd = DateFormatter.eveDateFormatter.date(from: dictionary["trainingEnd"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.trainingEnd = trainingEnd
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					trainingEnd = aDecoder.decodeObject(forKey: "trainingEnd") as? Date ?? Date()
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(trainingEnd, forKey: "trainingEnd")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["trainingEnd"] = trainingEnd.json
					return json
				}
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: trainingEnd.hashValue)
					return hash
				}
				
				public static func ==(lhs: EVE.Account.AccountStatus.MultiCharacterTraining, rhs: EVE.Account.AccountStatus.MultiCharacterTraining) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Account.AccountStatus.MultiCharacterTraining) {
					trainingEnd = other.trainingEnd
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Account.AccountStatus.MultiCharacterTraining(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Account.AccountStatus.MultiCharacterTraining)?.hashValue == hashValue
				}
				
			}
			
			public var createDate: Date = Date()
			public var logonCount: Int = Int()
			public var logonMinutes: Int = Int()
			public var multiCharacterTraining: [EVE.Account.AccountStatus.MultiCharacterTraining] = []
			public var paidUntil: Date? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let createDate = DateFormatter.eveDateFormatter.date(from: dictionary["createDate"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.createDate = createDate
				guard let logonCount = dictionary["logonCount"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.logonCount = logonCount
				guard let logonMinutes = dictionary["logonMinutes"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.logonMinutes = logonMinutes
				guard let multiCharacterTraining = try dictionary.rowset(name: "multiCharacterTraining")?.map ({try EVE.Account.AccountStatus.MultiCharacterTraining(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.multiCharacterTraining = multiCharacterTraining
				paidUntil = DateFormatter.eveDateFormatter.date(from: dictionary["paidUntil"] as? String ?? "")
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				createDate = aDecoder.decodeObject(forKey: "createDate") as? Date ?? Date()
				logonCount = aDecoder.decodeInteger(forKey: "logonCount")
				logonMinutes = aDecoder.decodeInteger(forKey: "logonMinutes")
				multiCharacterTraining = aDecoder.decodeObject(of: [EVE.Account.AccountStatus.MultiCharacterTraining.self], forKey: "multiCharacterTraining") as? [EVE.Account.AccountStatus.MultiCharacterTraining] ?? []
				paidUntil = aDecoder.decodeObject(forKey: "paidUntil") as? Date
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(createDate, forKey: "createDate")
				aCoder.encode(logonCount, forKey: "logonCount")
				aCoder.encode(logonMinutes, forKey: "logonMinutes")
				aCoder.encode(multiCharacterTraining, forKey: "multiCharacterTraining")
				if let v = paidUntil {
					aCoder.encode(v, forKey: "paidUntil")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["createDate"] = createDate.json
				json["logonCount"] = logonCount.json
				json["logonMinutes"] = logonMinutes.json
				json["multiCharacterTraining"] = multiCharacterTraining.json
				if let v = paidUntil?.json {
					json["paidUntil"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: createDate.hashValue)
				hashCombine(seed: &hash, value: logonCount.hashValue)
				hashCombine(seed: &hash, value: logonMinutes.hashValue)
				multiCharacterTraining.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: paidUntil?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: EVE.Account.AccountStatus, rhs: EVE.Account.AccountStatus) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Account.AccountStatus) {
				createDate = other.createDate
				logonCount = other.logonCount
				logonMinutes = other.logonMinutes
				multiCharacterTraining = other.multiCharacterTraining.flatMap { EVE.Account.AccountStatus.MultiCharacterTraining($0) }
				paidUntil = other.paidUntil
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Account.AccountStatus(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Account.AccountStatus)?.hashValue == hashValue
			}
			
		}
		
		
		public class Characters: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class Character: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var allianceID: Int64? = nil
				public var allianceName: String? = nil
				public var characterID: Int64 = Int64()
				public var characterName: String = String()
				public var corporationID: Int64 = Int64()
				public var corporationName: String = String()
				public var factionID: Int? = nil
				public var factionName: String? = nil
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					allianceID = dictionary["allianceID"] as? Int64
					allianceName = dictionary["allianceName"] as? String
					guard let characterID = dictionary["characterID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.characterID = characterID
					guard let characterName = dictionary["name"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.characterName = characterName
					guard let corporationID = dictionary["corporationID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.corporationID = corporationID
					guard let corporationName = dictionary["corporationName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.corporationName = corporationName
					factionID = dictionary["factionID"] as? Int
					factionName = dictionary["factionName"] as? String
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					allianceID = aDecoder.containsValue(forKey: "allianceID") ? aDecoder.decodeInt64(forKey: "allianceID") : nil
					allianceName = aDecoder.decodeObject(forKey: "allianceName") as? String
					characterID = aDecoder.decodeInt64(forKey: "characterID")
					characterName = aDecoder.decodeObject(forKey: "name") as? String ?? String()
					corporationID = aDecoder.decodeInt64(forKey: "corporationID")
					corporationName = aDecoder.decodeObject(forKey: "corporationName") as? String ?? String()
					factionID = aDecoder.containsValue(forKey: "factionID") ? aDecoder.decodeInteger(forKey: "factionID") : nil
					factionName = aDecoder.decodeObject(forKey: "factionName") as? String
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					if let v = allianceID {
						aCoder.encode(v, forKey: "allianceID")
					}
					if let v = allianceName {
						aCoder.encode(v, forKey: "allianceName")
					}
					aCoder.encode(characterID, forKey: "characterID")
					aCoder.encode(characterName, forKey: "characterName")
					aCoder.encode(corporationID, forKey: "corporationID")
					aCoder.encode(corporationName, forKey: "corporationName")
					if let v = factionID {
						aCoder.encode(v, forKey: "factionID")
					}
					if let v = factionName {
						aCoder.encode(v, forKey: "factionName")
					}
				}
				
				public var json: Any {
					var json = [String: Any]()
					if let v = allianceID?.json {
						json["allianceID"] = v
					}
					if let v = allianceName?.json {
						json["allianceName"] = v
					}
					json["characterID"] = characterID.json
					json["characterName"] = characterName.json
					json["corporationID"] = corporationID.json
					json["corporationName"] = corporationName.json
					if let v = factionID?.json {
						json["factionID"] = v
					}
					if let v = factionName?.json {
						json["factionName"] = v
					}
					return json
				}
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: allianceID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: allianceName?.hashValue ?? 0)
					hashCombine(seed: &hash, value: characterID.hashValue)
					hashCombine(seed: &hash, value: characterName.hashValue)
					hashCombine(seed: &hash, value: corporationID.hashValue)
					hashCombine(seed: &hash, value: corporationName.hashValue)
					hashCombine(seed: &hash, value: factionID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: factionName?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: EVE.Account.Characters.Character, rhs: EVE.Account.Characters.Character) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Account.Characters.Character) {
					allianceID = other.allianceID
					allianceName = other.allianceName
					characterID = other.characterID
					characterName = other.characterName
					corporationID = other.corporationID
					corporationName = other.corporationName
					factionID = other.factionID
					factionName = other.factionName
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Account.Characters.Character(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Account.Characters.Character)?.hashValue == hashValue
				}
				
			}
			
			public var characters: EVE.Account.Characters.Character = EVE.Account.Characters.Character()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				characters = try EVE.Account.Characters.Character(json: dictionary["characters"] as? [String: Any] ?? [:])
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				characters = aDecoder.decodeObject(of: EVE.Account.Characters.Character.self, forKey: "characters")  ?? EVE.Account.Characters.Character()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(characters, forKey: "characters")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["characters"] = characters.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: characters.hashValue)
				return hash
			}
			
			public static func ==(lhs: EVE.Account.Characters, rhs: EVE.Account.Characters) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Account.Characters) {
				characters = EVE.Account.Characters.Character(other.characters)
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Account.Characters(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Account.Characters)?.hashValue == hashValue
			}
			
		}
		
		
	}
	
}
