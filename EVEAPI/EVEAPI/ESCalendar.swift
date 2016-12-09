//
//  ESCalendar.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 09.12.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation

public class ESCalendarEvent: EVEObject {
	public var eventDate: Date = Date.distantPast
	public var eventID: Int64 = 0
	public var eventResponse: ESEventResponse = .notResponded
	public var importance: Int = 0
	public var title: String = ""
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"eventDate": EVESchemeElementType.ESIDate(elementName: "event_date", transformer: nil),
			"eventID": EVESchemeElementType.Int64(elementName: "event_id", transformer: nil),
			"eventResponse":EVESchemeElementType.Int(elementName:"event_response", transformer:{(value:Any?) -> Any? in
				if let s = value as? String {
					return ESEventResponse(s).rawValue
				}
				else {
					return ESEventResponse.notResponded.rawValue
				}
			}),
			"importance": EVESchemeElementType.Int(elementName: nil, transformer: nil),
			"title": EVESchemeElementType.String(elementName: nil, transformer: nil),
		]
	}
}

public class ESCalendarEventDetails: ESResult {
	public var date: Date = Date.distantPast
	public var duration: TimeInterval = 0
	public var eventID: Int64 = 0
	public var importance: Int = 0
	public var ownerID: Int64 = 0
	public var ownerName: String = ""
	public var ownerType: Int = 0
	public var response: String = ""
	public var title: String = ""
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"date": EVESchemeElementType.ESIDate(elementName: "event_date", transformer: nil),
			"duration": EVESchemeElementType.Double(elementName: nil, transformer:{(value:Any?) -> Any? in
				if let v = value as? NSString {
					return v.doubleValue * 60
				}
				else if let v = value as? NSNumber {
					return v.doubleValue * 60
				}
				else {
					return 0
				}
			}),
			"eventID": EVESchemeElementType.Int64(elementName: "event_id", transformer: nil),
			"importance": EVESchemeElementType.Int(elementName: nil, transformer: nil),
			"ownerID": EVESchemeElementType.Int64(elementName: "owner_id", transformer: nil),
			"ownerName": EVESchemeElementType.String(elementName: "owner_name", transformer: nil),
			"ownerType": EVESchemeElementType.Int(elementName: "owner_type", transformer: nil),
			"response": EVESchemeElementType.String(elementName: nil, transformer: nil),
			"title": EVESchemeElementType.String(elementName: nil, transformer: nil),
		]
	}
}
