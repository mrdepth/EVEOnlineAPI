import Foundation
import Alamofire


public extension EVE {
	public var eve: Eve {
		return Eve(sessionManager: self)
	}
	
	class Eve {
		weak var sessionManager: EVE?
		
		init(sessionManager: EVE) {
			self.sessionManager = sessionManager
		}
		
		public func refTypes(completionBlock:((Result<EVE.Eve.RefTypes>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let parameters = Parameters()
			
			let url = session!.baseURL + "Eve/RefTypes.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Eve.RefTypes>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		public class RefTypes: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class RefType: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var refTypeID: Int = Int()
				public var refTypeName: String = String()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let refTypeID = dictionary["refTypeID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.refTypeID = refTypeID
					guard let refTypeName = dictionary["refTypeName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.refTypeName = refTypeName
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					refTypeID = aDecoder.decodeInteger(forKey: "refTypeID")
					refTypeName = aDecoder.decodeObject(forKey: "refTypeName") as? String ?? String()
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(refTypeID, forKey: "refTypeID")
					aCoder.encode(refTypeName, forKey: "refTypeName")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["refTypeID"] = refTypeID.json
					json["refTypeName"] = refTypeName.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.refTypeID.hashValue)
					hashCombine(seed: &hash, value: self.refTypeName.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Eve.RefTypes.RefType, rhs: EVE.Eve.RefTypes.RefType) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Eve.RefTypes.RefType) {
					refTypeID = other.refTypeID
					refTypeName = other.refTypeName
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Eve.RefTypes.RefType(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Eve.RefTypes.RefType)?.hashValue == hashValue
				}
				
			}
			
			public var refTypes: [EVE.Eve.RefTypes.RefType] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let refTypes = try dictionary.rowset(name: "refTypes")?.map ({try EVE.Eve.RefTypes.RefType(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.refTypes = refTypes
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				refTypes = aDecoder.decodeObject(of: [EVE.Eve.RefTypes.RefType.self], forKey: "refTypes") as? [EVE.Eve.RefTypes.RefType] ?? []
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(refTypes, forKey: "refTypes")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["refTypes"] = refTypes.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.refTypes.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Eve.RefTypes, rhs: EVE.Eve.RefTypes) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Eve.RefTypes) {
				refTypes = other.refTypes.flatMap { EVE.Eve.RefTypes.RefType($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Eve.RefTypes(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Eve.RefTypes)?.hashValue == hashValue
			}
			
		}
		
		
	}
	
}
