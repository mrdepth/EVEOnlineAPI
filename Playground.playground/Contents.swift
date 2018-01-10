//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
//import EVEAPI
//import AFNetworking
import ObjectiveC
//import Alamofire

class OAuth2ServerError: Error, Codable {
	let error: String
	let errorDescription: String
	
	init(error: String, errorDescription: String) {
		self.error = error
		self.errorDescription = errorDescription
	}
	
	enum CodingKeys: String, CodingKey {
		case error
		case errorDescription = "error_description"
	}
	
	var localizedDescription: String {
		return errorDescription
	}
}

let error: Error = OAuth2ServerError(error: "aa", errorDescription: "Some Description")

print ("\(error.localizedDescription)")
