//
//  EVECorporationSheet.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVECorporationSheetDivision: EVEObject {
	public var accountKey: Int = 0
	public var divisionDescription: String = ""
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"accountKey":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"divisionDescription":EVESchemeElementType.Int(elementName:"description", transformer:nil),
		]
	}
}

public class EVECorporationSheetLogo: EVEObject {
	public var graphicID: Int = 0
	public var shape1: Int = 0
	public var shape2: Int = 0
	public var shape3: Int = 0
	public var color1: Int = 0
	public var color2: Int = 0
	public var color3: Int = 0
	
	public override init() {
		super.init()
	}
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"graphicID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"shape1":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"shape2":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"shape3":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"color1":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"color2":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"color3":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		]
	}
}

public class EVECorporationSheet: EVEResult {
	public var corporationID: Int64 = 0
	public var corporationName: String = ""
	public var ticker: String = ""
	public var ceoID: Int64 = 0
	public var ceoName: String = ""
	public var stationID: Int = 0
	public var stationName: String = ""
	public var corporationDescription: String = ""
	public var url: String = ""
	public var allianceID: Int64 = 0
	public var allianceName: String = ""
	public var factionID: Int64 = 0
	public var taxRate: Double = 0
	public var memberCount: Int = 0
	public var memberLimit: Int = 0
	public var shares: Int = 0
	public var divisions: [EVECorporationSheetDivision] = []
	public var walletDivisions: [EVECorporationSheetDivision] = []
	public var logo: EVECorporationSheetLogo = EVECorporationSheetLogo()
	
	
	public var containerLog: [EVEContainerLogItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"corporationID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"corporationName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"ticker":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"ceoID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"ceoName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"stationID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"stationName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"corporationDescription":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"url":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"allianceID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"allianceName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"factionID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"taxRate":EVESchemeElementType.Double(elementName:nil, transformer:nil),
		"memberCount":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"memberLimit":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"shares":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"divisions":EVESchemeElementType.Rowset(elementName: nil, type: EVECorporationSheetDivision.self, transformer: nil),
		"walletDivisions":EVESchemeElementType.Rowset(elementName: nil, type: EVECorporationSheetDivision.self, transformer: nil),
		"logo":EVESchemeElementType.Object(elementName: nil, type: EVECorporationSheetLogo.self, transformer: nil),
		]
	}
}

