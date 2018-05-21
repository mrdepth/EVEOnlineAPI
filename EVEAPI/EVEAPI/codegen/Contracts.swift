import Foundation
import Alamofire


public extension ESI {
	public var contracts: Contracts {
		return Contracts(sessionManager: self)
	}
	
	class Contracts {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		@discardableResult
		public func getContracts(characterID: Int, ifNoneMatch: String? = nil, page: Int? = nil) -> Future<ESI.Result<[Contracts.Contract]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Contracts.Contract]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-contracts.read_character_contracts.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/contracts/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Contracts.Contract]>) in
					promise.set(result: response.result, cached: 300.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCorporationContractItems(contractID: Int, corporationID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<[Contracts.GetCorporationsCorporationIDContractsContractIDItemsOk]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Contracts.GetCorporationsCorporationIDContractsContractIDItemsOk]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-contracts.read_corporation_contracts.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/contracts/\(contractID)/items/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Contracts.GetCorporationsCorporationIDContractsContractIDItemsOk]>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getContractBids(characterID: Int, contractID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<[Contracts.Bid]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Contracts.Bid]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-contracts.read_character_contracts.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/contracts/\(contractID)/bids/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Contracts.Bid]>) in
					promise.set(result: response.result, cached: 300.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCoporationContracts(corporationID: Int, ifNoneMatch: String? = nil, page: Int? = nil) -> Future<ESI.Result<[Contracts.GetCorporationsCorporationIDContractsOk]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Contracts.GetCorporationsCorporationIDContractsOk]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-contracts.read_corporation_contracts.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/contracts/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Contracts.GetCorporationsCorporationIDContractsOk]>) in
					promise.set(result: response.result, cached: 300.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCorporationContractBids(contractID: Int, corporationID: Int, ifNoneMatch: String? = nil, page: Int? = nil) -> Future<ESI.Result<[Contracts.GetCorporationsCorporationIDContractsContractIDBidsOk]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Contracts.GetCorporationsCorporationIDContractsContractIDBidsOk]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-contracts.read_corporation_contracts.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/contracts/\(contractID)/bids/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Contracts.GetCorporationsCorporationIDContractsContractIDBidsOk]>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getContractItems(characterID: Int, contractID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<[Contracts.Item]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Contracts.Item]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-contracts.read_character_contracts.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/contracts/\(contractID)/items/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Contracts.Item]>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		
		public struct Contract: Codable, Hashable {
			
			public enum Availability: String, Codable, HTTPQueryable {
				case alliance = "alliance"
				case corporation = "corporation"
				case personal = "personal"
				case `public` = "public"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum ContractType: String, Codable, HTTPQueryable {
				case auction = "auction"
				case courier = "courier"
				case itemExchange = "item_exchange"
				case loan = "loan"
				case unknown = "unknown"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum Status: String, Codable, HTTPQueryable {
				case cancelled = "cancelled"
				case deleted = "deleted"
				case failed = "failed"
				case finished = "finished"
				case finishedContractor = "finished_contractor"
				case finishedIssuer = "finished_issuer"
				case inProgress = "in_progress"
				case outstanding = "outstanding"
				case rejected = "rejected"
				case reversed = "reversed"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var acceptorID: Int
			public var assigneeID: Int
			public var availability: Contracts.Contract.Availability
			public var buyout: Double?
			public var collateral: Double?
			public var contractID: Int
			public var dateAccepted: Date?
			public var dateCompleted: Date?
			public var dateExpired: Date
			public var dateIssued: Date
			public var daysToComplete: Int?
			public var endLocationID: Int64?
			public var forCorporation: Bool
			public var issuerCorporationID: Int
			public var issuerID: Int
			public var price: Double?
			public var reward: Double?
			public var startLocationID: Int64?
			public var status: Contracts.Contract.Status
			public var title: String?
			public var type: Contracts.Contract.ContractType
			public var volume: Double?
			
			public init(acceptorID: Int, assigneeID: Int, availability: Contracts.Contract.Availability, buyout: Double?, collateral: Double?, contractID: Int, dateAccepted: Date?, dateCompleted: Date?, dateExpired: Date, dateIssued: Date, daysToComplete: Int?, endLocationID: Int64?, forCorporation: Bool, issuerCorporationID: Int, issuerID: Int, price: Double?, reward: Double?, startLocationID: Int64?, status: Contracts.Contract.Status, title: String?, type: Contracts.Contract.ContractType, volume: Double?) {
				self.acceptorID = acceptorID
				self.assigneeID = assigneeID
				self.availability = availability
				self.buyout = buyout
				self.collateral = collateral
				self.contractID = contractID
				self.dateAccepted = dateAccepted
				self.dateCompleted = dateCompleted
				self.dateExpired = dateExpired
				self.dateIssued = dateIssued
				self.daysToComplete = daysToComplete
				self.endLocationID = endLocationID
				self.forCorporation = forCorporation
				self.issuerCorporationID = issuerCorporationID
				self.issuerID = issuerID
				self.price = price
				self.reward = reward
				self.startLocationID = startLocationID
				self.status = status
				self.title = title
				self.type = type
				self.volume = volume
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: acceptorID.hashValue)
				hashCombine(seed: &hash, value: assigneeID.hashValue)
				hashCombine(seed: &hash, value: availability.hashValue)
				hashCombine(seed: &hash, value: buyout?.hashValue ?? 0)
				hashCombine(seed: &hash, value: collateral?.hashValue ?? 0)
				hashCombine(seed: &hash, value: contractID.hashValue)
				hashCombine(seed: &hash, value: dateAccepted?.hashValue ?? 0)
				hashCombine(seed: &hash, value: dateCompleted?.hashValue ?? 0)
				hashCombine(seed: &hash, value: dateExpired.hashValue)
				hashCombine(seed: &hash, value: dateIssued.hashValue)
				hashCombine(seed: &hash, value: daysToComplete?.hashValue ?? 0)
				hashCombine(seed: &hash, value: endLocationID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: forCorporation.hashValue)
				hashCombine(seed: &hash, value: issuerCorporationID.hashValue)
				hashCombine(seed: &hash, value: issuerID.hashValue)
				hashCombine(seed: &hash, value: price?.hashValue ?? 0)
				hashCombine(seed: &hash, value: reward?.hashValue ?? 0)
				hashCombine(seed: &hash, value: startLocationID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: status.hashValue)
				hashCombine(seed: &hash, value: title?.hashValue ?? 0)
				hashCombine(seed: &hash, value: type.hashValue)
				hashCombine(seed: &hash, value: volume?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Contracts.Contract, rhs: Contracts.Contract) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case acceptorID = "acceptor_id"
				case assigneeID = "assignee_id"
				case availability
				case buyout
				case collateral
				case contractID = "contract_id"
				case dateAccepted = "date_accepted"
				case dateCompleted = "date_completed"
				case dateExpired = "date_expired"
				case dateIssued = "date_issued"
				case daysToComplete = "days_to_complete"
				case endLocationID = "end_location_id"
				case forCorporation = "for_corporation"
				case issuerCorporationID = "issuer_corporation_id"
				case issuerID = "issuer_id"
				case price
				case reward
				case startLocationID = "start_location_id"
				case status
				case title
				case type
				case volume
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .dateAccepted: return DateFormatter.esiDateTimeFormatter
						case .dateCompleted: return DateFormatter.esiDateTimeFormatter
						case .dateExpired: return DateFormatter.esiDateTimeFormatter
						case .dateIssued: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCorporationsCorporationIDContractsContractIDBidsNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Contracts.GetCorporationsCorporationIDContractsContractIDBidsNotFound, rhs: Contracts.GetCorporationsCorporationIDContractsContractIDBidsNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case error
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCorporationsCorporationIDContractsContractIDBidsOk: Codable, Hashable {
			
			
			public var amount: Float
			public var bidID: Int
			public var bidderID: Int
			public var dateBid: Date
			
			public init(amount: Float, bidID: Int, bidderID: Int, dateBid: Date) {
				self.amount = amount
				self.bidID = bidID
				self.bidderID = bidderID
				self.dateBid = dateBid
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: amount.hashValue)
				hashCombine(seed: &hash, value: bidID.hashValue)
				hashCombine(seed: &hash, value: bidderID.hashValue)
				hashCombine(seed: &hash, value: dateBid.hashValue)
				return hash
			}
			
			public static func ==(lhs: Contracts.GetCorporationsCorporationIDContractsContractIDBidsOk, rhs: Contracts.GetCorporationsCorporationIDContractsContractIDBidsOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case amount
				case bidID = "bid_id"
				case bidderID = "bidder_id"
				case dateBid = "date_bid"
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .dateBid: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCorporationsCorporationIDContractsContractIDItemsOk: Codable, Hashable {
			
			
			public var isIncluded: Bool
			public var isSingleton: Bool
			public var quantity: Int
			public var rawQuantity: Int?
			public var recordID: Int64
			public var typeID: Int
			
			public init(isIncluded: Bool, isSingleton: Bool, quantity: Int, rawQuantity: Int?, recordID: Int64, typeID: Int) {
				self.isIncluded = isIncluded
				self.isSingleton = isSingleton
				self.quantity = quantity
				self.rawQuantity = rawQuantity
				self.recordID = recordID
				self.typeID = typeID
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: isIncluded.hashValue)
				hashCombine(seed: &hash, value: isSingleton.hashValue)
				hashCombine(seed: &hash, value: quantity.hashValue)
				hashCombine(seed: &hash, value: rawQuantity?.hashValue ?? 0)
				hashCombine(seed: &hash, value: recordID.hashValue)
				hashCombine(seed: &hash, value: typeID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Contracts.GetCorporationsCorporationIDContractsContractIDItemsOk, rhs: Contracts.GetCorporationsCorporationIDContractsContractIDItemsOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case isIncluded = "is_included"
				case isSingleton = "is_singleton"
				case quantity
				case rawQuantity = "raw_quantity"
				case recordID = "record_id"
				case typeID = "type_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCorporationsCorporationIDContractsContractIDItemsNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Contracts.GetCorporationsCorporationIDContractsContractIDItemsNotFound, rhs: Contracts.GetCorporationsCorporationIDContractsContractIDItemsNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case error
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct Item: Codable, Hashable {
			
			
			public var isIncluded: Bool
			public var isSingleton: Bool
			public var quantity: Int
			public var rawQuantity: Int?
			public var recordID: Int64
			public var typeID: Int
			
			public init(isIncluded: Bool, isSingleton: Bool, quantity: Int, rawQuantity: Int?, recordID: Int64, typeID: Int) {
				self.isIncluded = isIncluded
				self.isSingleton = isSingleton
				self.quantity = quantity
				self.rawQuantity = rawQuantity
				self.recordID = recordID
				self.typeID = typeID
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: isIncluded.hashValue)
				hashCombine(seed: &hash, value: isSingleton.hashValue)
				hashCombine(seed: &hash, value: quantity.hashValue)
				hashCombine(seed: &hash, value: rawQuantity?.hashValue ?? 0)
				hashCombine(seed: &hash, value: recordID.hashValue)
				hashCombine(seed: &hash, value: typeID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Contracts.Item, rhs: Contracts.Item) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case isIncluded = "is_included"
				case isSingleton = "is_singleton"
				case quantity
				case rawQuantity = "raw_quantity"
				case recordID = "record_id"
				case typeID = "type_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCharactersCharacterIDContractsContractIDBidsNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Contracts.GetCharactersCharacterIDContractsContractIDBidsNotFound, rhs: Contracts.GetCharactersCharacterIDContractsContractIDBidsNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case error
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCorporationsCorporationIDContractsContractIDItems520Response: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Contracts.GetCorporationsCorporationIDContractsContractIDItems520Response, rhs: Contracts.GetCorporationsCorporationIDContractsContractIDItems520Response) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case error
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCharactersCharacterIDContractsContractIDItemsNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Contracts.GetCharactersCharacterIDContractsContractIDItemsNotFound, rhs: Contracts.GetCharactersCharacterIDContractsContractIDItemsNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case error
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCorporationsCorporationIDContractsOk: Codable, Hashable {
			
			public enum GetCorporationsCorporationIDContractsStatus: String, Codable, HTTPQueryable {
				case cancelled = "cancelled"
				case deleted = "deleted"
				case failed = "failed"
				case finished = "finished"
				case finishedContractor = "finished_contractor"
				case finishedIssuer = "finished_issuer"
				case inProgress = "in_progress"
				case outstanding = "outstanding"
				case rejected = "rejected"
				case reversed = "reversed"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDContractsType: String, Codable, HTTPQueryable {
				case auction = "auction"
				case courier = "courier"
				case itemExchange = "item_exchange"
				case loan = "loan"
				case unknown = "unknown"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDContractsAvailability: String, Codable, HTTPQueryable {
				case alliance = "alliance"
				case corporation = "corporation"
				case personal = "personal"
				case `public` = "public"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var acceptorID: Int
			public var assigneeID: Int
			public var availability: Contracts.GetCorporationsCorporationIDContractsOk.GetCorporationsCorporationIDContractsAvailability
			public var buyout: Double?
			public var collateral: Double?
			public var contractID: Int
			public var dateAccepted: Date?
			public var dateCompleted: Date?
			public var dateExpired: Date
			public var dateIssued: Date
			public var daysToComplete: Int?
			public var endLocationID: Int64?
			public var forCorporation: Bool
			public var issuerCorporationID: Int
			public var issuerID: Int
			public var price: Double?
			public var reward: Double?
			public var startLocationID: Int64?
			public var status: Contracts.GetCorporationsCorporationIDContractsOk.GetCorporationsCorporationIDContractsStatus
			public var title: String?
			public var type: Contracts.GetCorporationsCorporationIDContractsOk.GetCorporationsCorporationIDContractsType
			public var volume: Double?
			
			public init(acceptorID: Int, assigneeID: Int, availability: Contracts.GetCorporationsCorporationIDContractsOk.GetCorporationsCorporationIDContractsAvailability, buyout: Double?, collateral: Double?, contractID: Int, dateAccepted: Date?, dateCompleted: Date?, dateExpired: Date, dateIssued: Date, daysToComplete: Int?, endLocationID: Int64?, forCorporation: Bool, issuerCorporationID: Int, issuerID: Int, price: Double?, reward: Double?, startLocationID: Int64?, status: Contracts.GetCorporationsCorporationIDContractsOk.GetCorporationsCorporationIDContractsStatus, title: String?, type: Contracts.GetCorporationsCorporationIDContractsOk.GetCorporationsCorporationIDContractsType, volume: Double?) {
				self.acceptorID = acceptorID
				self.assigneeID = assigneeID
				self.availability = availability
				self.buyout = buyout
				self.collateral = collateral
				self.contractID = contractID
				self.dateAccepted = dateAccepted
				self.dateCompleted = dateCompleted
				self.dateExpired = dateExpired
				self.dateIssued = dateIssued
				self.daysToComplete = daysToComplete
				self.endLocationID = endLocationID
				self.forCorporation = forCorporation
				self.issuerCorporationID = issuerCorporationID
				self.issuerID = issuerID
				self.price = price
				self.reward = reward
				self.startLocationID = startLocationID
				self.status = status
				self.title = title
				self.type = type
				self.volume = volume
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: acceptorID.hashValue)
				hashCombine(seed: &hash, value: assigneeID.hashValue)
				hashCombine(seed: &hash, value: availability.hashValue)
				hashCombine(seed: &hash, value: buyout?.hashValue ?? 0)
				hashCombine(seed: &hash, value: collateral?.hashValue ?? 0)
				hashCombine(seed: &hash, value: contractID.hashValue)
				hashCombine(seed: &hash, value: dateAccepted?.hashValue ?? 0)
				hashCombine(seed: &hash, value: dateCompleted?.hashValue ?? 0)
				hashCombine(seed: &hash, value: dateExpired.hashValue)
				hashCombine(seed: &hash, value: dateIssued.hashValue)
				hashCombine(seed: &hash, value: daysToComplete?.hashValue ?? 0)
				hashCombine(seed: &hash, value: endLocationID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: forCorporation.hashValue)
				hashCombine(seed: &hash, value: issuerCorporationID.hashValue)
				hashCombine(seed: &hash, value: issuerID.hashValue)
				hashCombine(seed: &hash, value: price?.hashValue ?? 0)
				hashCombine(seed: &hash, value: reward?.hashValue ?? 0)
				hashCombine(seed: &hash, value: startLocationID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: status.hashValue)
				hashCombine(seed: &hash, value: title?.hashValue ?? 0)
				hashCombine(seed: &hash, value: type.hashValue)
				hashCombine(seed: &hash, value: volume?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Contracts.GetCorporationsCorporationIDContractsOk, rhs: Contracts.GetCorporationsCorporationIDContractsOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case acceptorID = "acceptor_id"
				case assigneeID = "assignee_id"
				case availability
				case buyout
				case collateral
				case contractID = "contract_id"
				case dateAccepted = "date_accepted"
				case dateCompleted = "date_completed"
				case dateExpired = "date_expired"
				case dateIssued = "date_issued"
				case daysToComplete = "days_to_complete"
				case endLocationID = "end_location_id"
				case forCorporation = "for_corporation"
				case issuerCorporationID = "issuer_corporation_id"
				case issuerID = "issuer_id"
				case price
				case reward
				case startLocationID = "start_location_id"
				case status
				case title
				case type
				case volume
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .dateAccepted: return DateFormatter.esiDateTimeFormatter
						case .dateCompleted: return DateFormatter.esiDateTimeFormatter
						case .dateExpired: return DateFormatter.esiDateTimeFormatter
						case .dateIssued: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct Bid: Codable, Hashable {
			
			
			public var amount: Float
			public var bidID: Int
			public var bidderID: Int
			public var dateBid: Date
			
			public init(amount: Float, bidID: Int, bidderID: Int, dateBid: Date) {
				self.amount = amount
				self.bidID = bidID
				self.bidderID = bidderID
				self.dateBid = dateBid
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: amount.hashValue)
				hashCombine(seed: &hash, value: bidID.hashValue)
				hashCombine(seed: &hash, value: bidderID.hashValue)
				hashCombine(seed: &hash, value: dateBid.hashValue)
				return hash
			}
			
			public static func ==(lhs: Contracts.Bid, rhs: Contracts.Bid) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case amount
				case bidID = "bid_id"
				case bidderID = "bidder_id"
				case dateBid = "date_bid"
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .dateBid: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
	}
	
}
