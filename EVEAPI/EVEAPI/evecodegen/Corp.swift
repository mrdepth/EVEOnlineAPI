import Foundation
import Alamofire


public extension EVE {
	public var corp: Corp {
		return Corp(sessionManager: self)
	}
	
	class Corp {
		weak var sessionManager: EVE?
		
		init(sessionManager: EVE) {
			self.sessionManager = sessionManager
		}
		
		public func accountBalance(completionBlock:((Result<EVE.Corp.AccountBalance>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let parameters = Parameters()
			
			let url = session!.baseURL + "Corp/AccountBalance.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Corp.AccountBalance>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func assetList(flat: Bool? = nil, completionBlock:((Result<EVE.Corp.AssetList>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			var parameters = Parameters()
			if let v = flat {
				parameters["flat"] = v
			}
			
			let url = session!.baseURL + "Corp/AssetList.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Corp.AssetList>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func blueprints(completionBlock:((Result<EVE.Corp.Blueprints>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let parameters = Parameters()
			
			let url = session!.baseURL + "Corp/Blueprints.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Corp.Blueprints>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func bookmarks(completionBlock:((Result<EVE.Corp.Bookmarks>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let parameters = Parameters()
			
			let url = session!.baseURL + "Corp/Bookmarks.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Corp.Bookmarks>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func contactList(completionBlock:((Result<EVE.Corp.ContactList>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let parameters = Parameters()
			
			let url = session!.baseURL + "Corp/ContactList.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Corp.ContactList>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func contractBids(completionBlock:((Result<EVE.Corp.ContractBids>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let parameters = Parameters()
			
			let url = session!.baseURL + "Corp/ContractBids.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Corp.ContractBids>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func contractItems(contractID: Int64, completionBlock:((Result<EVE.Corp.ContractItems>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			var parameters = Parameters()
			parameters["contractID"] = contractID
			
			let url = session!.baseURL + "Corp/ContractItems.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Corp.ContractItems>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func contracts(completionBlock:((Result<EVE.Corp.Contracts>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let parameters = Parameters()
			
			let url = session!.baseURL + "Corp/Contracts.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Corp.Contracts>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func facWarStats(completionBlock:((Result<EVE.Corp.FacWarStats>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let parameters = Parameters()
			
			let url = session!.baseURL + "Corp/FacWarStats.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Corp.FacWarStats>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func industryJobs(completionBlock:((Result<EVE.Corp.IndustryJobs>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let parameters = Parameters()
			
			let url = session!.baseURL + "Corp/IndustryJobs.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Corp.IndustryJobs>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func killMails(fromID: Int64? = nil, rowCount: Int, completionBlock:((Result<EVE.Corp.KillMails>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			var parameters = Parameters()
			if let v = fromID {
				parameters["fromID"] = v
			}
			parameters["rowCount"] = rowCount
			
			let url = session!.baseURL + "Corp/KillMails.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Corp.KillMails>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func locations(ids: [Int64], completionBlock:((Result<EVE.Corp.Locations>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			var parameters = Parameters()
			parameters["ids"] = ids
			
			let url = session!.baseURL + "Corp/Locations.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Corp.Locations>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func marketOrders(completionBlock:((Result<EVE.Corp.MarketOrders>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let parameters = Parameters()
			
			let url = session!.baseURL + "Corp/MarketOrders.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Corp.MarketOrders>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func medals(completionBlock:((Result<EVE.Corp.Medals>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let parameters = Parameters()
			
			let url = session!.baseURL + "Corp/Medals.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Corp.Medals>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func standings(completionBlock:((Result<EVE.Corp.Standings>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let parameters = Parameters()
			
			let url = session!.baseURL + "Corp/Standings.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Corp.Standings>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func walletJournal(fromID: Int64? = nil, rowCount: Int? = nil, completionBlock:((Result<EVE.Corp.WalletJournal>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			var parameters = Parameters()
			if let v = fromID {
				parameters["fromID"] = v
			}
			if let v = rowCount {
				parameters["rowCount"] = v
			}
			
			let url = session!.baseURL + "Corp/WalletJournal.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Corp.WalletJournal>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func walletTransactions(fromID: Int64? = nil, rowCount: Int? = nil, completionBlock:((Result<EVE.Corp.WalletTransactions>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			var parameters = Parameters()
			if let v = fromID {
				parameters["fromID"] = v
			}
			if let v = rowCount {
				parameters["rowCount"] = v
			}
			
			let url = session!.baseURL + "Corp/WalletTransactions.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Corp.WalletTransactions>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		public class AccountBalance: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Account: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var accountID: Int = Int()
				public var accountKey: Int = Int()
				public var balance: Double = Double()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let accountID = dictionary["accountID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.accountID = accountID
					guard let accountKey = dictionary["accountKey"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.accountKey = accountKey
					guard let balance = dictionary["balance"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.balance = balance
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["accountID"] = accountID.json
					json["accountKey"] = accountKey.json
					json["balance"] = balance.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.accountID.hashValue)
					hashCombine(seed: &hash, value: self.accountKey.hashValue)
					hashCombine(seed: &hash, value: self.balance.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Corp.AccountBalance.Account, rhs: EVE.Corp.AccountBalance.Account) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Corp.AccountBalance.Account) {
					accountID = other.accountID
					accountKey = other.accountKey
					balance = other.balance
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Corp.AccountBalance.Account(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Corp.AccountBalance.Account)?.hashValue == hashValue
				}
				
			}
			
			public var accounts: [EVE.Corp.AccountBalance.Account] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let accounts = try dictionary.rowset(name: "accounts")?.map ({try EVE.Corp.AccountBalance.Account(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.accounts = accounts
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["accounts"] = accounts.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.accounts.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Corp.AccountBalance, rhs: EVE.Corp.AccountBalance) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Corp.AccountBalance) {
				accounts = other.accounts.compactMap { EVE.Corp.AccountBalance.Account($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Corp.AccountBalance(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Corp.AccountBalance)?.hashValue == hashValue
			}
			
		}
		
		
		public class AssetList: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Asset: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var contents: [EVE.Corp.AssetList.Asset]? = nil
				public var flag: Int = Int()
				public var itemID: Int64 = Int64()
				public var locationID: Int64? = nil
				public var quantity: Int64 = Int64()
				public var rawQuantity: Int? = nil
				public var singleton: Bool = Bool()
				public var typeID: Int = Int()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					contents = try dictionary.rowset(name: "contents")?.map {try EVE.Corp.AssetList.Asset(json: $0)}
					guard let flag = dictionary["flag"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.flag = flag
					guard let itemID = dictionary["itemID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.itemID = itemID
					locationID = dictionary["locationID"] as? Int64
					guard let quantity = dictionary["quantity"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.quantity = quantity
					rawQuantity = dictionary["rawQuantity"] as? Int
					guard let singleton = dictionary["singleton"] as? Bool else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.singleton = singleton
					guard let typeID = dictionary["typeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.typeID = typeID
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					if let v = contents?.json {
						json["contents"] = v
					}
					json["flag"] = flag.json
					json["itemID"] = itemID.json
					if let v = locationID?.json {
						json["locationID"] = v
					}
					json["quantity"] = quantity.json
					if let v = rawQuantity?.json {
						json["rawQuantity"] = v
					}
					json["singleton"] = singleton.json
					json["typeID"] = typeID.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					self.contents?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					hashCombine(seed: &hash, value: self.flag.hashValue)
					hashCombine(seed: &hash, value: self.itemID.hashValue)
					hashCombine(seed: &hash, value: self.locationID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.quantity.hashValue)
					hashCombine(seed: &hash, value: self.rawQuantity?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.singleton.hashValue)
					hashCombine(seed: &hash, value: self.typeID.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Corp.AssetList.Asset, rhs: EVE.Corp.AssetList.Asset) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Corp.AssetList.Asset) {
					contents = other.contents?.compactMap { EVE.Corp.AssetList.Asset($0) }
					flag = other.flag
					itemID = other.itemID
					locationID = other.locationID
					quantity = other.quantity
					rawQuantity = other.rawQuantity
					singleton = other.singleton
					typeID = other.typeID
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Corp.AssetList.Asset(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Corp.AssetList.Asset)?.hashValue == hashValue
				}
				
			}
			
			public var assets: [EVE.Corp.AssetList.Asset] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let assets = try dictionary.rowset(name: "assets")?.map ({try EVE.Corp.AssetList.Asset(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.assets = assets
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["assets"] = assets.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.assets.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Corp.AssetList, rhs: EVE.Corp.AssetList) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Corp.AssetList) {
				assets = other.assets.compactMap { EVE.Corp.AssetList.Asset($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Corp.AssetList(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Corp.AssetList)?.hashValue == hashValue
			}
			
		}
		
		
		public class Blueprints: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Blueprint: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var flag: Int = Int()
				public var itemID: Int64 = Int64()
				public var locationID: Int64 = Int64()
				public var materialEfficiency: Int = Int()
				public var quantity: Int64 = Int64()
				public var runs: Int = Int()
				public var timeEfficiency: Int = Int()
				public var typeID: Int = Int()
				public var typeName: String = String()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let flag = dictionary["flag"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.flag = flag
					guard let itemID = dictionary["itemID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.itemID = itemID
					guard let locationID = dictionary["locationID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.locationID = locationID
					guard let materialEfficiency = dictionary["materialEfficiency"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.materialEfficiency = materialEfficiency
					guard let quantity = dictionary["quantity"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.quantity = quantity
					guard let runs = dictionary["runs"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.runs = runs
					guard let timeEfficiency = dictionary["timeEfficiency"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.timeEfficiency = timeEfficiency
					guard let typeID = dictionary["typeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.typeID = typeID
					guard let typeName = dictionary["typeName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.typeName = typeName
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["flag"] = flag.json
					json["itemID"] = itemID.json
					json["locationID"] = locationID.json
					json["materialEfficiency"] = materialEfficiency.json
					json["quantity"] = quantity.json
					json["runs"] = runs.json
					json["timeEfficiency"] = timeEfficiency.json
					json["typeID"] = typeID.json
					json["typeName"] = typeName.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.flag.hashValue)
					hashCombine(seed: &hash, value: self.itemID.hashValue)
					hashCombine(seed: &hash, value: self.locationID.hashValue)
					hashCombine(seed: &hash, value: self.materialEfficiency.hashValue)
					hashCombine(seed: &hash, value: self.quantity.hashValue)
					hashCombine(seed: &hash, value: self.runs.hashValue)
					hashCombine(seed: &hash, value: self.timeEfficiency.hashValue)
					hashCombine(seed: &hash, value: self.typeID.hashValue)
					hashCombine(seed: &hash, value: self.typeName.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Corp.Blueprints.Blueprint, rhs: EVE.Corp.Blueprints.Blueprint) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Corp.Blueprints.Blueprint) {
					flag = other.flag
					itemID = other.itemID
					locationID = other.locationID
					materialEfficiency = other.materialEfficiency
					quantity = other.quantity
					runs = other.runs
					timeEfficiency = other.timeEfficiency
					typeID = other.typeID
					typeName = other.typeName
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Corp.Blueprints.Blueprint(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Corp.Blueprints.Blueprint)?.hashValue == hashValue
				}
				
			}
			
			public var blueprints: [EVE.Corp.Blueprints.Blueprint] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let blueprints = try dictionary.rowset(name: "blueprints")?.map ({try EVE.Corp.Blueprints.Blueprint(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.blueprints = blueprints
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["blueprints"] = blueprints.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.blueprints.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Corp.Blueprints, rhs: EVE.Corp.Blueprints) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Corp.Blueprints) {
				blueprints = other.blueprints.compactMap { EVE.Corp.Blueprints.Blueprint($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Corp.Blueprints(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Corp.Blueprints)?.hashValue == hashValue
			}
			
		}
		
		
		public class Bookmarks: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Folder: NSObject, Codable, NSCopying, JSONCoding {
				
				public class Bookmark: NSObject, Codable, NSCopying, JSONCoding {
					
					
					public var bookmarkID: Int = Int()
					public var created: Date = Date()
					public var creatorID: Int64 = Int64()
					public var itemID: Int64 = Int64()
					public var locationID: Int64 = Int64()
					public var memo: String = String()
					public var note: String = String()
					public var typeID: Int = Int()
					public var x: Double = Double()
					public var y: Double = Double()
					public var z: Double = Double()
					
					public static var supportsSecureCoding: Bool {
						return true
					}
					
					public required init(json: Any) throws {
						guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
						
						guard let bookmarkID = dictionary["bookmarkID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.bookmarkID = bookmarkID
						guard let created = DateFormatter.eveDateFormatter.date(from: dictionary["created"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
						self.created = created
						guard let creatorID = dictionary["creatorID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.creatorID = creatorID
						guard let itemID = dictionary["itemID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.itemID = itemID
						guard let locationID = dictionary["locationID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.locationID = locationID
						guard let memo = dictionary["memo"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.memo = memo
						guard let note = dictionary["note"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.note = note
						guard let typeID = dictionary["typeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.typeID = typeID
						guard let x = dictionary["x"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.x = x
						guard let y = dictionary["y"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.y = y
						guard let z = dictionary["z"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.z = z
						
						super.init()
					}
					
					override public init() {
						super.init()
					}
					/*
					public required init?(coder aDecoder: NSCoder) {
						{decodings}
						
						super.init()
					}
					
					public func encode(with aCoder: NSCoder) {
						{encodings}
					}
					*/
					public var json: Any {
						var json = [String: Any]()
						json["bookmarkID"] = bookmarkID.json
						json["created"] = created.json
						json["creatorID"] = creatorID.json
						json["itemID"] = itemID.json
						json["locationID"] = locationID.json
						json["memo"] = memo.json
						json["note"] = note.json
						json["typeID"] = typeID.json
						json["x"] = x.json
						json["y"] = y.json
						json["z"] = z.json
						return json
					}
					
					private lazy var _hashValue: Int = {
						var hash: Int = 0
						hashCombine(seed: &hash, value: self.bookmarkID.hashValue)
						hashCombine(seed: &hash, value: self.created.hashValue)
						hashCombine(seed: &hash, value: self.creatorID.hashValue)
						hashCombine(seed: &hash, value: self.itemID.hashValue)
						hashCombine(seed: &hash, value: self.locationID.hashValue)
						hashCombine(seed: &hash, value: self.memo.hashValue)
						hashCombine(seed: &hash, value: self.note.hashValue)
						hashCombine(seed: &hash, value: self.typeID.hashValue)
						hashCombine(seed: &hash, value: self.x.hashValue)
						hashCombine(seed: &hash, value: self.y.hashValue)
						hashCombine(seed: &hash, value: self.z.hashValue)
						return hash
					}()
					
					override public var hashValue: Int {
						return _hashValue
					}
					
					public static func ==(lhs: EVE.Corp.Bookmarks.Folder.Bookmark, rhs: EVE.Corp.Bookmarks.Folder.Bookmark) -> Bool {
						return lhs.hashValue == rhs.hashValue
					}
					
					init(_ other: EVE.Corp.Bookmarks.Folder.Bookmark) {
						bookmarkID = other.bookmarkID
						created = other.created
						creatorID = other.creatorID
						itemID = other.itemID
						locationID = other.locationID
						memo = other.memo
						note = other.note
						typeID = other.typeID
						x = other.x
						y = other.y
						z = other.z
					}
					
					public func copy(with zone: NSZone? = nil) -> Any {
						return EVE.Corp.Bookmarks.Folder.Bookmark(self)
					}
					
					
					public override func isEqual(_ object: Any?) -> Bool {
						return (object as? EVE.Corp.Bookmarks.Folder.Bookmark)?.hashValue == hashValue
					}
					
				}
				
				public var bookmarks: [EVE.Corp.Bookmarks.Folder.Bookmark] = []
				public var folderID: Int = Int()
				public var folderName: String = String()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let bookmarks = try dictionary.rowset(name: "bookmarks")?.map ({try EVE.Corp.Bookmarks.Folder.Bookmark(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.bookmarks = bookmarks
					guard let folderID = dictionary["folderID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.folderID = folderID
					guard let folderName = dictionary["folderName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.folderName = folderName
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["bookmarks"] = bookmarks.json
					json["folderID"] = folderID.json
					json["folderName"] = folderName.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					self.bookmarks.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					hashCombine(seed: &hash, value: self.folderID.hashValue)
					hashCombine(seed: &hash, value: self.folderName.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Corp.Bookmarks.Folder, rhs: EVE.Corp.Bookmarks.Folder) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Corp.Bookmarks.Folder) {
					bookmarks = other.bookmarks.compactMap { EVE.Corp.Bookmarks.Folder.Bookmark($0) }
					folderID = other.folderID
					folderName = other.folderName
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Corp.Bookmarks.Folder(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Corp.Bookmarks.Folder)?.hashValue == hashValue
				}
				
			}
			
			public var folders: [EVE.Corp.Bookmarks.Folder] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let folders = try dictionary.rowset(name: "folders")?.map ({try EVE.Corp.Bookmarks.Folder(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.folders = folders
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["folders"] = folders.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.folders.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Corp.Bookmarks, rhs: EVE.Corp.Bookmarks) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Corp.Bookmarks) {
				folders = other.folders.compactMap { EVE.Corp.Bookmarks.Folder($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Corp.Bookmarks(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Corp.Bookmarks)?.hashValue == hashValue
			}
			
		}
		
		
		public class ContactList: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Contact: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var contactID: Int64 = Int64()
				public var contactName: String = String()
				public var contactTypeID: Int = Int()
				public var inWatchlist: Bool? = nil
				public var labelMask: Int64 = Int64()
				public var standing: Float = Float()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let contactID = dictionary["contactID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.contactID = contactID
					guard let contactName = dictionary["contactName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.contactName = contactName
					guard let contactTypeID = dictionary["contactTypeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.contactTypeID = contactTypeID
					inWatchlist = dictionary["inWatchlist"] as? Bool
					guard let labelMask = dictionary["labelMask"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.labelMask = labelMask
					guard let standing = dictionary["standing"] as? Float else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.standing = standing
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["contactID"] = contactID.json
					json["contactName"] = contactName.json
					json["contactTypeID"] = contactTypeID.json
					if let v = inWatchlist?.json {
						json["inWatchlist"] = v
					}
					json["labelMask"] = labelMask.json
					json["standing"] = standing.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.contactID.hashValue)
					hashCombine(seed: &hash, value: self.contactName.hashValue)
					hashCombine(seed: &hash, value: self.contactTypeID.hashValue)
					hashCombine(seed: &hash, value: self.inWatchlist?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.labelMask.hashValue)
					hashCombine(seed: &hash, value: self.standing.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Corp.ContactList.Contact, rhs: EVE.Corp.ContactList.Contact) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Corp.ContactList.Contact) {
					contactID = other.contactID
					contactName = other.contactName
					contactTypeID = other.contactTypeID
					inWatchlist = other.inWatchlist
					labelMask = other.labelMask
					standing = other.standing
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Corp.ContactList.Contact(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Corp.ContactList.Contact)?.hashValue == hashValue
				}
				
			}
			
			public class Label: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var labelID: Int64 = Int64()
				public var name: String = String()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let labelID = dictionary["labelID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.labelID = labelID
					guard let name = dictionary["name"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.name = name
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["labelID"] = labelID.json
					json["name"] = name.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.labelID.hashValue)
					hashCombine(seed: &hash, value: self.name.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Corp.ContactList.Label, rhs: EVE.Corp.ContactList.Label) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Corp.ContactList.Label) {
					labelID = other.labelID
					name = other.name
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Corp.ContactList.Label(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Corp.ContactList.Label)?.hashValue == hashValue
				}
				
			}
			
			public var allianceContactLabels: [EVE.Corp.ContactList.Label] = []
			public var allianceContactList: [EVE.Corp.ContactList.Contact] = []
			public var contactLabels: [EVE.Corp.ContactList.Label] = []
			public var contactList: [EVE.Corp.ContactList.Contact] = []
			public var corporateContactLabels: [EVE.Corp.ContactList.Label] = []
			public var corporateContactList: [EVE.Corp.ContactList.Contact] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let allianceContactLabels = try dictionary.rowset(name: "allianceContactLabels")?.map ({try EVE.Corp.ContactList.Label(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.allianceContactLabels = allianceContactLabels
				guard let allianceContactList = try dictionary.rowset(name: "allianceContactList")?.map ({try EVE.Corp.ContactList.Contact(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.allianceContactList = allianceContactList
				guard let contactLabels = try dictionary.rowset(name: "contactLabels")?.map ({try EVE.Corp.ContactList.Label(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.contactLabels = contactLabels
				guard let contactList = try dictionary.rowset(name: "contactList")?.map ({try EVE.Corp.ContactList.Contact(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.contactList = contactList
				guard let corporateContactLabels = try dictionary.rowset(name: "corporateContactLabels")?.map ({try EVE.Corp.ContactList.Label(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.corporateContactLabels = corporateContactLabels
				guard let corporateContactList = try dictionary.rowset(name: "corporateContactList")?.map ({try EVE.Corp.ContactList.Contact(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.corporateContactList = corporateContactList
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["allianceContactLabels"] = allianceContactLabels.json
				json["allianceContactList"] = allianceContactList.json
				json["contactLabels"] = contactLabels.json
				json["contactList"] = contactList.json
				json["corporateContactLabels"] = corporateContactLabels.json
				json["corporateContactList"] = corporateContactList.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.allianceContactLabels.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.allianceContactList.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.contactLabels.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.contactList.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.corporateContactLabels.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.corporateContactList.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Corp.ContactList, rhs: EVE.Corp.ContactList) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Corp.ContactList) {
				allianceContactLabels = other.allianceContactLabels.compactMap { EVE.Corp.ContactList.Label($0) }
				allianceContactList = other.allianceContactList.compactMap { EVE.Corp.ContactList.Contact($0) }
				contactLabels = other.contactLabels.compactMap { EVE.Corp.ContactList.Label($0) }
				contactList = other.contactList.compactMap { EVE.Corp.ContactList.Contact($0) }
				corporateContactLabels = other.corporateContactLabels.compactMap { EVE.Corp.ContactList.Label($0) }
				corporateContactList = other.corporateContactList.compactMap { EVE.Corp.ContactList.Contact($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Corp.ContactList(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Corp.ContactList)?.hashValue == hashValue
			}
			
		}
		
		
		public class ContractBids: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Bid: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var amount: Double = Double()
				public var bidID: Int64 = Int64()
				public var bidderID: Int64 = Int64()
				public var contractID: Int64 = Int64()
				public var dateBid: Date = Date()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let amount = dictionary["amount"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.amount = amount
					guard let bidID = dictionary["bidID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.bidID = bidID
					guard let bidderID = dictionary["bidderID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.bidderID = bidderID
					guard let contractID = dictionary["contractID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.contractID = contractID
					guard let dateBid = DateFormatter.eveDateFormatter.date(from: dictionary["dateBid"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.dateBid = dateBid
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["amount"] = amount.json
					json["bidID"] = bidID.json
					json["bidderID"] = bidderID.json
					json["contractID"] = contractID.json
					json["dateBid"] = dateBid.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.amount.hashValue)
					hashCombine(seed: &hash, value: self.bidID.hashValue)
					hashCombine(seed: &hash, value: self.bidderID.hashValue)
					hashCombine(seed: &hash, value: self.contractID.hashValue)
					hashCombine(seed: &hash, value: self.dateBid.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Corp.ContractBids.Bid, rhs: EVE.Corp.ContractBids.Bid) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Corp.ContractBids.Bid) {
					amount = other.amount
					bidID = other.bidID
					bidderID = other.bidderID
					contractID = other.contractID
					dateBid = other.dateBid
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Corp.ContractBids.Bid(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Corp.ContractBids.Bid)?.hashValue == hashValue
				}
				
			}
			
			public var bidList: [EVE.Corp.ContractBids.Bid] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let bidList = try dictionary.rowset(name: "bidList")?.map ({try EVE.Corp.ContractBids.Bid(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.bidList = bidList
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["bidList"] = bidList.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.bidList.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Corp.ContractBids, rhs: EVE.Corp.ContractBids) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Corp.ContractBids) {
				bidList = other.bidList.compactMap { EVE.Corp.ContractBids.Bid($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Corp.ContractBids(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Corp.ContractBids)?.hashValue == hashValue
			}
			
		}
		
		
		public class ContractItems: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Item: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var included: Bool = Bool()
				public var quantity: Int64 = Int64()
				public var rawQuantity: Int = Int()
				public var recordID: Int64 = Int64()
				public var singleton: Bool = Bool()
				public var typeID: Int = Int()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let included = dictionary["included"] as? Bool else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.included = included
					guard let quantity = dictionary["quantity"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.quantity = quantity
					guard let rawQuantity = dictionary["rawQuantity"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.rawQuantity = rawQuantity
					guard let recordID = dictionary["recordID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.recordID = recordID
					guard let singleton = dictionary["singleton"] as? Bool else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.singleton = singleton
					guard let typeID = dictionary["typeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.typeID = typeID
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["included"] = included.json
					json["quantity"] = quantity.json
					json["rawQuantity"] = rawQuantity.json
					json["recordID"] = recordID.json
					json["singleton"] = singleton.json
					json["typeID"] = typeID.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.included.hashValue)
					hashCombine(seed: &hash, value: self.quantity.hashValue)
					hashCombine(seed: &hash, value: self.rawQuantity.hashValue)
					hashCombine(seed: &hash, value: self.recordID.hashValue)
					hashCombine(seed: &hash, value: self.singleton.hashValue)
					hashCombine(seed: &hash, value: self.typeID.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Corp.ContractItems.Item, rhs: EVE.Corp.ContractItems.Item) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Corp.ContractItems.Item) {
					included = other.included
					quantity = other.quantity
					rawQuantity = other.rawQuantity
					recordID = other.recordID
					singleton = other.singleton
					typeID = other.typeID
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Corp.ContractItems.Item(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Corp.ContractItems.Item)?.hashValue == hashValue
				}
				
			}
			
			public var itemList: [EVE.Corp.ContractItems.Item] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let itemList = try dictionary.rowset(name: "itemList")?.map ({try EVE.Corp.ContractItems.Item(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.itemList = itemList
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["itemList"] = itemList.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.itemList.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Corp.ContractItems, rhs: EVE.Corp.ContractItems) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Corp.ContractItems) {
				itemList = other.itemList.compactMap { EVE.Corp.ContractItems.Item($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Corp.ContractItems(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Corp.ContractItems)?.hashValue == hashValue
			}
			
		}
		
		
		public class Contracts: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Contract: NSObject, Codable, NSCopying, JSONCoding {
				
				public enum Availability: String, JSONCoding, Codable {
					case `private` = "Private"
					case `public` = "Public"
					
					public init() {
						self = .`private`
					}
					
					public var json: Any {
						return self.rawValue
					}
					
					public init(json: Any) throws {
						guard let s = json as? String, let v = Availability(rawValue: s) else {throw EVEError.invalidFormat(Swift.type(of: self), json)}
						self = v
					}
					
				}
				
				public enum ContractType: String, JSONCoding, Codable {
					case auction = "Auction"
					case courier = "Courier"
					case itemExchange = "ItemExchange"
					case loan = "Loan"
					
					public init() {
						self = .auction
					}
					
					public var json: Any {
						return self.rawValue
					}
					
					public init(json: Any) throws {
						guard let s = json as? String, let v = ContractType(rawValue: s) else {throw EVEError.invalidFormat(Swift.type(of: self), json)}
						self = v
					}
					
				}
				
				public enum Status: String, JSONCoding, Codable {
					case cancelled = "Cancelled"
					case completed = "Completed"
					case completedByContractor = "CompletedByContractor"
					case completedByIssuer = "CompletedByIssuer"
					case deleted = "Deleted"
					case failed = "Failed"
					case inProgress = "InProgress"
					case outstanding = "Outstanding"
					case rejected = "Rejected"
					case reversed = "Reversed"
					
					public init() {
						self = .cancelled
					}
					
					public var json: Any {
						return self.rawValue
					}
					
					public init(json: Any) throws {
						guard let s = json as? String, let v = Status(rawValue: s) else {throw EVEError.invalidFormat(Swift.type(of: self), json)}
						self = v
					}
					
				}
				
				public var acceptorID: Int64 = Int64()
				public var assigneeID: Int64 = Int64()
				public var availability: EVE.Corp.Contracts.Contract.Availability = EVE.Corp.Contracts.Contract.Availability()
				public var buyout: Double = Double()
				public var collateral: Double = Double()
				public var contractID: Int64 = Int64()
				public var dateAccepted: Date = Date()
				public var dateCompleted: Date = Date()
				public var dateExpired: Date = Date()
				public var dateIssued: Date = Date()
				public var endStationID: Int = Int()
				public var forCorp: Bool = Bool()
				public var issuerCorpID: Int64 = Int64()
				public var issuerID: Int64 = Int64()
				public var numDays: Int = Int()
				public var price: Double = Double()
				public var reward: Double = Double()
				public var startStationID: Int = Int()
				public var status: EVE.Corp.Contracts.Contract.Status = EVE.Corp.Contracts.Contract.Status()
				public var title: String = String()
				public var type: EVE.Corp.Contracts.Contract.ContractType = EVE.Corp.Contracts.Contract.ContractType()
				public var volume: Double = Double()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let acceptorID = dictionary["acceptorID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.acceptorID = acceptorID
					guard let assigneeID = dictionary["assigneeID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.assigneeID = assigneeID
					guard let availability = EVE.Corp.Contracts.Contract.Availability(rawValue: dictionary["availability"] as? String ?? String()) else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.availability = availability
					guard let buyout = dictionary["buyout"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.buyout = buyout
					guard let collateral = dictionary["collateral"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.collateral = collateral
					guard let contractID = dictionary["contractID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.contractID = contractID
					guard let dateAccepted = DateFormatter.eveDateFormatter.date(from: dictionary["dateAccepted"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.dateAccepted = dateAccepted
					guard let dateCompleted = DateFormatter.eveDateFormatter.date(from: dictionary["dateCompleted"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.dateCompleted = dateCompleted
					guard let dateExpired = DateFormatter.eveDateFormatter.date(from: dictionary["dateExpired"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.dateExpired = dateExpired
					guard let dateIssued = DateFormatter.eveDateFormatter.date(from: dictionary["dateIssued"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.dateIssued = dateIssued
					guard let endStationID = dictionary["endStationID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.endStationID = endStationID
					guard let forCorp = dictionary["forCorp"] as? Bool else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.forCorp = forCorp
					guard let issuerCorpID = dictionary["issuerCorpID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.issuerCorpID = issuerCorpID
					guard let issuerID = dictionary["issuerID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.issuerID = issuerID
					guard let numDays = dictionary["numDays"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.numDays = numDays
					guard let price = dictionary["price"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.price = price
					guard let reward = dictionary["reward"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.reward = reward
					guard let startStationID = dictionary["startStationID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.startStationID = startStationID
					guard let status = EVE.Corp.Contracts.Contract.Status(rawValue: dictionary["status"] as? String ?? String()) else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.status = status
					guard let title = dictionary["title"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.title = title
					guard let type = EVE.Corp.Contracts.Contract.ContractType(rawValue: dictionary["type"] as? String ?? String()) else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.type = type
					guard let volume = dictionary["volume"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.volume = volume
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["acceptorID"] = acceptorID.json
					json["assigneeID"] = assigneeID.json
					json["availability"] = availability.json
					json["buyout"] = buyout.json
					json["collateral"] = collateral.json
					json["contractID"] = contractID.json
					json["dateAccepted"] = dateAccepted.json
					json["dateCompleted"] = dateCompleted.json
					json["dateExpired"] = dateExpired.json
					json["dateIssued"] = dateIssued.json
					json["endStationID"] = endStationID.json
					json["forCorp"] = forCorp.json
					json["issuerCorpID"] = issuerCorpID.json
					json["issuerID"] = issuerID.json
					json["numDays"] = numDays.json
					json["price"] = price.json
					json["reward"] = reward.json
					json["startStationID"] = startStationID.json
					json["status"] = status.json
					json["title"] = title.json
					json["type"] = type.json
					json["volume"] = volume.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.acceptorID.hashValue)
					hashCombine(seed: &hash, value: self.assigneeID.hashValue)
					hashCombine(seed: &hash, value: self.availability.hashValue)
					hashCombine(seed: &hash, value: self.buyout.hashValue)
					hashCombine(seed: &hash, value: self.collateral.hashValue)
					hashCombine(seed: &hash, value: self.contractID.hashValue)
					hashCombine(seed: &hash, value: self.dateAccepted.hashValue)
					hashCombine(seed: &hash, value: self.dateCompleted.hashValue)
					hashCombine(seed: &hash, value: self.dateExpired.hashValue)
					hashCombine(seed: &hash, value: self.dateIssued.hashValue)
					hashCombine(seed: &hash, value: self.endStationID.hashValue)
					hashCombine(seed: &hash, value: self.forCorp.hashValue)
					hashCombine(seed: &hash, value: self.issuerCorpID.hashValue)
					hashCombine(seed: &hash, value: self.issuerID.hashValue)
					hashCombine(seed: &hash, value: self.numDays.hashValue)
					hashCombine(seed: &hash, value: self.price.hashValue)
					hashCombine(seed: &hash, value: self.reward.hashValue)
					hashCombine(seed: &hash, value: self.startStationID.hashValue)
					hashCombine(seed: &hash, value: self.status.hashValue)
					hashCombine(seed: &hash, value: self.title.hashValue)
					hashCombine(seed: &hash, value: self.type.hashValue)
					hashCombine(seed: &hash, value: self.volume.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Corp.Contracts.Contract, rhs: EVE.Corp.Contracts.Contract) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Corp.Contracts.Contract) {
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
					endStationID = other.endStationID
					forCorp = other.forCorp
					issuerCorpID = other.issuerCorpID
					issuerID = other.issuerID
					numDays = other.numDays
					price = other.price
					reward = other.reward
					startStationID = other.startStationID
					status = other.status
					title = other.title
					type = other.type
					volume = other.volume
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Corp.Contracts.Contract(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Corp.Contracts.Contract)?.hashValue == hashValue
				}
				
			}
			
			public var contractList: [EVE.Corp.Contracts.Contract] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let contractList = try dictionary.rowset(name: "contractList")?.map ({try EVE.Corp.Contracts.Contract(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.contractList = contractList
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["contractList"] = contractList.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.contractList.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Corp.Contracts, rhs: EVE.Corp.Contracts) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Corp.Contracts) {
				contractList = other.contractList.compactMap { EVE.Corp.Contracts.Contract($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Corp.Contracts(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Corp.Contracts)?.hashValue == hashValue
			}
			
		}
		
		
		public class FacWarStats: NSObject, Codable, NSCopying, JSONCoding {
			
			
			public var currentRank: Int = Int()
			public var enlisted: Date = Date()
			public var factionID: Int = Int()
			public var factionName: String = String()
			public var highestRank: Int = Int()
			public var killsLastWeek: Int = Int()
			public var killsTotal: Int = Int()
			public var killsYesterday: Int = Int()
			public var victoryPointsLastWeek: Int = Int()
			public var victoryPointsTotal: Int = Int()
			public var victoryPointsYesterday: Int = Int()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let currentRank = dictionary["currentRank"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.currentRank = currentRank
				guard let enlisted = DateFormatter.eveDateFormatter.date(from: dictionary["enlisted"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.enlisted = enlisted
				guard let factionID = dictionary["factionID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.factionID = factionID
				guard let factionName = dictionary["factionName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.factionName = factionName
				guard let highestRank = dictionary["highestRank"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.highestRank = highestRank
				guard let killsLastWeek = dictionary["killsLastWeek"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.killsLastWeek = killsLastWeek
				guard let killsTotal = dictionary["killsTotal"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.killsTotal = killsTotal
				guard let killsYesterday = dictionary["killsYesterday"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.killsYesterday = killsYesterday
				guard let victoryPointsLastWeek = dictionary["victoryPointsLastWeek"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.victoryPointsLastWeek = victoryPointsLastWeek
				guard let victoryPointsTotal = dictionary["victoryPointsTotal"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.victoryPointsTotal = victoryPointsTotal
				guard let victoryPointsYesterday = dictionary["victoryPointsYesterday"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.victoryPointsYesterday = victoryPointsYesterday
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["currentRank"] = currentRank.json
				json["enlisted"] = enlisted.json
				json["factionID"] = factionID.json
				json["factionName"] = factionName.json
				json["highestRank"] = highestRank.json
				json["killsLastWeek"] = killsLastWeek.json
				json["killsTotal"] = killsTotal.json
				json["killsYesterday"] = killsYesterday.json
				json["victoryPointsLastWeek"] = victoryPointsLastWeek.json
				json["victoryPointsTotal"] = victoryPointsTotal.json
				json["victoryPointsYesterday"] = victoryPointsYesterday.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.currentRank.hashValue)
				hashCombine(seed: &hash, value: self.enlisted.hashValue)
				hashCombine(seed: &hash, value: self.factionID.hashValue)
				hashCombine(seed: &hash, value: self.factionName.hashValue)
				hashCombine(seed: &hash, value: self.highestRank.hashValue)
				hashCombine(seed: &hash, value: self.killsLastWeek.hashValue)
				hashCombine(seed: &hash, value: self.killsTotal.hashValue)
				hashCombine(seed: &hash, value: self.killsYesterday.hashValue)
				hashCombine(seed: &hash, value: self.victoryPointsLastWeek.hashValue)
				hashCombine(seed: &hash, value: self.victoryPointsTotal.hashValue)
				hashCombine(seed: &hash, value: self.victoryPointsYesterday.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Corp.FacWarStats, rhs: EVE.Corp.FacWarStats) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Corp.FacWarStats) {
				currentRank = other.currentRank
				enlisted = other.enlisted
				factionID = other.factionID
				factionName = other.factionName
				highestRank = other.highestRank
				killsLastWeek = other.killsLastWeek
				killsTotal = other.killsTotal
				killsYesterday = other.killsYesterday
				victoryPointsLastWeek = other.victoryPointsLastWeek
				victoryPointsTotal = other.victoryPointsTotal
				victoryPointsYesterday = other.victoryPointsYesterday
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Corp.FacWarStats(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Corp.FacWarStats)?.hashValue == hashValue
			}
			
		}
		
		
		public class IndustryJobs: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Job: NSObject, Codable, NSCopying, JSONCoding {
				
				public enum Status: Int, JSONCoding, Codable {
					case active = 1
					case cancelled = 102
					case delivered = 101
					case paused = 2
					case ready = 3
					case reverted = 103
					
					public init() {
						self = .active
					}
					
					public var json: Any {
						return self.rawValue
					}
					
					public init(json: Any) throws {
						guard let s = json as? Int, let v = Status(rawValue: s) else {throw EVEError.invalidFormat(Swift.type(of: self), json)}
						self = v
					}
					
				}
				
				public var activityID: Int = Int()
				public var blueprintID: Int64 = Int64()
				public var blueprintLocationID: Int64 = Int64()
				public var blueprintTypeID: Int = Int()
				public var blueprintTypeName: String = String()
				public var completedCharacterID: Int64 = Int64()
				public var completedDate: Date = Date()
				public var cost: Double = Double()
				public var endDate: Date = Date()
				public var facilityID: Int = Int()
				public var installerID: Int64 = Int64()
				public var installerName: String = String()
				public var jobID: Int64 = Int64()
				public var licensedRuns: Int = Int()
				public var outputLocationID: Int64 = Int64()
				public var pauseDate: Date = Date()
				public var probability: Float = Float()
				public var productTypeID: Int = Int()
				public var productTypeName: String = String()
				public var runs: Int = Int()
				public var solarSystemID: Int = Int()
				public var solarSystemName: String = String()
				public var startDate: Date = Date()
				public var stationID: Int64 = Int64()
				public var status: EVE.Corp.IndustryJobs.Job.Status = EVE.Corp.IndustryJobs.Job.Status()
				public var successfulRuns: Int = Int()
				public var teamID: Int = Int()
				public var timeInSeconds: Int = Int()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let activityID = dictionary["activityID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.activityID = activityID
					guard let blueprintID = dictionary["blueprintID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.blueprintID = blueprintID
					guard let blueprintLocationID = dictionary["blueprintLocationID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.blueprintLocationID = blueprintLocationID
					guard let blueprintTypeID = dictionary["blueprintTypeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.blueprintTypeID = blueprintTypeID
					guard let blueprintTypeName = dictionary["blueprintTypeName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.blueprintTypeName = blueprintTypeName
					guard let completedCharacterID = dictionary["completedCharacterID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.completedCharacterID = completedCharacterID
					guard let completedDate = DateFormatter.eveDateFormatter.date(from: dictionary["completedDate"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.completedDate = completedDate
					guard let cost = dictionary["cost"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.cost = cost
					guard let endDate = DateFormatter.eveDateFormatter.date(from: dictionary["endDate"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.endDate = endDate
					guard let facilityID = dictionary["facilityID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.facilityID = facilityID
					guard let installerID = dictionary["installerID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.installerID = installerID
					guard let installerName = dictionary["installerName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.installerName = installerName
					guard let jobID = dictionary["jobID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.jobID = jobID
					guard let licensedRuns = dictionary["licensedRuns"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.licensedRuns = licensedRuns
					guard let outputLocationID = dictionary["outputLocationID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.outputLocationID = outputLocationID
					guard let pauseDate = DateFormatter.eveDateFormatter.date(from: dictionary["pauseDate"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.pauseDate = pauseDate
					guard let probability = dictionary["probability"] as? Float else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.probability = probability
					guard let productTypeID = dictionary["productTypeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.productTypeID = productTypeID
					guard let productTypeName = dictionary["productTypeName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.productTypeName = productTypeName
					guard let runs = dictionary["runs"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.runs = runs
					guard let solarSystemID = dictionary["solarSystemID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.solarSystemID = solarSystemID
					guard let solarSystemName = dictionary["solarSystemName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.solarSystemName = solarSystemName
					guard let startDate = DateFormatter.eveDateFormatter.date(from: dictionary["startDate"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.startDate = startDate
					guard let stationID = dictionary["stationID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.stationID = stationID
					guard let status = EVE.Corp.IndustryJobs.Job.Status(rawValue: dictionary["status"] as? Int ?? Int()) else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.status = status
					guard let successfulRuns = dictionary["successfulRuns"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.successfulRuns = successfulRuns
					guard let teamID = dictionary["teamID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.teamID = teamID
					guard let timeInSeconds = dictionary["timeInSeconds"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.timeInSeconds = timeInSeconds
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["activityID"] = activityID.json
					json["blueprintID"] = blueprintID.json
					json["blueprintLocationID"] = blueprintLocationID.json
					json["blueprintTypeID"] = blueprintTypeID.json
					json["blueprintTypeName"] = blueprintTypeName.json
					json["completedCharacterID"] = completedCharacterID.json
					json["completedDate"] = completedDate.json
					json["cost"] = cost.json
					json["endDate"] = endDate.json
					json["facilityID"] = facilityID.json
					json["installerID"] = installerID.json
					json["installerName"] = installerName.json
					json["jobID"] = jobID.json
					json["licensedRuns"] = licensedRuns.json
					json["outputLocationID"] = outputLocationID.json
					json["pauseDate"] = pauseDate.json
					json["probability"] = probability.json
					json["productTypeID"] = productTypeID.json
					json["productTypeName"] = productTypeName.json
					json["runs"] = runs.json
					json["solarSystemID"] = solarSystemID.json
					json["solarSystemName"] = solarSystemName.json
					json["startDate"] = startDate.json
					json["stationID"] = stationID.json
					json["status"] = status.json
					json["successfulRuns"] = successfulRuns.json
					json["teamID"] = teamID.json
					json["timeInSeconds"] = timeInSeconds.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.activityID.hashValue)
					hashCombine(seed: &hash, value: self.blueprintID.hashValue)
					hashCombine(seed: &hash, value: self.blueprintLocationID.hashValue)
					hashCombine(seed: &hash, value: self.blueprintTypeID.hashValue)
					hashCombine(seed: &hash, value: self.blueprintTypeName.hashValue)
					hashCombine(seed: &hash, value: self.completedCharacterID.hashValue)
					hashCombine(seed: &hash, value: self.completedDate.hashValue)
					hashCombine(seed: &hash, value: self.cost.hashValue)
					hashCombine(seed: &hash, value: self.endDate.hashValue)
					hashCombine(seed: &hash, value: self.facilityID.hashValue)
					hashCombine(seed: &hash, value: self.installerID.hashValue)
					hashCombine(seed: &hash, value: self.installerName.hashValue)
					hashCombine(seed: &hash, value: self.jobID.hashValue)
					hashCombine(seed: &hash, value: self.licensedRuns.hashValue)
					hashCombine(seed: &hash, value: self.outputLocationID.hashValue)
					hashCombine(seed: &hash, value: self.pauseDate.hashValue)
					hashCombine(seed: &hash, value: self.probability.hashValue)
					hashCombine(seed: &hash, value: self.productTypeID.hashValue)
					hashCombine(seed: &hash, value: self.productTypeName.hashValue)
					hashCombine(seed: &hash, value: self.runs.hashValue)
					hashCombine(seed: &hash, value: self.solarSystemID.hashValue)
					hashCombine(seed: &hash, value: self.solarSystemName.hashValue)
					hashCombine(seed: &hash, value: self.startDate.hashValue)
					hashCombine(seed: &hash, value: self.stationID.hashValue)
					hashCombine(seed: &hash, value: self.status.hashValue)
					hashCombine(seed: &hash, value: self.successfulRuns.hashValue)
					hashCombine(seed: &hash, value: self.teamID.hashValue)
					hashCombine(seed: &hash, value: self.timeInSeconds.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Corp.IndustryJobs.Job, rhs: EVE.Corp.IndustryJobs.Job) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Corp.IndustryJobs.Job) {
					activityID = other.activityID
					blueprintID = other.blueprintID
					blueprintLocationID = other.blueprintLocationID
					blueprintTypeID = other.blueprintTypeID
					blueprintTypeName = other.blueprintTypeName
					completedCharacterID = other.completedCharacterID
					completedDate = other.completedDate
					cost = other.cost
					endDate = other.endDate
					facilityID = other.facilityID
					installerID = other.installerID
					installerName = other.installerName
					jobID = other.jobID
					licensedRuns = other.licensedRuns
					outputLocationID = other.outputLocationID
					pauseDate = other.pauseDate
					probability = other.probability
					productTypeID = other.productTypeID
					productTypeName = other.productTypeName
					runs = other.runs
					solarSystemID = other.solarSystemID
					solarSystemName = other.solarSystemName
					startDate = other.startDate
					stationID = other.stationID
					status = other.status
					successfulRuns = other.successfulRuns
					teamID = other.teamID
					timeInSeconds = other.timeInSeconds
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Corp.IndustryJobs.Job(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Corp.IndustryJobs.Job)?.hashValue == hashValue
				}
				
			}
			
			public var jobs: [EVE.Corp.IndustryJobs.Job] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let jobs = try dictionary.rowset(name: "jobs")?.map ({try EVE.Corp.IndustryJobs.Job(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.jobs = jobs
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["jobs"] = jobs.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.jobs.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Corp.IndustryJobs, rhs: EVE.Corp.IndustryJobs) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Corp.IndustryJobs) {
				jobs = other.jobs.compactMap { EVE.Corp.IndustryJobs.Job($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Corp.IndustryJobs(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Corp.IndustryJobs)?.hashValue == hashValue
			}
			
		}
		
		
		public class KillMails: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Kill: NSObject, Codable, NSCopying, JSONCoding {
				
				public class Attacker: NSObject, Codable, NSCopying, JSONCoding {
					
					
					public var allianceID: Int64? = nil
					public var allianceName: String? = nil
					public var characterID: Int64 = Int64()
					public var characterName: String = String()
					public var corporationID: Int64 = Int64()
					public var corporationName: String = String()
					public var damageDone: Int64 = Int64()
					public var factionID: Int? = nil
					public var factionName: String? = nil
					public var finalBlow: Bool = Bool()
					public var securityStatus: Float = Float()
					public var shipTypeID: Int = Int()
					public var weaponTypeID: Int = Int()
					
					public static var supportsSecureCoding: Bool {
						return true
					}
					
					public required init(json: Any) throws {
						guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
						
						allianceID = dictionary["allianceID"] as? Int64
						allianceName = dictionary["allianceName"] as? String
						guard let characterID = dictionary["characterID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.characterID = characterID
						guard let characterName = dictionary["characterName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.characterName = characterName
						guard let corporationID = dictionary["corporationID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.corporationID = corporationID
						guard let corporationName = dictionary["corporationName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.corporationName = corporationName
						guard let damageDone = dictionary["damageDone"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.damageDone = damageDone
						factionID = dictionary["factionID"] as? Int
						factionName = dictionary["factionName"] as? String
						guard let finalBlow = dictionary["finalBlow"] as? Bool else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.finalBlow = finalBlow
						guard let securityStatus = dictionary["securityStatus"] as? Float else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.securityStatus = securityStatus
						guard let shipTypeID = dictionary["shipTypeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.shipTypeID = shipTypeID
						guard let weaponTypeID = dictionary["weaponTypeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.weaponTypeID = weaponTypeID
						
						super.init()
					}
					
					override public init() {
						super.init()
					}
					/*
					public required init?(coder aDecoder: NSCoder) {
						{decodings}
						
						super.init()
					}
					
					public func encode(with aCoder: NSCoder) {
						{encodings}
					}
					*/
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
						json["damageDone"] = damageDone.json
						if let v = factionID?.json {
							json["factionID"] = v
						}
						if let v = factionName?.json {
							json["factionName"] = v
						}
						json["finalBlow"] = finalBlow.json
						json["securityStatus"] = securityStatus.json
						json["shipTypeID"] = shipTypeID.json
						json["weaponTypeID"] = weaponTypeID.json
						return json
					}
					
					private lazy var _hashValue: Int = {
						var hash: Int = 0
						hashCombine(seed: &hash, value: self.allianceID?.hashValue ?? 0)
						hashCombine(seed: &hash, value: self.allianceName?.hashValue ?? 0)
						hashCombine(seed: &hash, value: self.characterID.hashValue)
						hashCombine(seed: &hash, value: self.characterName.hashValue)
						hashCombine(seed: &hash, value: self.corporationID.hashValue)
						hashCombine(seed: &hash, value: self.corporationName.hashValue)
						hashCombine(seed: &hash, value: self.damageDone.hashValue)
						hashCombine(seed: &hash, value: self.factionID?.hashValue ?? 0)
						hashCombine(seed: &hash, value: self.factionName?.hashValue ?? 0)
						hashCombine(seed: &hash, value: self.finalBlow.hashValue)
						hashCombine(seed: &hash, value: self.securityStatus.hashValue)
						hashCombine(seed: &hash, value: self.shipTypeID.hashValue)
						hashCombine(seed: &hash, value: self.weaponTypeID.hashValue)
						return hash
					}()
					
					override public var hashValue: Int {
						return _hashValue
					}
					
					public static func ==(lhs: EVE.Corp.KillMails.Kill.Attacker, rhs: EVE.Corp.KillMails.Kill.Attacker) -> Bool {
						return lhs.hashValue == rhs.hashValue
					}
					
					init(_ other: EVE.Corp.KillMails.Kill.Attacker) {
						allianceID = other.allianceID
						allianceName = other.allianceName
						characterID = other.characterID
						characterName = other.characterName
						corporationID = other.corporationID
						corporationName = other.corporationName
						damageDone = other.damageDone
						factionID = other.factionID
						factionName = other.factionName
						finalBlow = other.finalBlow
						securityStatus = other.securityStatus
						shipTypeID = other.shipTypeID
						weaponTypeID = other.weaponTypeID
					}
					
					public func copy(with zone: NSZone? = nil) -> Any {
						return EVE.Corp.KillMails.Kill.Attacker(self)
					}
					
					
					public override func isEqual(_ object: Any?) -> Bool {
						return (object as? EVE.Corp.KillMails.Kill.Attacker)?.hashValue == hashValue
					}
					
				}
				
				public class Item: NSObject, Codable, NSCopying, JSONCoding {
					
					
					public var flag: Int = Int()
					public var qtyDestroyed: Int = Int()
					public var qtyDropped: Int = Int()
					public var singleton: Bool = Bool()
					public var typeID: Int = Int()
					
					public static var supportsSecureCoding: Bool {
						return true
					}
					
					public required init(json: Any) throws {
						guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
						
						guard let flag = dictionary["flag"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.flag = flag
						guard let qtyDestroyed = dictionary["qtyDestroyed"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.qtyDestroyed = qtyDestroyed
						guard let qtyDropped = dictionary["qtyDropped"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.qtyDropped = qtyDropped
						guard let singleton = dictionary["singleton"] as? Bool else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.singleton = singleton
						guard let typeID = dictionary["typeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.typeID = typeID
						
						super.init()
					}
					
					override public init() {
						super.init()
					}
					/*
					public required init?(coder aDecoder: NSCoder) {
						{decodings}
						
						super.init()
					}
					
					public func encode(with aCoder: NSCoder) {
						{encodings}
					}
					*/
					public var json: Any {
						var json = [String: Any]()
						json["flag"] = flag.json
						json["qtyDestroyed"] = qtyDestroyed.json
						json["qtyDropped"] = qtyDropped.json
						json["singleton"] = singleton.json
						json["typeID"] = typeID.json
						return json
					}
					
					private lazy var _hashValue: Int = {
						var hash: Int = 0
						hashCombine(seed: &hash, value: self.flag.hashValue)
						hashCombine(seed: &hash, value: self.qtyDestroyed.hashValue)
						hashCombine(seed: &hash, value: self.qtyDropped.hashValue)
						hashCombine(seed: &hash, value: self.singleton.hashValue)
						hashCombine(seed: &hash, value: self.typeID.hashValue)
						return hash
					}()
					
					override public var hashValue: Int {
						return _hashValue
					}
					
					public static func ==(lhs: EVE.Corp.KillMails.Kill.Item, rhs: EVE.Corp.KillMails.Kill.Item) -> Bool {
						return lhs.hashValue == rhs.hashValue
					}
					
					init(_ other: EVE.Corp.KillMails.Kill.Item) {
						flag = other.flag
						qtyDestroyed = other.qtyDestroyed
						qtyDropped = other.qtyDropped
						singleton = other.singleton
						typeID = other.typeID
					}
					
					public func copy(with zone: NSZone? = nil) -> Any {
						return EVE.Corp.KillMails.Kill.Item(self)
					}
					
					
					public override func isEqual(_ object: Any?) -> Bool {
						return (object as? EVE.Corp.KillMails.Kill.Item)?.hashValue == hashValue
					}
					
				}
				
				public class Victim: NSObject, Codable, NSCopying, JSONCoding {
					
					
					public var allianceID: Int64? = nil
					public var allianceName: String? = nil
					public var characterID: Int64 = Int64()
					public var characterName: String = String()
					public var corporationID: Int64 = Int64()
					public var corporationName: String = String()
					public var damageTaken: Int64 = Int64()
					public var factionID: Int? = nil
					public var factionName: String? = nil
					public var shipTypeID: Int = Int()
					public var x: Double = Double()
					public var y: Double = Double()
					public var z: Double = Double()
					
					public static var supportsSecureCoding: Bool {
						return true
					}
					
					public required init(json: Any) throws {
						guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
						
						allianceID = dictionary["allianceID"] as? Int64
						allianceName = dictionary["allianceName"] as? String
						guard let characterID = dictionary["characterID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.characterID = characterID
						guard let characterName = dictionary["characterName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.characterName = characterName
						guard let corporationID = dictionary["corporationID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.corporationID = corporationID
						guard let corporationName = dictionary["corporationName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.corporationName = corporationName
						guard let damageTaken = dictionary["damageTaken"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.damageTaken = damageTaken
						factionID = dictionary["factionID"] as? Int
						factionName = dictionary["factionName"] as? String
						guard let shipTypeID = dictionary["shipTypeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.shipTypeID = shipTypeID
						guard let x = dictionary["x"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.x = x
						guard let y = dictionary["y"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.y = y
						guard let z = dictionary["z"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.z = z
						
						super.init()
					}
					
					override public init() {
						super.init()
					}
					/*
					public required init?(coder aDecoder: NSCoder) {
						{decodings}
						
						super.init()
					}
					
					public func encode(with aCoder: NSCoder) {
						{encodings}
					}
					*/
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
						json["damageTaken"] = damageTaken.json
						if let v = factionID?.json {
							json["factionID"] = v
						}
						if let v = factionName?.json {
							json["factionName"] = v
						}
						json["shipTypeID"] = shipTypeID.json
						json["x"] = x.json
						json["y"] = y.json
						json["z"] = z.json
						return json
					}
					
					private lazy var _hashValue: Int = {
						var hash: Int = 0
						hashCombine(seed: &hash, value: self.allianceID?.hashValue ?? 0)
						hashCombine(seed: &hash, value: self.allianceName?.hashValue ?? 0)
						hashCombine(seed: &hash, value: self.characterID.hashValue)
						hashCombine(seed: &hash, value: self.characterName.hashValue)
						hashCombine(seed: &hash, value: self.corporationID.hashValue)
						hashCombine(seed: &hash, value: self.corporationName.hashValue)
						hashCombine(seed: &hash, value: self.damageTaken.hashValue)
						hashCombine(seed: &hash, value: self.factionID?.hashValue ?? 0)
						hashCombine(seed: &hash, value: self.factionName?.hashValue ?? 0)
						hashCombine(seed: &hash, value: self.shipTypeID.hashValue)
						hashCombine(seed: &hash, value: self.x.hashValue)
						hashCombine(seed: &hash, value: self.y.hashValue)
						hashCombine(seed: &hash, value: self.z.hashValue)
						return hash
					}()
					
					override public var hashValue: Int {
						return _hashValue
					}
					
					public static func ==(lhs: EVE.Corp.KillMails.Kill.Victim, rhs: EVE.Corp.KillMails.Kill.Victim) -> Bool {
						return lhs.hashValue == rhs.hashValue
					}
					
					init(_ other: EVE.Corp.KillMails.Kill.Victim) {
						allianceID = other.allianceID
						allianceName = other.allianceName
						characterID = other.characterID
						characterName = other.characterName
						corporationID = other.corporationID
						corporationName = other.corporationName
						damageTaken = other.damageTaken
						factionID = other.factionID
						factionName = other.factionName
						shipTypeID = other.shipTypeID
						x = other.x
						y = other.y
						z = other.z
					}
					
					public func copy(with zone: NSZone? = nil) -> Any {
						return EVE.Corp.KillMails.Kill.Victim(self)
					}
					
					
					public override func isEqual(_ object: Any?) -> Bool {
						return (object as? EVE.Corp.KillMails.Kill.Victim)?.hashValue == hashValue
					}
					
				}
				
				public var attackers: [EVE.Corp.KillMails.Kill.Attacker] = []
				public var items: [EVE.Corp.KillMails.Kill.Item] = []
				public var killID: Int64 = Int64()
				public var killTime: Date = Date()
				public var moonID: Int = Int()
				public var solarSystemID: Int = Int()
				public var victim: EVE.Corp.KillMails.Kill.Victim = EVE.Corp.KillMails.Kill.Victim()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let attackers = try dictionary.rowset(name: "attackers")?.map ({try EVE.Corp.KillMails.Kill.Attacker(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.attackers = attackers
					guard let items = try dictionary.rowset(name: "items")?.map ({try EVE.Corp.KillMails.Kill.Item(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.items = items
					guard let killID = dictionary["killID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.killID = killID
					guard let killTime = DateFormatter.eveDateFormatter.date(from: dictionary["killTime"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.killTime = killTime
					guard let moonID = dictionary["moonID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.moonID = moonID
					guard let solarSystemID = dictionary["solarSystemID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.solarSystemID = solarSystemID
					victim = try EVE.Corp.KillMails.Kill.Victim(json: dictionary["victim"] as? [String: Any] ?? [:])
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["attackers"] = attackers.json
					json["items"] = items.json
					json["killID"] = killID.json
					json["killTime"] = killTime.json
					json["moonID"] = moonID.json
					json["solarSystemID"] = solarSystemID.json
					json["victim"] = victim.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					self.attackers.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					self.items.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					hashCombine(seed: &hash, value: self.killID.hashValue)
					hashCombine(seed: &hash, value: self.killTime.hashValue)
					hashCombine(seed: &hash, value: self.moonID.hashValue)
					hashCombine(seed: &hash, value: self.solarSystemID.hashValue)
					hashCombine(seed: &hash, value: self.victim.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Corp.KillMails.Kill, rhs: EVE.Corp.KillMails.Kill) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Corp.KillMails.Kill) {
					attackers = other.attackers.compactMap { EVE.Corp.KillMails.Kill.Attacker($0) }
					items = other.items.compactMap { EVE.Corp.KillMails.Kill.Item($0) }
					killID = other.killID
					killTime = other.killTime
					moonID = other.moonID
					solarSystemID = other.solarSystemID
					victim = EVE.Corp.KillMails.Kill.Victim(other.victim)
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Corp.KillMails.Kill(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Corp.KillMails.Kill)?.hashValue == hashValue
				}
				
			}
			
			public var kills: [EVE.Corp.KillMails.Kill] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let kills = try dictionary.rowset(name: "kills")?.map ({try EVE.Corp.KillMails.Kill(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.kills = kills
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["kills"] = kills.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.kills.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Corp.KillMails, rhs: EVE.Corp.KillMails) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Corp.KillMails) {
				kills = other.kills.compactMap { EVE.Corp.KillMails.Kill($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Corp.KillMails(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Corp.KillMails)?.hashValue == hashValue
			}
			
		}
		
		
		public class Locations: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Location: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var itemID: Int64 = Int64()
				public var itemName: String = String()
				public var x: Double = Double()
				public var y: Double = Double()
				public var z: Double = Double()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let itemID = dictionary["itemID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.itemID = itemID
					guard let itemName = dictionary["itemName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.itemName = itemName
					guard let x = dictionary["x"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.x = x
					guard let y = dictionary["y"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.y = y
					guard let z = dictionary["z"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.z = z
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["itemID"] = itemID.json
					json["itemName"] = itemName.json
					json["x"] = x.json
					json["y"] = y.json
					json["z"] = z.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.itemID.hashValue)
					hashCombine(seed: &hash, value: self.itemName.hashValue)
					hashCombine(seed: &hash, value: self.x.hashValue)
					hashCombine(seed: &hash, value: self.y.hashValue)
					hashCombine(seed: &hash, value: self.z.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Corp.Locations.Location, rhs: EVE.Corp.Locations.Location) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Corp.Locations.Location) {
					itemID = other.itemID
					itemName = other.itemName
					x = other.x
					y = other.y
					z = other.z
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Corp.Locations.Location(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Corp.Locations.Location)?.hashValue == hashValue
				}
				
			}
			
			public var locations: [EVE.Corp.Locations.Location] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let locations = try dictionary.rowset(name: "locations")?.map ({try EVE.Corp.Locations.Location(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.locations = locations
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["locations"] = locations.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.locations.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Corp.Locations, rhs: EVE.Corp.Locations) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Corp.Locations) {
				locations = other.locations.compactMap { EVE.Corp.Locations.Location($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Corp.Locations(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Corp.Locations)?.hashValue == hashValue
			}
			
		}
		
		
		public class MarketOrders: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Order: NSObject, Codable, NSCopying, JSONCoding {
				
				public enum State: Int, JSONCoding, Codable {
					case cancelled = 3
					case closed = 1
					case deleted = 5
					case expired = 2
					case open = 0
					case pending = 4
					
					public init() {
						self = .cancelled
					}
					
					public var json: Any {
						return self.rawValue
					}
					
					public init(json: Any) throws {
						guard let s = json as? Int, let v = State(rawValue: s) else {throw EVEError.invalidFormat(Swift.type(of: self), json)}
						self = v
					}
					
				}
				
				public var accountKey: Int = Int()
				public var bid: Bool = Bool()
				public var characterID: Int64 = Int64()
				public var duration: Int = Int()
				public var escrow: Double = Double()
				public var issued: Date = Date()
				public var minVolume: Int64 = Int64()
				public var orderID: Int64 = Int64()
				public var orderState: EVE.Corp.MarketOrders.Order.State = EVE.Corp.MarketOrders.Order.State()
				public var price: Double = Double()
				public var range: Int = Int()
				public var stationID: Int = Int()
				public var typeID: Int = Int()
				public var volEntered: Int64 = Int64()
				public var volRemaining: Int64 = Int64()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let accountKey = dictionary["accountKey"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.accountKey = accountKey
					guard let bid = dictionary["bid"] as? Bool else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.bid = bid
					guard let characterID = dictionary["charID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.characterID = characterID
					guard let duration = dictionary["duration"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.duration = duration
					guard let escrow = dictionary["escrow"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.escrow = escrow
					guard let issued = DateFormatter.eveDateFormatter.date(from: dictionary["issued"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.issued = issued
					guard let minVolume = dictionary["minVolume"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.minVolume = minVolume
					guard let orderID = dictionary["orderID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.orderID = orderID
					guard let orderState = EVE.Corp.MarketOrders.Order.State(rawValue: dictionary["orderState"] as? Int ?? Int()) else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.orderState = orderState
					guard let price = dictionary["price"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.price = price
					guard let range = dictionary["range"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.range = range
					guard let stationID = dictionary["stationID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.stationID = stationID
					guard let typeID = dictionary["typeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.typeID = typeID
					guard let volEntered = dictionary["volEntered"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.volEntered = volEntered
					guard let volRemaining = dictionary["volRemaining"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.volRemaining = volRemaining
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["accountKey"] = accountKey.json
					json["bid"] = bid.json
					json["characterID"] = characterID.json
					json["duration"] = duration.json
					json["escrow"] = escrow.json
					json["issued"] = issued.json
					json["minVolume"] = minVolume.json
					json["orderID"] = orderID.json
					json["orderState"] = orderState.json
					json["price"] = price.json
					json["range"] = range.json
					json["stationID"] = stationID.json
					json["typeID"] = typeID.json
					json["volEntered"] = volEntered.json
					json["volRemaining"] = volRemaining.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.accountKey.hashValue)
					hashCombine(seed: &hash, value: self.bid.hashValue)
					hashCombine(seed: &hash, value: self.characterID.hashValue)
					hashCombine(seed: &hash, value: self.duration.hashValue)
					hashCombine(seed: &hash, value: self.escrow.hashValue)
					hashCombine(seed: &hash, value: self.issued.hashValue)
					hashCombine(seed: &hash, value: self.minVolume.hashValue)
					hashCombine(seed: &hash, value: self.orderID.hashValue)
					hashCombine(seed: &hash, value: self.orderState.hashValue)
					hashCombine(seed: &hash, value: self.price.hashValue)
					hashCombine(seed: &hash, value: self.range.hashValue)
					hashCombine(seed: &hash, value: self.stationID.hashValue)
					hashCombine(seed: &hash, value: self.typeID.hashValue)
					hashCombine(seed: &hash, value: self.volEntered.hashValue)
					hashCombine(seed: &hash, value: self.volRemaining.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Corp.MarketOrders.Order, rhs: EVE.Corp.MarketOrders.Order) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Corp.MarketOrders.Order) {
					accountKey = other.accountKey
					bid = other.bid
					characterID = other.characterID
					duration = other.duration
					escrow = other.escrow
					issued = other.issued
					minVolume = other.minVolume
					orderID = other.orderID
					orderState = other.orderState
					price = other.price
					range = other.range
					stationID = other.stationID
					typeID = other.typeID
					volEntered = other.volEntered
					volRemaining = other.volRemaining
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Corp.MarketOrders.Order(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Corp.MarketOrders.Order)?.hashValue == hashValue
				}
				
			}
			
			public var orders: [EVE.Corp.MarketOrders.Order] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let orders = try dictionary.rowset(name: "orders")?.map ({try EVE.Corp.MarketOrders.Order(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.orders = orders
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["orders"] = orders.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.orders.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Corp.MarketOrders, rhs: EVE.Corp.MarketOrders) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Corp.MarketOrders) {
				orders = other.orders.compactMap { EVE.Corp.MarketOrders.Order($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Corp.MarketOrders(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Corp.MarketOrders)?.hashValue == hashValue
			}
			
		}
		
		
		public class Medals: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Medal: NSObject, Codable, NSCopying, JSONCoding {
				
				public enum Status: String, JSONCoding, Codable {
					case `private` = "private"
					case `public` = "public"
					
					public init() {
						self = .`private`
					}
					
					public var json: Any {
						return self.rawValue
					}
					
					public init(json: Any) throws {
						guard let s = json as? String, let v = Status(rawValue: s) else {throw EVEError.invalidFormat(Swift.type(of: self), json)}
						self = v
					}
					
				}
				
				public var corporationID: Int64? = nil
				public var issued: Date = Date()
				public var issuerID: Int64 = Int64()
				public var medalDescription: String? = nil
				public var medalID: Int = Int()
				public var reason: String = String()
				public var status: EVE.Corp.Medals.Medal.Status = EVE.Corp.Medals.Medal.Status()
				public var title: String? = nil
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					corporationID = dictionary["corporationID"] as? Int64
					guard let issued = DateFormatter.eveDateFormatter.date(from: dictionary["issued"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.issued = issued
					guard let issuerID = dictionary["issuerID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.issuerID = issuerID
					medalDescription = dictionary["description"] as? String
					guard let medalID = dictionary["medalID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.medalID = medalID
					guard let reason = dictionary["reason"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.reason = reason
					guard let status = EVE.Corp.Medals.Medal.Status(rawValue: dictionary["status"] as? String ?? String()) else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.status = status
					title = dictionary["title"] as? String
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					if let v = corporationID?.json {
						json["corporationID"] = v
					}
					json["issued"] = issued.json
					json["issuerID"] = issuerID.json
					if let v = medalDescription?.json {
						json["medalDescription"] = v
					}
					json["medalID"] = medalID.json
					json["reason"] = reason.json
					json["status"] = status.json
					if let v = title?.json {
						json["title"] = v
					}
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.corporationID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.issued.hashValue)
					hashCombine(seed: &hash, value: self.issuerID.hashValue)
					hashCombine(seed: &hash, value: self.medalDescription?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.medalID.hashValue)
					hashCombine(seed: &hash, value: self.reason.hashValue)
					hashCombine(seed: &hash, value: self.status.hashValue)
					hashCombine(seed: &hash, value: self.title?.hashValue ?? 0)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Corp.Medals.Medal, rhs: EVE.Corp.Medals.Medal) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Corp.Medals.Medal) {
					corporationID = other.corporationID
					issued = other.issued
					issuerID = other.issuerID
					medalDescription = other.medalDescription
					medalID = other.medalID
					reason = other.reason
					status = other.status
					title = other.title
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Corp.Medals.Medal(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Corp.Medals.Medal)?.hashValue == hashValue
				}
				
			}
			
			public var currentCorporation: [EVE.Corp.Medals.Medal] = []
			public var otherCorporations: [EVE.Corp.Medals.Medal] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let currentCorporation = try dictionary.rowset(name: "currentCorporation")?.map ({try EVE.Corp.Medals.Medal(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.currentCorporation = currentCorporation
				guard let otherCorporations = try dictionary.rowset(name: "otherCorporations")?.map ({try EVE.Corp.Medals.Medal(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.otherCorporations = otherCorporations
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["currentCorporation"] = currentCorporation.json
				json["otherCorporations"] = otherCorporations.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.currentCorporation.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.otherCorporations.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Corp.Medals, rhs: EVE.Corp.Medals) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Corp.Medals) {
				currentCorporation = other.currentCorporation.compactMap { EVE.Corp.Medals.Medal($0) }
				otherCorporations = other.otherCorporations.compactMap { EVE.Corp.Medals.Medal($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Corp.Medals(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Corp.Medals)?.hashValue == hashValue
			}
			
		}
		
		
		public class Standings: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Standing: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var fromID: Int64 = Int64()
				public var fromName: String = String()
				public var standing: Float = Float()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let fromID = dictionary["fromID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.fromID = fromID
					guard let fromName = dictionary["fromName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.fromName = fromName
					guard let standing = dictionary["standing"] as? Float else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.standing = standing
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["fromID"] = fromID.json
					json["fromName"] = fromName.json
					json["standing"] = standing.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.fromID.hashValue)
					hashCombine(seed: &hash, value: self.fromName.hashValue)
					hashCombine(seed: &hash, value: self.standing.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Corp.Standings.Standing, rhs: EVE.Corp.Standings.Standing) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Corp.Standings.Standing) {
					fromID = other.fromID
					fromName = other.fromName
					standing = other.standing
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Corp.Standings.Standing(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Corp.Standings.Standing)?.hashValue == hashValue
				}
				
			}
			
			public var agents: [EVE.Corp.Standings.Standing]? = nil
			public var factions: [EVE.Corp.Standings.Standing]? = nil
			public var npcCorporations: [EVE.Corp.Standings.Standing]? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				agents = try dictionary.rowset(name: "agents")?.map {try EVE.Corp.Standings.Standing(json: $0)}
				factions = try dictionary.rowset(name: "factions")?.map {try EVE.Corp.Standings.Standing(json: $0)}
				npcCorporations = try dictionary.rowset(name: "NPCCorporations")?.map {try EVE.Corp.Standings.Standing(json: $0)}
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				if let v = agents?.json {
					json["agents"] = v
				}
				if let v = factions?.json {
					json["factions"] = v
				}
				if let v = npcCorporations?.json {
					json["npcCorporations"] = v
				}
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.agents?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.factions?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.npcCorporations?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Corp.Standings, rhs: EVE.Corp.Standings) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Corp.Standings) {
				agents = other.agents?.compactMap { EVE.Corp.Standings.Standing($0) }
				factions = other.factions?.compactMap { EVE.Corp.Standings.Standing($0) }
				npcCorporations = other.npcCorporations?.compactMap { EVE.Corp.Standings.Standing($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Corp.Standings(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Corp.Standings)?.hashValue == hashValue
			}
			
		}
		
		
		public class WalletJournal: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Transaction: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var amount: Double = Double()
				public var argID1: Int? = nil
				public var argName1: String? = nil
				public var balance: Double = Double()
				public var date: Date = Date()
				public var owner1TypeID: Int? = nil
				public var owner2TypeID: Int? = nil
				public var ownerID1: Int64? = nil
				public var ownerID2: Int64? = nil
				public var ownerName1: String? = nil
				public var ownerName2: String? = nil
				public var reason: String? = nil
				public var refID: Int64 = Int64()
				public var refTypeID: Int = Int()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let amount = dictionary["amount"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.amount = amount
					argID1 = dictionary["argID1"] as? Int
					argName1 = dictionary["argName1"] as? String
					guard let balance = dictionary["balance"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.balance = balance
					guard let date = DateFormatter.eveDateFormatter.date(from: dictionary["date"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.date = date
					owner1TypeID = dictionary["owner1TypeID"] as? Int
					owner2TypeID = dictionary["owner2TypeID"] as? Int
					ownerID1 = dictionary["ownerID1"] as? Int64
					ownerID2 = dictionary["ownerID2"] as? Int64
					ownerName1 = dictionary["ownerName1"] as? String
					ownerName2 = dictionary["ownerName2"] as? String
					reason = dictionary["reason"] as? String
					guard let refID = dictionary["refID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.refID = refID
					guard let refTypeID = dictionary["refTypeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.refTypeID = refTypeID
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["amount"] = amount.json
					if let v = argID1?.json {
						json["argID1"] = v
					}
					if let v = argName1?.json {
						json["argName1"] = v
					}
					json["balance"] = balance.json
					json["date"] = date.json
					if let v = owner1TypeID?.json {
						json["owner1TypeID"] = v
					}
					if let v = owner2TypeID?.json {
						json["owner2TypeID"] = v
					}
					if let v = ownerID1?.json {
						json["ownerID1"] = v
					}
					if let v = ownerID2?.json {
						json["ownerID2"] = v
					}
					if let v = ownerName1?.json {
						json["ownerName1"] = v
					}
					if let v = ownerName2?.json {
						json["ownerName2"] = v
					}
					if let v = reason?.json {
						json["reason"] = v
					}
					json["refID"] = refID.json
					json["refTypeID"] = refTypeID.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.amount.hashValue)
					hashCombine(seed: &hash, value: self.argID1?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.argName1?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.balance.hashValue)
					hashCombine(seed: &hash, value: self.date.hashValue)
					hashCombine(seed: &hash, value: self.owner1TypeID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.owner2TypeID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.ownerID1?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.ownerID2?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.ownerName1?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.ownerName2?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.reason?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.refID.hashValue)
					hashCombine(seed: &hash, value: self.refTypeID.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Corp.WalletJournal.Transaction, rhs: EVE.Corp.WalletJournal.Transaction) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Corp.WalletJournal.Transaction) {
					amount = other.amount
					argID1 = other.argID1
					argName1 = other.argName1
					balance = other.balance
					date = other.date
					owner1TypeID = other.owner1TypeID
					owner2TypeID = other.owner2TypeID
					ownerID1 = other.ownerID1
					ownerID2 = other.ownerID2
					ownerName1 = other.ownerName1
					ownerName2 = other.ownerName2
					reason = other.reason
					refID = other.refID
					refTypeID = other.refTypeID
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Corp.WalletJournal.Transaction(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Corp.WalletJournal.Transaction)?.hashValue == hashValue
				}
				
			}
			
			public var entries: [EVE.Corp.WalletJournal.Transaction] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let entries = try dictionary.rowset(name: "entries")?.map ({try EVE.Corp.WalletJournal.Transaction(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.entries = entries
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["entries"] = entries.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.entries.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Corp.WalletJournal, rhs: EVE.Corp.WalletJournal) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Corp.WalletJournal) {
				entries = other.entries.compactMap { EVE.Corp.WalletJournal.Transaction($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Corp.WalletJournal(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Corp.WalletJournal)?.hashValue == hashValue
			}
			
		}
		
		
		public class WalletTransactions: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Transaction: NSObject, Codable, NSCopying, JSONCoding {
				
				public enum ClientType: String, JSONCoding, Codable {
					case alliance = "alliance"
					case corporation = "corporation"
					case personal = "personal"
					
					public init() {
						self = .alliance
					}
					
					public var json: Any {
						return self.rawValue
					}
					
					public init(json: Any) throws {
						guard let s = json as? String, let v = ClientType(rawValue: s) else {throw EVEError.invalidFormat(Swift.type(of: self), json)}
						self = v
					}
					
				}
				
				public enum TransactionType: String, JSONCoding, Codable {
					case buy = "buy"
					case sell = "sell"
					
					public init() {
						self = .buy
					}
					
					public var json: Any {
						return self.rawValue
					}
					
					public init(json: Any) throws {
						guard let s = json as? String, let v = TransactionType(rawValue: s) else {throw EVEError.invalidFormat(Swift.type(of: self), json)}
						self = v
					}
					
				}
				
				public var characterID: Int64 = Int64()
				public var characterName: String = String()
				public var clientID: Int64 = Int64()
				public var clientName: String = String()
				public var clientTypeID: Int = Int()
				public var journalTransactionID: Int64 = Int64()
				public var price: Double = Double()
				public var quantity: Int64 = Int64()
				public var stationID: Int = Int()
				public var stationName: String = String()
				public var transactionDateTime: Date = Date()
				public var transactionFor: EVE.Corp.WalletTransactions.Transaction.ClientType = EVE.Corp.WalletTransactions.Transaction.ClientType()
				public var transactionID: Int64 = Int64()
				public var transactionType: EVE.Corp.WalletTransactions.Transaction.TransactionType = EVE.Corp.WalletTransactions.Transaction.TransactionType()
				public var typeID: Int = Int()
				public var typeName: String = String()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let characterID = dictionary["characterID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.characterID = characterID
					guard let characterName = dictionary["characterName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.characterName = characterName
					guard let clientID = dictionary["clientID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.clientID = clientID
					guard let clientName = dictionary["clientName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.clientName = clientName
					guard let clientTypeID = dictionary["clientTypeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.clientTypeID = clientTypeID
					guard let journalTransactionID = dictionary["journalTransactionID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.journalTransactionID = journalTransactionID
					guard let price = dictionary["price"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.price = price
					guard let quantity = dictionary["quantity"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.quantity = quantity
					guard let stationID = dictionary["stationID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.stationID = stationID
					guard let stationName = dictionary["stationName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.stationName = stationName
					guard let transactionDateTime = DateFormatter.eveDateFormatter.date(from: dictionary["transactionDateTime"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.transactionDateTime = transactionDateTime
					guard let transactionFor = EVE.Corp.WalletTransactions.Transaction.ClientType(rawValue: dictionary["transactionFor"] as? String ?? String()) else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.transactionFor = transactionFor
					guard let transactionID = dictionary["transactionID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.transactionID = transactionID
					guard let transactionType = EVE.Corp.WalletTransactions.Transaction.TransactionType(rawValue: dictionary["transactionType"] as? String ?? String()) else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.transactionType = transactionType
					guard let typeID = dictionary["typeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.typeID = typeID
					guard let typeName = dictionary["typeName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.typeName = typeName
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["characterID"] = characterID.json
					json["characterName"] = characterName.json
					json["clientID"] = clientID.json
					json["clientName"] = clientName.json
					json["clientTypeID"] = clientTypeID.json
					json["journalTransactionID"] = journalTransactionID.json
					json["price"] = price.json
					json["quantity"] = quantity.json
					json["stationID"] = stationID.json
					json["stationName"] = stationName.json
					json["transactionDateTime"] = transactionDateTime.json
					json["transactionFor"] = transactionFor.json
					json["transactionID"] = transactionID.json
					json["transactionType"] = transactionType.json
					json["typeID"] = typeID.json
					json["typeName"] = typeName.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.characterID.hashValue)
					hashCombine(seed: &hash, value: self.characterName.hashValue)
					hashCombine(seed: &hash, value: self.clientID.hashValue)
					hashCombine(seed: &hash, value: self.clientName.hashValue)
					hashCombine(seed: &hash, value: self.clientTypeID.hashValue)
					hashCombine(seed: &hash, value: self.journalTransactionID.hashValue)
					hashCombine(seed: &hash, value: self.price.hashValue)
					hashCombine(seed: &hash, value: self.quantity.hashValue)
					hashCombine(seed: &hash, value: self.stationID.hashValue)
					hashCombine(seed: &hash, value: self.stationName.hashValue)
					hashCombine(seed: &hash, value: self.transactionDateTime.hashValue)
					hashCombine(seed: &hash, value: self.transactionFor.hashValue)
					hashCombine(seed: &hash, value: self.transactionID.hashValue)
					hashCombine(seed: &hash, value: self.transactionType.hashValue)
					hashCombine(seed: &hash, value: self.typeID.hashValue)
					hashCombine(seed: &hash, value: self.typeName.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Corp.WalletTransactions.Transaction, rhs: EVE.Corp.WalletTransactions.Transaction) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Corp.WalletTransactions.Transaction) {
					characterID = other.characterID
					characterName = other.characterName
					clientID = other.clientID
					clientName = other.clientName
					clientTypeID = other.clientTypeID
					journalTransactionID = other.journalTransactionID
					price = other.price
					quantity = other.quantity
					stationID = other.stationID
					stationName = other.stationName
					transactionDateTime = other.transactionDateTime
					transactionFor = other.transactionFor
					transactionID = other.transactionID
					transactionType = other.transactionType
					typeID = other.typeID
					typeName = other.typeName
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Corp.WalletTransactions.Transaction(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Corp.WalletTransactions.Transaction)?.hashValue == hashValue
				}
				
			}
			
			public var transactions: [EVE.Corp.WalletTransactions.Transaction] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let transactions = try dictionary.rowset(name: "transactions")?.map ({try EVE.Corp.WalletTransactions.Transaction(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.transactions = transactions
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["transactions"] = transactions.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.transactions.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Corp.WalletTransactions, rhs: EVE.Corp.WalletTransactions) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Corp.WalletTransactions) {
				transactions = other.transactions.compactMap { EVE.Corp.WalletTransactions.Transaction($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Corp.WalletTransactions(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Corp.WalletTransactions)?.hashValue == hashValue
			}
			
		}
		
		
	}
	
}
