//
//  EVEKillNetLog.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 25.10.12.
//
//

#import "EVECachedURLRequest.h"

#define EVEKillNetLogAPIHost @"http://eve-kill.net/epic/"

#define EVEKillNetLogFilterMailLimit @"mailLimit" // Limits amount of mails show, minimum 1, maximum 500, default is 100
#define EVEKillNetLogFilterWeek @"week" // Get kills for a specific week
#define EVEKillNetLogFilterYear @"year" // Get kills for a specific year
#define EVEKillNetLogFilterStartDate @"startDate" // Specifies a start date (YYYY-MM-DD H.i.s) (Replace : with .) (Space is _) Example: 2012-04-17_12.34.00 (17th April 2012 at Twelve Thirty Four)
#define EVEKillNetLogFilterEndDate @"endDate" // Specifies and end date (Should only be used if there is a startDate, and it cannot span months)
#define EVEKillNetLogFilterAPIOnly @"APIOnly" // set it to true, to only show mails that are externally verified (API obv.)
#define EVEKillNetLogFilterKLLid @"KLLid" // Shows information from a single kllid, can be either internal or external id (In theory anyway)
#define EVEKillNetLogFilterMinKLLid @"minKLLid" // The lowest kllid you want (Works best with maxkllid to get a specific range of mails)
#define EVEKillNetLogFilterMaxKLLid @"maxKLLid" // The high kllid you want (Works best with minkllid to get a specific range of mails)
#define EVEKillNetLogFilterMinISKValue @"minISKValue" // Minimum isk value of kills
#define EVEKillNetLogFilterMaxISKValue @"maxISKValue" // Maximum isk value of kills
#define EVEKillNetLogFilterVictimPilotExtID @"victimPilotExtID" // Victim pilot external ID
#define EVEKillNetLogFilterVictimCorpExtID @"victimCorpExtID"// Victim corp external ID
#define EVEKillNetLogFilterVictimAllianceExtID @"victimAllianceExtID" // Victim alliance external ID
#define EVEKillNetLogFilterVictimPilotID @"victimPilotID" // Victim pilot internal ID
#define EVEKillNetLogFilterVictimCorpID @"victimCorpID" // Victim corp internal ID
#define EVEKillNetLogFilterVictimAllianceID @"victimAllianceID" // Victim alliance internal ID
#define EVEKillNetLogFilterVictimPilot @"victimPilot" // Victim pilot name
#define EVEKillNetLogFilterVictimCorp @"victimCorp" // Victim corp name
#define EVEKillNetLogFilterVictimAlliance @"victimAlliance" // Victim alliance name
#define EVEKillNetLogFilterVictimShip @"victimShip" // Victim ship
#define EVEKillNetLogFilterVictimShipClass @"victimShipClass" // Victim Ship Class
#define EVEKillNetLogFilterCombinedPilotExtID @"combinedPilotExtID" // Show Kills and Losses for Pilot external ID
#define EVEKillNetLogFilterCombinedCorpExtID @"combinedCorpExtID" // Show Kills and Losses for Corporation external ID
#define EVEKillNetLogFilterCombinedAllianceExtID @"combinedAllianceExtID" // Show Kills and Losses for Alliance external ID
#define EVEKillNetLogFilterCombinedPilotID @"combinedPilotID" // Show Kills and Losses for Pilot internal ID
#define EVEKillNetLogFilterCombinedCorpID @"combinedCorpID" // Show Kills and Losses for Corporation internal ID
#define EVEKillNetLogFilterCombinedAllianceID @"combinedAllianceID" // Show Kills and Losses for Alliance internal ID
#define EVEKillNetLogFilterCombinedPilot @"combinedPilot" // Show Kills and Losses for Pilot name
#define EVEKillNetLogFilterCombinedCorp @"combinedCorp" // Show Kills and Losses for Corporation name
#define EVEKillNetLogFilterCombinedAlliance @"combinedAlliance" // Show Kills and Losses for Alliance name
#define EVEKillNetLogFilterInvolvedPilotExtID @"involvedPilotExtID" // Show kills with an involved pilot external ID
#define EVEKillNetLogFilterInvolvedCorpExtID @"involvedCorpExtID" // Show kills with an involved corp external ID
#define EVEKillNetLogFilterInvolvedAllianceExtID @"involvedAllianceExtID" // Show kills with an involved alliance external ID
#define EVEKillNetLogFilterInvolvedPilotID @"involvedPilotID" // Show kills with an involved pilot internal ID
#define EVEKillNetLogFilterInvolvedCorpID @"involvedCorpID" // Show kills with an involved corp internal ID
#define EVEKillNetLogFilterInvolvedAllianceID @"involvedAllianceID" // Show kills with an involved alliance internal ID
#define EVEKillNetLogFilterInvolvedPilot @"involvedPilot" // Show kills with an involved pilot name
#define EVEKillNetLogFilterInvolvedCorp @"involvedCorp" // Show kills with an involved corp name
#define EVEKillNetLogFilterInvolvedAlliance @"involvedAlliance" // Show kills with an involved alliance name
#define EVEKillNetLogFilterInvolvedShip @"involvedShip" // Show kills with a involved ship
#define EVEKillNetLogFilterInvolvedShipClass @"involvedShipClass" // Show kills with a involved ship class
#define EVEKillNetLogFilterFBPilotName @"FBPilotName" // Shows kills ONLY related to that finalblow pilot
#define EVEKillNetLogFilterNoTowers @"NoTowers" // Removes towers, tower mods, territory modules, customs offices and infrastructure modules
#define EVEKillNetLogFilterOrderBy @"OrderBy" // Apparently default was ordering by DESC, which ****** up time and killid usage, that now works! ;) (you can use orderBy:desc and orderBy:asc)
#define EVEKillNetLogFilterSystem @"system" // Show kills done in a system
#define EVEKillNetLogFilterRegion @"region" // Show kills done in a region
typedef enum {
	EVEKillNetLogMaskURL = 1, //Show the URL to EVE-KILL.
	EVEKillNetLogMaskTimestamp = 2, // Show the Timestamp.
	EVEKillNetLogMaskInternalKillID = 4, // Show the internal EVE-KILL kill ID.
	EVEKillNetLogMaskCCPKillID = 8, // Show the CCP API kill ID.
	EVEKillNetLogMaskVictimName = 16, // Show the Victim Name.
	EVEKillNetLogMaskVictimExternalID = 32, // Show the Victim External ID.
	EVEKillNetLogMaskVictimCorpName = 64, // Show the Victim Corp Name.
	EVEKillNetLogMaskVictimAllianceName = 128, // Show the Victim Alliance Name.
	EVEKillNetLogMaskVictimShipName = 256, // Show the Victim Ship Name.
	EVEKillNetLogMaskVictimShipsClassName = 512, // Show the Victim Ships Class Name.
	EVEKillNetLogMaskVictimShipsExternalID = 1024, // Show the Victim Ships External ID.
	EVEKillNetLogMaskFBPilotsName = 2048, // Show the FB Pilots name.
	EVEKillNetLogMaskFBPilotsCorpName = 4096, // Show the FB Pilots corp name.
	EVEKillNetLogMaskFBPilotsAllianceName = 8192, // Show the FB Pilots alliance name.
	EVEKillNetLogMaskCountOfInvolvedPilots = 16384, // Show the count of involved pilots.
	EVEKillNetLogMaskSolarSystem = 32768, // Show the Solar System the kill happened in.
	EVEKillNetLogMaskSolarSystemSecurity = 65536, // Show the Solar System security.
	EVEKillNetLogMaskRegionsName = 131072, // Show the Regions name.
	EVEKillNetLogMaskISK = 262144, // Show the ISK value of the kill (total loss (ship + modules)).
	EVEKillNetLogMaskInvolved = 524288, // Show the pilots involved.
	EVEKillNetLogMaskItems = 1048576, // Show the items that was destroyed and dropped.
	EVEKillNetLogMaskRawMail = 2097152, // Gives you the rawmail serialized, gzipped and base64 encoded
	
	EVEKillNetLogMaskAll = 3145727,
	EVEKillNetLogMaskShort =	EVEKillNetLogMaskTimestamp |
								EVEKillNetLogMaskInternalKillID |
								EVEKillNetLogMaskVictimName |
								EVEKillNetLogMaskVictimCorpName |
								EVEKillNetLogMaskVictimAllianceName |
								EVEKillNetLogMaskVictimShipsExternalID |
								EVEKillNetLogMaskCountOfInvolvedPilots |
								EVEKillNetLogMaskSolarSystem |
								EVEKillNetLogMaskSolarSystemSecurity |
								EVEKillNetLogMaskRegionsName |
								EVEKillNetLogMaskISK
} EVEKillNetLogMask;

