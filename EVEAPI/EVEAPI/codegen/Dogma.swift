import Foundation
import Alamofire


public extension ESI {
	public var dogma: Dogma {
		return Dogma(sessionManager: self)
	}
	
	class Dogma {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		public func getEffectInformation(effectID: Int, completionBlock:((Result<Dogma.Effect>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v2/dogma/effects/\(effectID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Dogma.Effect>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getEffects(completionBlock:((Result<[Int]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/dogma/effects/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Int]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getAttributeInformation(attributeID: Int, completionBlock:((Result<Dogma.Attribute>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/dogma/attributes/\(attributeID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Dogma.Attribute>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getAttributes(completionBlock:((Result<[Int]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/dogma/attributes/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Int]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		public struct Effect: Codable, Hashable {
			
			public struct GetDogmaEffectsEffectIDModifiers: Codable, Hashable {
				
				
				public let domain: String?
				public let effectID: Int?
				public let `func`: String
				public let modifiedAttributeID: Int?
				public let modifyingAttributeID: Int?
				public let `operator`: Int?
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: domain?.hashValue ?? 0)
					hashCombine(seed: &hash, value: effectID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: `func`.hashValue)
					hashCombine(seed: &hash, value: modifiedAttributeID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: modifyingAttributeID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: `operator`?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: Dogma.Effect.GetDogmaEffectsEffectIDModifiers, rhs: Dogma.Effect.GetDogmaEffectsEffectIDModifiers) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case domain
					case effectID = "effect_id"
					case `func` = "func"
					case modifiedAttributeID = "modified_attribute_id"
					case modifyingAttributeID = "modifying_attribute_id"
					case `operator` = "operator"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public let localizedDescription: String?
			public let disallowAutoRepeat: Bool?
			public let dischargeAttributeID: Int?
			public let displayName: String?
			public let durationAttributeID: Int?
			public let effectCategory: Int?
			public let effectID: Int
			public let electronicChance: Bool?
			public let falloffAttributeID: Int?
			public let iconID: Int?
			public let isAssistance: Bool?
			public let isOffensive: Bool?
			public let isWarpSafe: Bool?
			public let modifiers: [Dogma.Effect.GetDogmaEffectsEffectIDModifiers]?
			public let name: String?
			public let postExpression: Int?
			public let preExpression: Int?
			public let published: Bool?
			public let rangeAttributeID: Int?
			public let rangeChance: Bool?
			public let trackingSpeedAttributeID: Int?
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: localizedDescription?.hashValue ?? 0)
				hashCombine(seed: &hash, value: disallowAutoRepeat?.hashValue ?? 0)
				hashCombine(seed: &hash, value: dischargeAttributeID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: displayName?.hashValue ?? 0)
				hashCombine(seed: &hash, value: durationAttributeID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: effectCategory?.hashValue ?? 0)
				hashCombine(seed: &hash, value: effectID.hashValue)
				hashCombine(seed: &hash, value: electronicChance?.hashValue ?? 0)
				hashCombine(seed: &hash, value: falloffAttributeID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: iconID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: isAssistance?.hashValue ?? 0)
				hashCombine(seed: &hash, value: isOffensive?.hashValue ?? 0)
				hashCombine(seed: &hash, value: isWarpSafe?.hashValue ?? 0)
				self.modifiers?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: name?.hashValue ?? 0)
				hashCombine(seed: &hash, value: postExpression?.hashValue ?? 0)
				hashCombine(seed: &hash, value: preExpression?.hashValue ?? 0)
				hashCombine(seed: &hash, value: published?.hashValue ?? 0)
				hashCombine(seed: &hash, value: rangeAttributeID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: rangeChance?.hashValue ?? 0)
				hashCombine(seed: &hash, value: trackingSpeedAttributeID?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Dogma.Effect, rhs: Dogma.Effect) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case localizedDescription = "description"
				case disallowAutoRepeat = "disallow_auto_repeat"
				case dischargeAttributeID = "discharge_attribute_id"
				case displayName = "display_name"
				case durationAttributeID = "duration_attribute_id"
				case effectCategory = "effect_category"
				case effectID = "effect_id"
				case electronicChance = "electronic_chance"
				case falloffAttributeID = "falloff_attribute_id"
				case iconID = "icon_id"
				case isAssistance = "is_assistance"
				case isOffensive = "is_offensive"
				case isWarpSafe = "is_warp_safe"
				case modifiers
				case name
				case postExpression = "post_expression"
				case preExpression = "pre_expression"
				case published
				case rangeAttributeID = "range_attribute_id"
				case rangeChance = "range_chance"
				case trackingSpeedAttributeID = "tracking_speed_attribute_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetDogmaAttributesAttributeIDNotFound: Codable, Hashable {
			
			
			public let error: String?
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Dogma.GetDogmaAttributesAttributeIDNotFound, rhs: Dogma.GetDogmaAttributesAttributeIDNotFound) -> Bool {
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
		
		
		public struct Attribute: Codable, Hashable {
			
			
			public let attributeID: Int
			public let defaultValue: Float?
			public let localizedDescription: String?
			public let displayName: String?
			public let highIsGood: Bool?
			public let iconID: Int?
			public let name: String?
			public let published: Bool?
			public let stackable: Bool?
			public let unitID: Int?
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: attributeID.hashValue)
				hashCombine(seed: &hash, value: defaultValue?.hashValue ?? 0)
				hashCombine(seed: &hash, value: localizedDescription?.hashValue ?? 0)
				hashCombine(seed: &hash, value: displayName?.hashValue ?? 0)
				hashCombine(seed: &hash, value: highIsGood?.hashValue ?? 0)
				hashCombine(seed: &hash, value: iconID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: name?.hashValue ?? 0)
				hashCombine(seed: &hash, value: published?.hashValue ?? 0)
				hashCombine(seed: &hash, value: stackable?.hashValue ?? 0)
				hashCombine(seed: &hash, value: unitID?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Dogma.Attribute, rhs: Dogma.Attribute) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case attributeID = "attribute_id"
				case defaultValue = "default_value"
				case localizedDescription = "description"
				case displayName = "display_name"
				case highIsGood = "high_is_good"
				case iconID = "icon_id"
				case name
				case published
				case stackable
				case unitID = "unit_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetDogmaEffectsEffectIDNotFound: Codable, Hashable {
			
			
			public let error: String?
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Dogma.GetDogmaEffectsEffectIDNotFound, rhs: Dogma.GetDogmaEffectsEffectIDNotFound) -> Bool {
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
		
		
	}
	
}
