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

//extension Dictionary: Hashable where Key: Comparable, Value: Hashable {
//	public var hashValue: Int {
//		return sorted {$0.key < $1.key}.reduce(into: 1) {
//			hashCombine(seed: &$0, value: $1.key.hashValue)
//			hashCombine(seed: &$0, value: $1.value.hashValue)
//		}
//	}
//}
//
