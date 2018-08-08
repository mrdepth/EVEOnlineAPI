import Foundation
import Alamofire
import Futures


public extension ESI {
	public var dogma: Dogma {
		return Dogma(esi: self)
	}
	
	class Dogma {
		weak var esi: ESI?
		
		init(esi: ESI) {
			self.esi = esi
		}
		
		@discardableResult
		public func getEffectInformation(effectID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<Dogma.Effect>> {
			var esi = self.esi
			guard esi != nil else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi!.server.rawValue))
			
			
			let url = esi!.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<Dogma.Effect>>()
			esi!.perform { () -> DataRequest in
				return esi!.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Dogma.Effect>) in
					promise.set(result: response.result, cached: 3600.0)
					esi = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getEffects(ifNoneMatch: String? = nil) -> Future<ESI.Result<[Int]>> {
			var esi = self.esi
			guard esi != nil else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi!.server.rawValue))
			
			
			let url = esi!.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Int]>>()
			esi!.perform { () -> DataRequest in
				return esi!.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Int]>) in
					promise.set(result: response.result, cached: 3600.0)
					esi = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getAttributeInformation(attributeID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<Dogma.Attribute>> {
			var esi = self.esi
			guard esi != nil else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi!.server.rawValue))
			
			
			let url = esi!.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<Dogma.Attribute>>()
			esi!.perform { () -> DataRequest in
				return esi!.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Dogma.Attribute>) in
					promise.set(result: response.result, cached: 3600.0)
					esi = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getDynamicItemInformation(ifNoneMatch: String? = nil, itemID: Int64, typeID: Int) -> Future<ESI.Result<Dogma.GetDogmaDynamicItemsTypeIDItemIDOk>> {
			var esi = self.esi
			guard esi != nil else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi!.server.rawValue))
			
			
			let url = esi!.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<Dogma.GetDogmaDynamicItemsTypeIDItemIDOk>>()
			esi!.perform { () -> DataRequest in
				return esi!.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Dogma.GetDogmaDynamicItemsTypeIDItemIDOk>) in
					promise.set(result: response.result, cached: 3600.0)
					esi = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getAttributes(ifNoneMatch: String? = nil) -> Future<ESI.Result<[Int]>> {
			var esi = self.esi
			guard esi != nil else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi!.server.rawValue))
			
			
			let url = esi!.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Int]>>()
			esi!.perform { () -> DataRequest in
				return esi!.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Int]>) in
					promise.set(result: response.result, cached: 3600.0)
					esi = nil
				}
			}
			return promise.future
		}
		
		
		public struct GetDogmaDynamicItemsTypeIDItemIDNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Dogma.GetDogmaDynamicItemsTypeIDItemIDNotFound, rhs: Dogma.GetDogmaDynamicItemsTypeIDItemIDNotFound) -> Bool {
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
		
		
		public struct GetDogmaDynamicItemsTypeIDItemIDOk: Codable, Hashable {
			
			public struct GetDogmaDynamicItemsTypeIDItemIDDogmaAttributes: Codable, Hashable {
				
				
				public var attributeID: Int
				public var value: Float
				
				public init(attributeID: Int, value: Float) {
					self.attributeID = attributeID
					self.value = value
				}
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: attributeID.hashValue)
					hashCombine(seed: &hash, value: value.hashValue)
					return hash
				}
				
				public static func ==(lhs: Dogma.GetDogmaDynamicItemsTypeIDItemIDOk.GetDogmaDynamicItemsTypeIDItemIDDogmaAttributes, rhs: Dogma.GetDogmaDynamicItemsTypeIDItemIDOk.GetDogmaDynamicItemsTypeIDItemIDDogmaAttributes) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case attributeID = "attribute_id"
					case value
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct GetDogmaDynamicItemsTypeIDItemIDDogmaEffects: Codable, Hashable {
				
				
				public var effectID: Int
				public var isDefault: Bool
				
				public init(effectID: Int, isDefault: Bool) {
					self.effectID = effectID
					self.isDefault = isDefault
				}
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: effectID.hashValue)
					hashCombine(seed: &hash, value: isDefault.hashValue)
					return hash
				}
				
				public static func ==(lhs: Dogma.GetDogmaDynamicItemsTypeIDItemIDOk.GetDogmaDynamicItemsTypeIDItemIDDogmaEffects, rhs: Dogma.GetDogmaDynamicItemsTypeIDItemIDOk.GetDogmaDynamicItemsTypeIDItemIDDogmaEffects) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case effectID = "effect_id"
					case isDefault = "is_default"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public var createdBy: Int
			public var dogmaAttributes: [Dogma.GetDogmaDynamicItemsTypeIDItemIDOk.GetDogmaDynamicItemsTypeIDItemIDDogmaAttributes]
			public var dogmaEffects: [Dogma.GetDogmaDynamicItemsTypeIDItemIDOk.GetDogmaDynamicItemsTypeIDItemIDDogmaEffects]
			public var mutatorTypeID: Int
			public var sourceTypeID: Int
			
			public init(createdBy: Int, dogmaAttributes: [Dogma.GetDogmaDynamicItemsTypeIDItemIDOk.GetDogmaDynamicItemsTypeIDItemIDDogmaAttributes], dogmaEffects: [Dogma.GetDogmaDynamicItemsTypeIDItemIDOk.GetDogmaDynamicItemsTypeIDItemIDDogmaEffects], mutatorTypeID: Int, sourceTypeID: Int) {
				self.createdBy = createdBy
				self.dogmaAttributes = dogmaAttributes
				self.dogmaEffects = dogmaEffects
				self.mutatorTypeID = mutatorTypeID
				self.sourceTypeID = sourceTypeID
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: createdBy.hashValue)
				self.dogmaAttributes.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.dogmaEffects.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: mutatorTypeID.hashValue)
				hashCombine(seed: &hash, value: sourceTypeID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Dogma.GetDogmaDynamicItemsTypeIDItemIDOk, rhs: Dogma.GetDogmaDynamicItemsTypeIDItemIDOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case createdBy = "created_by"
				case dogmaAttributes = "dogma_attributes"
				case dogmaEffects = "dogma_effects"
				case mutatorTypeID = "mutator_type_id"
				case sourceTypeID = "source_type_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
	}
	
}
