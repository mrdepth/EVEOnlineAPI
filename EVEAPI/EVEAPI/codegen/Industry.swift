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
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
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
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
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
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
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
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
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
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
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
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
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
		
		
		public struct GetCharactersCharacterIDMiningOk: Codable, Hashable {
			
			
			public var date: Date
			public var quantity: Int64
			public var solarSystemID: Int
			public var typeID: Int
			
			public init(date: Date, quantity: Int64, solarSystemID: Int, typeID: Int) {
				self.date = date
				self.quantity = quantity
				self.solarSystemID = solarSystemID
				self.typeID = typeID
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: date.hashValue)
				hashCombine(seed: &hash, value: quantity.hashValue)
				hashCombine(seed: &hash, value: solarSystemID.hashValue)
				hashCombine(seed: &hash, value: typeID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Industry.GetCharactersCharacterIDMiningOk, rhs: Industry.GetCharactersCharacterIDMiningOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case date
				case quantity
				case solarSystemID = "solar_system_id"
				case typeID = "type_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .date: return DateFormatter.esiDateFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCorporationCorporationIDMiningObserversOk: Codable, Hashable {
			
			public enum GetCorporationCorporationIDMiningObserversObserverType: String, Codable, HTTPQueryable {
				case structure = "structure"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var lastUpdated: Date
			public var observerID: Int64
			public var observerType: Industry.GetCorporationCorporationIDMiningObserversOk.GetCorporationCorporationIDMiningObserversObserverType
			
			public init(lastUpdated: Date, observerID: Int64, observerType: Industry.GetCorporationCorporationIDMiningObserversOk.GetCorporationCorporationIDMiningObserversObserverType) {
				self.lastUpdated = lastUpdated
				self.observerID = observerID
				self.observerType = observerType
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: lastUpdated.hashValue)
				hashCombine(seed: &hash, value: observerID.hashValue)
				hashCombine(seed: &hash, value: observerType.hashValue)
				return hash
			}
			
			public static func ==(lhs: Industry.GetCorporationCorporationIDMiningObserversOk, rhs: Industry.GetCorporationCorporationIDMiningObserversOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case lastUpdated = "last_updated"
				case observerID = "observer_id"
				case observerType = "observer_type"
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .lastUpdated: return DateFormatter.esiDateFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct SolarSystemCostIndices: Codable, Hashable {
			
			public struct GetIndustrySystemsCostIndices: Codable, Hashable {
				
				public enum GetIndustrySystemsActivity: String, Codable, HTTPQueryable {
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
					
					public var httpQuery: String? {
						return rawValue
					}
					
				}
				
				public var activity: Industry.SolarSystemCostIndices.GetIndustrySystemsCostIndices.GetIndustrySystemsActivity
				public var costIndex: Float
				
				public init(activity: Industry.SolarSystemCostIndices.GetIndustrySystemsCostIndices.GetIndustrySystemsActivity, costIndex: Float) {
					self.activity = activity
					self.costIndex = costIndex
				}
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: activity.hashValue)
					hashCombine(seed: &hash, value: costIndex.hashValue)
					return hash
				}
				
				public static func ==(lhs: Industry.SolarSystemCostIndices.GetIndustrySystemsCostIndices, rhs: Industry.SolarSystemCostIndices.GetIndustrySystemsCostIndices) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case activity
					case costIndex = "cost_index"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public var costIndices: [Industry.SolarSystemCostIndices.GetIndustrySystemsCostIndices]
			public var solarSystemID: Int
			
			public init(costIndices: [Industry.SolarSystemCostIndices.GetIndustrySystemsCostIndices], solarSystemID: Int) {
				self.costIndices = costIndices
				self.solarSystemID = solarSystemID
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				self.costIndices.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: solarSystemID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Industry.SolarSystemCostIndices, rhs: Industry.SolarSystemCostIndices) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case costIndices = "cost_indices"
				case solarSystemID = "solar_system_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCorporationCorporationIDMiningExtractionsOk: Codable, Hashable {
			
			
			public var chunkArrivalTime: Date
			public var extractionStartTime: Date
			public var moonID: Int
			public var naturalDecayTime: Date
			public var structureID: Int64
			
			public init(chunkArrivalTime: Date, extractionStartTime: Date, moonID: Int, naturalDecayTime: Date, structureID: Int64) {
				self.chunkArrivalTime = chunkArrivalTime
				self.extractionStartTime = extractionStartTime
				self.moonID = moonID
				self.naturalDecayTime = naturalDecayTime
				self.structureID = structureID
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: chunkArrivalTime.hashValue)
				hashCombine(seed: &hash, value: extractionStartTime.hashValue)
				hashCombine(seed: &hash, value: moonID.hashValue)
				hashCombine(seed: &hash, value: naturalDecayTime.hashValue)
				hashCombine(seed: &hash, value: structureID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Industry.GetCorporationCorporationIDMiningExtractionsOk, rhs: Industry.GetCorporationCorporationIDMiningExtractionsOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case chunkArrivalTime = "chunk_arrival_time"
				case extractionStartTime = "extraction_start_time"
				case moonID = "moon_id"
				case naturalDecayTime = "natural_decay_time"
				case structureID = "structure_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .chunkArrivalTime: return DateFormatter.esiDateTimeFormatter
						case .extractionStartTime: return DateFormatter.esiDateTimeFormatter
						case .naturalDecayTime: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct Facilities: Codable, Hashable {
			
			
			public var facilityID: Int64
			public var ownerID: Int
			public var regionID: Int
			public var solarSystemID: Int
			public var tax: Float?
			public var typeID: Int
			
			public init(facilityID: Int64, ownerID: Int, regionID: Int, solarSystemID: Int, tax: Float?, typeID: Int) {
				self.facilityID = facilityID
				self.ownerID = ownerID
				self.regionID = regionID
				self.solarSystemID = solarSystemID
				self.tax = tax
				self.typeID = typeID
			}
			
			public var hashValue: Int {
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
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case facilityID = "facility_id"
				case ownerID = "owner_id"
				case regionID = "region_id"
				case solarSystemID = "solar_system_id"
				case tax
				case typeID = "type_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCorporationsCorporationIDIndustryJobsOk: Codable, Hashable {
			
			public enum GetCorporationsCorporationIDIndustryJobsStatus: String, Codable, HTTPQueryable {
				case active = "active"
				case cancelled = "cancelled"
				case delivered = "delivered"
				case paused = "paused"
				case ready = "ready"
				case reverted = "reverted"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var activityID: Int
			public var blueprintID: Int64
			public var blueprintLocationID: Int64
			public var blueprintTypeID: Int
			public var completedCharacterID: Int?
			public var completedDate: Date?
			public var cost: Double?
			public var duration: Int
			public var endDate: Date
			public var facilityID: Int64
			public var installerID: Int
			public var jobID: Int
			public var licensedRuns: Int?
			public var locationID: Int64
			public var outputLocationID: Int64
			public var pauseDate: Date?
			public var probability: Float?
			public var productTypeID: Int?
			public var runs: Int
			public var startDate: Date
			public var status: Industry.GetCorporationsCorporationIDIndustryJobsOk.GetCorporationsCorporationIDIndustryJobsStatus
			public var successfulRuns: Int?
			
			public init(activityID: Int, blueprintID: Int64, blueprintLocationID: Int64, blueprintTypeID: Int, completedCharacterID: Int?, completedDate: Date?, cost: Double?, duration: Int, endDate: Date, facilityID: Int64, installerID: Int, jobID: Int, licensedRuns: Int?, locationID: Int64, outputLocationID: Int64, pauseDate: Date?, probability: Float?, productTypeID: Int?, runs: Int, startDate: Date, status: Industry.GetCorporationsCorporationIDIndustryJobsOk.GetCorporationsCorporationIDIndustryJobsStatus, successfulRuns: Int?) {
				self.activityID = activityID
				self.blueprintID = blueprintID
				self.blueprintLocationID = blueprintLocationID
				self.blueprintTypeID = blueprintTypeID
				self.completedCharacterID = completedCharacterID
				self.completedDate = completedDate
				self.cost = cost
				self.duration = duration
				self.endDate = endDate
				self.facilityID = facilityID
				self.installerID = installerID
				self.jobID = jobID
				self.licensedRuns = licensedRuns
				self.locationID = locationID
				self.outputLocationID = outputLocationID
				self.pauseDate = pauseDate
				self.probability = probability
				self.productTypeID = productTypeID
				self.runs = runs
				self.startDate = startDate
				self.status = status
				self.successfulRuns = successfulRuns
			}
			
			public var hashValue: Int {
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
				hashCombine(seed: &hash, value: locationID.hashValue)
				hashCombine(seed: &hash, value: outputLocationID.hashValue)
				hashCombine(seed: &hash, value: pauseDate?.hashValue ?? 0)
				hashCombine(seed: &hash, value: probability?.hashValue ?? 0)
				hashCombine(seed: &hash, value: productTypeID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: runs.hashValue)
				hashCombine(seed: &hash, value: startDate.hashValue)
				hashCombine(seed: &hash, value: status.hashValue)
				hashCombine(seed: &hash, value: successfulRuns?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Industry.GetCorporationsCorporationIDIndustryJobsOk, rhs: Industry.GetCorporationsCorporationIDIndustryJobsOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case activityID = "activity_id"
				case blueprintID = "blueprint_id"
				case blueprintLocationID = "blueprint_location_id"
				case blueprintTypeID = "blueprint_type_id"
				case completedCharacterID = "completed_character_id"
				case completedDate = "completed_date"
				case cost
				case duration
				case endDate = "end_date"
				case facilityID = "facility_id"
				case installerID = "installer_id"
				case jobID = "job_id"
				case licensedRuns = "licensed_runs"
				case locationID = "location_id"
				case outputLocationID = "output_location_id"
				case pauseDate = "pause_date"
				case probability
				case productTypeID = "product_type_id"
				case runs
				case startDate = "start_date"
				case status
				case successfulRuns = "successful_runs"
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .completedDate: return DateFormatter.esiDateTimeFormatter
						case .endDate: return DateFormatter.esiDateTimeFormatter
						case .pauseDate: return DateFormatter.esiDateTimeFormatter
						case .startDate: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCorporationCorporationIDMiningObserversObserverIDOk: Codable, Hashable {
			
			
			public var characterID: Int
			public var lastUpdated: Date
			public var quantity: Int64
			public var recordedCorporationID: Int
			public var typeID: Int
			
			public init(characterID: Int, lastUpdated: Date, quantity: Int64, recordedCorporationID: Int, typeID: Int) {
				self.characterID = characterID
				self.lastUpdated = lastUpdated
				self.quantity = quantity
				self.recordedCorporationID = recordedCorporationID
				self.typeID = typeID
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: characterID.hashValue)
				hashCombine(seed: &hash, value: lastUpdated.hashValue)
				hashCombine(seed: &hash, value: quantity.hashValue)
				hashCombine(seed: &hash, value: recordedCorporationID.hashValue)
				hashCombine(seed: &hash, value: typeID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Industry.GetCorporationCorporationIDMiningObserversObserverIDOk, rhs: Industry.GetCorporationCorporationIDMiningObserversObserverIDOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case characterID = "character_id"
				case lastUpdated = "last_updated"
				case quantity
				case recordedCorporationID = "recorded_corporation_id"
				case typeID = "type_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .lastUpdated: return DateFormatter.esiDateFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct Job: Codable, Hashable {
			
			public enum Status: String, Codable, HTTPQueryable {
				case active = "active"
				case cancelled = "cancelled"
				case delivered = "delivered"
				case paused = "paused"
				case ready = "ready"
				case reverted = "reverted"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var activityID: Int
			public var blueprintID: Int64
			public var blueprintLocationID: Int64
			public var blueprintTypeID: Int
			public var completedCharacterID: Int?
			public var completedDate: Date?
			public var cost: Double?
			public var duration: Int
			public var endDate: Date
			public var facilityID: Int64
			public var installerID: Int
			public var jobID: Int
			public var licensedRuns: Int?
			public var outputLocationID: Int64
			public var pauseDate: Date?
			public var probability: Float?
			public var productTypeID: Int?
			public var runs: Int
			public var startDate: Date
			public var stationID: Int64
			public var status: Industry.Job.Status
			public var successfulRuns: Int?
			
			public init(activityID: Int, blueprintID: Int64, blueprintLocationID: Int64, blueprintTypeID: Int, completedCharacterID: Int?, completedDate: Date?, cost: Double?, duration: Int, endDate: Date, facilityID: Int64, installerID: Int, jobID: Int, licensedRuns: Int?, outputLocationID: Int64, pauseDate: Date?, probability: Float?, productTypeID: Int?, runs: Int, startDate: Date, stationID: Int64, status: Industry.Job.Status, successfulRuns: Int?) {
				self.activityID = activityID
				self.blueprintID = blueprintID
				self.blueprintLocationID = blueprintLocationID
				self.blueprintTypeID = blueprintTypeID
				self.completedCharacterID = completedCharacterID
				self.completedDate = completedDate
				self.cost = cost
				self.duration = duration
				self.endDate = endDate
				self.facilityID = facilityID
				self.installerID = installerID
				self.jobID = jobID
				self.licensedRuns = licensedRuns
				self.outputLocationID = outputLocationID
				self.pauseDate = pauseDate
				self.probability = probability
				self.productTypeID = productTypeID
				self.runs = runs
				self.startDate = startDate
				self.stationID = stationID
				self.status = status
				self.successfulRuns = successfulRuns
			}
			
			public var hashValue: Int {
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
			
			public static func ==(lhs: Industry.Job, rhs: Industry.Job) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case activityID = "activity_id"
				case blueprintID = "blueprint_id"
				case blueprintLocationID = "blueprint_location_id"
				case blueprintTypeID = "blueprint_type_id"
				case completedCharacterID = "completed_character_id"
				case completedDate = "completed_date"
				case cost
				case duration
				case endDate = "end_date"
				case facilityID = "facility_id"
				case installerID = "installer_id"
				case jobID = "job_id"
				case licensedRuns = "licensed_runs"
				case outputLocationID = "output_location_id"
				case pauseDate = "pause_date"
				case probability
				case productTypeID = "product_type_id"
				case runs
				case startDate = "start_date"
				case stationID = "station_id"
				case status
				case successfulRuns = "successful_runs"
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .completedDate: return DateFormatter.esiDateTimeFormatter
						case .endDate: return DateFormatter.esiDateTimeFormatter
						case .pauseDate: return DateFormatter.esiDateTimeFormatter
						case .startDate: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
	}
	
}
