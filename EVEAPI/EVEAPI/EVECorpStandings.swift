//
//  EVECorpStandings.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 30.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVECorpStandings: EVEResult {
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"npcStandings":EVESchemeElementType.Object(elementName: "corporationNPCStandings", type: EVEStandingsNPC.self, transformer: nil),
		]
	}
}
