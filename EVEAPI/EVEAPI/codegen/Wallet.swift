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
		
		public func getWalletTransactions(characterID: Int, fromID: Int64? = nil, completionBlock:((Result<[Wallet.Transaction]>) -> Void)?) {
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
			
			let url = session!.baseURL + "latest/characters/\(characterID)/wallet/transactions/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Wallet.Transaction]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getCharacterWalletJournal(characterID: Int, fromID: Int64? = nil, completionBlock:((Result<[Wallet.WalletJournalItem]>) -> Void)?) {
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
			
			let url = session!.baseURL + "latest/characters/\(characterID)/wallet/journal/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Wallet.WalletJournalItem]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getCharactersWalletBalance(characterID: Int, completionBlock:((Result<Float>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-wallet.read_character_wallet.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/wallet/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Float>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		public class WalletJournalItem: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public enum PartyType: String, JSONCoding, HTTPQueryable {
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
					guard let s = json as? String, let v = PartyType(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum RefType: String, JSONCoding, HTTPQueryable {
				case allianceMaintenanceFee = "alliance_maintenance_fee"
				case bountyPrizeHistorical = "bounty_prize_historical"
				case bountyPrizes = "bounty_prizes"
				case brokerFee = "broker_fee"
				case contract = "contract"
				case corpAccountWithdrawal = "corp_account_withdrawal"
				case corporateRewardPayout = "corporate_reward_payout"
				case cspa = "cspa"
				case customsOfficeExportDuty = "customs_office_export_duty"
				case customsOfficeImportDuty = "customs_office_import_duty"
				case industryFacilityTax = "industry_facility_tax"
				case insurance = "insurance"
				case jumpCloneActivationFee = "jump_clone_activation_fee"
				case jumpCloneInstallationFee = "jump_clone_installation_fee"
				case logoChangeFee = "logo_change_fee"
				case manufacturing = "manufacturing"
				case marketEscrow = "market_escrow"
				case marketTransaction = "market_transaction"
				case medalCreationFee = "medal_creation_fee"
				case medalIssuingFee = "medal_issuing_fee"
				case missionReward = "mission_reward"
				case missionRewardBonus = "mission_reward_bonus"
				case officeRentalFee = "office_rental_fee"
				case playerDonation = "player_donation"
				case playerTrading = "player_trading"
				case projectDiscoveryReward = "project_discovery_reward"
				case reprocessingFee = "reprocessing_fee"
				case salesTax = "sales_tax"
				case unknown = "unknown"
				
				public init() {
					self = .playerTrading
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = RefType(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public class ExtraInfo: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var allianceID: Int? = nil
				public var characterID: Int? = nil
				public var contractID: Int? = nil
				public var corporationID: Int? = nil
				public var destroyedShipTypeID: Int? = nil
				public var jobID: Int? = nil
				public var locationID: Int64? = nil
				public var npcID: Int? = nil
				public var npcName: String? = nil
				public var planetID: Int? = nil
				public var systemID: Int? = nil
				public var transactionID: Int64? = nil
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					allianceID = dictionary["alliance_id"] as? Int
					characterID = dictionary["character_id"] as? Int
					contractID = dictionary["contract_id"] as? Int
					corporationID = dictionary["corporation_id"] as? Int
					destroyedShipTypeID = dictionary["destroyed_ship_type_id"] as? Int
					jobID = dictionary["job_id"] as? Int
					locationID = dictionary["location_id"] as? Int64
					npcID = dictionary["npc_id"] as? Int
					npcName = dictionary["npc_name"] as? String
					planetID = dictionary["planet_id"] as? Int
					systemID = dictionary["system_id"] as? Int
					transactionID = dictionary["transaction_id"] as? Int64
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					allianceID = aDecoder.containsValue(forKey: "alliance_id") ? aDecoder.decodeInteger(forKey: "alliance_id") : nil
					characterID = aDecoder.containsValue(forKey: "character_id") ? aDecoder.decodeInteger(forKey: "character_id") : nil
					contractID = aDecoder.containsValue(forKey: "contract_id") ? aDecoder.decodeInteger(forKey: "contract_id") : nil
					corporationID = aDecoder.containsValue(forKey: "corporation_id") ? aDecoder.decodeInteger(forKey: "corporation_id") : nil
					destroyedShipTypeID = aDecoder.containsValue(forKey: "destroyed_ship_type_id") ? aDecoder.decodeInteger(forKey: "destroyed_ship_type_id") : nil
					jobID = aDecoder.containsValue(forKey: "job_id") ? aDecoder.decodeInteger(forKey: "job_id") : nil
					locationID = aDecoder.containsValue(forKey: "location_id") ? aDecoder.decodeInt64(forKey: "location_id") : nil
					npcID = aDecoder.containsValue(forKey: "npc_id") ? aDecoder.decodeInteger(forKey: "npc_id") : nil
					npcName = aDecoder.decodeObject(forKey: "npc_name") as? String
					planetID = aDecoder.containsValue(forKey: "planet_id") ? aDecoder.decodeInteger(forKey: "planet_id") : nil
					systemID = aDecoder.containsValue(forKey: "system_id") ? aDecoder.decodeInteger(forKey: "system_id") : nil
					transactionID = aDecoder.containsValue(forKey: "transaction_id") ? aDecoder.decodeInt64(forKey: "transaction_id") : nil
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					if let v = allianceID {
						aCoder.encode(v, forKey: "alliance_id")
					}
					if let v = characterID {
						aCoder.encode(v, forKey: "character_id")
					}
					if let v = contractID {
						aCoder.encode(v, forKey: "contract_id")
					}
					if let v = corporationID {
						aCoder.encode(v, forKey: "corporation_id")
					}
					if let v = destroyedShipTypeID {
						aCoder.encode(v, forKey: "destroyed_ship_type_id")
					}
					if let v = jobID {
						aCoder.encode(v, forKey: "job_id")
					}
					if let v = locationID {
						aCoder.encode(v, forKey: "location_id")
					}
					if let v = npcID {
						aCoder.encode(v, forKey: "npc_id")
					}
					if let v = npcName {
						aCoder.encode(v, forKey: "npc_name")
					}
					if let v = planetID {
						aCoder.encode(v, forKey: "planet_id")
					}
					if let v = systemID {
						aCoder.encode(v, forKey: "system_id")
					}
					if let v = transactionID {
						aCoder.encode(v, forKey: "transaction_id")
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
					if let v = contractID?.json {
						json["contract_id"] = v
					}
					if let v = corporationID?.json {
						json["corporation_id"] = v
					}
					if let v = destroyedShipTypeID?.json {
						json["destroyed_ship_type_id"] = v
					}
					if let v = jobID?.json {
						json["job_id"] = v
					}
					if let v = locationID?.json {
						json["location_id"] = v
					}
					if let v = npcID?.json {
						json["npc_id"] = v
					}
					if let v = npcName?.json {
						json["npc_name"] = v
					}
					if let v = planetID?.json {
						json["planet_id"] = v
					}
					if let v = systemID?.json {
						json["system_id"] = v
					}
					if let v = transactionID?.json {
						json["transaction_id"] = v
					}
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.allianceID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.characterID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.contractID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.corporationID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.destroyedShipTypeID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.jobID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.locationID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.npcID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.npcName?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.planetID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.systemID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.transactionID?.hashValue ?? 0)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: Wallet.WalletJournalItem.ExtraInfo, rhs: Wallet.WalletJournalItem.ExtraInfo) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Wallet.WalletJournalItem.ExtraInfo) {
					allianceID = other.allianceID
					characterID = other.characterID
					contractID = other.contractID
					corporationID = other.corporationID
					destroyedShipTypeID = other.destroyedShipTypeID
					jobID = other.jobID
					locationID = other.locationID
					npcID = other.npcID
					npcName = other.npcName
					planetID = other.planetID
					systemID = other.systemID
					transactionID = other.transactionID
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Wallet.WalletJournalItem.ExtraInfo(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? ExtraInfo)?.hashValue == hashValue
				}
				
			}
			
			public var amount: Float? = nil
			public var balance: Float? = nil
			public var date: Date = Date()
			public var extraInfo: Wallet.WalletJournalItem.ExtraInfo? = nil
			public var firstPartyID: Int? = nil
			public var firstPartyType: Wallet.WalletJournalItem.PartyType? = nil
			public var reason: String? = nil
			public var refID: Int64 = Int64()
			public var refType: Wallet.WalletJournalItem.RefType = Wallet.WalletJournalItem.RefType()
			public var secondPartyID: Int? = nil
			public var secondPartyType: Wallet.WalletJournalItem.PartyType? = nil
			public var tax: Float? = nil
			public var taxRecieverID: Int? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				amount = dictionary["amount"] as? Float
				balance = dictionary["balance"] as? Float
				guard let date = DateFormatter.esiDateTimeFormatter.date(from: dictionary["date"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.date = date
				extraInfo = try? Wallet.WalletJournalItem.ExtraInfo(json: dictionary["extra_info"] as? [String: Any] ?? [:])
				firstPartyID = dictionary["first_party_id"] as? Int
				firstPartyType = Wallet.WalletJournalItem.PartyType(rawValue: dictionary["first_party_type"] as? String ?? "")
				reason = dictionary["reason"] as? String
				guard let refID = dictionary["ref_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.refID = refID
				guard let refType = Wallet.WalletJournalItem.RefType(rawValue: dictionary["ref_type"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.refType = refType
				secondPartyID = dictionary["second_party_id"] as? Int
				secondPartyType = Wallet.WalletJournalItem.PartyType(rawValue: dictionary["second_party_type"] as? String ?? "")
				tax = dictionary["tax"] as? Float
				taxRecieverID = dictionary["tax_reciever_id"] as? Int
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				amount = aDecoder.containsValue(forKey: "amount") ? aDecoder.decodeFloat(forKey: "amount") : nil
				balance = aDecoder.containsValue(forKey: "balance") ? aDecoder.decodeFloat(forKey: "balance") : nil
				date = aDecoder.decodeObject(forKey: "date") as? Date ?? Date()
				extraInfo = aDecoder.decodeObject(of: Wallet.WalletJournalItem.ExtraInfo.self, forKey: "extra_info") 
				firstPartyID = aDecoder.containsValue(forKey: "first_party_id") ? aDecoder.decodeInteger(forKey: "first_party_id") : nil
				firstPartyType = Wallet.WalletJournalItem.PartyType(rawValue: aDecoder.decodeObject(forKey: "first_party_type") as? String ?? "")
				reason = aDecoder.decodeObject(forKey: "reason") as? String
				refID = aDecoder.decodeInt64(forKey: "ref_id")
				refType = Wallet.WalletJournalItem.RefType(rawValue: aDecoder.decodeObject(forKey: "ref_type") as? String ?? "") ?? Wallet.WalletJournalItem.RefType()
				secondPartyID = aDecoder.containsValue(forKey: "second_party_id") ? aDecoder.decodeInteger(forKey: "second_party_id") : nil
				secondPartyType = Wallet.WalletJournalItem.PartyType(rawValue: aDecoder.decodeObject(forKey: "second_party_type") as? String ?? "")
				tax = aDecoder.containsValue(forKey: "tax") ? aDecoder.decodeFloat(forKey: "tax") : nil
				taxRecieverID = aDecoder.containsValue(forKey: "tax_reciever_id") ? aDecoder.decodeInteger(forKey: "tax_reciever_id") : nil
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = amount {
					aCoder.encode(v, forKey: "amount")
				}
				if let v = balance {
					aCoder.encode(v, forKey: "balance")
				}
				aCoder.encode(date, forKey: "date")
				if let v = extraInfo {
					aCoder.encode(v, forKey: "extra_info")
				}
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
				aCoder.encode(refType.rawValue, forKey: "ref_type")
				if let v = secondPartyID {
					aCoder.encode(v, forKey: "second_party_id")
				}
				if let v = secondPartyType {
					aCoder.encode(v.rawValue, forKey: "second_party_type")
				}
				if let v = tax {
					aCoder.encode(v, forKey: "tax")
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
				if let v = balance?.json {
					json["balance"] = v
				}
				json["date"] = date.json
				if let v = extraInfo?.json {
					json["extra_info"] = v
				}
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
				json["ref_type"] = refType.json
				if let v = secondPartyID?.json {
					json["second_party_id"] = v
				}
				if let v = secondPartyType?.json {
					json["second_party_type"] = v
				}
				if let v = tax?.json {
					json["tax"] = v
				}
				if let v = taxRecieverID?.json {
					json["tax_reciever_id"] = v
				}
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.amount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.balance?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.date.hashValue)
				hashCombine(seed: &hash, value: self.extraInfo?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.firstPartyID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.firstPartyType?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.reason?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.refID.hashValue)
				hashCombine(seed: &hash, value: self.refType.hashValue)
				hashCombine(seed: &hash, value: self.secondPartyID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.secondPartyType?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.tax?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.taxRecieverID?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Wallet.WalletJournalItem, rhs: Wallet.WalletJournalItem) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Wallet.WalletJournalItem) {
				amount = other.amount
				balance = other.balance
				date = other.date
				extraInfo = other.extraInfo != nil ? Wallet.WalletJournalItem.ExtraInfo(other.extraInfo!) : nil
				firstPartyID = other.firstPartyID
				firstPartyType = other.firstPartyType
				reason = other.reason
				refID = other.refID
				refType = other.refType
				secondPartyID = other.secondPartyID
				secondPartyType = other.secondPartyType
				tax = other.tax
				taxRecieverID = other.taxRecieverID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Wallet.WalletJournalItem(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? WalletJournalItem)?.hashValue == hashValue
			}
			
		}
		
		
		public class Transaction: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var clientID: Int = Int()
			public var date: Date = Date()
			public var isBuy: Bool = Bool()
			public var isPersonal: Bool = Bool()
			public var journalRefID: Int64 = Int64()
			public var locationID: Int64 = Int64()
			public var quantity: Int = Int()
			public var transactionID: Int64 = Int64()
			public var typeID: Int = Int()
			public var unitPrice: Float = Float()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let clientID = dictionary["client_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.clientID = clientID
				guard let date = DateFormatter.esiDateTimeFormatter.date(from: dictionary["date"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.date = date
				guard let isBuy = dictionary["is_buy"] as? Bool else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.isBuy = isBuy
				guard let isPersonal = dictionary["is_personal"] as? Bool else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.isPersonal = isPersonal
				guard let journalRefID = dictionary["journal_ref_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.journalRefID = journalRefID
				guard let locationID = dictionary["location_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.locationID = locationID
				guard let quantity = dictionary["quantity"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.quantity = quantity
				guard let transactionID = dictionary["transaction_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.transactionID = transactionID
				guard let typeID = dictionary["type_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.typeID = typeID
				guard let unitPrice = dictionary["unit_price"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.unitPrice = unitPrice
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				clientID = aDecoder.decodeInteger(forKey: "client_id")
				date = aDecoder.decodeObject(forKey: "date") as? Date ?? Date()
				isBuy = aDecoder.decodeBool(forKey: "is_buy")
				isPersonal = aDecoder.decodeBool(forKey: "is_personal")
				journalRefID = aDecoder.decodeInt64(forKey: "journal_ref_id")
				locationID = aDecoder.decodeInt64(forKey: "location_id")
				quantity = aDecoder.decodeInteger(forKey: "quantity")
				transactionID = aDecoder.decodeInt64(forKey: "transaction_id")
				typeID = aDecoder.decodeInteger(forKey: "type_id")
				unitPrice = aDecoder.decodeFloat(forKey: "unit_price")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(clientID, forKey: "client_id")
				aCoder.encode(date, forKey: "date")
				aCoder.encode(isBuy, forKey: "is_buy")
				aCoder.encode(isPersonal, forKey: "is_personal")
				aCoder.encode(journalRefID, forKey: "journal_ref_id")
				aCoder.encode(locationID, forKey: "location_id")
				aCoder.encode(quantity, forKey: "quantity")
				aCoder.encode(transactionID, forKey: "transaction_id")
				aCoder.encode(typeID, forKey: "type_id")
				aCoder.encode(unitPrice, forKey: "unit_price")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["client_id"] = clientID.json
				json["date"] = date.json
				json["is_buy"] = isBuy.json
				json["is_personal"] = isPersonal.json
				json["journal_ref_id"] = journalRefID.json
				json["location_id"] = locationID.json
				json["quantity"] = quantity.json
				json["transaction_id"] = transactionID.json
				json["type_id"] = typeID.json
				json["unit_price"] = unitPrice.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.clientID.hashValue)
				hashCombine(seed: &hash, value: self.date.hashValue)
				hashCombine(seed: &hash, value: self.isBuy.hashValue)
				hashCombine(seed: &hash, value: self.isPersonal.hashValue)
				hashCombine(seed: &hash, value: self.journalRefID.hashValue)
				hashCombine(seed: &hash, value: self.locationID.hashValue)
				hashCombine(seed: &hash, value: self.quantity.hashValue)
				hashCombine(seed: &hash, value: self.transactionID.hashValue)
				hashCombine(seed: &hash, value: self.typeID.hashValue)
				hashCombine(seed: &hash, value: self.unitPrice.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Wallet.Transaction, rhs: Wallet.Transaction) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Wallet.Transaction) {
				clientID = other.clientID
				date = other.date
				isBuy = other.isBuy
				isPersonal = other.isPersonal
				journalRefID = other.journalRefID
				locationID = other.locationID
				quantity = other.quantity
				transactionID = other.transactionID
				typeID = other.typeID
				unitPrice = other.unitPrice
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Wallet.Transaction(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Transaction)?.hashValue == hashValue
			}
			
		}
		
		
	}
	
}
