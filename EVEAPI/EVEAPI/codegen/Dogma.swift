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
			
			
			public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Int], AFError> {
				do {
					
					
					
					
					var headers = HTTPHeaders()
					headers["Accept"] = "application/json"
					
					
					var query = [URLQueryItem]()
					query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
					
					
					let url = try route.asURL()
					var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
					components.queryItems = query
					
					return esi.session.publisher(components,
					method: .get,
					encoding: URLEncoding.default,
					headers: headers,
					interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
					.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
					.eraseToAnyPublisher()
					
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
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Success, AFError> {
					do {
						
						
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public let attributeID: Int
					public let defaultValue: Double?
					public let localizedDescription: String?
					public let displayName: String?
					public let highIsGood: Bool?
					public let iconID: Int?
					public let name: String?
					public let published: Bool?
					public let stackable: Bool?
					public let unitID: Int?
					
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
						
						
						public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Success, AFError> {
							do {
								
								
								
								
								var headers = HTTPHeaders()
								headers["Accept"] = "application/json"
								
								
								var query = [URLQueryItem]()
								query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
								
								
								let url = try route.asURL()
								var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
								components.queryItems = query
								
								return esi.session.publisher(components,
								method: .get,
								encoding: URLEncoding.default,
								headers: headers,
								interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
								.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
								.eraseToAnyPublisher()
								
							}
							catch {
								return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
							}
						}
						
						
						
						
						
						
						public struct Success: Codable, Hashable {
							
							
							public let createdBy: Int
							public let dogmaAttributes: [ESI.Dogma.DogmaAttribute]
							public let dogmaEffects: [ESI.Dogma.DogmaEffect]
							public let mutatorTypeID: Int
							public let sourceTypeID: Int
							
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
			
			
			public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<[Int], AFError> {
				do {
					
					
					
					
					var headers = HTTPHeaders()
					headers["Accept"] = "application/json"
					
					
					var query = [URLQueryItem]()
					query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
					
					
					let url = try route.asURL()
					var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
					components.queryItems = query
					
					return esi.session.publisher(components,
					method: .get,
					encoding: URLEncoding.default,
					headers: headers,
					interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
					.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
					.eraseToAnyPublisher()
					
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
				
				
				public func get(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) -> AnyPublisher<Success, AFError> {
					do {
						
						
						
						
						var headers = HTTPHeaders()
						headers["Accept"] = "application/json"
						
						
						var query = [URLQueryItem]()
						query.append(URLQueryItem(name: "datasource", value: esi.server.rawValue))
						
						
						let url = try route.asURL()
						var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
						components.queryItems = query
						
						return esi.session.publisher(components,
						method: .get,
						encoding: URLEncoding.default,
						headers: headers,
						interceptor: CachePolicyAdapter(cachePolicy: cachePolicy))
						.responseDecodable(queue: esi.session.serializationQueue, decoder: ESI.jsonDecoder)
						.eraseToAnyPublisher()
						
					}
					catch {
						return Fail(error: AFError.createURLRequestFailed(error: error)).eraseToAnyPublisher()
					}
				}
				
				
				
				
				
				
				public struct Success: Codable, Hashable {
					
					
					public let localizedDescription: String?
					public let disallowAutoRepeat: Bool?
					public let dischargeAttributeID: Int?
					public let displayName: String?
					public let durationAttributeID: Int?
					public let effectCategory: Int?
					public let effectID: Int
					public let electronicChance: Bool?
					public let falloffAttributeID: Int?
					public let iconID: Int?
					public let isAssistance: Bool?
					public let isOffensive: Bool?
					public let isWarpSafe: Bool?
					public let modifiers: [ESI.Dogma.Effects.EffectID.Modifier]?
					public let name: String?
					public let postExpression: Int?
					public let preExpression: Int?
					public let published: Bool?
					public let rangeAttributeID: Int?
					public let rangeChance: Bool?
					public let trackingSpeedAttributeID: Int?
					
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
				
				public struct Modifier: Codable, Hashable {
					
					
					public let domain: String?
					public let effectID: Int?
					public let `func`: String
					public let modifiedAttributeID: Int?
					public let modifyingAttributeID: Int?
					public let `operator`: Int?
					
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
				
			}
			
			
			
		}
		
		
		public struct DogmaAttribute: Codable, Hashable {
			
			
			public let attributeID: Int
			public let value: Double
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case attributeID = "attribute_id"
				case value
				
				var dateFormatter: DateFormatter? {
					return nil
				}
			}
		}
		
		public struct DogmaEffect: Codable, Hashable {
			
			
			public let effectID: Int
			public let isDefault: Bool
			
			enum CodingKeys: String, CodingKey, DateFormatted {
				case effectID = "effect_id"
				case isDefault = "is_default"
				
				var dateFormatter: DateFormatter? {
					return nil
				}
			}
		}
		
	}
	
}
