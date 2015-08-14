/*
 *  EVEOnlineAPI.h
 *  EVEOnlineAPI
 *
 *  Created by Artem Shimanski on 6/2/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */
#import <AFNetworking/AFNetworking.h>

#import <EVEAPI/NSDateFormatter+EVEOnlineAPI.h>
#import <EVEAPI/EVEGlobals.h>
#import <EVEAPI/EVEAccountStatus.h>
#import <EVEAPI/EVECharacters.h>
#import <EVEAPI/EVEAPIKeyInfo.h>
#import <EVEAPI/EVEAccountBalance.h>
#import <EVEAPI/EVEAssetList.h>
#import <EVEAPI/EVEBlueprints.h>
#import <EVEAPI/EVECalendarEventAttendees.h>
#import <EVEAPI/EVECharacterSheet.h>
#import <EVEAPI/EVEContactList.h>
#import <EVEAPI/EVEContactNotifications.h>
#import <EVEAPI/EVEContracts.h>
#import <EVEAPI/EVEContractBids.h>
#import <EVEAPI/EVEContractItems.h>
#import <EVEAPI/EVECharFacWarStats.h>
#import <EVEAPI/EVEIndustryJobs.h>
#import <EVEAPI/EVEIndustryJobsHistory.h>
#import <EVEAPI/EVEKillMails.h>
#import <EVEAPI/EVEMailBodies.h>
#import <EVEAPI/EVEMailingLists.h>
#import <EVEAPI/EVEMailMessages.h>
#import <EVEAPI/EVEMarketOrders.h>
#import <EVEAPI/EVECharMedals.h>
#import <EVEAPI/EVENotifications.h>
#import <EVEAPI/EVENotificationTexts.h>
#import <EVEAPI/EVEResearch.h>
#import <EVEAPI/EVESkillInTraining.h>
#import <EVEAPI/EVESkillQueue.h>
#import <EVEAPI/EVECharStandings.h>
#import <EVEAPI/EVECorpStandings.h>
#import <EVEAPI/EVEUpcomingCalendarEvents.h>
#import <EVEAPI/EVECharWalletJournal.h>
#import <EVEAPI/EVECharWalletTransactions.h>
#import <EVEAPI/EVEContainerLog.h>
#import <EVEAPI/EVECorporationSheet.h>
#import <EVEAPI/EVECorpFacWarStats.h>
#import <EVEAPI/EVECorpMedals.h>
#import <EVEAPI/EVEMemberMedals.h>
#import <EVEAPI/EVEMemberSecurity.h>
#import <EVEAPI/EVEMemberSecurityLog.h>
#import <EVEAPI/EVEMemberTracking.h>
#import <EVEAPI/EVEOutpostList.h>
#import <EVEAPI/EVEOutpostServiceDetail.h>
#import <EVEAPI/EVEStarbaseDetail.h>
#import <EVEAPI/EVEStarbaseList.h>
#import <EVEAPI/EVEShareholders.h>
#import <EVEAPI/EVETitles.h>
#import <EVEAPI/EVECorpWalletJournal.h>
#import <EVEAPI/EVECorpWalletTransactions.h>
#import <EVEAPI/EVEAllianceList.h>
#import <EVEAPI/EVEConquerableStationList.h>
#import <EVEAPI/EVEErrorList.h>
#import <EVEAPI/EVEFacWarStats.h>
#import <EVEAPI/EVEFacWarTopStats.h>
#import <EVEAPI/EVECharacterID.h>
#import <EVEAPI/EVECharacterInfo.h>
#import <EVEAPI/EVECharacterName.h>
#import <EVEAPI/EVERefTypes.h>
#import <EVEAPI/EVESkillTree.h>
#import <EVEAPI/EVEFacWarSystems.h>
#import <EVEAPI/EVEJumps.h>
#import <EVEAPI/EVEKills.h>
#import <EVEAPI/EVESovereignty.h>
#import <EVEAPI/EVEServerStatus.h>
#import <EVEAPI/EVEImage.h>
#import <EVEAPI/EVECalllist.h>
#import <EVEAPI/EVELocations.h>
#import <EVEAPI/EVEOwnerID.h>
#import <EVEAPI/EVEPlanetaryColonies.h>
#import <EVEAPI/EVEPlanetaryPins.h>
#import <EVEAPI/EVEPlanetaryRoutes.h>
#import <EVEAPI/EVEPlanetaryLinks.h>
#import <EVEAPI/EVECustomsOffices.h>
#import <EVEAPI/EVEFacilities.h>
#import <EVEAPI/EVECharacterAffiliation.h>
#import <EVEAPI/EVETypeName.h>

