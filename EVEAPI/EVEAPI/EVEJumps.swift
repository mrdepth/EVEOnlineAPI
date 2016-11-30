//
//  EVEJumps.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 30.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEJumpsItem: EVEObject {
	public var solarSystemID: Int = 0
	public var shipJumps: Int = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"solarSystemID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"shipJumps":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		]
	}
}

public class EVEJumps: EVEResult {
	public var solarSystems: [EVEJumpsItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"solarSystems":EVESchemeElementType.Rowset(elementName: nil, type: EVEJumpsItem.self, transformer: nil)
		]
	}
}

