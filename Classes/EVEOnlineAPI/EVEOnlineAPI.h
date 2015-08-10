/*
 *  EVEOnlineAPI.h
 *  EVEOnlineAPI
 *
 *  Created by Artem Shimanski on 6/2/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */
#import <AFNetworking/AFNetworking.h>

#import "EVEAccountStatus.h"
#import "EVECharacters.h"
#import "EVEAPIKeyInfo.h"
#import "EVEAccountBalance.h"
#import "EVEAssetList.h"
#import "EVEBlueprints.h"
#import "EVECalendarEventAttendees.h"
#import "EVECharacterSheet.h"
#import "EVEContactList.h"
#import "EVEContactNotifications.h"
#import "EVEContracts.h"
#import "EVEContractBids.h"
#import "EVEContractItems.h"
#import "EVECharFacWarStats.h"
#import "EVEIndustryJobs.h"
#import "EVEIndustryJobsHistory.h"
#import "EVEKillMails.h"
#import "EVEMailBodies.h"
#import "EVEMailingLists.h"
#import "EVEMailMessages.h"
#import "EVEMarketOrders.h"
#import "EVECharMedals.h"
#import "EVENotifications.h"
#import "EVENotificationTexts.h"
#import "EVEResearch.h"
#import "EVESkillInTraining.h"
#import "EVESkillQueue.h"
#import "EVECharStandings.h"
#import "EVECorpStandings.h"
#import "EVEUpcomingCalendarEvents.h"
#import "EVECharWalletJournal.h"
#import "EVECharWalletTransactions.h"
#import "EVEContainerLog.h"
#import "EVECorporationSheet.h"
#import "EVECorpFacWarStats.h"
#import "EVECorpMedals.h"
#import "EVEMemberMedals.h"
#import "EVEMemberSecurity.h"
#import "EVEMemberSecurityLog.h"
#import "EVEMemberTracking.h"
#import "EVEOutpostList.h"
#import "EVEOutpostServiceDetail.h"
#import "EVEStarbaseDetail.h"
#import "EVEStarbaseList.h"
#import "EVEShareholders.h"
#import "EVETitles.h"
#import "EVECorpWalletJournal.h"
#import "EVECorpWalletTransactions.h"
#import "EVEAllianceList.h"
#import "EVEConquerableStationList.h"
#import "EVEErrorList.h"
#import "EVEFacWarStats.h"
#import "EVEFacWarTopStats.h"
#import "EVECharacterID.h"
#import "EVECharacterInfo.h"
#import "EVECharacterName.h"
#import "EVERefTypes.h"
#import "EVESkillTree.h"
#import "EVEFacWarSystems.h"
#import "EVEJumps.h"
#import "EVEKills.h"
#import "EVESovereignty.h"
#import "EVEServerStatus.h"
#import "EVEImage.h"
#import "EVECalllist.h"
#import "EVELocations.h"
#import "EVEOwnerID.h"
#import "EVEPlanetaryColonies.h"
#import "EVEPlanetaryPins.h"
#import "EVEPlanetaryRoutes.h"
#import "EVEPlanetaryLinks.h"
#import "EVECustomsOffices.h"
#import "EVEFacilities.h"
#import "EVECharacterAffiliation.h"
#import "EVETypeName.h"

@interface EVEAPIKey : NSObject
@property (nonatomic, assign) NSInteger keyID;
@property (nonatomic, copy) NSString* vCode;
@property (nonatomic, assign) NSInteger characterID;
@property (nonatomic, assign) BOOL corporate;

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