@interface EVEAPIKey : NSObject
@property (nonatomic, assign) NSInteger keyID;
@property (nonatomic, copy) NSString* vCode;
@property (nonatomic, assign) NSInteger characterID;
@property (nonatomic, assign) BOOL corporate;

+ (id) apiKeyWithKeyID:(NSInteger) keyID vCode:(NSString*) vCode;
+ (id) apiKeyWithKeyID:(NSInteger) keyID vCode:(NSString*) vCode characterID:(NSInteger) characterID corporate:(BOOL) corporate;

- (id) initWithKeyID:(NSInteger) keyID vCode:(NSString*) vCode;
- (id) initWithKeyID:(NSInteger) keyID vCode:(NSString*) vCode characterID:(NSInteger) characterID corporate:(BOOL) corporate;

@end

@interface EVEOnlineAPI : NSObject
@property (nonatomic, strong) EVEAPIKey* apiKey;
@property (nonatomic, assign) NSURLRequestCachePolicy cachePolicy;

+ (instancetype) apiWithAPIKey:(EVEAPIKey*) apiKey cachePolicy:(NSURLRequestCachePolicy) cachePolicy;
- (instancetype) initWithAPIKey:(EVEAPIKey*) apiKey cachePolicy:(NSURLRequestCachePolicy) cachePolicy;

