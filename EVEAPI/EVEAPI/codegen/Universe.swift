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
			
			let headers = HTTPHeaders()
			
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
			
			let headers = HTTPHeaders()
			
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
			
			let headers = HTTPHeaders()
			
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
			
			let headers = HTTPHeaders()
			
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
			
			let headers = HTTPHeaders()
			
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
			
			let headers = HTTPHeaders()
			
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
			
			let headers = HTTPHeaders()
			
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
			
			let headers = HTTPHeaders()
			
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
			
			let headers = HTTPHeaders()
			
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
			
			let headers = HTTPHeaders()
			
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
			
			let headers = HTTPHeaders()
			
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
			
			let headers = HTTPHeaders()
			
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
		
		public func getMoonInformation(moonID: Int, completionBlock:((Result<Universe.MoonInformation>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let body: Data? = nil
			
			let headers = HTTPHeaders()
			
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
			
			let headers = HTTPHeaders()
			
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
			
			let headers = HTTPHeaders()
			
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
			
			let headers = HTTPHeaders()
			
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
			
			let headers = HTTPHeaders()
			
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
			
			let headers = HTTPHeaders()
			
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
			
			let headers = HTTPHeaders()
			
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
			
			let scopes = (session?.adapter as? OAuth2Handler)?.token.scopes ?? []
			guard scopes.contains("esi-universe.read_structures.v1") else {completionBlock?(.failure(ESIError.forbidden)); return}
			
			let body: Data? = nil
			
			let headers = HTTPHeaders()
			
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
			
			let headers = HTTPHeaders()
			
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
			
			let headers = HTTPHeaders()
			
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
			
			let headers = HTTPHeaders()
			
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
			
			let headers = HTTPHeaders()
			
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
			
			let headers = HTTPHeaders()
			
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
			
			let headers = HTTPHeaders()
			
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
		
		
		public class GetUniverseStargatesStargateIDInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseStargatesStargateIDInternalServerError, rhs: Universe.GetUniverseStargatesStargateIDInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class Bloodline: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let bloodlineID = dictionary["bloodline_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.bloodlineID = bloodlineID
				guard let charisma = dictionary["charisma"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.charisma = charisma
				guard let corporationID = dictionary["corporation_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.corporationID = corporationID
				guard let localizedDescription = dictionary["description"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.localizedDescription = localizedDescription
				guard let intelligence = dictionary["intelligence"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.intelligence = intelligence
				guard let memory = dictionary["memory"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.memory = memory
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.name = name
				guard let perception = dictionary["perception"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.perception = perception
				guard let raceID = dictionary["race_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.raceID = raceID
				guard let shipTypeID = dictionary["ship_type_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.shipTypeID = shipTypeID
				guard let willpower = dictionary["willpower"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.willpower = willpower
				
				super.init()
			}
			
			override public init() {
				super.init()
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
			
			override public var hashValue: Int {
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
			
		}
		
		
		public class GetUniverseRegionsInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseRegionsInternalServerError, rhs: Universe.GetUniverseRegionsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class RegionInformation: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var constellations: [Int] = []
			public var localizedDescription: String? = nil
			public var name: String = String()
			public var regionID: Int = Int()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				constellations = try (dictionary["constellations"] as? [Any])?.map {try Int(json: $0)} ?? []
				localizedDescription = dictionary["description"] as? String
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.name = name
				guard let regionID = dictionary["region_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.regionID = regionID
				
				super.init()
			}
			
			override public init() {
				super.init()
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				constellations.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: localizedDescription?.hashValue ?? 0)
				hashCombine(seed: &hash, value: name.hashValue)
				hashCombine(seed: &hash, value: regionID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Universe.RegionInformation, rhs: Universe.RegionInformation) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetUniverseFactionsInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseFactionsInternalServerError, rhs: Universe.GetUniverseFactionsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetUniverseStargatesStargateIDNotFound: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseStargatesStargateIDNotFound, rhs: Universe.GetUniverseStargatesStargateIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetUniverseSystemsSystemIDInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseSystemsSystemIDInternalServerError, rhs: Universe.GetUniverseSystemsSystemIDInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetUniverseStationsStationIDNotFound: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseStationsStationIDNotFound, rhs: Universe.GetUniverseStationsStationIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetUniverseGraphicsInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseGraphicsInternalServerError, rhs: Universe.GetUniverseGraphicsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class Name: NSObject, NSSecureCoding , JSONCoding {
			
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
					guard let s = json as? String, let v = Category(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public var category: Universe.Name.Category = Universe.Name.Category()
			public var id: Int = Int()
			public var name: String = String()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let category = Universe.Name.Category(rawValue: dictionary["category"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.category = category
				guard let id = dictionary["id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.id = id
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.name = name
				
				super.init()
			}
			
			override public init() {
				super.init()
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: category.hashValue)
				hashCombine(seed: &hash, value: id.hashValue)
				hashCombine(seed: &hash, value: name.hashValue)
				return hash
			}
			
			public static func ==(lhs: Universe.Name, rhs: Universe.Name) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetUniverseGroupsInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseGroupsInternalServerError, rhs: Universe.GetUniverseGroupsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetUniverseGraphicsGraphicIDInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseGraphicsGraphicIDInternalServerError, rhs: Universe.GetUniverseGraphicsGraphicIDInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetUniverseGroupsGroupIDNotFound: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseGroupsGroupIDNotFound, rhs: Universe.GetUniverseGroupsGroupIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetUniverseGraphicsGraphicIDNotFound: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseGraphicsGraphicIDNotFound, rhs: Universe.GetUniverseGraphicsGraphicIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetUniverseCategoriesCategoryIDNotFound: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseCategoriesCategoryIDNotFound, rhs: Universe.GetUniverseCategoriesCategoryIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class SolarSystemInformation: NSObject, NSSecureCoding , JSONCoding {
			
			public class GetUniverseSystemsSystemIDPosition: NSObject, NSSecureCoding , JSONCoding {
				
				
				public var x: Float = Float()
				public var y: Float = Float()
				public var z: Float = Float()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let x = dictionary["x"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.x = x
					guard let y = dictionary["y"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.y = y
					guard let z = dictionary["z"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.z = z
					
					super.init()
				}
				
				override public init() {
					super.init()
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: x.hashValue)
					hashCombine(seed: &hash, value: y.hashValue)
					hashCombine(seed: &hash, value: z.hashValue)
					return hash
				}
				
				public static func ==(lhs: Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPosition, rhs: Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPosition) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
			}
			
			public class GetUniverseSystemsSystemIDPlanets: NSObject, NSSecureCoding , JSONCoding {
				
				
				public var moons: [Int]? = nil
				public var planetID: Int = Int()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					moons = try (dictionary["moons"] as? [Any])?.map {try Int(json: $0)}
					guard let planetID = dictionary["planet_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.planetID = planetID
					
					super.init()
				}
				
				override public init() {
					super.init()
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					moons?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					hashCombine(seed: &hash, value: planetID.hashValue)
					return hash
				}
				
				public static func ==(lhs: Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPlanets, rhs: Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPlanets) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
			}
			
			public var constellationID: Int = Int()
			public var name: String = String()
			public var planets: [Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPlanets] = []
			public var position: Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPosition = Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPosition()
			public var securityClass: String? = nil
			public var securityStatus: Float = Float()
			public var stargates: [Int] = []
			public var systemID: Int = Int()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let constellationID = dictionary["constellation_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.constellationID = constellationID
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.name = name
				planets = try (dictionary["planets"] as? [Any])?.map {try Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPlanets(json: $0)} ?? []
				position = try Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPosition(json: dictionary["position"] as? [String: Any] ?? [:])
				securityClass = dictionary["security_class"] as? String
				guard let securityStatus = dictionary["security_status"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.securityStatus = securityStatus
				stargates = try (dictionary["stargates"] as? [Any])?.map {try Int(json: $0)} ?? []
				guard let systemID = dictionary["system_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.systemID = systemID
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				constellationID = aDecoder.decodeInteger(forKey: "constellation_id")
				name = aDecoder.decodeObject(forKey: "name") as? String ?? String()
				planets = aDecoder.decodeObject(of: [Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPlanets.self], forKey: "planets") as? [Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPlanets] ?? []
				position = aDecoder.decodeObject(of: Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPosition.self, forKey: "position")  ?? Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPosition()
				securityClass = aDecoder.decodeObject(forKey: "security_class") as? String
				securityStatus = aDecoder.decodeFloat(forKey: "security_status")
				stargates = aDecoder.decodeObject(forKey: "stargates") as? [Int] ?? []
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
				aCoder.encode(stargates, forKey: "stargates")
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
				json["stargates"] = stargates.json
				json["system_id"] = systemID.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: constellationID.hashValue)
				hashCombine(seed: &hash, value: name.hashValue)
				planets.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: position.hashValue)
				hashCombine(seed: &hash, value: securityClass?.hashValue ?? 0)
				hashCombine(seed: &hash, value: securityStatus.hashValue)
				stargates.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: systemID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Universe.SolarSystemInformation, rhs: Universe.SolarSystemInformation) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetUniversePlanetsPlanetIDInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniversePlanetsPlanetIDInternalServerError, rhs: Universe.GetUniversePlanetsPlanetIDInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetUniverseMoonsMoonIDNotFound: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseMoonsMoonIDNotFound, rhs: Universe.GetUniverseMoonsMoonIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class ItemGroupInformation: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var categoryID: Float = Float()
			public var groupID: Int = Int()
			public var name: String = String()
			public var published: Bool = Bool()
			public var types: [Int] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let categoryID = dictionary["category_id"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.categoryID = categoryID
				guard let groupID = dictionary["group_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.groupID = groupID
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.name = name
				guard let published = dictionary["published"] as? Bool else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.published = published
				types = try (dictionary["types"] as? [Any])?.map {try Int(json: $0)} ?? []
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				categoryID = aDecoder.decodeFloat(forKey: "category_id")
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: categoryID.hashValue)
				hashCombine(seed: &hash, value: groupID.hashValue)
				hashCombine(seed: &hash, value: name.hashValue)
				hashCombine(seed: &hash, value: published.hashValue)
				types.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}
			
			public static func ==(lhs: Universe.ItemGroupInformation, rhs: Universe.ItemGroupInformation) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetUniverseMoonsMoonIDInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseMoonsMoonIDInternalServerError, rhs: Universe.GetUniverseMoonsMoonIDInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetUniverseConstellationsConstellationIDInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseConstellationsConstellationIDInternalServerError, rhs: Universe.GetUniverseConstellationsConstellationIDInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetUniverseBloodlinesInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseBloodlinesInternalServerError, rhs: Universe.GetUniverseBloodlinesInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetUniverseConstellationsInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseConstellationsInternalServerError, rhs: Universe.GetUniverseConstellationsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class PostUniverseNamesNotFound: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.PostUniverseNamesNotFound, rhs: Universe.PostUniverseNamesNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetUniverseSystemJumpsInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseSystemJumpsInternalServerError, rhs: Universe.GetUniverseSystemJumpsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetUniverseGroupsGroupIDInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseGroupsGroupIDInternalServerError, rhs: Universe.GetUniverseGroupsGroupIDInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class SystemKills: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var npcKills: Int = Int()
			public var podKills: Int = Int()
			public var shipKills: Int = Int()
			public var systemID: Int = Int()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let npcKills = dictionary["npc_kills"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.npcKills = npcKills
				guard let podKills = dictionary["pod_kills"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.podKills = podKills
				guard let shipKills = dictionary["ship_kills"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.shipKills = shipKills
				guard let systemID = dictionary["system_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.systemID = systemID
				
				super.init()
			}
			
			override public init() {
				super.init()
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
			
			override public var hashValue: Int {
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
			
		}
		
		
		public class Race: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var allianceID: Int = Int()
			public var localizedDescription: String = String()
			public var name: String = String()
			public var raceID: Int = Int()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let allianceID = dictionary["alliance_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.allianceID = allianceID
				guard let localizedDescription = dictionary["description"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.localizedDescription = localizedDescription
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.name = name
				guard let raceID = dictionary["race_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.raceID = raceID
				
				super.init()
			}
			
			override public init() {
				super.init()
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
			
			override public var hashValue: Int {
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
			
		}
		
		
		public class GetUniverseStructuresStructureIDNotFound: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseStructuresStructureIDNotFound, rhs: Universe.GetUniverseStructuresStructureIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetUniverseCategoriesCategoryIDInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseCategoriesCategoryIDInternalServerError, rhs: Universe.GetUniverseCategoriesCategoryIDInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetUniverseTypesInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseTypesInternalServerError, rhs: Universe.GetUniverseTypesInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetUniverseStationsStationIDInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseStationsStationIDInternalServerError, rhs: Universe.GetUniverseStationsStationIDInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetUniversePlanetsPlanetIDNotFound: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniversePlanetsPlanetIDNotFound, rhs: Universe.GetUniversePlanetsPlanetIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetUniverseTypesTypeIDNotFound: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseTypesTypeIDNotFound, rhs: Universe.GetUniverseTypesTypeIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetUniverseSystemKillsInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseSystemKillsInternalServerError, rhs: Universe.GetUniverseSystemKillsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class TypeInformation: NSObject, NSSecureCoding , JSONCoding {
			
			public class GetUniverseTypesTypeIDDogmaEffects: NSObject, NSSecureCoding , JSONCoding {
				
				
				public var effectID: Int = Int()
				public var isDefault: Bool = Bool()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let effectID = dictionary["effect_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.effectID = effectID
					guard let isDefault = dictionary["is_default"] as? Bool else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.isDefault = isDefault
					
					super.init()
				}
				
				override public init() {
					super.init()
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: effectID.hashValue)
					hashCombine(seed: &hash, value: isDefault.hashValue)
					return hash
				}
				
				public static func ==(lhs: Universe.TypeInformation.GetUniverseTypesTypeIDDogmaEffects, rhs: Universe.TypeInformation.GetUniverseTypesTypeIDDogmaEffects) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
			}
			
			public class GetUniverseTypesTypeIDDogmaAttributes: NSObject, NSSecureCoding , JSONCoding {
				
				
				public var attributeID: Int = Int()
				public var value: Float = Float()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let attributeID = dictionary["attribute_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.attributeID = attributeID
					guard let value = dictionary["value"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.value = value
					
					super.init()
				}
				
				override public init() {
					super.init()
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: attributeID.hashValue)
					hashCombine(seed: &hash, value: value.hashValue)
					return hash
				}
				
				public static func ==(lhs: Universe.TypeInformation.GetUniverseTypesTypeIDDogmaAttributes, rhs: Universe.TypeInformation.GetUniverseTypesTypeIDDogmaAttributes) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
			}
			
			public var capacity: Float? = nil
			public var localizedDescription: String = String()
			public var dogmaAttributes: [Universe.TypeInformation.GetUniverseTypesTypeIDDogmaAttributes]? = nil
			public var dogmaEffects: [Universe.TypeInformation.GetUniverseTypesTypeIDDogmaEffects]? = nil
			public var graphicID: Int? = nil
			public var groupID: Int = Int()
			public var iconID: Int? = nil
			public var mass: Float? = nil
			public var name: String = String()
			public var portionSize: Int? = nil
			public var published: Bool = Bool()
			public var radius: Float? = nil
			public var typeID: Int = Int()
			public var volume: Float? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				capacity = dictionary["capacity"] as? Float
				guard let localizedDescription = dictionary["description"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.localizedDescription = localizedDescription
				dogmaAttributes = try (dictionary["dogma_attributes"] as? [Any])?.map {try Universe.TypeInformation.GetUniverseTypesTypeIDDogmaAttributes(json: $0)}
				dogmaEffects = try (dictionary["dogma_effects"] as? [Any])?.map {try Universe.TypeInformation.GetUniverseTypesTypeIDDogmaEffects(json: $0)}
				graphicID = dictionary["graphic_id"] as? Int
				guard let groupID = dictionary["group_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.groupID = groupID
				iconID = dictionary["icon_id"] as? Int
				mass = dictionary["mass"] as? Float
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.name = name
				portionSize = dictionary["portion_size"] as? Int
				guard let published = dictionary["published"] as? Bool else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.published = published
				radius = dictionary["radius"] as? Float
				guard let typeID = dictionary["type_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.typeID = typeID
				volume = dictionary["volume"] as? Float
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				capacity = aDecoder.containsValue(forKey: "capacity") ? aDecoder.decodeFloat(forKey: "capacity") : nil
				localizedDescription = aDecoder.decodeObject(forKey: "description") as? String ?? String()
				dogmaAttributes = aDecoder.decodeObject(of: [Universe.TypeInformation.GetUniverseTypesTypeIDDogmaAttributes.self], forKey: "dogma_attributes") as? [Universe.TypeInformation.GetUniverseTypesTypeIDDogmaAttributes]
				dogmaEffects = aDecoder.decodeObject(of: [Universe.TypeInformation.GetUniverseTypesTypeIDDogmaEffects.self], forKey: "dogma_effects") as? [Universe.TypeInformation.GetUniverseTypesTypeIDDogmaEffects]
				graphicID = aDecoder.containsValue(forKey: "graphic_id") ? aDecoder.decodeInteger(forKey: "graphic_id") : nil
				groupID = aDecoder.decodeInteger(forKey: "group_id")
				iconID = aDecoder.containsValue(forKey: "icon_id") ? aDecoder.decodeInteger(forKey: "icon_id") : nil
				mass = aDecoder.containsValue(forKey: "mass") ? aDecoder.decodeFloat(forKey: "mass") : nil
				name = aDecoder.decodeObject(forKey: "name") as? String ?? String()
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
				if let v = mass {
					aCoder.encode(v, forKey: "mass")
				}
				aCoder.encode(name, forKey: "name")
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
				if let v = mass?.json {
					json["mass"] = v
				}
				json["name"] = name.json
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: capacity?.hashValue ?? 0)
				hashCombine(seed: &hash, value: localizedDescription.hashValue)
				dogmaAttributes?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				dogmaEffects?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: graphicID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: groupID.hashValue)
				hashCombine(seed: &hash, value: iconID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: mass?.hashValue ?? 0)
				hashCombine(seed: &hash, value: name.hashValue)
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
			
		}
		
		
		public class PostUniverseNamesInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.PostUniverseNamesInternalServerError, rhs: Universe.PostUniverseNamesInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetUniverseSystemsInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseSystemsInternalServerError, rhs: Universe.GetUniverseSystemsInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetUniverseStructuresInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseStructuresInternalServerError, rhs: Universe.GetUniverseStructuresInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetUniverseRacesInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseRacesInternalServerError, rhs: Universe.GetUniverseRacesInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GraphicInformation: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var collisionFile: String? = nil
			public var graphicFile: String? = nil
			public var graphicID: Int = Int()
			public var iconFolder: String? = nil
			public var sofDna: String? = nil
			public var sofFationName: String? = nil
			public var sofHullName: String? = nil
			public var sofRaceName: String? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				collisionFile = dictionary["collision_file"] as? String
				graphicFile = dictionary["graphic_file"] as? String
				guard let graphicID = dictionary["graphic_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
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
			
			override public var hashValue: Int {
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
			
		}
		
		
		public class ItemCategoryInformation: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var categoryID: Int = Int()
			public var groups: [Int] = []
			public var name: String = String()
			public var published: Bool = Bool()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let categoryID = dictionary["category_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.categoryID = categoryID
				groups = try (dictionary["groups"] as? [Any])?.map {try Int(json: $0)} ?? []
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.name = name
				guard let published = dictionary["published"] as? Bool else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.published = published
				
				super.init()
			}
			
			override public init() {
				super.init()
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: categoryID.hashValue)
				groups.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: name.hashValue)
				hashCombine(seed: &hash, value: published.hashValue)
				return hash
			}
			
			public static func ==(lhs: Universe.ItemCategoryInformation, rhs: Universe.ItemCategoryInformation) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetUniverseStructuresStructureIDInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseStructuresStructureIDInternalServerError, rhs: Universe.GetUniverseStructuresStructureIDInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class StargateInformation: NSObject, NSSecureCoding , JSONCoding {
			
			public class GetUniverseStargatesStargateIDPosition: NSObject, NSSecureCoding , JSONCoding {
				
				
				public var x: Float = Float()
				public var y: Float = Float()
				public var z: Float = Float()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let x = dictionary["x"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.x = x
					guard let y = dictionary["y"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.y = y
					guard let z = dictionary["z"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.z = z
					
					super.init()
				}
				
				override public init() {
					super.init()
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: x.hashValue)
					hashCombine(seed: &hash, value: y.hashValue)
					hashCombine(seed: &hash, value: z.hashValue)
					return hash
				}
				
				public static func ==(lhs: Universe.StargateInformation.GetUniverseStargatesStargateIDPosition, rhs: Universe.StargateInformation.GetUniverseStargatesStargateIDPosition) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
			}
			
			public class GetUniverseStargatesStargateIDDestination: NSObject, NSSecureCoding , JSONCoding {
				
				
				public var stargateID: Int = Int()
				public var systemID: Int = Int()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let stargateID = dictionary["stargate_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.stargateID = stargateID
					guard let systemID = dictionary["system_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.systemID = systemID
					
					super.init()
				}
				
				override public init() {
					super.init()
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: stargateID.hashValue)
					hashCombine(seed: &hash, value: systemID.hashValue)
					return hash
				}
				
				public static func ==(lhs: Universe.StargateInformation.GetUniverseStargatesStargateIDDestination, rhs: Universe.StargateInformation.GetUniverseStargatesStargateIDDestination) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
			}
			
			public var destination: Universe.StargateInformation.GetUniverseStargatesStargateIDDestination = Universe.StargateInformation.GetUniverseStargatesStargateIDDestination()
			public var name: String = String()
			public var position: Universe.StargateInformation.GetUniverseStargatesStargateIDPosition = Universe.StargateInformation.GetUniverseStargatesStargateIDPosition()
			public var stargateID: Int = Int()
			public var systemID: Int = Int()
			public var typeID: Int = Int()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				destination = try Universe.StargateInformation.GetUniverseStargatesStargateIDDestination(json: dictionary["destination"] as? [String: Any] ?? [:])
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.name = name
				position = try Universe.StargateInformation.GetUniverseStargatesStargateIDPosition(json: dictionary["position"] as? [String: Any] ?? [:])
				guard let stargateID = dictionary["stargate_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.stargateID = stargateID
				guard let systemID = dictionary["system_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.systemID = systemID
				guard let typeID = dictionary["type_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.typeID = typeID
				
				super.init()
			}
			
			override public init() {
				super.init()
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
			
			override public var hashValue: Int {
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
			
		}
		
		
		public class Jump: NSObject, NSSecureCoding , JSONCoding {
			
			
			public var shipJumps: Int = Int()
			public var systemID: Int = Int()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let shipJumps = dictionary["ship_jumps"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.shipJumps = shipJumps
				guard let systemID = dictionary["system_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.systemID = systemID
				
				super.init()
			}
			
			override public init() {
				super.init()
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: shipJumps.hashValue)
				hashCombine(seed: &hash, value: systemID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Universe.Jump, rhs: Universe.Jump) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetUniverseRegionsRegionIDNotFound: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseRegionsRegionIDNotFound, rhs: Universe.GetUniverseRegionsRegionIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetUniverseRegionsRegionIDInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseRegionsRegionIDInternalServerError, rhs: Universe.GetUniverseRegionsRegionIDInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class ConstellationInformation: NSObject, NSSecureCoding , JSONCoding {
			
			public class GetUniverseConstellationsConstellationIDPosition: NSObject, NSSecureCoding , JSONCoding {
				
				
				public var x: Float = Float()
				public var y: Float = Float()
				public var z: Float = Float()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let x = dictionary["x"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.x = x
					guard let y = dictionary["y"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.y = y
					guard let z = dictionary["z"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.z = z
					
					super.init()
				}
				
				override public init() {
					super.init()
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: x.hashValue)
					hashCombine(seed: &hash, value: y.hashValue)
					hashCombine(seed: &hash, value: z.hashValue)
					return hash
				}
				
				public static func ==(lhs: Universe.ConstellationInformation.GetUniverseConstellationsConstellationIDPosition, rhs: Universe.ConstellationInformation.GetUniverseConstellationsConstellationIDPosition) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
			}
			
			public var constellationID: Int = Int()
			public var name: String = String()
			public var position: Universe.ConstellationInformation.GetUniverseConstellationsConstellationIDPosition = Universe.ConstellationInformation.GetUniverseConstellationsConstellationIDPosition()
			public var regionID: Int = Int()
			public var systems: [Int] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let constellationID = dictionary["constellation_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.constellationID = constellationID
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.name = name
				position = try Universe.ConstellationInformation.GetUniverseConstellationsConstellationIDPosition(json: dictionary["position"] as? [String: Any] ?? [:])
				guard let regionID = dictionary["region_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.regionID = regionID
				systems = try (dictionary["systems"] as? [Any])?.map {try Int(json: $0)} ?? []
				
				super.init()
			}
			
			override public init() {
				super.init()
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: constellationID.hashValue)
				hashCombine(seed: &hash, value: name.hashValue)
				hashCombine(seed: &hash, value: position.hashValue)
				hashCombine(seed: &hash, value: regionID.hashValue)
				systems.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}
			
			public static func ==(lhs: Universe.ConstellationInformation, rhs: Universe.ConstellationInformation) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetUniverseStructuresStructureIDForbidden: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseStructuresStructureIDForbidden, rhs: Universe.GetUniverseStructuresStructureIDForbidden) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class MoonInformation: NSObject, NSSecureCoding , JSONCoding {
			
			public class GetUniverseMoonsMoonIDPosition: NSObject, NSSecureCoding , JSONCoding {
				
				
				public var x: Float = Float()
				public var y: Float = Float()
				public var z: Float = Float()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let x = dictionary["x"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.x = x
					guard let y = dictionary["y"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.y = y
					guard let z = dictionary["z"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.z = z
					
					super.init()
				}
				
				override public init() {
					super.init()
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: x.hashValue)
					hashCombine(seed: &hash, value: y.hashValue)
					hashCombine(seed: &hash, value: z.hashValue)
					return hash
				}
				
				public static func ==(lhs: Universe.MoonInformation.GetUniverseMoonsMoonIDPosition, rhs: Universe.MoonInformation.GetUniverseMoonsMoonIDPosition) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
			}
			
			public var moonID: Int = Int()
			public var name: String = String()
			public var position: Universe.MoonInformation.GetUniverseMoonsMoonIDPosition = Universe.MoonInformation.GetUniverseMoonsMoonIDPosition()
			public var systemID: Int = Int()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let moonID = dictionary["moon_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.moonID = moonID
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.name = name
				position = try Universe.MoonInformation.GetUniverseMoonsMoonIDPosition(json: dictionary["position"] as? [String: Any] ?? [:])
				guard let systemID = dictionary["system_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.systemID = systemID
				
				super.init()
			}
			
			override public init() {
				super.init()
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
			
			override public var hashValue: Int {
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
			
		}
		
		
		public class GetUniverseTypesTypeIDInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseTypesTypeIDInternalServerError, rhs: Universe.GetUniverseTypesTypeIDInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class StructureInformation: NSObject, NSSecureCoding , JSONCoding {
			
			public class GetUniverseStructuresStructureIDPosition: NSObject, NSSecureCoding , JSONCoding {
				
				
				public var x: Float = Float()
				public var y: Float = Float()
				public var z: Float = Float()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let x = dictionary["x"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.x = x
					guard let y = dictionary["y"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.y = y
					guard let z = dictionary["z"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.z = z
					
					super.init()
				}
				
				override public init() {
					super.init()
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: x.hashValue)
					hashCombine(seed: &hash, value: y.hashValue)
					hashCombine(seed: &hash, value: z.hashValue)
					return hash
				}
				
				public static func ==(lhs: Universe.StructureInformation.GetUniverseStructuresStructureIDPosition, rhs: Universe.StructureInformation.GetUniverseStructuresStructureIDPosition) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
			}
			
			public var name: String = String()
			public var position: Universe.StructureInformation.GetUniverseStructuresStructureIDPosition? = nil
			public var solarSystemID: Int = Int()
			public var typeID: Int? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.name = name
				position = try? Universe.StructureInformation.GetUniverseStructuresStructureIDPosition(json: dictionary["position"] as? [String: Any] ?? [:])
				guard let solarSystemID = dictionary["solar_system_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.solarSystemID = solarSystemID
				typeID = dictionary["type_id"] as? Int
				
				super.init()
			}
			
			override public init() {
				super.init()
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
			
			override public var hashValue: Int {
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
			
		}
		
		
		public class PlanetInformation: NSObject, NSSecureCoding , JSONCoding {
			
			public class GetUniversePlanetsPlanetIDPosition: NSObject, NSSecureCoding , JSONCoding {
				
				
				public var x: Float = Float()
				public var y: Float = Float()
				public var z: Float = Float()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let x = dictionary["x"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.x = x
					guard let y = dictionary["y"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.y = y
					guard let z = dictionary["z"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.z = z
					
					super.init()
				}
				
				override public init() {
					super.init()
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: x.hashValue)
					hashCombine(seed: &hash, value: y.hashValue)
					hashCombine(seed: &hash, value: z.hashValue)
					return hash
				}
				
				public static func ==(lhs: Universe.PlanetInformation.GetUniversePlanetsPlanetIDPosition, rhs: Universe.PlanetInformation.GetUniversePlanetsPlanetIDPosition) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
			}
			
			public var name: String = String()
			public var planetID: Int = Int()
			public var position: Universe.PlanetInformation.GetUniversePlanetsPlanetIDPosition = Universe.PlanetInformation.GetUniversePlanetsPlanetIDPosition()
			public var systemID: Int = Int()
			public var typeID: Int = Int()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.name = name
				guard let planetID = dictionary["planet_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.planetID = planetID
				position = try Universe.PlanetInformation.GetUniversePlanetsPlanetIDPosition(json: dictionary["position"] as? [String: Any] ?? [:])
				guard let systemID = dictionary["system_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.systemID = systemID
				guard let typeID = dictionary["type_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.typeID = typeID
				
				super.init()
			}
			
			override public init() {
				super.init()
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
			
			override public var hashValue: Int {
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
			
		}
		
		
		public class GetUniverseCategoriesInternalServerError: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseCategoriesInternalServerError, rhs: Universe.GetUniverseCategoriesInternalServerError) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetUniverseConstellationsConstellationIDNotFound: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseConstellationsConstellationIDNotFound, rhs: Universe.GetUniverseConstellationsConstellationIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class StationInformation: NSObject, NSSecureCoding , JSONCoding {
			
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
					guard let s = json as? String, let v = GetUniverseStationsStationIDServices(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
					self = v
				}
				
				public var httpQuery: String? {
					return rawValue
				}
				
			}
			
			public class GetUniverseStationsStationIDPosition: NSObject, NSSecureCoding , JSONCoding {
				
				
				public var x: Float = Float()
				public var y: Float = Float()
				public var z: Float = Float()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let x = dictionary["x"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.x = x
					guard let y = dictionary["y"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.y = y
					guard let z = dictionary["z"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.z = z
					
					super.init()
				}
				
				override public init() {
					super.init()
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: x.hashValue)
					hashCombine(seed: &hash, value: y.hashValue)
					hashCombine(seed: &hash, value: z.hashValue)
					return hash
				}
				
				public static func ==(lhs: Universe.StationInformation.GetUniverseStationsStationIDPosition, rhs: Universe.StationInformation.GetUniverseStationsStationIDPosition) -> Bool {
					return lhs.hashValue == rhs.hashValue
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
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let maxDockableShipVolume = dictionary["max_dockable_ship_volume"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.maxDockableShipVolume = maxDockableShipVolume
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.name = name
				guard let officeRentalCost = dictionary["office_rental_cost"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.officeRentalCost = officeRentalCost
				owner = dictionary["owner"] as? Int
				position = try Universe.StationInformation.GetUniverseStationsStationIDPosition(json: dictionary["position"] as? [String: Any] ?? [:])
				raceID = dictionary["race_id"] as? Int
				guard let reprocessingEfficiency = dictionary["reprocessing_efficiency"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.reprocessingEfficiency = reprocessingEfficiency
				guard let reprocessingStationsTake = dictionary["reprocessing_stations_take"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.reprocessingStationsTake = reprocessingStationsTake
				services = try (dictionary["services"] as? [Any])?.map {try Universe.StationInformation.GetUniverseStationsStationIDServices(json: $0)} ?? []
				guard let stationID = dictionary["station_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.stationID = stationID
				guard let systemID = dictionary["system_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.systemID = systemID
				guard let typeID = dictionary["type_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.typeID = typeID
				
				super.init()
			}
			
			override public init() {
				super.init()
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: maxDockableShipVolume.hashValue)
				hashCombine(seed: &hash, value: name.hashValue)
				hashCombine(seed: &hash, value: officeRentalCost.hashValue)
				hashCombine(seed: &hash, value: owner?.hashValue ?? 0)
				hashCombine(seed: &hash, value: position.hashValue)
				hashCombine(seed: &hash, value: raceID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: reprocessingEfficiency.hashValue)
				hashCombine(seed: &hash, value: reprocessingStationsTake.hashValue)
				services.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: stationID.hashValue)
				hashCombine(seed: &hash, value: systemID.hashValue)
				hashCombine(seed: &hash, value: typeID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Universe.StationInformation, rhs: Universe.StationInformation) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class GetUniverseSystemsSystemIDNotFound: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static func ==(lhs: Universe.GetUniverseSystemsSystemIDNotFound, rhs: Universe.GetUniverseSystemsSystemIDNotFound) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
		public class Faction: NSObject, NSSecureCoding , JSONCoding {
			
			
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
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let corporationID = dictionary["corporation_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.corporationID = corporationID
				guard let localizedDescription = dictionary["description"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.localizedDescription = localizedDescription
				guard let factionID = dictionary["faction_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.factionID = factionID
				guard let isUnique = dictionary["is_unique"] as? Bool else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.isUnique = isUnique
				militiaCorporationID = dictionary["militia_corporation_id"] as? Int
				guard let name = dictionary["name"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.name = name
				guard let sizeFactor = dictionary["size_factor"] as? Float else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.sizeFactor = sizeFactor
				guard let solarSystemID = dictionary["solar_system_id"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.solarSystemID = solarSystemID
				guard let stationCount = dictionary["station_count"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.stationCount = stationCount
				guard let stationSystemCount = dictionary["station_system_count"] as? Int else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.stationSystemCount = stationSystemCount
				
				super.init()
			}
			
			override public init() {
				super.init()
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: corporationID.hashValue)
				hashCombine(seed: &hash, value: localizedDescription.hashValue)
				hashCombine(seed: &hash, value: factionID.hashValue)
				hashCombine(seed: &hash, value: isUnique.hashValue)
				hashCombine(seed: &hash, value: militiaCorporationID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: name.hashValue)
				hashCombine(seed: &hash, value: sizeFactor.hashValue)
				hashCombine(seed: &hash, value: solarSystemID.hashValue)
				hashCombine(seed: &hash, value: stationCount.hashValue)
				hashCombine(seed: &hash, value: stationSystemCount.hashValue)
				return hash
			}
			
			public static func ==(lhs: Universe.Faction, rhs: Universe.Faction) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
		}
		
		
	}
	
}
