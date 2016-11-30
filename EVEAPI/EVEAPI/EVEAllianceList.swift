//
//  EVEAllianceList.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 30.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEAllianceListItem: EVEObject {
	public var name: String = ""
	public var shortName: String = ""
	public var allianceID: Int = 0
	public var executorCorpID: Int = 0
	public var memberCount: Int = 0
	public var startDate: Date = Date.distantPast
	public var memberCorporations: [EVEAllianceListMemberCorporation] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"name":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"shortName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"allianceID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"executorCorpID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"memberCount":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"startDate":EVESchemeElementType.Date(elementName:nil, transformer:nil),
		"memberCorporations":EVESchemeElementType.Rowset(elementName: nil, type: EVEAllianceListMemberCorporation.self, transformer: nil)
		]
	}
}


public class EVEAllianceListMemberCorporation: EVEObject {
	public var corporationID: Int = 0
	public var startDate: Date = Date.distantPast
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"corporationID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"startDate":EVESchemeElementType.Date(elementName:nil, transformer:nil),
		]
	}
}

public class EVEAllianceList: EVEResult {
	public var alliances: [EVEAllianceListItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"alliances":EVESchemeElementType.Rowset(elementName: nil, type: EVEAllianceListItem.self, transformer: nil)
		]
	}
}
