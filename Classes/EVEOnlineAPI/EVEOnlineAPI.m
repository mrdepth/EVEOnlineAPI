//
//  EVEOnlineAPI.m
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 07.08.15.
//
//

#import "EVEOnlineAPI.h"
#import "EVEAPISerializer.h"
#import "NSDateFormatter+EVEOnlineAPI.h"
#import "NSURL+MD5.h"

@interface EVEOnlineAPI()

- (AFHTTPRequestOperation*) GET:(NSString*) method path:(NSString*) path parameters:(NSDictionary*) parameters responseClass:(Class) responseClass completionBlock:(void(^)(id result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;

@end

@implementation EVEAPIKey

+ (id) apiKeyWithKeyID:(NSInteger) keyID vCode:(NSString*) vCode {
	return [[self alloc] initWithKeyID:keyID vCode:vCode];
}

+ (id) apiKeyWithKeyID:(NSInteger) keyID vCode:(NSString*) vCode characterID:(NSInteger) characterID corporate:(BOOL) corporate {
	return [[self alloc] initWithKeyID:keyID vCode:vCode characterID:characterID corporate:corporate];
}

- (id) initWithKeyID:(NSInteger) keyID vCode:(NSString*) vCode {
	if (self = [self initWithKeyID:keyID vCode:vCode characterID:0 corporate:NO]) {
		
	}
	return self;
}

- (id) initWithKeyID:(NSInteger) keyID vCode:(NSString*) vCode characterID:(NSInteger) characterID corporate:(BOOL) corporate {
	if (self = [super init]) {
		self.keyID = keyID;
		self.vCode = vCode;
		self.characterID = characterID;
		self.corporate = corporate;
	}
	return self;
}

@end

@implementation EVEOnlineAPI

+ (instancetype) apiWithAPIKey:(EVEAPIKey*) apiKey cachePolicy:(NSURLRequestCachePolicy) cachePolicy {
	return [[self alloc] initWithAPIKey:apiKey cachePolicy:cachePolicy];
}

- (instancetype) initWithAPIKey:(EVEAPIKey*) apiKey cachePolicy:(NSURLRequestCachePolicy) cachePolicy {
	if (self = [super init]) {
		self.apiKey = apiKey;
		self.cachePolicy = cachePolicy;
	}
	return self;
}

- (AFHTTPRequestOperationManager*) httpRequestOperationManager {
	static AFHTTPRequestOperationManager* manager;
	if (!manager) {
		static dispatch_once_t onceToken;
		dispatch_once(&onceToken, ^{
			manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:@"https://api.eveonline.com"]];
			manager.requestSerializer = [AFHTTPRequestSerializer serializer];
		});
	}
	return manager;
}

#pragma mark - Account

