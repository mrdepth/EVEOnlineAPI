//
//  EVEResult.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 28.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

public class EVEResult: EVEObject, EVEHTTPCachedContent {
	var eveapi: EVEAPIObject?
	
	public var currentTime: Date? {return eveapi?.currentTime}
	public var cachedUntil: Date? {return eveapi?.cachedUntil}
	public var cacheDate: Date? {
		get {
			return eveapi?.cacheDate ?? Date()
		}
		set {
			eveapi?.cacheDate = newValue ?? Date()
		}
	}

}
