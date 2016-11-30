//
//  ArrayExtension.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 30.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation

extension Array: Hashable {
	public static func ==(lhs: Array<Element>, rhs: Array<Element>) -> Bool {
		return lhs.hashValue == rhs.hashValue
	}
	
	public var hashValue: Int {
		get {
			var seed = 1
			for (element) in self {
				if let v = element as? AnyHashable {
					hashCombine(seed: &seed, value: v.hashValue)
				}
				else if let h = (element as AnyObject).hashValue {
					hashCombine(seed: &seed, value: h)
				}
			}
			return seed
		}}
}

