//
// PlanetaryInteractionAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Alamofire



public class PlanetaryInteractionAPI: APIBase {
    /**
     * enum for parameter datasource
     */
    public enum Datasource_getCharactersCharacterIdPlanets: String { 
        case Tranquility = "tranquility"
        case Singularity = "singularity"
    }

    /**
     Get colonies
     
     - parameter characterId: (path) Character id of the target character 
     - parameter datasource: (query) The server name you would like data from (optional, default to tranquility)
     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func getCharactersCharacterIdPlanets(characterId characterId: Int32, datasource: Datasource_getCharactersCharacterIdPlanets? = nil, completion: ((data: [GetCharactersCharacterIdPlanets200Ok]?, error: ErrorType?) -> Void)) {
        getCharactersCharacterIdPlanetsWithRequestBuilder(characterId: characterId, datasource: datasource).execute { (response, error) -> Void in
            completion(data: response?.body, error: error);
        }
    }


    /**
     Get colonies
     - GET /characters/{characterId}/planets/
     - Returns a list of all planetary colonies owned by a character.  ---  Alternate route: `/v1/characters/{character_id}/planets/`  Alternate route: `/legacy/characters/{character_id}/planets/`  Alternate route: `/dev/characters/{character_id}/planets/`   ---  This route is cached for up to 600 seconds
     - OAuth:
       - type: oauth2
       - name: evesso
     - responseHeaders: [Cache-Control(String), Expires(String), Last-Modified(String)]
     - responseHeaders: [Cache-Control(String), Expires(String), Last-Modified(String)]
     - responseHeaders: [Cache-Control(String), Expires(String), Last-Modified(String)]
     - examples: [{contentType=application/json, example=[ {
  "last_update" : "2016-11-28T16:42:51Z",
  "num_pins" : 1,
  "owner_id" : 90000001,
  "planet_id" : 40023691,
  "planet_type" : "plasma",
  "solar_system_id" : 30000379,
  "upgrade_level" : 0
}, {
  "last_update" : "2016-11-28T16:41:54Z",
  "num_pins" : 1,
  "owner_id" : 90000001,
  "planet_id" : 40023697,
  "planet_type" : "barren",
  "solar_system_id" : 30000379,
  "upgrade_level" : 0
} ]}]
     
     - parameter characterId: (path) Character id of the target character 
     - parameter datasource: (query) The server name you would like data from (optional, default to tranquility)

     - returns: RequestBuilder<[GetCharactersCharacterIdPlanets200Ok]> 
     */
    public class func getCharactersCharacterIdPlanetsWithRequestBuilder(characterId characterId: Int32, datasource: Datasource_getCharactersCharacterIdPlanets? = nil) -> RequestBuilder<[GetCharactersCharacterIdPlanets200Ok]> {
        var path = "/characters/{characterId}/planets/"
        path = path.stringByReplacingOccurrencesOfString("{characterId}", withString: "\(characterId)", options: .LiteralSearch, range: nil)
        let URLString = SwaggerClientAPI.basePath + path

        let nillableParameters: [String:AnyObject?] = [
            "datasource": datasource?.rawValue
        ]
 
        let parameters = APIHelper.rejectNil(nillableParameters)
 
        let convertedParameters = APIHelper.convertBoolToString(parameters)
 
