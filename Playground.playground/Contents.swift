//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport


public enum AcceptLanguage: String, Codable, CustomStringConvertible {
	case de = "de"
	case enUS = "en-us"
	case fr = "fr"
	case ja = "ja"
	case ru = "ru"
	case zh = "zh"
	
	public var httpQuery: String? {
		return rawValue
	}
	
	public var description: String {
		return rawValue
	}
	
}

let t = AcceptLanguage.enUS

print("\(String(describing: "12"))")



