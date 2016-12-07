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
		
		/*let api = EVEOnlineAPI(apiKey:EVEAPIKey(keyID: 519, vCode: "IiEPrrQTAdQtvWA2Aj805d0XBMtOyWBCc0zE57SGuqinJLKGTNrlinxc6v407Vmf"))
		api.accountStatus { (result, error) in
			print("\(result)")
		}
		
		let token = OAToken(clientID: "c2cc974798d4485d966fba773a8f7ef8", secretKey: "GNhSE9GJ6q3QiuPSTIJ8Q1J6on4ClM4v9zvc0Qzu")
		token.refreshToken = "HuBp_J9nxaqmtpXXb9HLTR0pimVFp_na9EGi4KsQDIWraCHzNmywDFjBcKdYe6hI0"
		token.refresh { (error) in
			var api: CRAPI?
			api = CRAPI(token: token, cachePolicy: .useProtocolCachePolicy)
			api?.fittings(completionBlock: { (result, error) in
				api = nil
				print("\(error)")
			})
			print ("accessToken: \(token.accessToken!)")
			print ("characterID: \(token.characterID)")
		}
		
//		var oauth: OAuth?
//		oauth = CRAPI.oauth(clientID: "c2cc974798d4485d966fba773a8f7ef8", secretKey: "GNhSE9GJ6q3QiuPSTIJ8Q1J6on4ClM4v9zvc0Qzu", callbackURL: URL(string: "neocom://sso")!, scope: CRAPIScope.all)
//		oauth?.authenticate { (token, error) in
//		}*/
		
		
		/*var oauth: OAuth?
		oauth = ESAPI.oauth(clientID: "c2cc974798d4485d966fba773a8f7ef8", secretKey: "GNhSE9GJ6q3QiuPSTIJ8Q1J6on4ClM4v9zvc0Qzu", callbackURL: URL(string: "neocom://sso")!, scope: ESScope.all)
		oauth?.authenticate(completionBlock: { (token, error) in
			print ("accessToken: \(token!.accessToken!)")
			print ("characterID: \(token!.characterID)")
			print ("refreshToken: \(token!.refreshToken!)")
			print ("tokenType: \(token!.tokenType!)")
			oauth = nil

		})*/
		
		let token = OAToken(clientID: "c2cc974798d4485d966fba773a8f7ef8", secretKey: "GNhSE9GJ6q3QiuPSTIJ8Q1J6on4ClM4v9zvc0Qzu")
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
		return OAuth.handleOpenURL(url)
	}


}

