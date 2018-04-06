//
//  ArrayExtension.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 30.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation

extension Array: Hashable where Element: Hashable {
	public var hashValue: Int {
		return reduce(into: 1) { hashCombine(seed: &$0, value: $1.hashValue)}
	}
}

