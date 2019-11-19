//
//  DateFormatterExtension.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 27.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation

extension DateFormatter {
	
	static var rfc822DateFormatter: DateFormatter {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "EEE, d MMM yyyy HH:mm:ss zzz"
		dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
		dateFormatter.locale = Locale(identifier: "en_US_POSIX")
		return dateFormatter
	}
	
//	static var eveDateFormatter: DateFormatter {
//		let dateFormatter = DateFormatter()
//		dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//		dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
//		dateFormatter.locale = Locale(identifier: "en_US_POSIX")
//		return dateFormatter
//	}
//	
//	static var crestDateFormatter: DateFormatter {
//		let dateFormatter = DateFormatter()
//		dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSZ"
//		dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
//		dateFormatter.locale = Locale(identifier: "en_US_POSIX")
//		return dateFormatter
//	}
	
    static var esiDateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter
    }
    
    static var esiDateTimeFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter
    }
}
