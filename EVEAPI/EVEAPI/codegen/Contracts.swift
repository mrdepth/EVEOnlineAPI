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
		
		public func getContracts(characterID: Int, completionBlock:((Result<[Contracts.Contract]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-contracts.read_character_contracts.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/contracts/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Contracts.Contract]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getContractBids(characterID: Int, contractID: Int, completionBlock:((Result<[Contracts.Bid]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-contracts.read_character_contracts.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/contracts/\(contractID)/bids/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Contracts.Bid]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getContractItems(characterID: Int, contractID: Int, completionBlock:((Result<[Contracts.Item]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-contracts.read_character_contracts.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/characters/\(characterID)/contracts/\(contractID)/items/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Contracts.Item]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		public class GetCharactersCharacterIDContractsForbidden: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			public static func ==(lhs: Contracts.GetCharactersCharacterIDContractsForbidden, rhs: Contracts.GetCharactersCharacterIDContractsForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Contracts.GetCharactersCharacterIDContractsForbidden) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Contracts.GetCharactersCharacterIDContractsForbidden(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCharactersCharacterIDContractsForbidden)?.hashValue == hashValue
			}
			
		}
		
		
		public class Contract: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public enum Availability: String, JSONCoding, HTTPQueryable {
				case alliance = "alliance"
				case corporation = "corporation"
				case personal = "personal"
				case `public` = "public"
				
				public init() {
					self = .`public`
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = Availability(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum ContractType: String, JSONCoding, HTTPQueryable {
				case auction = "auction"
				case courier = "courier"
				case itemExchange = "item_exchange"
				case loan = "loan"
				case unknown = "unknown"
				
				public init() {
					self = .unknown
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = ContractType(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum Status: String, JSONCoding, HTTPQueryable {
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
				
				public init() {
					self = .outstanding
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = Status(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var acceptorID: Int = Int()
			public var assigneeID: Int = Int()
			public var availability: Contracts.Contract.Availability = Contracts.Contract.Availability()
			public var buyout: Float? = nil
			public var collateral: Float? = nil
			public var contractID: Int = Int()
			public var dateAccepted: Date? = nil
			public var dateCompleted: Date? = nil
			public var dateExpired: Date = Date()
			public var dateIssued: Date = Date()
			public var daysToComplete: Int? = nil
			public var endLocationID: Int64? = nil
			public var forCorporation: Bool = Bool()
			public var issuerCorporationID: Int = Int()
			public var issuerID: Int = Int()
			public var price: Float? = nil
			public var reward: Float? = nil
			public var startLocationID: Int64? = nil
			public var status: Contracts.Contract.Status = Contracts.Contract.Status()
			public var title: String? = nil
			public var type: Contracts.Contract.ContractType = Contracts.Contract.ContractType()
			public var volume: Float? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let acceptorID = dictionary["acceptor_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.acceptorID = acceptorID
				guard let assigneeID = dictionary["assignee_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.assigneeID = assigneeID
				guard let availability = Contracts.Contract.Availability(rawValue: dictionary["availability"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.availability = availability
				buyout = dictionary["buyout"] as? Float
				collateral = dictionary["collateral"] as? Float
				guard let contractID = dictionary["contract_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.contractID = contractID
				dateAccepted = DateFormatter.esiDateTimeFormatter.date(from: dictionary["date_accepted"] as? String ?? "")
				dateCompleted = DateFormatter.esiDateTimeFormatter.date(from: dictionary["date_completed"] as? String ?? "")
				guard let dateExpired = DateFormatter.esiDateTimeFormatter.date(from: dictionary["date_expired"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.dateExpired = dateExpired
				guard let dateIssued = DateFormatter.esiDateTimeFormatter.date(from: dictionary["date_issued"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.dateIssued = dateIssued
				daysToComplete = dictionary["days_to_complete"] as? Int
				endLocationID = dictionary["end_location_id"] as? Int64
				guard let forCorporation = dictionary["for_corporation"] as? Bool else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.forCorporation = forCorporation
				guard let issuerCorporationID = dictionary["issuer_corporation_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.issuerCorporationID = issuerCorporationID
				guard let issuerID = dictionary["issuer_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.issuerID = issuerID
				price = dictionary["price"] as? Float
				reward = dictionary["reward"] as? Float
				startLocationID = dictionary["start_location_id"] as? Int64
				guard let status = Contracts.Contract.Status(rawValue: dictionary["status"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.status = status
				title = dictionary["title"] as? String
				guard let type = Contracts.Contract.ContractType(rawValue: dictionary["type"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.type = type
				volume = dictionary["volume"] as? Float
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				acceptorID = aDecoder.decodeInteger(forKey: "acceptor_id")
				assigneeID = aDecoder.decodeInteger(forKey: "assignee_id")
				availability = Contracts.Contract.Availability(rawValue: aDecoder.decodeObject(forKey: "availability") as? String ?? "") ?? Contracts.Contract.Availability()
				buyout = aDecoder.containsValue(forKey: "buyout") ? aDecoder.decodeFloat(forKey: "buyout") : nil
				collateral = aDecoder.containsValue(forKey: "collateral") ? aDecoder.decodeFloat(forKey: "collateral") : nil
				contractID = aDecoder.decodeInteger(forKey: "contract_id")
				dateAccepted = aDecoder.decodeObject(forKey: "date_accepted") as? Date
				dateCompleted = aDecoder.decodeObject(forKey: "date_completed") as? Date
				dateExpired = aDecoder.decodeObject(forKey: "date_expired") as? Date ?? Date()
				dateIssued = aDecoder.decodeObject(forKey: "date_issued") as? Date ?? Date()
				daysToComplete = aDecoder.containsValue(forKey: "days_to_complete") ? aDecoder.decodeInteger(forKey: "days_to_complete") : nil
				endLocationID = aDecoder.containsValue(forKey: "end_location_id") ? aDecoder.decodeInt64(forKey: "end_location_id") : nil
				forCorporation = aDecoder.decodeBool(forKey: "for_corporation")
				issuerCorporationID = aDecoder.decodeInteger(forKey: "issuer_corporation_id")
				issuerID = aDecoder.decodeInteger(forKey: "issuer_id")
				price = aDecoder.containsValue(forKey: "price") ? aDecoder.decodeFloat(forKey: "price") : nil
				reward = aDecoder.containsValue(forKey: "reward") ? aDecoder.decodeFloat(forKey: "reward") : nil
				startLocationID = aDecoder.containsValue(forKey: "start_location_id") ? aDecoder.decodeInt64(forKey: "start_location_id") : nil
				status = Contracts.Contract.Status(rawValue: aDecoder.decodeObject(forKey: "status") as? String ?? "") ?? Contracts.Contract.Status()
				title = aDecoder.decodeObject(forKey: "title") as? String
				type = Contracts.Contract.ContractType(rawValue: aDecoder.decodeObject(forKey: "type") as? String ?? "") ?? Contracts.Contract.ContractType()
				volume = aDecoder.containsValue(forKey: "volume") ? aDecoder.decodeFloat(forKey: "volume") : nil
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(acceptorID, forKey: "acceptor_id")
				aCoder.encode(assigneeID, forKey: "assignee_id")
				aCoder.encode(availability.rawValue, forKey: "availability")
				if let v = buyout {
					aCoder.encode(v, forKey: "buyout")
				}
				if let v = collateral {
					aCoder.encode(v, forKey: "collateral")
				}
				aCoder.encode(contractID, forKey: "contract_id")
				if let v = dateAccepted {
					aCoder.encode(v, forKey: "date_accepted")
				}
				if let v = dateCompleted {
					aCoder.encode(v, forKey: "date_completed")
				}
				aCoder.encode(dateExpired, forKey: "date_expired")
				aCoder.encode(dateIssued, forKey: "date_issued")
				if let v = daysToComplete {
					aCoder.encode(v, forKey: "days_to_complete")
				}
				if let v = endLocationID {
					aCoder.encode(v, forKey: "end_location_id")
				}
				aCoder.encode(forCorporation, forKey: "for_corporation")
				aCoder.encode(issuerCorporationID, forKey: "issuer_corporation_id")
				aCoder.encode(issuerID, forKey: "issuer_id")
				if let v = price {
					aCoder.encode(v, forKey: "price")
				}
				if let v = reward {
					aCoder.encode(v, forKey: "reward")
				}
				if let v = startLocationID {
					aCoder.encode(v, forKey: "start_location_id")
				}
				aCoder.encode(status.rawValue, forKey: "status")
				if let v = title {
					aCoder.encode(v, forKey: "title")
				}
				aCoder.encode(type.rawValue, forKey: "type")
				if let v = volume {
					aCoder.encode(v, forKey: "volume")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["acceptor_id"] = acceptorID.json
				json["assignee_id"] = assigneeID.json
				json["availability"] = availability.json
				if let v = buyout?.json {
					json["buyout"] = v
				}
				if let v = collateral?.json {
					json["collateral"] = v
				}
				json["contract_id"] = contractID.json
				if let v = dateAccepted?.json {
					json["date_accepted"] = v
				}
				if let v = dateCompleted?.json {
					json["date_completed"] = v
				}
				json["date_expired"] = dateExpired.json
				json["date_issued"] = dateIssued.json
				if let v = daysToComplete?.json {
					json["days_to_complete"] = v
				}
				if let v = endLocationID?.json {
					json["end_location_id"] = v
				}
				json["for_corporation"] = forCorporation.json
				json["issuer_corporation_id"] = issuerCorporationID.json
				json["issuer_id"] = issuerID.json
				if let v = price?.json {
					json["price"] = v
				}
				if let v = reward?.json {
					json["reward"] = v
				}
				if let v = startLocationID?.json {
					json["start_location_id"] = v
				}
				json["status"] = status.json
				if let v = title?.json {
					json["title"] = v
				}
				json["type"] = type.json
				if let v = volume?.json {
					json["volume"] = v
				}
				return json
			}
			
			override public var hashValue: Int {
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
			
			init(_ other: Contracts.Contract) {
				acceptorID = other.acceptorID
				assigneeID = other.assigneeID
				availability = other.availability
				buyout = other.buyout
				collateral = other.collateral
				contractID = other.contractID
				dateAccepted = other.dateAccepted
				dateCompleted = other.dateCompleted
				dateExpired = other.dateExpired
				dateIssued = other.dateIssued
				daysToComplete = other.daysToComplete
				endLocationID = other.endLocationID
				forCorporation = other.forCorporation
				issuerCorporationID = other.issuerCorporationID
				issuerID = other.issuerID
				price = other.price
				reward = other.reward
				startLocationID = other.startLocationID
				status = other.status
				title = other.title
				type = other.type
				volume = other.volume
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Contracts.Contract(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Contract)?.hashValue == hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDContractsContractIDBidsInternalServerError: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			public static func ==(lhs: Contracts.GetCharactersCharacterIDContractsContractIDBidsInternalServerError, rhs: Contracts.GetCharactersCharacterIDContractsContractIDBidsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Contracts.GetCharactersCharacterIDContractsContractIDBidsInternalServerError) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Contracts.GetCharactersCharacterIDContractsContractIDBidsInternalServerError(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCharactersCharacterIDContractsContractIDBidsInternalServerError)?.hashValue == hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDContractsInternalServerError: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			public static func ==(lhs: Contracts.GetCharactersCharacterIDContractsInternalServerError, rhs: Contracts.GetCharactersCharacterIDContractsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Contracts.GetCharactersCharacterIDContractsInternalServerError) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Contracts.GetCharactersCharacterIDContractsInternalServerError(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCharactersCharacterIDContractsInternalServerError)?.hashValue == hashValue
			}
			
		}
		
		
		public class Bid: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var amount: Float = Float()
			public var bidID: Int = Int()
			public var bidderID: Int = Int()
			public var dateBid: Date = Date()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let amount = dictionary["amount"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.amount = amount
				guard let bidID = dictionary["bid_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.bidID = bidID
				guard let bidderID = dictionary["bidder_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.bidderID = bidderID
				guard let dateBid = DateFormatter.esiDateTimeFormatter.date(from: dictionary["date_bid"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.dateBid = dateBid
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				amount = aDecoder.decodeFloat(forKey: "amount")
				bidID = aDecoder.decodeInteger(forKey: "bid_id")
				bidderID = aDecoder.decodeInteger(forKey: "bidder_id")
				dateBid = aDecoder.decodeObject(forKey: "date_bid") as? Date ?? Date()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(amount, forKey: "amount")
				aCoder.encode(bidID, forKey: "bid_id")
				aCoder.encode(bidderID, forKey: "bidder_id")
				aCoder.encode(dateBid, forKey: "date_bid")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["amount"] = amount.json
				json["bid_id"] = bidID.json
				json["bidder_id"] = bidderID.json
				json["date_bid"] = dateBid.json
				return json
			}
			
			override public var hashValue: Int {
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
			
			init(_ other: Contracts.Bid) {
				amount = other.amount
				bidID = other.bidID
				bidderID = other.bidderID
				dateBid = other.dateBid
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Contracts.Bid(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Bid)?.hashValue == hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDContractsContractIDBidsForbidden: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			public static func ==(lhs: Contracts.GetCharactersCharacterIDContractsContractIDBidsForbidden, rhs: Contracts.GetCharactersCharacterIDContractsContractIDBidsForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Contracts.GetCharactersCharacterIDContractsContractIDBidsForbidden) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Contracts.GetCharactersCharacterIDContractsContractIDBidsForbidden(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCharactersCharacterIDContractsContractIDBidsForbidden)?.hashValue == hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDContractsContractIDItemsForbidden: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			public static func ==(lhs: Contracts.GetCharactersCharacterIDContractsContractIDItemsForbidden, rhs: Contracts.GetCharactersCharacterIDContractsContractIDItemsForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Contracts.GetCharactersCharacterIDContractsContractIDItemsForbidden) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Contracts.GetCharactersCharacterIDContractsContractIDItemsForbidden(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCharactersCharacterIDContractsContractIDItemsForbidden)?.hashValue == hashValue
			}
			
		}
		
		
		public class Item: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var isIncluded: Bool = Bool()
			public var isSingleton: Bool = Bool()
			public var quantity: Int = Int()
			public var rawQuantity: Int? = nil
			public var recordID: Int64 = Int64()
			public var typeID: Int = Int()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let isIncluded = dictionary["is_included"] as? Bool else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.isIncluded = isIncluded
				guard let isSingleton = dictionary["is_singleton"] as? Bool else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.isSingleton = isSingleton
				guard let quantity = dictionary["quantity"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.quantity = quantity
				rawQuantity = dictionary["raw_quantity"] as? Int
				guard let recordID = dictionary["record_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.recordID = recordID
				guard let typeID = dictionary["type_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.typeID = typeID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				isIncluded = aDecoder.decodeBool(forKey: "is_included")
				isSingleton = aDecoder.decodeBool(forKey: "is_singleton")
				quantity = aDecoder.decodeInteger(forKey: "quantity")
				rawQuantity = aDecoder.containsValue(forKey: "raw_quantity") ? aDecoder.decodeInteger(forKey: "raw_quantity") : nil
				recordID = aDecoder.decodeInt64(forKey: "record_id")
				typeID = aDecoder.decodeInteger(forKey: "type_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(isIncluded, forKey: "is_included")
				aCoder.encode(isSingleton, forKey: "is_singleton")
				aCoder.encode(quantity, forKey: "quantity")
				if let v = rawQuantity {
					aCoder.encode(v, forKey: "raw_quantity")
				}
				aCoder.encode(recordID, forKey: "record_id")
				aCoder.encode(typeID, forKey: "type_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["is_included"] = isIncluded.json
				json["is_singleton"] = isSingleton.json
				json["quantity"] = quantity.json
				if let v = rawQuantity?.json {
					json["raw_quantity"] = v
				}
				json["record_id"] = recordID.json
				json["type_id"] = typeID.json
				return json
			}
			
			override public var hashValue: Int {
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
			
			init(_ other: Contracts.Item) {
				isIncluded = other.isIncluded
				isSingleton = other.isSingleton
				quantity = other.quantity
				rawQuantity = other.rawQuantity
				recordID = other.recordID
				typeID = other.typeID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Contracts.Item(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Item)?.hashValue == hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDContractsContractIDItemsInternalServerError: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			public static func ==(lhs: Contracts.GetCharactersCharacterIDContractsContractIDItemsInternalServerError, rhs: Contracts.GetCharactersCharacterIDContractsContractIDItemsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Contracts.GetCharactersCharacterIDContractsContractIDItemsInternalServerError) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Contracts.GetCharactersCharacterIDContractsContractIDItemsInternalServerError(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCharactersCharacterIDContractsContractIDItemsInternalServerError)?.hashValue == hashValue
			}
			
		}
		
		
	}
	
}
