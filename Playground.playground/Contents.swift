//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
//import EVEAPI
//import AFNetworking
import ObjectiveC

PlaygroundPage.current.needsIndefiniteExecution = true

var str = "Hello, playground"

DispatchQueue.main.async {
	var str = "asdf"
}

//let ids = [1,2,3,4,5]
//
//var s = ids.map {(i) in
//	return String(i)
//	}.joined(separator: ",")
//
//var api = EVEOnlineAPI(apiKey:EVEAPIKey(keyID: 519, vCode: "IiEPrrQTAdQtvWA2Aj805d0XBMtOyWBCc0zE57SGuqinJLKGTNrlinxc6v407Vmf"))
//api.accountStatus { (result, error) in
//	print("\(result)")
//}
//
//api.characters { (result, error) in
//	var r = result
//}


class A {
	private(set) lazy var v: Int = {
		print ("lazy")
		return 1
	}()
	
	init() {
		
	}
}

var a = A()
_ = a.v
_ = a.v