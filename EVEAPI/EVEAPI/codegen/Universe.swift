import Foundation
import Alamofire
import Futures


public extension ESI {
	public var universe: Universe {
		return Universe(esi: self)
	}
	
	class Universe {
		weak var esi: ESI?
		
		init(esi: ESI) {
			self.esi = esi
		}
		
		@discardableResult
		public func getRegionInformation(acceptLanguage: AcceptLanguage? = nil, ifNoneMatch: String? = nil, language: Language? = nil, regionID: Int) -> Future<ESI.Result<Universe.RegionInformation>> {
			var esi = self.esi
			guard esi != nil else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = acceptLanguage?.httpQuery {
				headers["Accept-Language"] = v
			}
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi!.server.rawValue))
			if let v = language?.httpQuery {
				query.append(URLQueryItem(name: "language", value: v))
			}
			
			let url = esi!.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<Universe.RegionInformation>>()
			esi!.perform { () -> DataRequest in
				return esi!.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Universe.RegionInformation>) in
					promise.set(result: response.result, cached: 3600.0)
					esi = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getItemGroups(ifNoneMatch: String? = nil, page: Int? = nil) -> Future<ESI.Result<[Int]>> {
			var esi = self.esi
			guard esi != nil else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi!.server.rawValue))
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = esi!.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Int]>>()
			esi!.perform { () -> DataRequest in
				return esi!.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Int]>) in
					promise.set(result: response.result, cached: 3600.0)
					esi = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getSystemKills(ifNoneMatch: String? = nil) -> Future<ESI.Result<[Universe.SystemKills]>> {
			var esi = self.esi
			guard esi != nil else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi!.server.rawValue))
			
			
			let url = esi!.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Universe.SystemKills]>>()
			esi!.perform { () -> DataRequest in
				return esi!.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Universe.SystemKills]>) in
					promise.set(result: response.result, cached: 3600.0)
					esi = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getRegions(ifNoneMatch: String? = nil) -> Future<ESI.Result<[Int]>> {
			var esi = self.esi
			guard esi != nil else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi!.server.rawValue))
			
			
			let url = esi!.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Int]>>()
			esi!.perform { () -> DataRequest in
				return esi!.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Int]>) in
					promise.set(result: response.result, cached: 3600.0)
					esi = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getConstellationInformation(acceptLanguage: AcceptLanguage? = nil, constellationID: Int, ifNoneMatch: String? = nil, language: Language? = nil) -> Future<ESI.Result<Universe.ConstellationInformation>> {
			var esi = self.esi
			guard esi != nil else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = acceptLanguage?.httpQuery {
				headers["Accept-Language"] = v
			}
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi!.server.rawValue))
			if let v = language?.httpQuery {
				query.append(URLQueryItem(name: "language", value: v))
			}
			
			let url = esi!.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<Universe.ConstellationInformation>>()
			esi!.perform { () -> DataRequest in
				return esi!.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Universe.ConstellationInformation>) in
					promise.set(result: response.result, cached: 3600.0)
					esi = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getStarInformation(ifNoneMatch: String? = nil, starID: Int) -> Future<ESI.Result<Universe.GetUniverseStarsStarIDOk>> {
			var esi = self.esi
			guard esi != nil else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi!.server.rawValue))
			
			
			let url = esi!.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<Universe.GetUniverseStarsStarIDOk>>()
			esi!.perform { () -> DataRequest in
				return esi!.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Universe.GetUniverseStarsStarIDOk>) in
					promise.set(result: response.result, cached: 3600.0)
					esi = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getGraphicInformation(graphicID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<Universe.GraphicInformation>> {
			var esi = self.esi
			guard esi != nil else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi!.server.rawValue))
			
			
			let url = esi!.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<Universe.GraphicInformation>>()
			esi!.perform { () -> DataRequest in
				return esi!.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Universe.GraphicInformation>) in
					promise.set(result: response.result, cached: 3600.0)
					esi = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getStructureInformation(ifNoneMatch: String? = nil, structureID: Int64) -> Future<ESI.Result<Universe.StructureInformation>> {
			var esi = self.esi
			guard esi != nil else { return .init(.failure(ESIError.internalError)) }
			
			let scopes = (esi?.sessionManager.adapter as? OAuth2Helper)?.token.scopes ?? []
			guard scopes.contains("esi-universe.read_structures.v1") else {return .init(.failure(ESIError.forbidden))}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi!.server.rawValue))
			
			
			let url = esi!.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<Universe.StructureInformation>>()
			esi!.perform { () -> DataRequest in
				return esi!.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Universe.StructureInformation>) in
					promise.set(result: response.result, cached: 3600.0)
					esi = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getItemGroupInformation(acceptLanguage: AcceptLanguage? = nil, groupID: Int, ifNoneMatch: String? = nil, language: Language? = nil) -> Future<ESI.Result<Universe.ItemGroupInformation>> {
			var esi = self.esi
			guard esi != nil else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = acceptLanguage?.httpQuery {
				headers["Accept-Language"] = v
			}
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi!.server.rawValue))
			if let v = language?.httpQuery {
				query.append(URLQueryItem(name: "language", value: v))
			}
			
			let url = esi!.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<Universe.ItemGroupInformation>>()
			esi!.perform { () -> DataRequest in
				return esi!.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Universe.ItemGroupInformation>) in
					promise.set(result: response.result, cached: 3600.0)
					esi = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getItemCategoryInformation(acceptLanguage: AcceptLanguage? = nil, categoryID: Int, ifNoneMatch: String? = nil, language: Language? = nil) -> Future<ESI.Result<Universe.ItemCategoryInformation>> {
			var esi = self.esi
			guard esi != nil else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = acceptLanguage?.httpQuery {
				headers["Accept-Language"] = v
			}
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi!.server.rawValue))
			if let v = language?.httpQuery {
				query.append(URLQueryItem(name: "language", value: v))
			}
			
			let url = esi!.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<Universe.ItemCategoryInformation>>()
			esi!.perform { () -> DataRequest in
				return esi!.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Universe.ItemCategoryInformation>) in
					promise.set(result: response.result, cached: 3600.0)
					esi = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getStargateInformation(ifNoneMatch: String? = nil, stargateID: Int) -> Future<ESI.Result<Universe.StargateInformation>> {
			var esi = self.esi
			guard esi != nil else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi!.server.rawValue))
			
			
			let url = esi!.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<Universe.StargateInformation>>()
			esi!.perform { () -> DataRequest in
				return esi!.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Universe.StargateInformation>) in
					promise.set(result: response.result, cached: 3600.0)
					esi = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getAncestries(acceptLanguage: AcceptLanguage? = nil, ifNoneMatch: String? = nil, language: Language? = nil) -> Future<ESI.Result<[Universe.GetUniverseAncestriesOk]>> {
			var esi = self.esi
			guard esi != nil else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = acceptLanguage?.httpQuery {
				headers["Accept-Language"] = v
			}
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi!.server.rawValue))
			if let v = language?.httpQuery {
				query.append(URLQueryItem(name: "language", value: v))
			}
			
			let url = esi!.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Universe.GetUniverseAncestriesOk]>>()
			esi!.perform { () -> DataRequest in
				return esi!.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Universe.GetUniverseAncestriesOk]>) in
					promise.set(result: response.result, cached: 3600.0)
					esi = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getGraphics(ifNoneMatch: String? = nil) -> Future<ESI.Result<[Int]>> {
			var esi = self.esi
			guard esi != nil else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi!.server.rawValue))
			
			
			let url = esi!.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Int]>>()
			esi!.perform { () -> DataRequest in
				return esi!.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Int]>) in
					promise.set(result: response.result, cached: 3600.0)
					esi = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getConstellations(ifNoneMatch: String? = nil) -> Future<ESI.Result<[Int]>> {
			var esi = self.esi
			guard esi != nil else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi!.server.rawValue))
			
			
			let url = esi!.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Int]>>()
			esi!.perform { () -> DataRequest in
				return esi!.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Int]>) in
					promise.set(result: response.result, cached: 3600.0)
					esi = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getCharacterRaces(acceptLanguage: AcceptLanguage? = nil, ifNoneMatch: String? = nil, language: Language? = nil) -> Future<ESI.Result<[Universe.Race]>> {
			var esi = self.esi
			guard esi != nil else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = acceptLanguage?.httpQuery {
				headers["Accept-Language"] = v
			}
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi!.server.rawValue))
			if let v = language?.httpQuery {
				query.append(URLQueryItem(name: "language", value: v))
			}
			
			let url = esi!.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Universe.Race]>>()
			esi!.perform { () -> DataRequest in
				return esi!.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Universe.Race]>) in
					promise.set(result: response.result, cached: 3600.0)
					esi = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getMoonInformation(ifNoneMatch: String? = nil, moonID: Int) -> Future<ESI.Result<Universe.MoonInformation>> {
			var esi = self.esi
			guard esi != nil else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi!.server.rawValue))
			
			
			let url = esi!.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<Universe.MoonInformation>>()
			esi!.perform { () -> DataRequest in
				return esi!.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Universe.MoonInformation>) in
					promise.set(result: response.result, cached: 3600.0)
					esi = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getFactions(acceptLanguage: AcceptLanguage? = nil, ifNoneMatch: String? = nil, language: Language? = nil) -> Future<ESI.Result<[Universe.Faction]>> {
			var esi = self.esi
			guard esi != nil else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = acceptLanguage?.httpQuery {
				headers["Accept-Language"] = v
			}
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi!.server.rawValue))
			if let v = language?.httpQuery {
				query.append(URLQueryItem(name: "language", value: v))
			}
			
			let url = esi!.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Universe.Faction]>>()
			esi!.perform { () -> DataRequest in
				return esi!.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Universe.Faction]>) in
					promise.set(result: response.result, cached: 3600.0)
					esi = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getTypes(ifNoneMatch: String? = nil, page: Int? = nil) -> Future<ESI.Result<[Int]>> {
			var esi = self.esi
			guard esi != nil else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi!.server.rawValue))
			if let v = page?.httpQuery {
				query.append(URLQueryItem(name: "page", value: v))
			}
			
			let url = esi!.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Int]>>()
			esi!.perform { () -> DataRequest in
				return esi!.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Int]>) in
					promise.set(result: response.result, cached: 3600.0)
					esi = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getTypeInformation(acceptLanguage: AcceptLanguage? = nil, ifNoneMatch: String? = nil, language: Language? = nil, typeID: Int) -> Future<ESI.Result<Universe.TypeInformation>> {
			var esi = self.esi
			guard esi != nil else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = acceptLanguage?.httpQuery {
				headers["Accept-Language"] = v
			}
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi!.server.rawValue))
			if let v = language?.httpQuery {
				query.append(URLQueryItem(name: "language", value: v))
			}
			
			let url = esi!.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<Universe.TypeInformation>>()
			esi!.perform { () -> DataRequest in
				return esi!.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Universe.TypeInformation>) in
					promise.set(result: response.result, cached: 3600.0)
					esi = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func listAllPublicStructures(ifNoneMatch: String? = nil) -> Future<ESI.Result<[Int64]>> {
			var esi = self.esi
			guard esi != nil else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi!.server.rawValue))
			
			
			let url = esi!.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Int64]>>()
			esi!.perform { () -> DataRequest in
				return esi!.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Int64]>) in
					promise.set(result: response.result, cached: 3600.0)
					esi = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getNamesAndCategoriesForSetOfIDs(ids: [Int]) -> Future<ESI.Result<[Universe.Name]>> {
			var esi = self.esi
			guard esi != nil else { return .init(.failure(ESIError.internalError)) }
			
			
			let body = try? JSONEncoder().encode(ids)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi!.server.rawValue))
			
			
			let url = esi!.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Universe.Name]>>()
			esi!.perform { () -> DataRequest in
				return esi!.sessionManager.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Universe.Name]>) in
					promise.set(result: response.result, cached: 3600.0)
					esi = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getSolarSystems(ifNoneMatch: String? = nil) -> Future<ESI.Result<[Int]>> {
			var esi = self.esi
			guard esi != nil else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi!.server.rawValue))
			
			
			let url = esi!.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Int]>>()
			esi!.perform { () -> DataRequest in
				return esi!.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Int]>) in
					promise.set(result: response.result, cached: 3600.0)
					esi = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getAsteroidBeltInformation(asteroidBeltID: Int, ifNoneMatch: String? = nil) -> Future<ESI.Result<Universe.GetUniverseAsteroidBeltsAsteroidBeltIDOk>> {
			var esi = self.esi
			guard esi != nil else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi!.server.rawValue))
			
			
			let url = esi!.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<Universe.GetUniverseAsteroidBeltsAsteroidBeltIDOk>>()
			esi!.perform { () -> DataRequest in
				return esi!.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Universe.GetUniverseAsteroidBeltsAsteroidBeltIDOk>) in
					promise.set(result: response.result, cached: 3600.0)
					esi = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getPlanetInformation(ifNoneMatch: String? = nil, planetID: Int) -> Future<ESI.Result<Universe.PlanetInformation>> {
			var esi = self.esi
			guard esi != nil else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi!.server.rawValue))
			
			
			let url = esi!.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<Universe.PlanetInformation>>()
			esi!.perform { () -> DataRequest in
				return esi!.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Universe.PlanetInformation>) in
					promise.set(result: response.result, cached: 3600.0)
					esi = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getSystemJumps(ifNoneMatch: String? = nil) -> Future<ESI.Result<[Universe.Jump]>> {
			var esi = self.esi
			guard esi != nil else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi!.server.rawValue))
			
			
			let url = esi!.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Universe.Jump]>>()
			esi!.perform { () -> DataRequest in
				return esi!.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Universe.Jump]>) in
					promise.set(result: response.result, cached: 3600.0)
					esi = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getItemCategories(ifNoneMatch: String? = nil) -> Future<ESI.Result<[Int]>> {
			var esi = self.esi
			guard esi != nil else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi!.server.rawValue))
			
			
			let url = esi!.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Int]>>()
			esi!.perform { () -> DataRequest in
				return esi!.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Int]>) in
					promise.set(result: response.result, cached: 3600.0)
					esi = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getStationInformation(ifNoneMatch: String? = nil, stationID: Int) -> Future<ESI.Result<Universe.StationInformation>> {
			var esi = self.esi
			guard esi != nil else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi!.server.rawValue))
			
			
			let url = esi!.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<Universe.StationInformation>>()
			esi!.perform { () -> DataRequest in
				return esi!.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Universe.StationInformation>) in
					promise.set(result: response.result, cached: 3600.0)
					esi = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getSolarSystemInformation(acceptLanguage: AcceptLanguage? = nil, ifNoneMatch: String? = nil, language: Language? = nil, systemID: Int) -> Future<ESI.Result<Universe.SolarSystemInformation>> {
			var esi = self.esi
			guard esi != nil else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = acceptLanguage?.httpQuery {
				headers["Accept-Language"] = v
			}
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi!.server.rawValue))
			if let v = language?.httpQuery {
				query.append(URLQueryItem(name: "language", value: v))
			}
			
			let url = esi!.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<Universe.SolarSystemInformation>>()
			esi!.perform { () -> DataRequest in
				return esi!.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Universe.SolarSystemInformation>) in
					promise.set(result: response.result, cached: 3600.0)
					esi = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func getBloodlines(acceptLanguage: AcceptLanguage? = nil, ifNoneMatch: String? = nil, language: Language? = nil) -> Future<ESI.Result<[Universe.Bloodline]>> {
			var esi = self.esi
			guard esi != nil else { return .init(.failure(ESIError.internalError)) }
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = acceptLanguage?.httpQuery {
				headers["Accept-Language"] = v
			}
			if let v = ifNoneMatch?.httpQuery {
				headers["If-None-Match"] = v
			}
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi!.server.rawValue))
			if let v = language?.httpQuery {
				query.append(URLQueryItem(name: "language", value: v))
			}
			
			let url = esi!.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<[Universe.Bloodline]>>()
			esi!.perform { () -> DataRequest in
				return esi!.sessionManager.request(components.url!, method: .get, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<[Universe.Bloodline]>) in
					promise.set(result: response.result, cached: 3600.0)
					esi = nil
				}
			}
			return promise.future
		}
		
		@discardableResult
		public func bulkNamesToIDs(acceptLanguage: AcceptLanguage? = nil, language: Language? = nil, names: [String]) -> Future<ESI.Result<Universe.PostUniverseIdsOk>> {
			var esi = self.esi
			guard esi != nil else { return .init(.failure(ESIError.internalError)) }
			
			
			let body = try? JSONEncoder().encode(names)
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			if let v = acceptLanguage?.httpQuery {
				headers["Accept-Language"] = v
			}
			headers["Content-Type"] = "application/json"
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi!.server.rawValue))
			if let v = language?.httpQuery {
				query.append(URLQueryItem(name: "language", value: v))
			}
			
			let url = esi!.baseURL + "/v1/status/"
			let components = NSURLComponents(string: url)!
			components.queryItems = query
			
			let progress = Progress(totalUnitCount: 100)
			
			let promise = Promise<ESI.Result<Universe.PostUniverseIdsOk>>()
			esi!.perform { () -> DataRequest in
				return esi!.sessionManager.request(components.url!, method: .post, encoding: body ?? URLEncoding.default, headers: headers).downloadProgress { p in
					progress.completedUnitCount = Int64(p.fractionCompleted * 100)
				}.validateESI().responseESI { (response: DataResponse<Universe.PostUniverseIdsOk>) in
					promise.set(result: response.result, cached: 3600.0)
					esi = nil
				}
			}
			return promise.future
		}
		
		
		public struct SystemKills: Codable, Hashable {
			
			
			public var npcKills: Int
			public var podKills: Int
			public var shipKills: Int
			public var systemID: Int
			
			public init(npcKills: Int, podKills: Int, shipKills: Int, systemID: Int) {
				self.npcKills = npcKills
				self.podKills = podKills
				self.shipKills = shipKills
				self.systemID = systemID
			}
			
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
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
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
			
			
			public var bloodlineID: Int
			public var charisma: Int
			public var corporationID: Int
			public var localizedDescription: String
			public var intelligence: Int
			public var memory: Int
			public var name: String
			public var perception: Int
			public var raceID: Int
			public var shipTypeID: Int
			public var willpower: Int
			
			public init(bloodlineID: Int, charisma: Int, corporationID: Int, localizedDescription: String, intelligence: Int, memory: Int, name: String, perception: Int, raceID: Int, shipTypeID: Int, willpower: Int) {
				self.bloodlineID = bloodlineID
				self.charisma = charisma
				self.corporationID = corporationID
				self.localizedDescription = localizedDescription
				self.intelligence = intelligence
				self.memory = memory
				self.name = name
				self.perception = perception
				self.raceID = raceID
				self.shipTypeID = shipTypeID
				self.willpower = willpower
			}
			
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
			
			
			public var allianceID: Int
			public var localizedDescription: String
			public var name: String
			public var raceID: Int
			
			public init(allianceID: Int, localizedDescription: String, name: String, raceID: Int) {
				self.allianceID = allianceID
				self.localizedDescription = localizedDescription
				self.name = name
				self.raceID = raceID
			}
			
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
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
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
		
		
		public struct GetUniverseAsteroidBeltsAsteroidBeltIDNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: error?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Universe.GetUniverseAsteroidBeltsAsteroidBeltIDNotFound, rhs: Universe.GetUniverseAsteroidBeltsAsteroidBeltIDNotFound) -> Bool {
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
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
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
		
		
		public struct GetUniverseAsteroidBeltsAsteroidBeltIDOk: Codable, Hashable {
			
			public struct GetUniverseAsteroidBeltsAsteroidBeltIDPosition: Codable, Hashable {
				
				
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
				
				public static func ==(lhs: Universe.GetUniverseAsteroidBeltsAsteroidBeltIDOk.GetUniverseAsteroidBeltsAsteroidBeltIDPosition, rhs: Universe.GetUniverseAsteroidBeltsAsteroidBeltIDOk.GetUniverseAsteroidBeltsAsteroidBeltIDPosition) -> Bool {
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
			
			public var name: String
			public var position: Universe.GetUniverseAsteroidBeltsAsteroidBeltIDOk.GetUniverseAsteroidBeltsAsteroidBeltIDPosition
			public var systemID: Int
			
			public init(name: String, position: Universe.GetUniverseAsteroidBeltsAsteroidBeltIDOk.GetUniverseAsteroidBeltsAsteroidBeltIDPosition, systemID: Int) {
				self.name = name
				self.position = position
				self.systemID = systemID
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: name.hashValue)
				hashCombine(seed: &hash, value: position.hashValue)
				hashCombine(seed: &hash, value: systemID.hashValue)
				return hash
			}
			
			public static func ==(lhs: Universe.GetUniverseAsteroidBeltsAsteroidBeltIDOk, rhs: Universe.GetUniverseAsteroidBeltsAsteroidBeltIDOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
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
		
		
		public struct GetUniverseTypesTypeIDNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
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
			
			
			public var constellations: [Int]
			public var localizedDescription: String?
			public var name: String
			public var regionID: Int
			
			public init(constellations: [Int], localizedDescription: String?, name: String, regionID: Int) {
				self.constellations = constellations
				self.localizedDescription = localizedDescription
				self.name = name
				self.regionID = regionID
			}
			
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
				
				
				public var effectID: Int
				public var isDefault: Bool
				
				public init(effectID: Int, isDefault: Bool) {
					self.effectID = effectID
					self.isDefault = isDefault
				}
				
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
				
				
				public var attributeID: Int
				public var value: Float
				
				public init(attributeID: Int, value: Float) {
					self.attributeID = attributeID
					self.value = value
				}
				
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
			
			public var capacity: Float?
			public var localizedDescription: String
			public var dogmaAttributes: [Universe.TypeInformation.GetUniverseTypesTypeIDDogmaAttributes]?
			public var dogmaEffects: [Universe.TypeInformation.GetUniverseTypesTypeIDDogmaEffects]?
			public var graphicID: Int?
			public var groupID: Int
			public var iconID: Int?
			public var marketGroupID: Int?
			public var mass: Float?
			public var name: String
			public var packagedVolume: Float?
			public var portionSize: Int?
			public var published: Bool
			public var radius: Float?
			public var typeID: Int
			public var volume: Float?
			
			public init(capacity: Float?, localizedDescription: String, dogmaAttributes: [Universe.TypeInformation.GetUniverseTypesTypeIDDogmaAttributes]?, dogmaEffects: [Universe.TypeInformation.GetUniverseTypesTypeIDDogmaEffects]?, graphicID: Int?, groupID: Int, iconID: Int?, marketGroupID: Int?, mass: Float?, name: String, packagedVolume: Float?, portionSize: Int?, published: Bool, radius: Float?, typeID: Int, volume: Float?) {
				self.capacity = capacity
				self.localizedDescription = localizedDescription
				self.dogmaAttributes = dogmaAttributes
				self.dogmaEffects = dogmaEffects
				self.graphicID = graphicID
				self.groupID = groupID
				self.iconID = iconID
				self.marketGroupID = marketGroupID
				self.mass = mass
				self.name = name
				self.packagedVolume = packagedVolume
				self.portionSize = portionSize
				self.published = published
				self.radius = radius
				self.typeID = typeID
				self.volume = volume
			}
			
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
			
			public var category: Universe.Name.Category
			public var id: Int
			public var name: String
			
			public init(category: Universe.Name.Category, id: Int, name: String) {
				self.category = category
				self.id = id
				self.name = name
			}
			
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
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
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
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
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
				
				
				public var stargateID: Int
				public var systemID: Int
				
				public init(stargateID: Int, systemID: Int) {
					self.stargateID = stargateID
					self.systemID = systemID
				}
				
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
			
			public var destination: Universe.StargateInformation.GetUniverseStargatesStargateIDDestination
			public var name: String
			public var position: Universe.StargateInformation.GetUniverseStargatesStargateIDPosition
			public var stargateID: Int
			public var systemID: Int
			public var typeID: Int
			
			public init(destination: Universe.StargateInformation.GetUniverseStargatesStargateIDDestination, name: String, position: Universe.StargateInformation.GetUniverseStargatesStargateIDPosition, stargateID: Int, systemID: Int, typeID: Int) {
				self.destination = destination
				self.name = name
				self.position = position
				self.stargateID = stargateID
				self.systemID = systemID
				self.typeID = typeID
			}
			
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
			
			public var age: Int64
			public var luminosity: Float
			public var name: String
			public var radius: Int64
			public var solarSystemID: Int
			public var spectralClass: Universe.GetUniverseStarsStarIDOk.GetUniverseStarsStarIDSpectralClass
			public var temperature: Int
			public var typeID: Int
			
			public init(age: Int64, luminosity: Float, name: String, radius: Int64, solarSystemID: Int, spectralClass: Universe.GetUniverseStarsStarIDOk.GetUniverseStarsStarIDSpectralClass, temperature: Int, typeID: Int) {
				self.age = age
				self.luminosity = luminosity
				self.name = name
				self.radius = radius
				self.solarSystemID = solarSystemID
				self.spectralClass = spectralClass
				self.temperature = temperature
				self.typeID = typeID
			}
			
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
			
			
			public var categoryID: Int
			public var groups: [Int]
			public var name: String
			public var published: Bool
			
			public init(categoryID: Int, groups: [Int], name: String, published: Bool) {
				self.categoryID = categoryID
				self.groups = groups
				self.name = name
				self.published = published
			}
			
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
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
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
			
			
			public var collisionFile: String?
			public var graphicFile: String?
			public var graphicID: Int
			public var iconFolder: String?
			public var sofDna: String?
			public var sofFationName: String?
			public var sofHullName: String?
			public var sofRaceName: String?
			
			public init(collisionFile: String?, graphicFile: String?, graphicID: Int, iconFolder: String?, sofDna: String?, sofFationName: String?, sofHullName: String?, sofRaceName: String?) {
				self.collisionFile = collisionFile
				self.graphicFile = graphicFile
				self.graphicID = graphicID
				self.iconFolder = iconFolder
				self.sofDna = sofDna
				self.sofFationName = sofFationName
				self.sofHullName = sofHullName
				self.sofRaceName = sofRaceName
			}
			
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
		
		
		public struct Jump: Codable, Hashable {
			
			
			public var shipJumps: Int
			public var systemID: Int
			
			public init(shipJumps: Int, systemID: Int) {
				self.shipJumps = shipJumps
				self.systemID = systemID
			}
			
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
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
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
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
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
				
				
				public var id: Int?
				public var name: String?
				
				public init(id: Int?, name: String?) {
					self.id = id
					self.name = name
				}
				
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
				
				
				public var id: Int?
				public var name: String?
				
				public init(id: Int?, name: String?) {
					self.id = id
					self.name = name
				}
				
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
				
				
				public var id: Int?
				public var name: String?
				
				public init(id: Int?, name: String?) {
					self.id = id
					self.name = name
				}
				
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
				
				
				public var id: Int?
				public var name: String?
				
				public init(id: Int?, name: String?) {
					self.id = id
					self.name = name
				}
				
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
				
				
				public var id: Int?
				public var name: String?
				
				public init(id: Int?, name: String?) {
					self.id = id
					self.name = name
				}
				
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
				
				
				public var id: Int?
				public var name: String?
				
				public init(id: Int?, name: String?) {
					self.id = id
					self.name = name
				}
				
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
				
				
				public var id: Int?
				public var name: String?
				
				public init(id: Int?, name: String?) {
					self.id = id
					self.name = name
				}
				
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
				
				
				public var id: Int?
				public var name: String?
				
				public init(id: Int?, name: String?) {
					self.id = id
					self.name = name
				}
				
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
				
				
				public var id: Int?
				public var name: String?
				
				public init(id: Int?, name: String?) {
					self.id = id
					self.name = name
				}
				
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
				
				
				public var id: Int?
				public var name: String?
				
				public init(id: Int?, name: String?) {
					self.id = id
					self.name = name
				}
				
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
			
			public var agents: [Universe.PostUniverseIdsOk.PostUniverseIdsAgents]?
			public var alliances: [Universe.PostUniverseIdsOk.PostUniverseIdsAlliances]?
			public var characters: [Universe.PostUniverseIdsOk.PostUniverseIdsCharacters]?
			public var constellations: [Universe.PostUniverseIdsOk.PostUniverseIdsConstellations]?
			public var corporations: [Universe.PostUniverseIdsOk.PostUniverseIdsCorporations]?
			public var factions: [Universe.PostUniverseIdsOk.PostUniverseIdsFactions]?
			public var inventoryTypes: [Universe.PostUniverseIdsOk.PostUniverseIdsInventoryTypes]?
			public var regions: [Universe.PostUniverseIdsOk.PostUniverseIdsRegions]?
			public var stations: [Universe.PostUniverseIdsOk.PostUniverseIdsStations]?
			public var systems: [Universe.PostUniverseIdsOk.PostUniverseIdsSystems]?
			
			public init(agents: [Universe.PostUniverseIdsOk.PostUniverseIdsAgents]?, alliances: [Universe.PostUniverseIdsOk.PostUniverseIdsAlliances]?, characters: [Universe.PostUniverseIdsOk.PostUniverseIdsCharacters]?, constellations: [Universe.PostUniverseIdsOk.PostUniverseIdsConstellations]?, corporations: [Universe.PostUniverseIdsOk.PostUniverseIdsCorporations]?, factions: [Universe.PostUniverseIdsOk.PostUniverseIdsFactions]?, inventoryTypes: [Universe.PostUniverseIdsOk.PostUniverseIdsInventoryTypes]?, regions: [Universe.PostUniverseIdsOk.PostUniverseIdsRegions]?, stations: [Universe.PostUniverseIdsOk.PostUniverseIdsStations]?, systems: [Universe.PostUniverseIdsOk.PostUniverseIdsSystems]?) {
				self.agents = agents
				self.alliances = alliances
				self.characters = characters
				self.constellations = constellations
				self.corporations = corporations
				self.factions = factions
				self.inventoryTypes = inventoryTypes
				self.regions = regions
				self.stations = stations
				self.systems = systems
			}
			
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
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
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
			
			public var constellationID: Int
			public var name: String
			public var position: Universe.ConstellationInformation.GetUniverseConstellationsConstellationIDPosition
			public var regionID: Int
			public var systems: [Int]
			
			public init(constellationID: Int, name: String, position: Universe.ConstellationInformation.GetUniverseConstellationsConstellationIDPosition, regionID: Int, systems: [Int]) {
				self.constellationID = constellationID
				self.name = name
				self.position = position
				self.regionID = regionID
				self.systems = systems
			}
			
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
		
		
		public struct GetUniverseAncestriesOk: Codable, Hashable {
			
			
			public var bloodlineID: Int
			public var localizedDescription: String
			public var iconID: Int?
			public var id: Int
			public var name: String
			public var shortDescription: String?
			
			public init(bloodlineID: Int, localizedDescription: String, iconID: Int?, id: Int, name: String, shortDescription: String?) {
				self.bloodlineID = bloodlineID
				self.localizedDescription = localizedDescription
				self.iconID = iconID
				self.id = id
				self.name = name
				self.shortDescription = shortDescription
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: bloodlineID.hashValue)
				hashCombine(seed: &hash, value: localizedDescription.hashValue)
				hashCombine(seed: &hash, value: iconID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: id.hashValue)
				hashCombine(seed: &hash, value: name.hashValue)
				hashCombine(seed: &hash, value: shortDescription?.hashValue ?? 0)
				return hash
			}
			
			public static func ==(lhs: Universe.GetUniverseAncestriesOk, rhs: Universe.GetUniverseAncestriesOk) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case bloodlineID = "bloodline_id"
				case localizedDescription = "description"
				case iconID = "icon_id"
				case id
				case name
				case shortDescription = "short_description"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct MoonInformation: Codable, Hashable {
			
			public struct GetUniverseMoonsMoonIDPosition: Codable, Hashable {
				
				
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
			
			public var moonID: Int
			public var name: String
			public var position: Universe.MoonInformation.GetUniverseMoonsMoonIDPosition
			public var systemID: Int
			
			public init(moonID: Int, name: String, position: Universe.MoonInformation.GetUniverseMoonsMoonIDPosition, systemID: Int) {
				self.moonID = moonID
				self.name = name
				self.position = position
				self.systemID = systemID
			}
			
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
			
			public var name: String
			public var ownerID: Int
			public var position: Universe.StructureInformation.GetUniverseStructuresStructureIDPosition?
			public var solarSystemID: Int
			public var typeID: Int?
			
			public init(name: String, ownerID: Int, position: Universe.StructureInformation.GetUniverseStructuresStructureIDPosition?, solarSystemID: Int, typeID: Int?) {
				self.name = name
				self.ownerID = ownerID
				self.position = position
				self.solarSystemID = solarSystemID
				self.typeID = typeID
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: name.hashValue)
				hashCombine(seed: &hash, value: ownerID.hashValue)
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
				case ownerID = "owner_id"
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
			
			
			public var categoryID: Int
			public var groupID: Int
			public var name: String
			public var published: Bool
			public var types: [Int]
			
			public init(categoryID: Int, groupID: Int, name: String, published: Bool, types: [Int]) {
				self.categoryID = categoryID
				self.groupID = groupID
				self.name = name
				self.published = published
				self.types = types
			}
			
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
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
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
				
				
				public var asteroidBelts: [Int]?
				public var moons: [Int]?
				public var planetID: Int
				
				public init(asteroidBelts: [Int]?, moons: [Int]?, planetID: Int) {
					self.asteroidBelts = asteroidBelts
					self.moons = moons
					self.planetID = planetID
				}
				
				public var hashValue: Int {
					var hash: Int = 0
					self.asteroidBelts?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					self.moons?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					hashCombine(seed: &hash, value: planetID.hashValue)
					return hash
				}
				
				public static func ==(lhs: Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPlanets, rhs: Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPlanets) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case asteroidBelts = "asteroid_belts"
					case moons
					case planetID = "planet_id"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public var constellationID: Int
			public var name: String
			public var planets: [Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPlanets]?
			public var position: Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPosition
			public var securityClass: String?
			public var securityStatus: Float
			public var starID: Int?
			public var stargates: [Int]?
			public var stations: [Int]?
			public var systemID: Int
			
			public init(constellationID: Int, name: String, planets: [Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPlanets]?, position: Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPosition, securityClass: String?, securityStatus: Float, starID: Int?, stargates: [Int]?, stations: [Int]?, systemID: Int) {
				self.constellationID = constellationID
				self.name = name
				self.planets = planets
				self.position = position
				self.securityClass = securityClass
				self.securityStatus = securityStatus
				self.starID = starID
				self.stargates = stargates
				self.stations = stations
				self.systemID = systemID
			}
			
			public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: constellationID.hashValue)
				hashCombine(seed: &hash, value: name.hashValue)
				self.planets?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: position.hashValue)
				hashCombine(seed: &hash, value: securityClass?.hashValue ?? 0)
				hashCombine(seed: &hash, value: securityStatus.hashValue)
				hashCombine(seed: &hash, value: starID?.hashValue ?? 0)
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
			
			public var name: String
			public var planetID: Int
			public var position: Universe.PlanetInformation.GetUniversePlanetsPlanetIDPosition
			public var systemID: Int
			public var typeID: Int
			
			public init(name: String, planetID: Int, position: Universe.PlanetInformation.GetUniversePlanetsPlanetIDPosition, systemID: Int, typeID: Int) {
				self.name = name
				self.planetID = planetID
				self.position = position
				self.systemID = systemID
				self.typeID = typeID
			}
			
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
			
			public var maxDockableShipVolume: Float
			public var name: String
			public var officeRentalCost: Float
			public var owner: Int?
			public var position: Universe.StationInformation.GetUniverseStationsStationIDPosition
			public var raceID: Int?
			public var reprocessingEfficiency: Float
			public var reprocessingStationsTake: Float
			public var services: [Universe.StationInformation.GetUniverseStationsStationIDServices]
			public var stationID: Int
			public var systemID: Int
			public var typeID: Int
			
			public init(maxDockableShipVolume: Float, name: String, officeRentalCost: Float, owner: Int?, position: Universe.StationInformation.GetUniverseStationsStationIDPosition, raceID: Int?, reprocessingEfficiency: Float, reprocessingStationsTake: Float, services: [Universe.StationInformation.GetUniverseStationsStationIDServices], stationID: Int, systemID: Int, typeID: Int) {
				self.maxDockableShipVolume = maxDockableShipVolume
				self.name = name
				self.officeRentalCost = officeRentalCost
				self.owner = owner
				self.position = position
				self.raceID = raceID
				self.reprocessingEfficiency = reprocessingEfficiency
				self.reprocessingStationsTake = reprocessingStationsTake
				self.services = services
				self.stationID = stationID
				self.systemID = systemID
				self.typeID = typeID
			}
			
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
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
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
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
			}
			
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
			
			
			public var corporationID: Int?
			public var localizedDescription: String
			public var factionID: Int
			public var isUnique: Bool
			public var militiaCorporationID: Int?
			public var name: String
			public var sizeFactor: Float
			public var solarSystemID: Int?
			public var stationCount: Int
			public var stationSystemCount: Int
			
			public init(corporationID: Int?, localizedDescription: String, factionID: Int, isUnique: Bool, militiaCorporationID: Int?, name: String, sizeFactor: Float, solarSystemID: Int?, stationCount: Int, stationSystemCount: Int) {
				self.corporationID = corporationID
				self.localizedDescription = localizedDescription
				self.factionID = factionID
				self.isUnique = isUnique
				self.militiaCorporationID = militiaCorporationID
				self.name = name
				self.sizeFactor = sizeFactor
				self.solarSystemID = solarSystemID
				self.stationCount = stationCount
				self.stationSystemCount = stationSystemCount
			}
			
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
