//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
//import EVEAPI
//import AFNetworking
import ObjectiveC

let json = """
{
\"attackers\": [
{
\"character_id1\": 95810944,
\"corporation_id\": 1000179,
\"damage_done\": 5745,
\"faction_id\": 500003,
\"final_blow\": true,
\"security_status\": -0.3,
\"ship_type_id\": 17841,
\"killmail_time": "2016-10-22T17:13:36Z\",
\"weapon_type_id\": 3074
}
]
}
"""

//extension String: CodingKey {
//	public init?(intValue: Int) {
//		self = String(describing: intValue)
//	}
//
//	public init?(stringValue: String) {
//		self = stringValue
//	}
//
//	public var stringValue: String {
//	}
//}

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

class Kill: Codable {
	class Attacker: Codable {
		var character_id: Int?
		var corporation_id: Int?
		var damage_done: Int?
		var faction_id: Int?
		var final_blow: Bool?
		var security_status: Float?
		var ship_type_id: Int?
		var weapon_type_id: Int?
		private var killmail_timeString: String? {
			set {
				print("\(newValue)")
			}
			get {
				return nil
			}
		}
		var killmail_time: Date?
		
		enum CodingKeys: String, CodingKey {
			case character_id = "character_id1"
			case corporation_id
			case killmail_time
		}
		
		enum AdditionalCodingKeys: String, CodingKey {
			case killmail_time
		}
	}
	
	var attackers: [Attacker]?
}


let data = json.data(using: .utf8)!
let decoder = JSONDecoder()
decoder.dateDecodingStrategy = .formatted(DateFormatter.esiDateTimeFormatter)
decoder.dateDecodingStrategy = .custom { decoder -> Date in
	print("\(decoder.userInfo)")
	return Date()
}
let kill = try! decoder.decode(Kill.self, from: data)

print("\(kill.attackers![0].killmail_time)")

