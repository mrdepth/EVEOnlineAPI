import Foundation
import Alamofire


public extension ESI {
	public var universe: Universe {
		return Universe(sessionManager: self)
	}
	
	class Universe {
		weak var sessionManager: ESI?
		
		init(sessionManager: ESI) {
			self.sessionManager = sessionManager
		}
		
		public func getRegionInformation(language: Language? = nil, regionID: Int, completionBlock:((Result<Universe.RegionInformation>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = language?.httpQuery {
				query.append(URLQueryItem(name: "language", value: v))
			}
			
			let url = session!.baseURL + "/v1/universe/regions/\(regionID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Universe.RegionInformation>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getItemGroups(page: Int? = nil, completionBlock:((Result<[Int]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v1/universe/groups/"
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
		
		public func getSystemKills(completionBlock:((Result<[Universe.SystemKills]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v2/universe/system_kills/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Universe.SystemKills]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getRegions(completionBlock:((Result<[Int]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/universe/regions/"
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
		
		public func getConstellationInformation(constellationID: Int, language: Language? = nil, completionBlock:((Result<Universe.ConstellationInformation>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = language?.httpQuery {
				query.append(URLQueryItem(name: "language", value: v))
			}
			
			let url = session!.baseURL + "/v1/universe/constellations/\(constellationID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Universe.ConstellationInformation>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getStarInformation(starID: Int, completionBlock:((Result<Universe.GetUniverseStarsStarIDOk>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/universe/stars/\(starID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Universe.GetUniverseStarsStarIDOk>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getGraphicInformation(graphicID: Int, completionBlock:((Result<Universe.GraphicInformation>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/universe/graphics/\(graphicID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Universe.GraphicInformation>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getItemGroupInformation(groupID: Int, language: Language? = nil, completionBlock:((Result<Universe.ItemGroupInformation>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = language?.httpQuery {
				query.append(URLQueryItem(name: "language", value: v))
			}
			
			let url = session!.baseURL + "/v1/universe/groups/\(groupID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Universe.ItemGroupInformation>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getItemCategoryInformation(categoryID: Int, language: Language? = nil, completionBlock:((Result<Universe.ItemCategoryInformation>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = language?.httpQuery {
				query.append(URLQueryItem(name: "language", value: v))
			}
			
			let url = session!.baseURL + "/v1/universe/categories/\(categoryID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Universe.ItemCategoryInformation>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getSolarSystemInformation(language: Language? = nil, systemID: Int, completionBlock:((Result<Universe.SolarSystemInformation>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = language?.httpQuery {
				query.append(URLQueryItem(name: "language", value: v))
			}
			
			let url = session!.baseURL + "/v3/universe/systems/\(systemID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Universe.SolarSystemInformation>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getStargateInformation(stargateID: Int, completionBlock:((Result<Universe.StargateInformation>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/universe/stargates/\(stargateID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Universe.StargateInformation>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getGraphics(completionBlock:((Result<[Int]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/universe/graphics/"
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
		
		public func getConstellations(completionBlock:((Result<[Int]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/universe/constellations/"
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
		
		public func getCharacterRaces(language: Language? = nil, completionBlock:((Result<[Universe.Race]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = language?.httpQuery {
				query.append(URLQueryItem(name: "language", value: v))
			}
			
			let url = session!.baseURL + "/v1/universe/races/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Universe.Race]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getMoonInformation(moonID: Int, completionBlock:((Result<Universe.MoonInformation>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/universe/moons/\(moonID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Universe.MoonInformation>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getFactions(language: Language? = nil, completionBlock:((Result<[Universe.Faction]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = language?.httpQuery {
				query.append(URLQueryItem(name: "language", value: v))
			}
			
			let url = session!.baseURL + "/v2/universe/factions/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Universe.Faction]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getTypes(page: Int? = nil, completionBlock:((Result<[Int]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = session!.baseURL + "/v1/universe/types/"
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
		
		public func getTypeInformation(language: Language? = nil, typeID: Int, completionBlock:((Result<Universe.TypeInformation>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = language?.httpQuery {
				query.append(URLQueryItem(name: "language", value: v))
			}
			
			let url = session!.baseURL + "/v3/universe/types/\(typeID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Universe.TypeInformation>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func listAllPublicStructures(completionBlock:((Result<[Int64]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/universe/structures/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Int64]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getNamesAndCategoriesForSetOfIDs(ids: [Int], completionBlock:((Result<[Universe.Name]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body = try? JSONEncoder().encode(ids)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v2/universe/names/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Universe.Name]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getSolarSystems(completionBlock:((Result<[Int]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/universe/systems/"
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
		
		public func getPlanetInformation(planetID: Int, completionBlock:((Result<Universe.PlanetInformation>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/universe/planets/\(planetID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Universe.PlanetInformation>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getStructureInformation(structureID: Int64, completionBlock:((Result<Universe.StructureInformation>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-universe.read_structures.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/universe/structures/\(structureID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Universe.StructureInformation>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getSystemJumps(completionBlock:((Result<[Universe.Jump]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/universe/system_jumps/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Universe.Jump]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getItemCategories(completionBlock:((Result<[Int]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v1/universe/categories/"
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
		
		public func getStationInformation(stationID: Int, completionBlock:((Result<Universe.StationInformation>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "/v2/universe/stations/\(stationID)/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Universe.StationInformation>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func getBloodlines(language: Language? = nil, completionBlock:((Result<[Universe.Bloodline]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = language?.httpQuery {
				query.append(URLQueryItem(name: "language", value: v))
			}
			
			let url = session!.baseURL + "/v1/universe/bloodlines/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<[Universe.Bloodline]>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func bulkNamesToIDs(language: Language? = nil, names: [String], completionBlock:((Result<Universe.PostUniverseIdsOk>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body = try? JSONEncoder().encode(names)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			if let v = language?.httpQuery {
				query.append(URLQueryItem(name: "language", value: v))
			}
			
			let url = session!.baseURL + "/v1/universe/ids/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateESI().responseESI { (response: DataResponse<Universe.PostUniverseIdsOk>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		public struct SystemKills: Codable, Hashable {
			
			
			public let npcKills: Int
			public let podKills: Int
			public let shipKills: Int
			public let systemID: Int
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: npcKills.hashValue)
				hashCombine(seed: &hash, value: podKills.hashValue)
				hashCombine(seed: &hash, value: shipKills.hashValue)
				hashCombine(seed: &hash, value: systemID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Universe.SystemKills, rhs: Universe.SystemKills) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case npcKills = "npc_kills"
				case podKills = "pod_kills"
				case shipKills = "ship_kills"
				case systemID = "system_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct PostUniverseNamesNotFound: Codable, Hashable {
			
			
			public let error: String?
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Universe.PostUniverseNamesNotFound, rhs: Universe.PostUniverseNamesNotFound) -> Bool {
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
		
		
		public struct Bloodline: Codable, Hashable {
			
			
			public let bloodlineID: Int
			public let charisma: Int
			public let corporationID: Int
			public let localizedDescription: String
			public let intelligence: Int
			public let memory: Int
			public let name: String
			public let perception: Int
			public let raceID: Int
			public let shipTypeID: Int
			public let willpower: Int
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: bloodlineID.hashValue)
				hashCombine(seed: &hash, value: charisma.hashValue)
				hashCombine(seed: &hash, value: corporationID.hashValue)
				hashCombine(seed: &hash, value: localizedDescription.hashValue)
				hashCombine(seed: &hash, value: intelligence.hashValue)
				hashCombine(seed: &hash, value: memory.hashValue)
				hashCombine(seed: &hash, value: name.hashValue)
				hashCombine(seed: &hash, value: perception.hashValue)
				hashCombine(seed: &hash, value: raceID.hashValue)
				hashCombine(seed: &hash, value: shipTypeID.hashValue)
				hashCombine(seed: &hash, value: willpower.hashValue)
				return hash
			}
			
			public static func ==(lhs: Universe.Bloodline, rhs: Universe.Bloodline) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case bloodlineID = "bloodline_id"
				case charisma
				case corporationID = "corporation_id"
				case localizedDescription = "description"
				case intelligence
				case memory
				case name
				case perception
				case raceID = "race_id"
				case shipTypeID = "ship_type_id"
				case willpower
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct Race: Codable, Hashable {
			
			
			public let allianceID: Int
			public let localizedDescription: String
			public let name: String
			public let raceID: Int
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: allianceID.hashValue)
				hashCombine(seed: &hash, value: localizedDescription.hashValue)
				hashCombine(seed: &hash, value: name.hashValue)
				hashCombine(seed: &hash, value: raceID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Universe.Race, rhs: Universe.Race) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case allianceID = "alliance_id"
				case localizedDescription = "description"
				case name
				case raceID = "race_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetUniverseStructuresStructureIDNotFound: Codable, Hashable {
			
			
			public let error: String?
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Universe.GetUniverseStructuresStructureIDNotFound, rhs: Universe.GetUniverseStructuresStructureIDNotFound) -> Bool {
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
		
		
		public struct GetUniversePlanetsPlanetIDNotFound: Codable, Hashable {
			
			
			public let error: String?
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Universe.GetUniversePlanetsPlanetIDNotFound, rhs: Universe.GetUniversePlanetsPlanetIDNotFound) -> Bool {
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
		
		
		public struct GetUniverseTypesTypeIDNotFound: Codable, Hashable {
			
			
			public let error: String?
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Universe.GetUniverseTypesTypeIDNotFound, rhs: Universe.GetUniverseTypesTypeIDNotFound) -> Bool {
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
		
		
		public struct RegionInformation: Codable, Hashable {
			
			
			public let constellations: [Int]
			public let localizedDescription: String?
			public let name: String
			public let regionID: Int
			
			public var hashValue: Int {
				var hash: Int = 0
				self.constellations.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: localizedDescription?.hashValue ?? 0)
				hashCombine(seed: &hash, value: name.hashValue)
				hashCombine(seed: &hash, value: regionID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Universe.RegionInformation, rhs: Universe.RegionInformation) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case constellations
				case localizedDescription = "description"
				case name
				case regionID = "region_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct TypeInformation: Codable, Hashable {
			
			public struct GetUniverseTypesTypeIDDogmaEffects: Codable, Hashable {
				
				
				public let effectID: Int
				public let isDefault: Bool
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: effectID.hashValue)
					hashCombine(seed: &hash, value: isDefault.hashValue)
					return hash
				}
				
				public static func ==(lhs: Universe.TypeInformation.GetUniverseTypesTypeIDDogmaEffects, rhs: Universe.TypeInformation.GetUniverseTypesTypeIDDogmaEffects) -> Bool {
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
			
			public struct GetUniverseTypesTypeIDDogmaAttributes: Codable, Hashable {
				
				
				public let attributeID: Int
				public let value: Float
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: attributeID.hashValue)
					hashCombine(seed: &hash, value: value.hashValue)
					return hash
				}
				
				public static func ==(lhs: Universe.TypeInformation.GetUniverseTypesTypeIDDogmaAttributes, rhs: Universe.TypeInformation.GetUniverseTypesTypeIDDogmaAttributes) -> Bool {
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
			
			public let capacity: Float?
			public let localizedDescription: String
			public let dogmaAttributes: [Universe.TypeInformation.GetUniverseTypesTypeIDDogmaAttributes]?
			public let dogmaEffects: [Universe.TypeInformation.GetUniverseTypesTypeIDDogmaEffects]?
			public let graphicID: Int?
			public let groupID: Int
			public let iconID: Int?
			public let marketGroupID: Int?
			public let mass: Float?
			public let name: String
			public let packagedVolume: Float?
			public let portionSize: Int?
			public let published: Bool
			public let radius: Float?
			public let typeID: Int
			public let volume: Float?
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: capacity?.hashValue ?? 0)
				hashCombine(seed: &hash, value: localizedDescription.hashValue)
				self.dogmaAttributes?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.dogmaEffects?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: graphicID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: groupID.hashValue)
				hashCombine(seed: &hash, value: iconID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: marketGroupID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: mass?.hashValue ?? 0)
				hashCombine(seed: &hash, value: name.hashValue)
				hashCombine(seed: &hash, value: packagedVolume?.hashValue ?? 0)
				hashCombine(seed: &hash, value: portionSize?.hashValue ?? 0)
				hashCombine(seed: &hash, value: published.hashValue)
				hashCombine(seed: &hash, value: radius?.hashValue ?? 0)
				hashCombine(seed: &hash, value: typeID.hashValue)
				hashCombine(seed: &hash, value: volume?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Universe.TypeInformation, rhs: Universe.TypeInformation) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case capacity
				case localizedDescription = "description"
				case dogmaAttributes = "dogma_attributes"
				case dogmaEffects = "dogma_effects"
				case graphicID = "graphic_id"
				case groupID = "group_id"
				case iconID = "icon_id"
				case marketGroupID = "market_group_id"
				case mass
				case name
				case packagedVolume = "packaged_volume"
				case portionSize = "portion_size"
				case published
				case radius
				case typeID = "type_id"
				case volume
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct Name: Codable, Hashable {
			
			public enum Category: String, Codable, HTTPQueryable {
				case alliance = "alliance"
				case character = "character"
				case constellation = "constellation"
				case corporation = "corporation"
				case inventoryType = "inventory_type"
				case region = "region"
				case solarSystem = "solar_system"
				case station = "station"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public let category: Universe.Name.Category
			public let id: Int
			public let name: String
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: category.hashValue)
				hashCombine(seed: &hash, value: id.hashValue)
				hashCombine(seed: &hash, value: name.hashValue)
				return hash
			}
			
			public static func ==(lhs: Universe.Name, rhs: Universe.Name) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case category
				case id
				case name
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetUniverseStargatesStargateIDNotFound: Codable, Hashable {
			
			
			public let error: String?
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Universe.GetUniverseStargatesStargateIDNotFound, rhs: Universe.GetUniverseStargatesStargateIDNotFound) -> Bool {
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
		
		
		public struct GetUniverseStationsStationIDNotFound: Codable, Hashable {
			
			
			public let error: String?
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Universe.GetUniverseStationsStationIDNotFound, rhs: Universe.GetUniverseStationsStationIDNotFound) -> Bool {
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
		
		
		public struct StargateInformation: Codable, Hashable {
			
			public struct GetUniverseStargatesStargateIDPosition: Codable, Hashable {
				
				
				public let x: Double
				public let y: Double
				public let z: Double
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: x.hashValue)
					hashCombine(seed: &hash, value: y.hashValue)
					hashCombine(seed: &hash, value: z.hashValue)
					return hash
				}
				
				public static func ==(lhs: Universe.StargateInformation.GetUniverseStargatesStargateIDPosition, rhs: Universe.StargateInformation.GetUniverseStargatesStargateIDPosition) -> Bool {
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
			
			public struct GetUniverseStargatesStargateIDDestination: Codable, Hashable {
				
				
				public let stargateID: Int
				public let systemID: Int
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: stargateID.hashValue)
					hashCombine(seed: &hash, value: systemID.hashValue)
					return hash
				}
				
				public static func ==(lhs: Universe.StargateInformation.GetUniverseStargatesStargateIDDestination, rhs: Universe.StargateInformation.GetUniverseStargatesStargateIDDestination) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case stargateID = "stargate_id"
					case systemID = "system_id"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public let destination: Universe.StargateInformation.GetUniverseStargatesStargateIDDestination
			public let name: String
			public let position: Universe.StargateInformation.GetUniverseStargatesStargateIDPosition
			public let stargateID: Int
			public let systemID: Int
			public let typeID: Int
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: destination.hashValue)
				hashCombine(seed: &hash, value: name.hashValue)
				hashCombine(seed: &hash, value: position.hashValue)
				hashCombine(seed: &hash, value: stargateID.hashValue)
				hashCombine(seed: &hash, value: systemID.hashValue)
				hashCombine(seed: &hash, value: typeID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Universe.StargateInformation, rhs: Universe.StargateInformation) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case destination
				case name
				case position
				case stargateID = "stargate_id"
				case systemID = "system_id"
				case typeID = "type_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetUniverseStarsStarIDOk: Codable, Hashable {
			
			public enum GetUniverseStarsStarIDSpectralClass: String, Codable, HTTPQueryable {
				case a0 = "A0"
				case a0IV = "A0IV"
				case a0IV2 = "A0IV2"
				case f0IV = "F0 IV"
				case f0V = "F0 V"
				case f0VI = "F0 VI"
				case f1IV = "F1 IV"
				case f1V = "F1 V"
				case f1VI = "F1 VI"
				case f2IV = "F2 IV"
				case f2V = "F2 V"
				case f2VI = "F2 VI"
				case f3IV = "F3 IV"
				case f3V = "F3 V"
				case f3VI = "F3 VI"
				case f4IV = "F4 IV"
				case f4V = "F4 V"
				case f4VI = "F4 VI"
				case f5IV = "F5 IV"
				case f5V = "F5 V"
				case f5VI = "F5 VI"
				case f6IV = "F6 IV"
				case f6V = "F6 V"
				case f6VI = "F6 VI"
				case f7V = "F7 V"
				case f7VI = "F7 VI"
				case f8V = "F8 V"
				case f8VI = "F8 VI"
				case f9IV = "F9 IV"
				case f9V = "F9 V"
				case f9VI = "F9 VI"
				case g0IV = "G0 IV"
				case g0V = "G0 V"
				case g0VI = "G0 VI"
				case g1IV = "G1 IV"
				case g1V = "G1 V"
				case g1VI = "G1 VI"
				case g2IV = "G2 IV"
				case g2V = "G2 V"
				case g2VI = "G2 VI"
				case g3IV = "G3 IV"
				case g3V = "G3 V"
				case g3VI = "G3 VI"
				case g4IV = "G4 IV"
				case g4V = "G4 V"
				case g4VI = "G4 VI"
				case g5IV = "G5 IV"
				case g5V = "G5 V"
				case g5VI = "G5 VI"
				case g6V = "G6 V"
				case g6VI = "G6 VI"
				case g7IV = "G7 IV"
				case g7V = "G7 V"
				case g7VI = "G7 VI"
				case g8IV = "G8 IV"
				case g8V = "G8 V"
				case g8VI = "G8 VI"
				case g9V = "G9 V"
				case g9VI = "G9 VI"
				case k0IV = "K0 IV"
				case k0V = "K0 V"
				case k1IV = "K1 IV"
				case k1V = "K1 V"
				case k2IV = "K2 IV"
				case k2V = "K2 V"
				case k3IV = "K3 IV"
				case k3V = "K3 V"
				case k4IV = "K4 IV"
				case k4V = "K4 V"
				case k5IV = "K5 IV"
				case k5V = "K5 V"
				case k6IV = "K6 IV"
				case k6V = "K6 V"
				case k7IV = "K7 IV"
				case k7V = "K7 V"
				case k8IV = "K8 IV"
				case k8V = "K8 V"
				case k9IV = "K9 IV"
				case k9V = "K9 V"
				case m0V = "M0 V"
				case m1V = "M1 V"
				case m2V = "M2 V"
				case m3V = "M3 V"
				case m4V = "M4 V"
				case m5V = "M5 V"
				case m6V = "M6 V"
				case m7V = "M7 V"
				case m8V = "M8 V"
				case m9V = "M9 V"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public let age: Int64
			public let luminosity: Float
			public let name: String
			public let radius: Int64
			public let solarSystemID: Int
			public let spectralClass: Universe.GetUniverseStarsStarIDOk.GetUniverseStarsStarIDSpectralClass
			public let temperature: Int
			public let typeID: Int
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: age.hashValue)
				hashCombine(seed: &hash, value: luminosity.hashValue)
				hashCombine(seed: &hash, value: name.hashValue)
				hashCombine(seed: &hash, value: radius.hashValue)
				hashCombine(seed: &hash, value: solarSystemID.hashValue)
				hashCombine(seed: &hash, value: spectralClass.hashValue)
				hashCombine(seed: &hash, value: temperature.hashValue)
				hashCombine(seed: &hash, value: typeID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Universe.GetUniverseStarsStarIDOk, rhs: Universe.GetUniverseStarsStarIDOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case age
				case luminosity
				case name
				case radius
				case solarSystemID = "solar_system_id"
				case spectralClass = "spectral_class"
				case temperature
				case typeID = "type_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct ItemCategoryInformation: Codable, Hashable {
			
			
			public let categoryID: Int
			public let groups: [Int]
			public let name: String
			public let published: Bool
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: categoryID.hashValue)
				self.groups.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: name.hashValue)
				hashCombine(seed: &hash, value: published.hashValue)
				return hash
			}
			
			public static func ==(lhs: Universe.ItemCategoryInformation, rhs: Universe.ItemCategoryInformation) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case categoryID = "category_id"
				case groups
				case name
				case published
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetUniverseGroupsGroupIDNotFound: Codable, Hashable {
			
			
			public let error: String?
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Universe.GetUniverseGroupsGroupIDNotFound, rhs: Universe.GetUniverseGroupsGroupIDNotFound) -> Bool {
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
		
		
		public struct GraphicInformation: Codable, Hashable {
			
			
			public let collisionFile: String?
			public let graphicFile: String?
			public let graphicID: Int
			public let iconFolder: String?
			public let sofDna: String?
			public let sofFationName: String?
			public let sofHullName: String?
			public let sofRaceName: String?
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: collisionFile?.hashValue ?? 0)
				hashCombine(seed: &hash, value: graphicFile?.hashValue ?? 0)
				hashCombine(seed: &hash, value: graphicID.hashValue)
				hashCombine(seed: &hash, value: iconFolder?.hashValue ?? 0)
				hashCombine(seed: &hash, value: sofDna?.hashValue ?? 0)
				hashCombine(seed: &hash, value: sofFationName?.hashValue ?? 0)
				hashCombine(seed: &hash, value: sofHullName?.hashValue ?? 0)
				hashCombine(seed: &hash, value: sofRaceName?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Universe.GraphicInformation, rhs: Universe.GraphicInformation) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case collisionFile = "collision_file"
				case graphicFile = "graphic_file"
				case graphicID = "graphic_id"
				case iconFolder = "icon_folder"
				case sofDna = "sof_dna"
				case sofFationName = "sof_fation_name"
				case sofHullName = "sof_hull_name"
				case sofRaceName = "sof_race_name"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct PostUniverseIdsServiceUnavailable: Codable, Hashable {
			
			
			public let error: String?
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Universe.PostUniverseIdsServiceUnavailable, rhs: Universe.PostUniverseIdsServiceUnavailable) -> Bool {
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
		
		
		public struct Jump: Codable, Hashable {
			
			
			public let shipJumps: Int
			public let systemID: Int
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: shipJumps.hashValue)
				hashCombine(seed: &hash, value: systemID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Universe.Jump, rhs: Universe.Jump) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case shipJumps = "ship_jumps"
				case systemID = "system_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetUniverseRegionsRegionIDNotFound: Codable, Hashable {
			
			
			public let error: String?
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Universe.GetUniverseRegionsRegionIDNotFound, rhs: Universe.GetUniverseRegionsRegionIDNotFound) -> Bool {
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
		
		
		public struct GetUniverseGraphicsGraphicIDNotFound: Codable, Hashable {
			
			
			public let error: String?
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Universe.GetUniverseGraphicsGraphicIDNotFound, rhs: Universe.GetUniverseGraphicsGraphicIDNotFound) -> Bool {
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
		
		
		public struct PostUniverseIdsOk: Codable, Hashable {
			
			public struct PostUniverseIdsCharacters: Codable, Hashable {
				
				
				public let id: Int?
				public let name: String?
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: id?.hashValue ?? 0)
					hashCombine(seed: &hash, value: name?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: Universe.PostUniverseIdsOk.PostUniverseIdsCharacters, rhs: Universe.PostUniverseIdsOk.PostUniverseIdsCharacters) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case id
					case name
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct PostUniverseIdsAlliances: Codable, Hashable {
				
				
				public let id: Int?
				public let name: String?
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: id?.hashValue ?? 0)
					hashCombine(seed: &hash, value: name?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: Universe.PostUniverseIdsOk.PostUniverseIdsAlliances, rhs: Universe.PostUniverseIdsOk.PostUniverseIdsAlliances) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case id
					case name
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct PostUniverseIdsConstellations: Codable, Hashable {
				
				
				public let id: Int?
				public let name: String?
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: id?.hashValue ?? 0)
					hashCombine(seed: &hash, value: name?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: Universe.PostUniverseIdsOk.PostUniverseIdsConstellations, rhs: Universe.PostUniverseIdsOk.PostUniverseIdsConstellations) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case id
					case name
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct PostUniverseIdsInventoryTypes: Codable, Hashable {
				
				
				public let id: Int?
				public let name: String?
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: id?.hashValue ?? 0)
					hashCombine(seed: &hash, value: name?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: Universe.PostUniverseIdsOk.PostUniverseIdsInventoryTypes, rhs: Universe.PostUniverseIdsOk.PostUniverseIdsInventoryTypes) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case id
					case name
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct PostUniverseIdsSystems: Codable, Hashable {
				
				
				public let id: Int?
				public let name: String?
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: id?.hashValue ?? 0)
					hashCombine(seed: &hash, value: name?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: Universe.PostUniverseIdsOk.PostUniverseIdsSystems, rhs: Universe.PostUniverseIdsOk.PostUniverseIdsSystems) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case id
					case name
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct PostUniverseIdsStations: Codable, Hashable {
				
				
				public let id: Int?
				public let name: String?
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: id?.hashValue ?? 0)
					hashCombine(seed: &hash, value: name?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: Universe.PostUniverseIdsOk.PostUniverseIdsStations, rhs: Universe.PostUniverseIdsOk.PostUniverseIdsStations) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case id
					case name
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct PostUniverseIdsRegions: Codable, Hashable {
				
				
				public let id: Int?
				public let name: String?
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: id?.hashValue ?? 0)
					hashCombine(seed: &hash, value: name?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: Universe.PostUniverseIdsOk.PostUniverseIdsRegions, rhs: Universe.PostUniverseIdsOk.PostUniverseIdsRegions) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case id
					case name
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct PostUniverseIdsAgents: Codable, Hashable {
				
				
				public let id: Int?
				public let name: String?
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: id?.hashValue ?? 0)
					hashCombine(seed: &hash, value: name?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: Universe.PostUniverseIdsOk.PostUniverseIdsAgents, rhs: Universe.PostUniverseIdsOk.PostUniverseIdsAgents) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case id
					case name
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct PostUniverseIdsFactions: Codable, Hashable {
				
				
				public let id: Int?
				public let name: String?
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: id?.hashValue ?? 0)
					hashCombine(seed: &hash, value: name?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: Universe.PostUniverseIdsOk.PostUniverseIdsFactions, rhs: Universe.PostUniverseIdsOk.PostUniverseIdsFactions) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case id
					case name
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public struct PostUniverseIdsCorporations: Codable, Hashable {
				
				
				public let id: Int?
				public let name: String?
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: id?.hashValue ?? 0)
					hashCombine(seed: &hash, value: name?.hashValue ?? 0)
					return hash
				}
				
				public static func ==(lhs: Universe.PostUniverseIdsOk.PostUniverseIdsCorporations, rhs: Universe.PostUniverseIdsOk.PostUniverseIdsCorporations) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case id
					case name
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public let agents: [Universe.PostUniverseIdsOk.PostUniverseIdsAgents]?
			public let alliances: [Universe.PostUniverseIdsOk.PostUniverseIdsAlliances]?
			public let characters: [Universe.PostUniverseIdsOk.PostUniverseIdsCharacters]?
			public let constellations: [Universe.PostUniverseIdsOk.PostUniverseIdsConstellations]?
			public let corporations: [Universe.PostUniverseIdsOk.PostUniverseIdsCorporations]?
			public let factions: [Universe.PostUniverseIdsOk.PostUniverseIdsFactions]?
			public let inventoryTypes: [Universe.PostUniverseIdsOk.PostUniverseIdsInventoryTypes]?
			public let regions: [Universe.PostUniverseIdsOk.PostUniverseIdsRegions]?
			public let stations: [Universe.PostUniverseIdsOk.PostUniverseIdsStations]?
			public let systems: [Universe.PostUniverseIdsOk.PostUniverseIdsSystems]?
			
			public var hashValue: Int {
				var hash: Int = 0
				self.agents?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.alliances?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.characters?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.constellations?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.corporations?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.factions?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.inventoryTypes?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.regions?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.stations?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.systems?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}
			
			public static func ==(lhs: Universe.PostUniverseIdsOk, rhs: Universe.PostUniverseIdsOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case agents
				case alliances
				case characters
				case constellations
				case corporations
				case factions
				case inventoryTypes = "inventory_types"
				case regions
				case stations
				case systems
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetUniverseCategoriesCategoryIDNotFound: Codable, Hashable {
			
			
			public let error: String?
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Universe.GetUniverseCategoriesCategoryIDNotFound, rhs: Universe.GetUniverseCategoriesCategoryIDNotFound) -> Bool {
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
		
		
		public struct ConstellationInformation: Codable, Hashable {
			
			public struct GetUniverseConstellationsConstellationIDPosition: Codable, Hashable {
				
				
				public let x: Double
				public let y: Double
				public let z: Double
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: x.hashValue)
					hashCombine(seed: &hash, value: y.hashValue)
					hashCombine(seed: &hash, value: z.hashValue)
					return hash
				}
				
				public static func ==(lhs: Universe.ConstellationInformation.GetUniverseConstellationsConstellationIDPosition, rhs: Universe.ConstellationInformation.GetUniverseConstellationsConstellationIDPosition) -> Bool {
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
			
			public let constellationID: Int
			public let name: String
			public let position: Universe.ConstellationInformation.GetUniverseConstellationsConstellationIDPosition
			public let regionID: Int
			public let systems: [Int]
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: constellationID.hashValue)
				hashCombine(seed: &hash, value: name.hashValue)
				hashCombine(seed: &hash, value: position.hashValue)
				hashCombine(seed: &hash, value: regionID.hashValue)
				self.systems.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}
			
			public static func ==(lhs: Universe.ConstellationInformation, rhs: Universe.ConstellationInformation) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case constellationID = "constellation_id"
				case name
				case position
				case regionID = "region_id"
				case systems
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct MoonInformation: Codable, Hashable {
			
			public struct GetUniverseMoonsMoonIDPosition: Codable, Hashable {
				
				
				public let x: Double
				public let y: Double
				public let z: Double
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: x.hashValue)
					hashCombine(seed: &hash, value: y.hashValue)
					hashCombine(seed: &hash, value: z.hashValue)
					return hash
				}
				
				public static func ==(lhs: Universe.MoonInformation.GetUniverseMoonsMoonIDPosition, rhs: Universe.MoonInformation.GetUniverseMoonsMoonIDPosition) -> Bool {
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
			
			public let moonID: Int
			public let name: String
			public let position: Universe.MoonInformation.GetUniverseMoonsMoonIDPosition
			public let systemID: Int
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: moonID.hashValue)
				hashCombine(seed: &hash, value: name.hashValue)
				hashCombine(seed: &hash, value: position.hashValue)
				hashCombine(seed: &hash, value: systemID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Universe.MoonInformation, rhs: Universe.MoonInformation) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case moonID = "moon_id"
				case name
				case position
				case systemID = "system_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct StructureInformation: Codable, Hashable {
			
			public struct GetUniverseStructuresStructureIDPosition: Codable, Hashable {
				
				
				public let x: Double
				public let y: Double
				public let z: Double
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: x.hashValue)
					hashCombine(seed: &hash, value: y.hashValue)
					hashCombine(seed: &hash, value: z.hashValue)
					return hash
				}
				
				public static func ==(lhs: Universe.StructureInformation.GetUniverseStructuresStructureIDPosition, rhs: Universe.StructureInformation.GetUniverseStructuresStructureIDPosition) -> Bool {
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
			
			public let name: String
			public let position: Universe.StructureInformation.GetUniverseStructuresStructureIDPosition?
			public let solarSystemID: Int
			public let typeID: Int?
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: name.hashValue)
				hashCombine(seed: &hash, value: position?.hashValue ?? 0)
				hashCombine(seed: &hash, value: solarSystemID.hashValue)
				hashCombine(seed: &hash, value: typeID?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Universe.StructureInformation, rhs: Universe.StructureInformation) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case name
				case position
				case solarSystemID = "solar_system_id"
				case typeID = "type_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct ItemGroupInformation: Codable, Hashable {
			
			
			public let categoryID: Int
			public let groupID: Int
			public let name: String
			public let published: Bool
			public let types: [Int]
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: categoryID.hashValue)
				hashCombine(seed: &hash, value: groupID.hashValue)
				hashCombine(seed: &hash, value: name.hashValue)
				hashCombine(seed: &hash, value: published.hashValue)
				self.types.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}
			
			public static func ==(lhs: Universe.ItemGroupInformation, rhs: Universe.ItemGroupInformation) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case categoryID = "category_id"
				case groupID = "group_id"
				case name
				case published
				case types
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetUniverseMoonsMoonIDNotFound: Codable, Hashable {
			
			
			public let error: String?
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Universe.GetUniverseMoonsMoonIDNotFound, rhs: Universe.GetUniverseMoonsMoonIDNotFound) -> Bool {
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
		
		
		public struct SolarSystemInformation: Codable, Hashable {
			
			public struct GetUniverseSystemsSystemIDPosition: Codable, Hashable {
				
				
				public let x: Double
				public let y: Double
				public let z: Double
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: x.hashValue)
					hashCombine(seed: &hash, value: y.hashValue)
					hashCombine(seed: &hash, value: z.hashValue)
					return hash
				}
				
				public static func ==(lhs: Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPosition, rhs: Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPosition) -> Bool {
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
			
			public struct GetUniverseSystemsSystemIDPlanets: Codable, Hashable {
				
				
				public let moons: [Int]?
				public let planetID: Int
				
				public var hashValue: Int {
					var hash: Int = 0
					self.moons?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					hashCombine(seed: &hash, value: planetID.hashValue)
					return hash
				}
				
				public static func ==(lhs: Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPlanets, rhs: Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPlanets) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case moons
					case planetID = "planet_id"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public let constellationID: Int
			public let name: String
			public let planets: [Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPlanets]
			public let position: Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPosition
			public let securityClass: String?
			public let securityStatus: Float
			public let starID: Int
			public let stargates: [Int]?
			public let stations: [Int]?
			public let systemID: Int
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: constellationID.hashValue)
				hashCombine(seed: &hash, value: name.hashValue)
				self.planets.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: position.hashValue)
				hashCombine(seed: &hash, value: securityClass?.hashValue ?? 0)
				hashCombine(seed: &hash, value: securityStatus.hashValue)
				hashCombine(seed: &hash, value: starID.hashValue)
				self.stargates?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.stations?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: systemID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Universe.SolarSystemInformation, rhs: Universe.SolarSystemInformation) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case constellationID = "constellation_id"
				case name
				case planets
				case position
				case securityClass = "security_class"
				case securityStatus = "security_status"
				case starID = "star_id"
				case stargates
				case stations
				case systemID = "system_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct PlanetInformation: Codable, Hashable {
			
			public struct GetUniversePlanetsPlanetIDPosition: Codable, Hashable {
				
				
				public let x: Double
				public let y: Double
				public let z: Double
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: x.hashValue)
					hashCombine(seed: &hash, value: y.hashValue)
					hashCombine(seed: &hash, value: z.hashValue)
					return hash
				}
				
				public static func ==(lhs: Universe.PlanetInformation.GetUniversePlanetsPlanetIDPosition, rhs: Universe.PlanetInformation.GetUniversePlanetsPlanetIDPosition) -> Bool {
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
			
			public let name: String
			public let planetID: Int
			public let position: Universe.PlanetInformation.GetUniversePlanetsPlanetIDPosition
			public let systemID: Int
			public let typeID: Int
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: name.hashValue)
				hashCombine(seed: &hash, value: planetID.hashValue)
				hashCombine(seed: &hash, value: position.hashValue)
				hashCombine(seed: &hash, value: systemID.hashValue)
				hashCombine(seed: &hash, value: typeID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Universe.PlanetInformation, rhs: Universe.PlanetInformation) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case name
				case planetID = "planet_id"
				case position
				case systemID = "system_id"
				case typeID = "type_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct StationInformation: Codable, Hashable {
			
			public enum GetUniverseStationsStationIDServices: String, Codable, HTTPQueryable {
				case assasinationMissions = "assasination-missions"
				case blackMarket = "black-market"
				case bountyMissions = "bounty-missions"
				case cloning = "cloning"
				case courierMissions = "courier-missions"
				case dnaTherapy = "dna-therapy"
				case docking = "docking"
				case factory = "factory"
				case fitting = "fitting"
				case gambling = "gambling"
				case insurance = "insurance"
				case interbus = "interbus"
				case jumpCloneFacility = "jump-clone-facility"
				case labratory = "labratory"
				case loyaltyPointStore = "loyalty-point-store"
				case market = "market"
				case navyOffices = "navy-offices"
				case news = "news"
				case officeRental = "office-rental"
				case paintshop = "paintshop"
				case refinery = "refinery"
				case repairFacilities = "repair-facilities"
				case reprocessingPlant = "reprocessing-plant"
				case securityOffices = "security-offices"
				case stockExchange = "stock-exchange"
				case storage = "storage"
				case surgery = "surgery"
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public struct GetUniverseStationsStationIDPosition: Codable, Hashable {
				
				
				public let x: Double
				public let y: Double
				public let z: Double
				
				public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: x.hashValue)
					hashCombine(seed: &hash, value: y.hashValue)
					hashCombine(seed: &hash, value: z.hashValue)
					return hash
				}
				
				public static func ==(lhs: Universe.StationInformation.GetUniverseStationsStationIDPosition, rhs: Universe.StationInformation.GetUniverseStationsStationIDPosition) -> Bool {
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
			
			public let maxDockableShipVolume: Float
			public let name: String
			public let officeRentalCost: Float
			public let owner: Int?
			public let position: Universe.StationInformation.GetUniverseStationsStationIDPosition
			public let raceID: Int?
			public let reprocessingEfficiency: Float
			public let reprocessingStationsTake: Float
			public let services: [Universe.StationInformation.GetUniverseStationsStationIDServices]
			public let stationID: Int
			public let systemID: Int
			public let typeID: Int
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: maxDockableShipVolume.hashValue)
				hashCombine(seed: &hash, value: name.hashValue)
				hashCombine(seed: &hash, value: officeRentalCost.hashValue)
				hashCombine(seed: &hash, value: owner?.hashValue ?? 0)
				hashCombine(seed: &hash, value: position.hashValue)
				hashCombine(seed: &hash, value: raceID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: reprocessingEfficiency.hashValue)
				hashCombine(seed: &hash, value: reprocessingStationsTake.hashValue)
				self.services.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: stationID.hashValue)
				hashCombine(seed: &hash, value: systemID.hashValue)
				hashCombine(seed: &hash, value: typeID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Universe.StationInformation, rhs: Universe.StationInformation) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case maxDockableShipVolume = "max_dockable_ship_volume"
				case name
				case officeRentalCost = "office_rental_cost"
				case owner
				case position
				case raceID = "race_id"
				case reprocessingEfficiency = "reprocessing_efficiency"
				case reprocessingStationsTake = "reprocessing_stations_take"
				case services
				case stationID = "station_id"
				case systemID = "system_id"
				case typeID = "type_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetUniverseConstellationsConstellationIDNotFound: Codable, Hashable {
			
			
			public let error: String?
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Universe.GetUniverseConstellationsConstellationIDNotFound, rhs: Universe.GetUniverseConstellationsConstellationIDNotFound) -> Bool {
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
		
		
		public struct GetUniverseSystemsSystemIDNotFound: Codable, Hashable {
			
			
			public let error: String?
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Universe.GetUniverseSystemsSystemIDNotFound, rhs: Universe.GetUniverseSystemsSystemIDNotFound) -> Bool {
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
		
		
		public struct Faction: Codable, Hashable {
			
			
			public let corporationID: Int?
			public let localizedDescription: String
			public let factionID: Int
			public let isUnique: Bool
			public let militiaCorporationID: Int?
			public let name: String
			public let sizeFactor: Float
			public let solarSystemID: Int?
			public let stationCount: Int
			public let stationSystemCount: Int
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: corporationID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: localizedDescription.hashValue)
				hashCombine(seed: &hash, value: factionID.hashValue)
				hashCombine(seed: &hash, value: isUnique.hashValue)
				hashCombine(seed: &hash, value: militiaCorporationID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: name.hashValue)
				hashCombine(seed: &hash, value: sizeFactor.hashValue)
				hashCombine(seed: &hash, value: solarSystemID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: stationCount.hashValue)
				hashCombine(seed: &hash, value: stationSystemCount.hashValue)
				return hash
			}
			
			public static func ==(lhs: Universe.Faction, rhs: Universe.Faction) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case corporationID = "corporation_id"
				case localizedDescription = "description"
				case factionID = "faction_id"
				case isUnique = "is_unique"
				case militiaCorporationID = "militia_corporation_id"
				case name
				case sizeFactor = "size_factor"
				case solarSystemID = "solar_system_id"
				case stationCount = "station_count"
				case stationSystemCount = "station_system_count"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
	}
	
}
