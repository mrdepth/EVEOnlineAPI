//
//  EVEMemberSecurityLog.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 30.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEMemberSecurityLogRoleHistoryItem: EVEObject {
	public var changeTime: Date = Date.distantPast
	public var characterID: Int64 = 0
	public var characterName: String = ""
	public var issuerID: Int64 = 0
	public var issuerName: String = ""
	public var roleLocationType: String = ""
	public var oldRoles: [EVEMemberSecurityRole] = []
	public var theNewRoles: [EVEMemberSecurityRole] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"changeTime":EVESchemeElementType.Date(elementName:nil, transformer:nil),
		"characterID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"characterName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"issuerID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"issuerName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"roleLocationType":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"oldRoles":EVESchemeElementType.Rowset(elementName: nil, type: EVEMemberSecurityRole.self, transformer: nil),
		"theNewRoles":EVESchemeElementType.Rowset(elementName: "newRoles", type: EVEMemberSecurityRole.self, transformer: nil),
		]
	}
}


public class EVEMemberSecurityLog: EVEResult {
	public var roleHistory: [EVEMemberSecurityLogRoleHistoryItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"roleHistory":EVESchemeElementType.Rowset(elementName: nil, type: EVEMemberSecurityLogRoleHistoryItem.self, transformer: nil),
		]
	}
}

