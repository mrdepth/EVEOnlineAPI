//
// PostFleetsFleetIdWingsCreated.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


/** 201 created object */
public class PostFleetsFleetIdWingsCreated: JSONEncodable {
    /** The wing_id of the newly created wing */
    public var wingId: Int64?

    public init() {}

    // MARK: JSONEncodable
    func encodeToJSON() -> AnyObject {
        var nillableDictionary = [String:AnyObject?]()
        nillableDictionary["wing_id"] = self.wingId?.encodeToJSON()
        let dictionary: [String:AnyObject] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
