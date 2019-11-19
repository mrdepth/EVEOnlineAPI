import Foundation
import Alamofire
import Combine


extension ESI {
	public var wallet: Wallet {
		return Wallet(esi: self)
	}
	
	public struct Wallet {
		let esi: ESI
		
		
		public func getCorporationWalletTransactions(corporationID: Int, division: Int, fromID: Int64? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Wallet.CorpTransaction], AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-wallet.read_corporation_wallets.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = fromID?.description {
				query.append(URLQueryItem(name: "from_id", value: v.lazy.map{$0.description}.joined(separator: ",")))
			}
			
			        let url = ESI.apiURL.appendingPathComponent("/corporations/\(corporationID)/wallets/\(division)/transactions/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .get,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
			            .eraseToAnyPublisher()
		}
		
		
		public func getWalletTransactions(characterID: Int, fromID: Int64? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Wallet.Transaction], AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-wallet.read_character_wallet.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = fromID?.description {
				query.append(URLQueryItem(name: "from_id", value: v.lazy.map{$0.description}.joined(separator: ",")))
			}
			
			        let url = ESI.apiURL.appendingPathComponent("/characters/\(characterID)/wallet/transactions/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .get,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
			            .eraseToAnyPublisher()
		}
		
		
		public func getCharacterWalletJournal(characterID: Int, page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Wallet.WalletJournalItem], AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-wallet.read_character_wallet.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = page?.description {
				query.append(URLQueryItem(name: "page", value: v.lazy.map{$0.description}.joined(separator: ",")))
			}
			
			        let url = ESI.apiURL.appendingPathComponent("/characters/\(characterID)/wallet/journal/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .get,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
			            .eraseToAnyPublisher()
		}
		
		
		public func returnsCorporationsWalletBalance(corporationID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Wallet.Balance], AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-wallet.read_corporation_wallets.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/corporations/\(corporationID)/wallets/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .get,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
			            .eraseToAnyPublisher()
		}
		
		
		public func getCharactersWalletBalance(characterID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Double, AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-wallet.read_character_wallet.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/characters/\(characterID)/wallet/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .get,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
			            .eraseToAnyPublisher()
		}
		
		
		public func getCorporationWalletJournal(corporationID: Int, division: Int, page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Wallet.CorpWalletsJournalItem], AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-wallet.read_corporation_wallets.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = page?.description {
				query.append(URLQueryItem(name: "page", value: v.lazy.map{$0.description}.joined(separator: ",")))
			}
			
			        let url = ESI.apiURL.appendingPathComponent("/corporations/\(corporationID)/wallets/\(division)/journal/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .get,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
			            .eraseToAnyPublisher()
		}
		
		
		public struct CorpWalletsJournalItem: Codable, Hashable {
			
			public enum GetCorporationsCorporationIDWalletsDivisionJournalContextIDType: String, Codable, CustomStringConvertible {
				case allianceID = "alliance_id"
				case characterID = "character_id"
				case contractID = "contract_id"
				case corporationID = "corporation_id"
				case eveSystem = "eve_system"
				case industryJobID = "industry_job_id"
				case marketTransactionID = "market_transaction_id"
				case planetID = "planet_id"
				case stationID = "station_id"
				case structureID = "structure_id"
				case systemID = "system_id"
				case typeID = "type_id"
				
				public var description: String {
					return rawValue
				}
				
			}
			
			public enum RefType: String, Codable, CustomStringConvertible {
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
				case structureGateJump = "structure_gate_jump"
				case transactionTax = "transaction_tax"
				case upkeepAdjustmentFee = "upkeep_adjustment_fee"
				case warAllyContract = "war_ally_contract"
				case warFee = "war_fee"
				case warFeeSurrender = "war_fee_surrender"
				
				public var description: String {
					return rawValue
				}
				
			}
			
			public var amount: Double?
			public var balance: Double?
			public var contextID: Int64?
			public var contextIDType: Wallet.CorpWalletsJournalItem.GetCorporationsCorporationIDWalletsDivisionJournalContextIDType?
			public var date: Date
			public var localizedDescription: String
			public var firstPartyID: Int?
			public var id: Int64
			public var reason: String?
			public var refType: Wallet.CorpWalletsJournalItem.RefType
			public var secondPartyID: Int?
			public var tax: Double?
			public var taxReceiverID: Int?
			
