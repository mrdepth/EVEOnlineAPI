//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
//import EVEAPI
//import AFNetworking
import ObjectiveC

PlaygroundPage.current.needsIndefiniteExecution = true

var str = "Hello, playground"

let url = URL(string: "neocom://sso?code=4ZR17_Ti57jWfNRalzlvLBcear25s0T-ZXqTCByvQfbD2g091kRw4m95dWTcPy800&state=C0C9B7C1-5374-475D-9C96-7BFD728AB7FF")

let components = URLComponents(url: url!, resolvingAgainstBaseURL: false)
for item in components!.queryItems! {
	print("\(item.name) = \(item.value)")
}