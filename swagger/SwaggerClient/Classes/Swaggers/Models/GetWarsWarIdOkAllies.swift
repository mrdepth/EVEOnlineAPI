//
// GetWarsWarIdOkAllies.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


/** ally object */
public class GetWarsWarIdOkAllies: JSONEncodable {
    /** Alliance ID if and only if this ally is an alliance */
    public var allianceId: Int32?
    /** Corporation ID if and only if this ally is a corporation */
    public var corporationId: Int32?

    public init() {}

    // MARK: JSONEncodable
    func encodeToJSON() -> AnyObject {
        var nillableDictionary = [String:AnyObject?]()
        nillableDictionary["alliance_id"] = self.allianceId?.encodeToJSON()
        nillableDictionary["corporation_id"] = self.corporationId?.encodeToJSON()
        let dictionary: [String:AnyObject] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
