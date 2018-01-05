//
//  AppDelegate.swift
//  Develop
//
//  Created by Artem Shimanski on 27.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit
//import EVEAPI
import Alamofire

protocol DateFormatted {
	var dateFormatter: DateFormatter? {get}
}

extension DateFormatted {
	var dateFormatter: DateFormatter? {
		return nil
	}
}

struct Status: Codable {
	var startTime: Date?
	var players: Int
	var serverVersion: String
	
	private var _hashValue: Int {
		return 0
	}
	
//	var hashValue: Int {
//		return 0
//	}
//
//	static func==(lhs: Status, rhs: Status) -> Bool {
//		return lhs.hashValue == rhs.hashValue
//	}
	
	internal(set) public var hashValue: Int
	
	public init(from decoder: Decoder) throws {
		let c = try decoder.container(keyedBy: CodingKeys.self)
		startTime = try c.decodeIfPresent(Date.self, forKey: .startTime)
		players = try c.decode(Int.self, forKey: .players)
		serverVersion = try c.decode(String.self, forKey: .serverVersion)
		hashValue = 0
		hashValue = _hashValue
	}
	
	enum CodingKeys: String, CodingKey, DateFormatted {
		case startTime = "start_time"
		case serverVersion = "server_version"
		case players
		
		var dateFormatter: DateFormatter? {
			switch self {
			case .startTime:
				return DateFormatter.esiDateTimeFormatter
			default:
				return nil
			}
		}
	}
	
}

extension DateFormatter {
	static var esiDateFormatter: DateFormatter {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd"
		dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
		dateFormatter.locale = Locale(identifier: "en_US_POSIX")
		return dateFormatter
	}
	
	static let esiDateTimeFormatter: DateFormatter = {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
		dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
		dateFormatter.locale = Locale(identifier: "en_US_POSIX")
		return dateFormatter
	}()
}

/*public enum DecodableDecoder {
	case json(JSONDecoder.DateDecodingStrategy?, JSONDecoder.DataDecodingStrategy?, JSONDecoder.NonConformingFloatDecodingStrategy?)
	case propertyList
	
	func decode<T: Decodable>(from data: Data) throws -> T {
		switch self {
		case let .json(dateDecodingStrategy, dataDecodingStrategy, nonConformingFloatDecodingStrategy):
			let decoder = JSONDecoder()
			decoder.dateDecodingStrategy = dateDecodingStrategy ?? .deferredToDate
			decoder.dataDecodingStrategy = dataDecodingStrategy ?? .base64
			decoder.nonConformingFloatDecodingStrategy = nonConformingFloatDecodingStrategy ?? .throw
			return try decoder.decode(T.self, from: data)
		case .propertyList:
			let decoder = PropertyListDecoder()
			return try decoder.decode(T.self, from: data)
		}
	}
}

extension DataRequest {
	
	public static func decodableResponseSerializer<T: Decodable> (
		decoder: DecodableDecoder)
		-> DataResponseSerializer<T>
	{
		return DataResponseSerializer<T> { _, response, data, error in
			do {
				return try .success(decoder.decode(from: data!))
			}
			catch {
				return .failure(error)
			}
		}
	}

	
	@discardableResult
	public func responseDecodable<T: Decodable> (
		queue: DispatchQueue? = nil,
		decoder: DecodableDecoder = .json(nil, nil, nil),
		completionHandler: @escaping (DataResponse<T>) -> Void)
		-> Self
	{
		return response(
			queue: queue,
			responseSerializer: DataRequest.decodableResponseSerializer(decoder: decoder),
			completionHandler: completionHandler
		)
	}
}*/

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	

	var window: UIWindow?

	enum SerializationError: Error {
		case dateFormatError
	}

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		let decoder = JSONDecoder()
		decoder.dateDecodingStrategy = .custom { (decoder) -> Date in
			if let formatter = (decoder.codingPath.last as? DateFormatted)?.dateFormatter {
				guard let date = try formatter.date(from: decoder.singleValueContainer().decode(String.self)) else {throw SerializationError.dateFormatError}
				return date
			}
			else {
				return try Date(from: decoder)
			}
		}
		
		var q = URLQueryItem(name: "1", value: "2")
		print("\(q.hashValue)")
		q.name = "2"
		print("\(q.hashValue)")
		
		Alamofire.request("https://esi.tech.ccp.is/latest/status/?datasource=tranquility").validate().responseJSONDecodable(decoder: decoder) { (response: DataResponse<Status>) in
			print("\(response.value?.hashValue)")
		}
		return true
	}

	func applicationWillResignActive(_ application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
	}

	func applicationDidEnterBackground(_ application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}

	func applicationWillEnterForeground(_ application: UIApplication) {
		// Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}

	func applicationWillTerminate(_ application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}
	
	func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
		return true
	}


}

