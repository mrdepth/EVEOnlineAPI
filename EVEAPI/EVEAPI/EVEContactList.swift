//
//  EVEContactList.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEContactListItem: EVEObject {
	public var contactID: Int = 0
	public var contactName: String = ""
	public var standing: Int = 0
	public var contactTypeID: Int = 0
	public var labelMask: Int = 0
	public var inWatchlist: Bool = false
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"contactID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"contactName":EVESchemeElementType.String(elementName:nil, transformer:nil),
			"standing":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"contactTypeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"labelMask":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"inWatchlist":EVESchemeElementType.Bool(elementName:nil, transformer:nil),
		]
	}
}

public class EVEContactListLabel: EVEObject {
	public var labelID: Int = 0
	public var name: String = ""
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"labelID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"name":EVESchemeElementType.String(elementName:nil, transformer:nil),
		]
	}
}

public class EVEContactList: EVEResult {
	public var contactList: [EVEContactListItem] = []
	public var contactLabels: [EVEContactListLabel] = []
	public var corporateContactList: [EVEContactListItem] = []
	public var corporateContactLabels: [EVEContactListLabel] = []
	public var allianceContactList: [EVEContactListItem] = []
	public var allianceContactLabels: [EVEContactListLabel] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"contactList":EVESchemeElementType.Rowset(elementName: nil, type: EVEContactListItem.self, transformer: nil),
			"contactLabels":EVESchemeElementType.Rowset(elementName: nil, type: EVEContactListLabel.self, transformer: nil),
			"corporateContactList":EVESchemeElementType.Rowset(elementName: nil, type: EVEContactListItem.self, transformer: nil),
			"corporateContactLabels":EVESchemeElementType.Rowset(elementName: nil, type: EVEContactListLabel.self, transformer: nil),
			"allianceContactList":EVESchemeElementType.Rowset(elementName: nil, type: EVEContactListItem.self, transformer: nil),
			"allianceContactLabels":EVESchemeElementType.Rowset(elementName: nil, type: EVEContactListLabel.self, transformer: nil),
		]
	}
}
