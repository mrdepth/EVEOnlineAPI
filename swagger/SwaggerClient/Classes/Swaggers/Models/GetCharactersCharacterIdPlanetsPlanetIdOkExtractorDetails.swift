//
// GetCharactersCharacterIdPlanetsPlanetIdOkExtractorDetails.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


/** extractor_details object */
public class GetCharactersCharacterIdPlanetsPlanetIdOkExtractorDetails: JSONEncodable {
    /** in seconds */
    public var cycleTime: Int32?
    /** head_radius number */
    public var headRadius: Float?
    /** heads array */
    public var heads: [GetCharactersCharacterIdPlanetsPlanetIdOkExtractorDetailsHeads]?
    /** product_type_id integer */
    public var productTypeId: Int32?
    /** qty_per_cycle integer */
    public var qtyPerCycle: Int32?

    public init() {}

    // MARK: JSONEncodable
    func encodeToJSON() -> AnyObject {
        var nillableDictionary = [String:AnyObject?]()
        nillableDictionary["cycle_time"] = self.cycleTime?.encodeToJSON()
        nillableDictionary["head_radius"] = self.headRadius
        nillableDictionary["heads"] = self.heads?.encodeToJSON()
        nillableDictionary["product_type_id"] = self.productTypeId?.encodeToJSON()
        nillableDictionary["qty_per_cycle"] = self.qtyPerCycle?.encodeToJSON()
        let dictionary: [String:AnyObject] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
