//
//  EVEAPISerializer.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 28.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit
import AFNetworking

public enum EVEAPISerializerError: Error {
	case InvalidData
}

public class EVEAPISerializer: AFHTTPResponseSerializer {
	let type:EVEResult.Type?
	public init(type: EVEResult.Type) {
		self.type = type
		super.init()
	}
	
	public required init?(coder: NSCoder) {
		self.type = nil
		super.init(coder: coder)
		self.acceptableStatusCodes?.insert(403)
	}
	
	override public func responseObject(for response: URLResponse?, data: Data?, error: NSErrorPointer) -> Any? {
		do {
			guard let type = self.type else {throw EVEAPISerializerError.InvalidData}
			guard let unwrappedData = data else {throw EVEAPISerializerError.InvalidData}
			guard let dic = try XMLParser.xmlObject(data: unwrappedData) as? [String:Any] else {throw EVEAPISerializerError.InvalidData}
			
			guard let eveapi = dic["eveapi"] as? [String:Any], let api = EVEAPIObject(dictionary:eveapi) else {throw EVEAPISerializerError.InvalidData}
			guard let result = eveapi["result"] as? [String:Any], let object = type.init(dictionary:result) else {
				throw api.error ?? EVEAPISerializerError.InvalidData
			}
			object.eveapi = api
			return object
		}
		catch let err {
			error?.pointee = err as NSError
			return nil
		}
	}
}
