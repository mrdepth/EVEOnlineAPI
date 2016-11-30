//
//  EVEOwnerID.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 30.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEOwnerIDItem: EVEObject {
	public var ownerID: Int = 0
	public var ownerName: String = ""
	public var ownerGroupID: EVEOwnerGroup = .Character
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"ownerID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"ownerName":EVESchemeElementType.String(elementName:nil, transformer:nil),
			"ownerGroupID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		]
	}
}

public class EVEOwnerID: EVEResult {
	public var owners: [EVEOwnerIDItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"owners":EVESchemeElementType.Rowset(elementName: nil, type: EVEOwnerIDItem.self, transformer: nil)
		]
	}
}