			public init(amount: Double?, balance: Double?, contextID: Int64?, contextIDType: Wallet.CorpWalletsJournalItem.GetCorporationsCorporationIDWalletsDivisionJournalContextIDType?, date: Date, localizedDescription: String, firstPartyID: Int?, id: Int64, reason: String?, refType: Wallet.CorpWalletsJournalItem.RefType, secondPartyID: Int?, tax: Double?, taxReceiverID: Int?) {
				self.amount = amount
				self.balance = balance
				self.contextID = contextID
				self.contextIDType = contextIDType
				self.date = date
				self.localizedDescription = localizedDescription
				self.firstPartyID = firstPartyID
				self.id = id
				self.reason = reason
				self.refType = refType
				self.secondPartyID = secondPartyID
				self.tax = tax
				self.taxReceiverID = taxReceiverID
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case amount
				case balance
				case contextID = "context_id"
				case contextIDType = "context_id_type"
				case date
				case localizedDescription = "description"
				case firstPartyID = "first_party_id"
				case id
				case reason
				case refType = "ref_type"
				case secondPartyID = "second_party_id"
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
		
		
		public struct CorpTransaction: Codable, Hashable {
			
			
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
		
		
		public struct WalletJournalItem: Codable, Hashable {
			
			public enum RefType: String, Codable, CustomStringConvertible {
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
				case itemTraderPayment = "item_trader_payment"
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
				case skillPurchase = "skill_purchase"
				case sovereignityBill = "sovereignity_bill"
				case storePurchase = "store_purchase"
				case storePurchaseRefund = "store_purchase_refund"
				case structureGateJump = "structure_gate_jump"
				case transactionTax = "transaction_tax"
				case upkeepAdjustmentFee = "upkeep_adjustment_fee"
				case warAllyContract = "war_ally_contract"
				case warFee = "war_fee"
				case warFeeSurrender = "war_fee_surrender"
				
				public var description: String {
					return rawValue
				}
				
			}
			
			public enum GetCharactersCharacterIDWalletJournalContextIDType: String, Codable, CustomStringConvertible {
				case allianceID = "alliance_id"
				case characterID = "character_id"
				case contractID = "contract_id"
				case corporationID = "corporation_id"
				case eveSystem = "eve_system"
				case industryJobID = "industry_job_id"
				case marketTransactionID = "market_transaction_id"
				case planetID = "planet_id"
				case stationID = "station_id"
				case structureID = "structure_id"
				case systemID = "system_id"
				case typeID = "type_id"
				
				public var description: String {
					return rawValue
				}
				
			}
			
			public var amount: Double?
			public var balance: Double?
			public var contextID: Int64?
			public var contextIDType: Wallet.WalletJournalItem.GetCharactersCharacterIDWalletJournalContextIDType?
			public var date: Date
			public var localizedDescription: String
			public var firstPartyID: Int?
			public var id: Int64
			public var reason: String?
			public var refType: Wallet.WalletJournalItem.RefType
			public var secondPartyID: Int?
			public var tax: Double?
			public var taxReceiverID: Int?
			
			public init(amount: Double?, balance: Double?, contextID: Int64?, contextIDType: Wallet.WalletJournalItem.GetCharactersCharacterIDWalletJournalContextIDType?, date: Date, localizedDescription: String, firstPartyID: Int?, id: Int64, reason: String?, refType: Wallet.WalletJournalItem.RefType, secondPartyID: Int?, tax: Double?, taxReceiverID: Int?) {
				self.amount = amount
				self.balance = balance
				self.contextID = contextID
				self.contextIDType = contextIDType
				self.date = date
				self.localizedDescription = localizedDescription
				self.firstPartyID = firstPartyID
				self.id = id
				self.reason = reason
				self.refType = refType
				self.secondPartyID = secondPartyID
				self.tax = tax
				self.taxReceiverID = taxReceiverID
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case amount
				case balance
				case contextID = "context_id"
				case contextIDType = "context_id_type"
				case date
				case localizedDescription = "description"
				case firstPartyID = "first_party_id"
				case id
				case reason
				case refType = "ref_type"
				case secondPartyID = "second_party_id"
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
