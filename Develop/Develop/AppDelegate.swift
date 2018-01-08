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

let clientID = "a0cc80b7006944249313dc22205ec645"
let secretKey = "deUqMep7TONp68beUoC1c71oabAdKQOJdbiKpPcC"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	

	var window: UIWindow?

	enum SerializationError: Error {
		case dateFormatError
	}

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

		
		
		return true
		let s = "YnBsaXN0MDDUAQIDBAUGa2xYJHZlcnNpb25YJG9iamVjdHNZJGFyY2hpdmVyVCR0b3ASAAGGoK8QJwcIGxwdHj0+P0BBQkNERUZHSElKS0xNTk9QUVJTVFVWV1heYmVmZ1UkbnVsbNkJCgsMDQ4PEBESExQVFhcYGRpWc2NvcGVzViRjbGFzc1tjaGFyYWN0ZXJJRF1jaGFyYWN0ZXJOYW1lXHJlZnJlc2hUb2tlbll0b2tlblR5cGVZZXhwaXJlc09uW2FjY2Vzc1Rva2VuVXJlYWxtgAWAJhIFZb26gCSAA4AEgCKAAoAlXxBXRlVwTk9jRUJram5xbXlqRXNETm1oQVpLVjV4aUcwNVFOSG9SX0NSUktrd014VzRJLTVwMi1zSVcydlkzNmFYVE1oc2xnMk5RakdpUVMwOGdpVEZ6X0EyXxDBaFdVTEFiX1JqUDZ4ZEFXRXRGRkgxZS1PbURFWE04a1BJS3VkenlKRFZ4dHh2cVl4dXpBQnpyakNaQ3lnLXZ2RDNpZXkyTERuTVRwV1JzRHozNklSNGhjY3NmQ3hlZGxfQjRPcjZmWC1FaHY3ekpMMWJrSE0tSmJYVkxHMDdsTFBUNHZac2hLMkxSczBfa3kzZUFaZ2d3aUhmam1Da0NNcUltczlHVXNSRzBFLTBGcUNuaHdmNExvenZkN1VORmlWMFZCZWFyZXLSHwogPFpOUy5vYmplY3RzrxAbISIjJCUmJygpKissLS4vMDEyMzQ1Njc4OTo7gAaAB4AIgAmACoALgAyADYAOgA+AEIARgBKAE4AUgBWAFoAXgBiAGYAagBuAHIAdgB6AH4AggCFfEBNjaGFyYWN0ZXJXYWxsZXRSZWFkXxAnZXNpLWNhbGVuZGFyLnJlc3BvbmRfY2FsZW5kYXJfZXZlbnRzLnYxXxAkZXNpLWNhbGVuZGFyLnJlYWRfY2FsZW5kYXJfZXZlbnRzLnYxXxAdZXNpLWxvY2F0aW9uLnJlYWRfbG9jYXRpb24udjFfEB5lc2ktbG9jYXRpb24ucmVhZF9zaGlwX3R5cGUudjFfEBllc2ktbWFpbC5vcmdhbml6ZV9tYWlsLnYxXxAVZXNpLW1haWwucmVhZF9tYWlsLnYxXxAVZXNpLW1haWwuc2VuZF9tYWlsLnYxXxAZZXNpLXNraWxscy5yZWFkX3NraWxscy52MV8QHWVzaS1za2lsbHMucmVhZF9za2lsbHF1ZXVlLnYxXxAjZXNpLXdhbGxldC5yZWFkX2NoYXJhY3Rlcl93YWxsZXQudjFfEB9lc2ktc2VhcmNoLnNlYXJjaF9zdHJ1Y3R1cmVzLnYxXxAZZXNpLWNsb25lcy5yZWFkX2Nsb25lcy52MV8QH2VzaS11bml2ZXJzZS5yZWFkX3N0cnVjdHVyZXMudjFfEB9lc2kta2lsbG1haWxzLnJlYWRfa2lsbG1haWxzLnYxXxAZZXNpLWFzc2V0cy5yZWFkX2Fzc2V0cy52MV8QHWVzaS1wbGFuZXRzLm1hbmFnZV9wbGFuZXRzLnYxXxAdZXNpLWZpdHRpbmdzLnJlYWRfZml0dGluZ3MudjFfEB5lc2ktZml0dGluZ3Mud3JpdGVfZml0dGluZ3MudjFfECBlc2ktbWFya2V0cy5zdHJ1Y3R1cmVfbWFya2V0cy52MV8QHmVzaS1jaGFyYWN0ZXJzLnJlYWRfbG95YWx0eS52MV8QIGVzaS1jaGFyYWN0ZXJzLnJlYWRfc3RhbmRpbmdzLnYxXxAjZXNpLWluZHVzdHJ5LnJlYWRfY2hhcmFjdGVyX2pvYnMudjFfECRlc2ktbWFya2V0cy5yZWFkX2NoYXJhY3Rlcl9vcmRlcnMudjFfECFlc2ktY2hhcmFjdGVycy5yZWFkX2JsdWVwcmludHMudjFfECllc2ktY29udHJhY3RzLnJlYWRfY2hhcmFjdGVyX2NvbnRyYWN0cy52MV8QG2VzaS1jbG9uZXMucmVhZF9pbXBsYW50cy52MdJZWltcWiRjbGFzc25hbWVYJGNsYXNzZXNXTlNBcnJheaJbXVhOU09iamVjdNJfCmBhV05TLnRpbWUjQcAByr5iziWAI9JZWmNkVk5TRGF0ZaJjXV8QFFBvJ2t1cGF0ZWwgQm9sb3NrYXJsU2VzadJZWmhpXxASRVZFQVBJLk9BdXRoMlRva2VuompdXxASRVZFQVBJLk9BdXRoMlRva2VuXxAPTlNLZXllZEFyY2hpdmVy0W1uVHJvb3SAAQAIABEAGgAjAC0AMgA3AGEAZwB6AIEAiACUAKIArwC5AMMAzwDVANcA2QDeAOAA4gDkAOYA6ADqAUQCCAIPAhQCHwI9Aj8CQQJDAkUCRwJJAksCTQJPAlECUwJVAlcCWQJbAl0CXwJhAmMCZQJnAmkCawJtAm8CcQJzAnUCiwK1AtwC/AMdAzkDUQNpA4UDpQPLA+0ECQQrBE0EaQSJBKkEygTtBQ4FMQVXBX4FogXOBewF8QX8BgUGDQYQBhkGHgYmBi8GMQY2Bj0GQAZXBlsGYAZ1BngGjQafBqIGpwAAAAAAAAIBAAAAAAAAAG8AAAAAAAAAAAAAAAAAAAap"
		let data = Data(base64Encoded: s)
		let token = NSKeyedUnarchiver.unarchiveObject(with: data!) as! OAuth2Token
		
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
		esi?.skills.getCharacterSkills(characterID: Int(token.characterID), completionBlock: { (result) in
			dispatchGroup.leave()
//			esi = nil
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
		OAuth2.handleOpenURL(url, clientID: clientID, secretKey: secretKey) { (result) in
			print("\(result.error))")
		}
		return true
	}


}

