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
		
		public func getCorporationMedals(corporationID: Int, page: Int? = nil, completionBlock:((Result<[Corporation.GetCorporationsCorporationIDMedalsOk]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.read_medals.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/medals/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Corporation.GetCorporationsCorporationIDMedalsOk]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getCorporationMembers(corporationID: Int, page: Int? = nil, completionBlock:((Result<[Corporation.GetCorporationsCorporationIDShareholdersOk]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-wallet.read_corporation_wallets.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/shareholders/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Corporation.GetCorporationsCorporationIDShareholdersOk]>) in
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
			
			
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/structures/\(structureID)/"
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
		
		public func getCorporationFacilities(corporationID: Int, completionBlock:((Result<[Corporation.GetCorporationsCorporationIDFacilitiesOk]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.read_facilities.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/facilities/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Corporation.GetCorporationsCorporationIDFacilitiesOk]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getCorporationMembers(corporationID: Int, completionBlock:((Result<[Int]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.read_corporation_membership.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v3/corporations/\(corporationID)/members/"
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
		
		public func getCorporationStandings(corporationID: Int, page: Int? = nil, completionBlock:((Result<[Corporation.GetCorporationsCorporationIDStandingsOk]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.read_standings.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/standings/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Corporation.GetCorporationsCorporationIDStandingsOk]>) in
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
			
			
			
			let url = session!.baseURL + "/v2/corporations/\(corporationID)/alliancehistory/"
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
		
		public func getCorporationMemberRolesHistory(corporationID: Int, page: Int? = nil, completionBlock:((Result<[Corporation.GetCorporationsCorporationIDRolesHistoryOk]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.read_corporation_membership.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/roles/history/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Corporation.GetCorporationsCorporationIDRolesHistoryOk]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getCorporationOutpostDetails(corporationID: Int, outpostID: Int, completionBlock:((Result<Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.read_outposts.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/outposts/\(outpostID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getCorporationOutposts(corporationID: Int, page: Int? = nil, completionBlock:((Result<[Int]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.read_outposts.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/outposts/"
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
			
			
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/membertracking/"
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
		
		public func getCorporationIssuedMedals(corporationID: Int, page: Int? = nil, completionBlock:((Result<[Corporation.GetCorporationsCorporationIDMedalsIssuedOk]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.read_medals.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/medals/issued/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Corporation.GetCorporationsCorporationIDMedalsIssuedOk]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getAllCorporationALSCLogs(corporationID: Int, page: Int? = nil, completionBlock:((Result<[Corporation.GetCorporationsCorporationIDContainersLogsOk]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.read_container_logs.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/containers/logs/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Corporation.GetCorporationsCorporationIDContainersLogsOk]>) in
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
			
			
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/titles/"
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
		
		public func getCorporationsMembersTitles(corporationID: Int, completionBlock:((Result<[Corporation.GetCorporationsCorporationIDMembersTitlesOk]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.read_titles.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/members/titles/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Corporation.GetCorporationsCorporationIDMembersTitlesOk]>) in
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
			
			
			
			let url = session!.baseURL + "/v4/corporations/\(corporationID)/"
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
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/structures/"
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
		
		public func getCorporationIcon(corporationID: Int, completionBlock:((Result<Corporation.Icon>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/icons/"
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
		
		public func getCorporationNames(corporationIds: [Int], completionBlock:((Result<[Corporation.Name]>) -> Void)?) {
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
			
			let url = session!.baseURL + "/v2/corporations/names/"
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
			
			
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/members/limit/"
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
		
		public func getStarbasePOSDetail(corporationID: Int, page: Int? = nil, starbaseID: Int64, systemID: Int, completionBlock:((Result<Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.read_starbases.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			if let v = systemID.httpQuery {
				query.append(URLQueryItem(name: "system_id", value: v))
			}
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/starbases/\(starbaseID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk>) in
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
			
			
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/divisions/"
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
		
		public func getCorporationStarbasesPOSes(corporationID: Int, page: Int? = nil, completionBlock:((Result<[Corporation.GetCorporationsCorporationIDStarbasesOk]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.read_starbases.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/starbases/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Corporation.GetCorporationsCorporationIDStarbasesOk]>) in
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
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/blueprints/"
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
			
			
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/roles/"
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
		
		public func getNpcCorporations(completionBlock:((Result<[Int]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/corporations/npccorps/"
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
		
		
		@objc(ESICorporationGetCorporationsCorporationIDStandingsOk) public class GetCorporationsCorporationIDStandingsOk: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public enum GetCorporationsCorporationIDStandingsFromType: String, JSONCoding, HTTPQueryable {
				case agent = "agent"
				case faction = "faction"
				case npcCorp = "npc_corp"
				
				public init() {
					self = .agent
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCorporationsCorporationIDStandingsFromType(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var fromID: Int = Int()
			public var fromType: Corporation.GetCorporationsCorporationIDStandingsOk.GetCorporationsCorporationIDStandingsFromType = Corporation.GetCorporationsCorporationIDStandingsOk.GetCorporationsCorporationIDStandingsFromType()
			public var standing: Float = Float()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let fromID = dictionary["from_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.fromID = fromID
				guard let fromType = Corporation.GetCorporationsCorporationIDStandingsOk.GetCorporationsCorporationIDStandingsFromType(rawValue: dictionary["from_type"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.fromType = fromType
				guard let standing = dictionary["standing"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.standing = standing
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				fromID = aDecoder.decodeInteger(forKey: "from_id")
				fromType = Corporation.GetCorporationsCorporationIDStandingsOk.GetCorporationsCorporationIDStandingsFromType(rawValue: aDecoder.decodeObject(forKey: "from_type") as? String ?? "") ?? Corporation.GetCorporationsCorporationIDStandingsOk.GetCorporationsCorporationIDStandingsFromType()
				standing = aDecoder.decodeFloat(forKey: "standing")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(fromID, forKey: "from_id")
				aCoder.encode(fromType.rawValue, forKey: "from_type")
				aCoder.encode(standing, forKey: "standing")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["from_id"] = fromID.json
				json["from_type"] = fromType.json
				json["standing"] = standing.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.fromID.hashValue)
				hashCombine(seed: &hash, value: self.fromType.hashValue)
				hashCombine(seed: &hash, value: self.standing.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Corporation.GetCorporationsCorporationIDStandingsOk, rhs: Corporation.GetCorporationsCorporationIDStandingsOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Corporation.GetCorporationsCorporationIDStandingsOk) {
				fromID = other.fromID
				fromType = other.fromType
				standing = other.standing
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Corporation.GetCorporationsCorporationIDStandingsOk(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCorporationsCorporationIDStandingsOk)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESICorporationGetCorporationsCorporationIDStarbasesStarbaseIDOk) public class GetCorporationsCorporationIDStarbasesStarbaseIDOk: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public enum GetCorporationsCorporationIDStarbasesStarbaseIDFuelBayTake: String, JSONCoding, HTTPQueryable {
				case allianceMember = "alliance_member"
				case configStarbaseEquipmentRole = "config_starbase_equipment_role"
				case corporationMember = "corporation_member"
				case starbaseFuelTechnicianRole = "starbase_fuel_technician_role"
				
				public init() {
					self = .allianceMember
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCorporationsCorporationIDStarbasesStarbaseIDFuelBayTake(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDStarbasesStarbaseIDAnchor: String, JSONCoding, HTTPQueryable {
				case allianceMember = "alliance_member"
				case configStarbaseEquipmentRole = "config_starbase_equipment_role"
				case corporationMember = "corporation_member"
				case starbaseFuelTechnicianRole = "starbase_fuel_technician_role"
				
				public init() {
					self = .allianceMember
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCorporationsCorporationIDStarbasesStarbaseIDAnchor(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDStarbasesStarbaseIDOffline: String, JSONCoding, HTTPQueryable {
				case allianceMember = "alliance_member"
				case configStarbaseEquipmentRole = "config_starbase_equipment_role"
				case corporationMember = "corporation_member"
				case starbaseFuelTechnicianRole = "starbase_fuel_technician_role"
				
				public init() {
					self = .allianceMember
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCorporationsCorporationIDStarbasesStarbaseIDOffline(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			@objc(ESICorporationGetCorporationsCorporationIDStarbasesStarbaseIDOkGetCorporationsCorporationIDStarbasesStarbaseIDFuels) public class GetCorporationsCorporationIDStarbasesStarbaseIDFuels: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var quantity: Int = Int()
				public var typeID: Int = Int()
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let quantity = dictionary["quantity"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.quantity = quantity
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
					quantity = aDecoder.decodeInteger(forKey: "quantity")
					typeID = aDecoder.decodeInteger(forKey: "type_id")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(quantity, forKey: "quantity")
					aCoder.encode(typeID, forKey: "type_id")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["quantity"] = quantity.json
					json["type_id"] = typeID.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.quantity.hashValue)
					hashCombine(seed: &hash, value: self.typeID.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDFuels, rhs: Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDFuels) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDFuels) {
					quantity = other.quantity
					typeID = other.typeID
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDFuels(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetCorporationsCorporationIDStarbasesStarbaseIDFuels)?.hashValue == hashValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDStarbasesStarbaseIDOnline: String, JSONCoding, HTTPQueryable {
				case allianceMember = "alliance_member"
				case configStarbaseEquipmentRole = "config_starbase_equipment_role"
				case corporationMember = "corporation_member"
				case starbaseFuelTechnicianRole = "starbase_fuel_technician_role"
				
				public init() {
					self = .allianceMember
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCorporationsCorporationIDStarbasesStarbaseIDOnline(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDStarbasesStarbaseIDFuelBayView: String, JSONCoding, HTTPQueryable {
				case allianceMember = "alliance_member"
				case configStarbaseEquipmentRole = "config_starbase_equipment_role"
				case corporationMember = "corporation_member"
				case starbaseFuelTechnicianRole = "starbase_fuel_technician_role"
				
				public init() {
					self = .allianceMember
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCorporationsCorporationIDStarbasesStarbaseIDFuelBayView(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDStarbasesStarbaseIDUnanchor: String, JSONCoding, HTTPQueryable {
				case allianceMember = "alliance_member"
				case configStarbaseEquipmentRole = "config_starbase_equipment_role"
				case corporationMember = "corporation_member"
				case starbaseFuelTechnicianRole = "starbase_fuel_technician_role"
				
				public init() {
					self = .allianceMember
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCorporationsCorporationIDStarbasesStarbaseIDUnanchor(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var allowAllianceMembers: Bool = Bool()
			public var allowCorporationMembers: Bool = Bool()
			public var anchor: Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDAnchor = Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDAnchor()
			public var attackIfAtWar: Bool = Bool()
			public var attackIfOtherSecurityStatusDropping: Bool = Bool()
			public var attackSecurityStatusThreshold: Float? = nil
			public var attackStandingThreshold: Float? = nil
			public var fuelBayTake: Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDFuelBayTake = Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDFuelBayTake()
			public var fuelBayView: Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDFuelBayView = Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDFuelBayView()
			public var fuels: [Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDFuels]? = nil
			public var offline: Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDOffline = Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDOffline()
			public var online: Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDOnline = Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDOnline()
			public var unanchor: Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDUnanchor = Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDUnanchor()
			public var useAllianceStandings: Bool = Bool()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let allowAllianceMembers = dictionary["allow_alliance_members"] as? Bool else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.allowAllianceMembers = allowAllianceMembers
				guard let allowCorporationMembers = dictionary["allow_corporation_members"] as? Bool else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.allowCorporationMembers = allowCorporationMembers
				guard let anchor = Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDAnchor(rawValue: dictionary["anchor"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.anchor = anchor
				guard let attackIfAtWar = dictionary["attack_if_at_war"] as? Bool else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.attackIfAtWar = attackIfAtWar
				guard let attackIfOtherSecurityStatusDropping = dictionary["attack_if_other_security_status_dropping"] as? Bool else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.attackIfOtherSecurityStatusDropping = attackIfOtherSecurityStatusDropping
				attackSecurityStatusThreshold = dictionary["attack_security_status_threshold"] as? Float
				attackStandingThreshold = dictionary["attack_standing_threshold"] as? Float
				guard let fuelBayTake = Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDFuelBayTake(rawValue: dictionary["fuel_bay_take"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.fuelBayTake = fuelBayTake
				guard let fuelBayView = Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDFuelBayView(rawValue: dictionary["fuel_bay_view"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.fuelBayView = fuelBayView
				fuels = try (dictionary["fuels"] as? [Any])?.map {try Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDFuels(json: $0)}
				guard let offline = Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDOffline(rawValue: dictionary["offline"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.offline = offline
				guard let online = Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDOnline(rawValue: dictionary["online"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.online = online
				guard let unanchor = Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDUnanchor(rawValue: dictionary["unanchor"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.unanchor = unanchor
				guard let useAllianceStandings = dictionary["use_alliance_standings"] as? Bool else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.useAllianceStandings = useAllianceStandings
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				allowAllianceMembers = aDecoder.decodeBool(forKey: "allow_alliance_members")
				allowCorporationMembers = aDecoder.decodeBool(forKey: "allow_corporation_members")
				anchor = Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDAnchor(rawValue: aDecoder.decodeObject(forKey: "anchor") as? String ?? "") ?? Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDAnchor()
				attackIfAtWar = aDecoder.decodeBool(forKey: "attack_if_at_war")
				attackIfOtherSecurityStatusDropping = aDecoder.decodeBool(forKey: "attack_if_other_security_status_dropping")
				attackSecurityStatusThreshold = aDecoder.containsValue(forKey: "attack_security_status_threshold") ? aDecoder.decodeFloat(forKey: "attack_security_status_threshold") : nil
				attackStandingThreshold = aDecoder.containsValue(forKey: "attack_standing_threshold") ? aDecoder.decodeFloat(forKey: "attack_standing_threshold") : nil
				fuelBayTake = Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDFuelBayTake(rawValue: aDecoder.decodeObject(forKey: "fuel_bay_take") as? String ?? "") ?? Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDFuelBayTake()
				fuelBayView = Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDFuelBayView(rawValue: aDecoder.decodeObject(forKey: "fuel_bay_view") as? String ?? "") ?? Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDFuelBayView()
				fuels = aDecoder.decodeObject(of: [Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDFuels.self], forKey: "fuels") as? [Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDFuels]
				offline = Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDOffline(rawValue: aDecoder.decodeObject(forKey: "offline") as? String ?? "") ?? Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDOffline()
				online = Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDOnline(rawValue: aDecoder.decodeObject(forKey: "online") as? String ?? "") ?? Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDOnline()
				unanchor = Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDUnanchor(rawValue: aDecoder.decodeObject(forKey: "unanchor") as? String ?? "") ?? Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDUnanchor()
				useAllianceStandings = aDecoder.decodeBool(forKey: "use_alliance_standings")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(allowAllianceMembers, forKey: "allow_alliance_members")
				aCoder.encode(allowCorporationMembers, forKey: "allow_corporation_members")
				aCoder.encode(anchor.rawValue, forKey: "anchor")
				aCoder.encode(attackIfAtWar, forKey: "attack_if_at_war")
				aCoder.encode(attackIfOtherSecurityStatusDropping, forKey: "attack_if_other_security_status_dropping")
				if let v = attackSecurityStatusThreshold {
					aCoder.encode(v, forKey: "attack_security_status_threshold")
				}
				if let v = attackStandingThreshold {
					aCoder.encode(v, forKey: "attack_standing_threshold")
				}
				aCoder.encode(fuelBayTake.rawValue, forKey: "fuel_bay_take")
				aCoder.encode(fuelBayView.rawValue, forKey: "fuel_bay_view")
				if let v = fuels {
					aCoder.encode(v, forKey: "fuels")
				}
				aCoder.encode(offline.rawValue, forKey: "offline")
				aCoder.encode(online.rawValue, forKey: "online")
				aCoder.encode(unanchor.rawValue, forKey: "unanchor")
				aCoder.encode(useAllianceStandings, forKey: "use_alliance_standings")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["allow_alliance_members"] = allowAllianceMembers.json
				json["allow_corporation_members"] = allowCorporationMembers.json
				json["anchor"] = anchor.json
				json["attack_if_at_war"] = attackIfAtWar.json
				json["attack_if_other_security_status_dropping"] = attackIfOtherSecurityStatusDropping.json
				if let v = attackSecurityStatusThreshold?.json {
					json["attack_security_status_threshold"] = v
				}
				if let v = attackStandingThreshold?.json {
					json["attack_standing_threshold"] = v
				}
				json["fuel_bay_take"] = fuelBayTake.json
				json["fuel_bay_view"] = fuelBayView.json
				if let v = fuels?.json {
					json["fuels"] = v
				}
				json["offline"] = offline.json
				json["online"] = online.json
				json["unanchor"] = unanchor.json
				json["use_alliance_standings"] = useAllianceStandings.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.allowAllianceMembers.hashValue)
				hashCombine(seed: &hash, value: self.allowCorporationMembers.hashValue)
				hashCombine(seed: &hash, value: self.anchor.hashValue)
				hashCombine(seed: &hash, value: self.attackIfAtWar.hashValue)
				hashCombine(seed: &hash, value: self.attackIfOtherSecurityStatusDropping.hashValue)
				hashCombine(seed: &hash, value: self.attackSecurityStatusThreshold?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.attackStandingThreshold?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.fuelBayTake.hashValue)
				hashCombine(seed: &hash, value: self.fuelBayView.hashValue)
				self.fuels?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: self.offline.hashValue)
				hashCombine(seed: &hash, value: self.online.hashValue)
				hashCombine(seed: &hash, value: self.unanchor.hashValue)
				hashCombine(seed: &hash, value: self.useAllianceStandings.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk, rhs: Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk) {
				allowAllianceMembers = other.allowAllianceMembers
				allowCorporationMembers = other.allowCorporationMembers
				anchor = other.anchor
				attackIfAtWar = other.attackIfAtWar
				attackIfOtherSecurityStatusDropping = other.attackIfOtherSecurityStatusDropping
				attackSecurityStatusThreshold = other.attackSecurityStatusThreshold
				attackStandingThreshold = other.attackStandingThreshold
				fuelBayTake = other.fuelBayTake
				fuelBayView = other.fuelBayView
				fuels = other.fuels?.flatMap { Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDFuels($0) }
				offline = other.offline
				online = other.online
				unanchor = other.unanchor
				useAllianceStandings = other.useAllianceStandings
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCorporationsCorporationIDStarbasesStarbaseIDOk)?.hashValue == hashValue
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
		
		
		@objc(ESICorporationGetCorporationsCorporationIDRolesHistoryOk) public class GetCorporationsCorporationIDRolesHistoryOk: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public enum GetCorporationsCorporationIDRolesHistoryRoleType: String, JSONCoding, HTTPQueryable {
				case grantableRoles = "grantable_roles"
				case grantableRolesAtBase = "grantable_roles_at_base"
				case grantableRolesAtHq = "grantable_roles_at_hq"
				case grantableRolesAtOther = "grantable_roles_at_other"
				case roles = "roles"
				case rolesAtBase = "roles_at_base"
				case rolesAtHq = "roles_at_hq"
				case rolesAtOther = "roles_at_other"
				
				public init() {
					self = .grantableRoles
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCorporationsCorporationIDRolesHistoryRoleType(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDRolesHistoryOldRoles: String, JSONCoding, HTTPQueryable {
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
					guard let s = json as? String, let v = GetCorporationsCorporationIDRolesHistoryOldRoles(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDRolesHistoryNewRoles: String, JSONCoding, HTTPQueryable {
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
					guard let s = json as? String, let v = GetCorporationsCorporationIDRolesHistoryNewRoles(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var changedAt: Date = Date()
			public var characterID: Int = Int()
			public var issuerID: Int = Int()
			public var newRoles: [Corporation.GetCorporationsCorporationIDRolesHistoryOk.GetCorporationsCorporationIDRolesHistoryNewRoles] = []
			public var oldRoles: [Corporation.GetCorporationsCorporationIDRolesHistoryOk.GetCorporationsCorporationIDRolesHistoryOldRoles] = []
			public var roleType: Corporation.GetCorporationsCorporationIDRolesHistoryOk.GetCorporationsCorporationIDRolesHistoryRoleType = Corporation.GetCorporationsCorporationIDRolesHistoryOk.GetCorporationsCorporationIDRolesHistoryRoleType()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let changedAt = DateFormatter.esiDateTimeFormatter.date(from: dictionary["changed_at"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.changedAt = changedAt
				guard let characterID = dictionary["character_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.characterID = characterID
				guard let issuerID = dictionary["issuer_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.issuerID = issuerID
				newRoles = try (dictionary["new_roles"] as? [Any])?.map {try Corporation.GetCorporationsCorporationIDRolesHistoryOk.GetCorporationsCorporationIDRolesHistoryNewRoles(json: $0)} ?? []
				oldRoles = try (dictionary["old_roles"] as? [Any])?.map {try Corporation.GetCorporationsCorporationIDRolesHistoryOk.GetCorporationsCorporationIDRolesHistoryOldRoles(json: $0)} ?? []
				guard let roleType = Corporation.GetCorporationsCorporationIDRolesHistoryOk.GetCorporationsCorporationIDRolesHistoryRoleType(rawValue: dictionary["role_type"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.roleType = roleType
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				changedAt = aDecoder.decodeObject(forKey: "changed_at") as? Date ?? Date()
				characterID = aDecoder.decodeInteger(forKey: "character_id")
				issuerID = aDecoder.decodeInteger(forKey: "issuer_id")
				newRoles = aDecoder.decodeObject(forKey: "new_roles") as? [Corporation.GetCorporationsCorporationIDRolesHistoryOk.GetCorporationsCorporationIDRolesHistoryNewRoles] ?? []
				oldRoles = aDecoder.decodeObject(forKey: "old_roles") as? [Corporation.GetCorporationsCorporationIDRolesHistoryOk.GetCorporationsCorporationIDRolesHistoryOldRoles] ?? []
				roleType = Corporation.GetCorporationsCorporationIDRolesHistoryOk.GetCorporationsCorporationIDRolesHistoryRoleType(rawValue: aDecoder.decodeObject(forKey: "role_type") as? String ?? "") ?? Corporation.GetCorporationsCorporationIDRolesHistoryOk.GetCorporationsCorporationIDRolesHistoryRoleType()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(changedAt, forKey: "changed_at")
				aCoder.encode(characterID, forKey: "character_id")
				aCoder.encode(issuerID, forKey: "issuer_id")
				aCoder.encode(newRoles, forKey: "new_roles")
				aCoder.encode(oldRoles, forKey: "old_roles")
				aCoder.encode(roleType.rawValue, forKey: "role_type")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["changed_at"] = changedAt.json
				json["character_id"] = characterID.json
				json["issuer_id"] = issuerID.json
				json["new_roles"] = newRoles.json
				json["old_roles"] = oldRoles.json
				json["role_type"] = roleType.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.changedAt.hashValue)
				hashCombine(seed: &hash, value: self.characterID.hashValue)
				hashCombine(seed: &hash, value: self.issuerID.hashValue)
				self.newRoles.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.oldRoles.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: self.roleType.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Corporation.GetCorporationsCorporationIDRolesHistoryOk, rhs: Corporation.GetCorporationsCorporationIDRolesHistoryOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Corporation.GetCorporationsCorporationIDRolesHistoryOk) {
				changedAt = other.changedAt
				characterID = other.characterID
				issuerID = other.issuerID
				newRoles = other.newRoles.flatMap { $0 }
				oldRoles = other.oldRoles.flatMap { $0 }
				roleType = other.roleType
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Corporation.GetCorporationsCorporationIDRolesHistoryOk(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCorporationsCorporationIDRolesHistoryOk)?.hashValue == hashValue
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
		
		
		@objc(ESICorporationGetCorporationsCorporationIDContainersLogsOk) public class GetCorporationsCorporationIDContainersLogsOk: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public enum GetCorporationsCorporationIDContainersLogsLocationFlag: String, JSONCoding, HTTPQueryable {
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
					guard let s = json as? String, let v = GetCorporationsCorporationIDContainersLogsLocationFlag(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDContainersLogsAction: String, JSONCoding, HTTPQueryable {
				case add = "add"
				case assemble = "assemble"
				case configure = "configure"
				case enterPassword = "enter_password"
				case lock = "lock"
				case move = "move"
				case repackage = "repackage"
				case setName = "set_name"
				case setPassword = "set_password"
				case unlock = "unlock"
				
				public init() {
					self = .add
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCorporationsCorporationIDContainersLogsAction(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDContainersLogsPasswordType: String, JSONCoding, HTTPQueryable {
				case config = "config"
				case general = "general"
				
				public init() {
					self = .config
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCorporationsCorporationIDContainersLogsPasswordType(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var action: Corporation.GetCorporationsCorporationIDContainersLogsOk.GetCorporationsCorporationIDContainersLogsAction = Corporation.GetCorporationsCorporationIDContainersLogsOk.GetCorporationsCorporationIDContainersLogsAction()
			public var characterID: Int = Int()
			public var containerID: Int64 = Int64()
			public var containerTypeID: Int = Int()
			public var locationFlag: Corporation.GetCorporationsCorporationIDContainersLogsOk.GetCorporationsCorporationIDContainersLogsLocationFlag = Corporation.GetCorporationsCorporationIDContainersLogsOk.GetCorporationsCorporationIDContainersLogsLocationFlag()
			public var locationID: Int64 = Int64()
			public var loggedAt: Date = Date()
			public var newConfigBitmask: Int? = nil
			public var oldConfigBitmask: Int? = nil
			public var passwordType: Corporation.GetCorporationsCorporationIDContainersLogsOk.GetCorporationsCorporationIDContainersLogsPasswordType? = nil
			public var quantity: Int? = nil
			public var typeID: Int? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let action = Corporation.GetCorporationsCorporationIDContainersLogsOk.GetCorporationsCorporationIDContainersLogsAction(rawValue: dictionary["action"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.action = action
				guard let characterID = dictionary["character_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.characterID = characterID
				guard let containerID = dictionary["container_id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.containerID = containerID
				guard let containerTypeID = dictionary["container_type_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.containerTypeID = containerTypeID
				guard let locationFlag = Corporation.GetCorporationsCorporationIDContainersLogsOk.GetCorporationsCorporationIDContainersLogsLocationFlag(rawValue: dictionary["location_flag"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.locationFlag = locationFlag
				guard let locationID = dictionary["location_id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.locationID = locationID
				guard let loggedAt = DateFormatter.esiDateTimeFormatter.date(from: dictionary["logged_at"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.loggedAt = loggedAt
				newConfigBitmask = dictionary["new_config_bitmask"] as? Int
				oldConfigBitmask = dictionary["old_config_bitmask"] as? Int
				passwordType = Corporation.GetCorporationsCorporationIDContainersLogsOk.GetCorporationsCorporationIDContainersLogsPasswordType(rawValue: dictionary["password_type"] as? String ?? "")
				quantity = dictionary["quantity"] as? Int
				typeID = dictionary["type_id"] as? Int
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				action = Corporation.GetCorporationsCorporationIDContainersLogsOk.GetCorporationsCorporationIDContainersLogsAction(rawValue: aDecoder.decodeObject(forKey: "action") as? String ?? "") ?? Corporation.GetCorporationsCorporationIDContainersLogsOk.GetCorporationsCorporationIDContainersLogsAction()
				characterID = aDecoder.decodeInteger(forKey: "character_id")
				containerID = aDecoder.decodeInt64(forKey: "container_id")
				containerTypeID = aDecoder.decodeInteger(forKey: "container_type_id")
				locationFlag = Corporation.GetCorporationsCorporationIDContainersLogsOk.GetCorporationsCorporationIDContainersLogsLocationFlag(rawValue: aDecoder.decodeObject(forKey: "location_flag") as? String ?? "") ?? Corporation.GetCorporationsCorporationIDContainersLogsOk.GetCorporationsCorporationIDContainersLogsLocationFlag()
				locationID = aDecoder.decodeInt64(forKey: "location_id")
				loggedAt = aDecoder.decodeObject(forKey: "logged_at") as? Date ?? Date()
				newConfigBitmask = aDecoder.containsValue(forKey: "new_config_bitmask") ? aDecoder.decodeInteger(forKey: "new_config_bitmask") : nil
				oldConfigBitmask = aDecoder.containsValue(forKey: "old_config_bitmask") ? aDecoder.decodeInteger(forKey: "old_config_bitmask") : nil
				passwordType = Corporation.GetCorporationsCorporationIDContainersLogsOk.GetCorporationsCorporationIDContainersLogsPasswordType(rawValue: aDecoder.decodeObject(forKey: "password_type") as? String ?? "")
				quantity = aDecoder.containsValue(forKey: "quantity") ? aDecoder.decodeInteger(forKey: "quantity") : nil
				typeID = aDecoder.containsValue(forKey: "type_id") ? aDecoder.decodeInteger(forKey: "type_id") : nil
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(action.rawValue, forKey: "action")
				aCoder.encode(characterID, forKey: "character_id")
				aCoder.encode(containerID, forKey: "container_id")
				aCoder.encode(containerTypeID, forKey: "container_type_id")
				aCoder.encode(locationFlag.rawValue, forKey: "location_flag")
				aCoder.encode(locationID, forKey: "location_id")
				aCoder.encode(loggedAt, forKey: "logged_at")
				if let v = newConfigBitmask {
					aCoder.encode(v, forKey: "new_config_bitmask")
				}
				if let v = oldConfigBitmask {
					aCoder.encode(v, forKey: "old_config_bitmask")
				}
				if let v = passwordType {
					aCoder.encode(v.rawValue, forKey: "password_type")
				}
				if let v = quantity {
					aCoder.encode(v, forKey: "quantity")
				}
				if let v = typeID {
					aCoder.encode(v, forKey: "type_id")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["action"] = action.json
				json["character_id"] = characterID.json
				json["container_id"] = containerID.json
				json["container_type_id"] = containerTypeID.json
				json["location_flag"] = locationFlag.json
				json["location_id"] = locationID.json
				json["logged_at"] = loggedAt.json
				if let v = newConfigBitmask?.json {
					json["new_config_bitmask"] = v
				}
				if let v = oldConfigBitmask?.json {
					json["old_config_bitmask"] = v
				}
				if let v = passwordType?.json {
					json["password_type"] = v
				}
				if let v = quantity?.json {
					json["quantity"] = v
				}
				if let v = typeID?.json {
					json["type_id"] = v
				}
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.action.hashValue)
				hashCombine(seed: &hash, value: self.characterID.hashValue)
				hashCombine(seed: &hash, value: self.containerID.hashValue)
				hashCombine(seed: &hash, value: self.containerTypeID.hashValue)
				hashCombine(seed: &hash, value: self.locationFlag.hashValue)
				hashCombine(seed: &hash, value: self.locationID.hashValue)
				hashCombine(seed: &hash, value: self.loggedAt.hashValue)
				hashCombine(seed: &hash, value: self.newConfigBitmask?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.oldConfigBitmask?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.passwordType?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.quantity?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.typeID?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Corporation.GetCorporationsCorporationIDContainersLogsOk, rhs: Corporation.GetCorporationsCorporationIDContainersLogsOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Corporation.GetCorporationsCorporationIDContainersLogsOk) {
				action = other.action
				characterID = other.characterID
				containerID = other.containerID
				containerTypeID = other.containerTypeID
				locationFlag = other.locationFlag
				locationID = other.locationID
				loggedAt = other.loggedAt
				newConfigBitmask = other.newConfigBitmask
				oldConfigBitmask = other.oldConfigBitmask
				passwordType = other.passwordType
				quantity = other.quantity
				typeID = other.typeID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Corporation.GetCorporationsCorporationIDContainersLogsOk(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCorporationsCorporationIDContainersLogsOk)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESICorporationGetCorporationsCorporationIDOutpostsOutpostIDOk) public class GetCorporationsCorporationIDOutpostsOutpostIDOk: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			@objc(ESICorporationGetCorporationsCorporationIDOutpostsOutpostIDOkGetCorporationsCorporationIDOutpostsOutpostIDCoordinates) public class GetCorporationsCorporationIDOutpostsOutpostIDCoordinates: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var x: Double = Double()
				public var y: Double = Double()
				public var z: Double = Double()
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let x = dictionary["x"] as? Double else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.x = x
					guard let y = dictionary["y"] as? Double else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.y = y
					guard let z = dictionary["z"] as? Double else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.z = z
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init?(coder aDecoder: NSCoder) {
					x = aDecoder.decodeDouble(forKey: "x")
					y = aDecoder.decodeDouble(forKey: "y")
					z = aDecoder.decodeDouble(forKey: "z")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(x, forKey: "x")
					aCoder.encode(y, forKey: "y")
					aCoder.encode(z, forKey: "z")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["x"] = x.json
					json["y"] = y.json
					json["z"] = z.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.x.hashValue)
					hashCombine(seed: &hash, value: self.y.hashValue)
					hashCombine(seed: &hash, value: self.z.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk.GetCorporationsCorporationIDOutpostsOutpostIDCoordinates, rhs: Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk.GetCorporationsCorporationIDOutpostsOutpostIDCoordinates) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk.GetCorporationsCorporationIDOutpostsOutpostIDCoordinates) {
					x = other.x
					y = other.y
					z = other.z
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk.GetCorporationsCorporationIDOutpostsOutpostIDCoordinates(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetCorporationsCorporationIDOutpostsOutpostIDCoordinates)?.hashValue == hashValue
				}
				
			}
			
			@objc(ESICorporationGetCorporationsCorporationIDOutpostsOutpostIDOkGetCorporationsCorporationIDOutpostsOutpostIDServices) public class GetCorporationsCorporationIDOutpostsOutpostIDServices: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				public enum GetCorporationsCorporationIDOutpostsOutpostIDServiceName: String, JSONCoding, HTTPQueryable {
					case assassinationMissions = "Assassination Missions"
					case blackMarket = "Black Market"
					case bountyMissions = "Bounty Missions"
					case cloning = "Cloning"
					case courierMissions = "Courier Missions"
					case dNATherapy = "DNA Therapy"
					case docking = "Docking"
					case factory = "Factory"
					case fitting = "Fitting"
					case gambling = "Gambling"
					case insurance = "Insurance"
					case interbus = "Interbus"
					case jumpCloneFacility = "Jump Clone Facility"
					case laboratory = "Laboratory"
					case loyaltyPointStore = "Loyalty Point Store"
					case market = "Market"
					case navyOffices = "Navy Offices"
					case news = "News"
					case officeRental = "Office Rental"
					case paintshop = "Paintshop"
					case refinery = "Refinery"
					case repairFacilities = "Repair Facilities"
					case reprocessingPlant = "Reprocessing Plant"
					case securityOffice = "Security Office"
					case stockExchange = "Stock Exchange"
					case storage = "Storage"
					case surgery = "Surgery"
					
					public init() {
						self = .bountyMissions
					}
					
					public var json: Any {
						return self.rawValue
					}
					
					public init(json: Any) throws {
						guard let s = json as? String, let v = GetCorporationsCorporationIDOutpostsOutpostIDServiceName(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
						self = v
					}
					
					public var httpQuery: String? {
						return rawValue
					}
					
				}
				
				public var discountPerGoodStanding: Double = Double()
				public var minimumStanding: Double = Double()
				public var serviceName: Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk.GetCorporationsCorporationIDOutpostsOutpostIDServices.GetCorporationsCorporationIDOutpostsOutpostIDServiceName = Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk.GetCorporationsCorporationIDOutpostsOutpostIDServices.GetCorporationsCorporationIDOutpostsOutpostIDServiceName()
				public var surchargePerBadStanding: Double = Double()
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let discountPerGoodStanding = dictionary["discount_per_good_standing"] as? Double else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.discountPerGoodStanding = discountPerGoodStanding
					guard let minimumStanding = dictionary["minimum_standing"] as? Double else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.minimumStanding = minimumStanding
					guard let serviceName = Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk.GetCorporationsCorporationIDOutpostsOutpostIDServices.GetCorporationsCorporationIDOutpostsOutpostIDServiceName(rawValue: dictionary["service_name"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.serviceName = serviceName
					guard let surchargePerBadStanding = dictionary["surcharge_per_bad_standing"] as? Double else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.surchargePerBadStanding = surchargePerBadStanding
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init?(coder aDecoder: NSCoder) {
					discountPerGoodStanding = aDecoder.decodeDouble(forKey: "discount_per_good_standing")
					minimumStanding = aDecoder.decodeDouble(forKey: "minimum_standing")
					serviceName = Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk.GetCorporationsCorporationIDOutpostsOutpostIDServices.GetCorporationsCorporationIDOutpostsOutpostIDServiceName(rawValue: aDecoder.decodeObject(forKey: "service_name") as? String ?? "") ?? Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk.GetCorporationsCorporationIDOutpostsOutpostIDServices.GetCorporationsCorporationIDOutpostsOutpostIDServiceName()
					surchargePerBadStanding = aDecoder.decodeDouble(forKey: "surcharge_per_bad_standing")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(discountPerGoodStanding, forKey: "discount_per_good_standing")
					aCoder.encode(minimumStanding, forKey: "minimum_standing")
					aCoder.encode(serviceName.rawValue, forKey: "service_name")
					aCoder.encode(surchargePerBadStanding, forKey: "surcharge_per_bad_standing")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["discount_per_good_standing"] = discountPerGoodStanding.json
					json["minimum_standing"] = minimumStanding.json
					json["service_name"] = serviceName.json
					json["surcharge_per_bad_standing"] = surchargePerBadStanding.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.discountPerGoodStanding.hashValue)
					hashCombine(seed: &hash, value: self.minimumStanding.hashValue)
					hashCombine(seed: &hash, value: self.serviceName.hashValue)
					hashCombine(seed: &hash, value: self.surchargePerBadStanding.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk.GetCorporationsCorporationIDOutpostsOutpostIDServices, rhs: Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk.GetCorporationsCorporationIDOutpostsOutpostIDServices) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk.GetCorporationsCorporationIDOutpostsOutpostIDServices) {
					discountPerGoodStanding = other.discountPerGoodStanding
					minimumStanding = other.minimumStanding
					serviceName = other.serviceName
					surchargePerBadStanding = other.surchargePerBadStanding
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk.GetCorporationsCorporationIDOutpostsOutpostIDServices(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetCorporationsCorporationIDOutpostsOutpostIDServices)?.hashValue == hashValue
				}
				
			}
			
			public var coordinates: Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk.GetCorporationsCorporationIDOutpostsOutpostIDCoordinates = Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk.GetCorporationsCorporationIDOutpostsOutpostIDCoordinates()
			public var dockingCostPerShipVolume: Float = Float()
			public var officeRentalCost: Int64 = Int64()
			public var ownerID: Int = Int()
			public var reprocessingEfficiency: Float = Float()
			public var reprocessingStationTake: Float = Float()
			public var services: [Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk.GetCorporationsCorporationIDOutpostsOutpostIDServices] = []
			public var standingOwnerID: Int = Int()
			public var systemID: Int = Int()
			public var typeID: Int = Int()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				coordinates = try Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk.GetCorporationsCorporationIDOutpostsOutpostIDCoordinates(json: dictionary["coordinates"] as? [String: Any] ?? [:])
				guard let dockingCostPerShipVolume = dictionary["docking_cost_per_ship_volume"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.dockingCostPerShipVolume = dockingCostPerShipVolume
				guard let officeRentalCost = dictionary["office_rental_cost"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.officeRentalCost = officeRentalCost
				guard let ownerID = dictionary["owner_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.ownerID = ownerID
				guard let reprocessingEfficiency = dictionary["reprocessing_efficiency"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.reprocessingEfficiency = reprocessingEfficiency
				guard let reprocessingStationTake = dictionary["reprocessing_station_take"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.reprocessingStationTake = reprocessingStationTake
				services = try (dictionary["services"] as? [Any])?.map {try Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk.GetCorporationsCorporationIDOutpostsOutpostIDServices(json: $0)} ?? []
				guard let standingOwnerID = dictionary["standing_owner_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.standingOwnerID = standingOwnerID
				guard let systemID = dictionary["system_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.systemID = systemID
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
				coordinates = aDecoder.decodeObject(of: Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk.GetCorporationsCorporationIDOutpostsOutpostIDCoordinates.self, forKey: "coordinates")  ?? Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk.GetCorporationsCorporationIDOutpostsOutpostIDCoordinates()
				dockingCostPerShipVolume = aDecoder.decodeFloat(forKey: "docking_cost_per_ship_volume")
				officeRentalCost = aDecoder.decodeInt64(forKey: "office_rental_cost")
				ownerID = aDecoder.decodeInteger(forKey: "owner_id")
				reprocessingEfficiency = aDecoder.decodeFloat(forKey: "reprocessing_efficiency")
				reprocessingStationTake = aDecoder.decodeFloat(forKey: "reprocessing_station_take")
				services = aDecoder.decodeObject(of: [Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk.GetCorporationsCorporationIDOutpostsOutpostIDServices.self], forKey: "services") as? [Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk.GetCorporationsCorporationIDOutpostsOutpostIDServices] ?? []
				standingOwnerID = aDecoder.decodeInteger(forKey: "standing_owner_id")
				systemID = aDecoder.decodeInteger(forKey: "system_id")
				typeID = aDecoder.decodeInteger(forKey: "type_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(coordinates, forKey: "coordinates")
				aCoder.encode(dockingCostPerShipVolume, forKey: "docking_cost_per_ship_volume")
				aCoder.encode(officeRentalCost, forKey: "office_rental_cost")
				aCoder.encode(ownerID, forKey: "owner_id")
				aCoder.encode(reprocessingEfficiency, forKey: "reprocessing_efficiency")
				aCoder.encode(reprocessingStationTake, forKey: "reprocessing_station_take")
				aCoder.encode(services, forKey: "services")
				aCoder.encode(standingOwnerID, forKey: "standing_owner_id")
				aCoder.encode(systemID, forKey: "system_id")
				aCoder.encode(typeID, forKey: "type_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["coordinates"] = coordinates.json
				json["docking_cost_per_ship_volume"] = dockingCostPerShipVolume.json
				json["office_rental_cost"] = officeRentalCost.json
				json["owner_id"] = ownerID.json
				json["reprocessing_efficiency"] = reprocessingEfficiency.json
				json["reprocessing_station_take"] = reprocessingStationTake.json
				json["services"] = services.json
				json["standing_owner_id"] = standingOwnerID.json
				json["system_id"] = systemID.json
				json["type_id"] = typeID.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.coordinates.hashValue)
				hashCombine(seed: &hash, value: self.dockingCostPerShipVolume.hashValue)
				hashCombine(seed: &hash, value: self.officeRentalCost.hashValue)
				hashCombine(seed: &hash, value: self.ownerID.hashValue)
				hashCombine(seed: &hash, value: self.reprocessingEfficiency.hashValue)
				hashCombine(seed: &hash, value: self.reprocessingStationTake.hashValue)
				self.services.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: self.standingOwnerID.hashValue)
				hashCombine(seed: &hash, value: self.systemID.hashValue)
				hashCombine(seed: &hash, value: self.typeID.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk, rhs: Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk) {
				coordinates = Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk.GetCorporationsCorporationIDOutpostsOutpostIDCoordinates(other.coordinates)
				dockingCostPerShipVolume = other.dockingCostPerShipVolume
				officeRentalCost = other.officeRentalCost
				ownerID = other.ownerID
				reprocessingEfficiency = other.reprocessingEfficiency
				reprocessingStationTake = other.reprocessingStationTake
				services = other.services.flatMap { Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk.GetCorporationsCorporationIDOutpostsOutpostIDServices($0) }
				standingOwnerID = other.standingOwnerID
				systemID = other.systemID
				typeID = other.typeID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCorporationsCorporationIDOutpostsOutpostIDOk)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESICorporationGetCorporationsCorporationIDMedalsIssuedOk) public class GetCorporationsCorporationIDMedalsIssuedOk: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public enum GetCorporationsCorporationIDMedalsIssuedStatus: String, JSONCoding, HTTPQueryable {
				case `private` = "private"
				case `public` = "public"
				
				public init() {
					self = .`private`
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCorporationsCorporationIDMedalsIssuedStatus(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var characterID: Int = Int()
			public var issuedAt: Date = Date()
			public var issuerID: Int = Int()
			public var medalID: Int = Int()
			public var reason: String = String()
			public var status: Corporation.GetCorporationsCorporationIDMedalsIssuedOk.GetCorporationsCorporationIDMedalsIssuedStatus = Corporation.GetCorporationsCorporationIDMedalsIssuedOk.GetCorporationsCorporationIDMedalsIssuedStatus()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let characterID = dictionary["character_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.characterID = characterID
				guard let issuedAt = DateFormatter.esiDateTimeFormatter.date(from: dictionary["issued_at"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.issuedAt = issuedAt
				guard let issuerID = dictionary["issuer_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.issuerID = issuerID
				guard let medalID = dictionary["medal_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.medalID = medalID
				guard let reason = dictionary["reason"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.reason = reason
				guard let status = Corporation.GetCorporationsCorporationIDMedalsIssuedOk.GetCorporationsCorporationIDMedalsIssuedStatus(rawValue: dictionary["status"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.status = status
				
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
				issuedAt = aDecoder.decodeObject(forKey: "issued_at") as? Date ?? Date()
				issuerID = aDecoder.decodeInteger(forKey: "issuer_id")
				medalID = aDecoder.decodeInteger(forKey: "medal_id")
				reason = aDecoder.decodeObject(forKey: "reason") as? String ?? String()
				status = Corporation.GetCorporationsCorporationIDMedalsIssuedOk.GetCorporationsCorporationIDMedalsIssuedStatus(rawValue: aDecoder.decodeObject(forKey: "status") as? String ?? "") ?? Corporation.GetCorporationsCorporationIDMedalsIssuedOk.GetCorporationsCorporationIDMedalsIssuedStatus()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(characterID, forKey: "character_id")
				aCoder.encode(issuedAt, forKey: "issued_at")
				aCoder.encode(issuerID, forKey: "issuer_id")
				aCoder.encode(medalID, forKey: "medal_id")
				aCoder.encode(reason, forKey: "reason")
				aCoder.encode(status.rawValue, forKey: "status")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["character_id"] = characterID.json
				json["issued_at"] = issuedAt.json
				json["issuer_id"] = issuerID.json
				json["medal_id"] = medalID.json
				json["reason"] = reason.json
				json["status"] = status.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.characterID.hashValue)
				hashCombine(seed: &hash, value: self.issuedAt.hashValue)
				hashCombine(seed: &hash, value: self.issuerID.hashValue)
				hashCombine(seed: &hash, value: self.medalID.hashValue)
				hashCombine(seed: &hash, value: self.reason.hashValue)
				hashCombine(seed: &hash, value: self.status.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Corporation.GetCorporationsCorporationIDMedalsIssuedOk, rhs: Corporation.GetCorporationsCorporationIDMedalsIssuedOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Corporation.GetCorporationsCorporationIDMedalsIssuedOk) {
				characterID = other.characterID
				issuedAt = other.issuedAt
				issuerID = other.issuerID
				medalID = other.medalID
				reason = other.reason
				status = other.status
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Corporation.GetCorporationsCorporationIDMedalsIssuedOk(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCorporationsCorporationIDMedalsIssuedOk)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESICorporationInformation) public class Information: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var allianceID: Int? = nil
			public var ceoID: Int = Int()
			public var creatorID: Int = Int()
			public var dateFounded: Date? = nil
			public var localizedDescription: String? = nil
			public var factionID: Int? = nil
			public var homeStationID: Int? = nil
			public var memberCount: Int = Int()
			public var name: String = String()
			public var shares: Int64? = nil
			public var taxRate: Float = Float()
			public var ticker: String = String()
			public var url: String? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				allianceID = dictionary["alliance_id"] as? Int
				guard let ceoID = dictionary["ceo_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.ceoID = ceoID
				guard let creatorID = dictionary["creator_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.creatorID = creatorID
				dateFounded = DateFormatter.esiDateTimeFormatter.date(from: dictionary["date_founded"] as? String ?? "")
				localizedDescription = dictionary["description"] as? String
				factionID = dictionary["faction_id"] as? Int
				homeStationID = dictionary["home_station_id"] as? Int
				guard let memberCount = dictionary["member_count"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.memberCount = memberCount
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.name = name
				shares = dictionary["shares"] as? Int64
				guard let taxRate = dictionary["tax_rate"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.taxRate = taxRate
				guard let ticker = dictionary["ticker"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.ticker = ticker
				url = dictionary["url"] as? String
				
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
				creatorID = aDecoder.decodeInteger(forKey: "creator_id")
				dateFounded = aDecoder.decodeObject(forKey: "date_founded") as? Date
				localizedDescription = aDecoder.decodeObject(forKey: "description") as? String
				factionID = aDecoder.containsValue(forKey: "faction_id") ? aDecoder.decodeInteger(forKey: "faction_id") : nil
				homeStationID = aDecoder.containsValue(forKey: "home_station_id") ? aDecoder.decodeInteger(forKey: "home_station_id") : nil
				memberCount = aDecoder.decodeInteger(forKey: "member_count")
				name = aDecoder.decodeObject(forKey: "name") as? String ?? String()
				shares = aDecoder.containsValue(forKey: "shares") ? aDecoder.decodeInt64(forKey: "shares") : nil
				taxRate = aDecoder.decodeFloat(forKey: "tax_rate")
				ticker = aDecoder.decodeObject(forKey: "ticker") as? String ?? String()
				url = aDecoder.decodeObject(forKey: "url") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = allianceID {
					aCoder.encode(v, forKey: "alliance_id")
				}
				aCoder.encode(ceoID, forKey: "ceo_id")
				aCoder.encode(creatorID, forKey: "creator_id")
				if let v = dateFounded {
					aCoder.encode(v, forKey: "date_founded")
				}
				if let v = localizedDescription {
					aCoder.encode(v, forKey: "description")
				}
				if let v = factionID {
					aCoder.encode(v, forKey: "faction_id")
				}
				if let v = homeStationID {
					aCoder.encode(v, forKey: "home_station_id")
				}
				aCoder.encode(memberCount, forKey: "member_count")
				aCoder.encode(name, forKey: "name")
				if let v = shares {
					aCoder.encode(v, forKey: "shares")
				}
				aCoder.encode(taxRate, forKey: "tax_rate")
				aCoder.encode(ticker, forKey: "ticker")
				if let v = url {
					aCoder.encode(v, forKey: "url")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = allianceID?.json {
					json["alliance_id"] = v
				}
				json["ceo_id"] = ceoID.json
				json["creator_id"] = creatorID.json
				if let v = dateFounded?.json {
					json["date_founded"] = v
				}
				if let v = localizedDescription?.json {
					json["description"] = v
				}
				if let v = factionID?.json {
					json["faction_id"] = v
				}
				if let v = homeStationID?.json {
					json["home_station_id"] = v
				}
				json["member_count"] = memberCount.json
				json["name"] = name.json
				if let v = shares?.json {
					json["shares"] = v
				}
				json["tax_rate"] = taxRate.json
				json["ticker"] = ticker.json
				if let v = url?.json {
					json["url"] = v
				}
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.allianceID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.ceoID.hashValue)
				hashCombine(seed: &hash, value: self.creatorID.hashValue)
				hashCombine(seed: &hash, value: self.dateFounded?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.localizedDescription?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.factionID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.homeStationID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.memberCount.hashValue)
				hashCombine(seed: &hash, value: self.name.hashValue)
				hashCombine(seed: &hash, value: self.shares?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.taxRate.hashValue)
				hashCombine(seed: &hash, value: self.ticker.hashValue)
				hashCombine(seed: &hash, value: self.url?.hashValue ?? 0)
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
				creatorID = other.creatorID
				dateFounded = other.dateFounded
				localizedDescription = other.localizedDescription
				factionID = other.factionID
				homeStationID = other.homeStationID
				memberCount = other.memberCount
				name = other.name
				shares = other.shares
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
		
		
		@objc(ESICorporationGetCorporationsCorporationIDShareholdersOk) public class GetCorporationsCorporationIDShareholdersOk: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public enum GetCorporationsCorporationIDShareholdersShareholderType: String, JSONCoding, HTTPQueryable {
				case character = "character"
				case corporation = "corporation"
				
				public init() {
					self = .character
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCorporationsCorporationIDShareholdersShareholderType(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var shareCount: Int64 = Int64()
			public var shareholderID: Int = Int()
			public var shareholderType: Corporation.GetCorporationsCorporationIDShareholdersOk.GetCorporationsCorporationIDShareholdersShareholderType = Corporation.GetCorporationsCorporationIDShareholdersOk.GetCorporationsCorporationIDShareholdersShareholderType()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let shareCount = dictionary["share_count"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.shareCount = shareCount
				guard let shareholderID = dictionary["shareholder_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.shareholderID = shareholderID
				guard let shareholderType = Corporation.GetCorporationsCorporationIDShareholdersOk.GetCorporationsCorporationIDShareholdersShareholderType(rawValue: dictionary["shareholder_type"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.shareholderType = shareholderType
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				shareCount = aDecoder.decodeInt64(forKey: "share_count")
				shareholderID = aDecoder.decodeInteger(forKey: "shareholder_id")
				shareholderType = Corporation.GetCorporationsCorporationIDShareholdersOk.GetCorporationsCorporationIDShareholdersShareholderType(rawValue: aDecoder.decodeObject(forKey: "shareholder_type") as? String ?? "") ?? Corporation.GetCorporationsCorporationIDShareholdersOk.GetCorporationsCorporationIDShareholdersShareholderType()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(shareCount, forKey: "share_count")
				aCoder.encode(shareholderID, forKey: "shareholder_id")
				aCoder.encode(shareholderType.rawValue, forKey: "shareholder_type")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["share_count"] = shareCount.json
				json["shareholder_id"] = shareholderID.json
				json["shareholder_type"] = shareholderType.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.shareCount.hashValue)
				hashCombine(seed: &hash, value: self.shareholderID.hashValue)
				hashCombine(seed: &hash, value: self.shareholderType.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Corporation.GetCorporationsCorporationIDShareholdersOk, rhs: Corporation.GetCorporationsCorporationIDShareholdersOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Corporation.GetCorporationsCorporationIDShareholdersOk) {
				shareCount = other.shareCount
				shareholderID = other.shareholderID
				shareholderType = other.shareholderType
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Corporation.GetCorporationsCorporationIDShareholdersOk(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCorporationsCorporationIDShareholdersOk)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESICorporationGetCorporationsCorporationIDMembersTitlesOk) public class GetCorporationsCorporationIDMembersTitlesOk: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var characterID: Int = Int()
			public var titles: [Int] = []
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let characterID = dictionary["character_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.characterID = characterID
				titles = try (dictionary["titles"] as? [Any])?.map {try Int(json: $0)} ?? []
				
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
				titles = aDecoder.decodeObject(forKey: "titles") as? [Int] ?? []
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(characterID, forKey: "character_id")
				aCoder.encode(titles, forKey: "titles")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["character_id"] = characterID.json
				json["titles"] = titles.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.characterID.hashValue)
				self.titles.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Corporation.GetCorporationsCorporationIDMembersTitlesOk, rhs: Corporation.GetCorporationsCorporationIDMembersTitlesOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Corporation.GetCorporationsCorporationIDMembersTitlesOk) {
				characterID = other.characterID
				titles = other.titles.flatMap { $0 }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Corporation.GetCorporationsCorporationIDMembersTitlesOk(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCorporationsCorporationIDMembersTitlesOk)?.hashValue == hashValue
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
		
		
		@objc(ESICorporationGetCorporationsCorporationIDFacilitiesOk) public class GetCorporationsCorporationIDFacilitiesOk: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var facilityID: Int64 = Int64()
			public var systemID: Int = Int()
			public var typeID: Int = Int()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let facilityID = dictionary["facility_id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.facilityID = facilityID
				guard let systemID = dictionary["system_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.systemID = systemID
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
				systemID = aDecoder.decodeInteger(forKey: "system_id")
				typeID = aDecoder.decodeInteger(forKey: "type_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(facilityID, forKey: "facility_id")
				aCoder.encode(systemID, forKey: "system_id")
				aCoder.encode(typeID, forKey: "type_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["facility_id"] = facilityID.json
				json["system_id"] = systemID.json
				json["type_id"] = typeID.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.facilityID.hashValue)
				hashCombine(seed: &hash, value: self.systemID.hashValue)
				hashCombine(seed: &hash, value: self.typeID.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Corporation.GetCorporationsCorporationIDFacilitiesOk, rhs: Corporation.GetCorporationsCorporationIDFacilitiesOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Corporation.GetCorporationsCorporationIDFacilitiesOk) {
				facilityID = other.facilityID
				systemID = other.systemID
				typeID = other.typeID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Corporation.GetCorporationsCorporationIDFacilitiesOk(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCorporationsCorporationIDFacilitiesOk)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESICorporationGetCorporationsCorporationIDMedalsOk) public class GetCorporationsCorporationIDMedalsOk: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var createdAt: Date = Date()
			public var creatorID: Int = Int()
			public var localizedDescription: String = String()
			public var medalID: Int = Int()
			public var title: String = String()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let createdAt = DateFormatter.esiDateTimeFormatter.date(from: dictionary["created_at"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.createdAt = createdAt
				guard let creatorID = dictionary["creator_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.creatorID = creatorID
				guard let localizedDescription = dictionary["description"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.localizedDescription = localizedDescription
				guard let medalID = dictionary["medal_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.medalID = medalID
				guard let title = dictionary["title"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.title = title
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				createdAt = aDecoder.decodeObject(forKey: "created_at") as? Date ?? Date()
				creatorID = aDecoder.decodeInteger(forKey: "creator_id")
				localizedDescription = aDecoder.decodeObject(forKey: "description") as? String ?? String()
				medalID = aDecoder.decodeInteger(forKey: "medal_id")
				title = aDecoder.decodeObject(forKey: "title") as? String ?? String()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(createdAt, forKey: "created_at")
				aCoder.encode(creatorID, forKey: "creator_id")
				aCoder.encode(localizedDescription, forKey: "description")
				aCoder.encode(medalID, forKey: "medal_id")
				aCoder.encode(title, forKey: "title")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["created_at"] = createdAt.json
				json["creator_id"] = creatorID.json
				json["description"] = localizedDescription.json
				json["medal_id"] = medalID.json
				json["title"] = title.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.createdAt.hashValue)
				hashCombine(seed: &hash, value: self.creatorID.hashValue)
				hashCombine(seed: &hash, value: self.localizedDescription.hashValue)
				hashCombine(seed: &hash, value: self.medalID.hashValue)
				hashCombine(seed: &hash, value: self.title.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Corporation.GetCorporationsCorporationIDMedalsOk, rhs: Corporation.GetCorporationsCorporationIDMedalsOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Corporation.GetCorporationsCorporationIDMedalsOk) {
				createdAt = other.createdAt
				creatorID = other.creatorID
				localizedDescription = other.localizedDescription
				medalID = other.medalID
				title = other.title
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Corporation.GetCorporationsCorporationIDMedalsOk(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCorporationsCorporationIDMedalsOk)?.hashValue == hashValue
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
				fuelExpires = DateFormatter.esiDateTimeFormatter.date(from: dictionary["fuel_expires"] as? String ?? "")
				nextVul = try (dictionary["next_vul"] as? [Any])?.map {try Corporation.Structure.GetCorporationsCorporationIDStructuresNextVul(json: $0)} ?? []
				guard let profileID = dictionary["profile_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.profileID = profileID
				services = try (dictionary["services"] as? [Any])?.map {try Corporation.Structure.GetCorporationsCorporationIDStructuresServices(json: $0)}
				stateTimerEnd = DateFormatter.esiDateTimeFormatter.date(from: dictionary["state_timer_end"] as? String ?? "")
				stateTimerStart = DateFormatter.esiDateTimeFormatter.date(from: dictionary["state_timer_start"] as? String ?? "")
				guard let structureID = dictionary["structure_id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.structureID = structureID
				guard let systemID = dictionary["system_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.systemID = systemID
				guard let typeID = dictionary["type_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.typeID = typeID
				unanchorsAt = DateFormatter.esiDateTimeFormatter.date(from: dictionary["unanchors_at"] as? String ?? "")
				
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
		
		
		@objc(ESICorporationGetCorporationsCorporationIDStarbasesOk) public class GetCorporationsCorporationIDStarbasesOk: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public enum GetCorporationsCorporationIDStarbasesState: String, JSONCoding, HTTPQueryable {
				case offline = "offline"
				case online = "online"
				case onlining = "onlining"
				case reinforced = "reinforced"
				case unanchoring = "unanchoring"
				
				public init() {
					self = .offline
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetCorporationsCorporationIDStarbasesState(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var moonID: Int? = nil
			public var onlinedSince: Date? = nil
			public var reinforcedUntil: Date? = nil
			public var starbaseID: Int64 = Int64()
			public var state: Corporation.GetCorporationsCorporationIDStarbasesOk.GetCorporationsCorporationIDStarbasesState? = nil
			public var systemID: Int = Int()
			public var typeID: Int = Int()
			public var unanchorAt: Date? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				moonID = dictionary["moon_id"] as? Int
				onlinedSince = DateFormatter.esiDateTimeFormatter.date(from: dictionary["onlined_since"] as? String ?? "")
				reinforcedUntil = DateFormatter.esiDateTimeFormatter.date(from: dictionary["reinforced_until"] as? String ?? "")
				guard let starbaseID = dictionary["starbase_id"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.starbaseID = starbaseID
				state = Corporation.GetCorporationsCorporationIDStarbasesOk.GetCorporationsCorporationIDStarbasesState(rawValue: dictionary["state"] as? String ?? "")
				guard let systemID = dictionary["system_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.systemID = systemID
				guard let typeID = dictionary["type_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.typeID = typeID
				unanchorAt = DateFormatter.esiDateTimeFormatter.date(from: dictionary["unanchor_at"] as? String ?? "")
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				moonID = aDecoder.containsValue(forKey: "moon_id") ? aDecoder.decodeInteger(forKey: "moon_id") : nil
				onlinedSince = aDecoder.decodeObject(forKey: "onlined_since") as? Date
				reinforcedUntil = aDecoder.decodeObject(forKey: "reinforced_until") as? Date
				starbaseID = aDecoder.decodeInt64(forKey: "starbase_id")
				state = Corporation.GetCorporationsCorporationIDStarbasesOk.GetCorporationsCorporationIDStarbasesState(rawValue: aDecoder.decodeObject(forKey: "state") as? String ?? "")
				systemID = aDecoder.decodeInteger(forKey: "system_id")
				typeID = aDecoder.decodeInteger(forKey: "type_id")
				unanchorAt = aDecoder.decodeObject(forKey: "unanchor_at") as? Date
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = moonID {
					aCoder.encode(v, forKey: "moon_id")
				}
				if let v = onlinedSince {
					aCoder.encode(v, forKey: "onlined_since")
				}
				if let v = reinforcedUntil {
					aCoder.encode(v, forKey: "reinforced_until")
				}
				aCoder.encode(starbaseID, forKey: "starbase_id")
				if let v = state {
					aCoder.encode(v.rawValue, forKey: "state")
				}
				aCoder.encode(systemID, forKey: "system_id")
				aCoder.encode(typeID, forKey: "type_id")
				if let v = unanchorAt {
					aCoder.encode(v, forKey: "unanchor_at")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = moonID?.json {
					json["moon_id"] = v
				}
				if let v = onlinedSince?.json {
					json["onlined_since"] = v
				}
				if let v = reinforcedUntil?.json {
					json["reinforced_until"] = v
				}
				json["starbase_id"] = starbaseID.json
				if let v = state?.json {
					json["state"] = v
				}
				json["system_id"] = systemID.json
				json["type_id"] = typeID.json
				if let v = unanchorAt?.json {
					json["unanchor_at"] = v
				}
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.moonID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.onlinedSince?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.reinforcedUntil?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.starbaseID.hashValue)
				hashCombine(seed: &hash, value: self.state?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.systemID.hashValue)
				hashCombine(seed: &hash, value: self.typeID.hashValue)
				hashCombine(seed: &hash, value: self.unanchorAt?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Corporation.GetCorporationsCorporationIDStarbasesOk, rhs: Corporation.GetCorporationsCorporationIDStarbasesOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Corporation.GetCorporationsCorporationIDStarbasesOk) {
				moonID = other.moonID
				onlinedSince = other.onlinedSince
				reinforcedUntil = other.reinforcedUntil
				starbaseID = other.starbaseID
				state = other.state
				systemID = other.systemID
				typeID = other.typeID
				unanchorAt = other.unanchorAt
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Corporation.GetCorporationsCorporationIDStarbasesOk(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetCorporationsCorporationIDStarbasesOk)?.hashValue == hashValue
			}
			
		}
		
		
	}
	
}
