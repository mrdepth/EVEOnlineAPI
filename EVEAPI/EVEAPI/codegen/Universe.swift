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
			
			let url = session!.baseURL + "latest/universe/categories/\(categoryID)/"
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
		
		public func listAllPublicStructures(completionBlock:((Result<[Int64]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/universe/structures/"
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
			
			let url = session!.baseURL + "latest/universe/types/"
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
			
			let url = session!.baseURL + "latest/universe/groups/"
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
			
			let url = session!.baseURL + "latest/universe/races/"
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
		
		public func getPlanetInformation(planetID: Int, completionBlock:((Result<Universe.PlanetInformation>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/universe/planets/\(planetID)/"
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
		
		public func getNamesAndCategoriesForSetOfIDs(ids: [Int], completionBlock:((Result<[Universe.Name]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body = try? JSONSerialization.data(withJSONObject: ids.json, options: [])
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/universe/names/"
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
		
		public func getConstellations(completionBlock:((Result<[Int]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/universe/constellations/"
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
			
			let url = session!.baseURL + "latest/universe/types/\(typeID)/"
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
		
		public func getGraphics(completionBlock:((Result<[Int]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/universe/graphics/"
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
		
		public func getItemCategories(completionBlock:((Result<[Int]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/universe/categories/"
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
		
		public func getSystemJumps(completionBlock:((Result<[Universe.Jump]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/universe/system_jumps/"
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
		
		public func getStarInformation(starID: Int, completionBlock:((Result<Universe.GetUniverseStarsStarIDOk>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/universe/stars/\(starID)/"
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
		
		public func getMoonInformation(moonID: Int, completionBlock:((Result<Universe.MoonInformation>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/universe/moons/\(moonID)/"
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
			
			let url = session!.baseURL + "latest/universe/constellations/\(constellationID)/"
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
			
			let url = session!.baseURL + "latest/universe/factions/"
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
			
			let url = session!.baseURL + "latest/universe/regions/\(regionID)/"
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
		
		public func getStationInformation(stationID: Int, completionBlock:((Result<Universe.StationInformation>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/universe/stations/\(stationID)/"
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
			
			let url = session!.baseURL + "latest/universe/groups/\(groupID)/"
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
			
			let url = session!.baseURL + "latest/universe/systems/\(systemID)/"
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
		
		public func getStructureInformation(structureID: Int64, completionBlock:((Result<Universe.StructureInformation>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			let scopes = (session?.adapter as? OAuth2Adapter)?.token.scopes ?? []
			guard scopes.contains("esi-universe.read_structures.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/universe/structures/\(structureID)/"
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
		
		public func getGraphicInformation(graphicID: Int, completionBlock:((Result<Universe.GraphicInformation>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/universe/graphics/\(graphicID)/"
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
		
		public func getSystemKills(completionBlock:((Result<[Universe.SystemKills]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/universe/system_kills/"
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
		
		public func getStargateInformation(stargateID: Int, completionBlock:((Result<Universe.StargateInformation>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/universe/stargates/\(stargateID)/"
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
			
			let url = session!.baseURL + "latest/universe/bloodlines/"
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
		
		public func getRegions(completionBlock:((Result<[Int]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/universe/regions/"
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
		
		public func getSolarSystems(completionBlock:((Result<[Int]>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: session!.server.rawValue))
			
			
			
			let url = session!.baseURL + "latest/universe/systems/"
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
		
		
		@objc(ESIUniverseSystemKills) public class SystemKills: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var npcKills: Int = Int()
			public var podKills: Int = Int()
			public var shipKills: Int = Int()
			public var systemID: Int = Int()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let npcKills = dictionary["npc_kills"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.npcKills = npcKills
				guard let podKills = dictionary["pod_kills"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.podKills = podKills
				guard let shipKills = dictionary["ship_kills"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.shipKills = shipKills
				guard let systemID = dictionary["system_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.systemID = systemID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				npcKills = aDecoder.decodeInteger(forKey: "npc_kills")
				podKills = aDecoder.decodeInteger(forKey: "pod_kills")
				shipKills = aDecoder.decodeInteger(forKey: "ship_kills")
				systemID = aDecoder.decodeInteger(forKey: "system_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(npcKills, forKey: "npc_kills")
				aCoder.encode(podKills, forKey: "pod_kills")
				aCoder.encode(shipKills, forKey: "ship_kills")
				aCoder.encode(systemID, forKey: "system_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["npc_kills"] = npcKills.json
				json["pod_kills"] = podKills.json
				json["ship_kills"] = shipKills.json
				json["system_id"] = systemID.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.npcKills.hashValue)
				hashCombine(seed: &hash, value: self.podKills.hashValue)
				hashCombine(seed: &hash, value: self.shipKills.hashValue)
				hashCombine(seed: &hash, value: self.systemID.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Universe.SystemKills, rhs: Universe.SystemKills) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Universe.SystemKills) {
				npcKills = other.npcKills
				podKills = other.podKills
				shipKills = other.shipKills
				systemID = other.systemID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Universe.SystemKills(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? SystemKills)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIUniversePostUniverseNamesNotFound) public class PostUniverseNamesNotFound: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.PostUniverseNamesNotFound, rhs: Universe.PostUniverseNamesNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Universe.PostUniverseNamesNotFound) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Universe.PostUniverseNamesNotFound(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? PostUniverseNamesNotFound)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIUniverseBloodline) public class Bloodline: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var bloodlineID: Int = Int()
			public var charisma: Int = Int()
			public var corporationID: Int = Int()
			public var localizedDescription: String = String()
			public var intelligence: Int = Int()
			public var memory: Int = Int()
			public var name: String = String()
			public var perception: Int = Int()
			public var raceID: Int = Int()
			public var shipTypeID: Int = Int()
			public var willpower: Int = Int()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let bloodlineID = dictionary["bloodline_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.bloodlineID = bloodlineID
				guard let charisma = dictionary["charisma"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.charisma = charisma
				guard let corporationID = dictionary["corporation_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.corporationID = corporationID
				guard let localizedDescription = dictionary["description"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.localizedDescription = localizedDescription
				guard let intelligence = dictionary["intelligence"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.intelligence = intelligence
				guard let memory = dictionary["memory"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.memory = memory
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.name = name
				guard let perception = dictionary["perception"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.perception = perception
				guard let raceID = dictionary["race_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.raceID = raceID
				guard let shipTypeID = dictionary["ship_type_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.shipTypeID = shipTypeID
				guard let willpower = dictionary["willpower"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.willpower = willpower
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				bloodlineID = aDecoder.decodeInteger(forKey: "bloodline_id")
				charisma = aDecoder.decodeInteger(forKey: "charisma")
				corporationID = aDecoder.decodeInteger(forKey: "corporation_id")
				localizedDescription = aDecoder.decodeObject(forKey: "description") as? String ?? String()
				intelligence = aDecoder.decodeInteger(forKey: "intelligence")
				memory = aDecoder.decodeInteger(forKey: "memory")
				name = aDecoder.decodeObject(forKey: "name") as? String ?? String()
				perception = aDecoder.decodeInteger(forKey: "perception")
				raceID = aDecoder.decodeInteger(forKey: "race_id")
				shipTypeID = aDecoder.decodeInteger(forKey: "ship_type_id")
				willpower = aDecoder.decodeInteger(forKey: "willpower")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(bloodlineID, forKey: "bloodline_id")
				aCoder.encode(charisma, forKey: "charisma")
				aCoder.encode(corporationID, forKey: "corporation_id")
				aCoder.encode(localizedDescription, forKey: "description")
				aCoder.encode(intelligence, forKey: "intelligence")
				aCoder.encode(memory, forKey: "memory")
				aCoder.encode(name, forKey: "name")
				aCoder.encode(perception, forKey: "perception")
				aCoder.encode(raceID, forKey: "race_id")
				aCoder.encode(shipTypeID, forKey: "ship_type_id")
				aCoder.encode(willpower, forKey: "willpower")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["bloodline_id"] = bloodlineID.json
				json["charisma"] = charisma.json
				json["corporation_id"] = corporationID.json
				json["description"] = localizedDescription.json
				json["intelligence"] = intelligence.json
				json["memory"] = memory.json
				json["name"] = name.json
				json["perception"] = perception.json
				json["race_id"] = raceID.json
				json["ship_type_id"] = shipTypeID.json
				json["willpower"] = willpower.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.bloodlineID.hashValue)
				hashCombine(seed: &hash, value: self.charisma.hashValue)
				hashCombine(seed: &hash, value: self.corporationID.hashValue)
				hashCombine(seed: &hash, value: self.localizedDescription.hashValue)
				hashCombine(seed: &hash, value: self.intelligence.hashValue)
				hashCombine(seed: &hash, value: self.memory.hashValue)
				hashCombine(seed: &hash, value: self.name.hashValue)
				hashCombine(seed: &hash, value: self.perception.hashValue)
				hashCombine(seed: &hash, value: self.raceID.hashValue)
				hashCombine(seed: &hash, value: self.shipTypeID.hashValue)
				hashCombine(seed: &hash, value: self.willpower.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Universe.Bloodline, rhs: Universe.Bloodline) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Universe.Bloodline) {
				bloodlineID = other.bloodlineID
				charisma = other.charisma
				corporationID = other.corporationID
				localizedDescription = other.localizedDescription
				intelligence = other.intelligence
				memory = other.memory
				name = other.name
				perception = other.perception
				raceID = other.raceID
				shipTypeID = other.shipTypeID
				willpower = other.willpower
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Universe.Bloodline(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Bloodline)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIUniverseRace) public class Race: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var allianceID: Int = Int()
			public var localizedDescription: String = String()
			public var name: String = String()
			public var raceID: Int = Int()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let allianceID = dictionary["alliance_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.allianceID = allianceID
				guard let localizedDescription = dictionary["description"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.localizedDescription = localizedDescription
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.name = name
				guard let raceID = dictionary["race_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.raceID = raceID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				allianceID = aDecoder.decodeInteger(forKey: "alliance_id")
				localizedDescription = aDecoder.decodeObject(forKey: "description") as? String ?? String()
				name = aDecoder.decodeObject(forKey: "name") as? String ?? String()
				raceID = aDecoder.decodeInteger(forKey: "race_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(allianceID, forKey: "alliance_id")
				aCoder.encode(localizedDescription, forKey: "description")
				aCoder.encode(name, forKey: "name")
				aCoder.encode(raceID, forKey: "race_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["alliance_id"] = allianceID.json
				json["description"] = localizedDescription.json
				json["name"] = name.json
				json["race_id"] = raceID.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.allianceID.hashValue)
				hashCombine(seed: &hash, value: self.localizedDescription.hashValue)
				hashCombine(seed: &hash, value: self.name.hashValue)
				hashCombine(seed: &hash, value: self.raceID.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Universe.Race, rhs: Universe.Race) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Universe.Race) {
				allianceID = other.allianceID
				localizedDescription = other.localizedDescription
				name = other.name
				raceID = other.raceID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Universe.Race(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Race)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIUniverseGetUniverseStructuresStructureIDNotFound) public class GetUniverseStructuresStructureIDNotFound: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseStructuresStructureIDNotFound, rhs: Universe.GetUniverseStructuresStructureIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Universe.GetUniverseStructuresStructureIDNotFound) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Universe.GetUniverseStructuresStructureIDNotFound(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetUniverseStructuresStructureIDNotFound)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIUniverseGetUniversePlanetsPlanetIDNotFound) public class GetUniversePlanetsPlanetIDNotFound: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniversePlanetsPlanetIDNotFound, rhs: Universe.GetUniversePlanetsPlanetIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Universe.GetUniversePlanetsPlanetIDNotFound) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Universe.GetUniversePlanetsPlanetIDNotFound(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetUniversePlanetsPlanetIDNotFound)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIUniverseGetUniverseTypesTypeIDNotFound) public class GetUniverseTypesTypeIDNotFound: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseTypesTypeIDNotFound, rhs: Universe.GetUniverseTypesTypeIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Universe.GetUniverseTypesTypeIDNotFound) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Universe.GetUniverseTypesTypeIDNotFound(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetUniverseTypesTypeIDNotFound)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIUniverseRegionInformation) public class RegionInformation: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var constellations: [Int] = []
			public var localizedDescription: String? = nil
			public var name: String = String()
			public var regionID: Int = Int()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				constellations = try (dictionary["constellations"] as? [Any])?.map {try Int(json: $0)} ?? []
				localizedDescription = dictionary["description"] as? String
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.name = name
				guard let regionID = dictionary["region_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.regionID = regionID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				constellations = aDecoder.decodeObject(forKey: "constellations") as? [Int] ?? []
				localizedDescription = aDecoder.decodeObject(forKey: "description") as? String
				name = aDecoder.decodeObject(forKey: "name") as? String ?? String()
				regionID = aDecoder.decodeInteger(forKey: "region_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(constellations, forKey: "constellations")
				if let v = localizedDescription {
					aCoder.encode(v, forKey: "description")
				}
				aCoder.encode(name, forKey: "name")
				aCoder.encode(regionID, forKey: "region_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["constellations"] = constellations.json
				if let v = localizedDescription?.json {
					json["description"] = v
				}
				json["name"] = name.json
				json["region_id"] = regionID.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.constellations.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: self.localizedDescription?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.name.hashValue)
				hashCombine(seed: &hash, value: self.regionID.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Universe.RegionInformation, rhs: Universe.RegionInformation) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Universe.RegionInformation) {
				constellations = other.constellations.flatMap { $0 }
				localizedDescription = other.localizedDescription
				name = other.name
				regionID = other.regionID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Universe.RegionInformation(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? RegionInformation)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIUniverseTypeInformation) public class TypeInformation: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			@objc(ESIUniverseTypeInformationGetUniverseTypesTypeIDDogmaEffects) public class GetUniverseTypesTypeIDDogmaEffects: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var effectID: Int = Int()
				public var isDefault: Bool = Bool()
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let effectID = dictionary["effect_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.effectID = effectID
					guard let isDefault = dictionary["is_default"] as? Bool else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.isDefault = isDefault
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init?(coder aDecoder: NSCoder) {
					effectID = aDecoder.decodeInteger(forKey: "effect_id")
					isDefault = aDecoder.decodeBool(forKey: "is_default")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(effectID, forKey: "effect_id")
					aCoder.encode(isDefault, forKey: "is_default")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["effect_id"] = effectID.json
					json["is_default"] = isDefault.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.effectID.hashValue)
					hashCombine(seed: &hash, value: self.isDefault.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: Universe.TypeInformation.GetUniverseTypesTypeIDDogmaEffects, rhs: Universe.TypeInformation.GetUniverseTypesTypeIDDogmaEffects) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Universe.TypeInformation.GetUniverseTypesTypeIDDogmaEffects) {
					effectID = other.effectID
					isDefault = other.isDefault
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Universe.TypeInformation.GetUniverseTypesTypeIDDogmaEffects(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetUniverseTypesTypeIDDogmaEffects)?.hashValue == hashValue
				}
				
			}
			
			@objc(ESIUniverseTypeInformationGetUniverseTypesTypeIDDogmaAttributes) public class GetUniverseTypesTypeIDDogmaAttributes: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var attributeID: Int = Int()
				public var value: Float = Float()
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let attributeID = dictionary["attribute_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.attributeID = attributeID
					guard let value = dictionary["value"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.value = value
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init?(coder aDecoder: NSCoder) {
					attributeID = aDecoder.decodeInteger(forKey: "attribute_id")
					value = aDecoder.decodeFloat(forKey: "value")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(attributeID, forKey: "attribute_id")
					aCoder.encode(value, forKey: "value")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["attribute_id"] = attributeID.json
					json["value"] = value.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.attributeID.hashValue)
					hashCombine(seed: &hash, value: self.value.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: Universe.TypeInformation.GetUniverseTypesTypeIDDogmaAttributes, rhs: Universe.TypeInformation.GetUniverseTypesTypeIDDogmaAttributes) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Universe.TypeInformation.GetUniverseTypesTypeIDDogmaAttributes) {
					attributeID = other.attributeID
					value = other.value
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Universe.TypeInformation.GetUniverseTypesTypeIDDogmaAttributes(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetUniverseTypesTypeIDDogmaAttributes)?.hashValue == hashValue
				}
				
			}
			
			public var capacity: Float? = nil
			public var localizedDescription: String = String()
			public var dogmaAttributes: [Universe.TypeInformation.GetUniverseTypesTypeIDDogmaAttributes]? = nil
			public var dogmaEffects: [Universe.TypeInformation.GetUniverseTypesTypeIDDogmaEffects]? = nil
			public var graphicID: Int? = nil
			public var groupID: Int = Int()
			public var iconID: Int? = nil
			public var marketGroupID: Int? = nil
			public var mass: Float? = nil
			public var name: String = String()
			public var packagedVolume: Float? = nil
			public var portionSize: Int? = nil
			public var published: Bool = Bool()
			public var radius: Float? = nil
			public var typeID: Int = Int()
			public var volume: Float? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				capacity = dictionary["capacity"] as? Float
				guard let localizedDescription = dictionary["description"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.localizedDescription = localizedDescription
				dogmaAttributes = try (dictionary["dogma_attributes"] as? [Any])?.map {try Universe.TypeInformation.GetUniverseTypesTypeIDDogmaAttributes(json: $0)}
				dogmaEffects = try (dictionary["dogma_effects"] as? [Any])?.map {try Universe.TypeInformation.GetUniverseTypesTypeIDDogmaEffects(json: $0)}
				graphicID = dictionary["graphic_id"] as? Int
				guard let groupID = dictionary["group_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.groupID = groupID
				iconID = dictionary["icon_id"] as? Int
				marketGroupID = dictionary["market_group_id"] as? Int
				mass = dictionary["mass"] as? Float
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.name = name
				packagedVolume = dictionary["packaged_volume"] as? Float
				portionSize = dictionary["portion_size"] as? Int
				guard let published = dictionary["published"] as? Bool else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.published = published
				radius = dictionary["radius"] as? Float
				guard let typeID = dictionary["type_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.typeID = typeID
				volume = dictionary["volume"] as? Float
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				capacity = aDecoder.containsValue(forKey: "capacity") ? aDecoder.decodeFloat(forKey: "capacity") : nil
				localizedDescription = aDecoder.decodeObject(forKey: "description") as? String ?? String()
				dogmaAttributes = aDecoder.decodeObject(of: [Universe.TypeInformation.GetUniverseTypesTypeIDDogmaAttributes.self], forKey: "dogma_attributes") as? [Universe.TypeInformation.GetUniverseTypesTypeIDDogmaAttributes]
				dogmaEffects = aDecoder.decodeObject(of: [Universe.TypeInformation.GetUniverseTypesTypeIDDogmaEffects.self], forKey: "dogma_effects") as? [Universe.TypeInformation.GetUniverseTypesTypeIDDogmaEffects]
				graphicID = aDecoder.containsValue(forKey: "graphic_id") ? aDecoder.decodeInteger(forKey: "graphic_id") : nil
				groupID = aDecoder.decodeInteger(forKey: "group_id")
				iconID = aDecoder.containsValue(forKey: "icon_id") ? aDecoder.decodeInteger(forKey: "icon_id") : nil
				marketGroupID = aDecoder.containsValue(forKey: "market_group_id") ? aDecoder.decodeInteger(forKey: "market_group_id") : nil
				mass = aDecoder.containsValue(forKey: "mass") ? aDecoder.decodeFloat(forKey: "mass") : nil
				name = aDecoder.decodeObject(forKey: "name") as? String ?? String()
				packagedVolume = aDecoder.containsValue(forKey: "packaged_volume") ? aDecoder.decodeFloat(forKey: "packaged_volume") : nil
				portionSize = aDecoder.containsValue(forKey: "portion_size") ? aDecoder.decodeInteger(forKey: "portion_size") : nil
				published = aDecoder.decodeBool(forKey: "published")
				radius = aDecoder.containsValue(forKey: "radius") ? aDecoder.decodeFloat(forKey: "radius") : nil
				typeID = aDecoder.decodeInteger(forKey: "type_id")
				volume = aDecoder.containsValue(forKey: "volume") ? aDecoder.decodeFloat(forKey: "volume") : nil
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = capacity {
					aCoder.encode(v, forKey: "capacity")
				}
				aCoder.encode(localizedDescription, forKey: "description")
				if let v = dogmaAttributes {
					aCoder.encode(v, forKey: "dogma_attributes")
				}
				if let v = dogmaEffects {
					aCoder.encode(v, forKey: "dogma_effects")
				}
				if let v = graphicID {
					aCoder.encode(v, forKey: "graphic_id")
				}
				aCoder.encode(groupID, forKey: "group_id")
				if let v = iconID {
					aCoder.encode(v, forKey: "icon_id")
				}
				if let v = marketGroupID {
					aCoder.encode(v, forKey: "market_group_id")
				}
				if let v = mass {
					aCoder.encode(v, forKey: "mass")
				}
				aCoder.encode(name, forKey: "name")
				if let v = packagedVolume {
					aCoder.encode(v, forKey: "packaged_volume")
				}
				if let v = portionSize {
					aCoder.encode(v, forKey: "portion_size")
				}
				aCoder.encode(published, forKey: "published")
				if let v = radius {
					aCoder.encode(v, forKey: "radius")
				}
				aCoder.encode(typeID, forKey: "type_id")
				if let v = volume {
					aCoder.encode(v, forKey: "volume")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = capacity?.json {
					json["capacity"] = v
				}
				json["description"] = localizedDescription.json
				if let v = dogmaAttributes?.json {
					json["dogma_attributes"] = v
				}
				if let v = dogmaEffects?.json {
					json["dogma_effects"] = v
				}
				if let v = graphicID?.json {
					json["graphic_id"] = v
				}
				json["group_id"] = groupID.json
				if let v = iconID?.json {
					json["icon_id"] = v
				}
				if let v = marketGroupID?.json {
					json["market_group_id"] = v
				}
				if let v = mass?.json {
					json["mass"] = v
				}
				json["name"] = name.json
				if let v = packagedVolume?.json {
					json["packaged_volume"] = v
				}
				if let v = portionSize?.json {
					json["portion_size"] = v
				}
				json["published"] = published.json
				if let v = radius?.json {
					json["radius"] = v
				}
				json["type_id"] = typeID.json
				if let v = volume?.json {
					json["volume"] = v
				}
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.capacity?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.localizedDescription.hashValue)
				self.dogmaAttributes?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.dogmaEffects?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: self.graphicID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.groupID.hashValue)
				hashCombine(seed: &hash, value: self.iconID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.marketGroupID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.mass?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.name.hashValue)
				hashCombine(seed: &hash, value: self.packagedVolume?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.portionSize?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.published.hashValue)
				hashCombine(seed: &hash, value: self.radius?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.typeID.hashValue)
				hashCombine(seed: &hash, value: self.volume?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Universe.TypeInformation, rhs: Universe.TypeInformation) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Universe.TypeInformation) {
				capacity = other.capacity
				localizedDescription = other.localizedDescription
				dogmaAttributes = other.dogmaAttributes?.flatMap { Universe.TypeInformation.GetUniverseTypesTypeIDDogmaAttributes($0) }
				dogmaEffects = other.dogmaEffects?.flatMap { Universe.TypeInformation.GetUniverseTypesTypeIDDogmaEffects($0) }
				graphicID = other.graphicID
				groupID = other.groupID
				iconID = other.iconID
				marketGroupID = other.marketGroupID
				mass = other.mass
				name = other.name
				packagedVolume = other.packagedVolume
				portionSize = other.portionSize
				published = other.published
				radius = other.radius
				typeID = other.typeID
				volume = other.volume
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Universe.TypeInformation(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? TypeInformation)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIUniverseName) public class Name: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public enum Category: String, JSONCoding, HTTPQueryable {
				case alliance = "alliance"
				case character = "character"
				case constellation = "constellation"
				case corporation = "corporation"
				case inventoryType = "inventory_type"
				case region = "region"
				case solarSystem = "solar_system"
				case station = "station"
				
				public init() {
					self = .alliance
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = Category(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var category: Universe.Name.Category = Universe.Name.Category()
			public var id: Int = Int()
			public var name: String = String()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let category = Universe.Name.Category(rawValue: dictionary["category"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.category = category
				guard let id = dictionary["id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.id = id
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.name = name
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				category = Universe.Name.Category(rawValue: aDecoder.decodeObject(forKey: "category") as? String ?? "") ?? Universe.Name.Category()
				id = aDecoder.decodeInteger(forKey: "id")
				name = aDecoder.decodeObject(forKey: "name") as? String ?? String()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(category.rawValue, forKey: "category")
				aCoder.encode(id, forKey: "id")
				aCoder.encode(name, forKey: "name")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["category"] = category.json
				json["id"] = id.json
				json["name"] = name.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.category.hashValue)
				hashCombine(seed: &hash, value: self.id.hashValue)
				hashCombine(seed: &hash, value: self.name.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Universe.Name, rhs: Universe.Name) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Universe.Name) {
				category = other.category
				id = other.id
				name = other.name
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Universe.Name(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Name)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIUniverseGetUniverseStargatesStargateIDNotFound) public class GetUniverseStargatesStargateIDNotFound: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseStargatesStargateIDNotFound, rhs: Universe.GetUniverseStargatesStargateIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Universe.GetUniverseStargatesStargateIDNotFound) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Universe.GetUniverseStargatesStargateIDNotFound(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetUniverseStargatesStargateIDNotFound)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIUniverseGetUniverseStationsStationIDNotFound) public class GetUniverseStationsStationIDNotFound: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseStationsStationIDNotFound, rhs: Universe.GetUniverseStationsStationIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Universe.GetUniverseStationsStationIDNotFound) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Universe.GetUniverseStationsStationIDNotFound(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetUniverseStationsStationIDNotFound)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIUniverseStargateInformation) public class StargateInformation: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			@objc(ESIUniverseStargateInformationGetUniverseStargatesStargateIDDestination) public class GetUniverseStargatesStargateIDDestination: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var stargateID: Int = Int()
				public var systemID: Int = Int()
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let stargateID = dictionary["stargate_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.stargateID = stargateID
					guard let systemID = dictionary["system_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.systemID = systemID
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init?(coder aDecoder: NSCoder) {
					stargateID = aDecoder.decodeInteger(forKey: "stargate_id")
					systemID = aDecoder.decodeInteger(forKey: "system_id")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(stargateID, forKey: "stargate_id")
					aCoder.encode(systemID, forKey: "system_id")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["stargate_id"] = stargateID.json
					json["system_id"] = systemID.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.stargateID.hashValue)
					hashCombine(seed: &hash, value: self.systemID.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: Universe.StargateInformation.GetUniverseStargatesStargateIDDestination, rhs: Universe.StargateInformation.GetUniverseStargatesStargateIDDestination) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Universe.StargateInformation.GetUniverseStargatesStargateIDDestination) {
					stargateID = other.stargateID
					systemID = other.systemID
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Universe.StargateInformation.GetUniverseStargatesStargateIDDestination(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetUniverseStargatesStargateIDDestination)?.hashValue == hashValue
				}
				
			}
			
			@objc(ESIUniverseStargateInformationGetUniverseStargatesStargateIDPosition) public class GetUniverseStargatesStargateIDPosition: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var x: Float = Float()
				public var y: Float = Float()
				public var z: Float = Float()
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let x = dictionary["x"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.x = x
					guard let y = dictionary["y"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.y = y
					guard let z = dictionary["z"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
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
					x = aDecoder.decodeFloat(forKey: "x")
					y = aDecoder.decodeFloat(forKey: "y")
					z = aDecoder.decodeFloat(forKey: "z")
					
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
				
				public static func ==(lhs: Universe.StargateInformation.GetUniverseStargatesStargateIDPosition, rhs: Universe.StargateInformation.GetUniverseStargatesStargateIDPosition) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Universe.StargateInformation.GetUniverseStargatesStargateIDPosition) {
					x = other.x
					y = other.y
					z = other.z
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Universe.StargateInformation.GetUniverseStargatesStargateIDPosition(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetUniverseStargatesStargateIDPosition)?.hashValue == hashValue
				}
				
			}
			
			public var destination: Universe.StargateInformation.GetUniverseStargatesStargateIDDestination = Universe.StargateInformation.GetUniverseStargatesStargateIDDestination()
			public var name: String = String()
			public var position: Universe.StargateInformation.GetUniverseStargatesStargateIDPosition = Universe.StargateInformation.GetUniverseStargatesStargateIDPosition()
			public var stargateID: Int = Int()
			public var systemID: Int = Int()
			public var typeID: Int = Int()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				destination = try Universe.StargateInformation.GetUniverseStargatesStargateIDDestination(json: dictionary["destination"] as? [String: Any] ?? [:])
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.name = name
				position = try Universe.StargateInformation.GetUniverseStargatesStargateIDPosition(json: dictionary["position"] as? [String: Any] ?? [:])
				guard let stargateID = dictionary["stargate_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.stargateID = stargateID
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
				destination = aDecoder.decodeObject(of: Universe.StargateInformation.GetUniverseStargatesStargateIDDestination.self, forKey: "destination")  ?? Universe.StargateInformation.GetUniverseStargatesStargateIDDestination()
				name = aDecoder.decodeObject(forKey: "name") as? String ?? String()
				position = aDecoder.decodeObject(of: Universe.StargateInformation.GetUniverseStargatesStargateIDPosition.self, forKey: "position")  ?? Universe.StargateInformation.GetUniverseStargatesStargateIDPosition()
				stargateID = aDecoder.decodeInteger(forKey: "stargate_id")
				systemID = aDecoder.decodeInteger(forKey: "system_id")
				typeID = aDecoder.decodeInteger(forKey: "type_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(destination, forKey: "destination")
				aCoder.encode(name, forKey: "name")
				aCoder.encode(position, forKey: "position")
				aCoder.encode(stargateID, forKey: "stargate_id")
				aCoder.encode(systemID, forKey: "system_id")
				aCoder.encode(typeID, forKey: "type_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["destination"] = destination.json
				json["name"] = name.json
				json["position"] = position.json
				json["stargate_id"] = stargateID.json
				json["system_id"] = systemID.json
				json["type_id"] = typeID.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.destination.hashValue)
				hashCombine(seed: &hash, value: self.name.hashValue)
				hashCombine(seed: &hash, value: self.position.hashValue)
				hashCombine(seed: &hash, value: self.stargateID.hashValue)
				hashCombine(seed: &hash, value: self.systemID.hashValue)
				hashCombine(seed: &hash, value: self.typeID.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Universe.StargateInformation, rhs: Universe.StargateInformation) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Universe.StargateInformation) {
				destination = Universe.StargateInformation.GetUniverseStargatesStargateIDDestination(other.destination)
				name = other.name
				position = Universe.StargateInformation.GetUniverseStargatesStargateIDPosition(other.position)
				stargateID = other.stargateID
				systemID = other.systemID
				typeID = other.typeID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Universe.StargateInformation(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? StargateInformation)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIUniverseGetUniverseStarsStarIDOk) public class GetUniverseStarsStarIDOk: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public enum GetUniverseStarsStarIDSpectralClass: String, JSONCoding, HTTPQueryable {
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
				
				public init() {
					self = .k2V
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetUniverseStarsStarIDSpectralClass(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var age: Int64 = Int64()
			public var luminosity: Float = Float()
			public var name: String = String()
			public var radius: Int64 = Int64()
			public var solarSystemID: Int = Int()
			public var spectralClass: Universe.GetUniverseStarsStarIDOk.GetUniverseStarsStarIDSpectralClass = Universe.GetUniverseStarsStarIDOk.GetUniverseStarsStarIDSpectralClass()
			public var temperature: Int = Int()
			public var typeID: Int = Int()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let age = dictionary["age"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.age = age
				guard let luminosity = dictionary["luminosity"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.luminosity = luminosity
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.name = name
				guard let radius = dictionary["radius"] as? Int64 else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.radius = radius
				guard let solarSystemID = dictionary["solar_system_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.solarSystemID = solarSystemID
				guard let spectralClass = Universe.GetUniverseStarsStarIDOk.GetUniverseStarsStarIDSpectralClass(rawValue: dictionary["spectral_class"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.spectralClass = spectralClass
				guard let temperature = dictionary["temperature"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.temperature = temperature
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
				age = aDecoder.decodeInt64(forKey: "age")
				luminosity = aDecoder.decodeFloat(forKey: "luminosity")
				name = aDecoder.decodeObject(forKey: "name") as? String ?? String()
				radius = aDecoder.decodeInt64(forKey: "radius")
				solarSystemID = aDecoder.decodeInteger(forKey: "solar_system_id")
				spectralClass = Universe.GetUniverseStarsStarIDOk.GetUniverseStarsStarIDSpectralClass(rawValue: aDecoder.decodeObject(forKey: "spectral_class") as? String ?? "") ?? Universe.GetUniverseStarsStarIDOk.GetUniverseStarsStarIDSpectralClass()
				temperature = aDecoder.decodeInteger(forKey: "temperature")
				typeID = aDecoder.decodeInteger(forKey: "type_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(age, forKey: "age")
				aCoder.encode(luminosity, forKey: "luminosity")
				aCoder.encode(name, forKey: "name")
				aCoder.encode(radius, forKey: "radius")
				aCoder.encode(solarSystemID, forKey: "solar_system_id")
				aCoder.encode(spectralClass.rawValue, forKey: "spectral_class")
				aCoder.encode(temperature, forKey: "temperature")
				aCoder.encode(typeID, forKey: "type_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["age"] = age.json
				json["luminosity"] = luminosity.json
				json["name"] = name.json
				json["radius"] = radius.json
				json["solar_system_id"] = solarSystemID.json
				json["spectral_class"] = spectralClass.json
				json["temperature"] = temperature.json
				json["type_id"] = typeID.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.age.hashValue)
				hashCombine(seed: &hash, value: self.luminosity.hashValue)
				hashCombine(seed: &hash, value: self.name.hashValue)
				hashCombine(seed: &hash, value: self.radius.hashValue)
				hashCombine(seed: &hash, value: self.solarSystemID.hashValue)
				hashCombine(seed: &hash, value: self.spectralClass.hashValue)
				hashCombine(seed: &hash, value: self.temperature.hashValue)
				hashCombine(seed: &hash, value: self.typeID.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Universe.GetUniverseStarsStarIDOk, rhs: Universe.GetUniverseStarsStarIDOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Universe.GetUniverseStarsStarIDOk) {
				age = other.age
				luminosity = other.luminosity
				name = other.name
				radius = other.radius
				solarSystemID = other.solarSystemID
				spectralClass = other.spectralClass
				temperature = other.temperature
				typeID = other.typeID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Universe.GetUniverseStarsStarIDOk(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetUniverseStarsStarIDOk)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIUniverseItemCategoryInformation) public class ItemCategoryInformation: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var categoryID: Int = Int()
			public var groups: [Int] = []
			public var name: String = String()
			public var published: Bool = Bool()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let categoryID = dictionary["category_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.categoryID = categoryID
				groups = try (dictionary["groups"] as? [Any])?.map {try Int(json: $0)} ?? []
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.name = name
				guard let published = dictionary["published"] as? Bool else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.published = published
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				categoryID = aDecoder.decodeInteger(forKey: "category_id")
				groups = aDecoder.decodeObject(forKey: "groups") as? [Int] ?? []
				name = aDecoder.decodeObject(forKey: "name") as? String ?? String()
				published = aDecoder.decodeBool(forKey: "published")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(categoryID, forKey: "category_id")
				aCoder.encode(groups, forKey: "groups")
				aCoder.encode(name, forKey: "name")
				aCoder.encode(published, forKey: "published")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["category_id"] = categoryID.json
				json["groups"] = groups.json
				json["name"] = name.json
				json["published"] = published.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.categoryID.hashValue)
				self.groups.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: self.name.hashValue)
				hashCombine(seed: &hash, value: self.published.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Universe.ItemCategoryInformation, rhs: Universe.ItemCategoryInformation) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Universe.ItemCategoryInformation) {
				categoryID = other.categoryID
				groups = other.groups.flatMap { $0 }
				name = other.name
				published = other.published
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Universe.ItemCategoryInformation(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? ItemCategoryInformation)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIUniverseGetUniverseGroupsGroupIDNotFound) public class GetUniverseGroupsGroupIDNotFound: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseGroupsGroupIDNotFound, rhs: Universe.GetUniverseGroupsGroupIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Universe.GetUniverseGroupsGroupIDNotFound) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Universe.GetUniverseGroupsGroupIDNotFound(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetUniverseGroupsGroupIDNotFound)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIUniverseGraphicInformation) public class GraphicInformation: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var collisionFile: String? = nil
			public var graphicFile: String? = nil
			public var graphicID: Int = Int()
			public var iconFolder: String? = nil
			public var sofDna: String? = nil
			public var sofFationName: String? = nil
			public var sofHullName: String? = nil
			public var sofRaceName: String? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				collisionFile = dictionary["collision_file"] as? String
				graphicFile = dictionary["graphic_file"] as? String
				guard let graphicID = dictionary["graphic_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.graphicID = graphicID
				iconFolder = dictionary["icon_folder"] as? String
				sofDna = dictionary["sof_dna"] as? String
				sofFationName = dictionary["sof_fation_name"] as? String
				sofHullName = dictionary["sof_hull_name"] as? String
				sofRaceName = dictionary["sof_race_name"] as? String
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				collisionFile = aDecoder.decodeObject(forKey: "collision_file") as? String
				graphicFile = aDecoder.decodeObject(forKey: "graphic_file") as? String
				graphicID = aDecoder.decodeInteger(forKey: "graphic_id")
				iconFolder = aDecoder.decodeObject(forKey: "icon_folder") as? String
				sofDna = aDecoder.decodeObject(forKey: "sof_dna") as? String
				sofFationName = aDecoder.decodeObject(forKey: "sof_fation_name") as? String
				sofHullName = aDecoder.decodeObject(forKey: "sof_hull_name") as? String
				sofRaceName = aDecoder.decodeObject(forKey: "sof_race_name") as? String
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = collisionFile {
					aCoder.encode(v, forKey: "collision_file")
				}
				if let v = graphicFile {
					aCoder.encode(v, forKey: "graphic_file")
				}
				aCoder.encode(graphicID, forKey: "graphic_id")
				if let v = iconFolder {
					aCoder.encode(v, forKey: "icon_folder")
				}
				if let v = sofDna {
					aCoder.encode(v, forKey: "sof_dna")
				}
				if let v = sofFationName {
					aCoder.encode(v, forKey: "sof_fation_name")
				}
				if let v = sofHullName {
					aCoder.encode(v, forKey: "sof_hull_name")
				}
				if let v = sofRaceName {
					aCoder.encode(v, forKey: "sof_race_name")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = collisionFile?.json {
					json["collision_file"] = v
				}
				if let v = graphicFile?.json {
					json["graphic_file"] = v
				}
				json["graphic_id"] = graphicID.json
				if let v = iconFolder?.json {
					json["icon_folder"] = v
				}
				if let v = sofDna?.json {
					json["sof_dna"] = v
				}
				if let v = sofFationName?.json {
					json["sof_fation_name"] = v
				}
				if let v = sofHullName?.json {
					json["sof_hull_name"] = v
				}
				if let v = sofRaceName?.json {
					json["sof_race_name"] = v
				}
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.collisionFile?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.graphicFile?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.graphicID.hashValue)
				hashCombine(seed: &hash, value: self.iconFolder?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.sofDna?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.sofFationName?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.sofHullName?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.sofRaceName?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Universe.GraphicInformation, rhs: Universe.GraphicInformation) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Universe.GraphicInformation) {
				collisionFile = other.collisionFile
				graphicFile = other.graphicFile
				graphicID = other.graphicID
				iconFolder = other.iconFolder
				sofDna = other.sofDna
				sofFationName = other.sofFationName
				sofHullName = other.sofHullName
				sofRaceName = other.sofRaceName
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Universe.GraphicInformation(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GraphicInformation)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIUniverseJump) public class Jump: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var shipJumps: Int = Int()
			public var systemID: Int = Int()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let shipJumps = dictionary["ship_jumps"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.shipJumps = shipJumps
				guard let systemID = dictionary["system_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.systemID = systemID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				shipJumps = aDecoder.decodeInteger(forKey: "ship_jumps")
				systemID = aDecoder.decodeInteger(forKey: "system_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(shipJumps, forKey: "ship_jumps")
				aCoder.encode(systemID, forKey: "system_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["ship_jumps"] = shipJumps.json
				json["system_id"] = systemID.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.shipJumps.hashValue)
				hashCombine(seed: &hash, value: self.systemID.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Universe.Jump, rhs: Universe.Jump) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Universe.Jump) {
				shipJumps = other.shipJumps
				systemID = other.systemID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Universe.Jump(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Jump)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIUniverseGetUniverseRegionsRegionIDNotFound) public class GetUniverseRegionsRegionIDNotFound: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseRegionsRegionIDNotFound, rhs: Universe.GetUniverseRegionsRegionIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Universe.GetUniverseRegionsRegionIDNotFound) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Universe.GetUniverseRegionsRegionIDNotFound(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetUniverseRegionsRegionIDNotFound)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIUniverseGetUniverseGraphicsGraphicIDNotFound) public class GetUniverseGraphicsGraphicIDNotFound: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseGraphicsGraphicIDNotFound, rhs: Universe.GetUniverseGraphicsGraphicIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Universe.GetUniverseGraphicsGraphicIDNotFound) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Universe.GetUniverseGraphicsGraphicIDNotFound(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetUniverseGraphicsGraphicIDNotFound)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIUniverseGetUniverseCategoriesCategoryIDNotFound) public class GetUniverseCategoriesCategoryIDNotFound: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseCategoriesCategoryIDNotFound, rhs: Universe.GetUniverseCategoriesCategoryIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Universe.GetUniverseCategoriesCategoryIDNotFound) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Universe.GetUniverseCategoriesCategoryIDNotFound(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetUniverseCategoriesCategoryIDNotFound)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIUniverseConstellationInformation) public class ConstellationInformation: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			@objc(ESIUniverseConstellationInformationGetUniverseConstellationsConstellationIDPosition) public class GetUniverseConstellationsConstellationIDPosition: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var x: Float = Float()
				public var y: Float = Float()
				public var z: Float = Float()
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let x = dictionary["x"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.x = x
					guard let y = dictionary["y"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.y = y
					guard let z = dictionary["z"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
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
					x = aDecoder.decodeFloat(forKey: "x")
					y = aDecoder.decodeFloat(forKey: "y")
					z = aDecoder.decodeFloat(forKey: "z")
					
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
				
				public static func ==(lhs: Universe.ConstellationInformation.GetUniverseConstellationsConstellationIDPosition, rhs: Universe.ConstellationInformation.GetUniverseConstellationsConstellationIDPosition) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Universe.ConstellationInformation.GetUniverseConstellationsConstellationIDPosition) {
					x = other.x
					y = other.y
					z = other.z
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Universe.ConstellationInformation.GetUniverseConstellationsConstellationIDPosition(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetUniverseConstellationsConstellationIDPosition)?.hashValue == hashValue
				}
				
			}
			
			public var constellationID: Int = Int()
			public var name: String = String()
			public var position: Universe.ConstellationInformation.GetUniverseConstellationsConstellationIDPosition = Universe.ConstellationInformation.GetUniverseConstellationsConstellationIDPosition()
			public var regionID: Int = Int()
			public var systems: [Int] = []
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let constellationID = dictionary["constellation_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.constellationID = constellationID
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.name = name
				position = try Universe.ConstellationInformation.GetUniverseConstellationsConstellationIDPosition(json: dictionary["position"] as? [String: Any] ?? [:])
				guard let regionID = dictionary["region_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.regionID = regionID
				systems = try (dictionary["systems"] as? [Any])?.map {try Int(json: $0)} ?? []
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				constellationID = aDecoder.decodeInteger(forKey: "constellation_id")
				name = aDecoder.decodeObject(forKey: "name") as? String ?? String()
				position = aDecoder.decodeObject(of: Universe.ConstellationInformation.GetUniverseConstellationsConstellationIDPosition.self, forKey: "position")  ?? Universe.ConstellationInformation.GetUniverseConstellationsConstellationIDPosition()
				regionID = aDecoder.decodeInteger(forKey: "region_id")
				systems = aDecoder.decodeObject(forKey: "systems") as? [Int] ?? []
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(constellationID, forKey: "constellation_id")
				aCoder.encode(name, forKey: "name")
				aCoder.encode(position, forKey: "position")
				aCoder.encode(regionID, forKey: "region_id")
				aCoder.encode(systems, forKey: "systems")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["constellation_id"] = constellationID.json
				json["name"] = name.json
				json["position"] = position.json
				json["region_id"] = regionID.json
				json["systems"] = systems.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.constellationID.hashValue)
				hashCombine(seed: &hash, value: self.name.hashValue)
				hashCombine(seed: &hash, value: self.position.hashValue)
				hashCombine(seed: &hash, value: self.regionID.hashValue)
				self.systems.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Universe.ConstellationInformation, rhs: Universe.ConstellationInformation) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Universe.ConstellationInformation) {
				constellationID = other.constellationID
				name = other.name
				position = Universe.ConstellationInformation.GetUniverseConstellationsConstellationIDPosition(other.position)
				regionID = other.regionID
				systems = other.systems.flatMap { $0 }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Universe.ConstellationInformation(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? ConstellationInformation)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIUniverseMoonInformation) public class MoonInformation: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			@objc(ESIUniverseMoonInformationGetUniverseMoonsMoonIDPosition) public class GetUniverseMoonsMoonIDPosition: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var x: Float = Float()
				public var y: Float = Float()
				public var z: Float = Float()
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let x = dictionary["x"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.x = x
					guard let y = dictionary["y"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.y = y
					guard let z = dictionary["z"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
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
					x = aDecoder.decodeFloat(forKey: "x")
					y = aDecoder.decodeFloat(forKey: "y")
					z = aDecoder.decodeFloat(forKey: "z")
					
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
				
				public static func ==(lhs: Universe.MoonInformation.GetUniverseMoonsMoonIDPosition, rhs: Universe.MoonInformation.GetUniverseMoonsMoonIDPosition) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Universe.MoonInformation.GetUniverseMoonsMoonIDPosition) {
					x = other.x
					y = other.y
					z = other.z
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Universe.MoonInformation.GetUniverseMoonsMoonIDPosition(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetUniverseMoonsMoonIDPosition)?.hashValue == hashValue
				}
				
			}
			
			public var moonID: Int = Int()
			public var name: String = String()
			public var position: Universe.MoonInformation.GetUniverseMoonsMoonIDPosition = Universe.MoonInformation.GetUniverseMoonsMoonIDPosition()
			public var systemID: Int = Int()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let moonID = dictionary["moon_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.moonID = moonID
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.name = name
				position = try Universe.MoonInformation.GetUniverseMoonsMoonIDPosition(json: dictionary["position"] as? [String: Any] ?? [:])
				guard let systemID = dictionary["system_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.systemID = systemID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				moonID = aDecoder.decodeInteger(forKey: "moon_id")
				name = aDecoder.decodeObject(forKey: "name") as? String ?? String()
				position = aDecoder.decodeObject(of: Universe.MoonInformation.GetUniverseMoonsMoonIDPosition.self, forKey: "position")  ?? Universe.MoonInformation.GetUniverseMoonsMoonIDPosition()
				systemID = aDecoder.decodeInteger(forKey: "system_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(moonID, forKey: "moon_id")
				aCoder.encode(name, forKey: "name")
				aCoder.encode(position, forKey: "position")
				aCoder.encode(systemID, forKey: "system_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["moon_id"] = moonID.json
				json["name"] = name.json
				json["position"] = position.json
				json["system_id"] = systemID.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.moonID.hashValue)
				hashCombine(seed: &hash, value: self.name.hashValue)
				hashCombine(seed: &hash, value: self.position.hashValue)
				hashCombine(seed: &hash, value: self.systemID.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Universe.MoonInformation, rhs: Universe.MoonInformation) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Universe.MoonInformation) {
				moonID = other.moonID
				name = other.name
				position = Universe.MoonInformation.GetUniverseMoonsMoonIDPosition(other.position)
				systemID = other.systemID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Universe.MoonInformation(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? MoonInformation)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIUniverseStructureInformation) public class StructureInformation: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			@objc(ESIUniverseStructureInformationGetUniverseStructuresStructureIDPosition) public class GetUniverseStructuresStructureIDPosition: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var x: Float = Float()
				public var y: Float = Float()
				public var z: Float = Float()
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let x = dictionary["x"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.x = x
					guard let y = dictionary["y"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.y = y
					guard let z = dictionary["z"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
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
					x = aDecoder.decodeFloat(forKey: "x")
					y = aDecoder.decodeFloat(forKey: "y")
					z = aDecoder.decodeFloat(forKey: "z")
					
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
				
				public static func ==(lhs: Universe.StructureInformation.GetUniverseStructuresStructureIDPosition, rhs: Universe.StructureInformation.GetUniverseStructuresStructureIDPosition) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Universe.StructureInformation.GetUniverseStructuresStructureIDPosition) {
					x = other.x
					y = other.y
					z = other.z
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Universe.StructureInformation.GetUniverseStructuresStructureIDPosition(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetUniverseStructuresStructureIDPosition)?.hashValue == hashValue
				}
				
			}
			
			public var name: String = String()
			public var position: Universe.StructureInformation.GetUniverseStructuresStructureIDPosition? = nil
			public var solarSystemID: Int = Int()
			public var typeID: Int? = nil
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.name = name
				position = try? Universe.StructureInformation.GetUniverseStructuresStructureIDPosition(json: dictionary["position"] as? [String: Any] ?? [:])
				guard let solarSystemID = dictionary["solar_system_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.solarSystemID = solarSystemID
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
				name = aDecoder.decodeObject(forKey: "name") as? String ?? String()
				position = aDecoder.decodeObject(of: Universe.StructureInformation.GetUniverseStructuresStructureIDPosition.self, forKey: "position") 
				solarSystemID = aDecoder.decodeInteger(forKey: "solar_system_id")
				typeID = aDecoder.containsValue(forKey: "type_id") ? aDecoder.decodeInteger(forKey: "type_id") : nil
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(name, forKey: "name")
				if let v = position {
					aCoder.encode(v, forKey: "position")
				}
				aCoder.encode(solarSystemID, forKey: "solar_system_id")
				if let v = typeID {
					aCoder.encode(v, forKey: "type_id")
				}
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["name"] = name.json
				if let v = position?.json {
					json["position"] = v
				}
				json["solar_system_id"] = solarSystemID.json
				if let v = typeID?.json {
					json["type_id"] = v
				}
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.name.hashValue)
				hashCombine(seed: &hash, value: self.position?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.solarSystemID.hashValue)
				hashCombine(seed: &hash, value: self.typeID?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Universe.StructureInformation, rhs: Universe.StructureInformation) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Universe.StructureInformation) {
				name = other.name
				position = other.position != nil ? Universe.StructureInformation.GetUniverseStructuresStructureIDPosition(other.position!) : nil
				solarSystemID = other.solarSystemID
				typeID = other.typeID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Universe.StructureInformation(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? StructureInformation)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIUniverseSolarSystemInformation) public class SolarSystemInformation: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			@objc(ESIUniverseSolarSystemInformationGetUniverseSystemsSystemIDPlanets) public class GetUniverseSystemsSystemIDPlanets: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var moons: [Int]? = nil
				public var planetID: Int = Int()
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					moons = try (dictionary["moons"] as? [Any])?.map {try Int(json: $0)}
					guard let planetID = dictionary["planet_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.planetID = planetID
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init?(coder aDecoder: NSCoder) {
					moons = aDecoder.decodeObject(forKey: "moons") as? [Int]
					planetID = aDecoder.decodeInteger(forKey: "planet_id")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					if let v = moons {
						aCoder.encode(v, forKey: "moons")
					}
					aCoder.encode(planetID, forKey: "planet_id")
				}
				
				public var json: Any {
					var json = [String: Any]()
					if let v = moons?.json {
						json["moons"] = v
					}
					json["planet_id"] = planetID.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					self.moons?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					hashCombine(seed: &hash, value: self.planetID.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPlanets, rhs: Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPlanets) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPlanets) {
					moons = other.moons?.flatMap { $0 }
					planetID = other.planetID
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPlanets(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetUniverseSystemsSystemIDPlanets)?.hashValue == hashValue
				}
				
			}
			
			@objc(ESIUniverseSolarSystemInformationGetUniverseSystemsSystemIDPosition) public class GetUniverseSystemsSystemIDPosition: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var x: Float = Float()
				public var y: Float = Float()
				public var z: Float = Float()
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let x = dictionary["x"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.x = x
					guard let y = dictionary["y"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.y = y
					guard let z = dictionary["z"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
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
					x = aDecoder.decodeFloat(forKey: "x")
					y = aDecoder.decodeFloat(forKey: "y")
					z = aDecoder.decodeFloat(forKey: "z")
					
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
				
				public static func ==(lhs: Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPosition, rhs: Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPosition) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPosition) {
					x = other.x
					y = other.y
					z = other.z
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPosition(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetUniverseSystemsSystemIDPosition)?.hashValue == hashValue
				}
				
			}
			
			public var constellationID: Int = Int()
			public var name: String = String()
			public var planets: [Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPlanets] = []
			public var position: Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPosition = Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPosition()
			public var securityClass: String? = nil
			public var securityStatus: Float = Float()
			public var starID: Int = Int()
			public var stargates: [Int]? = nil
			public var stations: [Int]? = nil
			public var systemID: Int = Int()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let constellationID = dictionary["constellation_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.constellationID = constellationID
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.name = name
				planets = try (dictionary["planets"] as? [Any])?.map {try Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPlanets(json: $0)} ?? []
				position = try Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPosition(json: dictionary["position"] as? [String: Any] ?? [:])
				securityClass = dictionary["security_class"] as? String
				guard let securityStatus = dictionary["security_status"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.securityStatus = securityStatus
				guard let starID = dictionary["star_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.starID = starID
				stargates = try (dictionary["stargates"] as? [Any])?.map {try Int(json: $0)}
				stations = try (dictionary["stations"] as? [Any])?.map {try Int(json: $0)}
				guard let systemID = dictionary["system_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.systemID = systemID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				constellationID = aDecoder.decodeInteger(forKey: "constellation_id")
				name = aDecoder.decodeObject(forKey: "name") as? String ?? String()
				planets = aDecoder.decodeObject(of: [Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPlanets.self], forKey: "planets") as? [Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPlanets] ?? []
				position = aDecoder.decodeObject(of: Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPosition.self, forKey: "position")  ?? Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPosition()
				securityClass = aDecoder.decodeObject(forKey: "security_class") as? String
				securityStatus = aDecoder.decodeFloat(forKey: "security_status")
				starID = aDecoder.decodeInteger(forKey: "star_id")
				stargates = aDecoder.decodeObject(forKey: "stargates") as? [Int]
				stations = aDecoder.decodeObject(forKey: "stations") as? [Int]
				systemID = aDecoder.decodeInteger(forKey: "system_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(constellationID, forKey: "constellation_id")
				aCoder.encode(name, forKey: "name")
				aCoder.encode(planets, forKey: "planets")
				aCoder.encode(position, forKey: "position")
				if let v = securityClass {
					aCoder.encode(v, forKey: "security_class")
				}
				aCoder.encode(securityStatus, forKey: "security_status")
				aCoder.encode(starID, forKey: "star_id")
				if let v = stargates {
					aCoder.encode(v, forKey: "stargates")
				}
				if let v = stations {
					aCoder.encode(v, forKey: "stations")
				}
				aCoder.encode(systemID, forKey: "system_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["constellation_id"] = constellationID.json
				json["name"] = name.json
				json["planets"] = planets.json
				json["position"] = position.json
				if let v = securityClass?.json {
					json["security_class"] = v
				}
				json["security_status"] = securityStatus.json
				json["star_id"] = starID.json
				if let v = stargates?.json {
					json["stargates"] = v
				}
				if let v = stations?.json {
					json["stations"] = v
				}
				json["system_id"] = systemID.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.constellationID.hashValue)
				hashCombine(seed: &hash, value: self.name.hashValue)
				self.planets.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: self.position.hashValue)
				hashCombine(seed: &hash, value: self.securityClass?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.securityStatus.hashValue)
				hashCombine(seed: &hash, value: self.starID.hashValue)
				self.stargates?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.stations?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: self.systemID.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Universe.SolarSystemInformation, rhs: Universe.SolarSystemInformation) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Universe.SolarSystemInformation) {
				constellationID = other.constellationID
				name = other.name
				planets = other.planets.flatMap { Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPlanets($0) }
				position = Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPosition(other.position)
				securityClass = other.securityClass
				securityStatus = other.securityStatus
				starID = other.starID
				stargates = other.stargates?.flatMap { $0 }
				stations = other.stations?.flatMap { $0 }
				systemID = other.systemID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Universe.SolarSystemInformation(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? SolarSystemInformation)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIUniversePlanetInformation) public class PlanetInformation: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			@objc(ESIUniversePlanetInformationGetUniversePlanetsPlanetIDPosition) public class GetUniversePlanetsPlanetIDPosition: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var x: Float = Float()
				public var y: Float = Float()
				public var z: Float = Float()
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let x = dictionary["x"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.x = x
					guard let y = dictionary["y"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.y = y
					guard let z = dictionary["z"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
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
					x = aDecoder.decodeFloat(forKey: "x")
					y = aDecoder.decodeFloat(forKey: "y")
					z = aDecoder.decodeFloat(forKey: "z")
					
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
				
				public static func ==(lhs: Universe.PlanetInformation.GetUniversePlanetsPlanetIDPosition, rhs: Universe.PlanetInformation.GetUniversePlanetsPlanetIDPosition) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Universe.PlanetInformation.GetUniversePlanetsPlanetIDPosition) {
					x = other.x
					y = other.y
					z = other.z
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Universe.PlanetInformation.GetUniversePlanetsPlanetIDPosition(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetUniversePlanetsPlanetIDPosition)?.hashValue == hashValue
				}
				
			}
			
			public var name: String = String()
			public var planetID: Int = Int()
			public var position: Universe.PlanetInformation.GetUniversePlanetsPlanetIDPosition = Universe.PlanetInformation.GetUniversePlanetsPlanetIDPosition()
			public var systemID: Int = Int()
			public var typeID: Int = Int()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.name = name
				guard let planetID = dictionary["planet_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.planetID = planetID
				position = try Universe.PlanetInformation.GetUniversePlanetsPlanetIDPosition(json: dictionary["position"] as? [String: Any] ?? [:])
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
				name = aDecoder.decodeObject(forKey: "name") as? String ?? String()
				planetID = aDecoder.decodeInteger(forKey: "planet_id")
				position = aDecoder.decodeObject(of: Universe.PlanetInformation.GetUniversePlanetsPlanetIDPosition.self, forKey: "position")  ?? Universe.PlanetInformation.GetUniversePlanetsPlanetIDPosition()
				systemID = aDecoder.decodeInteger(forKey: "system_id")
				typeID = aDecoder.decodeInteger(forKey: "type_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(name, forKey: "name")
				aCoder.encode(planetID, forKey: "planet_id")
				aCoder.encode(position, forKey: "position")
				aCoder.encode(systemID, forKey: "system_id")
				aCoder.encode(typeID, forKey: "type_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["name"] = name.json
				json["planet_id"] = planetID.json
				json["position"] = position.json
				json["system_id"] = systemID.json
				json["type_id"] = typeID.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.name.hashValue)
				hashCombine(seed: &hash, value: self.planetID.hashValue)
				hashCombine(seed: &hash, value: self.position.hashValue)
				hashCombine(seed: &hash, value: self.systemID.hashValue)
				hashCombine(seed: &hash, value: self.typeID.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Universe.PlanetInformation, rhs: Universe.PlanetInformation) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Universe.PlanetInformation) {
				name = other.name
				planetID = other.planetID
				position = Universe.PlanetInformation.GetUniversePlanetsPlanetIDPosition(other.position)
				systemID = other.systemID
				typeID = other.typeID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Universe.PlanetInformation(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? PlanetInformation)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIUniverseGetUniverseMoonsMoonIDNotFound) public class GetUniverseMoonsMoonIDNotFound: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseMoonsMoonIDNotFound, rhs: Universe.GetUniverseMoonsMoonIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Universe.GetUniverseMoonsMoonIDNotFound) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Universe.GetUniverseMoonsMoonIDNotFound(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetUniverseMoonsMoonIDNotFound)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIUniverseItemGroupInformation) public class ItemGroupInformation: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var categoryID: Int = Int()
			public var groupID: Int = Int()
			public var name: String = String()
			public var published: Bool = Bool()
			public var types: [Int] = []
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let categoryID = dictionary["category_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.categoryID = categoryID
				guard let groupID = dictionary["group_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.groupID = groupID
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.name = name
				guard let published = dictionary["published"] as? Bool else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.published = published
				types = try (dictionary["types"] as? [Any])?.map {try Int(json: $0)} ?? []
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init?(coder aDecoder: NSCoder) {
				categoryID = aDecoder.decodeInteger(forKey: "category_id")
				groupID = aDecoder.decodeInteger(forKey: "group_id")
				name = aDecoder.decodeObject(forKey: "name") as? String ?? String()
				published = aDecoder.decodeBool(forKey: "published")
				types = aDecoder.decodeObject(forKey: "types") as? [Int] ?? []
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(categoryID, forKey: "category_id")
				aCoder.encode(groupID, forKey: "group_id")
				aCoder.encode(name, forKey: "name")
				aCoder.encode(published, forKey: "published")
				aCoder.encode(types, forKey: "types")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["category_id"] = categoryID.json
				json["group_id"] = groupID.json
				json["name"] = name.json
				json["published"] = published.json
				json["types"] = types.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.categoryID.hashValue)
				hashCombine(seed: &hash, value: self.groupID.hashValue)
				hashCombine(seed: &hash, value: self.name.hashValue)
				hashCombine(seed: &hash, value: self.published.hashValue)
				self.types.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Universe.ItemGroupInformation, rhs: Universe.ItemGroupInformation) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Universe.ItemGroupInformation) {
				categoryID = other.categoryID
				groupID = other.groupID
				name = other.name
				published = other.published
				types = other.types.flatMap { $0 }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Universe.ItemGroupInformation(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? ItemGroupInformation)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIUniverseGetUniverseConstellationsConstellationIDNotFound) public class GetUniverseConstellationsConstellationIDNotFound: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseConstellationsConstellationIDNotFound, rhs: Universe.GetUniverseConstellationsConstellationIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Universe.GetUniverseConstellationsConstellationIDNotFound) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Universe.GetUniverseConstellationsConstellationIDNotFound(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetUniverseConstellationsConstellationIDNotFound)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIUniverseStationInformation) public class StationInformation: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			@objc(ESIUniverseStationInformationGetUniverseStationsStationIDPosition) public class GetUniverseStationsStationIDPosition: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var x: Float = Float()
				public var y: Float = Float()
				public var z: Float = Float()
				
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let x = dictionary["x"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.x = x
					guard let y = dictionary["y"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.y = y
					guard let z = dictionary["z"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
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
					x = aDecoder.decodeFloat(forKey: "x")
					y = aDecoder.decodeFloat(forKey: "y")
					z = aDecoder.decodeFloat(forKey: "z")
					
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
				
				public static func ==(lhs: Universe.StationInformation.GetUniverseStationsStationIDPosition, rhs: Universe.StationInformation.GetUniverseStationsStationIDPosition) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: Universe.StationInformation.GetUniverseStationsStationIDPosition) {
					x = other.x
					y = other.y
					z = other.z
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return Universe.StationInformation.GetUniverseStationsStationIDPosition(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? GetUniverseStationsStationIDPosition)?.hashValue == hashValue
				}
				
			}
			
			public enum GetUniverseStationsStationIDServices: String, JSONCoding, HTTPQueryable {
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
				
				public init() {
					self = .bountyMissions
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = GetUniverseStationsStationIDServices(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var maxDockableShipVolume: Float = Float()
			public var name: String = String()
			public var officeRentalCost: Float = Float()
			public var owner: Int? = nil
			public var position: Universe.StationInformation.GetUniverseStationsStationIDPosition = Universe.StationInformation.GetUniverseStationsStationIDPosition()
			public var raceID: Int? = nil
			public var reprocessingEfficiency: Float = Float()
			public var reprocessingStationsTake: Float = Float()
			public var services: [Universe.StationInformation.GetUniverseStationsStationIDServices] = []
			public var stationID: Int = Int()
			public var systemID: Int = Int()
			public var typeID: Int = Int()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let maxDockableShipVolume = dictionary["max_dockable_ship_volume"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.maxDockableShipVolume = maxDockableShipVolume
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.name = name
				guard let officeRentalCost = dictionary["office_rental_cost"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.officeRentalCost = officeRentalCost
				owner = dictionary["owner"] as? Int
				position = try Universe.StationInformation.GetUniverseStationsStationIDPosition(json: dictionary["position"] as? [String: Any] ?? [:])
				raceID = dictionary["race_id"] as? Int
				guard let reprocessingEfficiency = dictionary["reprocessing_efficiency"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.reprocessingEfficiency = reprocessingEfficiency
				guard let reprocessingStationsTake = dictionary["reprocessing_stations_take"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.reprocessingStationsTake = reprocessingStationsTake
				services = try (dictionary["services"] as? [Any])?.map {try Universe.StationInformation.GetUniverseStationsStationIDServices(json: $0)} ?? []
				guard let stationID = dictionary["station_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.stationID = stationID
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
				maxDockableShipVolume = aDecoder.decodeFloat(forKey: "max_dockable_ship_volume")
				name = aDecoder.decodeObject(forKey: "name") as? String ?? String()
				officeRentalCost = aDecoder.decodeFloat(forKey: "office_rental_cost")
				owner = aDecoder.containsValue(forKey: "owner") ? aDecoder.decodeInteger(forKey: "owner") : nil
				position = aDecoder.decodeObject(of: Universe.StationInformation.GetUniverseStationsStationIDPosition.self, forKey: "position")  ?? Universe.StationInformation.GetUniverseStationsStationIDPosition()
				raceID = aDecoder.containsValue(forKey: "race_id") ? aDecoder.decodeInteger(forKey: "race_id") : nil
				reprocessingEfficiency = aDecoder.decodeFloat(forKey: "reprocessing_efficiency")
				reprocessingStationsTake = aDecoder.decodeFloat(forKey: "reprocessing_stations_take")
				services = aDecoder.decodeObject(forKey: "services") as? [Universe.StationInformation.GetUniverseStationsStationIDServices] ?? []
				stationID = aDecoder.decodeInteger(forKey: "station_id")
				systemID = aDecoder.decodeInteger(forKey: "system_id")
				typeID = aDecoder.decodeInteger(forKey: "type_id")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(maxDockableShipVolume, forKey: "max_dockable_ship_volume")
				aCoder.encode(name, forKey: "name")
				aCoder.encode(officeRentalCost, forKey: "office_rental_cost")
				if let v = owner {
					aCoder.encode(v, forKey: "owner")
				}
				aCoder.encode(position, forKey: "position")
				if let v = raceID {
					aCoder.encode(v, forKey: "race_id")
				}
				aCoder.encode(reprocessingEfficiency, forKey: "reprocessing_efficiency")
				aCoder.encode(reprocessingStationsTake, forKey: "reprocessing_stations_take")
				aCoder.encode(services, forKey: "services")
				aCoder.encode(stationID, forKey: "station_id")
				aCoder.encode(systemID, forKey: "system_id")
				aCoder.encode(typeID, forKey: "type_id")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["max_dockable_ship_volume"] = maxDockableShipVolume.json
				json["name"] = name.json
				json["office_rental_cost"] = officeRentalCost.json
				if let v = owner?.json {
					json["owner"] = v
				}
				json["position"] = position.json
				if let v = raceID?.json {
					json["race_id"] = v
				}
				json["reprocessing_efficiency"] = reprocessingEfficiency.json
				json["reprocessing_stations_take"] = reprocessingStationsTake.json
				json["services"] = services.json
				json["station_id"] = stationID.json
				json["system_id"] = systemID.json
				json["type_id"] = typeID.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.maxDockableShipVolume.hashValue)
				hashCombine(seed: &hash, value: self.name.hashValue)
				hashCombine(seed: &hash, value: self.officeRentalCost.hashValue)
				hashCombine(seed: &hash, value: self.owner?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.position.hashValue)
				hashCombine(seed: &hash, value: self.raceID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.reprocessingEfficiency.hashValue)
				hashCombine(seed: &hash, value: self.reprocessingStationsTake.hashValue)
				self.services.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: self.stationID.hashValue)
				hashCombine(seed: &hash, value: self.systemID.hashValue)
				hashCombine(seed: &hash, value: self.typeID.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Universe.StationInformation, rhs: Universe.StationInformation) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Universe.StationInformation) {
				maxDockableShipVolume = other.maxDockableShipVolume
				name = other.name
				officeRentalCost = other.officeRentalCost
				owner = other.owner
				position = Universe.StationInformation.GetUniverseStationsStationIDPosition(other.position)
				raceID = other.raceID
				reprocessingEfficiency = other.reprocessingEfficiency
				reprocessingStationsTake = other.reprocessingStationsTake
				services = other.services.flatMap { $0 }
				stationID = other.stationID
				systemID = other.systemID
				typeID = other.typeID
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Universe.StationInformation(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? StationInformation)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIUniverseGetUniverseSystemsSystemIDNotFound) public class GetUniverseSystemsSystemIDNotFound: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseSystemsSystemIDNotFound, rhs: Universe.GetUniverseSystemsSystemIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Universe.GetUniverseSystemsSystemIDNotFound) {
				error = other.error
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Universe.GetUniverseSystemsSystemIDNotFound(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? GetUniverseSystemsSystemIDNotFound)?.hashValue == hashValue
			}
			
		}
		
		
		@objc(ESIUniverseFaction) public class Faction: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
			public var corporationID: Int = Int()
			public var localizedDescription: String = String()
			public var factionID: Int = Int()
			public var isUnique: Bool = Bool()
			public var militiaCorporationID: Int? = nil
			public var name: String = String()
			public var sizeFactor: Float = Float()
			public var solarSystemID: Int = Int()
			public var stationCount: Int = Int()
			public var stationSystemCount: Int = Int()
			
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let corporationID = dictionary["corporation_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.corporationID = corporationID
				guard let localizedDescription = dictionary["description"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.localizedDescription = localizedDescription
				guard let factionID = dictionary["faction_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.factionID = factionID
				guard let isUnique = dictionary["is_unique"] as? Bool else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.isUnique = isUnique
				militiaCorporationID = dictionary["militia_corporation_id"] as? Int
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.name = name
				guard let sizeFactor = dictionary["size_factor"] as? Float else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.sizeFactor = sizeFactor
				guard let solarSystemID = dictionary["solar_system_id"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.solarSystemID = solarSystemID
				guard let stationCount = dictionary["station_count"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.stationCount = stationCount
				guard let stationSystemCount = dictionary["station_system_count"] as? Int else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.stationSystemCount = stationSystemCount
				
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
				localizedDescription = aDecoder.decodeObject(forKey: "description") as? String ?? String()
				factionID = aDecoder.decodeInteger(forKey: "faction_id")
				isUnique = aDecoder.decodeBool(forKey: "is_unique")
				militiaCorporationID = aDecoder.containsValue(forKey: "militia_corporation_id") ? aDecoder.decodeInteger(forKey: "militia_corporation_id") : nil
				name = aDecoder.decodeObject(forKey: "name") as? String ?? String()
				sizeFactor = aDecoder.decodeFloat(forKey: "size_factor")
				solarSystemID = aDecoder.decodeInteger(forKey: "solar_system_id")
				stationCount = aDecoder.decodeInteger(forKey: "station_count")
				stationSystemCount = aDecoder.decodeInteger(forKey: "station_system_count")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(corporationID, forKey: "corporation_id")
				aCoder.encode(localizedDescription, forKey: "description")
				aCoder.encode(factionID, forKey: "faction_id")
				aCoder.encode(isUnique, forKey: "is_unique")
				if let v = militiaCorporationID {
					aCoder.encode(v, forKey: "militia_corporation_id")
				}
				aCoder.encode(name, forKey: "name")
				aCoder.encode(sizeFactor, forKey: "size_factor")
				aCoder.encode(solarSystemID, forKey: "solar_system_id")
				aCoder.encode(stationCount, forKey: "station_count")
				aCoder.encode(stationSystemCount, forKey: "station_system_count")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["corporation_id"] = corporationID.json
				json["description"] = localizedDescription.json
				json["faction_id"] = factionID.json
				json["is_unique"] = isUnique.json
				if let v = militiaCorporationID?.json {
					json["militia_corporation_id"] = v
				}
				json["name"] = name.json
				json["size_factor"] = sizeFactor.json
				json["solar_system_id"] = solarSystemID.json
				json["station_count"] = stationCount.json
				json["station_system_count"] = stationSystemCount.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.corporationID.hashValue)
				hashCombine(seed: &hash, value: self.localizedDescription.hashValue)
				hashCombine(seed: &hash, value: self.factionID.hashValue)
				hashCombine(seed: &hash, value: self.isUnique.hashValue)
				hashCombine(seed: &hash, value: self.militiaCorporationID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.name.hashValue)
				hashCombine(seed: &hash, value: self.sizeFactor.hashValue)
				hashCombine(seed: &hash, value: self.solarSystemID.hashValue)
				hashCombine(seed: &hash, value: self.stationCount.hashValue)
				hashCombine(seed: &hash, value: self.stationSystemCount.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: Universe.Faction, rhs: Universe.Faction) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: Universe.Faction) {
				corporationID = other.corporationID
				localizedDescription = other.localizedDescription
				factionID = other.factionID
				isUnique = other.isUnique
				militiaCorporationID = other.militiaCorporationID
				name = other.name
				sizeFactor = other.sizeFactor
				solarSystemID = other.solarSystemID
				stationCount = other.stationCount
				stationSystemCount = other.stationSystemCount
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return Universe.Faction(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? Faction)?.hashValue == hashValue
			}
			
		}
		
		
	}
	
}
