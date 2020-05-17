import Foundation
import Alamofire
import Combine


extension ESI {
	public var contracts: Contracts {
		return Contracts(esi: self, route: .path("contracts", next: .root(ESI.apiURL)))
	}
	
	public struct Contracts {
		let esi: ESI
		let route: APIRoute
		
		
		
		public func `public`() -> Public {
			Public(esi: esi, route: .path("public", next: route))
		}
		
		public struct Public {
			let esi: ESI
			let route: APIRoute
			
			
			
			public func bids() -> Bids {
				Bids(esi: esi, route: .path("bids", next: route))
			}
			public func items() -> Items {
				Items(esi: esi, route: .path("items", next: route))
			}
			public func regionID(_ value: Int) -> RegionID {
				RegionID(esi: esi, route: .parameter(value, next: route))
			}
			
			public struct Bids {
				let esi: ESI
				let route: APIRoute
				
				
				
				public func contractID(_ value: Int) -> ContractID {
					ContractID(esi: esi, route: .parameter(value, next: route))
				}
				
				public struct ContractID {
					let esi: ESI
					let route: APIRoute
					
					
					public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Contracts.Public.Bids.ContractID.Success]>, AFError> {
						do {
							
							
							
							
							var headers = HTTPHeaders()
							headers["Accept"] = "application/json"
							
							
							var query = [URLQueryItem]()
							query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
							if let page = page {
								query.append(URLQueryItem(name: "page", value: page.description))
							}
							
							let url = try route.asURL()
							var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
							components.queryItems = query
							
							let session = esi.session
							
							return Deferred { () -> AnyPublisher<ESIResponse<[ESI.Contracts.Public.Bids.ContractID.Success]>, AFError> in
								var request = session.request(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
								
								if let progress = progress {
									request = request.downloadProgress(closure: progress)
								}
								
								return request.publishDecodable(queue: session.serializationQueue, decoder: ESI.jsonDecoder)
								.tryMap { response in
									try ESIResponse(value: response.result.get(), httpHeaders: response.response?.headers)
								}
								.mapError{$0 as! AFError}
								.handleEvents(receiveCompletion: { (_) in
									withExtendedLifetime(session) {}
								}).eraseToAnyPublisher()
							}.eraseToAnyPublisher()
						}
						catch {
							return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
						}
					}
					
					
					
					
					
					
					public struct Success: Codable, Hashable {
						
						
						public var amount: Double
						public var bidID: Int
						public var dateBid: Date
						public init(amount: Double, bidID: Int, dateBid: Date) {
							self.amount = amount
							self.bidID = bidID
							self.dateBid = dateBid
						}
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case amount
							case bidID = "bid_id"
							case dateBid = "date_bid"
							
							var dateFormatter: DateFormatter? {
								switch self {
									case .dateBid:
									return DateFormatter.esiDateTimeFormatter
									default:
									return nil
								}
							}
						}
					}
					
				}
				
				
				
			}
			
			public struct Items {
				let esi: ESI
				let route: APIRoute
				
				
				
				public func contractID(_ value: Int) -> ContractID {
					ContractID(esi: esi, route: .parameter(value, next: route))
				}
				
				public struct ContractID {
					let esi: ESI
					let route: APIRoute
					
					
					public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Contracts.Public.Items.ContractID.Success]>, AFError> {
						do {
							
							
							
							
							var headers = HTTPHeaders()
							headers["Accept"] = "application/json"
							
							
							var query = [URLQueryItem]()
							query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
							if let page = page {
								query.append(URLQueryItem(name: "page", value: page.description))
							}
							
							let url = try route.asURL()
							var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
							components.queryItems = query
							
							let session = esi.session
							
							return Deferred { () -> AnyPublisher<ESIResponse<[ESI.Contracts.Public.Items.ContractID.Success]>, AFError> in
								var request = session.request(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
								
								if let progress = progress {
									request = request.downloadProgress(closure: progress)
								}
								
								return request.publishDecodable(queue: session.serializationQueue, decoder: ESI.jsonDecoder)
								.tryMap { response in
									try ESIResponse(value: response.result.get(), httpHeaders: response.response?.headers)
								}
								.mapError{$0 as! AFError}
								.handleEvents(receiveCompletion: { (_) in
									withExtendedLifetime(session) {}
								}).eraseToAnyPublisher()
							}.eraseToAnyPublisher()
						}
						catch {
							return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
						}
					}
					
					
					
					
					
					
					public struct Success: Codable, Hashable {
						
						
						public var isBlueprintCopy: Bool?
						public var isIncluded: Bool
						public var itemID: Int64?
						public var materialEfficiency: Int?
						public var quantity: Int
						public var recordID: Int64
						public var runs: Int?
						public var timeEfficiency: Int?
						public var typeID: Int
						public init(isBlueprintCopy: Bool?, isIncluded: Bool, itemID: Int64?, materialEfficiency: Int?, quantity: Int, recordID: Int64, runs: Int?, timeEfficiency: Int?, typeID: Int) {
							self.isBlueprintCopy = isBlueprintCopy
							self.isIncluded = isIncluded
							self.itemID = itemID
							self.materialEfficiency = materialEfficiency
							self.quantity = quantity
							self.recordID = recordID
							self.runs = runs
							self.timeEfficiency = timeEfficiency
							self.typeID = typeID
						}
						
						enum CodingKeys: String, CodingKey, DateFormatted {
							case isBlueprintCopy = "is_blueprint_copy"
							case isIncluded = "is_included"
							case itemID = "item_id"
							case materialEfficiency = "material_efficiency"
							case quantity
							case recordID = "record_id"
							case runs
							case timeEfficiency = "time_efficiency"
							case typeID = "type_id"
							
							var dateFormatter: DateFormatter? {
								return nil
							}
						}
					}
					
				}
				
				
				
			}
			
