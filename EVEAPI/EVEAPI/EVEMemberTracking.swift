//
//  EVEMemberTracking.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 30.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEMemberTrackingItem: EVEObject {
	public var characterID: Int64 = 0
	public var name: String = ""
	public var startDateTime: Date = Date.distantPast
	public var baseID: Int = 0
	public var base: String = ""
	public var title: String = ""
	public var logonDateTime: Date = Date.distantPast
	public var logoffDateTime: Date = Date.distantPast
	public var locationID: Int64 = 0
	public var location: String = ""
	public var shipTypeID: Int = 0
	public var shipType: String = ""
	public var roles: Int64 = 0
	public var grantableRoles: Int64 = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"characterID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"name":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"startDateTime":EVESchemeElementType.Date(elementName:nil, transformer:nil),
		"baseID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"base":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"title":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"logonDateTime":EVESchemeElementType.Date(elementName:nil, transformer:nil),
		"logoffDateTime":EVESchemeElementType.Date(elementName:nil, transformer:nil),
		"locationID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"location":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"shipTypeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"shipType":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"roles":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"grantableRoles":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		]
	}
}


public class EVEMemberTracking: EVEResult {
	public var members: [EVEMemberTrackingItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"members":EVESchemeElementType.Rowset(elementName: nil, type: EVEMemberTrackingItem.self, transformer: nil),
		]
	}
}
