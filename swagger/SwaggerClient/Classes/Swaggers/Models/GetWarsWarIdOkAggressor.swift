//
// GetWarsWarIdOkAggressor.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


/** The aggressor corporation or alliance that declared this war, only contains either corporation_id or alliance_id */
public class GetWarsWarIdOkAggressor: JSONEncodable {
    /** Alliance ID if and only if the aggressor is an alliance */
    public var allianceId: Int32?
    /** Corporation ID if and only if the aggressor is a corporation */
    public var corporationId: Int32?
    /** ISK value of ships the aggressor has destroyed */
    public var iskDestroyed: Float?
    /** The number of ships the aggressor has killed */
    public var shipsKilled: Int32?

    public init() {}

    // MARK: JSONEncodable
    func encodeToJSON() -> AnyObject {
        var nillableDictionary = [String:AnyObject?]()
        nillableDictionary["alliance_id"] = self.allianceId?.encodeToJSON()
        nillableDictionary["corporation_id"] = self.corporationId?.encodeToJSON()
        nillableDictionary["isk_destroyed"] = self.iskDestroyed
        nillableDictionary["ships_killed"] = self.shipsKilled?.encodeToJSON()
        let dictionary: [String:AnyObject] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
