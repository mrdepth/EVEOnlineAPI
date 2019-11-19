import Foundation
import Alamofire
import Combine


extension ESI {
	public var contracts: Contracts {
		return Contracts(esi: self)
	}
	
	public struct Contracts {
		let esi: ESI
		
		
		public func getContracts(characterID: Int, page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Contracts.Contract], AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-contracts.read_character_contracts.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = page?.description {
				query.append(URLQueryItem(name: "page", value: v.lazy.map{$0.description}.joined(separator: ",")))
			}
			
			        let url = ESI.apiURL.appendingPathComponent("/characters/\(characterID)/contracts/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .get,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
			            .eraseToAnyPublisher()
		}
		
		
		public func getPublicContractItems(contractID: Int, page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Contracts.GetContractsPublicItemsContractIDOk], AFError> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = page?.description {
				query.append(URLQueryItem(name: "page", value: v.lazy.map{$0.description}.joined(separator: ",")))
			}
			
			        let url = ESI.apiURL.appendingPathComponent("/contracts/public/items/\(contractID)/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .get,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
			            .eraseToAnyPublisher()
		}
		
		
		public func getCorporationContractItems(contractID: Int, corporationID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Contracts.GetCorporationsCorporationIDContractsContractIDItemsOk], AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-contracts.read_corporation_contracts.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/corporations/\(corporationID)/contracts/\(contractID)/items/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .get,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
			            .eraseToAnyPublisher()
		}
		
		
		public func getPublicContracts(page: Int? = nil, regionID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Contracts.GetContractsPublicRegionIDOk], AFError> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = page?.description {
				query.append(URLQueryItem(name: "page", value: v.lazy.map{$0.description}.joined(separator: ",")))
			}
			
			        let url = ESI.apiURL.appendingPathComponent("/contracts/public/\(regionID)/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .get,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
			            .eraseToAnyPublisher()
		}
		
		
		public func getCorporationContractBids(contractID: Int, corporationID: Int, page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Contracts.GetCorporationsCorporationIDContractsContractIDBidsOk], AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-contracts.read_corporation_contracts.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = page?.description {
				query.append(URLQueryItem(name: "page", value: v.lazy.map{$0.description}.joined(separator: ",")))
			}
			
