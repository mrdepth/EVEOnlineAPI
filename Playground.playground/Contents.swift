//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import EVEAPI
//import AFNetworking
import ObjectiveC

PlaygroundPage.current.needsIndefiniteExecution = true

var str = "Hello, playground"

let url = URL(string: "neocom://sso?code=4ZR17_Ti57jWfNRalzlvLBcear25s0T-ZXqTCByvQfbD2g091kRw4m95dWTcPy800&state=C0C9B7C1-5374-475D-9C96-7BFD728AB7FF")

let components = URLComponents(url: url!, resolvingAgainstBaseURL: false)
for item in components!.queryItems! {
	print("\(item.name) = \(item.value)")
}

let s = "2015-11-04T00:00:00Z"
let formatter = DateFormatter()
formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
formatter.date(from: s)


public enum EVESchemeElementType1 {
	case Array(elementName:String?, type:Any.Type)
}

let type = EVESchemeElementType1.Array(elementName: nil, type: EVECharacterSheet.self)
//let type = EVESchemeElementType1.Array(elementName: nil, type: Int.self)

switch type {
case let .Array(str, type) where type is EVEObject.Type:
	(type as! EVEObject.Type).init(dictionary: [:])
	//type
	//type(dictionary:[:])
	//type(of: type)(dictionary:[:])
	//type.init(dictionary: [:])
case let .Array(str, type) where type is Int.Type:
	type
default:
	break
}