@interface EVEKillNetLogItem : NSObject
@property (nonatomic, copy) NSString* typeName;
@property (nonatomic, assign) NSInteger typeID;
@property (nonatomic, assign) NSInteger itemSlot;
@property (nonatomic, assign) NSInteger qtyDropped;
@property (nonatomic, assign) NSInteger qtyDestroyed;

- (id) initWithDictinary:(NSDictionary*) dictionary;
@end

@interface EVEKillNetLogInvolved : NSObject
@property (nonatomic, assign) NSInteger characterID;
@property (nonatomic, copy) NSString* characterName;
@property (nonatomic, assign) NSInteger corporationID;
@property (nonatomic, copy) NSString* corporationName;
@property (nonatomic, assign) NSInteger allianceID;
@property (nonatomic, copy) NSString* allianceName;
@property (nonatomic, assign) NSInteger factionID;
@property (nonatomic, copy) NSString* factionName;
@property (nonatomic, assign) float securityStatus;
@property (nonatomic, assign) float damageDone;
@property (nonatomic, assign) BOOL finalBlow;
@property (nonatomic, assign) NSInteger weaponTypeID;
@property (nonatomic, assign) NSInteger shipTypeID;

- (id) initWithDictinary:(NSDictionary*) dictionary;
@end

@interface EVEKillNetLogEntry : NSObject
@property (nonatomic, strong) NSURL* url;
@property (nonatomic, strong) NSDate* timestamp;
@property (nonatomic, assign) NSInteger internalID;
@property (nonatomic, assign) NSInteger externalID;
@property (nonatomic, copy) NSString* victimName;
@property (nonatomic, assign) NSInteger victimExternalID;
@property (nonatomic, copy) NSString* victimCorpName;
@property (nonatomic, copy) NSString* victimAllianceName;
@property (nonatomic, copy) NSString* victimShipName;
@property (nonatomic, copy) NSString* victimShipClass;
@property (nonatomic, assign) NSInteger victimShipID;
@property (nonatomic, copy) NSString* fbPilotName;
@property (nonatomic, copy) NSString* fbCorpName;
@property (nonatomic, copy) NSString* fbAllianceName;
@property (nonatomic, assign) NSInteger involvedPartyCount;
@property (nonatomic, copy) NSString* solarSystemName;
@property (nonatomic, assign) float solarSystemSecurity;
@property (nonatomic, copy) NSString* regionName;
@property (nonatomic, assign) long long isk;
@property (nonatomic, strong) NSArray* involved;
@property (nonatomic, strong) NSArray* destroyedItems;
@property (nonatomic, strong) NSArray* droppedItems;
@property (nonatomic, assign) NSInteger eveKillID;
@property (nonatomic, assign) NSInteger eveKillExternalID;
@property (nonatomic, copy) NSString* corpName;
@property (nonatomic, copy) NSString* allianceName;
@property (nonatomic, copy) NSString* factionName;
@property (nonatomic, copy) NSString* shipDestroyed;
@property (nonatomic, copy) NSString* systemName;
@property (nonatomic, assign) float systemSecurity;
@property (nonatomic, assign) float damageTaken;
@property (nonatomic, strong) NSArray* involvedParties;
@end;

@interface EVEKillNetLog : EVECachedURLRequest
@property (nonatomic, strong) NSArray* killLog;

+ (id) logWithFilter:(NSDictionary*) filter mask:(NSInteger) mask error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;
- (id) initWithFilter:(NSDictionary*) filter mask:(NSInteger) mask error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;

@end