			        let url = ESI.apiURL.appendingPathComponent("/corporations/\(corporationID)/contracts/\(contractID)/bids/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .get,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
			            .eraseToAnyPublisher()
		}
		
		
		public func getContractBids(characterID: Int, contractID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Contracts.Bid], AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-contracts.read_character_contracts.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/characters/\(characterID)/contracts/\(contractID)/bids/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .get,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
			            .eraseToAnyPublisher()
		}
		
		
		public func getContractItems(characterID: Int, contractID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Contracts.Item], AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-contracts.read_character_contracts.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/characters/\(characterID)/contracts/\(contractID)/items/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .get,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
			            .eraseToAnyPublisher()
		}
		
		
		public func getPublicContractBids(contractID: Int, page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Contracts.GetContractsPublicBidsContractIDOk], AFError> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = page?.description {
				query.append(URLQueryItem(name: "page", value: v.lazy.map{$0.description}.joined(separator: ",")))
			}
			
			        let url = ESI.apiURL.appendingPathComponent("/contracts/public/bids/\(contractID)/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .get,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
			            .eraseToAnyPublisher()
		}
		
		
		public func getCorporationContracts(corporationID: Int, page: Int? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Contracts.GetCorporationsCorporationIDContractsOk], AFError> {
			
			let scopes = esi.token?.scopes ?? []
			guard scopes.contains("esi-contracts.read_corporation_contracts.v1") else {return Fail(error: AFError.createURLRequestFailed(error: ESIError.forbidden)).eraseToAnyPublisher()}
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			if let v = page?.description {
				query.append(URLQueryItem(name: "page", value: v.lazy.map{$0.description}.joined(separator: ",")))
			}
			
			        let url = ESI.apiURL.appendingPathComponent("/corporations/\(corporationID)/contracts/")
			var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
			components.queryItems = query
			
			        return esi.session.publisher(components,
			                                     method: .get,
			                                     encoding: body.map{BodyDataEncoding(data: $0)} ?? URLEncoding.default,
			                                     headers: headers,
			                                     interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
			            .responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
			            .eraseToAnyPublisher()
		}
		
		
		public struct GetContractsPublicItemsContractIDOk: Codable, Hashable {
			
			
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
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetContractsPublicRegionIDOk: Codable, Hashable {
			
			public enum GetContractsPublicRegionIDType: String, Codable, CustomStringConvertible {
				case auction = "auction"
				case courier = "courier"
				case itemExchange = "item_exchange"
				case loan = "loan"
				case unknown = "unknown"
				
				public var description: String {
					return rawValue
				}
				
			}
			
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
			public var type: Contracts.GetContractsPublicRegionIDOk.GetContractsPublicRegionIDType
			public var volume: Double?
			
			public init(buyout: Double?, collateral: Double?, contractID: Int, dateExpired: Date, dateIssued: Date, daysToComplete: Int?, endLocationID: Int64?, forCorporation: Bool?, issuerCorporationID: Int, issuerID: Int, price: Double?, reward: Double?, startLocationID: Int64?, title: String?, type: Contracts.GetContractsPublicRegionIDOk.GetContractsPublicRegionIDType, volume: Double?) {
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
						case .dateExpired: return DateFormatter.esiDateTimeFormatter
						case .dateIssued: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct Contract: Codable, Hashable {
			
			public enum Availability: String, Codable, CustomStringConvertible {
				case alliance = "alliance"
				case corporation = "corporation"
				case personal = "personal"
				case `public` = "public"
				
				public var description: String {
					return rawValue
				}
				
			}
			
			public enum Status: String, Codable, CustomStringConvertible {
				case cancelled = "cancelled"
				case deleted = "deleted"
				case failed = "failed"
				case finished = "finished"
				case finishedContractor = "finished_contractor"
				case finishedIssuer = "finished_issuer"
				case inProgress = "in_progress"
				case outstanding = "outstanding"
				case rejected = "rejected"
				case reversed = "reversed"
				
				public var description: String {
					return rawValue
				}
				
			}
			
			public enum ContractType: String, Codable, CustomStringConvertible {
				case auction = "auction"
				case courier = "courier"
				case itemExchange = "item_exchange"
				case loan = "loan"
				case unknown = "unknown"
				
				public var description: String {
					return rawValue
				}
				
			}
			
			public var acceptorID: Int
			public var assigneeID: Int
			public var availability: Contracts.Contract.Availability
			public var buyout: Double?
			public var collateral: Double?
			public var contractID: Int
			public var dateAccepted: Date?
			public var dateCompleted: Date?
			public var dateExpired: Date
			public var dateIssued: Date
			public var daysToComplete: Int?
			public var endLocationID: Int64?
			public var forCorporation: Bool
			public var issuerCorporationID: Int
			public var issuerID: Int
			public var price: Double?
			public var reward: Double?
			public var startLocationID: Int64?
			public var status: Contracts.Contract.Status
			public var title: String?
			public var type: Contracts.Contract.ContractType
			public var volume: Double?
			
			public init(acceptorID: Int, assigneeID: Int, availability: Contracts.Contract.Availability, buyout: Double?, collateral: Double?, contractID: Int, dateAccepted: Date?, dateCompleted: Date?, dateExpired: Date, dateIssued: Date, daysToComplete: Int?, endLocationID: Int64?, forCorporation: Bool, issuerCorporationID: Int, issuerID: Int, price: Double?, reward: Double?, startLocationID: Int64?, status: Contracts.Contract.Status, title: String?, type: Contracts.Contract.ContractType, volume: Double?) {
				self.acceptorID = acceptorID
				self.assigneeID = assigneeID
				self.availability = availability
				self.buyout = buyout
				self.collateral = collateral
				self.contractID = contractID
				self.dateAccepted = dateAccepted
				self.dateCompleted = dateCompleted
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
				self.status = status
				self.title = title
				self.type = type
				self.volume = volume
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case acceptorID = "acceptor_id"
				case assigneeID = "assignee_id"
				case availability
				case buyout
				case collateral
				case contractID = "contract_id"
				case dateAccepted = "date_accepted"
				case dateCompleted = "date_completed"
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
				case status
				case title
				case type
				case volume
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .dateAccepted: return DateFormatter.esiDateTimeFormatter
						case .dateCompleted: return DateFormatter.esiDateTimeFormatter
						case .dateExpired: return DateFormatter.esiDateTimeFormatter
						case .dateIssued: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCorporationsCorporationIDContractsContractIDItemsError520: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
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
		
		
		public struct GetCharactersCharacterIDContractsContractIDBidsNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
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
		
		
		public struct GetContractsPublicBidsContractIDOk: Codable, Hashable {
			
			
			public var amount: Float
			public var bidID: Int
			public var dateBid: Date
			
			public init(amount: Float, bidID: Int, dateBid: Date) {
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
						case .dateBid: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct Item: Codable, Hashable {
			
			
			public var isIncluded: Bool
			public var isSingleton: Bool
			public var quantity: Int
			public var rawQuantity: Int?
			public var recordID: Int64
			public var typeID: Int
			
			public init(isIncluded: Bool, isSingleton: Bool, quantity: Int, rawQuantity: Int?, recordID: Int64, typeID: Int) {
				self.isIncluded = isIncluded
				self.isSingleton = isSingleton
				self.quantity = quantity
				self.rawQuantity = rawQuantity
				self.recordID = recordID
				self.typeID = typeID
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case isIncluded = "is_included"
				case isSingleton = "is_singleton"
				case quantity
				case rawQuantity = "raw_quantity"
				case recordID = "record_id"
				case typeID = "type_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCorporationsCorporationIDContractsOk: Codable, Hashable {
			
			public enum GetCorporationsCorporationIDContractsStatus: String, Codable, CustomStringConvertible {
				case cancelled = "cancelled"
				case deleted = "deleted"
				case failed = "failed"
				case finished = "finished"
				case finishedContractor = "finished_contractor"
				case finishedIssuer = "finished_issuer"
				case inProgress = "in_progress"
				case outstanding = "outstanding"
				case rejected = "rejected"
				case reversed = "reversed"
				
				public var description: String {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDContractsAvailability: String, Codable, CustomStringConvertible {
				case alliance = "alliance"
				case corporation = "corporation"
				case personal = "personal"
				case `public` = "public"
				
				public var description: String {
					return rawValue
				}
				
			}
			
			public enum GetCorporationsCorporationIDContractsType: String, Codable, CustomStringConvertible {
				case auction = "auction"
				case courier = "courier"
				case itemExchange = "item_exchange"
				case loan = "loan"
				case unknown = "unknown"
				
				public var description: String {
					return rawValue
				}
				
			}
			
			public var acceptorID: Int
			public var assigneeID: Int
			public var availability: Contracts.GetCorporationsCorporationIDContractsOk.GetCorporationsCorporationIDContractsAvailability
			public var buyout: Double?
			public var collateral: Double?
			public var contractID: Int
			public var dateAccepted: Date?
			public var dateCompleted: Date?
			public var dateExpired: Date
			public var dateIssued: Date
			public var daysToComplete: Int?
			public var endLocationID: Int64?
			public var forCorporation: Bool
			public var issuerCorporationID: Int
			public var issuerID: Int
			public var price: Double?
			public var reward: Double?
			public var startLocationID: Int64?
			public var status: Contracts.GetCorporationsCorporationIDContractsOk.GetCorporationsCorporationIDContractsStatus
			public var title: String?
			public var type: Contracts.GetCorporationsCorporationIDContractsOk.GetCorporationsCorporationIDContractsType
			public var volume: Double?
			
			public init(acceptorID: Int, assigneeID: Int, availability: Contracts.GetCorporationsCorporationIDContractsOk.GetCorporationsCorporationIDContractsAvailability, buyout: Double?, collateral: Double?, contractID: Int, dateAccepted: Date?, dateCompleted: Date?, dateExpired: Date, dateIssued: Date, daysToComplete: Int?, endLocationID: Int64?, forCorporation: Bool, issuerCorporationID: Int, issuerID: Int, price: Double?, reward: Double?, startLocationID: Int64?, status: Contracts.GetCorporationsCorporationIDContractsOk.GetCorporationsCorporationIDContractsStatus, title: String?, type: Contracts.GetCorporationsCorporationIDContractsOk.GetCorporationsCorporationIDContractsType, volume: Double?) {
				self.acceptorID = acceptorID
				self.assigneeID = assigneeID
				self.availability = availability
				self.buyout = buyout
				self.collateral = collateral
				self.contractID = contractID
				self.dateAccepted = dateAccepted
				self.dateCompleted = dateCompleted
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
				self.status = status
				self.title = title
				self.type = type
				self.volume = volume
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case acceptorID = "acceptor_id"
				case assigneeID = "assignee_id"
				case availability
				case buyout
				case collateral
				case contractID = "contract_id"
				case dateAccepted = "date_accepted"
				case dateCompleted = "date_completed"
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
				case status
				case title
				case type
				case volume
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .dateAccepted: return DateFormatter.esiDateTimeFormatter
						case .dateCompleted: return DateFormatter.esiDateTimeFormatter
						case .dateExpired: return DateFormatter.esiDateTimeFormatter
						case .dateIssued: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct Bid: Codable, Hashable {
			
			
			public var amount: Float
			public var bidID: Int
			public var bidderID: Int
			public var dateBid: Date
			
			public init(amount: Float, bidID: Int, bidderID: Int, dateBid: Date) {
				self.amount = amount
				self.bidID = bidID
				self.bidderID = bidderID
				self.dateBid = dateBid
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case amount
				case bidID = "bid_id"
				case bidderID = "bidder_id"
				case dateBid = "date_bid"
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .dateBid: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetContractsPublicItemsContractIDNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
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
		
		
		public struct GetContractsPublicBidsContractIDForbidden: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
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
		
		
		public struct GetContractsPublicRegionIDNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
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
		
		
		public struct GetContractsPublicItemsContractIDForbidden: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
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
		
		
		public struct GetContractsPublicBidsContractIDNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
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
		
		
		public struct GetCorporationsCorporationIDContractsContractIDItemsOk: Codable, Hashable {
			
			
			public var isIncluded: Bool
			public var isSingleton: Bool
			public var quantity: Int
			public var rawQuantity: Int?
			public var recordID: Int64
			public var typeID: Int
			
			public init(isIncluded: Bool, isSingleton: Bool, quantity: Int, rawQuantity: Int?, recordID: Int64, typeID: Int) {
				self.isIncluded = isIncluded
				self.isSingleton = isSingleton
				self.quantity = quantity
				self.rawQuantity = rawQuantity
				self.recordID = recordID
				self.typeID = typeID
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case isIncluded = "is_included"
				case isSingleton = "is_singleton"
				case quantity
				case rawQuantity = "raw_quantity"
				case recordID = "record_id"
				case typeID = "type_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetCorporationsCorporationIDContractsContractIDItemsNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
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
		
		
		public struct GetCharactersCharacterIDContractsContractIDItemsNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
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
		
		
		public struct GetCorporationsCorporationIDContractsContractIDBidsNotFound: Codable, Hashable {
			
			
			public var error: String?
			
			public init(error: String?) {
				self.error = error
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
		
		
		public struct GetCorporationsCorporationIDContractsContractIDBidsOk: Codable, Hashable {
			
			
			public var amount: Float
			public var bidID: Int
			public var bidderID: Int
			public var dateBid: Date
			
			public init(amount: Float, bidID: Int, bidderID: Int, dateBid: Date) {
				self.amount = amount
				self.bidID = bidID
				self.bidderID = bidderID
				self.dateBid = dateBid
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case amount
				case bidID = "bid_id"
				case bidderID = "bidder_id"
				case dateBid = "date_bid"
				
				var dateFormatter: DateFormatter? {
					switch self {
						case .dateBid: return DateFormatter.esiDateTimeFormatter
						default: return nil
					}
				}
			}
		}
		
		
	}
	
}
