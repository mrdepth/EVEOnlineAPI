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
			
			
			
			let url = session!.baseURL + "latest/industry/facilities/"
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
		
		public func listCharacterIndustryJobs(characterID: Int, includeCompleted: Bool? = nil, completionBlock:((Result<[Industry.GetCharactersCharacterIDIndustryJobsOk]>) -> Void)?) {
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
			
			let url = session!.baseURL + "latest/characters/\(characterID)/industry/jobs/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Industry.GetCharactersCharacterIDIndustryJobsOk]>) in
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
			
			
			
			let url = session!.baseURL + "latest/industry/systems/"
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
		
		
		public class GetCharactersCharacterIDIndustryJobsInternalServerError: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			public static func ==(lhs: Industry.GetCharactersCharacterIDIndustryJobsInternalServerError, rhs: Industry.GetCharactersCharacterIDIndustryJobsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Industry.GetCharactersCharacterIDIndustryJobsInternalServerError) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Industry.GetCharactersCharacterIDIndustryJobsInternalServerError(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCharactersCharacterIDIndustryJobsInternalServerError)?.hashValue == hashValue
			}
			
		}
		
		
		public class GetIndustrySystemsInternalServerError: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			public static func ==(lhs: Industry.GetIndustrySystemsInternalServerError, rhs: Industry.GetIndustrySystemsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Industry.GetIndustrySystemsInternalServerError) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Industry.GetIndustrySystemsInternalServerError(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetIndustrySystemsInternalServerError)?.hashValue == hashValue
			}
			
		}
		
		
		public class GetCharactersCharacterIDIndustryJobsOk: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public enum GetCharactersCharacterIDIndustryJobsStatus: String, JSONCoding, HTTPQueryable {
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
					guard let s = json as? String, let v = GetCharactersCharacterIDIndustryJobsStatus(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
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
			public var cost: Float? = nil
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
			public var status: Industry.GetCharactersCharacterIDIndustryJobsOk.GetCharactersCharacterIDIndustryJobsStatus = Industry.GetCharactersCharacterIDIndustryJobsOk.GetCharactersCharacterIDIndustryJobsStatus()
			public var successfulRuns: Int? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let activityID = dictionary["activity_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.activityID = activityID
				guard let blueprintID = dictionary["blueprint_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.blueprintID = blueprintID
				guard let blueprintLocationID = dictionary["blueprint_location_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.blueprintLocationID = blueprintLocationID
				guard let blueprintTypeID = dictionary["blueprint_type_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.blueprintTypeID = blueprintTypeID
				completedCharacterID = dictionary["completed_character_id"] as? Int
				completedDate = DateFormatter.esiDateFormatter.date(from: dictionary["completed_date"] as? String ?? "")
				cost = dictionary["cost"] as? Float
				guard let duration = dictionary["duration"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.duration = duration
				guard let endDate = DateFormatter.esiDateFormatter.date(from: dictionary["end_date"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.endDate = endDate
				guard let facilityID = dictionary["facility_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.facilityID = facilityID
				guard let installerID = dictionary["installer_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.installerID = installerID
				guard let jobID = dictionary["job_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.jobID = jobID
				licensedRuns = dictionary["licensed_runs"] as? Int
				guard let outputLocationID = dictionary["output_location_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.outputLocationID = outputLocationID
				pauseDate = DateFormatter.esiDateFormatter.date(from: dictionary["pause_date"] as? String ?? "")
				probability = dictionary["probability"] as? Float
				productTypeID = dictionary["product_type_id"] as? Int
				guard let runs = dictionary["runs"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.runs = runs
				guard let startDate = DateFormatter.esiDateFormatter.date(from: dictionary["start_date"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.startDate = startDate
				guard let stationID = dictionary["station_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.stationID = stationID
				guard let status = Industry.GetCharactersCharacterIDIndustryJobsOk.GetCharactersCharacterIDIndustryJobsStatus(rawValue: dictionary["status"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.status = status
				successfulRuns = dictionary["successful_runs"] as? Int
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				activityID = aDecoder.decodeInteger(forKey: "activity_id")
				blueprintID = aDecoder.decodeInt64(forKey: "blueprint_id")
				blueprintLocationID = aDecoder.decodeInt64(forKey: "blueprint_location_id")
				blueprintTypeID = aDecoder.decodeInteger(forKey: "blueprint_type_id")
				completedCharacterID = aDecoder.containsValue(forKey: "completed_character_id") ? aDecoder.decodeInteger(forKey: "completed_character_id") : nil
				completedDate = aDecoder.decodeObject(forKey: "completed_date") as? Date
				cost = aDecoder.containsValue(forKey: "cost") ? aDecoder.decodeFloat(forKey: "cost") : nil
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
				status = Industry.GetCharactersCharacterIDIndustryJobsOk.GetCharactersCharacterIDIndustryJobsStatus(rawValue: aDecoder.decodeObject(forKey: "status") as? String ?? "") ?? Industry.GetCharactersCharacterIDIndustryJobsOk.GetCharactersCharacterIDIndustryJobsStatus()
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: activityID.hashValue)
				hashCombine(seed: &hash, value: blueprintID.hashValue)
				hashCombine(seed: &hash, value: blueprintLocationID.hashValue)
				hashCombine(seed: &hash, value: blueprintTypeID.hashValue)
				hashCombine(seed: &hash, value: completedCharacterID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: completedDate?.hashValue ?? 0)
				hashCombine(seed: &hash, value: cost?.hashValue ?? 0)
				hashCombine(seed: &hash, value: duration.hashValue)
				hashCombine(seed: &hash, value: endDate.hashValue)
				hashCombine(seed: &hash, value: facilityID.hashValue)
				hashCombine(seed: &hash, value: installerID.hashValue)
				hashCombine(seed: &hash, value: jobID.hashValue)
				hashCombine(seed: &hash, value: licensedRuns?.hashValue ?? 0)
				hashCombine(seed: &hash, value: outputLocationID.hashValue)
				hashCombine(seed: &hash, value: pauseDate?.hashValue ?? 0)
				hashCombine(seed: &hash, value: probability?.hashValue ?? 0)
				hashCombine(seed: &hash, value: productTypeID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: runs.hashValue)
				hashCombine(seed: &hash, value: startDate.hashValue)
				hashCombine(seed: &hash, value: stationID.hashValue)
				hashCombine(seed: &hash, value: status.hashValue)
				hashCombine(seed: &hash, value: successfulRuns?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Industry.GetCharactersCharacterIDIndustryJobsOk, rhs: Industry.GetCharactersCharacterIDIndustryJobsOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Industry.GetCharactersCharacterIDIndustryJobsOk) {
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
				return Industry.GetCharactersCharacterIDIndustryJobsOk(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCharactersCharacterIDIndustryJobsOk)?.hashValue == hashValue
			}
			
		}
		
		
		public class GetIndustryFacilitiesInternalServerError: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			public static func ==(lhs: Industry.GetIndustryFacilitiesInternalServerError, rhs: Industry.GetIndustryFacilitiesInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Industry.GetIndustryFacilitiesInternalServerError) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Industry.GetIndustryFacilitiesInternalServerError(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetIndustryFacilitiesInternalServerError)?.hashValue == hashValue
			}
			
		}
		
		
		public class SolarSystemCostIndices: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class GetIndustrySystemsCostIndices: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				public enum GetIndustrySystemsActivity: String, JSONCoding, HTTPQueryable {
					case copying = "copying"
					case duplicating = "duplicating"
					case invention = "invention"
					case manufacturing = "manufacturing"
					case none = "none"
					case researchingMaterialEfficiency = "researching_material_efficiency"
					case researchingTechnology = "researching_technology"
					case researchingTimeEfficiency = "researching_time_efficiency"
					case reverseEngineering = "reverse_engineering"
					
					public init() {
						self = .none
					}
					
					public var json: Any {
						return self.rawValue
					}
					
					public init(json: Any) throws {
						guard let s = json as? String, let v = GetIndustrySystemsActivity(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
						self = v
					}
					
					public var httpQuery: String? {
						return rawValue
					}
					
				}
				
				public var activity: Industry.SolarSystemCostIndices.GetIndustrySystemsCostIndices.GetIndustrySystemsActivity = Industry.SolarSystemCostIndices.GetIndustrySystemsCostIndices.GetIndustrySystemsActivity()
				public var costIndex: Float = Float()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let activity = Industry.SolarSystemCostIndices.GetIndustrySystemsCostIndices.GetIndustrySystemsActivity(rawValue: dictionary["activity"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.activity = activity
					guard let costIndex = dictionary["cost_index"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.costIndex = costIndex
					
					super.init()
				}
				
				override public init() {
					super.init()
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: activity.hashValue)
					hashCombine(seed: &hash, value: costIndex.hashValue)
					return hash
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
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				costIndices = try (dictionary["cost_indices"] as? [Any])?.map {try Industry.SolarSystemCostIndices.GetIndustrySystemsCostIndices(json: $0)} ?? []
				guard let solarSystemID = dictionary["solar_system_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.solarSystemID = solarSystemID
				
				super.init()
			}
			
			override public init() {
				super.init()
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				costIndices.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: solarSystemID.hashValue)
				return hash
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
		
		
		public class Facilities: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var facilityID: Int64 = Int64()
			public var ownerID: Int = Int()
			public var regionID: Int = Int()
			public var solarSystemID: Int = Int()
			public var tax: Float? = nil
			public var typeID: Int = Int()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let facilityID = dictionary["facility_id"] as? Int64 else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.facilityID = facilityID
				guard let ownerID = dictionary["owner_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.ownerID = ownerID
				guard let regionID = dictionary["region_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.regionID = regionID
				guard let solarSystemID = dictionary["solar_system_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.solarSystemID = solarSystemID
				tax = dictionary["tax"] as? Float
				guard let typeID = dictionary["type_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.typeID = typeID
				
				super.init()
			}
			
			override public init() {
				super.init()
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: facilityID.hashValue)
				hashCombine(seed: &hash, value: ownerID.hashValue)
				hashCombine(seed: &hash, value: regionID.hashValue)
				hashCombine(seed: &hash, value: solarSystemID.hashValue)
				hashCombine(seed: &hash, value: tax?.hashValue ?? 0)
				hashCombine(seed: &hash, value: typeID.hashValue)
				return hash
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
		
		
		public class GetCharactersCharacterIDIndustryJobsForbidden: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			public static func ==(lhs: Industry.GetCharactersCharacterIDIndustryJobsForbidden, rhs: Industry.GetCharactersCharacterIDIndustryJobsForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Industry.GetCharactersCharacterIDIndustryJobsForbidden) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Industry.GetCharactersCharacterIDIndustryJobsForbidden(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCharactersCharacterIDIndustryJobsForbidden)?.hashValue == hashValue
			}
			
		}
		
		
	}
	
}
