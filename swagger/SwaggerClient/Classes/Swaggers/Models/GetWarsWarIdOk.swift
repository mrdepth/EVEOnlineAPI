//
// GetWarsWarIdOk.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


/** 200 ok object */
public class GetWarsWarIdOk: JSONEncodable {
    public var aggressor: GetWarsWarIdOkAggressor?
    /** allied corporations or alliances, each object contains either corporation_id or alliance_id */
    public var allies: [GetWarsWarIdOkAllies]?
    /** Time that the war was declared */
    public var declared: NSDate?
    public var defender: GetWarsWarIdOkDefender?
    /** Time the war ended and shooting was no longer allowed */
    public var finished: NSDate?
    /** ID of the specified war */
    public var id: Int32?
    /** Was the war declared mutual by both parties */
    public var mutual: Bool?
    /** Is the war currently open for allies or not */
    public var openForAllies: Bool?
    /** Time the war was retracted but both sides could still shoot each other */
    public var retracted: NSDate?
    /** Time when the war started and both sides could shoot each other */
    public var started: NSDate?

    public init() {}

    // MARK: JSONEncodable
    func encodeToJSON() -> AnyObject {
        var nillableDictionary = [String:AnyObject?]()
        nillableDictionary["aggressor"] = self.aggressor?.encodeToJSON()
        nillableDictionary["allies"] = self.allies?.encodeToJSON()
        nillableDictionary["declared"] = self.declared?.encodeToJSON()
        nillableDictionary["defender"] = self.defender?.encodeToJSON()
        nillableDictionary["finished"] = self.finished?.encodeToJSON()
        nillableDictionary["id"] = self.id?.encodeToJSON()
        nillableDictionary["mutual"] = self.mutual
        nillableDictionary["open_for_allies"] = self.openForAllies
        nillableDictionary["retracted"] = self.retracted?.encodeToJSON()
        nillableDictionary["started"] = self.started?.encodeToJSON()
        let dictionary: [String:AnyObject] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
