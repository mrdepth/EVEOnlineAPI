//
//  EVECharMedals.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVECharMedalsItem: EVEObject {
	public var medalID: Int = 0
	public var reason: String = ""
	public var status: EVEMedalStatus = .Public
	public var issuerID: Int = 0
	public var issued: Date = Date.distantPast
	public var corporationID: Int = 0
	public var title: String = ""
	public var medalDescription: String = ""
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"medalID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"reason":EVESchemeElementType.String(elementName:nil, transformer:nil),
			"status":EVESchemeElementType.Int(elementName:nil, transformer:{(value:Any?) -> Any? in
				if let s = value as? String {
					return EVEMedalStatus(s).rawValue
				}
				else {
					return EVEMedalStatus.Public.rawValue
				}
			}),
			"issuerID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"issued":EVESchemeElementType.Date(elementName:nil, transformer:nil),
			"corporationID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"title":EVESchemeElementType.String(elementName:nil, transformer:nil),
			"medalDescription":EVESchemeElementType.String(elementName:"description", transformer:nil),
		]
	}
}


public class EVECharMedals: EVEResult {
	public var currentCorporation: [EVECharMedalsItem] = []
	public var otherCorporations: [EVECharMedalsItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"currentCorporation":EVESchemeElementType.Rowset(elementName: nil, type: EVECharMedalsItem.self, transformer: nil),
			"otherCorporations":EVESchemeElementType.Rowset(elementName: nil, type: EVECharMedalsItem.self, transformer: nil),
		]
	}
}