        let requestBuilder: RequestBuilder<[GetCharactersCharacterIdPlanets200Ok]>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, isBody: false)
    }

    /**
     * enum for parameter datasource
     */
    public enum Datasource_getCharactersCharacterIdPlanetsPlanetId: String { 
        case Tranquility = "tranquility"
        case Singularity = "singularity"
    }

    /**
     Get colony layout
     
     - parameter characterId: (path) Character id of the target character 
     - parameter planetId: (path) Planet id of the target planet 
     - parameter datasource: (query) The server name you would like data from (optional, default to tranquility)
     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func getCharactersCharacterIdPlanetsPlanetId(characterId characterId: Int32, planetId: Int32, datasource: Datasource_getCharactersCharacterIdPlanetsPlanetId? = nil, completion: ((data: GetCharactersCharacterIdPlanetsPlanetIdOk?, error: ErrorType?) -> Void)) {
        getCharactersCharacterIdPlanetsPlanetIdWithRequestBuilder(characterId: characterId, planetId: planetId, datasource: datasource).execute { (response, error) -> Void in
            completion(data: response?.body, error: error);
        }
    }


    /**
     Get colony layout
     - GET /characters/{characterId}/planets/{planetId}/
     - Returns full details on the layout of a single planetary colony, including links, pins and routes. Note: Planetary information is only recalculated when the colony is viewed through the client. Information on this endpoint will not update until this criteria is met.  ---  Alternate route: `/v1/characters/{character_id}/planets/{planet_id}/`  Alternate route: `/legacy/characters/{character_id}/planets/{planet_id}/`  Alternate route: `/dev/characters/{character_id}/planets/{planet_id}/`   ---  This route is cached for up to 600 seconds
     - OAuth:
       - type: oauth2
       - name: evesso
     - responseHeaders: [Cache-Control(String), Expires(String), Last-Modified(String)]
     - responseHeaders: [Cache-Control(String), Expires(String), Last-Modified(String)]
     - responseHeaders: [Cache-Control(String), Expires(String), Last-Modified(String)]
     - examples: [{contentType=application/json, example={
  "links" : [ {
    "destination_pin_id" : 1000000017022,
    "link_level" : 0,
    "source_pin_id" : 1000000017021
  } ],
  "pins" : [ {
    "is_running" : true,
    "latitude" : 1.55087844973,
    "longitude" : 0.717145933308,
    "pin_id" : 1000000017021,
    "type_id" : 2254
  }, {
    "is_running" : true,
    "latitude" : 1.53360639935,
    "longitude" : 0.709775584394,
    "pin_id" : 1000000017022,
    "type_id" : 2256
  } ],
  "routes" : [ {
    "content_type_id" : 2393,
    "destination_pin_id" : 1000000017030,
    "quantity" : 20,
    "route_id" : 4,
    "source_pin_id" : 1000000017029
  } ]
}}]
     
     - parameter characterId: (path) Character id of the target character 
     - parameter planetId: (path) Planet id of the target planet 
     - parameter datasource: (query) The server name you would like data from (optional, default to tranquility)

     - returns: RequestBuilder<GetCharactersCharacterIdPlanetsPlanetIdOk> 
     */
    public class func getCharactersCharacterIdPlanetsPlanetIdWithRequestBuilder(characterId characterId: Int32, planetId: Int32, datasource: Datasource_getCharactersCharacterIdPlanetsPlanetId? = nil) -> RequestBuilder<GetCharactersCharacterIdPlanetsPlanetIdOk> {
        var path = "/characters/{characterId}/planets/{planetId}/"
        path = path.stringByReplacingOccurrencesOfString("{characterId}", withString: "\(characterId)", options: .LiteralSearch, range: nil)
        path = path.stringByReplacingOccurrencesOfString("{planetId}", withString: "\(planetId)", options: .LiteralSearch, range: nil)
        let URLString = SwaggerClientAPI.basePath + path

        let nillableParameters: [String:AnyObject?] = [
            "datasource": datasource?.rawValue
        ]
 
        let parameters = APIHelper.rejectNil(nillableParameters)
 
        let convertedParameters = APIHelper.convertBoolToString(parameters)
 
        let requestBuilder: RequestBuilder<GetCharactersCharacterIdPlanetsPlanetIdOk>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, isBody: false)
    }

    /**
     * enum for parameter datasource
     */
    public enum Datasource_getUniverseSchematicsSchematicId: String { 
        case Tranquility = "tranquility"
        case Singularity = "singularity"
    }

    /**
     Get schematic information
     
     - parameter schematicId: (path) A PI schematic ID 
     - parameter datasource: (query) The server name you would like data from (optional, default to tranquility)
     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func getUniverseSchematicsSchematicId(schematicId schematicId: Int32, datasource: Datasource_getUniverseSchematicsSchematicId? = nil, completion: ((data: GetUniverseSchematicsSchematicIdOk?, error: ErrorType?) -> Void)) {
        getUniverseSchematicsSchematicIdWithRequestBuilder(schematicId: schematicId, datasource: datasource).execute { (response, error) -> Void in
            completion(data: response?.body, error: error);
        }
    }


    /**
     Get schematic information
     - GET /universe/schematics/{schematicId}/
     - Get information on a planetary factory schematic  ---  Alternate route: `/v1/universe/schematics/{schematic_id}/`  Alternate route: `/legacy/universe/schematics/{schematic_id}/`  Alternate route: `/dev/universe/schematics/{schematic_id}/`   ---  This route is cached for up to 3600 seconds
     - responseHeaders: [Cache-Control(String), Expires(String), Last-Modified(String)]
     - responseHeaders: [Cache-Control(String), Expires(String), Last-Modified(String)]
     - responseHeaders: [Cache-Control(String), Expires(String), Last-Modified(String)]
     - examples: [{contentType=application/json, example={
  "cycle_time" : 1800,
  "schematic_name" : "Bacteria"
}}]
     
     - parameter schematicId: (path) A PI schematic ID 
     - parameter datasource: (query) The server name you would like data from (optional, default to tranquility)

     - returns: RequestBuilder<GetUniverseSchematicsSchematicIdOk> 
     */
    public class func getUniverseSchematicsSchematicIdWithRequestBuilder(schematicId schematicId: Int32, datasource: Datasource_getUniverseSchematicsSchematicId? = nil) -> RequestBuilder<GetUniverseSchematicsSchematicIdOk> {
        var path = "/universe/schematics/{schematicId}/"
        path = path.stringByReplacingOccurrencesOfString("{schematicId}", withString: "\(schematicId)", options: .LiteralSearch, range: nil)
        let URLString = SwaggerClientAPI.basePath + path

        let nillableParameters: [String:AnyObject?] = [
            "datasource": datasource?.rawValue
        ]
 
        let parameters = APIHelper.rejectNil(nillableParameters)
 
        let convertedParameters = APIHelper.convertBoolToString(parameters)
 
        let requestBuilder: RequestBuilder<GetUniverseSchematicsSchematicIdOk>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, isBody: false)
    }

}
