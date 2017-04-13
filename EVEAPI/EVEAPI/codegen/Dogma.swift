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
			
			
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			
			
			let url = session!.baseURL + "latest/dogma/effects/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Int]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getEffectInformation(effectID: Int, completionBlock:((Result<Dogma.Effect>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			
			
			let url = session!.baseURL + "latest/dogma/effects/\(effectID)/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Dogma.Effect>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getAttributes(completionBlock:((Result<[Int]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			
			
			let url = session!.baseURL + "latest/dogma/attributes/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Int]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getAttributeInformation(attributeID: Int, completionBlock:((Result<Dogma.Attribute>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			var parameters = Parameters()
			let headers = HTTPHeaders()
			parameters["datasource"] = session!.server.rawValue
			
			
			
			let url = session!.baseURL + "latest/dogma/attributes/\(attributeID)/"
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Dogma.Attribute>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		public class Effect: NSObject, NSSecureCoding , JSONCoding {
			
			public class GetDogmaEffectsEffectIDModifiers: NSObject, NSSecureCoding , JSONCoding {
				
				
				public var domain: String = String()
				public var `func`: String = String()
				public var modifiedAttributeID: Int = Int()
				public var modifyingAttributeID: Int = Int()
				public var `operator`: Int = Int()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let domain = dictionary["domain"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.domain = domain
					guard let `func` = dictionary["func"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.`func` = `func`
					guard let modifiedAttributeID = dictionary["modified_attribute_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.modifiedAttributeID = modifiedAttributeID
					guard let modifyingAttributeID = dictionary["modifying_attribute_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.modifyingAttributeID = modifyingAttributeID
					guard let `operator` = dictionary["operator"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.`operator` = `operator`
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					domain = aDecoder.decodeObject(forKey: "domain") as? String ?? String()
					`func` = aDecoder.decodeObject(forKey: "func") as? String ?? String()
					modifiedAttributeID = aDecoder.decodeInteger(forKey: "modified_attribute_id")
					modifyingAttributeID = aDecoder.decodeInteger(forKey: "modifying_attribute_id")
					`operator` = aDecoder.decodeInteger(forKey: "operator")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(domain, forKey: "domain")
					aCoder.encode(`func`, forKey: "func")
					aCoder.encode(modifiedAttributeID, forKey: "modified_attribute_id")
					aCoder.encode(modifyingAttributeID, forKey: "modifying_attribute_id")
					aCoder.encode(`operator`, forKey: "operator")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["domain"] = domain.json
					json["func"] = `func`.json
					json["modified_attribute_id"] = modifiedAttributeID.json
					json["modifying_attribute_id"] = modifyingAttributeID.json
					json["operator"] = `operator`.json
					return json
				}
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: domain.hashValue)
					hashCombine(seed: &hash, value: `func`.hashValue)
					hashCombine(seed: &hash, value: modifiedAttributeID.hashValue)
					hashCombine(seed: &hash, value: modifyingAttributeID.hashValue)
					hashCombine(seed: &hash, value: `operator`.hashValue)
					return hash
				}
				
				public static func ==(lhs: Dogma.Effect.GetDogmaEffectsEffectIDModifiers, rhs: Dogma.Effect.GetDogmaEffectsEffectIDModifiers) -> Bool {
					return lhs.hashValue == rhs.hashValue
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
			
			override public var hashValue: Int {
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
				modifiers?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
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
			
		}
		
		
		public class GetDogmaEffectsInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Dogma.GetDogmaEffectsInternalServerError, rhs: Dogma.GetDogmaEffectsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetDogmaEffectsEffectIDNotFound: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Dogma.GetDogmaEffectsEffectIDNotFound, rhs: Dogma.GetDogmaEffectsEffectIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetDogmaEffectsEffectIDInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Dogma.GetDogmaEffectsEffectIDInternalServerError, rhs: Dogma.GetDogmaEffectsEffectIDInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetDogmaAttributesAttributeIDInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Dogma.GetDogmaAttributesAttributeIDInternalServerError, rhs: Dogma.GetDogmaAttributesAttributeIDInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetDogmaAttributesAttributeIDNotFound: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Dogma.GetDogmaAttributesAttributeIDNotFound, rhs: Dogma.GetDogmaAttributesAttributeIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class Attribute: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			override public var hashValue: Int {
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
			
		}
		
		
		public class GetDogmaAttributesInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Dogma.GetDogmaAttributesInternalServerError, rhs: Dogma.GetDogmaAttributesInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
	}
	
}
