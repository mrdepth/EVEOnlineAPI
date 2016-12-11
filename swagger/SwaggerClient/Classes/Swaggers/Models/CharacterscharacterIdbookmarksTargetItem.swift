//
// CharacterscharacterIdbookmarksTargetItem.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


/** item object */
public class CharacterscharacterIdbookmarksTargetItem: JSONEncodable {
    /** item_id integer */
    public var itemId: Int64?
    /** type_id integer */
    public var typeId: Int32?

    public init() {}

    // MARK: JSONEncodable
    func encodeToJSON() -> AnyObject {
        var nillableDictionary = [String:AnyObject?]()
        nillableDictionary["item_id"] = self.itemId?.encodeToJSON()
        nillableDictionary["type_id"] = self.typeId?.encodeToJSON()
        let dictionary: [String:AnyObject] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
