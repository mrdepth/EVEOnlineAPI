//
//  AppDelegate.swift
//  Develop
//
//  Created by Artem Shimanski on 27.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit
import EVEAPI
import Alamofire
import Futures



let clientID = "a0cc80b7006944249313dc22205ec645"
let secretKey = "deUqMep7TONp68beUoC1c71oabAdKQOJdbiKpPcC"

class MyCache: URLCache {
	override func cachedResponse(for request: URLRequest) -> CachedURLResponse? {
		print("\(#function): \(request)")
		return super.cachedResponse(for: request)
	}
	
	override func storeCachedResponse(_ cachedResponse: CachedURLResponse, for request: URLRequest) {
		print("\(#function): \(request)")
		let original = cachedResponse.response as! HTTPURLResponse
		
		let fields = original.allHeaderFields.map {($0.key as! String, $0.value as! String)}
		var headers = Dictionary(uniqueKeysWithValues: fields)
		headers["cached"] = "true"
		
		let response = HTTPURLResponse(url: original.url!, statusCode: original.statusCode, httpVersion: nil, headerFields: headers)!
		let other = CachedURLResponse(response: response, data: cachedResponse.data, userInfo: cachedResponse.userInfo, storagePolicy: cachedResponse.storagePolicy)
		super.storeCachedResponse(other, for: request)
	}
}


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	enum SerializationError: Error {
		case dateFormatError
	}

	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		URLCache.shared = MyCache(memoryCapacity: 1024*1024, diskCapacity: 50*1024*1024, diskPath: nil)
		
		AF.request("http://google.com").responseString { result in
			print(result)
		}
		
		/*var esi: ESI! = ESI()
		esi.request("https://esi.evetech.net/latest/alliances/?datasource=tranquility", cachePolicy: .useProtocolCachePolicy).responseString { (r) in
			print(r)
			esi = nil
		}
		
		var zkb: ZKillboard! = ZKillboard()
		zkb.kills(filter: [.solo, .wSpace], page: nil).then {
			print($0)
		}.catch {
			print($0)
		}.finally {
			zkb = nil
		}*/
		
//		let url = OAuth2.authURL(clientID: clientID, callbackURL: URL(string:"eveauthnc://sso/")!, scope: ESI.Scope.default, state: "esi")
//		application.open(url, options: [:], completionHandler: nil)
		
	/*	DispatchQueue.global(qos: .background).async {
			print("p1")
			try! p1.set(.success(1))
		}
		
		p1.future.then { _ in
			print("p22")
		}

		p1.future.then { _ in
			print("p2")
			try! p2.set(.success(2))
		}


		let v = try? p2.future.get()
		print("wait")
		p2.future.then { r in
			print("\(r)")
		}*/
		
		return true
		/*let s = "{\"scopes\":[\"characterWalletRead\",\"esi-calendar.respond_calendar_events.v1\",\"esi-calendar.read_calendar_events.v1\",\"esi-location.read_location.v1\",\"esi-location.read_ship_type.v1\",\"esi-mail.organize_mail.v1\",\"esi-mail.read_mail.v1\",\"esi-mail.send_mail.v1\",\"esi-skills.read_skills.v1\",\"esi-skills.read_skillqueue.v1\",\"esi-wallet.read_character_wallet.v1\",\"esi-search.search_structures.v1\",\"esi-clones.read_clones.v1\",\"esi-universe.read_structures.v1\",\"esi-killmails.read_killmails.v1\",\"esi-assets.read_assets.v1\",\"esi-planets.manage_planets.v1\",\"esi-fittings.read_fittings.v1\",\"esi-fittings.write_fittings.v1\",\"esi-markets.structure_markets.v1\",\"esi-characters.read_loyalty.v1\",\"esi-characters.read_standings.v1\",\"esi-industry.read_character_jobs.v1\",\"esi-markets.read_character_orders.v1\",\"esi-characters.read_blueprints.v1\",\"esi-contracts.read_character_contracts.v1\",\"esi-clones.read_implants.v1\"],\"characterID\":90553786,\"characterName\":\"Po\'kupatel Boloskarl\",\"refreshToken\":\"4AhefRhvXaUdqskQjF_ZFcHQnSW-PJuUB796LhkKJanORK9jd63ESBz241X7uSGVxdwceVD5Rm08gCQGAzqpbKmLDbVWBberwfegJvZYBQUJ27rjIwOlqK9maCQUknudzzmhmVbgajTcYVuKruU7kJbQeTITWf19FjCPbLYBf5Di79NJyiI0Z2fAmYQKR7Uh0\",\"tokenType\":\"Bearer\",\"expiresOn\":537274087.78973496,\"accessToken\":\"KBohnlYQ7fYKkuzacT-n1tFZ4d4PVuxjiUNL2eTswtpcIRKvXvgbC7CM-sekvpphjjHizYrOEowWg-abwMxTNQ2\",\"realm\":\"esi\"}"
		let data = s.data(using: .utf8)!
		let token = try! JSONDecoder().decode(OAuth2Token.self, from: data)
		
		/*var retrier: OAuth2Retrier? = OAuth2Retrier(token: token, clientID: clientID, secretKey: secretKey)
		print("\(token.refreshToken)")
		print("\(token.accessToken)")
		retrier?.refreshToken { (result) in
			print("\(result)")
			print("\(token.refreshToken)")
			print("\(token.accessToken)")
			retrier = nil
		}
		
		let url = OAuth2.authURL(clientID: clientID, callbackURL: URL(string:"eveauthnc://sso/")!, scope: ESI.Scope.default, state: "esi")
//		application.open(url, options: [:], completionHandler: nil)*/

		var esi: ESI? = ESI(token: token, clientID: clientID, secretKey: secretKey)
		let dispatchGroup = DispatchGroup()
		dispatchGroup.enter()
		esi?.wallet.getCharactersWalletBalance(characterID: Int(token.characterID), completionBlock: { (result) in
			dispatchGroup.leave()
		})
		
		dispatchGroup.enter()
		esi?.skills.getCharacterAttributes(characterID: Int(token.characterID), completionBlock: { (result) in
			dispatchGroup.leave()
		})
		
		dispatchGroup.enter()
		esi?.skills.getCharactersSkillQueue(characterID: Int(token.characterID), completionBlock: { (result) in
			dispatchGroup.leave()
			
		})
		
		dispatchGroup.notify(queue: .main) {
			esi = nil
		}*/
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
	
	func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
		OAuth2.handleOpenURL(url, clientID: clientID, secretKey: secretKey) { (result) in
			guard let token = result.value else {return}
			let s = String(data: try! JSONEncoder().encode(token), encoding: .utf8)
			print(s!)
		}
		return true
	}


}

