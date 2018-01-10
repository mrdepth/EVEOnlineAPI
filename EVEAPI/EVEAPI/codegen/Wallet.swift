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
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-wallet.read_character_wallet.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = fromID?.httpQuery {
				query.append(URLQueryItem(name: "from_id", value: v))
			}
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/wallet/transactions/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Wallet.Transaction]>) in
					completionBlock?(response.result)
					session = nil
				}
			}
		}
		
		public func getCharacterWalletJournal(characterID: Int, fromID: Int64? = nil, completionBlock:((Result<[Wallet.WalletJournalItem]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-wallet.read_character_wallet.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = fromID?.httpQuery {
				query.append(URLQueryItem(name: "from_id", value: v))
			}
			
			let url = session!.baseURL + "/v3/characters/\(characterID)/wallet/journal/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Wallet.WalletJournalItem]>) in
					completionBlock?(response.result)
					session = nil
				}
			}
		}
		
		public func getCorporationWalletJournal(corporationID: Int, division: Int, fromID: Int64? = nil, completionBlock:((Result<[Wallet.GetCorporationsCorporationIDWalletsDivisionJournalOk]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-wallet.read_corporation_wallets.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = fromID?.httpQuery {
				query.append(URLQueryItem(name: "from_id", value: v))
			}
			
			let url = session!.baseURL + "/v2/corporations/\(corporationID)/wallets/\(division)/journal/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Wallet.GetCorporationsCorporationIDWalletsDivisionJournalOk]>) in
					completionBlock?(response.result)
					session = nil
				}
			}
		}
		
		public func getCorporationWalletTransactions(corporationID: Int, division: Int, fromID: Int64? = nil, completionBlock:((Result<[Wallet.GetCorporationsCorporationIDWalletsDivisionTransactionsOk]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-wallet.read_corporation_wallets.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = fromID?.httpQuery {
				query.append(URLQueryItem(name: "from_id", value: v))
			}
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/wallets/\(division)/transactions/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Wallet.GetCorporationsCorporationIDWalletsDivisionTransactionsOk]>) in
					completionBlock?(response.result)
					session = nil
				}
			}
		}
		
		public func returnsCorporationsWalletBalance(corporationID: Int, completionBlock:((Result<[Wallet.Balance]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-wallet.read_corporation_wallets.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/wallets/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Wallet.Balance]>) in
					completionBlock?(response.result)
					session = nil
				}
			}
		}
		
		public func getCharactersWalletBalance(characterID: Int, completionBlock:((Result<Double>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-wallet.read_character_wallet.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/wallet/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Double>) in
					completionBlock?(response.result)
					session = nil
				}
			}
		}
		
		
		public struct GetCorporationsCorporationIDWalletsDivisionTransactionsOk: Codable, Hashable {
			
			
			public var clientID: Int
			public var date: Date
			public var isBuy: Bool
			public var journalRefID: Int64
			public var locationID: Int64
			public var quantity: Int
			public var transactionID: Int64
			public var typeID: Int
			public var unitPrice: Double
			
			public init(clientID: Int, date: Date, isBuy: Bool, journalRefID: Int64, locationID: Int64, quantity: Int, transactionID: Int64, typeID: Int, unitPrice: Double) {
				self.clientID = clientID
				self.date = date
				self.isBuy = isBuy
				self.journalRefID = journalRefID
				self.locationID = locationID
				self.quantity = quantity
				self.transactionID = transactionID
				self.typeID = typeID
				self.unitPrice = unitPrice
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: clientID.hashValue)
				hashCombine(seed: &hash, value: date.hashValue)
				hashCombine(seed: &hash, value: isBuy.hashValue)
				hashCombine(seed: &hash, value: journalRefID.hashValue)
				hashCombine(seed: &hash, value: locationID.hashValue)
				hashCombine(seed: &hash, value: quantity.hashValue)
				hashCombine(seed: &hash, value: transactionID.hashValue)
				hashCombine(seed: &hash, value: typeID.hashValue)
				hashCombine(seed: &hash, value: unitPrice.hashValue)
				return hash
			}
			
			public static func ==(lhs: Wallet.GetCorporationsCorporationIDWalletsDivisionTransactionsOk, rhs: Wallet.GetCorporationsCorporationIDWalletsDivisionTransactionsOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case clientID = "client_id"
				case date
				case isBuy = "is_buy"
				case journalRefID = "journal_ref_id"
				case locationID = "location_id"
				case quantity
				case transactionID = "transaction_id"
				case typeID = "type_id"
				case unitPrice = "unit_price"
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .date: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct Transaction: Codable, Hashable {
			
			
			public var clientID: Int
			public var date: Date
			public var isBuy: Bool
			public var isPersonal: Bool
			public var journalRefID: Int64
			public var locationID: Int64
			public var quantity: Int
			public var transactionID: Int64
			public var typeID: Int
			public var unitPrice: Double
			
			public init(clientID: Int, date: Date, isBuy: Bool, isPersonal: Bool, journalRefID: Int64, locationID: Int64, quantity: Int, transactionID: Int64, typeID: Int, unitPrice: Double) {
				self.clientID = clientID
				self.date = date
				self.isBuy = isBuy
				self.isPersonal = isPersonal
				self.journalRefID = journalRefID
				self.locationID = locationID
				self.quantity = quantity
				self.transactionID = transactionID
				self.typeID = typeID
				self.unitPrice = unitPrice
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: clientID.hashValue)
				hashCombine(seed: &hash, value: date.hashValue)
				hashCombine(seed: &hash, value: isBuy.hashValue)
				hashCombine(seed: &hash, value: isPersonal.hashValue)
				hashCombine(seed: &hash, value: journalRefID.hashValue)
				hashCombine(seed: &hash, value: locationID.hashValue)
				hashCombine(seed: &hash, value: quantity.hashValue)
				hashCombine(seed: &hash, value: transactionID.hashValue)
				hashCombine(seed: &hash, value: typeID.hashValue)
				hashCombine(seed: &hash, value: unitPrice.hashValue)
				return hash
			}
			
			public static func ==(lhs: Wallet.Transaction, rhs: Wallet.Transaction) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case clientID = "client_id"
				case date
				case isBuy = "is_buy"
				case isPersonal = "is_personal"
				case journalRefID = "journal_ref_id"
				case locationID = "location_id"
				case quantity
				case transactionID = "transaction_id"
				case typeID = "type_id"
				case unitPrice = "unit_price"
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .date: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCorporationsCorporationIDWalletsDivisionJournalOk: Codable, Hashable {
			
			public struct GetCorporationsCorporationIDWalletsDivisionJournalExtraInfo: Codable, Hashable {
				
				
				public var allianceID: Int?
				public var characterID: Int?
				public var contractID: Int?
				public var corporationID: Int?
				public var destroyedShipTypeID: Int?
				public var jobID: Int?
				public var locationID: Int64?
				public var npcID: Int?
				public var npcName: String?
				public var planetID: Int?
				public var systemID: Int?
				public var transactionID: Int64?
				
				public init(allianceID: Int?, characterID: Int?, contractID: Int?, corporationID: Int?, destroyedShipTypeID: Int?, jobID: Int?, locationID: Int64?, npcID: Int?, npcName: String?, planetID: Int?, systemID: Int?, transactionID: Int64?) {
					self.allianceID = allianceID
					self.characterID = characterID
					self.contractID = contractID
					self.corporationID = corporationID
					self.destroyedShipTypeID = destroyedShipTypeID
					self.jobID = jobID
					self.locationID = locationID
					self.npcID = npcID
					self.npcName = npcName
					self.planetID = planetID
					self.systemID = systemID
					self.transactionID = transactionID
				}
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: allianceID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: characterID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: contractID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: corporationID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: destroyedShipTypeID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: jobID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: locationID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: npcID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: npcName?.hashValue ?? 0)
					hashCombine(seed: &hash, value: planetID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: systemID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: transactionID?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: Wallet.GetCorporationsCorporationIDWalletsDivisionJournalOk.GetCorporationsCorporationIDWalletsDivisionJournalExtraInfo, rhs: Wallet.GetCorporationsCorporationIDWalletsDivisionJournalOk.GetCorporationsCorporationIDWalletsDivisionJournalExtraInfo) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case allianceID = "alliance_id"
					case characterID = "character_id"
					case contractID = "contract_id"
					case corporationID = "corporation_id"
					case destroyedShipTypeID = "destroyed_ship_type_id"
					case jobID = "job_id"
					case locationID = "location_id"
					case npcID = "npc_id"
					case npcName = "npc_name"
					case planetID = "planet_id"
					case systemID = "system_id"
					case transactionID = "transaction_id"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public enum GetCorporationsCorporationIDWalletsDivisionJournalRefType: String, Codable, HTTPQueryable {
				case accelerationGateFee = "acceleration_gate_fee"
				case advertisementListingFee = "advertisement_listing_fee"
				case agentDonation = "agent_donation"
				case agentLocationServices = "agent_location_services"
				case agentMiscellaneous = "agent_miscellaneous"
				case agentMissionCollateralPaid = "agent_mission_collateral_paid"
				case agentMissionCollateralRefunded = "agent_mission_collateral_refunded"
				case agentMissionReward = "agent_mission_reward"
				case agentMissionRewardCorporationTax = "agent_mission_reward_corporation_tax"
				case agentMissionTimeBonusReward = "agent_mission_time_bonus_reward"
				case agentMissionTimeBonusRewardCorporationTax = "agent_mission_time_bonus_reward_corporation_tax"
				case agentSecurityServices = "agent_security_services"
				case agentServicesRendered = "agent_services_rendered"
				case agentsPreward = "agents_preward"
				case allianceMaintainanceFee = "alliance_maintainance_fee"
				case allianceRegistrationFee = "alliance_registration_fee"
				case assetSafetyRecoveryTax = "asset_safety_recovery_tax"
				case bounty = "bounty"
				case bountyPrize = "bounty_prize"
				case bountyPrizeCorporationTax = "bounty_prize_corporation_tax"
				case bountyPrizes = "bounty_prizes"
				case bountyReimbursement = "bounty_reimbursement"
				case bountySurcharge = "bounty_surcharge"
				case brokersFee = "brokers_fee"
				case cloneActivation = "clone_activation"
				case cloneTransfer = "clone_transfer"
				case contrabandFine = "contraband_fine"
				case contractAuctionBid = "contract_auction_bid"
				case contractAuctionBidCorp = "contract_auction_bid_corp"
				case contractAuctionBidRefund = "contract_auction_bid_refund"
				case contractAuctionSold = "contract_auction_sold"
				case contractBrokersFee = "contract_brokers_fee"
				case contractBrokersFeeCorp = "contract_brokers_fee_corp"
				case contractCollateral = "contract_collateral"
				case contractCollateralDepositedCorp = "contract_collateral_deposited_corp"
				case contractCollateralPayout = "contract_collateral_payout"
				case contractCollateralRefund = "contract_collateral_refund"
				case contractDeposit = "contract_deposit"
				case contractDepositCorp = "contract_deposit_corp"
				case contractDepositRefund = "contract_deposit_refund"
				case contractDepositSalesTax = "contract_deposit_sales_tax"
				case contractPrice = "contract_price"
				case contractPricePaymentCorp = "contract_price_payment_corp"
				case contractReversal = "contract_reversal"
				case contractReward = "contract_reward"
				case contractRewardDeposited = "contract_reward_deposited"
				case contractRewardDepositedCorp = "contract_reward_deposited_corp"
				case contractRewardRefund = "contract_reward_refund"
				case contractSalesTax = "contract_sales_tax"
				case copying = "copying"
				case corporateRewardPayout = "corporate_reward_payout"
				case corporateRewardTax = "corporate_reward_tax"
				case corporationAccountWithdrawal = "corporation_account_withdrawal"
				case corporationBulkPayment = "corporation_bulk_payment"
				case corporationDividendPayment = "corporation_dividend_payment"
				case corporationLiquidation = "corporation_liquidation"
				case corporationLogoChangeCost = "corporation_logo_change_cost"
				case corporationPayment = "corporation_payment"
				case corporationRegistrationFee = "corporation_registration_fee"
				case courierMissionEscrow = "courier_mission_escrow"
				case cspa = "cspa"
				case cspaofflinerefund = "cspaofflinerefund"
				case datacoreFee = "datacore_fee"
				case dnaModificationFee = "dna_modification_fee"
				case dockingFee = "docking_fee"
				case duelWagerEscrow = "duel_wager_escrow"
				case duelWagerPayment = "duel_wager_payment"
				case duelWagerRefund = "duel_wager_refund"
				case factorySlotRentalFee = "factory_slot_rental_fee"
				case gmCashTransfer = "gm_cash_transfer"
				case industryJobTax = "industry_job_tax"
				case infrastructureHubMaintenance = "infrastructure_hub_maintenance"
				case inheritance = "inheritance"
				case insurance = "insurance"
				case jumpCloneActivationFee = "jump_clone_activation_fee"
				case jumpCloneInstallationFee = "jump_clone_installation_fee"
				case killRightFee = "kill_right_fee"
				case lpStore = "lp_store"
				case manufacturing = "manufacturing"
				case marketEscrow = "market_escrow"
				case marketFinePaid = "market_fine_paid"
				case marketTransaction = "market_transaction"
				case medalCreation = "medal_creation"
				case medalIssued = "medal_issued"
				case missionCompletion = "mission_completion"
				case missionCost = "mission_cost"
				case missionExpiration = "mission_expiration"
				case missionReward = "mission_reward"
				case officeRentalFee = "office_rental_fee"
				case operationBonus = "operation_bonus"
				case opportunityReward = "opportunity_reward"
				case planetaryConstruction = "planetary_construction"
				case planetaryExportTax = "planetary_export_tax"
				case planetaryImportTax = "planetary_import_tax"
				case playerDonation = "player_donation"
				case playerTrading = "player_trading"
				case projectDiscoveryReward = "project_discovery_reward"
				case projectDiscoveryTax = "project_discovery_tax"
				case reaction = "reaction"
				case releaseOfImpoundedProperty = "release_of_impounded_property"
				case repairBill = "repair_bill"
				case reprocessingTax = "reprocessing_tax"
				case researchingMaterialProductivity = "researching_material_productivity"
				case researchingTechnology = "researching_technology"
				case researchingTimeProductivity = "researching_time_productivity"
				case resourceWarsReward = "resource_wars_reward"
				case reverseEngineering = "reverse_engineering"
				case securityProcessingFee = "security_processing_fee"
				case shares = "shares"
				case sovereignityBill = "sovereignity_bill"
				case storePurchase = "store_purchase"
				case storePurchaseRefund = "store_purchase_refund"
				case transactionTax = "transaction_tax"
				case upkeepAdjustmentFee = "upkeep_adjustment_fee"
				case warAllyContract = "war_ally_contract"
				case warFee = "war_fee"
				case warFeeSurrender = "war_fee_surrender"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDWalletsDivisionJournalFirstPartyType: String, Codable, HTTPQueryable {
				case alliance = "alliance"
				case character = "character"
				case corporation = "corporation"
				case faction = "faction"
				case system = "system"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDWalletsDivisionJournalSecondPartyType: String, Codable, HTTPQueryable {
				case alliance = "alliance"
				case character = "character"
				case corporation = "corporation"
				case faction = "faction"
				case system = "system"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var amount: Double?
			public var balance: Double?
			public var date: Date
			public var extraInfo: Wallet.GetCorporationsCorporationIDWalletsDivisionJournalOk.GetCorporationsCorporationIDWalletsDivisionJournalExtraInfo?
			public var firstPartyID: Int?
			public var firstPartyType: Wallet.GetCorporationsCorporationIDWalletsDivisionJournalOk.GetCorporationsCorporationIDWalletsDivisionJournalFirstPartyType?
			public var reason: String?
			public var refID: Int64
			public var refType: Wallet.GetCorporationsCorporationIDWalletsDivisionJournalOk.GetCorporationsCorporationIDWalletsDivisionJournalRefType
			public var secondPartyID: Int?
			public var secondPartyType: Wallet.GetCorporationsCorporationIDWalletsDivisionJournalOk.GetCorporationsCorporationIDWalletsDivisionJournalSecondPartyType?
			public var tax: Double?
			public var taxReceiverID: Int?
			
			public init(amount: Double?, balance: Double?, date: Date, extraInfo: Wallet.GetCorporationsCorporationIDWalletsDivisionJournalOk.GetCorporationsCorporationIDWalletsDivisionJournalExtraInfo?, firstPartyID: Int?, firstPartyType: Wallet.GetCorporationsCorporationIDWalletsDivisionJournalOk.GetCorporationsCorporationIDWalletsDivisionJournalFirstPartyType?, reason: String?, refID: Int64, refType: Wallet.GetCorporationsCorporationIDWalletsDivisionJournalOk.GetCorporationsCorporationIDWalletsDivisionJournalRefType, secondPartyID: Int?, secondPartyType: Wallet.GetCorporationsCorporationIDWalletsDivisionJournalOk.GetCorporationsCorporationIDWalletsDivisionJournalSecondPartyType?, tax: Double?, taxReceiverID: Int?) {
				self.amount = amount
				self.balance = balance
				self.date = date
				self.extraInfo = extraInfo
				self.firstPartyID = firstPartyID
				self.firstPartyType = firstPartyType
				self.reason = reason
				self.refID = refID
				self.refType = refType
				self.secondPartyID = secondPartyID
				self.secondPartyType = secondPartyType
				self.tax = tax
				self.taxReceiverID = taxReceiverID
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: amount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: balance?.hashValue ?? 0)
				hashCombine(seed: &hash, value: date.hashValue)
				hashCombine(seed: &hash, value: extraInfo?.hashValue ?? 0)
				hashCombine(seed: &hash, value: firstPartyID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: firstPartyType?.hashValue ?? 0)
				hashCombine(seed: &hash, value: reason?.hashValue ?? 0)
				hashCombine(seed: &hash, value: refID.hashValue)
				hashCombine(seed: &hash, value: refType.hashValue)
				hashCombine(seed: &hash, value: secondPartyID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: secondPartyType?.hashValue ?? 0)
				hashCombine(seed: &hash, value: tax?.hashValue ?? 0)
				hashCombine(seed: &hash, value: taxReceiverID?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Wallet.GetCorporationsCorporationIDWalletsDivisionJournalOk, rhs: Wallet.GetCorporationsCorporationIDWalletsDivisionJournalOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case amount
				case balance
				case date
				case extraInfo = "extra_info"
				case firstPartyID = "first_party_id"
				case firstPartyType = "first_party_type"
				case reason
				case refID = "ref_id"
				case refType = "ref_type"
				case secondPartyID = "second_party_id"
				case secondPartyType = "second_party_type"
				case tax
				case taxReceiverID = "tax_receiver_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .date: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct Balance: Codable, Hashable {
			
			
			public var balance: Double
			public var division: Int
			
			public init(balance: Double, division: Int) {
				self.balance = balance
				self.division = division
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: balance.hashValue)
				hashCombine(seed: &hash, value: division.hashValue)
				return hash
			}
			
			public static func ==(lhs: Wallet.Balance, rhs: Wallet.Balance) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case balance
				case division
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct WalletJournalItem: Codable, Hashable {
			
			public struct ExtraInfo: Codable, Hashable {
				
				
				public var allianceID: Int?
				public var characterID: Int?
				public var contractID: Int?
				public var corporationID: Int?
				public var destroyedShipTypeID: Int?
				public var jobID: Int?
				public var locationID: Int64?
				public var npcID: Int?
				public var npcName: String?
				public var planetID: Int?
				public var systemID: Int?
				public var transactionID: Int64?
				
				public init(allianceID: Int?, characterID: Int?, contractID: Int?, corporationID: Int?, destroyedShipTypeID: Int?, jobID: Int?, locationID: Int64?, npcID: Int?, npcName: String?, planetID: Int?, systemID: Int?, transactionID: Int64?) {
					self.allianceID = allianceID
					self.characterID = characterID
					self.contractID = contractID
					self.corporationID = corporationID
					self.destroyedShipTypeID = destroyedShipTypeID
					self.jobID = jobID
					self.locationID = locationID
					self.npcID = npcID
					self.npcName = npcName
					self.planetID = planetID
					self.systemID = systemID
					self.transactionID = transactionID
				}
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: allianceID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: characterID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: contractID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: corporationID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: destroyedShipTypeID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: jobID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: locationID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: npcID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: npcName?.hashValue ?? 0)
					hashCombine(seed: &hash, value: planetID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: systemID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: transactionID?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: Wallet.WalletJournalItem.ExtraInfo, rhs: Wallet.WalletJournalItem.ExtraInfo) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case allianceID = "alliance_id"
					case characterID = "character_id"
					case contractID = "contract_id"
					case corporationID = "corporation_id"
					case destroyedShipTypeID = "destroyed_ship_type_id"
					case jobID = "job_id"
					case locationID = "location_id"
					case npcID = "npc_id"
					case npcName = "npc_name"
					case planetID = "planet_id"
					case systemID = "system_id"
					case transactionID = "transaction_id"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public enum PartyType: String, Codable, HTTPQueryable {
				case alliance = "alliance"
				case character = "character"
				case corporation = "corporation"
				case faction = "faction"
				case system = "system"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum RefType: String, Codable, HTTPQueryable {
				case accelerationGateFee = "acceleration_gate_fee"
				case advertisementListingFee = "advertisement_listing_fee"
				case agentDonation = "agent_donation"
				case agentLocationServices = "agent_location_services"
				case agentMiscellaneous = "agent_miscellaneous"
				case agentMissionCollateralPaid = "agent_mission_collateral_paid"
				case agentMissionCollateralRefunded = "agent_mission_collateral_refunded"
				case agentMissionReward = "agent_mission_reward"
				case agentMissionRewardCorporationTax = "agent_mission_reward_corporation_tax"
				case agentMissionTimeBonusReward = "agent_mission_time_bonus_reward"
				case agentMissionTimeBonusRewardCorporationTax = "agent_mission_time_bonus_reward_corporation_tax"
				case agentSecurityServices = "agent_security_services"
				case agentServicesRendered = "agent_services_rendered"
				case agentsPreward = "agents_preward"
				case allianceMaintainanceFee = "alliance_maintainance_fee"
				case allianceRegistrationFee = "alliance_registration_fee"
				case assetSafetyRecoveryTax = "asset_safety_recovery_tax"
				case bounty = "bounty"
				case bountyPrize = "bounty_prize"
				case bountyPrizeCorporationTax = "bounty_prize_corporation_tax"
				case bountyPrizes = "bounty_prizes"
				case bountyReimbursement = "bounty_reimbursement"
				case bountySurcharge = "bounty_surcharge"
				case brokersFee = "brokers_fee"
				case cloneActivation = "clone_activation"
				case cloneTransfer = "clone_transfer"
				case contrabandFine = "contraband_fine"
				case contractAuctionBid = "contract_auction_bid"
				case contractAuctionBidCorp = "contract_auction_bid_corp"
				case contractAuctionBidRefund = "contract_auction_bid_refund"
				case contractAuctionSold = "contract_auction_sold"
				case contractBrokersFee = "contract_brokers_fee"
				case contractBrokersFeeCorp = "contract_brokers_fee_corp"
				case contractCollateral = "contract_collateral"
				case contractCollateralDepositedCorp = "contract_collateral_deposited_corp"
				case contractCollateralPayout = "contract_collateral_payout"
				case contractCollateralRefund = "contract_collateral_refund"
				case contractDeposit = "contract_deposit"
				case contractDepositCorp = "contract_deposit_corp"
				case contractDepositRefund = "contract_deposit_refund"
				case contractDepositSalesTax = "contract_deposit_sales_tax"
				case contractPrice = "contract_price"
				case contractPricePaymentCorp = "contract_price_payment_corp"
				case contractReversal = "contract_reversal"
				case contractReward = "contract_reward"
				case contractRewardDeposited = "contract_reward_deposited"
				case contractRewardDepositedCorp = "contract_reward_deposited_corp"
				case contractRewardRefund = "contract_reward_refund"
				case contractSalesTax = "contract_sales_tax"
				case copying = "copying"
				case corporateRewardPayout = "corporate_reward_payout"
				case corporateRewardTax = "corporate_reward_tax"
				case corporationAccountWithdrawal = "corporation_account_withdrawal"
				case corporationBulkPayment = "corporation_bulk_payment"
				case corporationDividendPayment = "corporation_dividend_payment"
				case corporationLiquidation = "corporation_liquidation"
				case corporationLogoChangeCost = "corporation_logo_change_cost"
				case corporationPayment = "corporation_payment"
				case corporationRegistrationFee = "corporation_registration_fee"
				case courierMissionEscrow = "courier_mission_escrow"
				case cspa = "cspa"
				case cspaofflinerefund = "cspaofflinerefund"
				case datacoreFee = "datacore_fee"
				case dnaModificationFee = "dna_modification_fee"
				case dockingFee = "docking_fee"
				case duelWagerEscrow = "duel_wager_escrow"
				case duelWagerPayment = "duel_wager_payment"
				case duelWagerRefund = "duel_wager_refund"
				case factorySlotRentalFee = "factory_slot_rental_fee"
				case gmCashTransfer = "gm_cash_transfer"
				case industryJobTax = "industry_job_tax"
				case infrastructureHubMaintenance = "infrastructure_hub_maintenance"
				case inheritance = "inheritance"
				case insurance = "insurance"
				case jumpCloneActivationFee = "jump_clone_activation_fee"
				case jumpCloneInstallationFee = "jump_clone_installation_fee"
				case killRightFee = "kill_right_fee"
				case lpStore = "lp_store"
				case manufacturing = "manufacturing"
				case marketEscrow = "market_escrow"
				case marketFinePaid = "market_fine_paid"
				case marketTransaction = "market_transaction"
				case medalCreation = "medal_creation"
				case medalIssued = "medal_issued"
				case missionCompletion = "mission_completion"
				case missionCost = "mission_cost"
				case missionExpiration = "mission_expiration"
				case missionReward = "mission_reward"
				case officeRentalFee = "office_rental_fee"
				case operationBonus = "operation_bonus"
				case opportunityReward = "opportunity_reward"
				case planetaryConstruction = "planetary_construction"
				case planetaryExportTax = "planetary_export_tax"
				case planetaryImportTax = "planetary_import_tax"
				case playerDonation = "player_donation"
				case playerTrading = "player_trading"
				case projectDiscoveryReward = "project_discovery_reward"
				case projectDiscoveryTax = "project_discovery_tax"
				case reaction = "reaction"
				case releaseOfImpoundedProperty = "release_of_impounded_property"
				case repairBill = "repair_bill"
				case reprocessingTax = "reprocessing_tax"
				case researchingMaterialProductivity = "researching_material_productivity"
				case researchingTechnology = "researching_technology"
				case researchingTimeProductivity = "researching_time_productivity"
				case resourceWarsReward = "resource_wars_reward"
				case reverseEngineering = "reverse_engineering"
				case securityProcessingFee = "security_processing_fee"
				case shares = "shares"
				case sovereignityBill = "sovereignity_bill"
				case storePurchase = "store_purchase"
				case storePurchaseRefund = "store_purchase_refund"
				case transactionTax = "transaction_tax"
				case upkeepAdjustmentFee = "upkeep_adjustment_fee"
				case warAllyContract = "war_ally_contract"
				case warFee = "war_fee"
				case warFeeSurrender = "war_fee_surrender"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var amount: Double?
			public var balance: Double?
			public var date: Date
			public var extraInfo: Wallet.WalletJournalItem.ExtraInfo?
			public var firstPartyID: Int?
			public var firstPartyType: Wallet.WalletJournalItem.PartyType?
			public var reason: String?
			public var refID: Int64
			public var refType: Wallet.WalletJournalItem.RefType
			public var secondPartyID: Int?
			public var secondPartyType: Wallet.WalletJournalItem.PartyType?
			public var tax: Double?
			public var taxReceiverID: Int?
			
			public init(amount: Double?, balance: Double?, date: Date, extraInfo: Wallet.WalletJournalItem.ExtraInfo?, firstPartyID: Int?, firstPartyType: Wallet.WalletJournalItem.PartyType?, reason: String?, refID: Int64, refType: Wallet.WalletJournalItem.RefType, secondPartyID: Int?, secondPartyType: Wallet.WalletJournalItem.PartyType?, tax: Double?, taxReceiverID: Int?) {
				self.amount = amount
				self.balance = balance
				self.date = date
				self.extraInfo = extraInfo
				self.firstPartyID = firstPartyID
				self.firstPartyType = firstPartyType
				self.reason = reason
				self.refID = refID
				self.refType = refType
				self.secondPartyID = secondPartyID
				self.secondPartyType = secondPartyType
				self.tax = tax
				self.taxReceiverID = taxReceiverID
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: amount?.hashValue ?? 0)
				hashCombine(seed: &hash, value: balance?.hashValue ?? 0)
				hashCombine(seed: &hash, value: date.hashValue)
				hashCombine(seed: &hash, value: extraInfo?.hashValue ?? 0)
				hashCombine(seed: &hash, value: firstPartyID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: firstPartyType?.hashValue ?? 0)
				hashCombine(seed: &hash, value: reason?.hashValue ?? 0)
				hashCombine(seed: &hash, value: refID.hashValue)
				hashCombine(seed: &hash, value: refType.hashValue)
				hashCombine(seed: &hash, value: secondPartyID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: secondPartyType?.hashValue ?? 0)
				hashCombine(seed: &hash, value: tax?.hashValue ?? 0)
				hashCombine(seed: &hash, value: taxReceiverID?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Wallet.WalletJournalItem, rhs: Wallet.WalletJournalItem) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case amount
				case balance
				case date
				case extraInfo = "extra_info"
				case firstPartyID = "first_party_id"
				case firstPartyType = "first_party_type"
				case reason
				case refID = "ref_id"
				case refType = "ref_type"
				case secondPartyID = "second_party_id"
				case secondPartyType = "second_party_type"
				case tax
				case taxReceiverID = "tax_receiver_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .date: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
	}
	
}
