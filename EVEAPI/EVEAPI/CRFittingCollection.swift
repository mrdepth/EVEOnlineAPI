//
//  CRFittingCollection.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 07.12.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation

public class CRFittingItem: EVEObject {
	public var flag: Int = 0
	public var type: CRType = CRType()
	public var quantity: Int = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"flag": EVESchemeElementType.Int(elementName: "id", transformer: nil),
			"type": EVESchemeElementType.Object(elementName: nil, type: CRType.self, transformer: nil),
			"quantity": EVESchemeElementType.Int(elementName: "id", transformer: nil),
		]
	}
	
	public var dictionary: [String: Any] {
		return [
			"flag": flag,
			"type": type.description,
			"quantity": quantity
		]
	}
}

public class CRFitting: EVEObject {
	public var name: String = ""
	public var fittingID: Int64 = 0
	public var ship: CRType = CRType()
	public var items: [CRFittingItem] = []
	public var fittingDescription: String = ""
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"name": EVESchemeElementType.String(elementName: nil, transformer: nil),
			"fittingID": EVESchemeElementType.Int64(elementName: nil, transformer: nil),
			"ship": EVESchemeElementType.Object(elementName: nil, type: CRType.self, transformer: nil),
			"items": EVESchemeElementType.Array(elementName: nil, type: CRFittingItem.self, transformer: nil),
			"fittingDescription": EVESchemeElementType.String(elementName: "description", transformer: nil),
		]
	}
	
	public var dictionary: [String: Any] {
		return [
			"name": name,
			"fittingID": fittingID,
			"description": fittingDescription,
			"ship": ship.dictionary,
			"items": items.map {$0.dictionary}
		]
	}
}

public class CRFittingCollection: CRResult {
	public var fittings: [CRFitting] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	public override class var contentType: String {get {return "application/vnd.ccp.eve.FittingCollection-v1+json"}}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return ["fittings": EVESchemeElementType.Array(elementName: "items", type: CRFitting.self, transformer: nil)]
	}
}
