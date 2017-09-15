//
//  DictionaryExtension.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 26.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation

let salt = Int(truncatingIfNeeded: 0x9e3779b9 as UInt64)

func hashCombine(seed: inout Int, value: Int) {
	
	seed ^= value &+ salt &+ (seed << 6) &+ (seed >> 2);
}

extension Dictionary: Hashable {
	public static func ==(lhs: Dictionary<Key, Value>, rhs: Dictionary<Key, Value>) -> Bool {
		return lhs.hashValue == rhs.hashValue
	}
	
	public var hashValue: Int {
		get {
			var seed = 1
			for (key, value) in self.sorted(by: {
				if let a = $0.0 as? String, let b = $1.0 as? String {
					return a < b
				}
				else {
					return $0.0.hashValue < $1.0.hashValue
				}
			}) {
				hashCombine(seed: &seed, value: key.hashValue)
				if let v = value as? AnyHashable {
					hashCombine(seed: &seed, value: v.hashValue)
				}
				else if let h = (value as AnyObject).hashValue {
					hashCombine(seed: &seed, value: h)
				}
			}
			return seed
		}}
}