			public struct RegionID {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[ESI.Contracts.Public.RegionID.Success]>, AFError> {
					do {
						
						
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						if let page = page {
							query.append(URLQueryItem(name: "page", value: page.description))
						}
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						let session = esi.session
						
						return Deferred { () -> AnyPublisher<ESIResponse<[ESI.Contracts.Public.RegionID.Success]>, AFError> in
							var request = session.request(components, method: .get, encoding: URLEncoding.default, headers: headers, interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
							
							if let progress = progress {
								request = request.downloadProgress(closure: progress)
							}
							
							return request.publishDecodable(queue: session.serializationQueue, decoder: ESI.jsonDecoder)
							.tryMap { response in
								try ESIResponse(value: response.result.get(), httpHeaders: response.response?.headers)
							}
							.mapError{$0 as! AFError}
							.handleEvents(receiveCompletion: { (_) in
								withExtendedLifetime(session) {}
							}).eraseToAnyPublisher()
						}.eraseToAnyPublisher()
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public var buyout: Double?
					public var collateral: Double?
					public var contractID: Int
					public var dateExpired: Date
					public var dateIssued: Date
					public var daysToComplete: Int?
					public var endLocationID: Int64?
					public var forCorporation: Bool?
					public var issuerCorporationID: Int
					public var issuerID: Int
					public var price: Double?
					public var reward: Double?
					public var startLocationID: Int64?
					public var title: String?
					public var type: ESI.Corporations.ValueType
					public var volume: Double?
					public init(buyout: Double?, collateral: Double?, contractID: Int, dateExpired: Date, dateIssued: Date, daysToComplete: Int?, endLocationID: Int64?, forCorporation: Bool?, issuerCorporationID: Int, issuerID: Int, price: Double?, reward: Double?, startLocationID: Int64?, title: String?, type: ESI.Corporations.ValueType, volume: Double?) {
						self.buyout = buyout
						self.collateral = collateral
						self.contractID = contractID
						self.dateExpired = dateExpired
						self.dateIssued = dateIssued
						self.daysToComplete = daysToComplete
						self.endLocationID = endLocationID
						self.forCorporation = forCorporation
						self.issuerCorporationID = issuerCorporationID
						self.issuerID = issuerID
						self.price = price
						self.reward = reward
						self.startLocationID = startLocationID
						self.title = title
						self.type = type
						self.volume = volume
					}
					
					enum CodingKeys: String, CodingKey, DateFormatted {
						case buyout
						case collateral
						case contractID = "contract_id"
						case dateExpired = "date_expired"
						case dateIssued = "date_issued"
						case daysToComplete = "days_to_complete"
						case endLocationID = "end_location_id"
						case forCorporation = "for_corporation"
						case issuerCorporationID = "issuer_corporation_id"
						case issuerID = "issuer_id"
						case price
						case reward
						case startLocationID = "start_location_id"
						case title
						case type
						case volume
						
						var dateFormatter: DateFormatter? {
							switch self {
								case .dateExpired:
								return DateFormatter.esiDateTimeFormatter
								case .dateIssued:
								return DateFormatter.esiDateTimeFormatter
								default:
								return nil
							}
						}
					}
				}
				
			}
			
			
			
		}
		
		
		
	}
	
}
