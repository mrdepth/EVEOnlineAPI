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
		
		public func getEffects(completionBlock:((Result<[Int]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/dogma/effects/"
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
		
		public func getEffectInformation(effectID: Int, completionBlock:((Result<Dogma.Effect>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/dogma/effects/\(effectID)/"
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
		
		public func getAttributes(completionBlock:((Result<[Int]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/dogma/attributes/"
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
			
			
			
			let url = session!.baseURL + "latest/dogma/attributes/\(attributeID)/"
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
		
		
		public class Effect: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class GetDogmaEffectsEffectIDModifiers: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var domain: String? = nil
				public var effectID: Int? = nil
				public var `func`: String = String()
				public var modifiedAttributeID: Int? = nil
				public var modifyingAttributeID: Int? = nil
				public var `operator`: Int? = nil
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					domain = dictionary["domain"] as? String
					effectID = dictionary["effect_id"] as? Int
					guard let `func` = dictionary["func"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.`func` = `func`
					modifiedAttributeID = dictionary["modified_attribute_id"] as? Int
					modifyingAttributeID = dictionary["modifying_attribute_id"] as? Int
					`operator` = dictionary["operator"] as? Int
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					domain = aDecoder.decodeObject(forKey: "domain") as? String
					effectID = aDecoder.containsValue(forKey: "effect_id") ? aDecoder.decodeInteger(forKey: "effect_id") : nil
					`func` = aDecoder.decodeObject(forKey: "func") as? String ?? String()
					modifiedAttributeID = aDecoder.containsValue(forKey: "modified_attribute_id") ? aDecoder.decodeInteger(forKey: "modified_attribute_id") : nil
					modifyingAttributeID = aDecoder.containsValue(forKey: "modifying_attribute_id") ? aDecoder.decodeInteger(forKey: "modifying_attribute_id") : nil
					`operator` = aDecoder.containsValue(forKey: "operator") ? aDecoder.decodeInteger(forKey: "operator") : nil
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					if let v = domain {
						aCoder.encode(v, forKey: "domain")
					}
					if let v = effectID {
						aCoder.encode(v, forKey: "effect_id")
					}
					aCoder.encode(`func`, forKey: "func")
					if let v = modifiedAttributeID {
						aCoder.encode(v, forKey: "modified_attribute_id")
					}
					if let v = modifyingAttributeID {
						aCoder.encode(v, forKey: "modifying_attribute_id")
					}
					if let v = `operator` {
						aCoder.encode(v, forKey: "operator")
					}
				}
				
				public var json: Any {
					var json = [String: Any]()
					if let v = domain?.json {
						json["domain"] = v
					}
					if let v = effectID?.json {
						json["effect_id"] = v
					}
					json["func"] = `func`.json
					if let v = modifiedAttributeID?.json {
						json["modified_attribute_id"] = v
					}
					if let v = modifyingAttributeID?.json {
						json["modifying_attribute_id"] = v
					}
					if let v = `operator`?.json {
						json["operator"] = v
					}
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.domain?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.effectID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.`func`.hashValue)
					hashCombine(seed: &hash, value: self.modifiedAttributeID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.modifyingAttributeID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.`operator`?.hashValue ?? 0)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: Dogma.Effect.GetDogmaEffectsEffectIDModifiers, rhs: Dogma.Effect.GetDogmaEffectsEffectIDModifiers) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Dogma.Effect.GetDogmaEffectsEffectIDModifiers) {
					domain = other.domain
					effectID = other.effectID
					`func` = other.`func`
					modifiedAttributeID = other.modifiedAttributeID
					modifyingAttributeID = other.modifyingAttributeID
					`operator` = other.`operator`
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Dogma.Effect.GetDogmaEffectsEffectIDModifiers(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetDogmaEffectsEffectIDModifiers)?.hashValue == hashValue
				}
				
			}
			
			public var localizedDescription: String? = nil
			public var disallowAutoRepeat: Bool? = nil
			public var dischargeAttributeID: Int? = nil
			public var displayName: String? = nil
			public var durationAttributeID: Int? = nil
			public var effectCategory: Int? = nil
			public var effectID: Int = Int()
			public var electronicChance: Bool? = nil
			public var falloffAttributeID: Int? = nil
			public var iconID: Int? = nil
			public var isAssistance: Bool? = nil
			public var isOffensive: Bool? = nil
			public var isWarpSafe: Bool? = nil
			public var modifiers: [Dogma.Effect.GetDogmaEffectsEffectIDModifiers]? = nil
			public var name: String? = nil
			public var postExpression: Int? = nil
			public var preExpression: Int? = nil
			public var published: Bool? = nil
			public var rangeAttributeID: Int? = nil
			public var rangeChance: Bool? = nil
			public var trackingSpeedAttributeID: Int? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				localizedDescription = dictionary["description"] as? String
				disallowAutoRepeat = dictionary["disallow_auto_repeat"] as? Bool
				dischargeAttributeID = dictionary["discharge_attribute_id"] as? Int
				displayName = dictionary["display_name"] as? String
				durationAttributeID = dictionary["duration_attribute_id"] as? Int
				effectCategory = dictionary["effect_category"] as? Int
				guard let effectID = dictionary["effect_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.effectID = effectID
				electronicChance = dictionary["electronic_chance"] as? Bool
				falloffAttributeID = dictionary["falloff_attribute_id"] as? Int
				iconID = dictionary["icon_id"] as? Int
				isAssistance = dictionary["is_assistance"] as? Bool
				isOffensive = dictionary["is_offensive"] as? Bool
				isWarpSafe = dictionary["is_warp_safe"] as? Bool
				modifiers = try (dictionary["modifiers"] as? [Any])?.map {try Dogma.Effect.GetDogmaEffectsEffectIDModifiers(json: $0)}
				name = dictionary["name"] as? String
				postExpression = dictionary["post_expression"] as? Int
				preExpression = dictionary["pre_expression"] as? Int
				published = dictionary["published"] as? Bool
				rangeAttributeID = dictionary["range_attribute_id"] as? Int
				rangeChance = dictionary["range_chance"] as? Bool
				trackingSpeedAttributeID = dictionary["tracking_speed_attribute_id"] as? Int
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				localizedDescription = aDecoder.decodeObject(forKey: "description") as? String
				disallowAutoRepeat = aDecoder.containsValue(forKey: "disallow_auto_repeat") ? aDecoder.decodeBool(forKey: "disallow_auto_repeat") : nil
				dischargeAttributeID = aDecoder.containsValue(forKey: "discharge_attribute_id") ? aDecoder.decodeInteger(forKey: "discharge_attribute_id") : nil
				displayName = aDecoder.decodeObject(forKey: "display_name") as? String
				durationAttributeID = aDecoder.containsValue(forKey: "duration_attribute_id") ? aDecoder.decodeInteger(forKey: "duration_attribute_id") : nil
				effectCategory = aDecoder.containsValue(forKey: "effect_category") ? aDecoder.decodeInteger(forKey: "effect_category") : nil
				effectID = aDecoder.decodeInteger(forKey: "effect_id")
				electronicChance = aDecoder.containsValue(forKey: "electronic_chance") ? aDecoder.decodeBool(forKey: "electronic_chance") : nil
				falloffAttributeID = aDecoder.containsValue(forKey: "falloff_attribute_id") ? aDecoder.decodeInteger(forKey: "falloff_attribute_id") : nil
				iconID = aDecoder.containsValue(forKey: "icon_id") ? aDecoder.decodeInteger(forKey: "icon_id") : nil
				isAssistance = aDecoder.containsValue(forKey: "is_assistance") ? aDecoder.decodeBool(forKey: "is_assistance") : nil
				isOffensive = aDecoder.containsValue(forKey: "is_offensive") ? aDecoder.decodeBool(forKey: "is_offensive") : nil
				isWarpSafe = aDecoder.containsValue(forKey: "is_warp_safe") ? aDecoder.decodeBool(forKey: "is_warp_safe") : nil
				modifiers = aDecoder.decodeObject(of: [Dogma.Effect.GetDogmaEffectsEffectIDModifiers.self], forKey: "modifiers") as? [Dogma.Effect.GetDogmaEffectsEffectIDModifiers]
				name = aDecoder.decodeObject(forKey: "name") as? String
				postExpression = aDecoder.containsValue(forKey: "post_expression") ? aDecoder.decodeInteger(forKey: "post_expression") : nil
				preExpression = aDecoder.containsValue(forKey: "pre_expression") ? aDecoder.decodeInteger(forKey: "pre_expression") : nil
				published = aDecoder.containsValue(forKey: "published") ? aDecoder.decodeBool(forKey: "published") : nil
				rangeAttributeID = aDecoder.containsValue(forKey: "range_attribute_id") ? aDecoder.decodeInteger(forKey: "range_attribute_id") : nil
				rangeChance = aDecoder.containsValue(forKey: "range_chance") ? aDecoder.decodeBool(forKey: "range_chance") : nil
				trackingSpeedAttributeID = aDecoder.containsValue(forKey: "tracking_speed_attribute_id") ? aDecoder.decodeInteger(forKey: "tracking_speed_attribute_id") : nil
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = localizedDescription {
					aCoder.encode(v, forKey: "description")
				}
				if let v = disallowAutoRepeat {
					aCoder.encode(v, forKey: "disallow_auto_repeat")
				}
				if let v = dischargeAttributeID {
					aCoder.encode(v, forKey: "discharge_attribute_id")
				}
				if let v = displayName {
					aCoder.encode(v, forKey: "display_name")
				}
				if let v = durationAttributeID {
					aCoder.encode(v, forKey: "duration_attribute_id")
				}
				if let v = effectCategory {
					aCoder.encode(v, forKey: "effect_category")
				}
				aCoder.encode(effectID, forKey: "effect_id")
				if let v = electronicChance {
					aCoder.encode(v, forKey: "electronic_chance")
				}
				if let v = falloffAttributeID {
					aCoder.encode(v, forKey: "falloff_attribute_id")
				}
				if let v = iconID {
					aCoder.encode(v, forKey: "icon_id")
				}
				if let v = isAssistance {
					aCoder.encode(v, forKey: "is_assistance")
				}
				if let v = isOffensive {
					aCoder.encode(v, forKey: "is_offensive")
				}
				if let v = isWarpSafe {
					aCoder.encode(v, forKey: "is_warp_safe")
				}
				if let v = modifiers {
					aCoder.encode(v, forKey: "modifiers")
				}
				if let v = name {
					aCoder.encode(v, forKey: "name")
				}
				if let v = postExpression {
					aCoder.encode(v, forKey: "post_expression")
				}
				if let v = preExpression {
					aCoder.encode(v, forKey: "pre_expression")
				}
				if let v = published {
					aCoder.encode(v, forKey: "published")
				}
				if let v = rangeAttributeID {
					aCoder.encode(v, forKey: "range_attribute_id")
				}
				if let v = rangeChance {
					aCoder.encode(v, forKey: "range_chance")
				}
				if let v = trackingSpeedAttributeID {
					aCoder.encode(v, forKey: "tracking_speed_attribute_id")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = localizedDescription?.json {
					json["description"] = v
				}
				if let v = disallowAutoRepeat?.json {
					json["disallow_auto_repeat"] = v
				}
				if let v = dischargeAttributeID?.json {
					json["discharge_attribute_id"] = v
				}
				if let v = displayName?.json {
					json["display_name"] = v
				}
				if let v = durationAttributeID?.json {
					json["duration_attribute_id"] = v
				}
				if let v = effectCategory?.json {
					json["effect_category"] = v
				}
				json["effect_id"] = effectID.json
				if let v = electronicChance?.json {
					json["electronic_chance"] = v
				}
				if let v = falloffAttributeID?.json {
					json["falloff_attribute_id"] = v
				}
				if let v = iconID?.json {
					json["icon_id"] = v
				}
				if let v = isAssistance?.json {
					json["is_assistance"] = v
				}
				if let v = isOffensive?.json {
					json["is_offensive"] = v
				}
				if let v = isWarpSafe?.json {
					json["is_warp_safe"] = v
				}
				if let v = modifiers?.json {
					json["modifiers"] = v
				}
				if let v = name?.json {
					json["name"] = v
				}
				if let v = postExpression?.json {
					json["post_expression"] = v
				}
				if let v = preExpression?.json {
					json["pre_expression"] = v
				}
				if let v = published?.json {
					json["published"] = v
				}
				if let v = rangeAttributeID?.json {
					json["range_attribute_id"] = v
				}
				if let v = rangeChance?.json {
					json["range_chance"] = v
				}
				if let v = trackingSpeedAttributeID?.json {
					json["tracking_speed_attribute_id"] = v
				}
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.localizedDescription?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.disallowAutoRepeat?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.dischargeAttributeID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.displayName?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.durationAttributeID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.effectCategory?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.effectID.hashValue)
				hashCombine(seed: &hash, value: self.electronicChance?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.falloffAttributeID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.iconID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.isAssistance?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.isOffensive?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.isWarpSafe?.hashValue ?? 0)
				self.modifiers?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: self.name?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.postExpression?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.preExpression?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.published?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.rangeAttributeID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.rangeChance?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.trackingSpeedAttributeID?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Dogma.Effect, rhs: Dogma.Effect) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Dogma.Effect) {
				localizedDescription = other.localizedDescription
				disallowAutoRepeat = other.disallowAutoRepeat
				dischargeAttributeID = other.dischargeAttributeID
				displayName = other.displayName
				durationAttributeID = other.durationAttributeID
				effectCategory = other.effectCategory
				effectID = other.effectID
				electronicChance = other.electronicChance
				falloffAttributeID = other.falloffAttributeID
				iconID = other.iconID
				isAssistance = other.isAssistance
				isOffensive = other.isOffensive
				isWarpSafe = other.isWarpSafe
				modifiers = other.modifiers?.flatMap { Dogma.Effect.GetDogmaEffectsEffectIDModifiers($0) }
				name = other.name
				postExpression = other.postExpression
				preExpression = other.preExpression
				published = other.published
				rangeAttributeID = other.rangeAttributeID
				rangeChance = other.rangeChance
				trackingSpeedAttributeID = other.trackingSpeedAttributeID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Dogma.Effect(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Effect)?.hashValue == hashValue
			}
			
		}
		
		
		public class GetDogmaAttributesAttributeIDNotFound: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.error?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Dogma.GetDogmaAttributesAttributeIDNotFound, rhs: Dogma.GetDogmaAttributesAttributeIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Dogma.GetDogmaAttributesAttributeIDNotFound) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Dogma.GetDogmaAttributesAttributeIDNotFound(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetDogmaAttributesAttributeIDNotFound)?.hashValue == hashValue
			}
			
		}
		
		
		public class Attribute: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var attributeID: Int = Int()
			public var defaultValue: Float? = nil
			public var localizedDescription: String? = nil
			public var displayName: String? = nil
			public var highIsGood: Bool? = nil
			public var iconID: Int? = nil
			public var name: String? = nil
			public var published: Bool? = nil
			public var stackable: Bool? = nil
			public var unitID: Int? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let attributeID = dictionary["attribute_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.attributeID = attributeID
				defaultValue = dictionary["default_value"] as? Float
				localizedDescription = dictionary["description"] as? String
				displayName = dictionary["display_name"] as? String
				highIsGood = dictionary["high_is_good"] as? Bool
				iconID = dictionary["icon_id"] as? Int
				name = dictionary["name"] as? String
				published = dictionary["published"] as? Bool
				stackable = dictionary["stackable"] as? Bool
				unitID = dictionary["unit_id"] as? Int
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				attributeID = aDecoder.decodeInteger(forKey: "attribute_id")
				defaultValue = aDecoder.containsValue(forKey: "default_value") ? aDecoder.decodeFloat(forKey: "default_value") : nil
				localizedDescription = aDecoder.decodeObject(forKey: "description") as? String
				displayName = aDecoder.decodeObject(forKey: "display_name") as? String
				highIsGood = aDecoder.containsValue(forKey: "high_is_good") ? aDecoder.decodeBool(forKey: "high_is_good") : nil
				iconID = aDecoder.containsValue(forKey: "icon_id") ? aDecoder.decodeInteger(forKey: "icon_id") : nil
				name = aDecoder.decodeObject(forKey: "name") as? String
				published = aDecoder.containsValue(forKey: "published") ? aDecoder.decodeBool(forKey: "published") : nil
				stackable = aDecoder.containsValue(forKey: "stackable") ? aDecoder.decodeBool(forKey: "stackable") : nil
				unitID = aDecoder.containsValue(forKey: "unit_id") ? aDecoder.decodeInteger(forKey: "unit_id") : nil
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(attributeID, forKey: "attribute_id")
				if let v = defaultValue {
					aCoder.encode(v, forKey: "default_value")
				}
				if let v = localizedDescription {
					aCoder.encode(v, forKey: "description")
				}
				if let v = displayName {
					aCoder.encode(v, forKey: "display_name")
				}
				if let v = highIsGood {
					aCoder.encode(v, forKey: "high_is_good")
				}
				if let v = iconID {
					aCoder.encode(v, forKey: "icon_id")
				}
				if let v = name {
					aCoder.encode(v, forKey: "name")
				}
				if let v = published {
					aCoder.encode(v, forKey: "published")
				}
				if let v = stackable {
					aCoder.encode(v, forKey: "stackable")
				}
				if let v = unitID {
					aCoder.encode(v, forKey: "unit_id")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["attribute_id"] = attributeID.json
				if let v = defaultValue?.json {
					json["default_value"] = v
				}
				if let v = localizedDescription?.json {
					json["description"] = v
				}
				if let v = displayName?.json {
					json["display_name"] = v
				}
				if let v = highIsGood?.json {
					json["high_is_good"] = v
				}
				if let v = iconID?.json {
					json["icon_id"] = v
				}
				if let v = name?.json {
					json["name"] = v
				}
				if let v = published?.json {
					json["published"] = v
				}
				if let v = stackable?.json {
					json["stackable"] = v
				}
				if let v = unitID?.json {
					json["unit_id"] = v
				}
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.attributeID.hashValue)
				hashCombine(seed: &hash, value: self.defaultValue?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.localizedDescription?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.displayName?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.highIsGood?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.iconID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.name?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.published?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.stackable?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.unitID?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Dogma.Attribute, rhs: Dogma.Attribute) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Dogma.Attribute) {
				attributeID = other.attributeID
				defaultValue = other.defaultValue
				localizedDescription = other.localizedDescription
				displayName = other.displayName
				highIsGood = other.highIsGood
				iconID = other.iconID
				name = other.name
				published = other.published
				stackable = other.stackable
				unitID = other.unitID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Dogma.Attribute(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Attribute)?.hashValue == hashValue
			}
			
		}
		
		
		public class GetDogmaEffectsEffectIDNotFound: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.error?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Dogma.GetDogmaEffectsEffectIDNotFound, rhs: Dogma.GetDogmaEffectsEffectIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Dogma.GetDogmaEffectsEffectIDNotFound) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Dogma.GetDogmaEffectsEffectIDNotFound(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetDogmaEffectsEffectIDNotFound)?.hashValue == hashValue
			}
			
		}
		
		
	}
	
}
