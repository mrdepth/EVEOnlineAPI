//
//  EVECallList.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 30.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit


public class EVECallListCallGroup: EVEObject {
	public var name: String = ""
	public var callGroupDescription: String = ""
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"name":EVESchemeElementType.String(elementName:nil, transformer:nil),
			"callGroupDescription":EVESchemeElementType.String(elementName:"description", transformer:nil),
		]
	}
}

public class EVECallListCallsItem: EVEObject {
	public var accessMask: Int64 = 0
	public var type: EVECallType = .Character
	public var name: String = ""
	public var groupID: Int = 0
	public var callDescription: String = ""
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"accessMask":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"type":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"name":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"groupID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"callDescription":EVESchemeElementType.String(elementName:"description", transformer:nil),
		]
	}
}

public class EVECallList: EVEResult {
	public var callGroups: [EVECallListCallGroup] = []
	public var calls: [EVECallListCallsItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"callGroups":EVESchemeElementType.Rowset(elementName: nil, type: EVECallListCallGroup.self, transformer: nil),
			"calls":EVESchemeElementType.Rowset(elementName: nil, type: EVECallListCallsItem.self, transformer: nil)
		]
	}
}

