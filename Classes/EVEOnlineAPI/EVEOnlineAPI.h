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
@property (nonatomic, readonly) AFHTTPSessionManager* httpRequestOperationManager;
//@property (nonatomic, assign) BOOL startImmediately;


+ (instancetype) apiWithAPIKey:(EVEAPIKey*) apiKey cachePolicy:(NSURLRequestCachePolicy) cachePolicy;
- (instancetype) initWithAPIKey:(EVEAPIKey*) apiKey cachePolicy:(NSURLRequestCachePolicy) cachePolicy;

// Account
- (void) accountStatusWithCompletionBlock:(void(^)(EVEAccountStatus* result, NSError* error)) completionBlock;
- (void) apiKeyInfoWithCompletionBlock:(void(^)(EVEAPIKeyInfo* result, NSError* error)) completionBlock;
- (void) charactersWithCompletionBlock:(void(^)(EVECharacters* result, NSError* error)) completionBlock;

// Character
- (void) accountBalanceWithCompletionBlock:(void(^)(EVEAccountBalance* result, NSError* error)) completionBlock;
- (void) assetListWithCompletionBlock:(void(^)(EVEAssetList* result, NSError* error)) completionBlock;
- (void) blueprintsWithCompletionBlock:(void(^)(EVEBlueprints* result, NSError* error)) completionBlock;
- (void) calendarEventAttendeesWithCompletionBlock:(void(^)(EVECalendarEventAttendees* result, NSError* error)) completionBlock;
- (void) characterSheetWithCompletionBlock:(void(^)(EVECharacterSheet* result, NSError* error)) completionBlock;
- (void) charFacWarStatsWithCompletionBlock:(void(^)(EVECharFacWarStats* result, NSError* error)) completionBlock;
- (void) charMedalsWithCompletionBlock:(void(^)(EVECharMedals* result, NSError* error)) completionBlock;
- (void) charStandingsWithCompletionBlock:(void(^)(EVECharStandings* result, NSError* error)) completionBlock;
- (void) charWalletJournalFromID:(int64_t )fromID rowCount:(NSInteger) rowCount completionBlock:(void(^)(EVECharWalletJournal* result, NSError* error)) completionBlock;
- (void) charWalletTransactionsFromID:(int64_t )fromID rowCount:(NSInteger) rowCount completionBlock:(void(^)(EVECharWalletTransactions* result, NSError* error)) completionBlock;
- (void) contactListWithCompletionBlock:(void(^)(EVEContactList* result, NSError* error)) completionBlock;
- (void) contactNotificationsWithCompletionBlock:(void(^)(EVEContactNotifications* result, NSError* error)) completionBlock;
- (void) contractBidsWithCompletionBlock:(void(^)(EVEContractBids* result, NSError* error)) completionBlock;
- (void) contractItemsWithContractID:(int64_t) contractID completionBlock:(void(^)(EVEContractItems* result, NSError* error)) completionBlock;
- (void) contractsWithContractID:(int64_t) contractID completionBlock:(void(^)(EVEContracts* result, NSError* error)) completionBlock;
- (void) industryJobsWithCompletionBlock:(void(^)(EVEIndustryJobs* result, NSError* error)) completionBlock;
- (void) industryJobsHistoryWithCompletionBlock:(void(^)(EVEIndustryJobsHistory* result, NSError* error)) completionBlock;
- (void) killMailsFromID:(int32_t )fromID rowCount:(NSInteger) rowCount completionBlock:(void(^)(EVEKillMails* result, NSError* error)) completionBlock;
- (void) locationsWithIDs:(NSArray*) ids completionBlock:(void(^)(EVELocations* result, NSError* error)) completionBlock;
- (void) mailBodiesWithIDs:(NSArray*) ids completionBlock:(void(^)(EVEMailBodies* result, NSError* error)) completionBlock;
- (void) mailingListsWithCompletionBlock:(void(^)(EVEMailingLists* result, NSError* error)) completionBlock;
- (void) mailMessagesWithCompletionBlock:(void(^)(EVEMailMessages* result, NSError* error)) completionBlock;
- (void) marketOrdersWithOrderID:(int32_t) orderID completionBlock:(void(^)(EVEMarketOrders* result, NSError* error)) completionBlock;
- (void) notificationsWithCompletionBlock:(void(^)(EVENotifications* result, NSError* error)) completionBlock;
- (void) notificationTextsWithIDs:(NSArray*) ids completionBlock:(void(^)(EVENotificationTexts* result, NSError* error)) completionBlock;
- (void) planetaryColoniesWithCompletionBlock:(void(^)(EVEPlanetaryColonies* result, NSError* error)) completionBlock;
- (void) planetaryLinksWithPlanetID:(int32_t) planetID completionBlock:(void(^)(EVEPlanetaryLinks* result, NSError* error)) completionBlock;
- (void) planetaryPinsWithPlanetID:(int32_t) planetID completionBlock:(void(^)(EVEPlanetaryPins* result, NSError* error)) completionBlock;
- (void) planetaryRoutesWithPlanetID:(int32_t) planetID completionBlock:(void(^)(EVEPlanetaryRoutes* result, NSError* error)) completionBlock;
- (void) researchWithCompletionBlock:(void(^)(EVEResearch* result, NSError* error)) completionBlock;
- (void) skillInTrainingWithCompletionBlock:(void(^)(EVESkillInTraining* result, NSError* error)) completionBlock;
- (void) skillQueueWithCompletionBlock:(void(^)(EVESkillQueue* result, NSError* error)) completionBlock;
- (void) upcomingCalendarEventsWithCompletionBlock:(void(^)(EVEUpcomingCalendarEvents* result, NSError* error)) completionBlock;

