//
//  EVEPlanetaryLinks.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEPlanetaryLinksItem: EVEObject {
	public var sourcePinID: Int64 = 0
	public var destinationPinID: Int64 = 0
	public var linkLevel: Int = 0
	
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"sourcePinID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"destinationPinID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"linkLevel":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		]
	}
}


public class EVEPlanetaryLinks: EVEResult {
	public var links: [EVEPlanetaryLinksItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"links":EVESchemeElementType.Rowset(elementName: nil, type: EVEPlanetaryLinksItem.self, transformer: nil),
		]
	}
}
