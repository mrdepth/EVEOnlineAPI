//
//  EVECalendarEventAttendees.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 29.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVECalendarEventAttendeesItem: EVEObject {
	public var characterID: Int64 = 0
	public var characterName: String = ""
	public var response: EVECalendarEventAttendeeResponse = .undecided
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"characterID":EVESchemeElementType.Int64(elementName:nil, transformer:nil),
			"characterName":EVESchemeElementType.String(elementName:nil, transformer:nil),
			"response":EVESchemeElementType.String(elementName:nil, transformer:{(value:Any?) -> Any? in
				if let s = value as? String {
					return EVECalendarEventAttendeeResponse(s).rawValue
				}
				else {
					return EVECalendarEventAttendeeResponse.undecided.rawValue
				}
			}),
		]
	}
}

public class EVECalendarEventAttendees: EVEResult {
	public var eventAttendees: [EVECalendarEventAttendeesItem] = []
	
	public required init?(dictionary:[String:Any]) {
		super.init(dictionary: dictionary)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override public func scheme() -> [String:EVESchemeElementType] {
		return [
			"eventAttendees":EVESchemeElementType.Rowset(elementName: nil, type: EVECalendarEventAttendeesItem.self, transformer: nil)
		]
	}
}
