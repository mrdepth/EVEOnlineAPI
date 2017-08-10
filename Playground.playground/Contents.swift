//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import EVEAPI
//import AFNetworking
import ObjectiveC

//PlaygroundPage.current.needsIndefiniteExecution = true

var str = "Hello, playground"

let s = "#FFFF7755"

if s[s.startIndex] == "#" {
	let end = s.endIndex
	var start = s.index(after: s.startIndex)
	var rgba: [CGFloat] = [0, 0, 0, 1]
	var i = 0
	while start < end {
		let end = min(s.index(start, offsetBy: 2), end)
		let scanner = Scanner(string: s.substring(with: start..<end))
		var n: UInt32 = 0
		scanner.scanHexInt32(&n)
		rgba[i] = CGFloat(n) / 255.0
		start = end
		i += 1
	}
	UIColor(red: rgba[0], green: rgba[1], blue: rgba[2], alpha: rgba[3])
}