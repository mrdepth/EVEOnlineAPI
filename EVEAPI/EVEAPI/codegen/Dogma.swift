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
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Dogma.Effect>) in
					completionBlock?(response.result)
					session = nil
				}
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
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Int]>) in
					completionBlock?(response.result)
					session = nil
				}
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
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Dogma.Attribute>) in
					completionBlock?(response.result)
					session = nil
				}
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
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Int]>) in
					completionBlock?(response.result)
					session = nil
				}
			}
		}
		
		
		public struct Effect: Codable, Hashable {
			
			public struct GetDogmaEffectsEffectIDModifiers: Codable, Hashable {
				
				
				public var domain: String?
				public var effectID: Int?
				public var `func`: String
				public var modifiedAttributeID: Int?
				public var modifyingAttributeID: Int?
				public var `operator`: Int?
				
				public init(domain: String?, effectID: Int?, `func`: String, modifiedAttributeID: Int?, modifyingAttributeID: Int?, `operator`: Int?) {
					self.domain = domain
					self.effectID = effectID
					self.`func` = `func`
					self.modifiedAttributeID = modifiedAttributeID
					self.modifyingAttributeID = modifyingAttributeID
					self.`operator` = `operator`
				}
				
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
			
			public var localizedDescription: String?
			public var disallowAutoRepeat: Bool?
			public var dischargeAttributeID: Int?
			public var displayName: String?
			public var durationAttributeID: Int?
			public var effectCategory: Int?
			public var effectID: Int
			public var electronicChance: Bool?
			public var falloffAttributeID: Int?
			public var iconID: Int?
			public var isAssistance: Bool?
			public var isOffensive: Bool?
			public var isWarpSafe: Bool?
			public var modifiers: [Dogma.Effect.GetDogmaEffectsEffectIDModifiers]?
			public var name: String?
			public var postExpression: Int?
			public var preExpression: Int?
			public var published: Bool?
			public var rangeAttributeID: Int?
			public var rangeChance: Bool?
			public var trackingSpeedAttributeID: Int?
			
			public init(localizedDescription: String?, disallowAutoRepeat: Bool?, dischargeAttributeID: Int?, displayName: String?, durationAttributeID: Int?, effectCategory: Int?, effectID: Int, electronicChance: Bool?, falloffAttributeID: Int?, iconID: Int?, isAssistance: Bool?, isOffensive: Bool?, isWarpSafe: Bool?, modifiers: [Dogma.Effect.GetDogmaEffectsEffectIDModifiers]?, name: String?, postExpression: Int?, preExpression: Int?, published: Bool?, rangeAttributeID: Int?, rangeChance: Bool?, trackingSpeedAttributeID: Int?) {
				self.localizedDescription = localizedDescription
				self.disallowAutoRepeat = disallowAutoRepeat
				self.dischargeAttributeID = dischargeAttributeID
				self.displayName = displayName
				self.durationAttributeID = durationAttributeID
				self.effectCategory = effectCategory
				self.effectID = effectID
				self.electronicChance = electronicChance
				self.falloffAttributeID = falloffAttributeID
				self.iconID = iconID
				self.isAssistance = isAssistance
				self.isOffensive = isOffensive
				self.isWarpSafe = isWarpSafe
				self.modifiers = modifiers
				self.name = name
				self.postExpression = postExpression
				self.preExpression = preExpression
				self.published = published
				self.rangeAttributeID = rangeAttributeID
				self.rangeChance = rangeChance
				self.trackingSpeedAttributeID = trackingSpeedAttributeID
			}
			
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
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
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
			
			
			public var attributeID: Int
			public var defaultValue: Float?
			public var localizedDescription: String?
			public var displayName: String?
			public var highIsGood: Bool?
			public var iconID: Int?
			public var name: String?
			public var published: Bool?
			public var stackable: Bool?
			public var unitID: Int?
			
			public init(attributeID: Int, defaultValue: Float?, localizedDescription: String?, displayName: String?, highIsGood: Bool?, iconID: Int?, name: String?, published: Bool?, stackable: Bool?, unitID: Int?) {
				self.attributeID = attributeID
				self.defaultValue = defaultValue
				self.localizedDescription = localizedDescription
				self.displayName = displayName
				self.highIsGood = highIsGood
				self.iconID = iconID
				self.name = name
				self.published = published
				self.stackable = stackable
				self.unitID = unitID
			}
			
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
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
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
