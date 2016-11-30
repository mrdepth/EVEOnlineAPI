//
//  EVEServerStatus.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 28.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEServerStatus: EVEResult {
	public var serverOpen: Bool = false
	public var onlinePlayers: Int = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"serverOpen":EVESchemeElementType.Bool(elementName:nil, transformer:nil),
			"onlinePlayers":EVESchemeElementType.Int(elementName: nil, transformer: nil)
		]
	}
	
}
