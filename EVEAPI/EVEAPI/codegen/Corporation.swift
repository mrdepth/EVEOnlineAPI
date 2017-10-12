import Foundation
import Alamofire


public extension ESI {
	public var corporation: Corporation {
		return Corporation(sessionManager: self)
	}
	
	class Corporation {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		public func getCorporationNames(corporationIds: [Int64], completionBlock:((Result<[Corporation.Name]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = corporationIds.httpQuery {
				query.append(URLQueryItem(name: "corporation_ids", value: v))
			}
			
			let url = session!.baseURL + "latest/corporations/names/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Corporation.Name]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getCorporationMemberLimit(corporationID: Int, completionBlock:((Result<Int>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.track_members.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/corporations/\(corporationID)/members/limit/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Int>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getCorporationDivisions(corporationID: Int, completionBlock:((Result<Corporation.GetCorporationsCorporationIDDivisionsOk>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.read_divisions.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/corporations/\(corporationID)/divisions/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Corporation.GetCorporationsCorporationIDDivisionsOk>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getCorporationBlueprints(corporationID: Int, page: Int? = nil, completionBlock:((Result<[Corporation.GetCorporationsCorporationIDBlueprintsOk]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.read_blueprints.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "latest/corporations/\(corporationID)/blueprints/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Corporation.GetCorporationsCorporationIDBlueprintsOk]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getCorporationTitles(corporationID: Int, completionBlock:((Result<[Corporation.GetCorporationsCorporationIDTitlesOk]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.read_titles.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/corporations/\(corporationID)/titles/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Corporation.GetCorporationsCorporationIDTitlesOk]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getCorporationInformation(corporationID: Int, completionBlock:((Result<Corporation.Information>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/corporations/\(corporationID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Corporation.Information>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getCorporationStructures(corporationID: Int, language: Language? = nil, page: Int? = nil, completionBlock:((Result<[Corporation.Structure]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.read_structures.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = language?.httpQuery {
				query.append(URLQueryItem(name: "language", value: v))
			}
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "latest/corporations/\(corporationID)/structures/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Corporation.Structure]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getNpcCorporations(completionBlock:((Result<[Int]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/corporations/npccorps/"
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
		
		public func updateStructureVulnerabilitySchedule(corporationID: Int, newSchedule: [Corporation.VulnerabilitySchedule], structureID: Int64, completionBlock:((Result<String>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.write_structures.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body = try? JSONSerialization.data(withJSONObject: newSchedule.json, options: [])
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/corporations/\(corporationID)/structures/\(structureID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .put, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<String>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func trackCorporationMembers(corporationID: Int, completionBlock:((Result<[Corporation.GetCorporationsCorporationIDMembertrackingOk]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.track_members.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/corporations/\(corporationID)/membertracking/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Corporation.GetCorporationsCorporationIDMembertrackingOk]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getAllianceHistory(corporationID: Int, completionBlock:((Result<[Corporation.History]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/corporations/\(corporationID)/alliancehistory/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Corporation.History]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getCorporationIcon(corporationID: Int, completionBlock:((Result<Corporation.Icon>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/corporations/\(corporationID)/icons/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Corporation.Icon>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getCorporationMembers(corporationID: Int, completionBlock:((Result<[Corporation.Member]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.read_corporation_membership.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/corporations/\(corporationID)/members/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Corporation.Member]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getCorporationMemberRoles(corporationID: Int, completionBlock:((Result<[Corporation.Role]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.read_corporation_membership.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/corporations/\(corporationID)/roles/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Corporation.Role]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		@objc(ESICorporationGetCorporationsCorporationIDMembertrackingOk) public class GetCorporationsCorporationIDMembertrackingOk: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var baseID: Int? = nil
			public var characterID: Int = Int()
			public var locationID: Int64? = nil
			public var logoffDate: Date? = nil
			public var logonDate: Date? = nil
			public var shipTypeID: Int? = nil
			public var startDate: Date? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				baseID = dictionary["base_id"] as? Int
				guard let characterID = dictionary["character_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.characterID = characterID
				locationID = dictionary["location_id"] as? Int64
				logoffDate = DateFormatter.esiDateTimeFormatter.date(from: dictionary["logoff_date"] as? String ?? "")
				logonDate = DateFormatter.esiDateTimeFormatter.date(from: dictionary["logon_date"] as? String ?? "")
				shipTypeID = dictionary["ship_type_id"] as? Int
				startDate = DateFormatter.esiDateTimeFormatter.date(from: dictionary["start_date"] as? String ?? "")
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				baseID = aDecoder.containsValue(forKey: "base_id") ? aDecoder.decodeInteger(forKey: "base_id") : nil
				characterID = aDecoder.decodeInteger(forKey: "character_id")
				locationID = aDecoder.containsValue(forKey: "location_id") ? aDecoder.decodeInt64(forKey: "location_id") : nil
				logoffDate = aDecoder.decodeObject(forKey: "logoff_date") as? Date
				logonDate = aDecoder.decodeObject(forKey: "logon_date") as? Date
				shipTypeID = aDecoder.containsValue(forKey: "ship_type_id") ? aDecoder.decodeInteger(forKey: "ship_type_id") : nil
				startDate = aDecoder.decodeObject(forKey: "start_date") as? Date
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = baseID {
					aCoder.encode(v, forKey: "base_id")
				}
				aCoder.encode(characterID, forKey: "character_id")
				if let v = locationID {
					aCoder.encode(v, forKey: "location_id")
				}
				if let v = logoffDate {
					aCoder.encode(v, forKey: "logoff_date")
				}
				if let v = logonDate {
					aCoder.encode(v, forKey: "logon_date")
				}
				if let v = shipTypeID {
					aCoder.encode(v, forKey: "ship_type_id")
				}
				if let v = startDate {
					aCoder.encode(v, forKey: "start_date")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = baseID?.json {
					json["base_id"] = v
				}
				json["character_id"] = characterID.json
				if let v = locationID?.json {
					json["location_id"] = v
				}
				if let v = logoffDate?.json {
					json["logoff_date"] = v
				}
				if let v = logonDate?.json {
					json["logon_date"] = v
				}
				if let v = shipTypeID?.json {
					json["ship_type_id"] = v
				}
				if let v = startDate?.json {
					json["start_date"] = v
				}
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.baseID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.characterID.hashValue)
				hashCombine(seed: &hash, value: self.locationID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.logoffDate?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.logonDate?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.shipTypeID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.startDate?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Corporation.GetCorporationsCorporationIDMembertrackingOk, rhs: Corporation.GetCorporationsCorporationIDMembertrackingOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Corporation.GetCorporationsCorporationIDMembertrackingOk) {
				baseID = other.baseID
				characterID = other.characterID
				locationID = other.locationID
				logoffDate = other.logoffDate
				logonDate = other.logonDate
				shipTypeID = other.shipTypeID
				startDate = other.startDate
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Corporation.GetCorporationsCorporationIDMembertrackingOk(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCorporationsCorporationIDMembertrackingOk)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESICorporationGetCorporationsCorporationIDNotFound) public class GetCorporationsCorporationIDNotFound: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
			
			public static func ==(lhs: Corporation.GetCorporationsCorporationIDNotFound, rhs: Corporation.GetCorporationsCorporationIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Corporation.GetCorporationsCorporationIDNotFound) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Corporation.GetCorporationsCorporationIDNotFound(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCorporationsCorporationIDNotFound)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESICorporationGetCorporationsCorporationIDTitlesOk) public class GetCorporationsCorporationIDTitlesOk: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public enum GetCorporationsCorporationIDTitlesGrantableRolesAtOther: String, JSONCoding, HTTPQueryable {
				case accountTake1 = "Account_Take_1"
				case accountTake2 = "Account_Take_2"
				case accountTake3 = "Account_Take_3"
				case accountTake4 = "Account_Take_4"
				case accountTake5 = "Account_Take_5"
				case accountTake6 = "Account_Take_6"
				case accountTake7 = "Account_Take_7"
				case accountant = "Accountant"
				case auditor = "Auditor"
				case communicationsOfficer = "Communications_Officer"
				case configEquipment = "Config_Equipment"
				case configStarbaseEquipment = "Config_Starbase_Equipment"
				case containerTake1 = "Container_Take_1"
				case containerTake2 = "Container_Take_2"
				case containerTake3 = "Container_Take_3"
				case containerTake4 = "Container_Take_4"
				case containerTake5 = "Container_Take_5"
				case containerTake6 = "Container_Take_6"
				case containerTake7 = "Container_Take_7"
				case contractManager = "Contract_Manager"
				case diplomat = "Diplomat"
				case director = "Director"
				case factoryManager = "Factory_Manager"
				case fittingManager = "Fitting_Manager"
				case hangarQuery1 = "Hangar_Query_1"
				case hangarQuery2 = "Hangar_Query_2"
				case hangarQuery3 = "Hangar_Query_3"
				case hangarQuery4 = "Hangar_Query_4"
				case hangarQuery5 = "Hangar_Query_5"
				case hangarQuery6 = "Hangar_Query_6"
				case hangarQuery7 = "Hangar_Query_7"
				case hangarTake1 = "Hangar_Take_1"
				case hangarTake2 = "Hangar_Take_2"
				case hangarTake3 = "Hangar_Take_3"
				case hangarTake4 = "Hangar_Take_4"
				case hangarTake5 = "Hangar_Take_5"
				case hangarTake6 = "Hangar_Take_6"
				case hangarTake7 = "Hangar_Take_7"
				case juniorAccountant = "Junior_Accountant"
				case personnelManager = "Personnel_Manager"
				case rentFactoryFacility = "Rent_Factory_Facility"
				case rentOffice = "Rent_Office"
				case rentResearchFacility = "Rent_Research_Facility"
				case securityOfficer = "Security_Officer"
				case starbaseDefenseOperator = "Starbase_Defense_Operator"
				case starbaseFuelTechnician = "Starbase_Fuel_Technician"
				case stationManager = "Station_Manager"
				case terrestrialCombatOfficer = "Terrestrial_Combat_Officer"
				case terrestrialLogisticsOfficer = "Terrestrial_Logistics_Officer"
				case trader = "Trader"
				
				public init() {
					self = .accountTake1
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCorporationsCorporationIDTitlesGrantableRolesAtOther(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDTitlesGrantableRolesAtBase: String, JSONCoding, HTTPQueryable {
				case accountTake1 = "Account_Take_1"
				case accountTake2 = "Account_Take_2"
				case accountTake3 = "Account_Take_3"
				case accountTake4 = "Account_Take_4"
				case accountTake5 = "Account_Take_5"
				case accountTake6 = "Account_Take_6"
				case accountTake7 = "Account_Take_7"
				case accountant = "Accountant"
				case auditor = "Auditor"
				case communicationsOfficer = "Communications_Officer"
				case configEquipment = "Config_Equipment"
				case configStarbaseEquipment = "Config_Starbase_Equipment"
				case containerTake1 = "Container_Take_1"
				case containerTake2 = "Container_Take_2"
				case containerTake3 = "Container_Take_3"
				case containerTake4 = "Container_Take_4"
				case containerTake5 = "Container_Take_5"
				case containerTake6 = "Container_Take_6"
				case containerTake7 = "Container_Take_7"
				case contractManager = "Contract_Manager"
				case diplomat = "Diplomat"
				case director = "Director"
				case factoryManager = "Factory_Manager"
				case fittingManager = "Fitting_Manager"
				case hangarQuery1 = "Hangar_Query_1"
				case hangarQuery2 = "Hangar_Query_2"
				case hangarQuery3 = "Hangar_Query_3"
				case hangarQuery4 = "Hangar_Query_4"
				case hangarQuery5 = "Hangar_Query_5"
				case hangarQuery6 = "Hangar_Query_6"
				case hangarQuery7 = "Hangar_Query_7"
				case hangarTake1 = "Hangar_Take_1"
				case hangarTake2 = "Hangar_Take_2"
				case hangarTake3 = "Hangar_Take_3"
				case hangarTake4 = "Hangar_Take_4"
				case hangarTake5 = "Hangar_Take_5"
				case hangarTake6 = "Hangar_Take_6"
				case hangarTake7 = "Hangar_Take_7"
				case juniorAccountant = "Junior_Accountant"
				case personnelManager = "Personnel_Manager"
				case rentFactoryFacility = "Rent_Factory_Facility"
				case rentOffice = "Rent_Office"
				case rentResearchFacility = "Rent_Research_Facility"
				case securityOfficer = "Security_Officer"
				case starbaseDefenseOperator = "Starbase_Defense_Operator"
				case starbaseFuelTechnician = "Starbase_Fuel_Technician"
				case stationManager = "Station_Manager"
				case terrestrialCombatOfficer = "Terrestrial_Combat_Officer"
				case terrestrialLogisticsOfficer = "Terrestrial_Logistics_Officer"
				case trader = "Trader"
				
				public init() {
					self = .accountTake1
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCorporationsCorporationIDTitlesGrantableRolesAtBase(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDTitlesGrantableRoles: String, JSONCoding, HTTPQueryable {
				case accountTake1 = "Account_Take_1"
				case accountTake2 = "Account_Take_2"
				case accountTake3 = "Account_Take_3"
				case accountTake4 = "Account_Take_4"
				case accountTake5 = "Account_Take_5"
				case accountTake6 = "Account_Take_6"
				case accountTake7 = "Account_Take_7"
				case accountant = "Accountant"
				case auditor = "Auditor"
				case communicationsOfficer = "Communications_Officer"
				case configEquipment = "Config_Equipment"
				case configStarbaseEquipment = "Config_Starbase_Equipment"
				case containerTake1 = "Container_Take_1"
				case containerTake2 = "Container_Take_2"
				case containerTake3 = "Container_Take_3"
				case containerTake4 = "Container_Take_4"
				case containerTake5 = "Container_Take_5"
				case containerTake6 = "Container_Take_6"
				case containerTake7 = "Container_Take_7"
				case contractManager = "Contract_Manager"
				case diplomat = "Diplomat"
				case director = "Director"
				case factoryManager = "Factory_Manager"
				case fittingManager = "Fitting_Manager"
				case hangarQuery1 = "Hangar_Query_1"
				case hangarQuery2 = "Hangar_Query_2"
				case hangarQuery3 = "Hangar_Query_3"
				case hangarQuery4 = "Hangar_Query_4"
				case hangarQuery5 = "Hangar_Query_5"
				case hangarQuery6 = "Hangar_Query_6"
				case hangarQuery7 = "Hangar_Query_7"
				case hangarTake1 = "Hangar_Take_1"
				case hangarTake2 = "Hangar_Take_2"
				case hangarTake3 = "Hangar_Take_3"
				case hangarTake4 = "Hangar_Take_4"
				case hangarTake5 = "Hangar_Take_5"
				case hangarTake6 = "Hangar_Take_6"
				case hangarTake7 = "Hangar_Take_7"
				case juniorAccountant = "Junior_Accountant"
				case personnelManager = "Personnel_Manager"
				case rentFactoryFacility = "Rent_Factory_Facility"
				case rentOffice = "Rent_Office"
				case rentResearchFacility = "Rent_Research_Facility"
				case securityOfficer = "Security_Officer"
				case starbaseDefenseOperator = "Starbase_Defense_Operator"
				case starbaseFuelTechnician = "Starbase_Fuel_Technician"
				case stationManager = "Station_Manager"
				case terrestrialCombatOfficer = "Terrestrial_Combat_Officer"
				case terrestrialLogisticsOfficer = "Terrestrial_Logistics_Officer"
				case trader = "Trader"
				
				public init() {
					self = .accountTake1
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCorporationsCorporationIDTitlesGrantableRoles(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDTitlesRoles: String, JSONCoding, HTTPQueryable {
				case accountTake1 = "Account_Take_1"
				case accountTake2 = "Account_Take_2"
				case accountTake3 = "Account_Take_3"
				case accountTake4 = "Account_Take_4"
				case accountTake5 = "Account_Take_5"
				case accountTake6 = "Account_Take_6"
				case accountTake7 = "Account_Take_7"
				case accountant = "Accountant"
				case auditor = "Auditor"
				case communicationsOfficer = "Communications_Officer"
				case configEquipment = "Config_Equipment"
				case configStarbaseEquipment = "Config_Starbase_Equipment"
				case containerTake1 = "Container_Take_1"
				case containerTake2 = "Container_Take_2"
				case containerTake3 = "Container_Take_3"
				case containerTake4 = "Container_Take_4"
				case containerTake5 = "Container_Take_5"
				case containerTake6 = "Container_Take_6"
				case containerTake7 = "Container_Take_7"
				case contractManager = "Contract_Manager"
				case diplomat = "Diplomat"
				case director = "Director"
				case factoryManager = "Factory_Manager"
				case fittingManager = "Fitting_Manager"
				case hangarQuery1 = "Hangar_Query_1"
				case hangarQuery2 = "Hangar_Query_2"
				case hangarQuery3 = "Hangar_Query_3"
				case hangarQuery4 = "Hangar_Query_4"
				case hangarQuery5 = "Hangar_Query_5"
				case hangarQuery6 = "Hangar_Query_6"
				case hangarQuery7 = "Hangar_Query_7"
				case hangarTake1 = "Hangar_Take_1"
				case hangarTake2 = "Hangar_Take_2"
				case hangarTake3 = "Hangar_Take_3"
				case hangarTake4 = "Hangar_Take_4"
				case hangarTake5 = "Hangar_Take_5"
				case hangarTake6 = "Hangar_Take_6"
				case hangarTake7 = "Hangar_Take_7"
				case juniorAccountant = "Junior_Accountant"
				case personnelManager = "Personnel_Manager"
				case rentFactoryFacility = "Rent_Factory_Facility"
				case rentOffice = "Rent_Office"
				case rentResearchFacility = "Rent_Research_Facility"
				case securityOfficer = "Security_Officer"
				case starbaseDefenseOperator = "Starbase_Defense_Operator"
				case starbaseFuelTechnician = "Starbase_Fuel_Technician"
				case stationManager = "Station_Manager"
				case terrestrialCombatOfficer = "Terrestrial_Combat_Officer"
				case terrestrialLogisticsOfficer = "Terrestrial_Logistics_Officer"
				case trader = "Trader"
				
				public init() {
					self = .accountTake1
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCorporationsCorporationIDTitlesRoles(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDTitlesGrantableRolesAtHq: String, JSONCoding, HTTPQueryable {
				case accountTake1 = "Account_Take_1"
				case accountTake2 = "Account_Take_2"
				case accountTake3 = "Account_Take_3"
				case accountTake4 = "Account_Take_4"
				case accountTake5 = "Account_Take_5"
				case accountTake6 = "Account_Take_6"
				case accountTake7 = "Account_Take_7"
				case accountant = "Accountant"
				case auditor = "Auditor"
				case communicationsOfficer = "Communications_Officer"
				case configEquipment = "Config_Equipment"
				case configStarbaseEquipment = "Config_Starbase_Equipment"
				case containerTake1 = "Container_Take_1"
				case containerTake2 = "Container_Take_2"
				case containerTake3 = "Container_Take_3"
				case containerTake4 = "Container_Take_4"
				case containerTake5 = "Container_Take_5"
				case containerTake6 = "Container_Take_6"
				case containerTake7 = "Container_Take_7"
				case contractManager = "Contract_Manager"
				case diplomat = "Diplomat"
				case director = "Director"
				case factoryManager = "Factory_Manager"
				case fittingManager = "Fitting_Manager"
				case hangarQuery1 = "Hangar_Query_1"
				case hangarQuery2 = "Hangar_Query_2"
				case hangarQuery3 = "Hangar_Query_3"
				case hangarQuery4 = "Hangar_Query_4"
				case hangarQuery5 = "Hangar_Query_5"
				case hangarQuery6 = "Hangar_Query_6"
				case hangarQuery7 = "Hangar_Query_7"
				case hangarTake1 = "Hangar_Take_1"
				case hangarTake2 = "Hangar_Take_2"
				case hangarTake3 = "Hangar_Take_3"
				case hangarTake4 = "Hangar_Take_4"
				case hangarTake5 = "Hangar_Take_5"
				case hangarTake6 = "Hangar_Take_6"
				case hangarTake7 = "Hangar_Take_7"
				case juniorAccountant = "Junior_Accountant"
				case personnelManager = "Personnel_Manager"
				case rentFactoryFacility = "Rent_Factory_Facility"
				case rentOffice = "Rent_Office"
				case rentResearchFacility = "Rent_Research_Facility"
				case securityOfficer = "Security_Officer"
				case starbaseDefenseOperator = "Starbase_Defense_Operator"
				case starbaseFuelTechnician = "Starbase_Fuel_Technician"
				case stationManager = "Station_Manager"
				case terrestrialCombatOfficer = "Terrestrial_Combat_Officer"
				case terrestrialLogisticsOfficer = "Terrestrial_Logistics_Officer"
				case trader = "Trader"
				
				public init() {
					self = .accountTake1
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCorporationsCorporationIDTitlesGrantableRolesAtHq(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDTitlesRolesAtBase: String, JSONCoding, HTTPQueryable {
				case accountTake1 = "Account_Take_1"
				case accountTake2 = "Account_Take_2"
				case accountTake3 = "Account_Take_3"
				case accountTake4 = "Account_Take_4"
				case accountTake5 = "Account_Take_5"
				case accountTake6 = "Account_Take_6"
				case accountTake7 = "Account_Take_7"
				case accountant = "Accountant"
				case auditor = "Auditor"
				case communicationsOfficer = "Communications_Officer"
				case configEquipment = "Config_Equipment"
				case configStarbaseEquipment = "Config_Starbase_Equipment"
				case containerTake1 = "Container_Take_1"
				case containerTake2 = "Container_Take_2"
				case containerTake3 = "Container_Take_3"
				case containerTake4 = "Container_Take_4"
				case containerTake5 = "Container_Take_5"
				case containerTake6 = "Container_Take_6"
				case containerTake7 = "Container_Take_7"
				case contractManager = "Contract_Manager"
				case diplomat = "Diplomat"
				case director = "Director"
				case factoryManager = "Factory_Manager"
				case fittingManager = "Fitting_Manager"
				case hangarQuery1 = "Hangar_Query_1"
				case hangarQuery2 = "Hangar_Query_2"
				case hangarQuery3 = "Hangar_Query_3"
				case hangarQuery4 = "Hangar_Query_4"
				case hangarQuery5 = "Hangar_Query_5"
				case hangarQuery6 = "Hangar_Query_6"
				case hangarQuery7 = "Hangar_Query_7"
				case hangarTake1 = "Hangar_Take_1"
				case hangarTake2 = "Hangar_Take_2"
				case hangarTake3 = "Hangar_Take_3"
				case hangarTake4 = "Hangar_Take_4"
				case hangarTake5 = "Hangar_Take_5"
				case hangarTake6 = "Hangar_Take_6"
				case hangarTake7 = "Hangar_Take_7"
				case juniorAccountant = "Junior_Accountant"
				case personnelManager = "Personnel_Manager"
				case rentFactoryFacility = "Rent_Factory_Facility"
				case rentOffice = "Rent_Office"
				case rentResearchFacility = "Rent_Research_Facility"
				case securityOfficer = "Security_Officer"
				case starbaseDefenseOperator = "Starbase_Defense_Operator"
				case starbaseFuelTechnician = "Starbase_Fuel_Technician"
				case stationManager = "Station_Manager"
				case terrestrialCombatOfficer = "Terrestrial_Combat_Officer"
				case terrestrialLogisticsOfficer = "Terrestrial_Logistics_Officer"
				case trader = "Trader"
				
				public init() {
					self = .accountTake1
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCorporationsCorporationIDTitlesRolesAtBase(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDTitlesRolesAtHq: String, JSONCoding, HTTPQueryable {
				case accountTake1 = "Account_Take_1"
				case accountTake2 = "Account_Take_2"
				case accountTake3 = "Account_Take_3"
				case accountTake4 = "Account_Take_4"
				case accountTake5 = "Account_Take_5"
				case accountTake6 = "Account_Take_6"
				case accountTake7 = "Account_Take_7"
				case accountant = "Accountant"
				case auditor = "Auditor"
				case communicationsOfficer = "Communications_Officer"
				case configEquipment = "Config_Equipment"
				case configStarbaseEquipment = "Config_Starbase_Equipment"
				case containerTake1 = "Container_Take_1"
				case containerTake2 = "Container_Take_2"
				case containerTake3 = "Container_Take_3"
				case containerTake4 = "Container_Take_4"
				case containerTake5 = "Container_Take_5"
				case containerTake6 = "Container_Take_6"
				case containerTake7 = "Container_Take_7"
				case contractManager = "Contract_Manager"
				case diplomat = "Diplomat"
				case director = "Director"
				case factoryManager = "Factory_Manager"
				case fittingManager = "Fitting_Manager"
				case hangarQuery1 = "Hangar_Query_1"
				case hangarQuery2 = "Hangar_Query_2"
				case hangarQuery3 = "Hangar_Query_3"
				case hangarQuery4 = "Hangar_Query_4"
				case hangarQuery5 = "Hangar_Query_5"
				case hangarQuery6 = "Hangar_Query_6"
				case hangarQuery7 = "Hangar_Query_7"
				case hangarTake1 = "Hangar_Take_1"
				case hangarTake2 = "Hangar_Take_2"
				case hangarTake3 = "Hangar_Take_3"
				case hangarTake4 = "Hangar_Take_4"
				case hangarTake5 = "Hangar_Take_5"
				case hangarTake6 = "Hangar_Take_6"
				case hangarTake7 = "Hangar_Take_7"
				case juniorAccountant = "Junior_Accountant"
				case personnelManager = "Personnel_Manager"
				case rentFactoryFacility = "Rent_Factory_Facility"
				case rentOffice = "Rent_Office"
				case rentResearchFacility = "Rent_Research_Facility"
				case securityOfficer = "Security_Officer"
				case starbaseDefenseOperator = "Starbase_Defense_Operator"
				case starbaseFuelTechnician = "Starbase_Fuel_Technician"
				case stationManager = "Station_Manager"
				case terrestrialCombatOfficer = "Terrestrial_Combat_Officer"
				case terrestrialLogisticsOfficer = "Terrestrial_Logistics_Officer"
				case trader = "Trader"
				
				public init() {
					self = .accountTake1
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCorporationsCorporationIDTitlesRolesAtHq(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDTitlesRolesAtOther: String, JSONCoding, HTTPQueryable {
				case accountTake1 = "Account_Take_1"
				case accountTake2 = "Account_Take_2"
				case accountTake3 = "Account_Take_3"
				case accountTake4 = "Account_Take_4"
				case accountTake5 = "Account_Take_5"
				case accountTake6 = "Account_Take_6"
				case accountTake7 = "Account_Take_7"
				case accountant = "Accountant"
				case auditor = "Auditor"
				case communicationsOfficer = "Communications_Officer"
				case configEquipment = "Config_Equipment"
				case configStarbaseEquipment = "Config_Starbase_Equipment"
				case containerTake1 = "Container_Take_1"
				case containerTake2 = "Container_Take_2"
				case containerTake3 = "Container_Take_3"
				case containerTake4 = "Container_Take_4"
				case containerTake5 = "Container_Take_5"
				case containerTake6 = "Container_Take_6"
				case containerTake7 = "Container_Take_7"
				case contractManager = "Contract_Manager"
				case diplomat = "Diplomat"
				case director = "Director"
				case factoryManager = "Factory_Manager"
				case fittingManager = "Fitting_Manager"
				case hangarQuery1 = "Hangar_Query_1"
				case hangarQuery2 = "Hangar_Query_2"
				case hangarQuery3 = "Hangar_Query_3"
				case hangarQuery4 = "Hangar_Query_4"
				case hangarQuery5 = "Hangar_Query_5"
				case hangarQuery6 = "Hangar_Query_6"
				case hangarQuery7 = "Hangar_Query_7"
				case hangarTake1 = "Hangar_Take_1"
				case hangarTake2 = "Hangar_Take_2"
				case hangarTake3 = "Hangar_Take_3"
				case hangarTake4 = "Hangar_Take_4"
				case hangarTake5 = "Hangar_Take_5"
				case hangarTake6 = "Hangar_Take_6"
				case hangarTake7 = "Hangar_Take_7"
				case juniorAccountant = "Junior_Accountant"
				case personnelManager = "Personnel_Manager"
				case rentFactoryFacility = "Rent_Factory_Facility"
				case rentOffice = "Rent_Office"
				case rentResearchFacility = "Rent_Research_Facility"
				case securityOfficer = "Security_Officer"
				case starbaseDefenseOperator = "Starbase_Defense_Operator"
				case starbaseFuelTechnician = "Starbase_Fuel_Technician"
				case stationManager = "Station_Manager"
				case terrestrialCombatOfficer = "Terrestrial_Combat_Officer"
				case terrestrialLogisticsOfficer = "Terrestrial_Logistics_Officer"
				case trader = "Trader"
				
				public init() {
					self = .accountTake1
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCorporationsCorporationIDTitlesRolesAtOther(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var grantableRoles: [Corporation.GetCorporationsCorporationIDTitlesOk.GetCorporationsCorporationIDTitlesGrantableRoles]? = nil
			public var grantableRolesAtBase: [Corporation.GetCorporationsCorporationIDTitlesOk.GetCorporationsCorporationIDTitlesGrantableRolesAtBase]? = nil
			public var grantableRolesAtHq: [Corporation.GetCorporationsCorporationIDTitlesOk.GetCorporationsCorporationIDTitlesGrantableRolesAtHq]? = nil
			public var grantableRolesAtOther: [Corporation.GetCorporationsCorporationIDTitlesOk.GetCorporationsCorporationIDTitlesGrantableRolesAtOther]? = nil
			public var name: String? = nil
			public var roles: [Corporation.GetCorporationsCorporationIDTitlesOk.GetCorporationsCorporationIDTitlesRoles]? = nil
			public var rolesAtBase: [Corporation.GetCorporationsCorporationIDTitlesOk.GetCorporationsCorporationIDTitlesRolesAtBase]? = nil
			public var rolesAtHq: [Corporation.GetCorporationsCorporationIDTitlesOk.GetCorporationsCorporationIDTitlesRolesAtHq]? = nil
			public var rolesAtOther: [Corporation.GetCorporationsCorporationIDTitlesOk.GetCorporationsCorporationIDTitlesRolesAtOther]? = nil
			public var titleID: Int? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				grantableRoles = try (dictionary["grantable_roles"] as? [Any])?.map {try Corporation.GetCorporationsCorporationIDTitlesOk.GetCorporationsCorporationIDTitlesGrantableRoles(json: $0)}
				grantableRolesAtBase = try (dictionary["grantable_roles_at_base"] as? [Any])?.map {try Corporation.GetCorporationsCorporationIDTitlesOk.GetCorporationsCorporationIDTitlesGrantableRolesAtBase(json: $0)}
				grantableRolesAtHq = try (dictionary["grantable_roles_at_hq"] as? [Any])?.map {try Corporation.GetCorporationsCorporationIDTitlesOk.GetCorporationsCorporationIDTitlesGrantableRolesAtHq(json: $0)}
				grantableRolesAtOther = try (dictionary["grantable_roles_at_other"] as? [Any])?.map {try Corporation.GetCorporationsCorporationIDTitlesOk.GetCorporationsCorporationIDTitlesGrantableRolesAtOther(json: $0)}
				name = dictionary["name"] as? String
				roles = try (dictionary["roles"] as? [Any])?.map {try Corporation.GetCorporationsCorporationIDTitlesOk.GetCorporationsCorporationIDTitlesRoles(json: $0)}
				rolesAtBase = try (dictionary["roles_at_base"] as? [Any])?.map {try Corporation.GetCorporationsCorporationIDTitlesOk.GetCorporationsCorporationIDTitlesRolesAtBase(json: $0)}
				rolesAtHq = try (dictionary["roles_at_hq"] as? [Any])?.map {try Corporation.GetCorporationsCorporationIDTitlesOk.GetCorporationsCorporationIDTitlesRolesAtHq(json: $0)}
				rolesAtOther = try (dictionary["roles_at_other"] as? [Any])?.map {try Corporation.GetCorporationsCorporationIDTitlesOk.GetCorporationsCorporationIDTitlesRolesAtOther(json: $0)}
				titleID = dictionary["title_id"] as? Int
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				grantableRoles = aDecoder.decodeObject(forKey: "grantable_roles") as? [Corporation.GetCorporationsCorporationIDTitlesOk.GetCorporationsCorporationIDTitlesGrantableRoles]
				grantableRolesAtBase = aDecoder.decodeObject(forKey: "grantable_roles_at_base") as? [Corporation.GetCorporationsCorporationIDTitlesOk.GetCorporationsCorporationIDTitlesGrantableRolesAtBase]
				grantableRolesAtHq = aDecoder.decodeObject(forKey: "grantable_roles_at_hq") as? [Corporation.GetCorporationsCorporationIDTitlesOk.GetCorporationsCorporationIDTitlesGrantableRolesAtHq]
				grantableRolesAtOther = aDecoder.decodeObject(forKey: "grantable_roles_at_other") as? [Corporation.GetCorporationsCorporationIDTitlesOk.GetCorporationsCorporationIDTitlesGrantableRolesAtOther]
				name = aDecoder.decodeObject(forKey: "name") as? String
				roles = aDecoder.decodeObject(forKey: "roles") as? [Corporation.GetCorporationsCorporationIDTitlesOk.GetCorporationsCorporationIDTitlesRoles]
				rolesAtBase = aDecoder.decodeObject(forKey: "roles_at_base") as? [Corporation.GetCorporationsCorporationIDTitlesOk.GetCorporationsCorporationIDTitlesRolesAtBase]
				rolesAtHq = aDecoder.decodeObject(forKey: "roles_at_hq") as? [Corporation.GetCorporationsCorporationIDTitlesOk.GetCorporationsCorporationIDTitlesRolesAtHq]
				rolesAtOther = aDecoder.decodeObject(forKey: "roles_at_other") as? [Corporation.GetCorporationsCorporationIDTitlesOk.GetCorporationsCorporationIDTitlesRolesAtOther]
				titleID = aDecoder.containsValue(forKey: "title_id") ? aDecoder.decodeInteger(forKey: "title_id") : nil
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = grantableRoles {
					aCoder.encode(v, forKey: "grantable_roles")
				}
				if let v = grantableRolesAtBase {
					aCoder.encode(v, forKey: "grantable_roles_at_base")
				}
				if let v = grantableRolesAtHq {
					aCoder.encode(v, forKey: "grantable_roles_at_hq")
				}
				if let v = grantableRolesAtOther {
					aCoder.encode(v, forKey: "grantable_roles_at_other")
				}
				if let v = name {
					aCoder.encode(v, forKey: "name")
				}
				if let v = roles {
					aCoder.encode(v, forKey: "roles")
				}
				if let v = rolesAtBase {
					aCoder.encode(v, forKey: "roles_at_base")
				}
				if let v = rolesAtHq {
					aCoder.encode(v, forKey: "roles_at_hq")
				}
				if let v = rolesAtOther {
					aCoder.encode(v, forKey: "roles_at_other")
				}
				if let v = titleID {
					aCoder.encode(v, forKey: "title_id")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = grantableRoles?.json {
					json["grantable_roles"] = v
				}
				if let v = grantableRolesAtBase?.json {
					json["grantable_roles_at_base"] = v
				}
				if let v = grantableRolesAtHq?.json {
					json["grantable_roles_at_hq"] = v
				}
				if let v = grantableRolesAtOther?.json {
					json["grantable_roles_at_other"] = v
				}
				if let v = name?.json {
					json["name"] = v
				}
				if let v = roles?.json {
					json["roles"] = v
				}
				if let v = rolesAtBase?.json {
					json["roles_at_base"] = v
				}
				if let v = rolesAtHq?.json {
					json["roles_at_hq"] = v
				}
				if let v = rolesAtOther?.json {
					json["roles_at_other"] = v
				}
				if let v = titleID?.json {
					json["title_id"] = v
				}
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.grantableRoles?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.grantableRolesAtBase?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.grantableRolesAtHq?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.grantableRolesAtOther?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: self.name?.hashValue ?? 0)
				self.roles?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.rolesAtBase?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.rolesAtHq?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.rolesAtOther?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: self.titleID?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Corporation.GetCorporationsCorporationIDTitlesOk, rhs: Corporation.GetCorporationsCorporationIDTitlesOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Corporation.GetCorporationsCorporationIDTitlesOk) {
				grantableRoles = other.grantableRoles?.flatMap { $0 }
				grantableRolesAtBase = other.grantableRolesAtBase?.flatMap { $0 }
				grantableRolesAtHq = other.grantableRolesAtHq?.flatMap { $0 }
				grantableRolesAtOther = other.grantableRolesAtOther?.flatMap { $0 }
				name = other.name
				roles = other.roles?.flatMap { $0 }
				rolesAtBase = other.rolesAtBase?.flatMap { $0 }
				rolesAtHq = other.rolesAtHq?.flatMap { $0 }
				rolesAtOther = other.rolesAtOther?.flatMap { $0 }
				titleID = other.titleID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Corporation.GetCorporationsCorporationIDTitlesOk(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCorporationsCorporationIDTitlesOk)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESICorporationIcon) public class Icon: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var px128x128: String? = nil
			public var px256x256: String? = nil
			public var px64x64: String? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				px128x128 = dictionary["px128x128"] as? String
				px256x256 = dictionary["px256x256"] as? String
				px64x64 = dictionary["px64x64"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				px128x128 = aDecoder.decodeObject(forKey: "px128x128") as? String
				px256x256 = aDecoder.decodeObject(forKey: "px256x256") as? String
				px64x64 = aDecoder.decodeObject(forKey: "px64x64") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = px128x128 {
					aCoder.encode(v, forKey: "px128x128")
				}
				if let v = px256x256 {
					aCoder.encode(v, forKey: "px256x256")
				}
				if let v = px64x64 {
					aCoder.encode(v, forKey: "px64x64")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = px128x128?.json {
					json["px128x128"] = v
				}
				if let v = px256x256?.json {
					json["px256x256"] = v
				}
				if let v = px64x64?.json {
					json["px64x64"] = v
				}
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.px128x128?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.px256x256?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.px64x64?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Corporation.Icon, rhs: Corporation.Icon) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Corporation.Icon) {
				px128x128 = other.px128x128
				px256x256 = other.px256x256
				px64x64 = other.px64x64
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Corporation.Icon(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Icon)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESICorporationGetCorporationsCorporationIDIconsNotFound) public class GetCorporationsCorporationIDIconsNotFound: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var error: String? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				error = dictionary["error"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
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
			
			public static func ==(lhs: Corporation.GetCorporationsCorporationIDIconsNotFound, rhs: Corporation.GetCorporationsCorporationIDIconsNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Corporation.GetCorporationsCorporationIDIconsNotFound) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Corporation.GetCorporationsCorporationIDIconsNotFound(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCorporationsCorporationIDIconsNotFound)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESICorporationInformation) public class Information: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public enum GetCorporationsCorporationIDFaction: String, JSONCoding, HTTPQueryable {
				case amarr = "Amarr"
				case caldari = "Caldari"
				case gallente = "Gallente"
				case minmatar = "Minmatar"
				
				public init() {
					self = .minmatar
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCorporationsCorporationIDFaction(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var allianceID: Int? = nil
			public var ceoID: Int = Int()
			public var corporationDescription: String = String()
			public var corporationName: String = String()
			public var creationDate: Date? = nil
			public var creatorID: Int = Int()
			public var faction: Corporation.Information.GetCorporationsCorporationIDFaction? = nil
			public var memberCount: Int = Int()
			public var taxRate: Float = Float()
			public var ticker: String = String()
			public var url: String = String()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				allianceID = dictionary["alliance_id"] as? Int
				guard let ceoID = dictionary["ceo_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.ceoID = ceoID
				guard let corporationDescription = dictionary["corporation_description"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.corporationDescription = corporationDescription
				guard let corporationName = dictionary["corporation_name"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.corporationName = corporationName
				creationDate = DateFormatter.esiDateTimeFormatter.date(from: dictionary["creation_date"] as? String ?? "")
				guard let creatorID = dictionary["creator_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.creatorID = creatorID
				faction = Corporation.Information.GetCorporationsCorporationIDFaction(rawValue: dictionary["faction"] as? String ?? "")
				guard let memberCount = dictionary["member_count"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.memberCount = memberCount
				guard let taxRate = dictionary["tax_rate"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.taxRate = taxRate
				guard let ticker = dictionary["ticker"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.ticker = ticker
				guard let url = dictionary["url"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.url = url
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				allianceID = aDecoder.containsValue(forKey: "alliance_id") ? aDecoder.decodeInteger(forKey: "alliance_id") : nil
				ceoID = aDecoder.decodeInteger(forKey: "ceo_id")
				corporationDescription = aDecoder.decodeObject(forKey: "corporation_description") as? String ?? String()
				corporationName = aDecoder.decodeObject(forKey: "corporation_name") as? String ?? String()
				creationDate = aDecoder.decodeObject(forKey: "creation_date") as? Date
				creatorID = aDecoder.decodeInteger(forKey: "creator_id")
				faction = Corporation.Information.GetCorporationsCorporationIDFaction(rawValue: aDecoder.decodeObject(forKey: "faction") as? String ?? "")
				memberCount = aDecoder.decodeInteger(forKey: "member_count")
				taxRate = aDecoder.decodeFloat(forKey: "tax_rate")
				ticker = aDecoder.decodeObject(forKey: "ticker") as? String ?? String()
				url = aDecoder.decodeObject(forKey: "url") as? String ?? String()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = allianceID {
					aCoder.encode(v, forKey: "alliance_id")
				}
				aCoder.encode(ceoID, forKey: "ceo_id")
				aCoder.encode(corporationDescription, forKey: "corporation_description")
				aCoder.encode(corporationName, forKey: "corporation_name")
				if let v = creationDate {
					aCoder.encode(v, forKey: "creation_date")
				}
				aCoder.encode(creatorID, forKey: "creator_id")
				if let v = faction {
					aCoder.encode(v.rawValue, forKey: "faction")
				}
				aCoder.encode(memberCount, forKey: "member_count")
				aCoder.encode(taxRate, forKey: "tax_rate")
				aCoder.encode(ticker, forKey: "ticker")
				aCoder.encode(url, forKey: "url")
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = allianceID?.json {
					json["alliance_id"] = v
				}
				json["ceo_id"] = ceoID.json
				json["corporation_description"] = corporationDescription.json
				json["corporation_name"] = corporationName.json
				if let v = creationDate?.json {
					json["creation_date"] = v
				}
				json["creator_id"] = creatorID.json
				if let v = faction?.json {
					json["faction"] = v
				}
				json["member_count"] = memberCount.json
				json["tax_rate"] = taxRate.json
				json["ticker"] = ticker.json
				json["url"] = url.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.allianceID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.ceoID.hashValue)
				hashCombine(seed: &hash, value: self.corporationDescription.hashValue)
				hashCombine(seed: &hash, value: self.corporationName.hashValue)
				hashCombine(seed: &hash, value: self.creationDate?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.creatorID.hashValue)
				hashCombine(seed: &hash, value: self.faction?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.memberCount.hashValue)
				hashCombine(seed: &hash, value: self.taxRate.hashValue)
				hashCombine(seed: &hash, value: self.ticker.hashValue)
				hashCombine(seed: &hash, value: self.url.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Corporation.Information, rhs: Corporation.Information) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Corporation.Information) {
				allianceID = other.allianceID
				ceoID = other.ceoID
				corporationDescription = other.corporationDescription
				corporationName = other.corporationName
				creationDate = other.creationDate
				creatorID = other.creatorID
				faction = other.faction
				memberCount = other.memberCount
				taxRate = other.taxRate
				ticker = other.ticker
				url = other.url
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Corporation.Information(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Information)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESICorporationMember) public class Member: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var characterID: Int = Int()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let characterID = dictionary["character_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.characterID = characterID
				
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
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(characterID, forKey: "character_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["character_id"] = characterID.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.characterID.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Corporation.Member, rhs: Corporation.Member) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Corporation.Member) {
				characterID = other.characterID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Corporation.Member(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Member)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESICorporationName) public class Name: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var corporationID: Int = Int()
			public var corporationName: String = String()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let corporationID = dictionary["corporation_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.corporationID = corporationID
				guard let corporationName = dictionary["corporation_name"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.corporationName = corporationName
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				corporationID = aDecoder.decodeInteger(forKey: "corporation_id")
				corporationName = aDecoder.decodeObject(forKey: "corporation_name") as? String ?? String()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(corporationID, forKey: "corporation_id")
				aCoder.encode(corporationName, forKey: "corporation_name")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["corporation_id"] = corporationID.json
				json["corporation_name"] = corporationName.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.corporationID.hashValue)
				hashCombine(seed: &hash, value: self.corporationName.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Corporation.Name, rhs: Corporation.Name) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Corporation.Name) {
				corporationID = other.corporationID
				corporationName = other.corporationName
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Corporation.Name(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Name)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESICorporationHistory) public class History: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var allianceID: Int? = nil
			public var isDeleted: Bool? = nil
			public var recordID: Int = Int()
			public var startDate: Date = Date()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				allianceID = dictionary["alliance_id"] as? Int
				isDeleted = dictionary["is_deleted"] as? Bool
				guard let recordID = dictionary["record_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.recordID = recordID
				guard let startDate = DateFormatter.esiDateTimeFormatter.date(from: dictionary["start_date"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.startDate = startDate
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				allianceID = aDecoder.containsValue(forKey: "alliance_id") ? aDecoder.decodeInteger(forKey: "alliance_id") : nil
				isDeleted = aDecoder.containsValue(forKey: "is_deleted") ? aDecoder.decodeBool(forKey: "is_deleted") : nil
				recordID = aDecoder.decodeInteger(forKey: "record_id")
				startDate = aDecoder.decodeObject(forKey: "start_date") as? Date ?? Date()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = allianceID {
					aCoder.encode(v, forKey: "alliance_id")
				}
				if let v = isDeleted {
					aCoder.encode(v, forKey: "is_deleted")
				}
				aCoder.encode(recordID, forKey: "record_id")
				aCoder.encode(startDate, forKey: "start_date")
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = allianceID?.json {
					json["alliance_id"] = v
				}
				if let v = isDeleted?.json {
					json["is_deleted"] = v
				}
				json["record_id"] = recordID.json
				json["start_date"] = startDate.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.allianceID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.isDeleted?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.recordID.hashValue)
				hashCombine(seed: &hash, value: self.startDate.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Corporation.History, rhs: Corporation.History) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Corporation.History) {
				allianceID = other.allianceID
				isDeleted = other.isDeleted
				recordID = other.recordID
				startDate = other.startDate
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Corporation.History(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? History)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESICorporationVulnerabilitySchedule) public class VulnerabilitySchedule: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var day: Int = Int()
			public var hour: Int = Int()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let day = dictionary["day"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.day = day
				guard let hour = dictionary["hour"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.hour = hour
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				day = aDecoder.decodeInteger(forKey: "day")
				hour = aDecoder.decodeInteger(forKey: "hour")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(day, forKey: "day")
				aCoder.encode(hour, forKey: "hour")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["day"] = day.json
				json["hour"] = hour.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.day.hashValue)
				hashCombine(seed: &hash, value: self.hour.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Corporation.VulnerabilitySchedule, rhs: Corporation.VulnerabilitySchedule) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Corporation.VulnerabilitySchedule) {
				day = other.day
				hour = other.hour
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Corporation.VulnerabilitySchedule(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? VulnerabilitySchedule)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESICorporationRole) public class Role: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public enum GetCorporationsCorporationIDRolesRolesAtHq: String, JSONCoding, HTTPQueryable {
				case accountTake1 = "Account_Take_1"
				case accountTake2 = "Account_Take_2"
				case accountTake3 = "Account_Take_3"
				case accountTake4 = "Account_Take_4"
				case accountTake5 = "Account_Take_5"
				case accountTake6 = "Account_Take_6"
				case accountTake7 = "Account_Take_7"
				case accountant = "Accountant"
				case auditor = "Auditor"
				case communicationsOfficer = "Communications_Officer"
				case configEquipment = "Config_Equipment"
				case configStarbaseEquipment = "Config_Starbase_Equipment"
				case containerTake1 = "Container_Take_1"
				case containerTake2 = "Container_Take_2"
				case containerTake3 = "Container_Take_3"
				case containerTake4 = "Container_Take_4"
				case containerTake5 = "Container_Take_5"
				case containerTake6 = "Container_Take_6"
				case containerTake7 = "Container_Take_7"
				case contractManager = "Contract_Manager"
				case diplomat = "Diplomat"
				case director = "Director"
				case factoryManager = "Factory_Manager"
				case fittingManager = "Fitting_Manager"
				case hangarQuery1 = "Hangar_Query_1"
				case hangarQuery2 = "Hangar_Query_2"
				case hangarQuery3 = "Hangar_Query_3"
				case hangarQuery4 = "Hangar_Query_4"
				case hangarQuery5 = "Hangar_Query_5"
				case hangarQuery6 = "Hangar_Query_6"
				case hangarQuery7 = "Hangar_Query_7"
				case hangarTake1 = "Hangar_Take_1"
				case hangarTake2 = "Hangar_Take_2"
				case hangarTake3 = "Hangar_Take_3"
				case hangarTake4 = "Hangar_Take_4"
				case hangarTake5 = "Hangar_Take_5"
				case hangarTake6 = "Hangar_Take_6"
				case hangarTake7 = "Hangar_Take_7"
				case juniorAccountant = "Junior_Accountant"
				case personnelManager = "Personnel_Manager"
				case rentFactoryFacility = "Rent_Factory_Facility"
				case rentOffice = "Rent_Office"
				case rentResearchFacility = "Rent_Research_Facility"
				case securityOfficer = "Security_Officer"
				case starbaseDefenseOperator = "Starbase_Defense_Operator"
				case starbaseFuelTechnician = "Starbase_Fuel_Technician"
				case stationManager = "Station_Manager"
				case terrestrialCombatOfficer = "Terrestrial_Combat_Officer"
				case terrestrialLogisticsOfficer = "Terrestrial_Logistics_Officer"
				case trader = "Trader"
				
				public init() {
					self = .accountTake1
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCorporationsCorporationIDRolesRolesAtHq(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDRolesGrantableRolesAtHq: String, JSONCoding, HTTPQueryable {
				case accountTake1 = "Account_Take_1"
				case accountTake2 = "Account_Take_2"
				case accountTake3 = "Account_Take_3"
				case accountTake4 = "Account_Take_4"
				case accountTake5 = "Account_Take_5"
				case accountTake6 = "Account_Take_6"
				case accountTake7 = "Account_Take_7"
				case accountant = "Accountant"
				case auditor = "Auditor"
				case communicationsOfficer = "Communications_Officer"
				case configEquipment = "Config_Equipment"
				case configStarbaseEquipment = "Config_Starbase_Equipment"
				case containerTake1 = "Container_Take_1"
				case containerTake2 = "Container_Take_2"
				case containerTake3 = "Container_Take_3"
				case containerTake4 = "Container_Take_4"
				case containerTake5 = "Container_Take_5"
				case containerTake6 = "Container_Take_6"
				case containerTake7 = "Container_Take_7"
				case contractManager = "Contract_Manager"
				case diplomat = "Diplomat"
				case director = "Director"
				case factoryManager = "Factory_Manager"
				case fittingManager = "Fitting_Manager"
				case hangarQuery1 = "Hangar_Query_1"
				case hangarQuery2 = "Hangar_Query_2"
				case hangarQuery3 = "Hangar_Query_3"
				case hangarQuery4 = "Hangar_Query_4"
				case hangarQuery5 = "Hangar_Query_5"
				case hangarQuery6 = "Hangar_Query_6"
				case hangarQuery7 = "Hangar_Query_7"
				case hangarTake1 = "Hangar_Take_1"
				case hangarTake2 = "Hangar_Take_2"
				case hangarTake3 = "Hangar_Take_3"
				case hangarTake4 = "Hangar_Take_4"
				case hangarTake5 = "Hangar_Take_5"
				case hangarTake6 = "Hangar_Take_6"
				case hangarTake7 = "Hangar_Take_7"
				case juniorAccountant = "Junior_Accountant"
				case personnelManager = "Personnel_Manager"
				case rentFactoryFacility = "Rent_Factory_Facility"
				case rentOffice = "Rent_Office"
				case rentResearchFacility = "Rent_Research_Facility"
				case securityOfficer = "Security_Officer"
				case starbaseDefenseOperator = "Starbase_Defense_Operator"
				case starbaseFuelTechnician = "Starbase_Fuel_Technician"
				case stationManager = "Station_Manager"
				case terrestrialCombatOfficer = "Terrestrial_Combat_Officer"
				case terrestrialLogisticsOfficer = "Terrestrial_Logistics_Officer"
				case trader = "Trader"
				
				public init() {
					self = .accountTake1
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCorporationsCorporationIDRolesGrantableRolesAtHq(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDRolesGrantableRolesAtBase: String, JSONCoding, HTTPQueryable {
				case accountTake1 = "Account_Take_1"
				case accountTake2 = "Account_Take_2"
				case accountTake3 = "Account_Take_3"
				case accountTake4 = "Account_Take_4"
				case accountTake5 = "Account_Take_5"
				case accountTake6 = "Account_Take_6"
				case accountTake7 = "Account_Take_7"
				case accountant = "Accountant"
				case auditor = "Auditor"
				case communicationsOfficer = "Communications_Officer"
				case configEquipment = "Config_Equipment"
				case configStarbaseEquipment = "Config_Starbase_Equipment"
				case containerTake1 = "Container_Take_1"
				case containerTake2 = "Container_Take_2"
				case containerTake3 = "Container_Take_3"
				case containerTake4 = "Container_Take_4"
				case containerTake5 = "Container_Take_5"
				case containerTake6 = "Container_Take_6"
				case containerTake7 = "Container_Take_7"
				case contractManager = "Contract_Manager"
				case diplomat = "Diplomat"
				case director = "Director"
				case factoryManager = "Factory_Manager"
				case fittingManager = "Fitting_Manager"
				case hangarQuery1 = "Hangar_Query_1"
				case hangarQuery2 = "Hangar_Query_2"
				case hangarQuery3 = "Hangar_Query_3"
				case hangarQuery4 = "Hangar_Query_4"
				case hangarQuery5 = "Hangar_Query_5"
				case hangarQuery6 = "Hangar_Query_6"
				case hangarQuery7 = "Hangar_Query_7"
				case hangarTake1 = "Hangar_Take_1"
				case hangarTake2 = "Hangar_Take_2"
				case hangarTake3 = "Hangar_Take_3"
				case hangarTake4 = "Hangar_Take_4"
				case hangarTake5 = "Hangar_Take_5"
				case hangarTake6 = "Hangar_Take_6"
				case hangarTake7 = "Hangar_Take_7"
				case juniorAccountant = "Junior_Accountant"
				case personnelManager = "Personnel_Manager"
				case rentFactoryFacility = "Rent_Factory_Facility"
				case rentOffice = "Rent_Office"
				case rentResearchFacility = "Rent_Research_Facility"
				case securityOfficer = "Security_Officer"
				case starbaseDefenseOperator = "Starbase_Defense_Operator"
				case starbaseFuelTechnician = "Starbase_Fuel_Technician"
				case stationManager = "Station_Manager"
				case terrestrialCombatOfficer = "Terrestrial_Combat_Officer"
				case terrestrialLogisticsOfficer = "Terrestrial_Logistics_Officer"
				case trader = "Trader"
				
				public init() {
					self = .accountTake1
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCorporationsCorporationIDRolesGrantableRolesAtBase(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDRolesRoles: String, JSONCoding, HTTPQueryable {
				case accountTake1 = "Account_Take_1"
				case accountTake2 = "Account_Take_2"
				case accountTake3 = "Account_Take_3"
				case accountTake4 = "Account_Take_4"
				case accountTake5 = "Account_Take_5"
				case accountTake6 = "Account_Take_6"
				case accountTake7 = "Account_Take_7"
				case accountant = "Accountant"
				case auditor = "Auditor"
				case communicationsOfficer = "Communications_Officer"
				case configEquipment = "Config_Equipment"
				case configStarbaseEquipment = "Config_Starbase_Equipment"
				case containerTake1 = "Container_Take_1"
				case containerTake2 = "Container_Take_2"
				case containerTake3 = "Container_Take_3"
				case containerTake4 = "Container_Take_4"
				case containerTake5 = "Container_Take_5"
				case containerTake6 = "Container_Take_6"
				case containerTake7 = "Container_Take_7"
				case contractManager = "Contract_Manager"
				case diplomat = "Diplomat"
				case director = "Director"
				case factoryManager = "Factory_Manager"
				case fittingManager = "Fitting_Manager"
				case hangarQuery1 = "Hangar_Query_1"
				case hangarQuery2 = "Hangar_Query_2"
				case hangarQuery3 = "Hangar_Query_3"
				case hangarQuery4 = "Hangar_Query_4"
				case hangarQuery5 = "Hangar_Query_5"
				case hangarQuery6 = "Hangar_Query_6"
				case hangarQuery7 = "Hangar_Query_7"
				case hangarTake1 = "Hangar_Take_1"
				case hangarTake2 = "Hangar_Take_2"
				case hangarTake3 = "Hangar_Take_3"
				case hangarTake4 = "Hangar_Take_4"
				case hangarTake5 = "Hangar_Take_5"
				case hangarTake6 = "Hangar_Take_6"
				case hangarTake7 = "Hangar_Take_7"
				case juniorAccountant = "Junior_Accountant"
				case personnelManager = "Personnel_Manager"
				case rentFactoryFacility = "Rent_Factory_Facility"
				case rentOffice = "Rent_Office"
				case rentResearchFacility = "Rent_Research_Facility"
				case securityOfficer = "Security_Officer"
				case starbaseDefenseOperator = "Starbase_Defense_Operator"
				case starbaseFuelTechnician = "Starbase_Fuel_Technician"
				case stationManager = "Station_Manager"
				case terrestrialCombatOfficer = "Terrestrial_Combat_Officer"
				case terrestrialLogisticsOfficer = "Terrestrial_Logistics_Officer"
				case trader = "Trader"
				
				public init() {
					self = .accountTake1
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCorporationsCorporationIDRolesRoles(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDRolesRolesAtOther: String, JSONCoding, HTTPQueryable {
				case accountTake1 = "Account_Take_1"
				case accountTake2 = "Account_Take_2"
				case accountTake3 = "Account_Take_3"
				case accountTake4 = "Account_Take_4"
				case accountTake5 = "Account_Take_5"
				case accountTake6 = "Account_Take_6"
				case accountTake7 = "Account_Take_7"
				case accountant = "Accountant"
				case auditor = "Auditor"
				case communicationsOfficer = "Communications_Officer"
				case configEquipment = "Config_Equipment"
				case configStarbaseEquipment = "Config_Starbase_Equipment"
				case containerTake1 = "Container_Take_1"
				case containerTake2 = "Container_Take_2"
				case containerTake3 = "Container_Take_3"
				case containerTake4 = "Container_Take_4"
				case containerTake5 = "Container_Take_5"
				case containerTake6 = "Container_Take_6"
				case containerTake7 = "Container_Take_7"
				case contractManager = "Contract_Manager"
				case diplomat = "Diplomat"
				case director = "Director"
				case factoryManager = "Factory_Manager"
				case fittingManager = "Fitting_Manager"
				case hangarQuery1 = "Hangar_Query_1"
				case hangarQuery2 = "Hangar_Query_2"
				case hangarQuery3 = "Hangar_Query_3"
				case hangarQuery4 = "Hangar_Query_4"
				case hangarQuery5 = "Hangar_Query_5"
				case hangarQuery6 = "Hangar_Query_6"
				case hangarQuery7 = "Hangar_Query_7"
				case hangarTake1 = "Hangar_Take_1"
				case hangarTake2 = "Hangar_Take_2"
				case hangarTake3 = "Hangar_Take_3"
				case hangarTake4 = "Hangar_Take_4"
				case hangarTake5 = "Hangar_Take_5"
				case hangarTake6 = "Hangar_Take_6"
				case hangarTake7 = "Hangar_Take_7"
				case juniorAccountant = "Junior_Accountant"
				case personnelManager = "Personnel_Manager"
				case rentFactoryFacility = "Rent_Factory_Facility"
				case rentOffice = "Rent_Office"
				case rentResearchFacility = "Rent_Research_Facility"
				case securityOfficer = "Security_Officer"
				case starbaseDefenseOperator = "Starbase_Defense_Operator"
				case starbaseFuelTechnician = "Starbase_Fuel_Technician"
				case stationManager = "Station_Manager"
				case terrestrialCombatOfficer = "Terrestrial_Combat_Officer"
				case terrestrialLogisticsOfficer = "Terrestrial_Logistics_Officer"
				case trader = "Trader"
				
				public init() {
					self = .accountTake1
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCorporationsCorporationIDRolesRolesAtOther(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDRolesGrantableRolesAtOther: String, JSONCoding, HTTPQueryable {
				case accountTake1 = "Account_Take_1"
				case accountTake2 = "Account_Take_2"
				case accountTake3 = "Account_Take_3"
				case accountTake4 = "Account_Take_4"
				case accountTake5 = "Account_Take_5"
				case accountTake6 = "Account_Take_6"
				case accountTake7 = "Account_Take_7"
				case accountant = "Accountant"
				case auditor = "Auditor"
				case communicationsOfficer = "Communications_Officer"
				case configEquipment = "Config_Equipment"
				case configStarbaseEquipment = "Config_Starbase_Equipment"
				case containerTake1 = "Container_Take_1"
				case containerTake2 = "Container_Take_2"
				case containerTake3 = "Container_Take_3"
				case containerTake4 = "Container_Take_4"
				case containerTake5 = "Container_Take_5"
				case containerTake6 = "Container_Take_6"
				case containerTake7 = "Container_Take_7"
				case contractManager = "Contract_Manager"
				case diplomat = "Diplomat"
				case director = "Director"
				case factoryManager = "Factory_Manager"
				case fittingManager = "Fitting_Manager"
				case hangarQuery1 = "Hangar_Query_1"
				case hangarQuery2 = "Hangar_Query_2"
				case hangarQuery3 = "Hangar_Query_3"
				case hangarQuery4 = "Hangar_Query_4"
				case hangarQuery5 = "Hangar_Query_5"
				case hangarQuery6 = "Hangar_Query_6"
				case hangarQuery7 = "Hangar_Query_7"
				case hangarTake1 = "Hangar_Take_1"
				case hangarTake2 = "Hangar_Take_2"
				case hangarTake3 = "Hangar_Take_3"
				case hangarTake4 = "Hangar_Take_4"
				case hangarTake5 = "Hangar_Take_5"
				case hangarTake6 = "Hangar_Take_6"
				case hangarTake7 = "Hangar_Take_7"
				case juniorAccountant = "Junior_Accountant"
				case personnelManager = "Personnel_Manager"
				case rentFactoryFacility = "Rent_Factory_Facility"
				case rentOffice = "Rent_Office"
				case rentResearchFacility = "Rent_Research_Facility"
				case securityOfficer = "Security_Officer"
				case starbaseDefenseOperator = "Starbase_Defense_Operator"
				case starbaseFuelTechnician = "Starbase_Fuel_Technician"
				case stationManager = "Station_Manager"
				case terrestrialCombatOfficer = "Terrestrial_Combat_Officer"
				case terrestrialLogisticsOfficer = "Terrestrial_Logistics_Officer"
				case trader = "Trader"
				
				public init() {
					self = .accountTake1
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCorporationsCorporationIDRolesGrantableRolesAtOther(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDRolesGrantableRoles: String, JSONCoding, HTTPQueryable {
				case accountTake1 = "Account_Take_1"
				case accountTake2 = "Account_Take_2"
				case accountTake3 = "Account_Take_3"
				case accountTake4 = "Account_Take_4"
				case accountTake5 = "Account_Take_5"
				case accountTake6 = "Account_Take_6"
				case accountTake7 = "Account_Take_7"
				case accountant = "Accountant"
				case auditor = "Auditor"
				case communicationsOfficer = "Communications_Officer"
				case configEquipment = "Config_Equipment"
				case configStarbaseEquipment = "Config_Starbase_Equipment"
				case containerTake1 = "Container_Take_1"
				case containerTake2 = "Container_Take_2"
				case containerTake3 = "Container_Take_3"
				case containerTake4 = "Container_Take_4"
				case containerTake5 = "Container_Take_5"
				case containerTake6 = "Container_Take_6"
				case containerTake7 = "Container_Take_7"
				case contractManager = "Contract_Manager"
				case diplomat = "Diplomat"
				case director = "Director"
				case factoryManager = "Factory_Manager"
				case fittingManager = "Fitting_Manager"
				case hangarQuery1 = "Hangar_Query_1"
				case hangarQuery2 = "Hangar_Query_2"
				case hangarQuery3 = "Hangar_Query_3"
				case hangarQuery4 = "Hangar_Query_4"
				case hangarQuery5 = "Hangar_Query_5"
				case hangarQuery6 = "Hangar_Query_6"
				case hangarQuery7 = "Hangar_Query_7"
				case hangarTake1 = "Hangar_Take_1"
				case hangarTake2 = "Hangar_Take_2"
				case hangarTake3 = "Hangar_Take_3"
				case hangarTake4 = "Hangar_Take_4"
				case hangarTake5 = "Hangar_Take_5"
				case hangarTake6 = "Hangar_Take_6"
				case hangarTake7 = "Hangar_Take_7"
				case juniorAccountant = "Junior_Accountant"
				case personnelManager = "Personnel_Manager"
				case rentFactoryFacility = "Rent_Factory_Facility"
				case rentOffice = "Rent_Office"
				case rentResearchFacility = "Rent_Research_Facility"
				case securityOfficer = "Security_Officer"
				case starbaseDefenseOperator = "Starbase_Defense_Operator"
				case starbaseFuelTechnician = "Starbase_Fuel_Technician"
				case stationManager = "Station_Manager"
				case terrestrialCombatOfficer = "Terrestrial_Combat_Officer"
				case terrestrialLogisticsOfficer = "Terrestrial_Logistics_Officer"
				case trader = "Trader"
				
				public init() {
					self = .accountTake1
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCorporationsCorporationIDRolesGrantableRoles(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDRolesRolesAtBase: String, JSONCoding, HTTPQueryable {
				case accountTake1 = "Account_Take_1"
				case accountTake2 = "Account_Take_2"
				case accountTake3 = "Account_Take_3"
				case accountTake4 = "Account_Take_4"
				case accountTake5 = "Account_Take_5"
				case accountTake6 = "Account_Take_6"
				case accountTake7 = "Account_Take_7"
				case accountant = "Accountant"
				case auditor = "Auditor"
				case communicationsOfficer = "Communications_Officer"
				case configEquipment = "Config_Equipment"
				case configStarbaseEquipment = "Config_Starbase_Equipment"
				case containerTake1 = "Container_Take_1"
				case containerTake2 = "Container_Take_2"
				case containerTake3 = "Container_Take_3"
				case containerTake4 = "Container_Take_4"
				case containerTake5 = "Container_Take_5"
				case containerTake6 = "Container_Take_6"
				case containerTake7 = "Container_Take_7"
				case contractManager = "Contract_Manager"
				case diplomat = "Diplomat"
				case director = "Director"
				case factoryManager = "Factory_Manager"
				case fittingManager = "Fitting_Manager"
				case hangarQuery1 = "Hangar_Query_1"
				case hangarQuery2 = "Hangar_Query_2"
				case hangarQuery3 = "Hangar_Query_3"
				case hangarQuery4 = "Hangar_Query_4"
				case hangarQuery5 = "Hangar_Query_5"
				case hangarQuery6 = "Hangar_Query_6"
				case hangarQuery7 = "Hangar_Query_7"
				case hangarTake1 = "Hangar_Take_1"
				case hangarTake2 = "Hangar_Take_2"
				case hangarTake3 = "Hangar_Take_3"
				case hangarTake4 = "Hangar_Take_4"
				case hangarTake5 = "Hangar_Take_5"
				case hangarTake6 = "Hangar_Take_6"
				case hangarTake7 = "Hangar_Take_7"
				case juniorAccountant = "Junior_Accountant"
				case personnelManager = "Personnel_Manager"
				case rentFactoryFacility = "Rent_Factory_Facility"
				case rentOffice = "Rent_Office"
				case rentResearchFacility = "Rent_Research_Facility"
				case securityOfficer = "Security_Officer"
				case starbaseDefenseOperator = "Starbase_Defense_Operator"
				case starbaseFuelTechnician = "Starbase_Fuel_Technician"
				case stationManager = "Station_Manager"
				case terrestrialCombatOfficer = "Terrestrial_Combat_Officer"
				case terrestrialLogisticsOfficer = "Terrestrial_Logistics_Officer"
				case trader = "Trader"
				
				public init() {
					self = .accountTake1
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCorporationsCorporationIDRolesRolesAtBase(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var characterID: Int = Int()
			public var grantableRoles: [Corporation.Role.GetCorporationsCorporationIDRolesGrantableRoles]? = nil
			public var grantableRolesAtBase: [Corporation.Role.GetCorporationsCorporationIDRolesGrantableRolesAtBase]? = nil
			public var grantableRolesAtHq: [Corporation.Role.GetCorporationsCorporationIDRolesGrantableRolesAtHq]? = nil
			public var grantableRolesAtOther: [Corporation.Role.GetCorporationsCorporationIDRolesGrantableRolesAtOther]? = nil
			public var roles: [Corporation.Role.GetCorporationsCorporationIDRolesRoles]? = nil
			public var rolesAtBase: [Corporation.Role.GetCorporationsCorporationIDRolesRolesAtBase]? = nil
			public var rolesAtHq: [Corporation.Role.GetCorporationsCorporationIDRolesRolesAtHq]? = nil
			public var rolesAtOther: [Corporation.Role.GetCorporationsCorporationIDRolesRolesAtOther]? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let characterID = dictionary["character_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.characterID = characterID
				grantableRoles = try (dictionary["grantable_roles"] as? [Any])?.map {try Corporation.Role.GetCorporationsCorporationIDRolesGrantableRoles(json: $0)}
				grantableRolesAtBase = try (dictionary["grantable_roles_at_base"] as? [Any])?.map {try Corporation.Role.GetCorporationsCorporationIDRolesGrantableRolesAtBase(json: $0)}
				grantableRolesAtHq = try (dictionary["grantable_roles_at_hq"] as? [Any])?.map {try Corporation.Role.GetCorporationsCorporationIDRolesGrantableRolesAtHq(json: $0)}
				grantableRolesAtOther = try (dictionary["grantable_roles_at_other"] as? [Any])?.map {try Corporation.Role.GetCorporationsCorporationIDRolesGrantableRolesAtOther(json: $0)}
				roles = try (dictionary["roles"] as? [Any])?.map {try Corporation.Role.GetCorporationsCorporationIDRolesRoles(json: $0)}
				rolesAtBase = try (dictionary["roles_at_base"] as? [Any])?.map {try Corporation.Role.GetCorporationsCorporationIDRolesRolesAtBase(json: $0)}
				rolesAtHq = try (dictionary["roles_at_hq"] as? [Any])?.map {try Corporation.Role.GetCorporationsCorporationIDRolesRolesAtHq(json: $0)}
				rolesAtOther = try (dictionary["roles_at_other"] as? [Any])?.map {try Corporation.Role.GetCorporationsCorporationIDRolesRolesAtOther(json: $0)}
				
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
				grantableRoles = aDecoder.decodeObject(forKey: "grantable_roles") as? [Corporation.Role.GetCorporationsCorporationIDRolesGrantableRoles]
				grantableRolesAtBase = aDecoder.decodeObject(forKey: "grantable_roles_at_base") as? [Corporation.Role.GetCorporationsCorporationIDRolesGrantableRolesAtBase]
				grantableRolesAtHq = aDecoder.decodeObject(forKey: "grantable_roles_at_hq") as? [Corporation.Role.GetCorporationsCorporationIDRolesGrantableRolesAtHq]
				grantableRolesAtOther = aDecoder.decodeObject(forKey: "grantable_roles_at_other") as? [Corporation.Role.GetCorporationsCorporationIDRolesGrantableRolesAtOther]
				roles = aDecoder.decodeObject(forKey: "roles") as? [Corporation.Role.GetCorporationsCorporationIDRolesRoles]
				rolesAtBase = aDecoder.decodeObject(forKey: "roles_at_base") as? [Corporation.Role.GetCorporationsCorporationIDRolesRolesAtBase]
				rolesAtHq = aDecoder.decodeObject(forKey: "roles_at_hq") as? [Corporation.Role.GetCorporationsCorporationIDRolesRolesAtHq]
				rolesAtOther = aDecoder.decodeObject(forKey: "roles_at_other") as? [Corporation.Role.GetCorporationsCorporationIDRolesRolesAtOther]
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(characterID, forKey: "character_id")
				if let v = grantableRoles {
					aCoder.encode(v, forKey: "grantable_roles")
				}
				if let v = grantableRolesAtBase {
					aCoder.encode(v, forKey: "grantable_roles_at_base")
				}
				if let v = grantableRolesAtHq {
					aCoder.encode(v, forKey: "grantable_roles_at_hq")
				}
				if let v = grantableRolesAtOther {
					aCoder.encode(v, forKey: "grantable_roles_at_other")
				}
				if let v = roles {
					aCoder.encode(v, forKey: "roles")
				}
				if let v = rolesAtBase {
					aCoder.encode(v, forKey: "roles_at_base")
				}
				if let v = rolesAtHq {
					aCoder.encode(v, forKey: "roles_at_hq")
				}
				if let v = rolesAtOther {
					aCoder.encode(v, forKey: "roles_at_other")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["character_id"] = characterID.json
				if let v = grantableRoles?.json {
					json["grantable_roles"] = v
				}
				if let v = grantableRolesAtBase?.json {
					json["grantable_roles_at_base"] = v
				}
				if let v = grantableRolesAtHq?.json {
					json["grantable_roles_at_hq"] = v
				}
				if let v = grantableRolesAtOther?.json {
					json["grantable_roles_at_other"] = v
				}
				if let v = roles?.json {
					json["roles"] = v
				}
				if let v = rolesAtBase?.json {
					json["roles_at_base"] = v
				}
				if let v = rolesAtHq?.json {
					json["roles_at_hq"] = v
				}
				if let v = rolesAtOther?.json {
					json["roles_at_other"] = v
				}
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.characterID.hashValue)
				self.grantableRoles?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.grantableRolesAtBase?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.grantableRolesAtHq?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.grantableRolesAtOther?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.roles?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.rolesAtBase?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.rolesAtHq?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.rolesAtOther?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Corporation.Role, rhs: Corporation.Role) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Corporation.Role) {
				characterID = other.characterID
				grantableRoles = other.grantableRoles?.flatMap { $0 }
				grantableRolesAtBase = other.grantableRolesAtBase?.flatMap { $0 }
				grantableRolesAtHq = other.grantableRolesAtHq?.flatMap { $0 }
				grantableRolesAtOther = other.grantableRolesAtOther?.flatMap { $0 }
				roles = other.roles?.flatMap { $0 }
				rolesAtBase = other.rolesAtBase?.flatMap { $0 }
				rolesAtHq = other.rolesAtHq?.flatMap { $0 }
				rolesAtOther = other.rolesAtOther?.flatMap { $0 }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Corporation.Role(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Role)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESICorporationGetCorporationsCorporationIDBlueprintsOk) public class GetCorporationsCorporationIDBlueprintsOk: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public enum GetCorporationsCorporationIDBlueprintsLocationFlag: String, JSONCoding, HTTPQueryable {
				case assetSafety = "AssetSafety"
				case autoFit = "AutoFit"
				case bonus = "Bonus"
				case booster = "Booster"
				case boosterBay = "BoosterBay"
				case capsule = "Capsule"
				case cargo = "Cargo"
				case corpDeliveries = "CorpDeliveries"
				case corpSAG1 = "CorpSAG1"
				case corpSAG2 = "CorpSAG2"
				case corpSAG3 = "CorpSAG3"
				case corpSAG4 = "CorpSAG4"
				case corpSAG5 = "CorpSAG5"
				case corpSAG6 = "CorpSAG6"
				case corpSAG7 = "CorpSAG7"
				case crateLoot = "CrateLoot"
				case deliveries = "Deliveries"
				case droneBay = "DroneBay"
				case dustBattle = "DustBattle"
				case dustDatabank = "DustDatabank"
				case fighterBay = "FighterBay"
				case fighterTube0 = "FighterTube0"
				case fighterTube1 = "FighterTube1"
				case fighterTube2 = "FighterTube2"
				case fighterTube3 = "FighterTube3"
				case fighterTube4 = "FighterTube4"
				case fleetHangar = "FleetHangar"
				case hangar = "Hangar"
				case hangarAll = "HangarAll"
				case hiSlot0 = "HiSlot0"
				case hiSlot1 = "HiSlot1"
				case hiSlot2 = "HiSlot2"
				case hiSlot3 = "HiSlot3"
				case hiSlot4 = "HiSlot4"
				case hiSlot5 = "HiSlot5"
				case hiSlot6 = "HiSlot6"
				case hiSlot7 = "HiSlot7"
				case hiddenModifers = "HiddenModifers"
				case implant = "Implant"
				case impounded = "Impounded"
				case junkyardReprocessed = "JunkyardReprocessed"
				case junkyardTrashed = "JunkyardTrashed"
				case loSlot0 = "LoSlot0"
				case loSlot1 = "LoSlot1"
				case loSlot2 = "LoSlot2"
				case loSlot3 = "LoSlot3"
				case loSlot4 = "LoSlot4"
				case loSlot5 = "LoSlot5"
				case loSlot6 = "LoSlot6"
				case loSlot7 = "LoSlot7"
				case locked = "Locked"
				case medSlot0 = "MedSlot0"
				case medSlot1 = "MedSlot1"
				case medSlot2 = "MedSlot2"
				case medSlot3 = "MedSlot3"
				case medSlot4 = "MedSlot4"
				case medSlot5 = "MedSlot5"
				case medSlot6 = "MedSlot6"
				case medSlot7 = "MedSlot7"
				case officeFolder = "OfficeFolder"
				case pilot = "Pilot"
				case planetSurface = "PlanetSurface"
				case quafeBay = "QuafeBay"
				case reward = "Reward"
				case rigSlot0 = "RigSlot0"
				case rigSlot1 = "RigSlot1"
				case rigSlot2 = "RigSlot2"
				case rigSlot3 = "RigSlot3"
				case rigSlot4 = "RigSlot4"
				case rigSlot5 = "RigSlot5"
				case rigSlot6 = "RigSlot6"
				case rigSlot7 = "RigSlot7"
				case secondaryStorage = "SecondaryStorage"
				case serviceSlot0 = "ServiceSlot0"
				case serviceSlot1 = "ServiceSlot1"
				case serviceSlot2 = "ServiceSlot2"
				case serviceSlot3 = "ServiceSlot3"
				case serviceSlot4 = "ServiceSlot4"
				case serviceSlot5 = "ServiceSlot5"
				case serviceSlot6 = "ServiceSlot6"
				case serviceSlot7 = "ServiceSlot7"
				case shipHangar = "ShipHangar"
				case shipOffline = "ShipOffline"
				case skill = "Skill"
				case skillInTraining = "SkillInTraining"
				case specializedAmmoHold = "SpecializedAmmoHold"
				case specializedCommandCenterHold = "SpecializedCommandCenterHold"
				case specializedFuelBay = "SpecializedFuelBay"
				case specializedGasHold = "SpecializedGasHold"
				case specializedIndustrialShipHold = "SpecializedIndustrialShipHold"
				case specializedLargeShipHold = "SpecializedLargeShipHold"
				case specializedMaterialBay = "SpecializedMaterialBay"
				case specializedMediumShipHold = "SpecializedMediumShipHold"
				case specializedMineralHold = "SpecializedMineralHold"
				case specializedOreHold = "SpecializedOreHold"
				case specializedPlanetaryCommoditiesHold = "SpecializedPlanetaryCommoditiesHold"
				case specializedSalvageHold = "SpecializedSalvageHold"
				case specializedShipHold = "SpecializedShipHold"
				case specializedSmallShipHold = "SpecializedSmallShipHold"
				case structureActive = "StructureActive"
				case structureFuel = "StructureFuel"
				case structureInactive = "StructureInactive"
				case structureOffline = "StructureOffline"
				case subSystemSlot0 = "SubSystemSlot0"
				case subSystemSlot1 = "SubSystemSlot1"
				case subSystemSlot2 = "SubSystemSlot2"
				case subSystemSlot3 = "SubSystemSlot3"
				case subSystemSlot4 = "SubSystemSlot4"
				case subSystemSlot5 = "SubSystemSlot5"
				case subSystemSlot6 = "SubSystemSlot6"
				case subSystemSlot7 = "SubSystemSlot7"
				case subsystemBay = "SubsystemBay"
				case unlocked = "Unlocked"
				case wallet = "Wallet"
				case wardrobe = "Wardrobe"
				
				public init() {
					self = .assetSafety
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCorporationsCorporationIDBlueprintsLocationFlag(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var itemID: Int64 = Int64()
			public var locationFlag: Corporation.GetCorporationsCorporationIDBlueprintsOk.GetCorporationsCorporationIDBlueprintsLocationFlag = Corporation.GetCorporationsCorporationIDBlueprintsOk.GetCorporationsCorporationIDBlueprintsLocationFlag()
			public var locationID: Int64 = Int64()
			public var materialEfficiency: Int = Int()
			public var quantity: Int = Int()
			public var runs: Int = Int()
			public var timeEfficiency: Int = Int()
			public var typeID: Int = Int()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let itemID = dictionary["item_id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.itemID = itemID
				guard let locationFlag = Corporation.GetCorporationsCorporationIDBlueprintsOk.GetCorporationsCorporationIDBlueprintsLocationFlag(rawValue: dictionary["location_flag"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.locationFlag = locationFlag
				guard let locationID = dictionary["location_id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.locationID = locationID
				guard let materialEfficiency = dictionary["material_efficiency"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.materialEfficiency = materialEfficiency
				guard let quantity = dictionary["quantity"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.quantity = quantity
				guard let runs = dictionary["runs"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.runs = runs
				guard let timeEfficiency = dictionary["time_efficiency"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.timeEfficiency = timeEfficiency
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
				itemID = aDecoder.decodeInt64(forKey: "item_id")
				locationFlag = Corporation.GetCorporationsCorporationIDBlueprintsOk.GetCorporationsCorporationIDBlueprintsLocationFlag(rawValue: aDecoder.decodeObject(forKey: "location_flag") as? String ?? "") ?? Corporation.GetCorporationsCorporationIDBlueprintsOk.GetCorporationsCorporationIDBlueprintsLocationFlag()
				locationID = aDecoder.decodeInt64(forKey: "location_id")
				materialEfficiency = aDecoder.decodeInteger(forKey: "material_efficiency")
				quantity = aDecoder.decodeInteger(forKey: "quantity")
				runs = aDecoder.decodeInteger(forKey: "runs")
				timeEfficiency = aDecoder.decodeInteger(forKey: "time_efficiency")
				typeID = aDecoder.decodeInteger(forKey: "type_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(itemID, forKey: "item_id")
				aCoder.encode(locationFlag.rawValue, forKey: "location_flag")
				aCoder.encode(locationID, forKey: "location_id")
				aCoder.encode(materialEfficiency, forKey: "material_efficiency")
				aCoder.encode(quantity, forKey: "quantity")
				aCoder.encode(runs, forKey: "runs")
				aCoder.encode(timeEfficiency, forKey: "time_efficiency")
				aCoder.encode(typeID, forKey: "type_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["item_id"] = itemID.json
				json["location_flag"] = locationFlag.json
				json["location_id"] = locationID.json
				json["material_efficiency"] = materialEfficiency.json
				json["quantity"] = quantity.json
				json["runs"] = runs.json
				json["time_efficiency"] = timeEfficiency.json
				json["type_id"] = typeID.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.itemID.hashValue)
				hashCombine(seed: &hash, value: self.locationFlag.hashValue)
				hashCombine(seed: &hash, value: self.locationID.hashValue)
				hashCombine(seed: &hash, value: self.materialEfficiency.hashValue)
				hashCombine(seed: &hash, value: self.quantity.hashValue)
				hashCombine(seed: &hash, value: self.runs.hashValue)
				hashCombine(seed: &hash, value: self.timeEfficiency.hashValue)
				hashCombine(seed: &hash, value: self.typeID.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Corporation.GetCorporationsCorporationIDBlueprintsOk, rhs: Corporation.GetCorporationsCorporationIDBlueprintsOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Corporation.GetCorporationsCorporationIDBlueprintsOk) {
				itemID = other.itemID
				locationFlag = other.locationFlag
				locationID = other.locationID
				materialEfficiency = other.materialEfficiency
				quantity = other.quantity
				runs = other.runs
				timeEfficiency = other.timeEfficiency
				typeID = other.typeID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Corporation.GetCorporationsCorporationIDBlueprintsOk(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCorporationsCorporationIDBlueprintsOk)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESICorporationGetCorporationsCorporationIDDivisionsOk) public class GetCorporationsCorporationIDDivisionsOk: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			@objc(ESICorporationGetCorporationsCorporationIDDivisionsOkGetCorporationsCorporationIDDivisionsWallet) public class GetCorporationsCorporationIDDivisionsWallet: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var division: Int? = nil
				public var name: String? = nil
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					division = dictionary["division"] as? Int
					name = dictionary["name"] as? String
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init?(coder aDecoder: NSCoder) {
					division = aDecoder.containsValue(forKey: "division") ? aDecoder.decodeInteger(forKey: "division") : nil
					name = aDecoder.decodeObject(forKey: "name") as? String
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					if let v = division {
						aCoder.encode(v, forKey: "division")
					}
					if let v = name {
						aCoder.encode(v, forKey: "name")
					}
				}
				
				public var json: Any {
					var json = [String: Any]()
					if let v = division?.json {
						json["division"] = v
					}
					if let v = name?.json {
						json["name"] = v
					}
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.division?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.name?.hashValue ?? 0)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: Corporation.GetCorporationsCorporationIDDivisionsOk.GetCorporationsCorporationIDDivisionsWallet, rhs: Corporation.GetCorporationsCorporationIDDivisionsOk.GetCorporationsCorporationIDDivisionsWallet) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Corporation.GetCorporationsCorporationIDDivisionsOk.GetCorporationsCorporationIDDivisionsWallet) {
					division = other.division
					name = other.name
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Corporation.GetCorporationsCorporationIDDivisionsOk.GetCorporationsCorporationIDDivisionsWallet(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetCorporationsCorporationIDDivisionsWallet)?.hashValue == hashValue
				}
				
			}
			
			@objc(ESICorporationGetCorporationsCorporationIDDivisionsOkGetCorporationsCorporationIDDivisionsHangar) public class GetCorporationsCorporationIDDivisionsHangar: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var division: Int? = nil
				public var name: String? = nil
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					division = dictionary["division"] as? Int
					name = dictionary["name"] as? String
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init?(coder aDecoder: NSCoder) {
					division = aDecoder.containsValue(forKey: "division") ? aDecoder.decodeInteger(forKey: "division") : nil
					name = aDecoder.decodeObject(forKey: "name") as? String
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					if let v = division {
						aCoder.encode(v, forKey: "division")
					}
					if let v = name {
						aCoder.encode(v, forKey: "name")
					}
				}
				
				public var json: Any {
					var json = [String: Any]()
					if let v = division?.json {
						json["division"] = v
					}
					if let v = name?.json {
						json["name"] = v
					}
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.division?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.name?.hashValue ?? 0)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: Corporation.GetCorporationsCorporationIDDivisionsOk.GetCorporationsCorporationIDDivisionsHangar, rhs: Corporation.GetCorporationsCorporationIDDivisionsOk.GetCorporationsCorporationIDDivisionsHangar) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Corporation.GetCorporationsCorporationIDDivisionsOk.GetCorporationsCorporationIDDivisionsHangar) {
					division = other.division
					name = other.name
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Corporation.GetCorporationsCorporationIDDivisionsOk.GetCorporationsCorporationIDDivisionsHangar(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetCorporationsCorporationIDDivisionsHangar)?.hashValue == hashValue
				}
				
			}
			
			public var hangar: [Corporation.GetCorporationsCorporationIDDivisionsOk.GetCorporationsCorporationIDDivisionsHangar]? = nil
			public var wallet: [Corporation.GetCorporationsCorporationIDDivisionsOk.GetCorporationsCorporationIDDivisionsWallet]? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				hangar = try (dictionary["hangar"] as? [Any])?.map {try Corporation.GetCorporationsCorporationIDDivisionsOk.GetCorporationsCorporationIDDivisionsHangar(json: $0)}
				wallet = try (dictionary["wallet"] as? [Any])?.map {try Corporation.GetCorporationsCorporationIDDivisionsOk.GetCorporationsCorporationIDDivisionsWallet(json: $0)}
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				hangar = aDecoder.decodeObject(of: [Corporation.GetCorporationsCorporationIDDivisionsOk.GetCorporationsCorporationIDDivisionsHangar.self], forKey: "hangar") as? [Corporation.GetCorporationsCorporationIDDivisionsOk.GetCorporationsCorporationIDDivisionsHangar]
				wallet = aDecoder.decodeObject(of: [Corporation.GetCorporationsCorporationIDDivisionsOk.GetCorporationsCorporationIDDivisionsWallet.self], forKey: "wallet") as? [Corporation.GetCorporationsCorporationIDDivisionsOk.GetCorporationsCorporationIDDivisionsWallet]
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = hangar {
					aCoder.encode(v, forKey: "hangar")
				}
				if let v = wallet {
					aCoder.encode(v, forKey: "wallet")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = hangar?.json {
					json["hangar"] = v
				}
				if let v = wallet?.json {
					json["wallet"] = v
				}
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.hangar?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.wallet?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Corporation.GetCorporationsCorporationIDDivisionsOk, rhs: Corporation.GetCorporationsCorporationIDDivisionsOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Corporation.GetCorporationsCorporationIDDivisionsOk) {
				hangar = other.hangar?.flatMap { Corporation.GetCorporationsCorporationIDDivisionsOk.GetCorporationsCorporationIDDivisionsHangar($0) }
				wallet = other.wallet?.flatMap { Corporation.GetCorporationsCorporationIDDivisionsOk.GetCorporationsCorporationIDDivisionsWallet($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Corporation.GetCorporationsCorporationIDDivisionsOk(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCorporationsCorporationIDDivisionsOk)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESICorporationStructure) public class Structure: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			@objc(ESICorporationStructureGetCorporationsCorporationIDStructuresCurrentVul) public class GetCorporationsCorporationIDStructuresCurrentVul: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var day: Int = Int()
				public var hour: Int = Int()
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let day = dictionary["day"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.day = day
					guard let hour = dictionary["hour"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.hour = hour
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init?(coder aDecoder: NSCoder) {
					day = aDecoder.decodeInteger(forKey: "day")
					hour = aDecoder.decodeInteger(forKey: "hour")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(day, forKey: "day")
					aCoder.encode(hour, forKey: "hour")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["day"] = day.json
					json["hour"] = hour.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.day.hashValue)
					hashCombine(seed: &hash, value: self.hour.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: Corporation.Structure.GetCorporationsCorporationIDStructuresCurrentVul, rhs: Corporation.Structure.GetCorporationsCorporationIDStructuresCurrentVul) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Corporation.Structure.GetCorporationsCorporationIDStructuresCurrentVul) {
					day = other.day
					hour = other.hour
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Corporation.Structure.GetCorporationsCorporationIDStructuresCurrentVul(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetCorporationsCorporationIDStructuresCurrentVul)?.hashValue == hashValue
				}
				
			}
			
			@objc(ESICorporationStructureGetCorporationsCorporationIDStructuresServices) public class GetCorporationsCorporationIDStructuresServices: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				public enum GetCorporationsCorporationIDStructuresState: String, JSONCoding, HTTPQueryable {
					case cleanup = "cleanup"
					case offline = "offline"
					case online = "online"
					
					public init() {
						self = .online
					}
					
					public var json: Any {
						return self.rawValue
					}
					
					public init(json: Any) throws {
						guard let s = json as? String, let v = GetCorporationsCorporationIDStructuresState(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
						self = v
					}
					
					public var httpQuery: String? {
						return rawValue
					}
					
				}
				
				public var name: String = String()
				public var state: Corporation.Structure.GetCorporationsCorporationIDStructuresServices.GetCorporationsCorporationIDStructuresState = Corporation.Structure.GetCorporationsCorporationIDStructuresServices.GetCorporationsCorporationIDStructuresState()
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.name = name
					guard let state = Corporation.Structure.GetCorporationsCorporationIDStructuresServices.GetCorporationsCorporationIDStructuresState(rawValue: dictionary["state"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.state = state
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init?(coder aDecoder: NSCoder) {
					name = aDecoder.decodeObject(forKey: "name") as? String ?? String()
					state = Corporation.Structure.GetCorporationsCorporationIDStructuresServices.GetCorporationsCorporationIDStructuresState(rawValue: aDecoder.decodeObject(forKey: "state") as? String ?? "") ?? Corporation.Structure.GetCorporationsCorporationIDStructuresServices.GetCorporationsCorporationIDStructuresState()
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(name, forKey: "name")
					aCoder.encode(state.rawValue, forKey: "state")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["name"] = name.json
					json["state"] = state.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.name.hashValue)
					hashCombine(seed: &hash, value: self.state.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: Corporation.Structure.GetCorporationsCorporationIDStructuresServices, rhs: Corporation.Structure.GetCorporationsCorporationIDStructuresServices) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Corporation.Structure.GetCorporationsCorporationIDStructuresServices) {
					name = other.name
					state = other.state
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Corporation.Structure.GetCorporationsCorporationIDStructuresServices(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetCorporationsCorporationIDStructuresServices)?.hashValue == hashValue
				}
				
			}
			
			@objc(ESICorporationStructureGetCorporationsCorporationIDStructuresNextVul) public class GetCorporationsCorporationIDStructuresNextVul: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var day: Int = Int()
				public var hour: Int = Int()
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let day = dictionary["day"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.day = day
					guard let hour = dictionary["hour"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.hour = hour
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init?(coder aDecoder: NSCoder) {
					day = aDecoder.decodeInteger(forKey: "day")
					hour = aDecoder.decodeInteger(forKey: "hour")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(day, forKey: "day")
					aCoder.encode(hour, forKey: "hour")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["day"] = day.json
					json["hour"] = hour.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.day.hashValue)
					hashCombine(seed: &hash, value: self.hour.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: Corporation.Structure.GetCorporationsCorporationIDStructuresNextVul, rhs: Corporation.Structure.GetCorporationsCorporationIDStructuresNextVul) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Corporation.Structure.GetCorporationsCorporationIDStructuresNextVul) {
					day = other.day
					hour = other.hour
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Corporation.Structure.GetCorporationsCorporationIDStructuresNextVul(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetCorporationsCorporationIDStructuresNextVul)?.hashValue == hashValue
				}
				
			}
			
			public var corporationID: Int = Int()
			public var currentVul: [Corporation.Structure.GetCorporationsCorporationIDStructuresCurrentVul] = []
			public var fuelExpires: Date? = nil
			public var nextVul: [Corporation.Structure.GetCorporationsCorporationIDStructuresNextVul] = []
			public var profileID: Int = Int()
			public var services: [Corporation.Structure.GetCorporationsCorporationIDStructuresServices]? = nil
			public var stateTimerEnd: Date? = nil
			public var stateTimerStart: Date? = nil
			public var structureID: Int64 = Int64()
			public var systemID: Int = Int()
			public var typeID: Int = Int()
			public var unanchorsAt: Date? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let corporationID = dictionary["corporation_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.corporationID = corporationID
				currentVul = try (dictionary["current_vul"] as? [Any])?.map {try Corporation.Structure.GetCorporationsCorporationIDStructuresCurrentVul(json: $0)} ?? []
				fuelExpires = DateFormatter.esiDateFormatter.date(from: dictionary["fuel_expires"] as? String ?? "")
				nextVul = try (dictionary["next_vul"] as? [Any])?.map {try Corporation.Structure.GetCorporationsCorporationIDStructuresNextVul(json: $0)} ?? []
				guard let profileID = dictionary["profile_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.profileID = profileID
				services = try (dictionary["services"] as? [Any])?.map {try Corporation.Structure.GetCorporationsCorporationIDStructuresServices(json: $0)}
				stateTimerEnd = DateFormatter.esiDateFormatter.date(from: dictionary["state_timer_end"] as? String ?? "")
				stateTimerStart = DateFormatter.esiDateFormatter.date(from: dictionary["state_timer_start"] as? String ?? "")
				guard let structureID = dictionary["structure_id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.structureID = structureID
				guard let systemID = dictionary["system_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.systemID = systemID
				guard let typeID = dictionary["type_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.typeID = typeID
				unanchorsAt = DateFormatter.esiDateFormatter.date(from: dictionary["unanchors_at"] as? String ?? "")
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				corporationID = aDecoder.decodeInteger(forKey: "corporation_id")
				currentVul = aDecoder.decodeObject(of: [Corporation.Structure.GetCorporationsCorporationIDStructuresCurrentVul.self], forKey: "current_vul") as? [Corporation.Structure.GetCorporationsCorporationIDStructuresCurrentVul] ?? []
				fuelExpires = aDecoder.decodeObject(forKey: "fuel_expires") as? Date
				nextVul = aDecoder.decodeObject(of: [Corporation.Structure.GetCorporationsCorporationIDStructuresNextVul.self], forKey: "next_vul") as? [Corporation.Structure.GetCorporationsCorporationIDStructuresNextVul] ?? []
				profileID = aDecoder.decodeInteger(forKey: "profile_id")
				services = aDecoder.decodeObject(of: [Corporation.Structure.GetCorporationsCorporationIDStructuresServices.self], forKey: "services") as? [Corporation.Structure.GetCorporationsCorporationIDStructuresServices]
				stateTimerEnd = aDecoder.decodeObject(forKey: "state_timer_end") as? Date
				stateTimerStart = aDecoder.decodeObject(forKey: "state_timer_start") as? Date
				structureID = aDecoder.decodeInt64(forKey: "structure_id")
				systemID = aDecoder.decodeInteger(forKey: "system_id")
				typeID = aDecoder.decodeInteger(forKey: "type_id")
				unanchorsAt = aDecoder.decodeObject(forKey: "unanchors_at") as? Date
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(corporationID, forKey: "corporation_id")
				aCoder.encode(currentVul, forKey: "current_vul")
				if let v = fuelExpires {
					aCoder.encode(v, forKey: "fuel_expires")
				}
				aCoder.encode(nextVul, forKey: "next_vul")
				aCoder.encode(profileID, forKey: "profile_id")
				if let v = services {
					aCoder.encode(v, forKey: "services")
				}
				if let v = stateTimerEnd {
					aCoder.encode(v, forKey: "state_timer_end")
				}
				if let v = stateTimerStart {
					aCoder.encode(v, forKey: "state_timer_start")
				}
				aCoder.encode(structureID, forKey: "structure_id")
				aCoder.encode(systemID, forKey: "system_id")
				aCoder.encode(typeID, forKey: "type_id")
				if let v = unanchorsAt {
					aCoder.encode(v, forKey: "unanchors_at")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["corporation_id"] = corporationID.json
				json["current_vul"] = currentVul.json
				if let v = fuelExpires?.json {
					json["fuel_expires"] = v
				}
				json["next_vul"] = nextVul.json
				json["profile_id"] = profileID.json
				if let v = services?.json {
					json["services"] = v
				}
				if let v = stateTimerEnd?.json {
					json["state_timer_end"] = v
				}
				if let v = stateTimerStart?.json {
					json["state_timer_start"] = v
				}
				json["structure_id"] = structureID.json
				json["system_id"] = systemID.json
				json["type_id"] = typeID.json
				if let v = unanchorsAt?.json {
					json["unanchors_at"] = v
				}
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.corporationID.hashValue)
				self.currentVul.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: self.fuelExpires?.hashValue ?? 0)
				self.nextVul.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: self.profileID.hashValue)
				self.services?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: self.stateTimerEnd?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.stateTimerStart?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.structureID.hashValue)
				hashCombine(seed: &hash, value: self.systemID.hashValue)
				hashCombine(seed: &hash, value: self.typeID.hashValue)
				hashCombine(seed: &hash, value: self.unanchorsAt?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Corporation.Structure, rhs: Corporation.Structure) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Corporation.Structure) {
				corporationID = other.corporationID
				currentVul = other.currentVul.flatMap { Corporation.Structure.GetCorporationsCorporationIDStructuresCurrentVul($0) }
				fuelExpires = other.fuelExpires
				nextVul = other.nextVul.flatMap { Corporation.Structure.GetCorporationsCorporationIDStructuresNextVul($0) }
				profileID = other.profileID
				services = other.services?.flatMap { Corporation.Structure.GetCorporationsCorporationIDStructuresServices($0) }
				stateTimerEnd = other.stateTimerEnd
				stateTimerStart = other.stateTimerStart
				structureID = other.structureID
				systemID = other.systemID
				typeID = other.typeID
				unanchorsAt = other.unanchorsAt
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Corporation.Structure(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Structure)?.hashValue == hashValue
			}
			
		}
		
		
	}
	
}
