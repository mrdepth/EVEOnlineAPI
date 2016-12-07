//
//  EVEObject.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 28.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public typealias Transformer = ((_ value:Any?) -> Any?)

public enum EVESchemeElementType {
	case Int(elementName:String?, transformer:Transformer?)
	case Int64(elementName:String?, transformer:Transformer?)
	case Double(elementName:String?, transformer:Transformer?)
	case Bool(elementName:String?, transformer:Transformer?)
	case String(elementName:String?, transformer:Transformer?)
	case Object(elementName:String?, type:EVEObject.Type?, transformer:Transformer?)
	case Rowset(elementName:String?, type:EVEObject.Type?, transformer:Transformer?)
	case Array(elementName:String?, type:EVEObject.Type?, transformer:Transformer?)
	case Date(elementName:String?, transformer:Transformer?)
	case Error(elementName:String?,  transformer:Transformer?)
	case IntList(elementName:String?, transformer:Transformer?)
}

protocol EVEScheme {
	func scheme() -> [String:EVESchemeElementType]
}

public class EVEObject: NSObject, EVEScheme, NSSecureCoding {
	
	public func scheme() -> [String:EVESchemeElementType] {
		return [:]
	}
	
	public static var supportsSecureCoding: Bool {
		get {
			return true
		}
	}
	
	public override init() {
		super.init()
	}
	
	public required init?(dictionary:[String:Any]) {
		super.init()
		let dateFormatter = DateFormatter.eveDateFormatter
		for (key, type) in scheme() {
			let property: String
			let parser: Transformer?
			
			switch type {
			case let .Int(elementName, transformer):
				property = elementName ?? key
				parser = transformer ?? {(value:Any?) -> Any? in
					switch value {
					case let value as NSString:
						return value.intValue
					case let value as NSNumber:
						return value.intValue
					default:
						return 0
					}
				}
			case let .Int64(elementName, transformer):
				property = elementName ?? key
				parser = transformer ?? {(value:Any?) -> Any? in
					switch value {
					case let value as NSString:
						return value.longLongValue
					case let value as NSNumber:
						return value.int64Value
					default:
						return 0.0
					}
				}
			case let .Double(elementName, transformer):
				property = elementName ?? key
				parser = transformer ?? {(value:Any?) -> Any? in
					switch value {
					case let value as NSString:
						return value.doubleValue
					case let value as NSNumber:
						return value.doubleValue
					default:
						return 0.0
					}
				}
			case let .Bool(elementName, transformer):
				property = elementName ?? key
				parser = transformer ?? {(value:Any?) -> Any? in
					if let s = value as? String {
						return NSString(string:s).boolValue
					}
					else {
						return false
					}
				}
			case let .String(elementName, transformer):
				property = elementName ?? key
				parser = transformer ?? {(value:Any?) -> Any? in
					if let v = value as? String {
						return v
					}
					else {
						return nil
					}
				}
			case let .Object(elementName, type, transformer):
				property = elementName ?? key
				parser = transformer ?? {(value:Any?) -> Any? in
					if let v = value as? [String:Any] {
						return type!.init(dictionary:v)
					}
					else {
						return nil
					}
				}
			case let .Rowset(elementName, type, transformer):
				property = elementName ?? key
				parser = transformer ?? {(value:Any?) -> Any? in
					guard let object = dictionary["rowset"] else {return nil}
					let rowset: [String : Any]?
					
					switch object {
					case let array as [[String:Any]]:
						rowset = array.first(where: {(i: [String : Any]) -> Bool in
							if let name = i["name"] as? String {
								return name == property
							}
							else {
								return false
							}
						})
					case let object as [String:Any]:
						rowset = object
					default:
						rowset = nil
					}
					
					let rows:[[String:Any]]?
					switch rowset?["row"] {
					case let value as [String:Any]:
						rows = [value]
					case let value as [[String:Any]]:
						rows = value
					default:
						rows = nil
					}
					
					return rows?.map {(value) -> Any? in
						return type!.init(dictionary: value)
					}
				}
			case let .Array(elementName, type, transformer):
				property = elementName ?? key
				parser = transformer ?? {(value:Any?) -> Any? in
					let rows:[[String:Any]]?
					switch value {
					case let value as [String:Any]:
						rows = [value]
					case let value as [[String:Any]]:
						rows = value
					default:
						rows = nil
					}
					
					return rows?.map {(value) -> Any? in
						return type!.init(dictionary: value)
					}
				}
			case let .Date(elementName, transformer):
				property = elementName ?? key
				parser = transformer ?? {(value:Any?) -> Any? in
					if let v = value as? String {
						return dateFormatter.date(from: v)
					}
					else {
						return nil
					}
				}
			case let .Error(elementName, transformer):
				property = elementName ?? key
				parser = transformer ?? {(value:Any?) -> Any? in
					if let v = value as? [String:String] {
						guard let errorCode = (v["code"] as NSString?)?.integerValue else {return nil}
						guard let description = v["_"] else {return nil}
						return NSError(domain: "EVEAPIObject", code: errorCode, userInfo: [NSLocalizedDescriptionKey:description])
					}
					else {
						return nil
					}
				}
			case let .IntList(elementName, transformer):
				property = elementName ?? key
				parser = transformer ?? {(value:Any?) -> Any? in
					if let s = value as? String {
						return s.components(separatedBy: ",").map {(i) -> Int in
							return (i as NSString).integerValue
						}
					}
					else {
						return []
					}
				}
			}
			
			if let value = parser?(dictionary[property]) {
				self.setValue(value, forKey: key)
			}
			
		}
	}
	
	//MARK: NSCoding
	
	public required init?(coder aDecoder: NSCoder) {
		super.init()
		for (key, _) in scheme() {
			if let value = aDecoder.decodeObject(forKey: key) {
				self.setValue(value, forKey: key)
			}
		}
	}
	
	public func encode(with aCoder: NSCoder) {
		for (key, _) in scheme() {
			if let value = self.value(forKey: key) {
				aCoder.encode(value, forKey: key)
			}
		}
	}
}
