//
//  EVEHTTPCachedContent.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 26.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation

@objc protocol EVEHTTPCachedContent {
	var currentTime: Date? {get}
	var cachedUntil: Date? {get}
	var cacheDate: Date? {get set}
}
