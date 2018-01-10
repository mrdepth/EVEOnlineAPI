//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
//import EVEAPI
//import AFNetworking
import ObjectiveC
//import Alamofire

let data = "{24234.444}".data(using: .utf8)!

let d = try? JSONDecoder().decode(Double.self, from: data)

print("\(d)")
