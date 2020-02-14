import Foundation
import Alamofire
import Combine


extension ESI {
	public var dogma: Dogma {
		return Dogma(esi: self, route: .path("dogma", next: .root(ESI.apiURL)))
	}
	
	public struct Dogma {
		let esi: ESI
		let route: APIRoute
		
		
		
		public func attributes() -> Attributes {
			Attributes(esi: esi, route: .path("attributes", next: route))
		}
		public func dynamic() -> Dynamic {
			Dynamic(esi: esi, route: .path("dynamic", next: route))
		}
		public func effects() -> Effects {
			Effects(esi: esi, route: .path("effects", next: route))
		}
		
		public struct Attributes {
			let esi: ESI
			let route: APIRoute
			
			
			public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[Int]>, AFError> {
				do {
					
					
					
					
					var headers = HTTPHeaders()
					headers["Accept"] = "application/json"
					
					
					var query = [URLQueryItem]()
					query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
					
					
					let url = try route.asURL()
					var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
					components.queryItems = query
					
					let publisher = esi.session.publisher(components,
					method: .get,
					encoding: URLEncoding.default,
					headers: headers,
					interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
					if let progress = progress {
						return publisher
						.downloadProgress(closure: progress)
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
					else {
						return publisher
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
				}
				catch {
					return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
				}
			}
			
			
			public func attributeID(_ value: Int) -> AttributeID {
				AttributeID(esi: esi, route: .parameter(value, next: route))
			}
			
			public struct AttributeID {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<Success>, AFError> {
					do {
						
						
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						let publisher = esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						if let progress = progress {
							return publisher
							.downloadProgress(closure: progress)
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
						}
						else {
							return publisher
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
						}
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public var attributeID: Int
					public var defaultValue: Double?
					public var localizedDescription: String?
					public var displayName: String?
					public var highIsGood: Bool?
					public var iconID: Int?
					public var name: String?
					public var published: Bool?
					public var stackable: Bool?
					public var unitID: Int?
					public init(attributeID: Int, defaultValue: Double?, localizedDescription: String?, displayName: String?, highIsGood: Bool?, iconID: Int?, name: String?, published: Bool?, stackable: Bool?, unitID: Int?) {
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
							return nil
						}
					}
				}
				
			}
			
			
			
		}
		
		public struct Dynamic {
			let esi: ESI
			let route: APIRoute
			
			
			
			public func items() -> Items {
				Items(esi: esi, route: .path("items", next: route))
			}
			
			public struct Items {
				let esi: ESI
				let route: APIRoute
				
				
				
				public func typeID(_ value: Int) -> TypeID {
					TypeID(esi: esi, route: .parameter(value, next: route))
				}
				
				public struct TypeID {
					let esi: ESI
					let route: APIRoute
					
					
					
					public func itemID(_ value: Int64) -> ItemID {
						ItemID(esi: esi, route: .parameter(value, next: route))
					}
					
					public struct ItemID {
						let esi: ESI
						let route: APIRoute
						
						
						public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<Success>, AFError> {
							do {
								
								
								
								
								var headers = HTTPHeaders()
								headers["Accept"] = "application/json"
								
								
								var query = [URLQueryItem]()
								query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
								
								
								let url = try route.asURL()
								var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
								components.queryItems = query
								
								let publisher = esi.session.publisher(components,
								method: .get,
								encoding: URLEncoding.default,
								headers: headers,
								interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
								if let progress = progress {
									return publisher
									.downloadProgress(closure: progress)
									.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
									.eraseToAnyPublisher()
								}
								else {
									return publisher
									.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
									.eraseToAnyPublisher()
								}
							}
							catch {
								return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
							}
						}
						
						
						
						
						
						
						public struct Success: Codable, Hashable {
							
							
							public var createdBy: Int
							public var dogmaAttributes: [ESI.Dogma.DogmaAttribute]
							public var dogmaEffects: [ESI.Dogma.DogmaEffect]
							public var mutatorTypeID: Int
							public var sourceTypeID: Int
							public init(createdBy: Int, dogmaAttributes: [ESI.Dogma.DogmaAttribute], dogmaEffects: [ESI.Dogma.DogmaEffect], mutatorTypeID: Int, sourceTypeID: Int) {
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
									return nil
								}
							}
						}
						
					}
					
					
					
				}
				
				
				
			}
			
			
			
		}
		
		public struct Effects {
			let esi: ESI
			let route: APIRoute
			
			
			public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<[Int]>, AFError> {
				do {
					
					
					
					
					var headers = HTTPHeaders()
					headers["Accept"] = "application/json"
					
					
					var query = [URLQueryItem]()
					query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
					
					
					let url = try route.asURL()
					var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
					components.queryItems = query
					
					let publisher = esi.session.publisher(components,
					method: .get,
					encoding: URLEncoding.default,
					headers: headers,
					interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
					if let progress = progress {
						return publisher
						.downloadProgress(closure: progress)
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
					else {
						return publisher
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
					}
				}
				catch {
					return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
				}
			}
			
			
			public func effectID(_ value: Int) -> EffectID {
				EffectID(esi: esi, route: .parameter(value, next: route))
			}
			
			public struct EffectID {
				let esi: ESI
				let route: APIRoute
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, progress: Request.ProgressHandler? = nil) -> AnyPublisher<ESIResponse<Success>, AFError> {
					do {
						
						
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						let publisher = esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						if let progress = progress {
							return publisher
							.downloadProgress(closure: progress)
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
						}
						else {
							return publisher
							.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
							.eraseToAnyPublisher()
						}
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Modifier: Codable, Hashable {
					
					
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
							return nil
						}
					}
				}
				
				public struct Success: Codable, Hashable {
					
					
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
					public var modifiers: [ESI.Dogma.Effects.EffectID.Modifier]?
					public var name: String?
					public var postExpression: Int?
					public var preExpression: Int?
					public var published: Bool?
					public var rangeAttributeID: Int?
					public var rangeChance: Bool?
					public var trackingSpeedAttributeID: Int?
					public init(localizedDescription: String?, disallowAutoRepeat: Bool?, dischargeAttributeID: Int?, displayName: String?, durationAttributeID: Int?, effectCategory: Int?, effectID: Int, electronicChance: Bool?, falloffAttributeID: Int?, iconID: Int?, isAssistance: Bool?, isOffensive: Bool?, isWarpSafe: Bool?, modifiers: [ESI.Dogma.Effects.EffectID.Modifier]?, name: String?, postExpression: Int?, preExpression: Int?, published: Bool?, rangeAttributeID: Int?, rangeChance: Bool?, trackingSpeedAttributeID: Int?) {
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
							return nil
						}
					}
				}
				
			}
			
			
			
		}
		
		
		public struct DogmaEffect: Codable, Hashable {
			
			
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
					return nil
				}
			}
		}
		
		public struct DogmaAttribute: Codable, Hashable {
			
			
			public var attributeID: Int
			public var value: Double
			public init(attributeID: Int, value: Double) {
				self.attributeID = attributeID
				self.value = value
			}
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case attributeID = "attribute_id"
				case value
				
				var dateFormatter: DateFormatter? {
					return nil
				}
			}
		}
		
	}
	
}
