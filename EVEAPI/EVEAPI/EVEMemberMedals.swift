//
//  EVEMemberMedals.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 30.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEMemberMedalsItem: EVEObject {
	public var medalID: Int = 0
	public var characterID: Int64 = 0
	public var reason: String = ""
	public var status: EVEMedalStatus = .Public
	public var issuerID: Int64 = 0
	public var issued: Date = Date.distantPast
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"medalID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"characterID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"reason":EVESchemeElementType.String(elementName:nil, transformer:nil),
			"status":EVESchemeElementType.Int(elementName:nil, transformer:{(value:Any?) -> Any? in
				if let s = value as? String {
					return EVEMedalStatus(s).rawValue
				}
				else {
					return EVEMedalStatus.Public.rawValue
				}
			}),
			"issuerID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"issued":EVESchemeElementType.Date(elementName:nil, transformer:nil),
		]
	}
}


public class EVEMemberMedals: EVEResult {
	public var issuedMedals: [EVEMemberMedalsItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"issuedMedals":EVESchemeElementType.Rowset(elementName: nil, type: EVEMemberMedalsItem.self, transformer: nil),
		]
	}
}

