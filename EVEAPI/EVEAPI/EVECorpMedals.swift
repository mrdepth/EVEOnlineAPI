//
//  EVECorpMedals.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 30.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVECorpMedalsItem: EVEObject {
	public var medalID: Int = 0
	public var title: String = ""
	public var medalDescription: String = ""
	public var creatorID: Int64 = 0
	public var created: Date = Date.distantPast
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"medalID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"title":EVESchemeElementType.String(elementName:nil, transformer:nil),
			"medalDescription":EVESchemeElementType.String(elementName:"description", transformer:nil),
			"creatorID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"created":EVESchemeElementType.Date(elementName:nil, transformer:nil),
		]
	}
}


public class EVECorpMedals: EVEResult {
	public var medals: [EVECorpMedalsItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"medals":EVESchemeElementType.Rowset(elementName: nil, type: EVECorpMedalsItem.self, transformer: nil)
		]
	}
}

