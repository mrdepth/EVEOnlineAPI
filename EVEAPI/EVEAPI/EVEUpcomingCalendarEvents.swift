//
//  EVEUpcomingCalendarEvents.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEUpcomingCalendarEventsItem: EVEObject {
	public var eventID: Int64 = 0
	public var ownerID: Int64 = 0
	public var ownerName: String = ""
	public var eventDate: Date = Date.distantPast
	public var eventTitle: String = ""
	public var duration: Int = 0
	public var importance: Int = 0
	public var response: String = ""
	public var eventText: String = ""
	public var ownerTypeID: Int = 0
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
		"eventID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"ownerID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
		"ownerName":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"eventDate":EVESchemeElementType.Date(elementName:nil, transformer:nil),
		"eventTitle":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"duration":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"importance":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		"response":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"eventText":EVESchemeElementType.String(elementName:nil, transformer:nil),
		"ownerTypeID":EVESchemeElementType.Int(elementName:nil, transformer:nil),
		]
	}
}

public class EVEUpcomingCalendarEvents: EVEResult {
	public var upcomingEvents: [EVEUpcomingCalendarEventsItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"upcomingEvents":EVESchemeElementType.Rowset(elementName: nil, type: EVEUpcomingCalendarEventsItem.self, transformer: nil),
		]
	}
}
