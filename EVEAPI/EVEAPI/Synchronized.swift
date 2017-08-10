//
//  Synchronized.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 26.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation

public func synchronized<ReturnType>(_ lockToken: AnyObject, action: () -> ReturnType) -> ReturnType {
	return synchronized(lockToken: lockToken, action: action())
}

public func synchronized<ReturnType>(lockToken: AnyObject, action: @autoclosure () -> ReturnType) -> ReturnType {
	defer { objc_sync_exit(lockToken) }
	objc_sync_enter(lockToken)
	return action()
}