// Account
- (AFHTTPRequestOperation*) accountStatusWithCompletionBlock:(void(^)(EVEAccountStatus* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) apiKeyInfoWithCompletionBlock:(void(^)(EVEAPIKeyInfo* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) charactersWithCompletionBlock:(void(^)(EVECharacters* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;

// Character
- (AFHTTPRequestOperation*) accountBalanceWithCompletionBlock:(void(^)(EVEAccountBalance* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) assetListWithCompletionBlock:(void(^)(EVEAssetList* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) blueprintsWithCompletionBlock:(void(^)(EVEBlueprints* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) calendarEventAttendeesWithCompletionBlock:(void(^)(EVECalendarEventAttendees* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) characterSheetWithCompletionBlock:(void(^)(EVECharacterSheet* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) charFacWarStatsWithCompletionBlock:(void(^)(EVECharFacWarStats* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) charMedalsWithCompletionBlock:(void(^)(EVECharMedals* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) charStandingsWithCompletionBlock:(void(^)(EVECharStandings* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) charWalletJournalFromID:(int64_t )fromID rowCount:(NSInteger) rowCount completionBlock:(void(^)(EVECharWalletJournal* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) charWalletTransactionsFromID:(int64_t )fromID rowCount:(NSInteger) rowCount completionBlock:(void(^)(EVECharWalletTransactions* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) contactListWithCompletionBlock:(void(^)(EVEContactList* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) contactNotificationsWithCompletionBlock:(void(^)(EVEContactNotifications* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) contractBidsWithCompletionBlock:(void(^)(EVEContractBids* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) contractItemsWithContractID:(int32_t) contractID completionBlock:(void(^)(EVEContractItems* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) contractsWithContractID:(int32_t) contractID completionBlock:(void(^)(EVEContracts* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) industryJobsWithCompletionBlock:(void(^)(EVEIndustryJobs* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) industryJobsHistoryWithCompletionBlock:(void(^)(EVEIndustryJobsHistory* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) killMailsFromID:(int32_t )fromID rowCount:(NSInteger) rowCount completionBlock:(void(^)(EVEKillMails* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) locationsWithIDs:(NSArray*) ids completionBlock:(void(^)(EVELocations* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) mailBodiesWithIDs:(NSArray*) ids completionBlock:(void(^)(EVEMailBodies* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) mailingListsWithCompletionBlock:(void(^)(EVEMailingLists* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) mailMessagesWithCompletionBlock:(void(^)(EVEMailMessages* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) marketOrdersWithOrderID:(int32_t) orderID completionBlock:(void(^)(EVEMarketOrders* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) notificationsWithCompletionBlock:(void(^)(EVENotifications* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) notificationTextsWithIDs:(NSArray*) ids completionBlock:(void(^)(EVENotificationTexts* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) planetaryColoniesWithCompletionBlock:(void(^)(EVEPlanetaryColonies* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) planetaryLinksWithPlanetID:(int32_t) planetID completionBlock:(void(^)(EVEPlanetaryLinks* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) planetaryPinsWithPlanetID:(int32_t) planetID completionBlock:(void(^)(EVEPlanetaryPins* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) planetaryRoutesWithPlanetID:(int32_t) planetID completionBlock:(void(^)(EVEPlanetaryRoutes* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) researchWithCompletionBlock:(void(^)(EVEResearch* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) skillInTrainingWithCompletionBlock:(void(^)(EVESkillInTraining* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) skillQueueWithCompletionBlock:(void(^)(EVESkillQueue* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) upcomingCalendarEventsWithCompletionBlock:(void(^)(EVEUpcomingCalendarEvents* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;

// Corporation
- (AFHTTPRequestOperation*) containerLogWithCompletionBlock:(void(^)(EVEContainerLog* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) corporationSheetWithCorporationID:(int32_t) corporationID completionBlock:(void(^)(EVECorporationSheet* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) corpFacWarStatsWithCompletionBlock:(void(^)(EVECorpFacWarStats* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) customsOfficesWithCompletionBlock:(void(^)(EVECustomsOffices* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) facilitiesWithCompletionBlock:(void(^)(EVEFacilities* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) corpMedalsWithCompletionBlock:(void(^)(EVECorpMedals* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) memberMedalsWithCompletionBlock:(void(^)(EVEMemberMedals* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) memberSecurityWithCompletionBlock:(void(^)(EVEMemberSecurity* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) memberSecurityLogWithCompletionBlock:(void(^)(EVEMemberSecurityLog* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) memberTrackingWithExtendedInfo:(BOOL) extended completionBlock:(void(^)(EVEMemberTracking* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) outpostListWithCompletionBlock:(void(^)(EVEOutpostList* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) outpostServiceDetailWithItemID:(int32_t) itemID completionBlock:(void(^)(EVEOutpostServiceDetail* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) shareholdersWithCompletionBlock:(void(^)(EVEShareholders* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) corpStandingsWithCompletionBlock:(void(^)(EVECorpStandings* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) starbaseDetailWithItemID:(int32_t) itemID completionBlock:(void(^)(EVEStarbaseDetail* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) starbaseListWithCompletionBlock:(void(^)(EVEStarbaseList* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) titlesWithCompletionBlock:(void(^)(EVETitles* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) corpWalletJournalWithAccountKey:(int32_t) accountKey fromID:(int64_t )fromID rowCount:(NSInteger) rowCount completionBlock:(void(^)(EVECorpWalletJournal* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) corpWalletTransactionsWithAccountKey:(int32_t) accountKey fromID:(int64_t )fromID rowCount:(NSInteger) rowCount completionBlock:(void(^)(EVECorpWalletTransactions* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;

// EVE
- (AFHTTPRequestOperation*) allianceListWithCompletionBlock:(void(^)(EVEAllianceList* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) characterAffiliationWithIDs:(NSArray*) ids completionBlock:(void(^)(EVECharacterAffiliation* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) characterIDWithNames:(NSArray*) names completionBlock:(void(^)(EVECharacterID* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) characterInfoWithCharacterID:(int32_t) characterID completionBlock:(void(^)(EVECharacterInfo* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) characterNameWithIDs:(NSArray*) ids completionBlock:(void(^)(EVECharacterName* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) conquerableStationListWithCompletionBlock:(void(^)(EVEConquerableStationList* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) errorListWithCompletionBlock:(void(^)(EVEErrorList* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) facWarStatsWithCompletionBlock:(void(^)(EVEFacWarStats* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) facWarTopStatsWithCompletionBlock:(void(^)(EVEFacWarTopStats* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) ownerIDWithNames:(NSArray*) names completionBlock:(void(^)(EVEOwnerID* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) refTypesWithCompletionBlock:(void(^)(EVERefTypes* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) skillTreeWithCompletionBlock:(void(^)(EVESkillTree* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) typeNameWithIDs:(NSArray*) ids completionBlock:(void(^)(EVETypeName* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;

// Map
- (AFHTTPRequestOperation*) facWarSystemsWithCompletionBlock:(void(^)(EVEFacWarSystems* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) jumpsWithCompletionBlock:(void(^)(EVEJumps* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) killsWithCompletionBlock:(void(^)(EVEKills* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) sovereigntyWithCompletionBlock:(void(^)(EVESovereignty* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;

// Server
- (AFHTTPRequestOperation*) serverStatusWithCompletionBlock:(void(^)(EVEServerStatus* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;

// API
- (AFHTTPRequestOperation*) callListWithCompletionBlock:(void(^)(EVECallList* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;

@end