//
//  Future.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 13.03.2018.
//  Copyright © 2018 Artem Shimanski. All rights reserved.
//

import Foundation

public extension OperationQueue {
	
	convenience init (qos: QualityOfService, maxConcurrentOperationCount: Int = OperationQueue.defaultMaxConcurrentOperationCount) {
		self.init()
		self.qualityOfService = qos
		self.maxConcurrentOperationCount = maxConcurrentOperationCount
	}
	
	@discardableResult
	public func async<Value>(_ execute: @escaping () throws -> Value) -> Future<Value> {
		let promise = Promise<Value>()
		addOperation {
			do {
				try promise.set(.success(execute()))
			}
			catch {
				try! promise.set(.failure(error))
			}
		}
		return promise.future
	}
}

public extension NSLocking {
	public func perform<Value>(_ execute: () throws -> Value) rethrows -> Value {
		do {
			lock()
			let rval = try execute()
			unlock()
			return rval
		}
		catch {
			unlock()
			throw error
		}
	}
}

public enum FutureResult<Value> {
	case success(Value)
	case failure(Error)
}

public enum FutureError: Error {
	case promiseAlreadySatisfied
	case timeout
}

open class Future<Value>: NSLocking {
	
	fileprivate var result: FutureResult<Value>? {
		didSet {
			condition.broadcast()
		}
	}
	fileprivate var condition = NSCondition()
	fileprivate var success = [(DispatchQueue?, (Value) -> Void)]()
	fileprivate var failure = [(DispatchQueue?, (Error) -> Void)]()
	fileprivate var finally = [(DispatchQueue?, () -> Void)]()
	
	public func lock() {
		condition.lock()
	}
	
	public func unlock() {
		condition.unlock()
	}
	
	public func get(until: Date = .distantFuture) throws -> Value {
		return try condition.perform {
			while result == nil && Date() < until {
				condition.wait(until: until)
			}
			switch result {
			case let .success(value)?:
				return value
			case let .failure(error)?:
				throw error
			default:
				throw FutureError.timeout
			}
		}
	}
	
	@discardableResult
	public func then<Result>(queue: DispatchQueue? = nil, _ execute: @escaping (Value) throws -> Result) -> Future<Result> {
		return then(queue: queue) { (value: Value, promise: Promise<Result>) in
			try promise.set(.success(execute(value)))
		}
	}

	@discardableResult
	public func then<Result>(queue: DispatchQueue? = nil, _ execute: @escaping (Value) throws -> Future<Result>) -> Future<Result> {
		return then(queue: queue) { (value: Value, promise: Promise<Result>) in
			try execute(value).then { value in
				try! promise.set(.success(value))
			}.catch { error in
				try! promise.set(.failure(error))
			}
//			try promise.set(.success(execute(value)))
		}
	}

	@discardableResult
	public func then<Result>(queue: DispatchQueue? = nil, _ execute: @escaping (Value, Promise<Result>) throws -> Void) -> Future<Result> {
		
		let promise = Promise<Result>()
		let finalize = { (value: Value) in
			do {
				try execute(value, promise)
			}
			catch {
				try! promise.set(.failure(error))
			}
		}
		
		condition.perform { () -> (() -> Void)? in
			switch result {
			case let .success(value)?:
				return {finalize(value)}
			case let .failure(error)?:
				return {try! promise.set(.failure(error))}
			default:
				success.append((queue, finalize))
				failure.append((queue, { error in try! promise.set(.failure(error)) }))
				return nil
			}
			}?()
		
		return promise.future
	}
	
	@discardableResult
	public func `catch`(queue: DispatchQueue? = nil, _ execute: @escaping (Error) -> Void) -> Self {
		condition.perform { () -> (() -> Void)? in
			switch result {
			case let .failure(error)?:
				return {execute(error)}
			case .success?:
				return nil
			default:
				failure.append((queue, execute))
				return nil
			}
		}?()
		return self
	}
	
	@discardableResult
	public func finally(queue: DispatchQueue? = nil, _ execute: @escaping () -> Void) -> Self {
		
		condition.perform { () -> (() -> Void)? in
			if result != nil {
				return {execute()}
			}
			else {
				finally.append((queue, execute))
				return nil
			}
		}?()
		return self
	}
}

open class Promise<Value> {
	open var future = Future<Value>()
	
	public init() {}
	
	open func set(_ result: FutureResult<Value>) throws {
		try future.perform { () -> () -> Void in
			guard future.result == nil else {throw FutureError.promiseAlreadySatisfied}
			defer {
				future.success = []
				future.failure = []
				future.finally = []
			}
			
			future.result = result
			switch result {
			case let .success(value):
				let execute = self.future.success
				let finally = self.future.finally
				return {
					execute.forEach { (queue, block) in
						if let queue = queue {
							queue.async {
								block(value)
							}
						}
						else {
							block(value)
						}
					}
					finally.forEach { (queue, block) in
						if let queue = queue {
							queue.async {
								block()
							}
						}
						else {
							block()
						}
					}
				}
			case let .failure(error):
				let execute = self.future.failure
				let finally = self.future.finally
				return {
					execute.forEach { (queue, block) in
						if let queue = queue {
							queue.async {
								block(error)
							}
						}
						else {
							block(error)
						}
					}
					finally.forEach { (queue, block) in
						if let queue = queue {
							queue.async {
								block()
							}
						}
						else {
							block()
						}
					}
				}
			}
			}()
	}
}

