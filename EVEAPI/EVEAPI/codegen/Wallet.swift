import Foundation
import Alamofire


public extension ESI {
	public var wallet: Wallet {
		return Wallet(sessionManager: self)
	}
	
	class Wallet {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		public func getCharacterWalletJournal(characterID: Int, fromID: Int64? = nil, completionBlock:((Result<[Wallet.GetCharactersCharacterIDWalletsJournalOk]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-wallet.read_character_wallet.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = fromID?.httpQuery {
				query.append(URLQueryItem(name: "from_id", value: v))
			}
			
			let url = session!.baseURL + "latest/characters/\(characterID)/wallets/journal/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Wallet.GetCharactersCharacterIDWalletsJournalOk]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func listWalletsAndBalances(characterID: Int, completionBlock:((Result<[Wallet.Balance]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-wallet.read_character_wallet.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/wallets/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Wallet.Balance]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		public class GetCharactersCharacterIDWalletsForbidden: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Wallet.GetCharactersCharacterIDWalletsForbidden, rhs: Wallet.GetCharactersCharacterIDWalletsForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Wallet.GetCharactersCharacterIDWalletsForbidden) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Wallet.GetCharactersCharacterIDWalletsForbidden(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCharactersCharacterIDWalletsForbidden)?.hashValue == hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDWalletsJournalForbidden: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Wallet.GetCharactersCharacterIDWalletsJournalForbidden, rhs: Wallet.GetCharactersCharacterIDWalletsJournalForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Wallet.GetCharactersCharacterIDWalletsJournalForbidden) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Wallet.GetCharactersCharacterIDWalletsJournalForbidden(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCharactersCharacterIDWalletsJournalForbidden)?.hashValue == hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDWalletsInternalServerError: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Wallet.GetCharactersCharacterIDWalletsInternalServerError, rhs: Wallet.GetCharactersCharacterIDWalletsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Wallet.GetCharactersCharacterIDWalletsInternalServerError) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Wallet.GetCharactersCharacterIDWalletsInternalServerError(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCharactersCharacterIDWalletsInternalServerError)?.hashValue == hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDWalletsJournalInternalServerError: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Wallet.GetCharactersCharacterIDWalletsJournalInternalServerError, rhs: Wallet.GetCharactersCharacterIDWalletsJournalInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Wallet.GetCharactersCharacterIDWalletsJournalInternalServerError) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Wallet.GetCharactersCharacterIDWalletsJournalInternalServerError(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCharactersCharacterIDWalletsJournalInternalServerError)?.hashValue == hashValue
			}
			
		}
		
		
		public class Balance: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var balance: Int64? = nil
			public var walletID: Int? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				balance = dictionary["balance"] as? Int64
				walletID = dictionary["wallet_id"] as? Int
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				balance = aDecoder.containsValue(forKey: "balance") ? aDecoder.decodeInt64(forKey: "balance") : nil
				walletID = aDecoder.containsValue(forKey: "wallet_id") ? aDecoder.decodeInteger(forKey: "wallet_id") : nil
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = balance {
					aCoder.encode(v, forKey: "balance")
				}
				if let v = walletID {
					aCoder.encode(v, forKey: "wallet_id")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = balance?.json {
					json["balance"] = v
				}
				if let v = walletID?.json {
					json["wallet_id"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: balance?.hashValue ?? 0)
				hashCombine(seed: &hash, value: walletID?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Wallet.Balance, rhs: Wallet.Balance) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Wallet.Balance) {
				balance = other.balance
				walletID = other.walletID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Wallet.Balance(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Balance)?.hashValue == hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDWalletsJournalOk: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public enum GetCharactersCharacterIDWalletsJournalSecondPartyType: String, JSONCoding, HTTPQueryable {
				case alliance = "alliance"
				case character = "character"
				case corporation = "corporation"
				case faction = "faction"
				
				public init() {
					self = .character
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCharactersCharacterIDWalletsJournalSecondPartyType(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCharactersCharacterIDWalletsJournalFirstPartyType: String, JSONCoding, HTTPQueryable {
				case alliance = "alliance"
				case character = "character"
				case corporation = "corporation"
				case faction = "faction"
				
				public init() {
					self = .character
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCharactersCharacterIDWalletsJournalFirstPartyType(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var amount: Float? = nil
			public var argumentName: String? = nil
			public var argumentValue: Int? = nil
			public var balance: Float? = nil
			public var date: Date = Date()
			public var firstPartyID: Int? = nil
			public var firstPartyType: Wallet.GetCharactersCharacterIDWalletsJournalOk.GetCharactersCharacterIDWalletsJournalFirstPartyType? = nil
			public var reason: String? = nil
			public var refID: Int64 = Int64()
			public var refTypeID: Int = Int()
			public var secondPartyID: Int? = nil
			public var secondPartyType: Wallet.GetCharactersCharacterIDWalletsJournalOk.GetCharactersCharacterIDWalletsJournalSecondPartyType? = nil
			public var taxAmount: Float? = nil
			public var taxRecieverID: Int? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				amount = dictionary["amount"] as? Float
				argumentName = dictionary["argument_name"] as? String
				argumentValue = dictionary["argument_value"] as? Int
				balance = dictionary["balance"] as? Float
				guard let date = DateFormatter.esiDateTimeFormatter.date(from: dictionary["date"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.date = date
				firstPartyID = dictionary["first_party_id"] as? Int
				firstPartyType = Wallet.GetCharactersCharacterIDWalletsJournalOk.GetCharactersCharacterIDWalletsJournalFirstPartyType(rawValue: dictionary["first_party_type"] as? String ?? "")
				reason = dictionary["reason"] as? String
				guard let refID = dictionary["ref_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.refID = refID
				guard let refTypeID = dictionary["ref_type_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.refTypeID = refTypeID
				secondPartyID = dictionary["second_party_id"] as? Int
				secondPartyType = Wallet.GetCharactersCharacterIDWalletsJournalOk.GetCharactersCharacterIDWalletsJournalSecondPartyType(rawValue: dictionary["second_party_type"] as? String ?? "")
				taxAmount = dictionary["tax_amount"] as? Float
				taxRecieverID = dictionary["tax_reciever_id"] as? Int
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				amount = aDecoder.containsValue(forKey: "amount") ? aDecoder.decodeFloat(forKey: "amount") : nil
				argumentName = aDecoder.decodeObject(forKey: "argument_name") as? String
				argumentValue = aDecoder.containsValue(forKey: "argument_value") ? aDecoder.decodeInteger(forKey: "argument_value") : nil
				balance = aDecoder.containsValue(forKey: "balance") ? aDecoder.decodeFloat(forKey: "balance") : nil
				date = aDecoder.decodeObject(forKey: "date") as? Date ?? Date()
				firstPartyID = aDecoder.containsValue(forKey: "first_party_id") ? aDecoder.decodeInteger(forKey: "first_party_id") : nil
				firstPartyType = Wallet.GetCharactersCharacterIDWalletsJournalOk.GetCharactersCharacterIDWalletsJournalFirstPartyType(rawValue: aDecoder.decodeObject(forKey: "first_party_type") as? String ?? "")
				reason = aDecoder.decodeObject(forKey: "reason") as? String
				refID = aDecoder.decodeInt64(forKey: "ref_id")
				refTypeID = aDecoder.decodeInteger(forKey: "ref_type_id")
				secondPartyID = aDecoder.containsValue(forKey: "second_party_id") ? aDecoder.decodeInteger(forKey: "second_party_id") : nil
				secondPartyType = Wallet.GetCharactersCharacterIDWalletsJournalOk.GetCharactersCharacterIDWalletsJournalSecondPartyType(rawValue: aDecoder.decodeObject(forKey: "second_party_type") as? String ?? "")
				taxAmount = aDecoder.containsValue(forKey: "tax_amount") ? aDecoder.decodeFloat(forKey: "tax_amount") : nil
				taxRecieverID = aDecoder.containsValue(forKey: "tax_reciever_id") ? aDecoder.decodeInteger(forKey: "tax_reciever_id") : nil
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = amount {
					aCoder.encode(v, forKey: "amount")
				}
				if let v = argumentName {
					aCoder.encode(v, forKey: "argument_name")
				}
				if let v = argumentValue {
					aCoder.encode(v, forKey: "argument_value")
				}
				if let v = balance {
					aCoder.encode(v, forKey: "balance")
				}
				aCoder.encode(date, forKey: "date")
				if let v = firstPartyID {
					aCoder.encode(v, forKey: "first_party_id")
				}
				if let v = firstPartyType {
					aCoder.encode(v.rawValue, forKey: "first_party_type")
				}
				if let v = reason {
					aCoder.encode(v, forKey: "reason")
				}
				aCoder.encode(refID, forKey: "ref_id")
				aCoder.encode(refTypeID, forKey: "ref_type_id")
				if let v = secondPartyID {
					aCoder.encode(v, forKey: "second_party_id")
				}
				if let v = secondPartyType {
					aCoder.encode(v.rawValue, forKey: "second_party_type")
				}
				if let v = taxAmount {
					aCoder.encode(v, forKey: "tax_amount")
				}
				if let v = taxRecieverID {
					aCoder.encode(v, forKey: "tax_reciever_id")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = amount?.json {
					json["amount"] = v
				}
				if let v = argumentName?.json {
					json["argument_name"] = v
				}
				if let v = argumentValue?.json {
					json["argument_value"] = v
				}
				if let v = balance?.json {
					json["balance"] = v
				}
				json["date"] = date.json
				if let v = firstPartyID?.json {
					json["first_party_id"] = v
				}
				if let v = firstPartyType?.json {
					json["first_party_type"] = v
				}
				if let v = reason?.json {
					json["reason"] = v
				}
				json["ref_id"] = refID.json
				json["ref_type_id"] = refTypeID.json
				if let v = secondPartyID?.json {
					json["second_party_id"] = v
				}
				if let v = secondPartyType?.json {
					json["second_party_type"] = v
				}
				if let v = taxAmount?.json {
					json["tax_amount"] = v
				}
				if let v = taxRecieverID?.json {
					json["tax_reciever_id"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: amount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: argumentName?.hashValue ?? 0)
				hashCombine(seed: &hash, value: argumentValue?.hashValue ?? 0)
				hashCombine(seed: &hash, value: balance?.hashValue ?? 0)
				hashCombine(seed: &hash, value: date.hashValue)
				hashCombine(seed: &hash, value: firstPartyID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: firstPartyType?.hashValue ?? 0)
				hashCombine(seed: &hash, value: reason?.hashValue ?? 0)
				hashCombine(seed: &hash, value: refID.hashValue)
				hashCombine(seed: &hash, value: refTypeID.hashValue)
				hashCombine(seed: &hash, value: secondPartyID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: secondPartyType?.hashValue ?? 0)
				hashCombine(seed: &hash, value: taxAmount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: taxRecieverID?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Wallet.GetCharactersCharacterIDWalletsJournalOk, rhs: Wallet.GetCharactersCharacterIDWalletsJournalOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Wallet.GetCharactersCharacterIDWalletsJournalOk) {
				amount = other.amount
				argumentName = other.argumentName
				argumentValue = other.argumentValue
				balance = other.balance
				date = other.date
				firstPartyID = other.firstPartyID
				firstPartyType = other.firstPartyType
				reason = other.reason
				refID = other.refID
				refTypeID = other.refTypeID
				secondPartyID = other.secondPartyID
				secondPartyType = other.secondPartyType
				taxAmount = other.taxAmount
				taxRecieverID = other.taxRecieverID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Wallet.GetCharactersCharacterIDWalletsJournalOk(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCharactersCharacterIDWalletsJournalOk)?.hashValue == hashValue
			}
			
		}
		
		
	}
	
}
