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
		
		@discardableResult
		public func getCorporationShareholders(corporationID: Int, ifNoneMatch: String? = nil, page: Int? = nil) -> Future<ESI.Result<[Corporation.GetCorporationsCorporationIDShareholdersOk]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Corporation.GetCorporationsCorporationIDShareholdersOk]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-wallet.read_corporation_wallets.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/shareholders/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Corporation.GetCorporationsCorporationIDShareholdersOk]>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCorporationFacilities(corporationID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<[Corporation.GetCorporationsCorporationIDFacilitiesOk]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Corporation.GetCorporationsCorporationIDFacilitiesOk]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.read_facilities.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/facilities/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Corporation.GetCorporationsCorporationIDFacilitiesOk]>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCorporationStandings(corporationID: Int, ifNoneMatch: String? = nil, page: Int? = nil) -> Future<ESI.Result<[Corporation.GetCorporationsCorporationIDStandingsOk]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Corporation.GetCorporationsCorporationIDStandingsOk]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.read_standings.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/standings/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Corporation.GetCorporationsCorporationIDStandingsOk]>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getAllianceHistory(corporationID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<[Corporation.History]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Corporation.History]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v2/corporations/\(corporationID)/alliancehistory/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Corporation.History]>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCorporationOutposts(corporationID: Int, ifNoneMatch: String? = nil, page: Int? = nil) -> Future<ESI.Result<[Int]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Int]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.read_outposts.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/outposts/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Int]>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCorporationInformation(corporationID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<Corporation.Information>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<Corporation.Information>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v4/corporations/\(corporationID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Corporation.Information>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCorporationStructures(corporationID: Int, ifNoneMatch: String? = nil, language: Language? = nil, page: Int? = nil) -> Future<ESI.Result<[Corporation.Structure]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Corporation.Structure]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.read_structures.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			if let v = language?.httpQuery {
				query.append(URLQueryItem(name: "language", value: v))
			}
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v2/corporations/\(corporationID)/structures/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Corporation.Structure]>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCorporationNames(corporationIds: [Int], ifNoneMatch: String? = nil) -> Future<ESI.Result<[Corporation.Name]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Corporation.Name]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			if let v = corporationIds.httpQuery {
				query.append(URLQueryItem(name: "corporation_ids", value: v))
			}
			
			let url = session!.baseURL + "/v2/corporations/names/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Corporation.Name]>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getStarbasePOSDetail(corporationID: Int, ifNoneMatch: String? = nil, starbaseID: Int64, systemID: Int) -> Future<ESI.Result<Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.read_starbases.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			if let v = systemID.httpQuery {
				query.append(URLQueryItem(name: "system_id", value: v))
			}
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/starbases/\(starbaseID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCorporationMemberRoles(corporationID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<[Corporation.Role]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Corporation.Role]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.read_corporation_membership.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/roles/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Corporation.Role]>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getNpcCorporations(ifNoneMatch: String? = nil) -> Future<ESI.Result<[Int]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Int]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/corporations/npccorps/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Int]>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCorporationMedals(corporationID: Int, ifNoneMatch: String? = nil, page: Int? = nil) -> Future<ESI.Result<[Corporation.GetCorporationsCorporationIDMedalsOk]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Corporation.GetCorporationsCorporationIDMedalsOk]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.read_medals.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/medals/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Corporation.GetCorporationsCorporationIDMedalsOk]>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCorporationMembers(corporationID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<[Int]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Int]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.read_corporation_membership.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v3/corporations/\(corporationID)/members/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Int]>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCorporationMemberRolesHistory(corporationID: Int, ifNoneMatch: String? = nil, page: Int? = nil) -> Future<ESI.Result<[Corporation.GetCorporationsCorporationIDRolesHistoryOk]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Corporation.GetCorporationsCorporationIDRolesHistoryOk]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.read_corporation_membership.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/roles/history/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Corporation.GetCorporationsCorporationIDRolesHistoryOk]>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCorporationOutpostDetails(corporationID: Int, ifNoneMatch: String? = nil, outpostID: Int) -> Future<ESI.Result<Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.read_outposts.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/outposts/\(outpostID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCorporationBlueprints(corporationID: Int, ifNoneMatch: String? = nil, page: Int? = nil) -> Future<ESI.Result<[Corporation.GetCorporationsCorporationIDBlueprintsOk]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Corporation.GetCorporationsCorporationIDBlueprintsOk]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.read_blueprints.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v2/corporations/\(corporationID)/blueprints/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Corporation.GetCorporationsCorporationIDBlueprintsOk]>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func trackCorporationMembers(corporationID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<[Corporation.GetCorporationsCorporationIDMembertrackingOk]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Corporation.GetCorporationsCorporationIDMembertrackingOk]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.track_members.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/membertracking/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Corporation.GetCorporationsCorporationIDMembertrackingOk]>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCorporationIssuedMedals(corporationID: Int, ifNoneMatch: String? = nil, page: Int? = nil) -> Future<ESI.Result<[Corporation.GetCorporationsCorporationIDMedalsIssuedOk]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Corporation.GetCorporationsCorporationIDMedalsIssuedOk]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.read_medals.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/medals/issued/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Corporation.GetCorporationsCorporationIDMedalsIssuedOk]>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCorporationTitles(corporationID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<[Corporation.GetCorporationsCorporationIDTitlesOk]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Corporation.GetCorporationsCorporationIDTitlesOk]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.read_titles.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/titles/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Corporation.GetCorporationsCorporationIDTitlesOk]>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCorporationsMembersTitles(corporationID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<[Corporation.GetCorporationsCorporationIDMembersTitlesOk]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Corporation.GetCorporationsCorporationIDMembersTitlesOk]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.read_titles.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/members/titles/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Corporation.GetCorporationsCorporationIDMembersTitlesOk]>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCorporationIcon(corporationID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<Corporation.Icon>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<Corporation.Icon>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/icons/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Corporation.Icon>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCorporationMemberLimit(corporationID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<Int>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<Int>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.track_members.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/members/limit/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Int>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getAllCorporationALSCLogs(corporationID: Int, ifNoneMatch: String? = nil, page: Int? = nil) -> Future<ESI.Result<[Corporation.GetCorporationsCorporationIDContainersLogsOk]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Corporation.GetCorporationsCorporationIDContainersLogsOk]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.read_container_logs.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v2/corporations/\(corporationID)/containers/logs/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Corporation.GetCorporationsCorporationIDContainersLogsOk]>) in
					promise.set(result: response.result, cached: 600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCorporationDivisions(corporationID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<Corporation.Divisions>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<Corporation.Divisions>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.read_divisions.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/divisions/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Corporation.Divisions>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCorporationStarbasesPOSes(corporationID: Int, ifNoneMatch: String? = nil, page: Int? = nil) -> Future<ESI.Result<[Corporation.GetCorporationsCorporationIDStarbasesOk]>> {
			var session = sessionManager
			let promise = Promise<ESI.Result<[Corporation.GetCorporationsCorporationIDStarbasesOk]>>()
			guard session != nil else {
				try! promise.fail(ESIError.internalError)
				return promise.future
			}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-corporations.read_starbases.v1") else {
				try! promise.fail(ESIError.forbidden)
				return promise.future
			}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch {
				headers["If-None-Match"] = String(v)
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v1/corporations/\(corporationID)/starbases/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.perform { () -> DataRequest in
				return session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Corporation.GetCorporationsCorporationIDStarbasesOk]>) in
					promise.set(result: response.result, cached: 3600.0)
					session = nil
				}
			}
			return promise.future
		}
		
		
		public struct GetCorporationsCorporationIDMembertrackingOk: Codable, Hashable {
			
			
			public var baseID: Int?
			public var characterID: Int
			public var locationID: Int64?
			public var logoffDate: Date?
			public var logonDate: Date?
			public var shipTypeID: Int?
			public var startDate: Date?
			
			public init(baseID: Int?, characterID: Int, locationID: Int64?, logoffDate: Date?, logonDate: Date?, shipTypeID: Int?, startDate: Date?) {
				self.baseID = baseID
				self.characterID = characterID
				self.locationID = locationID
				self.logoffDate = logoffDate
				self.logonDate = logonDate
				self.shipTypeID = shipTypeID
				self.startDate = startDate
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: baseID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: characterID.hashValue)
				hashCombine(seed: &hash, value: locationID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: logoffDate?.hashValue ?? 0)
				hashCombine(seed: &hash, value: logonDate?.hashValue ?? 0)
				hashCombine(seed: &hash, value: shipTypeID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: startDate?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Corporation.GetCorporationsCorporationIDMembertrackingOk, rhs: Corporation.GetCorporationsCorporationIDMembertrackingOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case baseID = "base_id"
				case characterID = "character_id"
				case locationID = "location_id"
				case logoffDate = "logoff_date"
				case logonDate = "logon_date"
				case shipTypeID = "ship_type_id"
				case startDate = "start_date"
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .logoffDate: return DateFormatter.esiDateTimeFormatter
						case .logonDate: return DateFormatter.esiDateTimeFormatter
						case .startDate: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCorporationsCorporationIDStandingsOk: Codable, Hashable {
			
			public enum GetCorporationsCorporationIDStandingsFromType: String, Codable, HTTPQueryable {
				case agent = "agent"
				case faction = "faction"
				case npcCorp = "npc_corp"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var fromID: Int
			public var fromType: Corporation.GetCorporationsCorporationIDStandingsOk.GetCorporationsCorporationIDStandingsFromType
			public var standing: Float
			
			public init(fromID: Int, fromType: Corporation.GetCorporationsCorporationIDStandingsOk.GetCorporationsCorporationIDStandingsFromType, standing: Float) {
				self.fromID = fromID
				self.fromType = fromType
				self.standing = standing
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: fromID.hashValue)
				hashCombine(seed: &hash, value: fromType.hashValue)
				hashCombine(seed: &hash, value: standing.hashValue)
				return hash
			}
			
			public static func ==(lhs: Corporation.GetCorporationsCorporationIDStandingsOk, rhs: Corporation.GetCorporationsCorporationIDStandingsOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case fromID = "from_id"
				case fromType = "from_type"
				case standing
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCorporationsCorporationIDStarbasesStarbaseIDOk: Codable, Hashable {
			
			public enum GetCorporationsCorporationIDStarbasesStarbaseIDFuelBayTake: String, Codable, HTTPQueryable {
				case allianceMember = "alliance_member"
				case configStarbaseEquipmentRole = "config_starbase_equipment_role"
				case corporationMember = "corporation_member"
				case starbaseFuelTechnicianRole = "starbase_fuel_technician_role"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDStarbasesStarbaseIDAnchor: String, Codable, HTTPQueryable {
				case allianceMember = "alliance_member"
				case configStarbaseEquipmentRole = "config_starbase_equipment_role"
				case corporationMember = "corporation_member"
				case starbaseFuelTechnicianRole = "starbase_fuel_technician_role"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDStarbasesStarbaseIDOffline: String, Codable, HTTPQueryable {
				case allianceMember = "alliance_member"
				case configStarbaseEquipmentRole = "config_starbase_equipment_role"
				case corporationMember = "corporation_member"
				case starbaseFuelTechnicianRole = "starbase_fuel_technician_role"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public struct GetCorporationsCorporationIDStarbasesStarbaseIDFuels: Codable, Hashable {
				
				
				public var quantity: Int
				public var typeID: Int
				
				public init(quantity: Int, typeID: Int) {
					self.quantity = quantity
					self.typeID = typeID
				}
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: quantity.hashValue)
					hashCombine(seed: &hash, value: typeID.hashValue)
					return hash
				}
				
				public static func ==(lhs: Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDFuels, rhs: Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDFuels) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case quantity
					case typeID = "type_id"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public enum GetCorporationsCorporationIDStarbasesStarbaseIDOnline: String, Codable, HTTPQueryable {
				case allianceMember = "alliance_member"
				case configStarbaseEquipmentRole = "config_starbase_equipment_role"
				case corporationMember = "corporation_member"
				case starbaseFuelTechnicianRole = "starbase_fuel_technician_role"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDStarbasesStarbaseIDFuelBayView: String, Codable, HTTPQueryable {
				case allianceMember = "alliance_member"
				case configStarbaseEquipmentRole = "config_starbase_equipment_role"
				case corporationMember = "corporation_member"
				case starbaseFuelTechnicianRole = "starbase_fuel_technician_role"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDStarbasesStarbaseIDUnanchor: String, Codable, HTTPQueryable {
				case allianceMember = "alliance_member"
				case configStarbaseEquipmentRole = "config_starbase_equipment_role"
				case corporationMember = "corporation_member"
				case starbaseFuelTechnicianRole = "starbase_fuel_technician_role"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var allowAllianceMembers: Bool
			public var allowCorporationMembers: Bool
			public var anchor: Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDAnchor
			public var attackIfAtWar: Bool
			public var attackIfOtherSecurityStatusDropping: Bool
			public var attackSecurityStatusThreshold: Float?
			public var attackStandingThreshold: Float?
			public var fuelBayTake: Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDFuelBayTake
			public var fuelBayView: Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDFuelBayView
			public var fuels: [Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDFuels]?
			public var offline: Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDOffline
			public var online: Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDOnline
			public var unanchor: Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDUnanchor
			public var useAllianceStandings: Bool
			
			public init(allowAllianceMembers: Bool, allowCorporationMembers: Bool, anchor: Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDAnchor, attackIfAtWar: Bool, attackIfOtherSecurityStatusDropping: Bool, attackSecurityStatusThreshold: Float?, attackStandingThreshold: Float?, fuelBayTake: Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDFuelBayTake, fuelBayView: Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDFuelBayView, fuels: [Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDFuels]?, offline: Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDOffline, online: Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDOnline, unanchor: Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDUnanchor, useAllianceStandings: Bool) {
				self.allowAllianceMembers = allowAllianceMembers
				self.allowCorporationMembers = allowCorporationMembers
				self.anchor = anchor
				self.attackIfAtWar = attackIfAtWar
				self.attackIfOtherSecurityStatusDropping = attackIfOtherSecurityStatusDropping
				self.attackSecurityStatusThreshold = attackSecurityStatusThreshold
				self.attackStandingThreshold = attackStandingThreshold
				self.fuelBayTake = fuelBayTake
				self.fuelBayView = fuelBayView
				self.fuels = fuels
				self.offline = offline
				self.online = online
				self.unanchor = unanchor
				self.useAllianceStandings = useAllianceStandings
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: allowAllianceMembers.hashValue)
				hashCombine(seed: &hash, value: allowCorporationMembers.hashValue)
				hashCombine(seed: &hash, value: anchor.hashValue)
				hashCombine(seed: &hash, value: attackIfAtWar.hashValue)
				hashCombine(seed: &hash, value: attackIfOtherSecurityStatusDropping.hashValue)
				hashCombine(seed: &hash, value: attackSecurityStatusThreshold?.hashValue ?? 0)
				hashCombine(seed: &hash, value: attackStandingThreshold?.hashValue ?? 0)
				hashCombine(seed: &hash, value: fuelBayTake.hashValue)
				hashCombine(seed: &hash, value: fuelBayView.hashValue)
				self.fuels?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: offline.hashValue)
				hashCombine(seed: &hash, value: online.hashValue)
				hashCombine(seed: &hash, value: unanchor.hashValue)
				hashCombine(seed: &hash, value: useAllianceStandings.hashValue)
				return hash
			}
			
			public static func ==(lhs: Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk, rhs: Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case allowAllianceMembers = "allow_alliance_members"
				case allowCorporationMembers = "allow_corporation_members"
				case anchor
				case attackIfAtWar = "attack_if_at_war"
				case attackIfOtherSecurityStatusDropping = "attack_if_other_security_status_dropping"
				case attackSecurityStatusThreshold = "attack_security_status_threshold"
				case attackStandingThreshold = "attack_standing_threshold"
				case fuelBayTake = "fuel_bay_take"
				case fuelBayView = "fuel_bay_view"
				case fuels
				case offline
				case online
				case unanchor
				case useAllianceStandings = "use_alliance_standings"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCorporationsCorporationIDNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Corporation.GetCorporationsCorporationIDNotFound, rhs: Corporation.GetCorporationsCorporationIDNotFound) -> Bool {
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
		
		
		public struct GetCorporationsCorporationIDRolesHistoryOk: Codable, Hashable {
			
			public enum GetCorporationsCorporationIDRolesHistoryRoleType: String, Codable, HTTPQueryable {
				case grantableRoles = "grantable_roles"
				case grantableRolesAtBase = "grantable_roles_at_base"
				case grantableRolesAtHq = "grantable_roles_at_hq"
				case grantableRolesAtOther = "grantable_roles_at_other"
				case roles = "roles"
				case rolesAtBase = "roles_at_base"
				case rolesAtHq = "roles_at_hq"
				case rolesAtOther = "roles_at_other"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDRolesHistoryOldRoles: String, Codable, HTTPQueryable {
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
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDRolesHistoryNewRoles: String, Codable, HTTPQueryable {
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
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var changedAt: Date
			public var characterID: Int
			public var issuerID: Int
			public var newRoles: [Corporation.GetCorporationsCorporationIDRolesHistoryOk.GetCorporationsCorporationIDRolesHistoryNewRoles]
			public var oldRoles: [Corporation.GetCorporationsCorporationIDRolesHistoryOk.GetCorporationsCorporationIDRolesHistoryOldRoles]
			public var roleType: Corporation.GetCorporationsCorporationIDRolesHistoryOk.GetCorporationsCorporationIDRolesHistoryRoleType
			
			public init(changedAt: Date, characterID: Int, issuerID: Int, newRoles: [Corporation.GetCorporationsCorporationIDRolesHistoryOk.GetCorporationsCorporationIDRolesHistoryNewRoles], oldRoles: [Corporation.GetCorporationsCorporationIDRolesHistoryOk.GetCorporationsCorporationIDRolesHistoryOldRoles], roleType: Corporation.GetCorporationsCorporationIDRolesHistoryOk.GetCorporationsCorporationIDRolesHistoryRoleType) {
				self.changedAt = changedAt
				self.characterID = characterID
				self.issuerID = issuerID
				self.newRoles = newRoles
				self.oldRoles = oldRoles
				self.roleType = roleType
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: changedAt.hashValue)
				hashCombine(seed: &hash, value: characterID.hashValue)
				hashCombine(seed: &hash, value: issuerID.hashValue)
				self.newRoles.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.oldRoles.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: roleType.hashValue)
				return hash
			}
			
			public static func ==(lhs: Corporation.GetCorporationsCorporationIDRolesHistoryOk, rhs: Corporation.GetCorporationsCorporationIDRolesHistoryOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case changedAt = "changed_at"
				case characterID = "character_id"
				case issuerID = "issuer_id"
				case newRoles = "new_roles"
				case oldRoles = "old_roles"
				case roleType = "role_type"
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .changedAt: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCorporationsCorporationIDTitlesOk: Codable, Hashable {
			
			public enum GetCorporationsCorporationIDTitlesGrantableRolesAtOther: String, Codable, HTTPQueryable {
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
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDTitlesGrantableRolesAtBase: String, Codable, HTTPQueryable {
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
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDTitlesRolesAtOther: String, Codable, HTTPQueryable {
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
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDTitlesGrantableRoles: String, Codable, HTTPQueryable {
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
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDTitlesGrantableRolesAtHq: String, Codable, HTTPQueryable {
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
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDTitlesRolesAtHq: String, Codable, HTTPQueryable {
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
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDTitlesRoles: String, Codable, HTTPQueryable {
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
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDTitlesRolesAtBase: String, Codable, HTTPQueryable {
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
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var grantableRoles: [Corporation.GetCorporationsCorporationIDTitlesOk.GetCorporationsCorporationIDTitlesGrantableRoles]?
			public var grantableRolesAtBase: [Corporation.GetCorporationsCorporationIDTitlesOk.GetCorporationsCorporationIDTitlesGrantableRolesAtBase]?
			public var grantableRolesAtHq: [Corporation.GetCorporationsCorporationIDTitlesOk.GetCorporationsCorporationIDTitlesGrantableRolesAtHq]?
			public var grantableRolesAtOther: [Corporation.GetCorporationsCorporationIDTitlesOk.GetCorporationsCorporationIDTitlesGrantableRolesAtOther]?
			public var name: String?
			public var roles: [Corporation.GetCorporationsCorporationIDTitlesOk.GetCorporationsCorporationIDTitlesRoles]?
			public var rolesAtBase: [Corporation.GetCorporationsCorporationIDTitlesOk.GetCorporationsCorporationIDTitlesRolesAtBase]?
			public var rolesAtHq: [Corporation.GetCorporationsCorporationIDTitlesOk.GetCorporationsCorporationIDTitlesRolesAtHq]?
			public var rolesAtOther: [Corporation.GetCorporationsCorporationIDTitlesOk.GetCorporationsCorporationIDTitlesRolesAtOther]?
			public var titleID: Int?
			
			public init(grantableRoles: [Corporation.GetCorporationsCorporationIDTitlesOk.GetCorporationsCorporationIDTitlesGrantableRoles]?, grantableRolesAtBase: [Corporation.GetCorporationsCorporationIDTitlesOk.GetCorporationsCorporationIDTitlesGrantableRolesAtBase]?, grantableRolesAtHq: [Corporation.GetCorporationsCorporationIDTitlesOk.GetCorporationsCorporationIDTitlesGrantableRolesAtHq]?, grantableRolesAtOther: [Corporation.GetCorporationsCorporationIDTitlesOk.GetCorporationsCorporationIDTitlesGrantableRolesAtOther]?, name: String?, roles: [Corporation.GetCorporationsCorporationIDTitlesOk.GetCorporationsCorporationIDTitlesRoles]?, rolesAtBase: [Corporation.GetCorporationsCorporationIDTitlesOk.GetCorporationsCorporationIDTitlesRolesAtBase]?, rolesAtHq: [Corporation.GetCorporationsCorporationIDTitlesOk.GetCorporationsCorporationIDTitlesRolesAtHq]?, rolesAtOther: [Corporation.GetCorporationsCorporationIDTitlesOk.GetCorporationsCorporationIDTitlesRolesAtOther]?, titleID: Int?) {
				self.grantableRoles = grantableRoles
				self.grantableRolesAtBase = grantableRolesAtBase
				self.grantableRolesAtHq = grantableRolesAtHq
				self.grantableRolesAtOther = grantableRolesAtOther
				self.name = name
				self.roles = roles
				self.rolesAtBase = rolesAtBase
				self.rolesAtHq = rolesAtHq
				self.rolesAtOther = rolesAtOther
				self.titleID = titleID
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				self.grantableRoles?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.grantableRolesAtBase?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.grantableRolesAtHq?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.grantableRolesAtOther?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: name?.hashValue ?? 0)
				self.roles?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.rolesAtBase?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.rolesAtHq?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.rolesAtOther?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: titleID?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Corporation.GetCorporationsCorporationIDTitlesOk, rhs: Corporation.GetCorporationsCorporationIDTitlesOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case grantableRoles = "grantable_roles"
				case grantableRolesAtBase = "grantable_roles_at_base"
				case grantableRolesAtHq = "grantable_roles_at_hq"
				case grantableRolesAtOther = "grantable_roles_at_other"
				case name
				case roles
				case rolesAtBase = "roles_at_base"
				case rolesAtHq = "roles_at_hq"
				case rolesAtOther = "roles_at_other"
				case titleID = "title_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct Icon: Codable, Hashable {
			
			
			public var px128x128: String?
			public var px256x256: String?
			public var px64x64: String?
			
			public init(px128x128: String?, px256x256: String?, px64x64: String?) {
				self.px128x128 = px128x128
				self.px256x256 = px256x256
				self.px64x64 = px64x64
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: px128x128?.hashValue ?? 0)
				hashCombine(seed: &hash, value: px256x256?.hashValue ?? 0)
				hashCombine(seed: &hash, value: px64x64?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Corporation.Icon, rhs: Corporation.Icon) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case px128x128
				case px256x256
				case px64x64
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCorporationsCorporationIDOutpostsOutpostIDOk: Codable, Hashable {
			
			public struct GetCorporationsCorporationIDOutpostsOutpostIDCoordinates: Codable, Hashable {
				
				
				public var x: Double
				public var y: Double
				public var z: Double
				
				public init(x: Double, y: Double, z: Double) {
					self.x = x
					self.y = y
					self.z = z
				}
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: x.hashValue)
					hashCombine(seed: &hash, value: y.hashValue)
					hashCombine(seed: &hash, value: z.hashValue)
					return hash
				}
				
				public static func ==(lhs: Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk.GetCorporationsCorporationIDOutpostsOutpostIDCoordinates, rhs: Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk.GetCorporationsCorporationIDOutpostsOutpostIDCoordinates) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case x
					case y
					case z
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct GetCorporationsCorporationIDOutpostsOutpostIDServices: Codable, Hashable {
				
				public enum GetCorporationsCorporationIDOutpostsOutpostIDServiceName: String, Codable, HTTPQueryable {
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
					
					public var httpQuery: String? {
						return rawValue
					}
					
				}
				
				public var discountPerGoodStanding: Double
				public var minimumStanding: Double
				public var serviceName: Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk.GetCorporationsCorporationIDOutpostsOutpostIDServices.GetCorporationsCorporationIDOutpostsOutpostIDServiceName
				public var surchargePerBadStanding: Double
				
				public init(discountPerGoodStanding: Double, minimumStanding: Double, serviceName: Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk.GetCorporationsCorporationIDOutpostsOutpostIDServices.GetCorporationsCorporationIDOutpostsOutpostIDServiceName, surchargePerBadStanding: Double) {
					self.discountPerGoodStanding = discountPerGoodStanding
					self.minimumStanding = minimumStanding
					self.serviceName = serviceName
					self.surchargePerBadStanding = surchargePerBadStanding
				}
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: discountPerGoodStanding.hashValue)
					hashCombine(seed: &hash, value: minimumStanding.hashValue)
					hashCombine(seed: &hash, value: serviceName.hashValue)
					hashCombine(seed: &hash, value: surchargePerBadStanding.hashValue)
					return hash
				}
				
				public static func ==(lhs: Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk.GetCorporationsCorporationIDOutpostsOutpostIDServices, rhs: Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk.GetCorporationsCorporationIDOutpostsOutpostIDServices) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case discountPerGoodStanding = "discount_per_good_standing"
					case minimumStanding = "minimum_standing"
					case serviceName = "service_name"
					case surchargePerBadStanding = "surcharge_per_bad_standing"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public var coordinates: Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk.GetCorporationsCorporationIDOutpostsOutpostIDCoordinates
			public var dockingCostPerShipVolume: Float
			public var officeRentalCost: Int64
			public var ownerID: Int
			public var reprocessingEfficiency: Float
			public var reprocessingStationTake: Float
			public var services: [Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk.GetCorporationsCorporationIDOutpostsOutpostIDServices]
			public var standingOwnerID: Int
			public var systemID: Int
			public var typeID: Int
			
			public init(coordinates: Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk.GetCorporationsCorporationIDOutpostsOutpostIDCoordinates, dockingCostPerShipVolume: Float, officeRentalCost: Int64, ownerID: Int, reprocessingEfficiency: Float, reprocessingStationTake: Float, services: [Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk.GetCorporationsCorporationIDOutpostsOutpostIDServices], standingOwnerID: Int, systemID: Int, typeID: Int) {
				self.coordinates = coordinates
				self.dockingCostPerShipVolume = dockingCostPerShipVolume
				self.officeRentalCost = officeRentalCost
				self.ownerID = ownerID
				self.reprocessingEfficiency = reprocessingEfficiency
				self.reprocessingStationTake = reprocessingStationTake
				self.services = services
				self.standingOwnerID = standingOwnerID
				self.systemID = systemID
				self.typeID = typeID
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: coordinates.hashValue)
				hashCombine(seed: &hash, value: dockingCostPerShipVolume.hashValue)
				hashCombine(seed: &hash, value: officeRentalCost.hashValue)
				hashCombine(seed: &hash, value: ownerID.hashValue)
				hashCombine(seed: &hash, value: reprocessingEfficiency.hashValue)
				hashCombine(seed: &hash, value: reprocessingStationTake.hashValue)
				self.services.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: standingOwnerID.hashValue)
				hashCombine(seed: &hash, value: systemID.hashValue)
				hashCombine(seed: &hash, value: typeID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk, rhs: Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case coordinates
				case dockingCostPerShipVolume = "docking_cost_per_ship_volume"
				case officeRentalCost = "office_rental_cost"
				case ownerID = "owner_id"
				case reprocessingEfficiency = "reprocessing_efficiency"
				case reprocessingStationTake = "reprocessing_station_take"
				case services
				case standingOwnerID = "standing_owner_id"
				case systemID = "system_id"
				case typeID = "type_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCorporationsCorporationIDMedalsIssuedOk: Codable, Hashable {
			
			public enum GetCorporationsCorporationIDMedalsIssuedStatus: String, Codable, HTTPQueryable {
				case `private` = "private"
				case `public` = "public"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var characterID: Int
			public var issuedAt: Date
			public var issuerID: Int
			public var medalID: Int
			public var reason: String
			public var status: Corporation.GetCorporationsCorporationIDMedalsIssuedOk.GetCorporationsCorporationIDMedalsIssuedStatus
			
			public init(characterID: Int, issuedAt: Date, issuerID: Int, medalID: Int, reason: String, status: Corporation.GetCorporationsCorporationIDMedalsIssuedOk.GetCorporationsCorporationIDMedalsIssuedStatus) {
				self.characterID = characterID
				self.issuedAt = issuedAt
				self.issuerID = issuerID
				self.medalID = medalID
				self.reason = reason
				self.status = status
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: characterID.hashValue)
				hashCombine(seed: &hash, value: issuedAt.hashValue)
				hashCombine(seed: &hash, value: issuerID.hashValue)
				hashCombine(seed: &hash, value: medalID.hashValue)
				hashCombine(seed: &hash, value: reason.hashValue)
				hashCombine(seed: &hash, value: status.hashValue)
				return hash
			}
			
			public static func ==(lhs: Corporation.GetCorporationsCorporationIDMedalsIssuedOk, rhs: Corporation.GetCorporationsCorporationIDMedalsIssuedOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case characterID = "character_id"
				case issuedAt = "issued_at"
				case issuerID = "issuer_id"
				case medalID = "medal_id"
				case reason
				case status
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .issuedAt: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCorporationsCorporationIDContainersLogsOk: Codable, Hashable {
			
			public enum GetCorporationsCorporationIDContainersLogsLocationFlag: String, Codable, HTTPQueryable {
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
				case hiddenModifiers = "HiddenModifiers"
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
				case subSystemBay = "SubSystemBay"
				case subSystemSlot0 = "SubSystemSlot0"
				case subSystemSlot1 = "SubSystemSlot1"
				case subSystemSlot2 = "SubSystemSlot2"
				case subSystemSlot3 = "SubSystemSlot3"
				case subSystemSlot4 = "SubSystemSlot4"
				case subSystemSlot5 = "SubSystemSlot5"
				case subSystemSlot6 = "SubSystemSlot6"
				case subSystemSlot7 = "SubSystemSlot7"
				case unlocked = "Unlocked"
				case wallet = "Wallet"
				case wardrobe = "Wardrobe"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDContainersLogsAction: String, Codable, HTTPQueryable {
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
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDContainersLogsPasswordType: String, Codable, HTTPQueryable {
				case config = "config"
				case general = "general"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var action: Corporation.GetCorporationsCorporationIDContainersLogsOk.GetCorporationsCorporationIDContainersLogsAction
			public var characterID: Int
			public var containerID: Int64
			public var containerTypeID: Int
			public var locationFlag: Corporation.GetCorporationsCorporationIDContainersLogsOk.GetCorporationsCorporationIDContainersLogsLocationFlag
			public var locationID: Int64
			public var loggedAt: Date
			public var newConfigBitmask: Int?
			public var oldConfigBitmask: Int?
			public var passwordType: Corporation.GetCorporationsCorporationIDContainersLogsOk.GetCorporationsCorporationIDContainersLogsPasswordType?
			public var quantity: Int?
			public var typeID: Int?
			
			public init(action: Corporation.GetCorporationsCorporationIDContainersLogsOk.GetCorporationsCorporationIDContainersLogsAction, characterID: Int, containerID: Int64, containerTypeID: Int, locationFlag: Corporation.GetCorporationsCorporationIDContainersLogsOk.GetCorporationsCorporationIDContainersLogsLocationFlag, locationID: Int64, loggedAt: Date, newConfigBitmask: Int?, oldConfigBitmask: Int?, passwordType: Corporation.GetCorporationsCorporationIDContainersLogsOk.GetCorporationsCorporationIDContainersLogsPasswordType?, quantity: Int?, typeID: Int?) {
				self.action = action
				self.characterID = characterID
				self.containerID = containerID
				self.containerTypeID = containerTypeID
				self.locationFlag = locationFlag
				self.locationID = locationID
				self.loggedAt = loggedAt
				self.newConfigBitmask = newConfigBitmask
				self.oldConfigBitmask = oldConfigBitmask
				self.passwordType = passwordType
				self.quantity = quantity
				self.typeID = typeID
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: action.hashValue)
				hashCombine(seed: &hash, value: characterID.hashValue)
				hashCombine(seed: &hash, value: containerID.hashValue)
				hashCombine(seed: &hash, value: containerTypeID.hashValue)
				hashCombine(seed: &hash, value: locationFlag.hashValue)
				hashCombine(seed: &hash, value: locationID.hashValue)
				hashCombine(seed: &hash, value: loggedAt.hashValue)
				hashCombine(seed: &hash, value: newConfigBitmask?.hashValue ?? 0)
				hashCombine(seed: &hash, value: oldConfigBitmask?.hashValue ?? 0)
				hashCombine(seed: &hash, value: passwordType?.hashValue ?? 0)
				hashCombine(seed: &hash, value: quantity?.hashValue ?? 0)
				hashCombine(seed: &hash, value: typeID?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Corporation.GetCorporationsCorporationIDContainersLogsOk, rhs: Corporation.GetCorporationsCorporationIDContainersLogsOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case action
				case characterID = "character_id"
				case containerID = "container_id"
				case containerTypeID = "container_type_id"
				case locationFlag = "location_flag"
				case locationID = "location_id"
				case loggedAt = "logged_at"
				case newConfigBitmask = "new_config_bitmask"
				case oldConfigBitmask = "old_config_bitmask"
				case passwordType = "password_type"
				case quantity
				case typeID = "type_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .loggedAt: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct Information: Codable, Hashable {
			
			
			public var allianceID: Int?
			public var ceoID: Int
			public var creatorID: Int
			public var dateFounded: Date?
			public var localizedDescription: String?
			public var factionID: Int?
			public var homeStationID: Int?
			public var memberCount: Int
			public var name: String
			public var shares: Int64?
			public var taxRate: Float
			public var ticker: String
			public var url: String?
			
			public init(allianceID: Int?, ceoID: Int, creatorID: Int, dateFounded: Date?, localizedDescription: String?, factionID: Int?, homeStationID: Int?, memberCount: Int, name: String, shares: Int64?, taxRate: Float, ticker: String, url: String?) {
				self.allianceID = allianceID
				self.ceoID = ceoID
				self.creatorID = creatorID
				self.dateFounded = dateFounded
				self.localizedDescription = localizedDescription
				self.factionID = factionID
				self.homeStationID = homeStationID
				self.memberCount = memberCount
				self.name = name
				self.shares = shares
				self.taxRate = taxRate
				self.ticker = ticker
				self.url = url
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: allianceID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: ceoID.hashValue)
				hashCombine(seed: &hash, value: creatorID.hashValue)
				hashCombine(seed: &hash, value: dateFounded?.hashValue ?? 0)
				hashCombine(seed: &hash, value: localizedDescription?.hashValue ?? 0)
				hashCombine(seed: &hash, value: factionID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: homeStationID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: memberCount.hashValue)
				hashCombine(seed: &hash, value: name.hashValue)
				hashCombine(seed: &hash, value: shares?.hashValue ?? 0)
				hashCombine(seed: &hash, value: taxRate.hashValue)
				hashCombine(seed: &hash, value: ticker.hashValue)
				hashCombine(seed: &hash, value: url?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Corporation.Information, rhs: Corporation.Information) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case allianceID = "alliance_id"
				case ceoID = "ceo_id"
				case creatorID = "creator_id"
				case dateFounded = "date_founded"
				case localizedDescription = "description"
				case factionID = "faction_id"
				case homeStationID = "home_station_id"
				case memberCount = "member_count"
				case name
				case shares
				case taxRate = "tax_rate"
				case ticker
				case url
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .dateFounded: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct Divisions: Codable, Hashable {
			
			public struct Wallet: Codable, Hashable {
				
				
				public var division: Int?
				public var name: String?
				
				public init(division: Int?, name: String?) {
					self.division = division
					self.name = name
				}
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: division?.hashValue ?? 0)
					hashCombine(seed: &hash, value: name?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: Corporation.Divisions.Wallet, rhs: Corporation.Divisions.Wallet) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case division
					case name
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct Hangar: Codable, Hashable {
				
				
				public var division: Int?
				public var name: String?
				
				public init(division: Int?, name: String?) {
					self.division = division
					self.name = name
				}
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: division?.hashValue ?? 0)
					hashCombine(seed: &hash, value: name?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: Corporation.Divisions.Hangar, rhs: Corporation.Divisions.Hangar) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case division
					case name
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public var hangar: [Corporation.Divisions.Hangar]?
			public var wallet: [Corporation.Divisions.Wallet]?
			
			public init(hangar: [Corporation.Divisions.Hangar]?, wallet: [Corporation.Divisions.Wallet]?) {
				self.hangar = hangar
				self.wallet = wallet
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				self.hangar?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.wallet?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}
			
			public static func ==(lhs: Corporation.Divisions, rhs: Corporation.Divisions) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case hangar
				case wallet
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCorporationsCorporationIDShareholdersOk: Codable, Hashable {
			
			public enum GetCorporationsCorporationIDShareholdersShareholderType: String, Codable, HTTPQueryable {
				case character = "character"
				case corporation = "corporation"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var shareCount: Int64
			public var shareholderID: Int
			public var shareholderType: Corporation.GetCorporationsCorporationIDShareholdersOk.GetCorporationsCorporationIDShareholdersShareholderType
			
			public init(shareCount: Int64, shareholderID: Int, shareholderType: Corporation.GetCorporationsCorporationIDShareholdersOk.GetCorporationsCorporationIDShareholdersShareholderType) {
				self.shareCount = shareCount
				self.shareholderID = shareholderID
				self.shareholderType = shareholderType
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: shareCount.hashValue)
				hashCombine(seed: &hash, value: shareholderID.hashValue)
				hashCombine(seed: &hash, value: shareholderType.hashValue)
				return hash
			}
			
			public static func ==(lhs: Corporation.GetCorporationsCorporationIDShareholdersOk, rhs: Corporation.GetCorporationsCorporationIDShareholdersOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case shareCount = "share_count"
				case shareholderID = "shareholder_id"
				case shareholderType = "shareholder_type"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCorporationsCorporationIDMembersTitlesOk: Codable, Hashable {
			
			
			public var characterID: Int
			public var titles: [Int]
			
			public init(characterID: Int, titles: [Int]) {
				self.characterID = characterID
				self.titles = titles
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: characterID.hashValue)
				self.titles.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}
			
			public static func ==(lhs: Corporation.GetCorporationsCorporationIDMembersTitlesOk, rhs: Corporation.GetCorporationsCorporationIDMembersTitlesOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case characterID = "character_id"
				case titles
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCorporationsCorporationIDIconsNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Corporation.GetCorporationsCorporationIDIconsNotFound, rhs: Corporation.GetCorporationsCorporationIDIconsNotFound) -> Bool {
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
		
		
		public struct Name: Codable, Hashable {
			
			
			public var corporationID: Int
			public var corporationName: String
			
			public init(corporationID: Int, corporationName: String) {
				self.corporationID = corporationID
				self.corporationName = corporationName
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: corporationID.hashValue)
				hashCombine(seed: &hash, value: corporationName.hashValue)
				return hash
			}
			
			public static func ==(lhs: Corporation.Name, rhs: Corporation.Name) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case corporationID = "corporation_id"
				case corporationName = "corporation_name"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct History: Codable, Hashable {
			
			
			public var allianceID: Int?
			public var isDeleted: Bool?
			public var recordID: Int
			public var startDate: Date
			
			public init(allianceID: Int?, isDeleted: Bool?, recordID: Int, startDate: Date) {
				self.allianceID = allianceID
				self.isDeleted = isDeleted
				self.recordID = recordID
				self.startDate = startDate
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: allianceID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: isDeleted?.hashValue ?? 0)
				hashCombine(seed: &hash, value: recordID.hashValue)
				hashCombine(seed: &hash, value: startDate.hashValue)
				return hash
			}
			
			public static func ==(lhs: Corporation.History, rhs: Corporation.History) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case allianceID = "alliance_id"
				case isDeleted = "is_deleted"
				case recordID = "record_id"
				case startDate = "start_date"
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .startDate: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCorporationsCorporationIDFacilitiesOk: Codable, Hashable {
			
			
			public var facilityID: Int64
			public var systemID: Int
			public var typeID: Int
			
			public init(facilityID: Int64, systemID: Int, typeID: Int) {
				self.facilityID = facilityID
				self.systemID = systemID
				self.typeID = typeID
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: facilityID.hashValue)
				hashCombine(seed: &hash, value: systemID.hashValue)
				hashCombine(seed: &hash, value: typeID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Corporation.GetCorporationsCorporationIDFacilitiesOk, rhs: Corporation.GetCorporationsCorporationIDFacilitiesOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case facilityID = "facility_id"
				case systemID = "system_id"
				case typeID = "type_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct Role: Codable, Hashable {
			
			public enum GetCorporationsCorporationIDRolesRolesAtHq: String, Codable, HTTPQueryable {
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
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDRolesGrantableRolesAtHq: String, Codable, HTTPQueryable {
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
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDRolesGrantableRolesAtBase: String, Codable, HTTPQueryable {
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
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDRolesRoles: String, Codable, HTTPQueryable {
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
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDRolesRolesAtOther: String, Codable, HTTPQueryable {
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
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDRolesGrantableRolesAtOther: String, Codable, HTTPQueryable {
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
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDRolesGrantableRoles: String, Codable, HTTPQueryable {
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
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDRolesRolesAtBase: String, Codable, HTTPQueryable {
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
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var characterID: Int
			public var grantableRoles: [Corporation.Role.GetCorporationsCorporationIDRolesGrantableRoles]?
			public var grantableRolesAtBase: [Corporation.Role.GetCorporationsCorporationIDRolesGrantableRolesAtBase]?
			public var grantableRolesAtHq: [Corporation.Role.GetCorporationsCorporationIDRolesGrantableRolesAtHq]?
			public var grantableRolesAtOther: [Corporation.Role.GetCorporationsCorporationIDRolesGrantableRolesAtOther]?
			public var roles: [Corporation.Role.GetCorporationsCorporationIDRolesRoles]?
			public var rolesAtBase: [Corporation.Role.GetCorporationsCorporationIDRolesRolesAtBase]?
			public var rolesAtHq: [Corporation.Role.GetCorporationsCorporationIDRolesRolesAtHq]?
			public var rolesAtOther: [Corporation.Role.GetCorporationsCorporationIDRolesRolesAtOther]?
			
			public init(characterID: Int, grantableRoles: [Corporation.Role.GetCorporationsCorporationIDRolesGrantableRoles]?, grantableRolesAtBase: [Corporation.Role.GetCorporationsCorporationIDRolesGrantableRolesAtBase]?, grantableRolesAtHq: [Corporation.Role.GetCorporationsCorporationIDRolesGrantableRolesAtHq]?, grantableRolesAtOther: [Corporation.Role.GetCorporationsCorporationIDRolesGrantableRolesAtOther]?, roles: [Corporation.Role.GetCorporationsCorporationIDRolesRoles]?, rolesAtBase: [Corporation.Role.GetCorporationsCorporationIDRolesRolesAtBase]?, rolesAtHq: [Corporation.Role.GetCorporationsCorporationIDRolesRolesAtHq]?, rolesAtOther: [Corporation.Role.GetCorporationsCorporationIDRolesRolesAtOther]?) {
				self.characterID = characterID
				self.grantableRoles = grantableRoles
				self.grantableRolesAtBase = grantableRolesAtBase
				self.grantableRolesAtHq = grantableRolesAtHq
				self.grantableRolesAtOther = grantableRolesAtOther
				self.roles = roles
				self.rolesAtBase = rolesAtBase
				self.rolesAtHq = rolesAtHq
				self.rolesAtOther = rolesAtOther
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: characterID.hashValue)
				self.grantableRoles?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.grantableRolesAtBase?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.grantableRolesAtHq?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.grantableRolesAtOther?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.roles?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.rolesAtBase?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.rolesAtHq?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.rolesAtOther?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}
			
			public static func ==(lhs: Corporation.Role, rhs: Corporation.Role) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case characterID = "character_id"
				case grantableRoles = "grantable_roles"
				case grantableRolesAtBase = "grantable_roles_at_base"
				case grantableRolesAtHq = "grantable_roles_at_hq"
				case grantableRolesAtOther = "grantable_roles_at_other"
				case roles
				case rolesAtBase = "roles_at_base"
				case rolesAtHq = "roles_at_hq"
				case rolesAtOther = "roles_at_other"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCorporationsCorporationIDMedalsOk: Codable, Hashable {
			
			
			public var createdAt: Date
			public var creatorID: Int
			public var localizedDescription: String
			public var medalID: Int
			public var title: String
			
			public init(createdAt: Date, creatorID: Int, localizedDescription: String, medalID: Int, title: String) {
				self.createdAt = createdAt
				self.creatorID = creatorID
				self.localizedDescription = localizedDescription
				self.medalID = medalID
				self.title = title
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: createdAt.hashValue)
				hashCombine(seed: &hash, value: creatorID.hashValue)
				hashCombine(seed: &hash, value: localizedDescription.hashValue)
				hashCombine(seed: &hash, value: medalID.hashValue)
				hashCombine(seed: &hash, value: title.hashValue)
				return hash
			}
			
			public static func ==(lhs: Corporation.GetCorporationsCorporationIDMedalsOk, rhs: Corporation.GetCorporationsCorporationIDMedalsOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case createdAt = "created_at"
				case creatorID = "creator_id"
				case localizedDescription = "description"
				case medalID = "medal_id"
				case title
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .createdAt: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCorporationsCorporationIDBlueprintsOk: Codable, Hashable {
			
			public enum GetCorporationsCorporationIDBlueprintsLocationFlag: String, Codable, HTTPQueryable {
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
				case hiddenModifiers = "HiddenModifiers"
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
				case subSystemBay = "SubSystemBay"
				case subSystemSlot0 = "SubSystemSlot0"
				case subSystemSlot1 = "SubSystemSlot1"
				case subSystemSlot2 = "SubSystemSlot2"
				case subSystemSlot3 = "SubSystemSlot3"
				case subSystemSlot4 = "SubSystemSlot4"
				case subSystemSlot5 = "SubSystemSlot5"
				case subSystemSlot6 = "SubSystemSlot6"
				case subSystemSlot7 = "SubSystemSlot7"
				case unlocked = "Unlocked"
				case wallet = "Wallet"
				case wardrobe = "Wardrobe"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var itemID: Int64
			public var locationFlag: Corporation.GetCorporationsCorporationIDBlueprintsOk.GetCorporationsCorporationIDBlueprintsLocationFlag
			public var locationID: Int64
			public var materialEfficiency: Int
			public var quantity: Int
			public var runs: Int
			public var timeEfficiency: Int
			public var typeID: Int
			
			public init(itemID: Int64, locationFlag: Corporation.GetCorporationsCorporationIDBlueprintsOk.GetCorporationsCorporationIDBlueprintsLocationFlag, locationID: Int64, materialEfficiency: Int, quantity: Int, runs: Int, timeEfficiency: Int, typeID: Int) {
				self.itemID = itemID
				self.locationFlag = locationFlag
				self.locationID = locationID
				self.materialEfficiency = materialEfficiency
				self.quantity = quantity
				self.runs = runs
				self.timeEfficiency = timeEfficiency
				self.typeID = typeID
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: itemID.hashValue)
				hashCombine(seed: &hash, value: locationFlag.hashValue)
				hashCombine(seed: &hash, value: locationID.hashValue)
				hashCombine(seed: &hash, value: materialEfficiency.hashValue)
				hashCombine(seed: &hash, value: quantity.hashValue)
				hashCombine(seed: &hash, value: runs.hashValue)
				hashCombine(seed: &hash, value: timeEfficiency.hashValue)
				hashCombine(seed: &hash, value: typeID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Corporation.GetCorporationsCorporationIDBlueprintsOk, rhs: Corporation.GetCorporationsCorporationIDBlueprintsOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case itemID = "item_id"
				case locationFlag = "location_flag"
				case locationID = "location_id"
				case materialEfficiency = "material_efficiency"
				case quantity
				case runs
				case timeEfficiency = "time_efficiency"
				case typeID = "type_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct Structure: Codable, Hashable {
			
			public struct GetCorporationsCorporationIDStructuresServices: Codable, Hashable {
				
				public enum GetCorporationsCorporationIDStructuresServiceState: String, Codable, HTTPQueryable {
					case cleanup = "cleanup"
					case offline = "offline"
					case online = "online"
					
					public var httpQuery: String? {
						return rawValue
					}
					
				}
				
				public var name: String
				public var state: Corporation.Structure.GetCorporationsCorporationIDStructuresServices.GetCorporationsCorporationIDStructuresServiceState
				
				public init(name: String, state: Corporation.Structure.GetCorporationsCorporationIDStructuresServices.GetCorporationsCorporationIDStructuresServiceState) {
					self.name = name
					self.state = state
				}
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: name.hashValue)
					hashCombine(seed: &hash, value: state.hashValue)
					return hash
				}
				
				public static func ==(lhs: Corporation.Structure.GetCorporationsCorporationIDStructuresServices, rhs: Corporation.Structure.GetCorporationsCorporationIDStructuresServices) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case name
					case state
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public enum GetCorporationsCorporationIDStructuresState: String, Codable, HTTPQueryable {
				case anchorVulnerable = "anchor_vulnerable"
				case anchoring = "anchoring"
				case armorReinforce = "armor_reinforce"
				case armorVulnerable = "armor_vulnerable"
				case fittingInvulnerable = "fitting_invulnerable"
				case hullReinforce = "hull_reinforce"
				case hullVulnerable = "hull_vulnerable"
				case onlineDeprecated = "online_deprecated"
				case onliningVulnerable = "onlining_vulnerable"
				case shieldVulnerable = "shield_vulnerable"
				case unanchored = "unanchored"
				case unknown = "unknown"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var corporationID: Int
			public var fuelExpires: Date?
			public var nextReinforceApply: Date?
			public var nextReinforceHour: Int?
			public var nextReinforceWeekday: Int?
			public var profileID: Int
			public var reinforceHour: Int
			public var reinforceWeekday: Int
			public var services: [Corporation.Structure.GetCorporationsCorporationIDStructuresServices]?
			public var state: Corporation.Structure.GetCorporationsCorporationIDStructuresState
			public var stateTimerEnd: Date?
			public var stateTimerStart: Date?
			public var structureID: Int64
			public var systemID: Int
			public var typeID: Int
			public var unanchorsAt: Date?
			
			public init(corporationID: Int, fuelExpires: Date?, nextReinforceApply: Date?, nextReinforceHour: Int?, nextReinforceWeekday: Int?, profileID: Int, reinforceHour: Int, reinforceWeekday: Int, services: [Corporation.Structure.GetCorporationsCorporationIDStructuresServices]?, state: Corporation.Structure.GetCorporationsCorporationIDStructuresState, stateTimerEnd: Date?, stateTimerStart: Date?, structureID: Int64, systemID: Int, typeID: Int, unanchorsAt: Date?) {
				self.corporationID = corporationID
				self.fuelExpires = fuelExpires
				self.nextReinforceApply = nextReinforceApply
				self.nextReinforceHour = nextReinforceHour
				self.nextReinforceWeekday = nextReinforceWeekday
				self.profileID = profileID
				self.reinforceHour = reinforceHour
				self.reinforceWeekday = reinforceWeekday
				self.services = services
				self.state = state
				self.stateTimerEnd = stateTimerEnd
				self.stateTimerStart = stateTimerStart
				self.structureID = structureID
				self.systemID = systemID
				self.typeID = typeID
				self.unanchorsAt = unanchorsAt
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: corporationID.hashValue)
				hashCombine(seed: &hash, value: fuelExpires?.hashValue ?? 0)
				hashCombine(seed: &hash, value: nextReinforceApply?.hashValue ?? 0)
				hashCombine(seed: &hash, value: nextReinforceHour?.hashValue ?? 0)
				hashCombine(seed: &hash, value: nextReinforceWeekday?.hashValue ?? 0)
				hashCombine(seed: &hash, value: profileID.hashValue)
				hashCombine(seed: &hash, value: reinforceHour.hashValue)
				hashCombine(seed: &hash, value: reinforceWeekday.hashValue)
				self.services?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: state.hashValue)
				hashCombine(seed: &hash, value: stateTimerEnd?.hashValue ?? 0)
				hashCombine(seed: &hash, value: stateTimerStart?.hashValue ?? 0)
				hashCombine(seed: &hash, value: structureID.hashValue)
				hashCombine(seed: &hash, value: systemID.hashValue)
				hashCombine(seed: &hash, value: typeID.hashValue)
				hashCombine(seed: &hash, value: unanchorsAt?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Corporation.Structure, rhs: Corporation.Structure) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case corporationID = "corporation_id"
				case fuelExpires = "fuel_expires"
				case nextReinforceApply = "next_reinforce_apply"
				case nextReinforceHour = "next_reinforce_hour"
				case nextReinforceWeekday = "next_reinforce_weekday"
				case profileID = "profile_id"
				case reinforceHour = "reinforce_hour"
				case reinforceWeekday = "reinforce_weekday"
				case services
				case state
				case stateTimerEnd = "state_timer_end"
				case stateTimerStart = "state_timer_start"
				case structureID = "structure_id"
				case systemID = "system_id"
				case typeID = "type_id"
				case unanchorsAt = "unanchors_at"
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .fuelExpires: return DateFormatter.esiDateTimeFormatter
						case .nextReinforceApply: return DateFormatter.esiDateTimeFormatter
						case .stateTimerEnd: return DateFormatter.esiDateTimeFormatter
						case .stateTimerStart: return DateFormatter.esiDateTimeFormatter
						case .unanchorsAt: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCorporationsCorporationIDStarbasesOk: Codable, Hashable {
			
			public enum GetCorporationsCorporationIDStarbasesState: String, Codable, HTTPQueryable {
				case offline = "offline"
				case online = "online"
				case onlining = "onlining"
				case reinforced = "reinforced"
				case unanchoring = "unanchoring"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var moonID: Int?
			public var onlinedSince: Date?
			public var reinforcedUntil: Date?
			public var starbaseID: Int64
			public var state: Corporation.GetCorporationsCorporationIDStarbasesOk.GetCorporationsCorporationIDStarbasesState?
			public var systemID: Int
			public var typeID: Int
			public var unanchorAt: Date?
			
			public init(moonID: Int?, onlinedSince: Date?, reinforcedUntil: Date?, starbaseID: Int64, state: Corporation.GetCorporationsCorporationIDStarbasesOk.GetCorporationsCorporationIDStarbasesState?, systemID: Int, typeID: Int, unanchorAt: Date?) {
				self.moonID = moonID
				self.onlinedSince = onlinedSince
				self.reinforcedUntil = reinforcedUntil
				self.starbaseID = starbaseID
				self.state = state
				self.systemID = systemID
				self.typeID = typeID
				self.unanchorAt = unanchorAt
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: moonID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: onlinedSince?.hashValue ?? 0)
				hashCombine(seed: &hash, value: reinforcedUntil?.hashValue ?? 0)
				hashCombine(seed: &hash, value: starbaseID.hashValue)
				hashCombine(seed: &hash, value: state?.hashValue ?? 0)
				hashCombine(seed: &hash, value: systemID.hashValue)
				hashCombine(seed: &hash, value: typeID.hashValue)
				hashCombine(seed: &hash, value: unanchorAt?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Corporation.GetCorporationsCorporationIDStarbasesOk, rhs: Corporation.GetCorporationsCorporationIDStarbasesOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case moonID = "moon_id"
				case onlinedSince = "onlined_since"
				case reinforcedUntil = "reinforced_until"
				case starbaseID = "starbase_id"
				case state
				case systemID = "system_id"
				case typeID = "type_id"
				case unanchorAt = "unanchor_at"
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .onlinedSince: return DateFormatter.esiDateTimeFormatter
						case .reinforcedUntil: return DateFormatter.esiDateTimeFormatter
						case .unanchorAt: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
	}
	
}
