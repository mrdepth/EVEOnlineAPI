//
// GetUniverseStructuresStructureIdForbidden.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


/** Forbidden */
public class GetUniverseStructuresStructureIdForbidden: JSONEncodable {
    /** Forbidden message */
    public var error: String?

    public init() {}

    // MARK: JSONEncodable
    func encodeToJSON() -> AnyObject {
        var nillableDictionary = [String:AnyObject?]()
        nillableDictionary["error"] = self.error
        let dictionary: [String:AnyObject] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