// Corporation
- (void) containerLogWithCompletionBlock:(void(^)(EVEContainerLog* result, NSError* error)) completionBlock;
- (void) corporationSheetWithCorporationID:(int32_t) corporationID completionBlock:(void(^)(EVECorporationSheet* result, NSError* error)) completionBlock;
- (void) corpFacWarStatsWithCompletionBlock:(void(^)(EVECorpFacWarStats* result, NSError* error)) completionBlock;
- (void) customsOfficesWithCompletionBlock:(void(^)(EVECustomsOffices* result, NSError* error)) completionBlock;
- (void) facilitiesWithCompletionBlock:(void(^)(EVEFacilities* result, NSError* error)) completionBlock;
- (void) corpMedalsWithCompletionBlock:(void(^)(EVECorpMedals* result, NSError* error)) completionBlock;
- (void) memberMedalsWithCompletionBlock:(void(^)(EVEMemberMedals* result, NSError* error)) completionBlock;
- (void) memberSecurityWithCompletionBlock:(void(^)(EVEMemberSecurity* result, NSError* error)) completionBlock;
- (void) memberSecurityLogWithCompletionBlock:(void(^)(EVEMemberSecurityLog* result, NSError* error)) completionBlock;
- (void) memberTrackingWithExtendedInfo:(BOOL) extended completionBlock:(void(^)(EVEMemberTracking* result, NSError* error)) completionBlock;
- (void) outpostListWithCompletionBlock:(void(^)(EVEOutpostList* result, NSError* error)) completionBlock;
- (void) outpostServiceDetailWithItemID:(int32_t) itemID completionBlock:(void(^)(EVEOutpostServiceDetail* result, NSError* error)) completionBlock;
- (void) shareholdersWithCompletionBlock:(void(^)(EVEShareholders* result, NSError* error)) completionBlock;
- (void) corpStandingsWithCompletionBlock:(void(^)(EVECorpStandings* result, NSError* error)) completionBlock;
- (void) starbaseDetailWithItemID:(int64_t) itemID completionBlock:(void(^)(EVEStarbaseDetail* result, NSError* error)) completionBlock;
- (void) starbaseListWithCompletionBlock:(void(^)(EVEStarbaseList* result, NSError* error)) completionBlock;
- (void) titlesWithCompletionBlock:(void(^)(EVETitles* result, NSError* error)) completionBlock;
- (void) corpWalletJournalWithAccountKey:(int32_t) accountKey fromID:(int64_t )fromID rowCount:(NSInteger) rowCount completionBlock:(void(^)(EVECorpWalletJournal* result, NSError* error)) completionBlock;
- (void) corpWalletTransactionsWithAccountKey:(int32_t) accountKey fromID:(int64_t )fromID rowCount:(NSInteger) rowCount completionBlock:(void(^)(EVECorpWalletTransactions* result, NSError* error)) completionBlock;

// EVE
- (void) allianceListWithCompletionBlock:(void(^)(EVEAllianceList* result, NSError* error)) completionBlock;
- (void) characterAffiliationWithIDs:(NSArray*) ids completionBlock:(void(^)(EVECharacterAffiliation* result, NSError* error)) completionBlock;
- (void) characterIDWithNames:(NSArray*) names completionBlock:(void(^)(EVECharacterID* result, NSError* error)) completionBlock;
- (void) characterInfoWithCharacterID:(int32_t) characterID completionBlock:(void(^)(EVECharacterInfo* result, NSError* error)) completionBlock;
- (void) characterNameWithIDs:(NSArray*) ids completionBlock:(void(^)(EVECharacterName* result, NSError* error)) completionBlock;
- (void) conquerableStationListWithCompletionBlock:(void(^)(EVEConquerableStationList* result, NSError* error)) completionBlock;
- (void) errorListWithCompletionBlock:(void(^)(EVEErrorList* result, NSError* error)) completionBlock;
- (void) facWarStatsWithCompletionBlock:(void(^)(EVEFacWarStats* result, NSError* error)) completionBlock;
- (void) facWarTopStatsWithCompletionBlock:(void(^)(EVEFacWarTopStats* result, NSError* error)) completionBlock;
- (void) ownerIDWithNames:(NSArray*) names completionBlock:(void(^)(EVEOwnerID* result, NSError* error)) completionBlock;
- (void) refTypesWithCompletionBlock:(void(^)(EVERefTypes* result, NSError* error)) completionBlock;
- (void) skillTreeWithCompletionBlock:(void(^)(EVESkillTree* result, NSError* error)) completionBlock;
- (void) typeNameWithIDs:(NSArray*) ids completionBlock:(void(^)(EVETypeName* result, NSError* error)) completionBlock;

// Map
- (void) facWarSystemsWithCompletionBlock:(void(^)(EVEFacWarSystems* result, NSError* error)) completionBlock;
- (void) jumpsWithCompletionBlock:(void(^)(EVEJumps* result, NSError* error)) completionBlock;
- (void) killsWithCompletionBlock:(void(^)(EVEKills* result, NSError* error)) completionBlock;
- (void) sovereigntyWithCompletionBlock:(void(^)(EVESovereignty* result, NSError* error)) completionBlock;

// Server
- (void) serverStatusWithCompletionBlock:(void(^)(EVEServerStatus* result, NSError* error)) completionBlock;

// API
- (void) callListWithCompletionBlock:(void(^)(EVECallList* result, NSError* error)) completionBlock;

@end
