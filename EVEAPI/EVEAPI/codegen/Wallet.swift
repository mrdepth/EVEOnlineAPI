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
		
		public func listWalletsAndBalances(characterID: Int, completionBlock:((Result<[Wallet.Balance]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
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
		
		
		public class GetCharactersCharacterIDWalletsInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
		}
		
		
		public class Balance: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
		}
		
		
		public class GetCharactersCharacterIDWalletsForbidden: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
		}
		
		
	}
	
}
