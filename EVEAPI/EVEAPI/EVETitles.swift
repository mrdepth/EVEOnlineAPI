//
//  EVETitles.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 30.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVETitlesItem: EVEObject {
	public var titleID: Int = 0
	public var titleName: String = ""
	public var roles: [EVETitlesRoleItem] = []
	public var grantableRoles: [EVETitlesRoleItem] = []
	public var rolesAtHQ: [EVETitlesRoleItem] = []
	public var grantableRolesAtHQ: [EVETitlesRoleItem] = []
	public var rolesAtBase: [EVETitlesRoleItem] = []
	public var grantableRolesAtBase: [EVETitlesRoleItem] = []
	public var rolesAtOther: [EVETitlesRoleItem] = []
	public var grantableRolesAtOther: [EVETitlesRoleItem] = []
	
	
	public override init() {
		super.init()
	}
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"titleID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"titleName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"roles":EVESchemeElementType.Rowset(elementName: nil, type: EVETitlesRoleItem.self, transformer: nil),
		"grantableRoles":EVESchemeElementType.Rowset(elementName: nil, type: EVETitlesRoleItem.self, transformer: nil),
		"rolesAtHQ":EVESchemeElementType.Rowset(elementName: nil, type: EVETitlesRoleItem.self, transformer: nil),
		"grantableRolesAtHQ":EVESchemeElementType.Rowset(elementName: nil, type: EVETitlesRoleItem.self, transformer: nil),
		"rolesAtBase":EVESchemeElementType.Rowset(elementName: nil, type: EVETitlesRoleItem.self, transformer: nil),
		"grantableRolesAtBase":EVESchemeElementType.Rowset(elementName: nil, type: EVETitlesRoleItem.self, transformer: nil),
		"rolesAtOther":EVESchemeElementType.Rowset(elementName: nil, type: EVETitlesRoleItem.self, transformer: nil),
		"grantableRolesAtOther":EVESchemeElementType.Rowset(elementName: nil, type: EVETitlesRoleItem.self, transformer: nil),
		]
	}
}

public class EVETitlesRoleItem: EVEObject {
	public var roleID: Int = 0
	public var roleName: String = ""
	public var roleDescription: String = ""
	
	public override init() {
		super.init()
	}
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"roleID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"roleName":EVESchemeElementType.String(elementName:nil, transformer:nil),
			"roleDescription":EVESchemeElementType.String(elementName:nil, transformer:nil),
		]
	}
}


public class EVETitles: EVEResult {
	public var titles: [EVETitlesItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"titles":EVESchemeElementType.Rowset(elementName: nil, type: EVETitlesItem.self, transformer: nil),
		]
	}
}
