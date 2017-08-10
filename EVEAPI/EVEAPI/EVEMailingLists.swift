//
//  EVEMailingLists.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEMailingListsItem: EVEObject {
	public var listID: Int = 0
	public var displayName: String = ""
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"listID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"displayName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		]
	}
}


public class EVEMailingLists: EVEResult {
	public var mailingLists: [EVEMailingListsItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"mailingLists":EVESchemeElementType.Rowset(elementName: nil, type: EVEMailingListsItem.self, transformer: nil),
		]
	}
}