- (AFHTTPRequestOperation*) accountStatusWithCompletionBlock:(void(^)(EVEAccountStatus* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"AccountStatus" path:@"Account" parameters:nil responseClass:[EVEAccountStatus class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) apiKeyInfoWithCompletionBlock:(void(^)(EVEAPIKeyInfo* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"APIKeyInfo" path:@"Account" parameters:nil responseClass:[EVEAPIKeyInfo class] completionBlock:completionBlock progressBlock:progressBlock];
}


- (AFHTTPRequestOperation*) charactersWithCompletionBlock:(void(^)(EVECharacters* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"Characters" path:@"Account" parameters:nil responseClass:[EVECharacters class] completionBlock:completionBlock progressBlock:progressBlock];
}

#pragma mark - Character

// Character
- (AFHTTPRequestOperation*) accountBalanceWithCompletionBlock:(void(^)(EVEAccountBalance* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"AccountBalance" path:self.apiKey.corporate ? @"Corp" : @"Char" parameters:nil responseClass:[EVEAccountBalance class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) assetListWithCompletionBlock:(void(^)(EVEAssetList* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"AssetList" path:self.apiKey.corporate ? @"Corp" : @"Char" parameters:nil responseClass:[EVEAssetList class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) blueprintsWithCompletionBlock:(void(^)(EVEBlueprints* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"Blueprints" path:self.apiKey.corporate ? @"Corp" : @"Char" parameters:nil responseClass:[EVEBlueprints class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) calendarEventAttendeesWithCompletionBlock:(void(^)(EVECalendarEventAttendees* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"CalendarEventAttendees" path:self.apiKey.corporate ? @"Corp" : @"Char" parameters:nil responseClass:[EVECalendarEventAttendees class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) characterSheetWithCompletionBlock:(void(^)(EVECharacterSheet* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"CharacterSheet" path:self.apiKey.corporate ? @"Corp" : @"Char" parameters:nil responseClass:[EVECharacterSheet class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) charFacWarStatsWithCompletionBlock:(void(^)(EVECharFacWarStats* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"FacWarStats" path:@"Char" parameters:nil responseClass:[EVECharFacWarStats class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) charMedalsWithCompletionBlock:(void(^)(EVECharMedals* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"Medals" path:@"Char" parameters:nil responseClass:[EVECharMedals class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) charStandingsWithCompletionBlock:(void(^)(EVECharStandings* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"Standings" path:@"Char" parameters:nil responseClass:[EVECharStandings class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) charWalletJournalFromID:(int64_t )fromID rowCount:(NSInteger) rowCount completionBlock:(void(^)(EVECharWalletJournal* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	NSMutableDictionary* parameters = [NSMutableDictionary new];
	if (fromID > 0)
		parameters[@"fromID"] = @(fromID);
	if (rowCount > 0)
		parameters[@"rowCount"] = @(rowCount);
	return [self GET:@"WalletJournal" path:@"Char" parameters:parameters responseClass:[EVECharWalletJournal class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) charWalletTransactionsFromID:(int64_t )fromID rowCount:(NSInteger) rowCount completionBlock:(void(^)(EVECharWalletTransactions* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	NSMutableDictionary* parameters = [NSMutableDictionary new];
	if (fromID > 0)
		parameters[@"fromID"] = @(fromID);
	if (rowCount > 0)
		parameters[@"rowCount"] = @(rowCount);
	return [self GET:@"WalletTransactions" path:@"Char" parameters:parameters responseClass:[EVECharWalletTransactions class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) contactListWithCompletionBlock:(void(^)(EVEContactList* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"ContactList" path:self.apiKey.corporate ? @"Corp" : @"Char" parameters:nil responseClass:[EVEContactList class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) contactNotificationsWithCompletionBlock:(void(^)(EVEContactNotifications* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"ContactNotifications" path:self.apiKey.corporate ? @"Corp" : @"Char" parameters:nil responseClass:[EVEContactNotifications class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) contractBidsWithCompletionBlock:(void(^)(EVEContractBids* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"ContactNotifications" path:self.apiKey.corporate ? @"Corp" : @"Char" parameters:nil responseClass:[EVEContractBids class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) contractItemsWithContractID:(int32_t) contractID completionBlock:(void(^)(EVEContractItems* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"ContactNotifications" path:self.apiKey.corporate ? @"Corp" : @"Char" parameters:@{@"contractID":@(contractID)} responseClass:[EVEContractItems class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) contractsWithContractID:(int32_t) contractID completionBlock:(void(^)(EVEContracts* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"ContactNotifications" path:self.apiKey.corporate ? @"Corp" : @"Char" parameters:contractID ? @{@"contractID":@(contractID)} : nil responseClass:[EVEContracts class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) industryJobsWithCompletionBlock:(void(^)(EVEIndustryJobs* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"IndustryJobs" path:self.apiKey.corporate ? @"Corp" : @"Char" parameters:nil responseClass:[EVEIndustryJobs class] completionBlock:completionBlock progressBlock:progressBlock];
	
}

- (AFHTTPRequestOperation*) industryJobsHistoryWithCompletionBlock:(void(^)(EVEIndustryJobsHistory* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"IndustryJobsHistory" path:self.apiKey.corporate ? @"Corp" : @"Char" parameters:nil responseClass:[EVEIndustryJobsHistory class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) killMailsFromID:(int32_t )fromID rowCount:(NSInteger) rowCount completionBlock:(void(^)(EVEKillMails* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	NSMutableDictionary* parameters = [NSMutableDictionary new];
	if (fromID > 0)
		parameters[@"fromID"] = @(fromID);
	if (rowCount > 0)
		parameters[@"rowCount"] = @(rowCount);
	return [self GET:@"KillMails" path:self.apiKey.corporate ? @"Corp" : @"Char" parameters:parameters responseClass:[EVEKillMails class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) locationsWithIDs:(NSArray*) ids completionBlock:(void(^)(EVELocations* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"Locations" path:self.apiKey.corporate ? @"Corp" : @"Char" parameters:@{@"ids":[ids componentsJoinedByString:@","]} responseClass:[EVELocations class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) mailBodiesWithIDs:(NSArray*) ids completionBlock:(void(^)(EVEMailBodies* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"MailBodies" path:@"Char" parameters:@{@"ids":[ids componentsJoinedByString:@","]} responseClass:[EVEMailBodies class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) mailingListsWithCompletionBlock:(void(^)(EVEMailingLists* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"MailingLists" path:@"Char" parameters:nil responseClass:[EVEMailingLists class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) mailMessagesWithCompletionBlock:(void(^)(EVEMailMessages* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"MailMessages" path:@"Char" parameters:nil responseClass:[EVEMailMessages class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) marketOrdersWithOrderID:(int32_t) orderID completionBlock:(void(^)(EVEMarketOrders* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"MarketOrders" path:self.apiKey.corporate ? @"Corp" : @"Char" parameters:orderID ? @{@"orderID":@(orderID)} : nil responseClass:[EVEMarketOrders class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) notificationsWithCompletionBlock:(void(^)(EVENotifications* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"Notifications" path:@"Char" parameters:nil responseClass:[EVENotifications class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) notificationTextsWithIDs:(NSArray*) ids completionBlock:(void(^)(EVENotificationTexts* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"NotificationTexts" path:@"Char" parameters:@{@"ids":[ids componentsJoinedByString:@","]} responseClass:[EVENotificationTexts class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) planetaryColoniesWithCompletionBlock:(void(^)(EVEPlanetaryColonies* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"PlanetaryColonies" path:@"Char" parameters:nil responseClass:[EVEPlanetaryColonies class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) planetaryLinksWithPlanetID:(int32_t) planetID completionBlock:(void(^)(EVEPlanetaryLinks* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"PlanetaryLinks" path:@"Char" parameters:@{@"planetID":@(planetID)} responseClass:[EVEPlanetaryLinks class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) planetaryPinsWithPlanetID:(int32_t) planetID completionBlock:(void(^)(EVEPlanetaryPins* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"PlanetaryPins" path:@"Char" parameters:@{@"planetID":@(planetID)} responseClass:[EVEPlanetaryPins class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) planetaryRoutesWithPlanetID:(int32_t) planetID completionBlock:(void(^)(EVEPlanetaryRoutes* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"PlanetaryRoutes" path:@"Char" parameters:@{@"planetID":@(planetID)} responseClass:[EVEPlanetaryRoutes class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) researchWithCompletionBlock:(void(^)(EVEResearch* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"Research" path:@"Char" parameters:nil responseClass:[EVEResearch class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) skillInTrainingWithCompletionBlock:(void(^)(EVESkillInTraining* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"SkillInTraining" path:@"Char" parameters:nil responseClass:[EVESkillInTraining class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) skillQueueWithCompletionBlock:(void(^)(EVESkillQueue* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"SkillQueue" path:@"Char" parameters:nil responseClass:[EVESkillQueue class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) upcomingCalendarEventsWithCompletionBlock:(void(^)(EVEUpcomingCalendarEvents* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"UpcomingCalendarEvents" path:@"Char" parameters:nil responseClass:[EVEUpcomingCalendarEvents class] completionBlock:completionBlock progressBlock:progressBlock];
}

#pragma mark - Corporation

- (AFHTTPRequestOperation*) containerLogWithCompletionBlock:(void(^)(EVEContainerLog* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"ContainerLog" path:@"Corp" parameters:nil responseClass:[EVEContainerLog class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) corporationSheetWithCorporationID:(int32_t) corporationID completionBlock:(void(^)(EVECorporationSheet* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"CorporationSheet" path:@"Corp" parameters:corporationID ? @{@"corporationID":@(corporationID)} : nil responseClass:[EVECorporationSheet class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) corpFacWarStatsWithCompletionBlock:(void(^)(EVECorpFacWarStats* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"FacWarStats" path:@"Corp" parameters:nil responseClass:[EVECorpFacWarStats class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) customsOfficesWithCompletionBlock:(void(^)(EVECustomsOffices* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"CustomsOffices" path:@"Corp" parameters:nil responseClass:[EVECustomsOffices class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) facilitiesWithCompletionBlock:(void(^)(EVEFacilities* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"Facilities" path:@"Corp" parameters:nil responseClass:[EVEFacilities class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) corpMedalsWithCompletionBlock:(void(^)(EVECorpMedals* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"Medals" path:@"Corp" parameters:nil responseClass:[EVECorpMedals class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) memberMedalsWithCompletionBlock:(void(^)(EVEMemberMedals* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"MemberMedals" path:@"Corp" parameters:nil responseClass:[EVEMemberMedals class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) memberSecurityWithCompletionBlock:(void(^)(EVEMemberSecurity* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"MemberSecurity" path:@"Corp" parameters:nil responseClass:[EVEMemberSecurity class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) memberSecurityLogWithCompletionBlock:(void(^)(EVEMemberSecurityLog* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"MemberSecurityLog" path:@"Corp" parameters:nil responseClass:[EVEMemberSecurityLog class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) memberTrackingWithExtendedInfo:(BOOL) extended completionBlock:(void(^)(EVEMemberTracking* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"MemberTracking" path:@"Corp" parameters:@{@"extended":@(extended)} responseClass:[EVEMemberTracking class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) outpostListWithCompletionBlock:(void(^)(EVEOutpostList* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"OutpostList" path:@"Corp" parameters:nil responseClass:[EVEOutpostList class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) outpostServiceDetailWithItemID:(int32_t) itemID completionBlock:(void(^)(EVEOutpostServiceDetail* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"OutpostServiceDetail" path:@"Corp" parameters:@{@"itemID":@(itemID)} responseClass:[EVEOutpostServiceDetail class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) shareholdersWithCompletionBlock:(void(^)(EVEShareholders* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"Shareholders" path:@"Corp" parameters:nil responseClass:[EVEShareholders class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) corpStandingsWithCompletionBlock:(void(^)(EVECorpStandings* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"Standings" path:@"Corp" parameters:nil responseClass:[EVECorpStandings class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) starbaseDetailWithItemID:(int32_t) itemID completionBlock:(void(^)(EVEStarbaseDetail* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"StarbaseDetail" path:@"Corp" parameters:@{@"itemID":@(itemID)} responseClass:[EVEStarbaseDetail class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) starbaseListWithCompletionBlock:(void(^)(EVEStarbaseList* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"StarbaseList" path:@"Corp" parameters:nil responseClass:[EVEStarbaseList class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) titlesWithCompletionBlock:(void(^)(EVETitles* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"Titles" path:@"Corp" parameters:nil responseClass:[EVETitles class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) corpWalletJournalWithAccountKey:(int32_t) accountKey fromID:(int64_t )fromID rowCount:(NSInteger) rowCount completionBlock:(void(^)(EVECorpWalletJournal* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	NSMutableDictionary* parameters = [NSMutableDictionary new];
	if (fromID > 0)
		parameters[@"fromID"] = @(fromID);
	if (rowCount > 0)
		parameters[@"rowCount"] = @(rowCount);
	if (accountKey)
		parameters[@"accountKey"] = @(accountKey);
	return [self GET:@"WalletJournal" path:@"Corp" parameters:parameters responseClass:[EVECorpWalletJournal class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) corpWalletTransactionsWithAccountKey:(int32_t) accountKey fromID:(int64_t )fromID rowCount:(NSInteger) rowCount completionBlock:(void(^)(EVECorpWalletTransactions* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	NSMutableDictionary* parameters = [NSMutableDictionary new];
	if (fromID > 0)
		parameters[@"fromID"] = @(fromID);
	if (rowCount > 0)
		parameters[@"rowCount"] = @(rowCount);
	if (accountKey)
		parameters[@"accountKey"] = @(accountKey);
	return [self GET:@"WalletTransactions" path:@"Corp" parameters:parameters responseClass:[EVECorpWalletTransactions class] completionBlock:completionBlock progressBlock:progressBlock];
}

#pragma mark - EVE

- (AFHTTPRequestOperation*) allianceListWithCompletionBlock:(void(^)(EVEAllianceList* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"AllianceList" path:@"Eve" parameters:nil responseClass:[EVEAllianceList class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) characterAffiliationWithIDs:(NSArray*) ids completionBlock:(void(^)(EVECharacterAffiliation* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"CharacterAffiliation" path:@"Eve" parameters:@{@"ids": [ids componentsJoinedByString:@","]} responseClass:[EVECharacterAffiliation class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) characterIDWithNames:(NSArray*) names completionBlock:(void(^)(EVECharacterID* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"CharacterID" path:@"Eve" parameters:@{@"names": [names componentsJoinedByString:@","]} responseClass:[EVECharacterID class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) characterInfoWithCharacterID:(int32_t) characterID completionBlock:(void(^)(EVECharacterInfo* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"CharacterInfo" path:@"Eve" parameters:@{@"characterID": @(characterID)} responseClass:[EVECharacterInfo class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) characterNameWithIDs:(NSArray*) ids completionBlock:(void(^)(EVECharacterName* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"CharacterName" path:@"Eve" parameters:@{@"ids": [ids componentsJoinedByString:@","]} responseClass:[EVECharacterName class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) conquerableStationListWithCompletionBlock:(void(^)(EVEConquerableStationList* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"ConquerableStationList" path:@"Eve" parameters:nil responseClass:[EVEConquerableStationList class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) errorListWithCompletionBlock:(void(^)(EVEErrorList* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"ErrorList" path:@"Eve" parameters:nil responseClass:[EVEErrorList class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) facWarStatsWithCompletionBlock:(void(^)(EVEFacWarStats* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"FacWarStats" path:@"Eve" parameters:nil responseClass:[EVEFacWarStats class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) facWarTopStatsWithCompletionBlock:(void(^)(EVEFacWarTopStats* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"FacWarTopStats" path:@"Eve" parameters:nil responseClass:[EVEFacWarTopStats class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) ownerIDWithNames:(NSArray*) names completionBlock:(void(^)(EVEOwnerID* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"OwnerID" path:@"Eve" parameters:@{@"names": [names componentsJoinedByString:@","]} responseClass:[EVEOwnerID class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) refTypesWithCompletionBlock:(void(^)(EVERefTypes* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"RefTypes" path:@"Eve" parameters:nil responseClass:[EVERefTypes class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) skillTreeWithCompletionBlock:(void(^)(EVESkillTree* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"SkillTree" path:@"Eve" parameters:nil responseClass:[EVESkillTree class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) typeNameWithIDs:(NSArray*) ids completionBlock:(void(^)(EVETypeName* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"TypeName" path:@"Eve" parameters:@{@"ids": [ids componentsJoinedByString:@","]} responseClass:[EVETypeName class] completionBlock:completionBlock progressBlock:progressBlock];
}

#pragma mark - Map

- (AFHTTPRequestOperation*) facWarSystemsWithCompletionBlock:(void(^)(EVEFacWarSystems* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"FacWarSystems" path:@"Map" parameters:nil responseClass:[EVEFacWarSystems class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) jumpsWithCompletionBlock:(void(^)(EVEJumps* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"Jumps" path:@"Map" parameters:nil responseClass:[EVEJumps class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) killsWithCompletionBlock:(void(^)(EVEKills* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"Kills" path:@"Map" parameters:nil responseClass:[EVEKills class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) sovereigntyWithCompletionBlock:(void(^)(EVESovereignty* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"Sovereignty" path:@"Map" parameters:nil responseClass:[EVESovereignty class] completionBlock:completionBlock progressBlock:progressBlock];
}

#pragma mark - Server

- (AFHTTPRequestOperation*) serverStatusWithCompletionBlock:(void(^)(EVEServerStatus* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"ServerStatus" path:@"Server" parameters:nil responseClass:[EVEServerStatus class] completionBlock:completionBlock progressBlock:progressBlock];
}

#pragma mark - API

- (AFHTTPRequestOperation*) callListWithCompletionBlock:(void(^)(EVECallList* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self GET:@"CallList" path:@"API" parameters:nil responseClass:[EVECallList class] completionBlock:completionBlock progressBlock:progressBlock];
}


#pragma mark - Private

- (AFHTTPRequestOperation*) GET:(NSString*) method path:(NSString*) path parameters:(NSDictionary*) parameters responseClass:(Class) responseClass completionBlock:(void(^)(id result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	NSString* urlString = [[path stringByAppendingPathComponent:method] stringByAppendingPathExtension:@"xml.aspx"];
	
	NSMutableDictionary* param = [self.apiKey ? @{@"keyID":@(self.apiKey.keyID), @"vCode":self.apiKey.vCode, @"characterID":@(self.apiKey.characterID)} : @{} mutableCopy];
	if (parameters)
		[param setValuesForKeysWithDictionary:parameters];
	
	AFHTTPRequestSerializer* serializer = [AFHTTPRequestSerializer serializer];
	serializer.cachePolicy = self.cachePolicy;
	
	static NSMutableDictionary* completionBlocks = nil;
	if (!completionBlocks) {
		static dispatch_once_t onceToken;
		dispatch_once(&onceToken, ^{
			completionBlocks = [NSMutableDictionary new];
		});
	}
	
	NSURLRequest* request = [serializer requestWithMethod:@"GET"
												URLString:[[NSURL URLWithString:urlString relativeToURL:self.httpRequestOperationManager.baseURL] absoluteString]
											   parameters:param
													error:nil];
	
	if (completionBlock) {
		@synchronized(completionBlocks) {
			void (^oldHandler)(id result, NSError* error) = completionBlocks[request];
			if (oldHandler)
				completionBlocks[request] = completionBlock = ^(id result, NSError* error) {
					oldHandler(result, error);
					completionBlock(result, error);
				};
			else
				completionBlocks[request] = completionBlock;
		}
	}
	
	
	AFHTTPRequestOperation *operation = [self.httpRequestOperationManager HTTPRequestOperationWithRequest:request
																								  success:^void(AFHTTPRequestOperation * operation, id result) {
																									  void (^block)(id result, NSError* error);
																									  @synchronized(completionBlocks) {
																										  block = completionBlocks[request];
																										  if (block)
																											  [completionBlocks removeObjectForKey:request];
																									  }
																									  if (block)
																										  block(result, nil);
																									  
																									  NSMutableDictionary* headers = [[operation.response allHeaderFields] mutableCopy];
																									  
																									  NSString* md5 = [operation.request.URL md5];
																									  NSString* etag = headers[@"Etag"];
																									  if (!etag || ![md5 isEqualToString:etag]) {
																										  EVEResult* eveResult = result;
																										  NSString* date = [[NSDateFormatter rfc822DateFormatter] stringFromDate:eveResult.eveapi.currentTime];
																										  NSString* expired = [[NSDateFormatter rfc822DateFormatter] stringFromDate:eveResult.eveapi.cachedUntil];
																										  if (date && expired) {
																											  headers[@"Date"] = date;
																											  headers[@"Expires"] = expired;
																											  headers[@"Etag"] = md5;
																											  [headers removeObjectForKey:@"Vary"];
																											  NSHTTPURLResponse* response = [[NSHTTPURLResponse alloc] initWithURL:operation.response.URL statusCode:operation.response.statusCode HTTPVersion:@"HTTP/1.1" headerFields:headers];
																											  NSCachedURLResponse* cachedResponse = [[NSCachedURLResponse alloc] initWithResponse:response data:operation.responseData userInfo:nil storagePolicy:NSURLCacheStorageAllowed];
																											  [[NSURLCache sharedURLCache] storeCachedResponse:cachedResponse forRequest:operation.request];
																										  }
																									  }
																								  }
																								  failure:^void(AFHTTPRequestOperation * operation, NSError * error) {
																									  void (^block)(id result, NSError* error);
																									  @synchronized(completionBlocks) {
																										  block = completionBlocks[request];
																										  if (block)
																											  [completionBlocks removeObjectForKey:request];
																									  }
																									  if (block)
																										  block(nil, error);
																								  }];
	operation.responseSerializer = [EVEAPISerializer serializerWithRootClass:responseClass];
	[operation setCacheResponseBlock:^NSCachedURLResponse* (NSURLConnection* connection, NSCachedURLResponse* response) {
		return nil;
	}];
	
	[self.httpRequestOperationManager.operationQueue addOperation:operation];
	return operation;
}

@end
