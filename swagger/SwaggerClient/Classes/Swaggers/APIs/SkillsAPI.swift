//
// SkillsAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Alamofire



public class SkillsAPI: APIBase {
    /**
     * enum for parameter datasource
     */
    public enum Datasource_getCharactersCharacterIdSkillqueue: String { 
        case Tranquility = "tranquility"
        case Singularity = "singularity"
    }

    /**
     Get character's skill queue
     
     - parameter characterId: (path) Character id of the target character 
     - parameter datasource: (query) The server name you would like data from (optional, default to tranquility)
     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func getCharactersCharacterIdSkillqueue(characterId characterId: Int32, datasource: Datasource_getCharactersCharacterIdSkillqueue? = nil, completion: ((data: [GetCharactersCharacterIdSkillqueue200Ok]?, error: ErrorType?) -> Void)) {
        getCharactersCharacterIdSkillqueueWithRequestBuilder(characterId: characterId, datasource: datasource).execute { (response, error) -> Void in
            completion(data: response?.body, error: error);
        }
    }


    /**
     Get character's skill queue
     - GET /characters/{characterId}/skillqueue/
     - List the configured skill queue for the given character  ---  Alternate route: `/v2/characters/{character_id}/skillqueue/`  Alternate route: `/legacy/characters/{character_id}/skillqueue/`  Alternate route: `/dev/characters/{character_id}/skillqueue/`   ---  This route is cached for up to 120 seconds
     - OAuth:
       - type: oauth2
       - name: evesso
     - responseHeaders: [Cache-Control(String), Expires(String), Last-Modified(String)]
     - responseHeaders: [Cache-Control(String), Expires(String), Last-Modified(String)]
     - responseHeaders: [Cache-Control(String), Expires(String), Last-Modified(String)]
     - examples: [{contentType=application/json, example=[ {
  "finish_date" : "2016-06-29T10:47:00Z",
  "finished_level" : 3,
  "queue_position" : 0,
  "skill_id" : 1,
  "start_date" : "2016-06-29T10:46:00Z"
}, {
  "finish_date" : "2016-07-15T10:47:00Z",
  "finished_level" : 4,
  "queue_position" : 1,
  "skill_id" : 1,
  "start_date" : "2016-06-29T10:47:00Z"
}, {
  "finish_date" : "2016-08-30T10:47:00Z",
  "finished_level" : 2,
  "queue_position" : 2,
  "skill_id" : 2,
  "start_date" : "2016-07-15T10:47:00Z"
} ]}]
     
     - parameter characterId: (path) Character id of the target character 
     - parameter datasource: (query) The server name you would like data from (optional, default to tranquility)

     - returns: RequestBuilder<[GetCharactersCharacterIdSkillqueue200Ok]> 
     */
    public class func getCharactersCharacterIdSkillqueueWithRequestBuilder(characterId characterId: Int32, datasource: Datasource_getCharactersCharacterIdSkillqueue? = nil) -> RequestBuilder<[GetCharactersCharacterIdSkillqueue200Ok]> {
        var path = "/characters/{characterId}/skillqueue/"
        path = path.stringByReplacingOccurrencesOfString("{characterId}", withString: "\(characterId)", options: .LiteralSearch, range: nil)
        let URLString = SwaggerClientAPI.basePath + path

        let nillableParameters: [String:AnyObject?] = [
            "datasource": datasource?.rawValue
        ]
 
        let parameters = APIHelper.rejectNil(nillableParameters)
 
        let convertedParameters = APIHelper.convertBoolToString(parameters)
 
        let requestBuilder: RequestBuilder<[GetCharactersCharacterIdSkillqueue200Ok]>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, isBody: false)
    }

    /**
     * enum for parameter datasource
     */
    public enum Datasource_getCharactersCharacterIdSkills: String { 
        case Tranquility = "tranquility"
        case Singularity = "singularity"
    }

    /**
     Get character skills
     
     - parameter characterId: (path) An EVE character ID 
     - parameter datasource: (query) The server name you would like data from (optional, default to tranquility)
     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func getCharactersCharacterIdSkills(characterId characterId: Int32, datasource: Datasource_getCharactersCharacterIdSkills? = nil, completion: ((data: GetCharactersCharacterIdSkillsOk?, error: ErrorType?) -> Void)) {
        getCharactersCharacterIdSkillsWithRequestBuilder(characterId: characterId, datasource: datasource).execute { (response, error) -> Void in
            completion(data: response?.body, error: error);
        }
    }


    /**
     Get character skills
     - GET /characters/{characterId}/skills/
     - List all trained skills for the given character  ---  Alternate route: `/v3/characters/{character_id}/skills/`  Alternate route: `/dev/characters/{character_id}/skills/`   ---  This route is cached for up to 120 seconds
     - OAuth:
       - type: oauth2
       - name: evesso
     - responseHeaders: [Cache-Control(String), Expires(String), Last-Modified(String)]
     - responseHeaders: [Cache-Control(String), Expires(String), Last-Modified(String)]
     - responseHeaders: [Cache-Control(String), Expires(String), Last-Modified(String)]
     - examples: [{contentType=application/json, example={
  "skills" : [ {
    "current_skill_level" : 1,
    "skill_id" : 1,
    "skillpoints_in_skill" : 10000
  }, {
    "current_skill_level" : 1,
    "skill_id" : 2,
    "skillpoints_in_skill" : 10000
  } ],
  "total_sp" : 20000
}}]
     
     - parameter characterId: (path) An EVE character ID 
     - parameter datasource: (query) The server name you would like data from (optional, default to tranquility)

     - returns: RequestBuilder<GetCharactersCharacterIdSkillsOk> 
     */
    public class func getCharactersCharacterIdSkillsWithRequestBuilder(characterId characterId: Int32, datasource: Datasource_getCharactersCharacterIdSkills? = nil) -> RequestBuilder<GetCharactersCharacterIdSkillsOk> {
        var path = "/characters/{characterId}/skills/"
        path = path.stringByReplacingOccurrencesOfString("{characterId}", withString: "\(characterId)", options: .LiteralSearch, range: nil)
        let URLString = SwaggerClientAPI.basePath + path

        let nillableParameters: [String:AnyObject?] = [
            "datasource": datasource?.rawValue
        ]
 
        let parameters = APIHelper.rejectNil(nillableParameters)
 
        let convertedParameters = APIHelper.convertBoolToString(parameters)
 
        let requestBuilder: RequestBuilder<GetCharactersCharacterIdSkillsOk>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, isBody: false)
    }

}
