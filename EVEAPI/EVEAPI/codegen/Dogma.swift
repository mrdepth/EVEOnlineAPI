import Foundation
import Alamofire
import Combine


extension ESI {
	public var dogma: Dogma {
		return Dogma(esi: self)
	}
	
	public struct Dogma {
		let esi: ESI
		
		
		public func getAttributeInformation(attributeID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Dogma.Attribute, AFError> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/dogma/attributes/\(attributeID)/")
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
		
		
		public func getEffectInformation(effectID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Dogma.Effect, AFError> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/dogma/effects/\(effectID)/")
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
		
		
		public func getDynamicItemInformation(itemID: Int64, typeID: Int, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Dogma.GetDogmaDynamicItemsTypeIDItemIDOk, AFError> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/dogma/dynamic/items/\(typeID)/\(itemID)/")
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
		
		
		public func getEffects(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Int], AFError> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/dogma/effects/")
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
		
		
		public func getAttributes(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Int], AFError> {
			
			
			let body: Data? = nil
			
			var headers = HTTPHeaders()
			headers["Accept"] = "application/json"
			
			
			var query = [URLQueryItem]()
			query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
			
			
			        let url = ESI.apiURL.appendingPathComponent("/dogma/attributes/")
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
		
		
		public struct GetDogmaAttributesAttributeIDNotFound: Codable, Hashable {
			
			
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
		
		
		public struct Attribute: Codable, Hashable {
			
			
			public var attributeID: Int
			public var defaultValue: Float?
			public var localizedDescription: String?
			public var displayName: String?
			public var highIsGood: Bool?
			public var iconID: Int?
			public var name: String?
			public var published: Bool?
			public var stackable: Bool?
			public var unitID: Int?
			
			public init(attributeID: Int, defaultValue: Float?, localizedDescription: String?, displayName: String?, highIsGood: Bool?, iconID: Int?, name: String?, published: Bool?, stackable: Bool?, unitID: Int?) {
				self.attributeID = attributeID
				self.defaultValue = defaultValue
				self.localizedDescription = localizedDescription
				self.displayName = displayName
				self.highIsGood = highIsGood
				self.iconID = iconID
				self.name = name
				self.published = published
				self.stackable = stackable
				self.unitID = unitID
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case attributeID = "attribute_id"
				case defaultValue = "default_value"
				case localizedDescription = "description"
				case displayName = "display_name"
				case highIsGood = "high_is_good"
				case iconID = "icon_id"
				case name
				case published
				case stackable
				case unitID = "unit_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct Effect: Codable, Hashable {
			
			public struct GetDogmaEffectsEffectIDModifiers: Codable, Hashable {
				
				
				public var domain: String?
				public var effectID: Int?
				public var `func`: String
				public var modifiedAttributeID: Int?
				public var modifyingAttributeID: Int?
				public var `operator`: Int?
				
				public init(domain: String?, effectID: Int?, `func`: String, modifiedAttributeID: Int?, modifyingAttributeID: Int?, `operator`: Int?) {
					self.domain = domain
					self.effectID = effectID
					self.`func` = `func`
					self.modifiedAttributeID = modifiedAttributeID
					self.modifyingAttributeID = modifyingAttributeID
					self.`operator` = `operator`
				}
				
				enum CodingKeys: String, CodingKey, DateFormatted {
					case domain
					case effectID = "effect_id"
					case `func` = "func"
					case modifiedAttributeID = "modified_attribute_id"
					case modifyingAttributeID = "modifying_attribute_id"
					case `operator` = "operator"
					
					var dateFormatter: DateFormatter? {
						switch self {
							
							default: return nil
						}
					}
				}
			}
			
			public var localizedDescription: String?
			public var disallowAutoRepeat: Bool?
			public var dischargeAttributeID: Int?
			public var displayName: String?
			public var durationAttributeID: Int?
			public var effectCategory: Int?
			public var effectID: Int
			public var electronicChance: Bool?
			public var falloffAttributeID: Int?
			public var iconID: Int?
			public var isAssistance: Bool?
			public var isOffensive: Bool?
			public var isWarpSafe: Bool?
			public var modifiers: [Dogma.Effect.GetDogmaEffectsEffectIDModifiers]?
			public var name: String?
			public var postExpression: Int?
			public var preExpression: Int?
			public var published: Bool?
			public var rangeAttributeID: Int?
			public var rangeChance: Bool?
			public var trackingSpeedAttributeID: Int?
			
			public init(localizedDescription: String?, disallowAutoRepeat: Bool?, dischargeAttributeID: Int?, displayName: String?, durationAttributeID: Int?, effectCategory: Int?, effectID: Int, electronicChance: Bool?, falloffAttributeID: Int?, iconID: Int?, isAssistance: Bool?, isOffensive: Bool?, isWarpSafe: Bool?, modifiers: [Dogma.Effect.GetDogmaEffectsEffectIDModifiers]?, name: String?, postExpression: Int?, preExpression: Int?, published: Bool?, rangeAttributeID: Int?, rangeChance: Bool?, trackingSpeedAttributeID: Int?) {
				self.localizedDescription = localizedDescription
				self.disallowAutoRepeat = disallowAutoRepeat
				self.dischargeAttributeID = dischargeAttributeID
				self.displayName = displayName
				self.durationAttributeID = durationAttributeID
				self.effectCategory = effectCategory
				self.effectID = effectID
				self.electronicChance = electronicChance
				self.falloffAttributeID = falloffAttributeID
				self.iconID = iconID
				self.isAssistance = isAssistance
				self.isOffensive = isOffensive
				self.isWarpSafe = isWarpSafe
				self.modifiers = modifiers
				self.name = name
				self.postExpression = postExpression
				self.preExpression = preExpression
				self.published = published
				self.rangeAttributeID = rangeAttributeID
				self.rangeChance = rangeChance
				self.trackingSpeedAttributeID = trackingSpeedAttributeID
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case localizedDescription = "description"
				case disallowAutoRepeat = "disallow_auto_repeat"
				case dischargeAttributeID = "discharge_attribute_id"
				case displayName = "display_name"
				case durationAttributeID = "duration_attribute_id"
				case effectCategory = "effect_category"
				case effectID = "effect_id"
				case electronicChance = "electronic_chance"
				case falloffAttributeID = "falloff_attribute_id"
				case iconID = "icon_id"
				case isAssistance = "is_assistance"
				case isOffensive = "is_offensive"
				case isWarpSafe = "is_warp_safe"
				case modifiers
				case name
				case postExpression = "post_expression"
				case preExpression = "pre_expression"
				case published
				case rangeAttributeID = "range_attribute_id"
				case rangeChance = "range_chance"
				case trackingSpeedAttributeID = "tracking_speed_attribute_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetDogmaEffectsEffectIDNotFound: Codable, Hashable {
			
			
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
		
		
		public struct GetDogmaDynamicItemsTypeIDItemIDOk: Codable, Hashable {
			
			public struct GetDogmaDynamicItemsTypeIDItemIDDogmaEffects: Codable, Hashable {
				
				
				public var effectID: Int
				public var isDefault: Bool
				
				public init(effectID: Int, isDefault: Bool) {
					self.effectID = effectID
					self.isDefault = isDefault
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
			
			public struct GetDogmaDynamicItemsTypeIDItemIDDogmaAttributes: Codable, Hashable {
				
				
				public var attributeID: Int
				public var value: Float
				
				public init(attributeID: Int, value: Float) {
					self.attributeID = attributeID
					self.value = value
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
			
			public var createdBy: Int
			public var dogmaAttributes: [Dogma.GetDogmaDynamicItemsTypeIDItemIDOk.GetDogmaDynamicItemsTypeIDItemIDDogmaAttributes]
			public var dogmaEffects: [Dogma.GetDogmaDynamicItemsTypeIDItemIDOk.GetDogmaDynamicItemsTypeIDItemIDDogmaEffects]
			public var mutatorTypeID: Int
			public var sourceTypeID: Int
			
			public init(createdBy: Int, dogmaAttributes: [Dogma.GetDogmaDynamicItemsTypeIDItemIDOk.GetDogmaDynamicItemsTypeIDItemIDDogmaAttributes], dogmaEffects: [Dogma.GetDogmaDynamicItemsTypeIDItemIDOk.GetDogmaDynamicItemsTypeIDItemIDDogmaEffects], mutatorTypeID: Int, sourceTypeID: Int) {
				self.createdBy = createdBy
				self.dogmaAttributes = dogmaAttributes
				self.dogmaEffects = dogmaEffects
				self.mutatorTypeID = mutatorTypeID
				self.sourceTypeID = sourceTypeID
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case createdBy = "created_by"
				case dogmaAttributes = "dogma_attributes"
				case dogmaEffects = "dogma_effects"
				case mutatorTypeID = "mutator_type_id"
				case sourceTypeID = "source_type_id"
				
				var dateFormatter: DateFormatter? {
					switch self {
						
						default: return nil
					}
				}
			}
		}
		
		
		public struct GetDogmaDynamicItemsTypeIDItemIDNotFound: Codable, Hashable {
			
			
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
		
		
	}
	
}
