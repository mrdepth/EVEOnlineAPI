//
//  EVEMemberSecurity.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 30.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEMemberSecurityRole: EVEObject {
	public var roleID: Int64 = 0
	public var roleName: String = ""
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"roleID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"roleName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		]
	}
}

public class EVEMemberSecurityTitle: EVEObject {
	public var titleID: Int = 0
	public var titleName: String = ""
	
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
		]
	}
}

public class EVEMemberSecurityMember: EVEObject {
	public var characterID: Int = 0
	public var name: String = ""
	public var roles: [EVEMemberSecurityRole] = []
	public var grantableRoles: [EVEMemberSecurityRole] = []
	public var rolesAtHQ: [EVEMemberSecurityRole] = []
	public var grantableRolesAtHQ: [EVEMemberSecurityRole] = []
	public var rolesAtBase: [EVEMemberSecurityRole] = []
	public var grantableRolesAtBase: [EVEMemberSecurityRole] = []
	public var rolesAtOther: [EVEMemberSecurityRole] = []
	public var grantableRolesAtOther: [EVEMemberSecurityRole] = []
	public var titles: [EVEMemberSecurityTitle] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"characterID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"name":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"roles":EVESchemeElementType.Rowset(elementName: nil, type: EVEMemberSecurityRole.self, transformer: nil),
		"grantableRoles":EVESchemeElementType.Rowset(elementName: nil, type: EVEMemberSecurityRole.self, transformer: nil),
		"rolesAtHQ":EVESchemeElementType.Rowset(elementName: nil, type: EVEMemberSecurityRole.self, transformer: nil),
		"grantableRolesAtHQ":EVESchemeElementType.Rowset(elementName: nil, type: EVEMemberSecurityRole.self, transformer: nil),
		"rolesAtBase":EVESchemeElementType.Rowset(elementName: nil, type: EVEMemberSecurityRole.self, transformer: nil),
		"grantableRolesAtBase":EVESchemeElementType.Rowset(elementName: nil, type: EVEMemberSecurityRole.self, transformer: nil),
		"rolesAtOther":EVESchemeElementType.Rowset(elementName: nil, type: EVEMemberSecurityRole.self, transformer: nil),
		"grantableRolesAtOther":EVESchemeElementType.Rowset(elementName: nil, type: EVEMemberSecurityRole.self, transformer: nil),
		"titles":EVESchemeElementType.Rowset(elementName: nil, type: EVEMemberSecurityTitle.self, transformer: nil),
		]
	}
}


public class EVEMemberSecurity: EVEResult {
	public var members: [EVEMemberSecurityMember] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"members":EVESchemeElementType.Rowset(elementName: nil, type: EVEMemberSecurityMember.self, transformer: nil),
		]
	}
}
