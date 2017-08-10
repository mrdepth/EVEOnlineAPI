//
//  EVECharacterName.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 30.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVECharacterName: EVEResult {
	public var characters: [EVECharacterIDItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"characters":EVESchemeElementType.Rowset(elementName: nil, type: EVECharacterIDItem.self, transformer: nil)
		]
	}
}
