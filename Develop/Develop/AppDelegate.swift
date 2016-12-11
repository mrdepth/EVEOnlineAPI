//
//  AppDelegate.swift
//  Develop
//
//  Created by Artem Shimanski on 27.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit
import EVEAPI
import AFNetworking

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		
//		let url = ESAPI.oauth2url(clientID: "c2cc974798d4485d966fba773a8f7ef8", callbackURL: URL(string: "neocom://sso")!, scope: ESScope.all)
//		UIApplication.shared.openURL(url)
		
		let data = Data(base64Encoded:"YnBsaXN0MDDUAQIDBAUGLzBYJHZlcnNpb25YJG9iamVjdHNZJGFyY2hpdmVyVCR0b3ASAAGGoKsHCBscHR4fIykqK1UkbnVsbNkJCgsMDQ4PEBESExQVFhcYGRpWJGNsYXNzW2NoYXJhY3RlcklEXWNoYXJhY3Rlck5hbWVccmVmcmVzaFRva2VuWXRva2VuVHlwZVlleHBpcmVzT25bYWNjZXNzVG9rZW5VcmVhbG1YY2xpZW50SUSAChIFZb26gAiABIAFgAaAA4AJgAJfECBjMmNjOTc0Nzk4ZDQ0ODVkOTY2ZmJhNzczYThmN2VmOF8QV3ZJZDUtY0ZnTlp4bk4zQ2FHN182X1RoZXI3S2c2TXJ6MWJXTDBmYmlBYjhlVEN2a19NOWVlbkNDWksyV3BkYmpzcWlfTnZkQVZ6UU0xRnhTUGk3ck9RMl8QgTMwTEZ4QnFUYlNYMk9ibXZUSWRSYzlqeUZFT2k3MDhBeFNZWDBhZjlhOHRQbXUwcUxnd3Vla0RkejZzTVR2RlRMNEp2RlFiLTZacHFObkM2anQzY3d1SjMxRzk2eWJTVGNVUnlGYldrUnViTVAzeGZfODJEVEloS0VVeG0tOC1LMFZCZWFyZXLSIAkhIldOUy50aW1lI0G9/aozoQANgAfSJCUmJ1okY2xhc3NuYW1lWCRjbGFzc2VzVk5TRGF0ZaImKFhOU09iamVjdF8QFFBvJ2t1cGF0ZWwgQm9sb3NrYXJsU2VzadIkJSwtXxASRVZFQVBJLk9BdXRoMlRva2Vuoi4oXxASRVZFQVBJLk9BdXRoMlRva2VuXxAPTlNLZXllZEFyY2hpdmVy0TEyVHJvb3SAAQAIABEAGgAjAC0AMgA3AEMASQBcAGMAbwB9AIoAlACeAKoAsAC5ALsAwADCAMQAxgDIAMoAzADOAPEBSwHPAdYB2wHjAewB7gHzAf4CBwIOAhECGgIxAjUCOgJPAlICZwJ5AnwCgQAAAAAAAAIBAAAAAAAAADMAAAAAAAAAAAAAAAAAAAKD")
		let token = NSKeyedUnarchiver.unarchiveObject(with: data!) as! OAuth2Token
		
		var handler: OAuth2Handler? = OAuth2Handler(token: token, clientID: "c2cc974798d4485d966fba773a8f7ef8", secretKey: "GNhSE9GJ6q3QiuPSTIJ8Q1J6on4ClM4v9zvc0Qzu")
		
//		handler?.refreshToken { (error) in
//			print("\(error)")
//			handler = nil
//		}
		
		var api: ESAPI? = ESAPI(token: token, clientID: "c2cc974798d4485d966fba773a8f7ef8", secretKey: "GNhSE9GJ6q3QiuPSTIJ8Q1J6on4ClM4v9zvc0Qzu")
		api?.alliances { (result) in
			switch result {
			case let .success(value):
				print("\(value)")
			case let .failure(error):
				print("\(error)")
			}
			api = nil
		}
		
//		
//		api.allianceNames(allianceIDs: [99000002, 99000001], completionBlock: {(result, error) -> Void in
//			print ("\(result!.names)")
//			})
//		
//		api.marketHistory(typeID: 645, regionID: 10000002, completionBlock: { (prices, error) in
//			print("\(prices!)")
//		})
		
		/*let token = OAToken(clientID: "c2cc974798d4485d966fba773a8f7ef8", secretKey: "GNhSE9GJ6q3QiuPSTIJ8Q1J6on4ClM4v9zvc0Qzu")
		token.refreshToken = "ne0FFEggMPQi951Z7cWssyMmryocHBS609vgQCtVt-k1"
		token.refresh { (error) in
			var api: ESAPI?
			api = ESAPI(token: token, cachePolicy: .useProtocolCachePolicy)
			api?.character(completionBlock: { (result, error) in
				api = nil
				print("\(error)")
			})
			print ("accessToken: \(token.accessToken!)")
			print ("characterID: \(token.characterID)")
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
	
	func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
		return OAuth2Handler.handleOpenURL(url, clientID: "c2cc974798d4485d966fba773a8f7ef8", secretKey: "GNhSE9GJ6q3QiuPSTIJ8Q1J6on4ClM4v9zvc0Qzu", completionHandler: {result in
			guard case let .success(token) = result else {return}
			let s = NSKeyedArchiver.archivedData(withRootObject: token).base64EncodedString()
			print ("\(s)")
		})
		//return OAuth2Handler.handleOpenURL(url)
	}


}

