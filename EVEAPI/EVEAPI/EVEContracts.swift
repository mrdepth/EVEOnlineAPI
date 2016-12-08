//
//  EVEContracts.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEContractsItem: EVEObject {
	public var contractID: Int64 = 0
	public var issuerID: Int64 = 0
	public var issuerCorpID: Int64 = 0
	public var assigneeID: Int64 = 0
	public var acceptorID: Int64 = 0
	public var forCorp: Bool = false
	public var startStationID: Int = 0
	public var endStationID: Int = 0
	public var numDays: Int = 0
	public var title: String = ""
	public var type: EVEContractType = .Unknown
	public var status: EVEContractStatus = .Unknown
	public var availability: EVEContractAvailability = .Public
	public var dateIssued: Date = Date.distantPast
	public var dateExpired: Date = Date.distantPast
	public var dateAccepted: Date = Date.distantPast
	public var dateCompleted: Date = Date.distantPast
	public var price: Double = 0
	public var reward: Double = 0
	public var collateral: Double = 0
	public var buyout: Double = 0
	public var volume: Double = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"contractID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"issuerID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"issuerCorpID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"assigneeID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"acceptorID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"forCorp":EVESchemeElementType.Bool(elementName:nil, transformer:nil),
			"startStationID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"endStationID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"numDays":EVESchemeElementType.Int(elementName:nil, transformer:nil),
			"title":EVESchemeElementType.String(elementName:nil, transformer:nil),
			"type": EVESchemeElementType.Int(elementName:nil, transformer: {(value:Any?) -> Any? in
				if let s = value as? String {
					return EVEContractType(s).rawValue
				}
				else {
					return EVEContractType.Unknown.rawValue
				}
			}),
			"status": EVESchemeElementType.Int(elementName:nil, transformer: {(value:Any?) -> Any? in
				if let s = value as? String {
					return EVEContractStatus(s).rawValue
				}
				else {
					return EVEContractStatus.Unknown.rawValue
				}
			}),
			"availability": EVESchemeElementType.Int(elementName:nil, transformer: {(value:Any?) -> Any? in
				if let s = value as? String {
					return EVEContractAvailability(s).rawValue
				}
				else {
					return EVEContractAvailability.Public.rawValue
				}
			}),
			"dateIssued":EVESchemeElementType.Date(elementName:nil, transformer:nil),
			"dateExpired":EVESchemeElementType.Date(elementName:nil, transformer:nil),
			"dateAccepted":EVESchemeElementType.Date(elementName:nil, transformer:nil),
			"dateCompleted":EVESchemeElementType.Date(elementName:nil, transformer:nil),
			"price":EVESchemeElementType.Double(elementName:nil, transformer:nil),
			"reward":EVESchemeElementType.Double(elementName:nil, transformer:nil),
			"collateral":EVESchemeElementType.Double(elementName:nil, transformer:nil),
			"buyout":EVESchemeElementType.Double(elementName:nil, transformer:nil),
			"volume":EVESchemeElementType.Double(elementName:nil, transformer:nil),
		]
	}
}


public class EVEContracts: EVEResult {
	public var contractList: [EVEContractsItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"contractList":EVESchemeElementType.Rowset(elementName: nil, type: EVEContractsItem.self, transformer: nil),
		]
	}
}
