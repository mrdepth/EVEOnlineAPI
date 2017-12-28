import Foundation
import Alamofire


public extension ESI {
	public var industry: Industry {
		return Industry(sessionManager: self)
	}
	
	class Industry {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		public func listIndustryFacilities(completionBlock:((Result<[Industry.Facilities]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/industry/facilities/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Industry.Facilities]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func listCharacterIndustryJobs(characterID: Int, includeCompleted: Bool? = nil, completionBlock:((Result<[Industry.Job]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-industry.read_character_jobs.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = includeCompleted?.httpQuery {
				query.append(URLQueryItem(name: "include_completed", value: v))
			}
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/industry/jobs/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Industry.Job]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func observedCorporationMining(corporationID: Int, observerID: Int64, page: Int? = nil, completionBlock:((Result<[Industry.GetCorporationCorporationIDMiningObserversObserverIDOk]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-industry.read_corporation_mining.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v1/corporation/\(corporationID)/mining/observers/\(observerID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Industry.GetCorporationCorporationIDMiningObserversObserverIDOk]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func corporationMiningObservers(corporationID: Int, page: Int? = nil, completionBlock:((Result<[Industry.GetCorporationCorporationIDMiningObserversOk]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-industry.read_corporation_mining.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v1/corporation/\(corporationID)/mining/observers/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Industry.GetCorporationCorporationIDMiningObserversOk]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func listCorporationIndustryJobs(corporationID: Int, includeCompleted: Bool? = nil, page: Int? = nil, completionBlock:((Result<[Industry.GetCorporationsCorporationIDIndustryJobsOk]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-industry.read_corporation_jobs.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = includeCompleted?.httpQuery {
				query.append(URLQueryItem(name: "include_completed", value: v))
			}
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/industry/jobs/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Industry.GetCorporationsCorporationIDIndustryJobsOk]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func listSolarSystemCostIndices(completionBlock:((Result<[Industry.SolarSystemCostIndices]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/industry/systems/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Industry.SolarSystemCostIndices]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func characterMiningLedger(characterID: Int, page: Int? = nil, completionBlock:((Result<[Industry.GetCharactersCharacterIDMiningOk]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-industry.read_character_mining.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v1/characters/\(characterID)/mining/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Industry.GetCharactersCharacterIDMiningOk]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func moonExtractionTimers(corporationID: Int, completionBlock:((Result<[Industry.GetCorporationCorporationIDMiningExtractionsOk]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-industry.read_corporation_mining.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/corporation/\(corporationID)/mining/extractions/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Industry.GetCorporationCorporationIDMiningExtractionsOk]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		@objc(ESIIndustryGetCharactersCharacterIDMiningOk) public class GetCharactersCharacterIDMiningOk: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var date: Date = Date()
			public var quantity: Int64 = Int64()
			public var solarSystemID: Int = Int()
			public var typeID: Int = Int()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let date = DateFormatter.esiDateFormatter.date(from: dictionary["date"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.date = date
				guard let quantity = dictionary["quantity"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.quantity = quantity
				guard let solarSystemID = dictionary["solar_system_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.solarSystemID = solarSystemID
				guard let typeID = dictionary["type_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.typeID = typeID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				date = aDecoder.decodeObject(forKey: "date") as? Date ?? Date()
				quantity = aDecoder.decodeInt64(forKey: "quantity")
				solarSystemID = aDecoder.decodeInteger(forKey: "solar_system_id")
				typeID = aDecoder.decodeInteger(forKey: "type_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(date, forKey: "date")
				aCoder.encode(quantity, forKey: "quantity")
				aCoder.encode(solarSystemID, forKey: "solar_system_id")
				aCoder.encode(typeID, forKey: "type_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["date"] = date.json
				json["quantity"] = quantity.json
				json["solar_system_id"] = solarSystemID.json
				json["type_id"] = typeID.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.date.hashValue)
				hashCombine(seed: &hash, value: self.quantity.hashValue)
				hashCombine(seed: &hash, value: self.solarSystemID.hashValue)
				hashCombine(seed: &hash, value: self.typeID.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Industry.GetCharactersCharacterIDMiningOk, rhs: Industry.GetCharactersCharacterIDMiningOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Industry.GetCharactersCharacterIDMiningOk) {
				date = other.date
				quantity = other.quantity
				solarSystemID = other.solarSystemID
				typeID = other.typeID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Industry.GetCharactersCharacterIDMiningOk(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCharactersCharacterIDMiningOk)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIIndustryGetCorporationCorporationIDMiningObserversOk) public class GetCorporationCorporationIDMiningObserversOk: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public enum GetCorporationCorporationIDMiningObserversObserverType: String, JSONCoding, HTTPQueryable {
				case structure = "structure"
				
				public init() {
					self = .structure
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCorporationCorporationIDMiningObserversObserverType(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var lastUpdated: Date = Date()
			public var observerID: Int64 = Int64()
			public var observerType: Industry.GetCorporationCorporationIDMiningObserversOk.GetCorporationCorporationIDMiningObserversObserverType = Industry.GetCorporationCorporationIDMiningObserversOk.GetCorporationCorporationIDMiningObserversObserverType()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let lastUpdated = DateFormatter.esiDateFormatter.date(from: dictionary["last_updated"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.lastUpdated = lastUpdated
				guard let observerID = dictionary["observer_id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.observerID = observerID
				guard let observerType = Industry.GetCorporationCorporationIDMiningObserversOk.GetCorporationCorporationIDMiningObserversObserverType(rawValue: dictionary["observer_type"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.observerType = observerType
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				lastUpdated = aDecoder.decodeObject(forKey: "last_updated") as? Date ?? Date()
				observerID = aDecoder.decodeInt64(forKey: "observer_id")
				observerType = Industry.GetCorporationCorporationIDMiningObserversOk.GetCorporationCorporationIDMiningObserversObserverType(rawValue: aDecoder.decodeObject(forKey: "observer_type") as? String ?? "") ?? Industry.GetCorporationCorporationIDMiningObserversOk.GetCorporationCorporationIDMiningObserversObserverType()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(lastUpdated, forKey: "last_updated")
				aCoder.encode(observerID, forKey: "observer_id")
				aCoder.encode(observerType.rawValue, forKey: "observer_type")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["last_updated"] = lastUpdated.json
				json["observer_id"] = observerID.json
				json["observer_type"] = observerType.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.lastUpdated.hashValue)
				hashCombine(seed: &hash, value: self.observerID.hashValue)
				hashCombine(seed: &hash, value: self.observerType.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Industry.GetCorporationCorporationIDMiningObserversOk, rhs: Industry.GetCorporationCorporationIDMiningObserversOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Industry.GetCorporationCorporationIDMiningObserversOk) {
				lastUpdated = other.lastUpdated
				observerID = other.observerID
				observerType = other.observerType
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Industry.GetCorporationCorporationIDMiningObserversOk(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCorporationCorporationIDMiningObserversOk)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIIndustrySolarSystemCostIndices) public class SolarSystemCostIndices: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			@objc(ESIIndustrySolarSystemCostIndicesGetIndustrySystemsCostIndices) public class GetIndustrySystemsCostIndices: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				public enum GetIndustrySystemsActivity: String, JSONCoding, HTTPQueryable {
					case copying = "copying"
					case duplicating = "duplicating"
					case invention = "invention"
					case manufacturing = "manufacturing"
					case none = "none"
					case reaction = "reaction"
					case researchingMaterialEfficiency = "researching_material_efficiency"
					case researchingTechnology = "researching_technology"
					case researchingTimeEfficiency = "researching_time_efficiency"
					case reverseEngineering = "reverse_engineering"
					
					public init() {
						self = .copying
					}
					
					public var json: Any {
						return self.rawValue
					}
					
					public init(json: Any) throws {
						guard let s = json as? String, let v = GetIndustrySystemsActivity(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
						self = v
					}
					
					public var httpQuery: String? {
						return rawValue
					}
					
				}
				
				public var activity: Industry.SolarSystemCostIndices.GetIndustrySystemsCostIndices.GetIndustrySystemsActivity = Industry.SolarSystemCostIndices.GetIndustrySystemsCostIndices.GetIndustrySystemsActivity()
				public var costIndex: Float = Float()
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let activity = Industry.SolarSystemCostIndices.GetIndustrySystemsCostIndices.GetIndustrySystemsActivity(rawValue: dictionary["activity"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.activity = activity
					guard let costIndex = dictionary["cost_index"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.costIndex = costIndex
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init?(coder aDecoder: NSCoder) {
					activity = Industry.SolarSystemCostIndices.GetIndustrySystemsCostIndices.GetIndustrySystemsActivity(rawValue: aDecoder.decodeObject(forKey: "activity") as? String ?? "") ?? Industry.SolarSystemCostIndices.GetIndustrySystemsCostIndices.GetIndustrySystemsActivity()
					costIndex = aDecoder.decodeFloat(forKey: "cost_index")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(activity.rawValue, forKey: "activity")
					aCoder.encode(costIndex, forKey: "cost_index")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["activity"] = activity.json
					json["cost_index"] = costIndex.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.activity.hashValue)
					hashCombine(seed: &hash, value: self.costIndex.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: Industry.SolarSystemCostIndices.GetIndustrySystemsCostIndices, rhs: Industry.SolarSystemCostIndices.GetIndustrySystemsCostIndices) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Industry.SolarSystemCostIndices.GetIndustrySystemsCostIndices) {
					activity = other.activity
					costIndex = other.costIndex
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Industry.SolarSystemCostIndices.GetIndustrySystemsCostIndices(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetIndustrySystemsCostIndices)?.hashValue == hashValue
				}
				
			}
			
			public var costIndices: [Industry.SolarSystemCostIndices.GetIndustrySystemsCostIndices] = []
			public var solarSystemID: Int = Int()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				costIndices = try (dictionary["cost_indices"] as? [Any])?.map {try Industry.SolarSystemCostIndices.GetIndustrySystemsCostIndices(json: $0)} ?? []
				guard let solarSystemID = dictionary["solar_system_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.solarSystemID = solarSystemID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				costIndices = aDecoder.decodeObject(of: [Industry.SolarSystemCostIndices.GetIndustrySystemsCostIndices.self], forKey: "cost_indices") as? [Industry.SolarSystemCostIndices.GetIndustrySystemsCostIndices] ?? []
				solarSystemID = aDecoder.decodeInteger(forKey: "solar_system_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(costIndices, forKey: "cost_indices")
				aCoder.encode(solarSystemID, forKey: "solar_system_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["cost_indices"] = costIndices.json
				json["solar_system_id"] = solarSystemID.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.costIndices.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: self.solarSystemID.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Industry.SolarSystemCostIndices, rhs: Industry.SolarSystemCostIndices) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Industry.SolarSystemCostIndices) {
				costIndices = other.costIndices.flatMap { Industry.SolarSystemCostIndices.GetIndustrySystemsCostIndices($0) }
				solarSystemID = other.solarSystemID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Industry.SolarSystemCostIndices(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? SolarSystemCostIndices)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIIndustryGetCorporationCorporationIDMiningExtractionsOk) public class GetCorporationCorporationIDMiningExtractionsOk: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var chunkArrivalTime: Date = Date()
			public var extractionStartTime: Date = Date()
			public var moonID: Int = Int()
			public var naturalDecayTime: Date = Date()
			public var structureID: Int64 = Int64()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let chunkArrivalTime = DateFormatter.esiDateTimeFormatter.date(from: dictionary["chunk_arrival_time"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.chunkArrivalTime = chunkArrivalTime
				guard let extractionStartTime = DateFormatter.esiDateTimeFormatter.date(from: dictionary["extraction_start_time"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.extractionStartTime = extractionStartTime
				guard let moonID = dictionary["moon_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.moonID = moonID
				guard let naturalDecayTime = DateFormatter.esiDateTimeFormatter.date(from: dictionary["natural_decay_time"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.naturalDecayTime = naturalDecayTime
				guard let structureID = dictionary["structure_id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.structureID = structureID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				chunkArrivalTime = aDecoder.decodeObject(forKey: "chunk_arrival_time") as? Date ?? Date()
				extractionStartTime = aDecoder.decodeObject(forKey: "extraction_start_time") as? Date ?? Date()
				moonID = aDecoder.decodeInteger(forKey: "moon_id")
				naturalDecayTime = aDecoder.decodeObject(forKey: "natural_decay_time") as? Date ?? Date()
				structureID = aDecoder.decodeInt64(forKey: "structure_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(chunkArrivalTime, forKey: "chunk_arrival_time")
				aCoder.encode(extractionStartTime, forKey: "extraction_start_time")
				aCoder.encode(moonID, forKey: "moon_id")
				aCoder.encode(naturalDecayTime, forKey: "natural_decay_time")
				aCoder.encode(structureID, forKey: "structure_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["chunk_arrival_time"] = chunkArrivalTime.json
				json["extraction_start_time"] = extractionStartTime.json
				json["moon_id"] = moonID.json
				json["natural_decay_time"] = naturalDecayTime.json
				json["structure_id"] = structureID.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.chunkArrivalTime.hashValue)
				hashCombine(seed: &hash, value: self.extractionStartTime.hashValue)
				hashCombine(seed: &hash, value: self.moonID.hashValue)
				hashCombine(seed: &hash, value: self.naturalDecayTime.hashValue)
				hashCombine(seed: &hash, value: self.structureID.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Industry.GetCorporationCorporationIDMiningExtractionsOk, rhs: Industry.GetCorporationCorporationIDMiningExtractionsOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Industry.GetCorporationCorporationIDMiningExtractionsOk) {
				chunkArrivalTime = other.chunkArrivalTime
				extractionStartTime = other.extractionStartTime
				moonID = other.moonID
				naturalDecayTime = other.naturalDecayTime
				structureID = other.structureID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Industry.GetCorporationCorporationIDMiningExtractionsOk(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCorporationCorporationIDMiningExtractionsOk)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIIndustryFacilities) public class Facilities: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var facilityID: Int64 = Int64()
			public var ownerID: Int = Int()
			public var regionID: Int = Int()
			public var solarSystemID: Int = Int()
			public var tax: Float? = nil
			public var typeID: Int = Int()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let facilityID = dictionary["facility_id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.facilityID = facilityID
				guard let ownerID = dictionary["owner_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.ownerID = ownerID
				guard let regionID = dictionary["region_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.regionID = regionID
				guard let solarSystemID = dictionary["solar_system_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.solarSystemID = solarSystemID
				tax = dictionary["tax"] as? Float
				guard let typeID = dictionary["type_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.typeID = typeID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				facilityID = aDecoder.decodeInt64(forKey: "facility_id")
				ownerID = aDecoder.decodeInteger(forKey: "owner_id")
				regionID = aDecoder.decodeInteger(forKey: "region_id")
				solarSystemID = aDecoder.decodeInteger(forKey: "solar_system_id")
				tax = aDecoder.containsValue(forKey: "tax") ? aDecoder.decodeFloat(forKey: "tax") : nil
				typeID = aDecoder.decodeInteger(forKey: "type_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(facilityID, forKey: "facility_id")
				aCoder.encode(ownerID, forKey: "owner_id")
				aCoder.encode(regionID, forKey: "region_id")
				aCoder.encode(solarSystemID, forKey: "solar_system_id")
				if let v = tax {
					aCoder.encode(v, forKey: "tax")
				}
				aCoder.encode(typeID, forKey: "type_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["facility_id"] = facilityID.json
				json["owner_id"] = ownerID.json
				json["region_id"] = regionID.json
				json["solar_system_id"] = solarSystemID.json
				if let v = tax?.json {
					json["tax"] = v
				}
				json["type_id"] = typeID.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.facilityID.hashValue)
				hashCombine(seed: &hash, value: self.ownerID.hashValue)
				hashCombine(seed: &hash, value: self.regionID.hashValue)
				hashCombine(seed: &hash, value: self.solarSystemID.hashValue)
				hashCombine(seed: &hash, value: self.tax?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.typeID.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Industry.Facilities, rhs: Industry.Facilities) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Industry.Facilities) {
				facilityID = other.facilityID
				ownerID = other.ownerID
				regionID = other.regionID
				solarSystemID = other.solarSystemID
				tax = other.tax
				typeID = other.typeID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Industry.Facilities(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Facilities)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIIndustryGetCorporationsCorporationIDIndustryJobsOk) public class GetCorporationsCorporationIDIndustryJobsOk: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public enum GetCorporationsCorporationIDIndustryJobsStatus: String, JSONCoding, HTTPQueryable {
				case active = "active"
				case cancelled = "cancelled"
				case delivered = "delivered"
				case paused = "paused"
				case ready = "ready"
				case reverted = "reverted"
				
				public init() {
					self = .active
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCorporationsCorporationIDIndustryJobsStatus(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var activityID: Int = Int()
			public var blueprintID: Int64 = Int64()
			public var blueprintLocationID: Int64 = Int64()
			public var blueprintTypeID: Int = Int()
			public var completedCharacterID: Int? = nil
			public var completedDate: Date? = nil
			public var cost: Double? = nil
			public var duration: Int = Int()
			public var endDate: Date = Date()
			public var facilityID: Int64 = Int64()
			public var installerID: Int = Int()
			public var jobID: Int = Int()
			public var licensedRuns: Int? = nil
			public var locationID: Int64 = Int64()
			public var outputLocationID: Int64 = Int64()
			public var pauseDate: Date? = nil
			public var probability: Float? = nil
			public var productTypeID: Int? = nil
			public var runs: Int = Int()
			public var startDate: Date = Date()
			public var status: Industry.GetCorporationsCorporationIDIndustryJobsOk.GetCorporationsCorporationIDIndustryJobsStatus = Industry.GetCorporationsCorporationIDIndustryJobsOk.GetCorporationsCorporationIDIndustryJobsStatus()
			public var successfulRuns: Int? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let activityID = dictionary["activity_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.activityID = activityID
				guard let blueprintID = dictionary["blueprint_id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.blueprintID = blueprintID
				guard let blueprintLocationID = dictionary["blueprint_location_id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.blueprintLocationID = blueprintLocationID
				guard let blueprintTypeID = dictionary["blueprint_type_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.blueprintTypeID = blueprintTypeID
				completedCharacterID = dictionary["completed_character_id"] as? Int
				completedDate = DateFormatter.esiDateTimeFormatter.date(from: dictionary["completed_date"] as? String ?? "")
				cost = dictionary["cost"] as? Double
				guard let duration = dictionary["duration"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.duration = duration
				guard let endDate = DateFormatter.esiDateTimeFormatter.date(from: dictionary["end_date"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.endDate = endDate
				guard let facilityID = dictionary["facility_id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.facilityID = facilityID
				guard let installerID = dictionary["installer_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.installerID = installerID
				guard let jobID = dictionary["job_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.jobID = jobID
				licensedRuns = dictionary["licensed_runs"] as? Int
				guard let locationID = dictionary["location_id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.locationID = locationID
				guard let outputLocationID = dictionary["output_location_id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.outputLocationID = outputLocationID
				pauseDate = DateFormatter.esiDateTimeFormatter.date(from: dictionary["pause_date"] as? String ?? "")
				probability = dictionary["probability"] as? Float
				productTypeID = dictionary["product_type_id"] as? Int
				guard let runs = dictionary["runs"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.runs = runs
				guard let startDate = DateFormatter.esiDateTimeFormatter.date(from: dictionary["start_date"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.startDate = startDate
				guard let status = Industry.GetCorporationsCorporationIDIndustryJobsOk.GetCorporationsCorporationIDIndustryJobsStatus(rawValue: dictionary["status"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.status = status
				successfulRuns = dictionary["successful_runs"] as? Int
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				activityID = aDecoder.decodeInteger(forKey: "activity_id")
				blueprintID = aDecoder.decodeInt64(forKey: "blueprint_id")
				blueprintLocationID = aDecoder.decodeInt64(forKey: "blueprint_location_id")
				blueprintTypeID = aDecoder.decodeInteger(forKey: "blueprint_type_id")
				completedCharacterID = aDecoder.containsValue(forKey: "completed_character_id") ? aDecoder.decodeInteger(forKey: "completed_character_id") : nil
				completedDate = aDecoder.decodeObject(forKey: "completed_date") as? Date
				cost = aDecoder.containsValue(forKey: "cost") ? aDecoder.decodeDouble(forKey: "cost") : nil
				duration = aDecoder.decodeInteger(forKey: "duration")
				endDate = aDecoder.decodeObject(forKey: "end_date") as? Date ?? Date()
				facilityID = aDecoder.decodeInt64(forKey: "facility_id")
				installerID = aDecoder.decodeInteger(forKey: "installer_id")
				jobID = aDecoder.decodeInteger(forKey: "job_id")
				licensedRuns = aDecoder.containsValue(forKey: "licensed_runs") ? aDecoder.decodeInteger(forKey: "licensed_runs") : nil
				locationID = aDecoder.decodeInt64(forKey: "location_id")
				outputLocationID = aDecoder.decodeInt64(forKey: "output_location_id")
				pauseDate = aDecoder.decodeObject(forKey: "pause_date") as? Date
				probability = aDecoder.containsValue(forKey: "probability") ? aDecoder.decodeFloat(forKey: "probability") : nil
				productTypeID = aDecoder.containsValue(forKey: "product_type_id") ? aDecoder.decodeInteger(forKey: "product_type_id") : nil
				runs = aDecoder.decodeInteger(forKey: "runs")
				startDate = aDecoder.decodeObject(forKey: "start_date") as? Date ?? Date()
				status = Industry.GetCorporationsCorporationIDIndustryJobsOk.GetCorporationsCorporationIDIndustryJobsStatus(rawValue: aDecoder.decodeObject(forKey: "status") as? String ?? "") ?? Industry.GetCorporationsCorporationIDIndustryJobsOk.GetCorporationsCorporationIDIndustryJobsStatus()
				successfulRuns = aDecoder.containsValue(forKey: "successful_runs") ? aDecoder.decodeInteger(forKey: "successful_runs") : nil
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(activityID, forKey: "activity_id")
				aCoder.encode(blueprintID, forKey: "blueprint_id")
				aCoder.encode(blueprintLocationID, forKey: "blueprint_location_id")
				aCoder.encode(blueprintTypeID, forKey: "blueprint_type_id")
				if let v = completedCharacterID {
					aCoder.encode(v, forKey: "completed_character_id")
				}
				if let v = completedDate {
					aCoder.encode(v, forKey: "completed_date")
				}
				if let v = cost {
					aCoder.encode(v, forKey: "cost")
				}
				aCoder.encode(duration, forKey: "duration")
				aCoder.encode(endDate, forKey: "end_date")
				aCoder.encode(facilityID, forKey: "facility_id")
				aCoder.encode(installerID, forKey: "installer_id")
				aCoder.encode(jobID, forKey: "job_id")
				if let v = licensedRuns {
					aCoder.encode(v, forKey: "licensed_runs")
				}
				aCoder.encode(locationID, forKey: "location_id")
				aCoder.encode(outputLocationID, forKey: "output_location_id")
				if let v = pauseDate {
					aCoder.encode(v, forKey: "pause_date")
				}
				if let v = probability {
					aCoder.encode(v, forKey: "probability")
				}
				if let v = productTypeID {
					aCoder.encode(v, forKey: "product_type_id")
				}
				aCoder.encode(runs, forKey: "runs")
				aCoder.encode(startDate, forKey: "start_date")
				aCoder.encode(status.rawValue, forKey: "status")
				if let v = successfulRuns {
					aCoder.encode(v, forKey: "successful_runs")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["activity_id"] = activityID.json
				json["blueprint_id"] = blueprintID.json
				json["blueprint_location_id"] = blueprintLocationID.json
				json["blueprint_type_id"] = blueprintTypeID.json
				if let v = completedCharacterID?.json {
					json["completed_character_id"] = v
				}
				if let v = completedDate?.json {
					json["completed_date"] = v
				}
				if let v = cost?.json {
					json["cost"] = v
				}
				json["duration"] = duration.json
				json["end_date"] = endDate.json
				json["facility_id"] = facilityID.json
				json["installer_id"] = installerID.json
				json["job_id"] = jobID.json
				if let v = licensedRuns?.json {
					json["licensed_runs"] = v
				}
				json["location_id"] = locationID.json
				json["output_location_id"] = outputLocationID.json
				if let v = pauseDate?.json {
					json["pause_date"] = v
				}
				if let v = probability?.json {
					json["probability"] = v
				}
				if let v = productTypeID?.json {
					json["product_type_id"] = v
				}
				json["runs"] = runs.json
				json["start_date"] = startDate.json
				json["status"] = status.json
				if let v = successfulRuns?.json {
					json["successful_runs"] = v
				}
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.activityID.hashValue)
				hashCombine(seed: &hash, value: self.blueprintID.hashValue)
				hashCombine(seed: &hash, value: self.blueprintLocationID.hashValue)
				hashCombine(seed: &hash, value: self.blueprintTypeID.hashValue)
				hashCombine(seed: &hash, value: self.completedCharacterID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.completedDate?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.cost?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.duration.hashValue)
				hashCombine(seed: &hash, value: self.endDate.hashValue)
				hashCombine(seed: &hash, value: self.facilityID.hashValue)
				hashCombine(seed: &hash, value: self.installerID.hashValue)
				hashCombine(seed: &hash, value: self.jobID.hashValue)
				hashCombine(seed: &hash, value: self.licensedRuns?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.locationID.hashValue)
				hashCombine(seed: &hash, value: self.outputLocationID.hashValue)
				hashCombine(seed: &hash, value: self.pauseDate?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.probability?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.productTypeID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.runs.hashValue)
				hashCombine(seed: &hash, value: self.startDate.hashValue)
				hashCombine(seed: &hash, value: self.status.hashValue)
				hashCombine(seed: &hash, value: self.successfulRuns?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Industry.GetCorporationsCorporationIDIndustryJobsOk, rhs: Industry.GetCorporationsCorporationIDIndustryJobsOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Industry.GetCorporationsCorporationIDIndustryJobsOk) {
				activityID = other.activityID
				blueprintID = other.blueprintID
				blueprintLocationID = other.blueprintLocationID
				blueprintTypeID = other.blueprintTypeID
				completedCharacterID = other.completedCharacterID
				completedDate = other.completedDate
				cost = other.cost
				duration = other.duration
				endDate = other.endDate
				facilityID = other.facilityID
				installerID = other.installerID
				jobID = other.jobID
				licensedRuns = other.licensedRuns
				locationID = other.locationID
				outputLocationID = other.outputLocationID
				pauseDate = other.pauseDate
				probability = other.probability
				productTypeID = other.productTypeID
				runs = other.runs
				startDate = other.startDate
				status = other.status
				successfulRuns = other.successfulRuns
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Industry.GetCorporationsCorporationIDIndustryJobsOk(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCorporationsCorporationIDIndustryJobsOk)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIIndustryGetCorporationCorporationIDMiningObserversObserverIDOk) public class GetCorporationCorporationIDMiningObserversObserverIDOk: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var characterID: Int = Int()
			public var lastUpdated: Date = Date()
			public var quantity: Int64 = Int64()
			public var recordedCorporationID: Int = Int()
			public var typeID: Int = Int()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let characterID = dictionary["character_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.characterID = characterID
				guard let lastUpdated = DateFormatter.esiDateFormatter.date(from: dictionary["last_updated"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.lastUpdated = lastUpdated
				guard let quantity = dictionary["quantity"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.quantity = quantity
				guard let recordedCorporationID = dictionary["recorded_corporation_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.recordedCorporationID = recordedCorporationID
				guard let typeID = dictionary["type_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.typeID = typeID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				characterID = aDecoder.decodeInteger(forKey: "character_id")
				lastUpdated = aDecoder.decodeObject(forKey: "last_updated") as? Date ?? Date()
				quantity = aDecoder.decodeInt64(forKey: "quantity")
				recordedCorporationID = aDecoder.decodeInteger(forKey: "recorded_corporation_id")
				typeID = aDecoder.decodeInteger(forKey: "type_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(characterID, forKey: "character_id")
				aCoder.encode(lastUpdated, forKey: "last_updated")
				aCoder.encode(quantity, forKey: "quantity")
				aCoder.encode(recordedCorporationID, forKey: "recorded_corporation_id")
				aCoder.encode(typeID, forKey: "type_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["character_id"] = characterID.json
				json["last_updated"] = lastUpdated.json
				json["quantity"] = quantity.json
				json["recorded_corporation_id"] = recordedCorporationID.json
				json["type_id"] = typeID.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.characterID.hashValue)
				hashCombine(seed: &hash, value: self.lastUpdated.hashValue)
				hashCombine(seed: &hash, value: self.quantity.hashValue)
				hashCombine(seed: &hash, value: self.recordedCorporationID.hashValue)
				hashCombine(seed: &hash, value: self.typeID.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Industry.GetCorporationCorporationIDMiningObserversObserverIDOk, rhs: Industry.GetCorporationCorporationIDMiningObserversObserverIDOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Industry.GetCorporationCorporationIDMiningObserversObserverIDOk) {
				characterID = other.characterID
				lastUpdated = other.lastUpdated
				quantity = other.quantity
				recordedCorporationID = other.recordedCorporationID
				typeID = other.typeID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Industry.GetCorporationCorporationIDMiningObserversObserverIDOk(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCorporationCorporationIDMiningObserversObserverIDOk)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIIndustryJob) public class Job: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public enum Status: String, JSONCoding, HTTPQueryable {
				case active = "active"
				case cancelled = "cancelled"
				case delivered = "delivered"
				case paused = "paused"
				case ready = "ready"
				case reverted = "reverted"
				
				public init() {
					self = .active
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = Status(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var activityID: Int = Int()
			public var blueprintID: Int64 = Int64()
			public var blueprintLocationID: Int64 = Int64()
			public var blueprintTypeID: Int = Int()
			public var completedCharacterID: Int? = nil
			public var completedDate: Date? = nil
			public var cost: Double? = nil
			public var duration: Int = Int()
			public var endDate: Date = Date()
			public var facilityID: Int64 = Int64()
			public var installerID: Int = Int()
			public var jobID: Int = Int()
			public var licensedRuns: Int? = nil
			public var outputLocationID: Int64 = Int64()
			public var pauseDate: Date? = nil
			public var probability: Float? = nil
			public var productTypeID: Int? = nil
			public var runs: Int = Int()
			public var startDate: Date = Date()
			public var stationID: Int64 = Int64()
			public var status: Industry.Job.Status = Industry.Job.Status()
			public var successfulRuns: Int? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let activityID = dictionary["activity_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.activityID = activityID
				guard let blueprintID = dictionary["blueprint_id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.blueprintID = blueprintID
				guard let blueprintLocationID = dictionary["blueprint_location_id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.blueprintLocationID = blueprintLocationID
				guard let blueprintTypeID = dictionary["blueprint_type_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.blueprintTypeID = blueprintTypeID
				completedCharacterID = dictionary["completed_character_id"] as? Int
				completedDate = DateFormatter.esiDateTimeFormatter.date(from: dictionary["completed_date"] as? String ?? "")
				cost = dictionary["cost"] as? Double
				guard let duration = dictionary["duration"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.duration = duration
				guard let endDate = DateFormatter.esiDateTimeFormatter.date(from: dictionary["end_date"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.endDate = endDate
				guard let facilityID = dictionary["facility_id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.facilityID = facilityID
				guard let installerID = dictionary["installer_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.installerID = installerID
				guard let jobID = dictionary["job_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.jobID = jobID
				licensedRuns = dictionary["licensed_runs"] as? Int
				guard let outputLocationID = dictionary["output_location_id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.outputLocationID = outputLocationID
				pauseDate = DateFormatter.esiDateTimeFormatter.date(from: dictionary["pause_date"] as? String ?? "")
				probability = dictionary["probability"] as? Float
				productTypeID = dictionary["product_type_id"] as? Int
				guard let runs = dictionary["runs"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.runs = runs
				guard let startDate = DateFormatter.esiDateTimeFormatter.date(from: dictionary["start_date"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.startDate = startDate
				guard let stationID = dictionary["station_id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.stationID = stationID
				guard let status = Industry.Job.Status(rawValue: dictionary["status"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.status = status
				successfulRuns = dictionary["successful_runs"] as? Int
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				activityID = aDecoder.decodeInteger(forKey: "activity_id")
				blueprintID = aDecoder.decodeInt64(forKey: "blueprint_id")
				blueprintLocationID = aDecoder.decodeInt64(forKey: "blueprint_location_id")
				blueprintTypeID = aDecoder.decodeInteger(forKey: "blueprint_type_id")
				completedCharacterID = aDecoder.containsValue(forKey: "completed_character_id") ? aDecoder.decodeInteger(forKey: "completed_character_id") : nil
				completedDate = aDecoder.decodeObject(forKey: "completed_date") as? Date
				cost = aDecoder.containsValue(forKey: "cost") ? aDecoder.decodeDouble(forKey: "cost") : nil
				duration = aDecoder.decodeInteger(forKey: "duration")
				endDate = aDecoder.decodeObject(forKey: "end_date") as? Date ?? Date()
				facilityID = aDecoder.decodeInt64(forKey: "facility_id")
				installerID = aDecoder.decodeInteger(forKey: "installer_id")
				jobID = aDecoder.decodeInteger(forKey: "job_id")
				licensedRuns = aDecoder.containsValue(forKey: "licensed_runs") ? aDecoder.decodeInteger(forKey: "licensed_runs") : nil
				outputLocationID = aDecoder.decodeInt64(forKey: "output_location_id")
				pauseDate = aDecoder.decodeObject(forKey: "pause_date") as? Date
				probability = aDecoder.containsValue(forKey: "probability") ? aDecoder.decodeFloat(forKey: "probability") : nil
				productTypeID = aDecoder.containsValue(forKey: "product_type_id") ? aDecoder.decodeInteger(forKey: "product_type_id") : nil
				runs = aDecoder.decodeInteger(forKey: "runs")
				startDate = aDecoder.decodeObject(forKey: "start_date") as? Date ?? Date()
				stationID = aDecoder.decodeInt64(forKey: "station_id")
				status = Industry.Job.Status(rawValue: aDecoder.decodeObject(forKey: "status") as? String ?? "") ?? Industry.Job.Status()
				successfulRuns = aDecoder.containsValue(forKey: "successful_runs") ? aDecoder.decodeInteger(forKey: "successful_runs") : nil
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(activityID, forKey: "activity_id")
				aCoder.encode(blueprintID, forKey: "blueprint_id")
				aCoder.encode(blueprintLocationID, forKey: "blueprint_location_id")
				aCoder.encode(blueprintTypeID, forKey: "blueprint_type_id")
				if let v = completedCharacterID {
					aCoder.encode(v, forKey: "completed_character_id")
				}
				if let v = completedDate {
					aCoder.encode(v, forKey: "completed_date")
				}
				if let v = cost {
					aCoder.encode(v, forKey: "cost")
				}
				aCoder.encode(duration, forKey: "duration")
				aCoder.encode(endDate, forKey: "end_date")
				aCoder.encode(facilityID, forKey: "facility_id")
				aCoder.encode(installerID, forKey: "installer_id")
				aCoder.encode(jobID, forKey: "job_id")
				if let v = licensedRuns {
					aCoder.encode(v, forKey: "licensed_runs")
				}
				aCoder.encode(outputLocationID, forKey: "output_location_id")
				if let v = pauseDate {
					aCoder.encode(v, forKey: "pause_date")
				}
				if let v = probability {
					aCoder.encode(v, forKey: "probability")
				}
				if let v = productTypeID {
					aCoder.encode(v, forKey: "product_type_id")
				}
				aCoder.encode(runs, forKey: "runs")
				aCoder.encode(startDate, forKey: "start_date")
				aCoder.encode(stationID, forKey: "station_id")
				aCoder.encode(status.rawValue, forKey: "status")
				if let v = successfulRuns {
					aCoder.encode(v, forKey: "successful_runs")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["activity_id"] = activityID.json
				json["blueprint_id"] = blueprintID.json
				json["blueprint_location_id"] = blueprintLocationID.json
				json["blueprint_type_id"] = blueprintTypeID.json
				if let v = completedCharacterID?.json {
					json["completed_character_id"] = v
				}
				if let v = completedDate?.json {
					json["completed_date"] = v
				}
				if let v = cost?.json {
					json["cost"] = v
				}
				json["duration"] = duration.json
				json["end_date"] = endDate.json
				json["facility_id"] = facilityID.json
				json["installer_id"] = installerID.json
				json["job_id"] = jobID.json
				if let v = licensedRuns?.json {
					json["licensed_runs"] = v
				}
				json["output_location_id"] = outputLocationID.json
				if let v = pauseDate?.json {
					json["pause_date"] = v
				}
				if let v = probability?.json {
					json["probability"] = v
				}
				if let v = productTypeID?.json {
					json["product_type_id"] = v
				}
				json["runs"] = runs.json
				json["start_date"] = startDate.json
				json["station_id"] = stationID.json
				json["status"] = status.json
				if let v = successfulRuns?.json {
					json["successful_runs"] = v
				}
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.activityID.hashValue)
				hashCombine(seed: &hash, value: self.blueprintID.hashValue)
				hashCombine(seed: &hash, value: self.blueprintLocationID.hashValue)
				hashCombine(seed: &hash, value: self.blueprintTypeID.hashValue)
				hashCombine(seed: &hash, value: self.completedCharacterID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.completedDate?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.cost?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.duration.hashValue)
				hashCombine(seed: &hash, value: self.endDate.hashValue)
				hashCombine(seed: &hash, value: self.facilityID.hashValue)
				hashCombine(seed: &hash, value: self.installerID.hashValue)
				hashCombine(seed: &hash, value: self.jobID.hashValue)
				hashCombine(seed: &hash, value: self.licensedRuns?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.outputLocationID.hashValue)
				hashCombine(seed: &hash, value: self.pauseDate?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.probability?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.productTypeID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.runs.hashValue)
				hashCombine(seed: &hash, value: self.startDate.hashValue)
				hashCombine(seed: &hash, value: self.stationID.hashValue)
				hashCombine(seed: &hash, value: self.status.hashValue)
				hashCombine(seed: &hash, value: self.successfulRuns?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Industry.Job, rhs: Industry.Job) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Industry.Job) {
				activityID = other.activityID
				blueprintID = other.blueprintID
				blueprintLocationID = other.blueprintLocationID
				blueprintTypeID = other.blueprintTypeID
				completedCharacterID = other.completedCharacterID
				completedDate = other.completedDate
				cost = other.cost
				duration = other.duration
				endDate = other.endDate
				facilityID = other.facilityID
				installerID = other.installerID
				jobID = other.jobID
				licensedRuns = other.licensedRuns
				outputLocationID = other.outputLocationID
				pauseDate = other.pauseDate
				probability = other.probability
				productTypeID = other.productTypeID
				runs = other.runs
				startDate = other.startDate
				stationID = other.stationID
				status = other.status
				successfulRuns = other.successfulRuns
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Industry.Job(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Job)?.hashValue == hashValue
			}
			
		}
		
		
	}
	
}
