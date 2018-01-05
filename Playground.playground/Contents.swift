//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
//import EVEAPI
//import AFNetworking
import ObjectiveC
//import Alamofire

extension DateFormatter {
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

let json = """
{
"start_time": "2018-01-04T11:05:25Z",
"players": 19441,
"server_version": "1226572"
}
"""

extension Encodable {
//	typealias Formats = CodingKey
}

struct Status: Codable {
	var startTime: Date? = nil
	var players: Int = 0
	var serverVersion: String = ""
	
	enum CodingKeys: String, CodingKey {
		case startTime = "start_time"
		case serverVersion = "server_version"
		case players
	}
	
}


var s1 = Status()
var s2 = s1

//print("\(&s1)")

withUnsafePointer(to: &s1) { (ptr) in
	print("\(ptr)")
}
withUnsafePointer(to: &s2) { (ptr) in
	print("\(ptr)")
}
