//
//  DateFormatterExtension.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 27.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation

extension DateFormatter {
	class var rfc822DateFormatter: DateFormatter {
		get {
			let dateFormatter = DateFormatter()
			dateFormatter.dateFormat = "EEE, d MMM yyyy HH:mm:ss zzz"
			dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
			dateFormatter.locale = Locale(identifier: "en_US_POSIX")
			return dateFormatter
		}
	}
	
	class var eveDateFormatter: DateFormatter {
		get {
			let dateFormatter = DateFormatter()
			dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
			dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
			dateFormatter.locale = Locale(identifier: "en_US_POSIX")
			return dateFormatter
		}
	}
	
	class var crestDateFormatter: DateFormatter {
		get {
			let dateFormatter = DateFormatter()
			dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSZ"
			dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
			dateFormatter.locale = Locale(identifier: "en_US_POSIX")
			return dateFormatter
		}
	}
	
//	class var esiDateFormatter: DateFormatter {
//		get {
//			let dateFormatter = DateFormatter()
//			dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//			dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
//			dateFormatter.locale = Locale(identifier: "en_US_POSIX")
//			return dateFormatter
//		}
//	}
}
