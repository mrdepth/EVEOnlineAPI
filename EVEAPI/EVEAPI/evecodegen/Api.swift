import Foundation
import Alamofire


public extension EVE {
	public var api: Api {
		return Api(sessionManager: self)
	}
	
	class Api {
		weak var sessionManager: EVE?
		
		init(sessionManager: EVE) {
			self.sessionManager = sessionManager
		}
		
		public func callList(completionBlock:((Result<EVE.Api.CallList>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let parameters = Parameters()
			
			let url = session!.baseURL + "Api/CallList.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Api.CallList>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		public class CallList: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Call: NSObject, Codable, NSCopying, JSONCoding {
				
				public enum CallType: String, JSONCoding, Codable {
					case character = "Character"
					case corporation = "Corporation"
					
					public init() {
						self = .character
					}
					
					public var json: Any {
						return self.rawValue
					}
					
					public init(json: Any) throws {
						guard let s = json as? String, let v = CallType(rawValue: s) else {throw EVEError.invalidFormat(Swift.type(of: self), json)}
						self = v
					}
					
				}
				
				public var accessMask: Int64 = Int64()
				public var callDescription: String = String()
				public var groupID: Int = Int()
				public var name: String = String()
				public var type: EVE.Api.CallList.Call.CallType = EVE.Api.CallList.Call.CallType()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let accessMask = dictionary["accessMask"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.accessMask = accessMask
					guard let callDescription = dictionary["description"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.callDescription = callDescription
					guard let groupID = dictionary["groupID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.groupID = groupID
					guard let name = dictionary["name"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.name = name
					guard let type = EVE.Api.CallList.Call.CallType(rawValue: dictionary["type"] as? String ?? String()) else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.type = type
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["accessMask"] = accessMask.json
					json["callDescription"] = callDescription.json
					json["groupID"] = groupID.json
					json["name"] = name.json
					json["type"] = type.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.accessMask.hashValue)
					hashCombine(seed: &hash, value: self.callDescription.hashValue)
					hashCombine(seed: &hash, value: self.groupID.hashValue)
					hashCombine(seed: &hash, value: self.name.hashValue)
					hashCombine(seed: &hash, value: self.type.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Api.CallList.Call, rhs: EVE.Api.CallList.Call) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Api.CallList.Call) {
					accessMask = other.accessMask
					callDescription = other.callDescription
					groupID = other.groupID
					name = other.name
					type = other.type
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Api.CallList.Call(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Api.CallList.Call)?.hashValue == hashValue
				}
				
			}
			
			public class CallGroup: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var groupDescription: String = String()
				public var groupID: Int = Int()
				public var groupName: String = String()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let groupDescription = dictionary["description"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.groupDescription = groupDescription
					guard let groupID = dictionary["groupID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.groupID = groupID
					guard let groupName = dictionary["groupName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.groupName = groupName
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["groupDescription"] = groupDescription.json
					json["groupID"] = groupID.json
					json["groupName"] = groupName.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.groupDescription.hashValue)
					hashCombine(seed: &hash, value: self.groupID.hashValue)
					hashCombine(seed: &hash, value: self.groupName.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Api.CallList.CallGroup, rhs: EVE.Api.CallList.CallGroup) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Api.CallList.CallGroup) {
					groupDescription = other.groupDescription
					groupID = other.groupID
					groupName = other.groupName
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Api.CallList.CallGroup(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Api.CallList.CallGroup)?.hashValue == hashValue
				}
				
			}
			
			public var callGroups: [EVE.Api.CallList.CallGroup] = []
			public var calls: [EVE.Api.CallList.Call] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let callGroups = try dictionary.rowset(name: "callGroups")?.map ({try EVE.Api.CallList.CallGroup(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.callGroups = callGroups
				guard let calls = try dictionary.rowset(name: "calls")?.map ({try EVE.Api.CallList.Call(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.calls = calls
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["callGroups"] = callGroups.json
				json["calls"] = calls.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.callGroups.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.calls.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Api.CallList, rhs: EVE.Api.CallList) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Api.CallList) {
				callGroups = other.callGroups.compactMap { EVE.Api.CallList.CallGroup($0) }
				calls = other.calls.compactMap { EVE.Api.CallList.Call($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Api.CallList(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Api.CallList)?.hashValue == hashValue
			}
			
		}
		
		
	}
	
}
