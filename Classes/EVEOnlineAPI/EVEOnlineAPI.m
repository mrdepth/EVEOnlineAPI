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
#import "NSDictionary+Hash.h"

@interface EVEOnlineAPI()

- (void) GET:(NSString*) method scope:(NSString*) scope parameters:(NSDictionary*) parameters responseClass:(Class) responseClass completionBlock:(void(^)(id result, NSError* error)) completionBlock;

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

- (instancetype) init {
	if (self = [super init]) {
		self.cachePolicy = NSURLRequestUseProtocolCachePolicy;
//		self.startImmediately = YES;
	}
	return self;
}

- (instancetype) initWithAPIKey:(EVEAPIKey*) apiKey cachePolicy:(NSURLRequestCachePolicy) cachePolicy {
	if (self = [super init]) {
		self.apiKey = apiKey;
		self.cachePolicy = cachePolicy;
//		self.startImmediately = YES;
	}
	return self;
}

- (EVEHTTPSessionManager*) sessionManager {
	static EVEHTTPSessionManager* manager;
	if (!manager) {
		static dispatch_once_t onceToken;
		dispatch_once(&onceToken, ^{
			manager = [[EVEHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"https://api.eveonline.com"]];
			manager.requestSerializer = [AFHTTPRequestSerializer serializer];
		});
	}
	return manager;
}

#pragma mark - Account

- (void) accountStatusWithCompletionBlock:(void(^)(EVEAccountStatus* result, NSError* error)) completionBlock {
	return [self GET:@"AccountStatus" scope:@"Account" parameters:nil responseClass:[EVEAccountStatus class] completionBlock:completionBlock];
}

- (void) apiKeyInfoWithCompletionBlock:(void(^)(EVEAPIKeyInfo* result, NSError* error)) completionBlock {
	return [self GET:@"APIKeyInfo" scope:@"Account" parameters:nil responseClass:[EVEAPIKeyInfo class] completionBlock:completionBlock];
}


- (void) charactersWithCompletionBlock:(void(^)(EVECharacters* result, NSError* error)) completionBlock {
	return [self GET:@"Characters" scope:@"Account" parameters:nil responseClass:[EVECharacters class] completionBlock:completionBlock];
}

#pragma mark - Character

// Character
- (void) accountBalanceWithCompletionBlock:(void(^)(EVEAccountBalance* result, NSError* error)) completionBlock {
	return [self GET:@"AccountBalance" scope:self.apiKey.corporate ? @"Corp" : @"Char" parameters:nil responseClass:[EVEAccountBalance class] completionBlock:completionBlock];
}

- (void) assetListWithCompletionBlock:(void(^)(EVEAssetList* result, NSError* error)) completionBlock {
	return [self GET:@"AssetList" scope:self.apiKey.corporate ? @"Corp" : @"Char" parameters:nil responseClass:[EVEAssetList class] completionBlock:completionBlock];
}

- (void) blueprintsWithCompletionBlock:(void(^)(EVEBlueprints* result, NSError* error)) completionBlock {
	return [self GET:@"Blueprints" scope:self.apiKey.corporate ? @"Corp" : @"Char" parameters:nil responseClass:[EVEBlueprints class] completionBlock:completionBlock];
}

- (void) calendarEventAttendeesWithCompletionBlock:(void(^)(EVECalendarEventAttendees* result, NSError* error)) completionBlock {
	return [self GET:@"CalendarEventAttendees" scope:self.apiKey.corporate ? @"Corp" : @"Char" parameters:nil responseClass:[EVECalendarEventAttendees class] completionBlock:completionBlock];
}

- (void) characterSheetWithCompletionBlock:(void(^)(EVECharacterSheet* result, NSError* error)) completionBlock {
	return [self GET:@"CharacterSheet" scope:self.apiKey.corporate ? @"Corp" : @"Char" parameters:nil responseClass:[EVECharacterSheet class] completionBlock:completionBlock];
}

- (void) charFacWarStatsWithCompletionBlock:(void(^)(EVECharFacWarStats* result, NSError* error)) completionBlock {
	return [self GET:@"FacWarStats" scope:@"Char" parameters:nil responseClass:[EVECharFacWarStats class] completionBlock:completionBlock];
}

- (void) charMedalsWithCompletionBlock:(void(^)(EVECharMedals* result, NSError* error)) completionBlock {
	return [self GET:@"Medals" scope:@"Char" parameters:nil responseClass:[EVECharMedals class] completionBlock:completionBlock];
}

- (void) charStandingsWithCompletionBlock:(void(^)(EVECharStandings* result, NSError* error)) completionBlock {
	return [self GET:@"Standings" scope:@"Char" parameters:nil responseClass:[EVECharStandings class] completionBlock:completionBlock];
}

- (void) charWalletJournalFromID:(int64_t )fromID rowCount:(NSInteger) rowCount completionBlock:(void(^)(EVECharWalletJournal* result, NSError* error)) completionBlock {
	NSMutableDictionary* parameters = [NSMutableDictionary new];
	if (fromID > 0)
		parameters[@"fromID"] = @(fromID);
	if (rowCount > 0)
		parameters[@"rowCount"] = @(rowCount);
	return [self GET:@"WalletJournal" scope:@"Char" parameters:parameters responseClass:[EVECharWalletJournal class] completionBlock:completionBlock];
}

- (void) charWalletTransactionsFromID:(int64_t )fromID rowCount:(NSInteger) rowCount completionBlock:(void(^)(EVECharWalletTransactions* result, NSError* error)) completionBlock {
	NSMutableDictionary* parameters = [NSMutableDictionary new];
	if (fromID > 0)
		parameters[@"fromID"] = @(fromID);
	if (rowCount > 0)
		parameters[@"rowCount"] = @(rowCount);
	return [self GET:@"WalletTransactions" scope:@"Char" parameters:parameters responseClass:[EVECharWalletTransactions class] completionBlock:completionBlock];
}

- (void) contactListWithCompletionBlock:(void(^)(EVEContactList* result, NSError* error)) completionBlock {
	return [self GET:@"ContactList" scope:self.apiKey.corporate ? @"Corp" : @"Char" parameters:nil responseClass:[EVEContactList class] completionBlock:completionBlock];
}

- (void) contactNotificationsWithCompletionBlock:(void(^)(EVEContactNotifications* result, NSError* error)) completionBlock {
	return [self GET:@"ContactNotifications" scope:self.apiKey.corporate ? @"Corp" : @"Char" parameters:nil responseClass:[EVEContactNotifications class] completionBlock:completionBlock];
}

- (void) contractBidsWithCompletionBlock:(void(^)(EVEContractBids* result, NSError* error)) completionBlock {
	return [self GET:@"ContractBids" scope:self.apiKey.corporate ? @"Corp" : @"Char" parameters:nil responseClass:[EVEContractBids class] completionBlock:completionBlock];
}

- (void) contractItemsWithContractID:(int64_t) contractID completionBlock:(void(^)(EVEContractItems* result, NSError* error)) completionBlock {
	return [self GET:@"ContractItems" scope:self.apiKey.corporate ? @"Corp" : @"Char" parameters:@{@"contractID":@(contractID)} responseClass:[EVEContractItems class] completionBlock:completionBlock];
}

- (void) contractsWithContractID:(int64_t) contractID completionBlock:(void(^)(EVEContracts* result, NSError* error)) completionBlock {
	return [self GET:@"Contracts" scope:self.apiKey.corporate ? @"Corp" : @"Char" parameters:contractID ? @{@"contractID":@(contractID)} : nil responseClass:[EVEContracts class] completionBlock:completionBlock];
}

- (void) industryJobsWithCompletionBlock:(void(^)(EVEIndustryJobs* result, NSError* error)) completionBlock {
	return [self GET:@"IndustryJobs" scope:self.apiKey.corporate ? @"Corp" : @"Char" parameters:nil responseClass:[EVEIndustryJobs class] completionBlock:completionBlock];
	
}

- (void) industryJobsHistoryWithCompletionBlock:(void(^)(EVEIndustryJobsHistory* result, NSError* error)) completionBlock {
	return [self GET:@"IndustryJobsHistory" scope:self.apiKey.corporate ? @"Corp" : @"Char" parameters:nil responseClass:[EVEIndustryJobsHistory class] completionBlock:completionBlock];
}

- (void) killMailsFromID:(int32_t )fromID rowCount:(NSInteger) rowCount completionBlock:(void(^)(EVEKillMails* result, NSError* error)) completionBlock {
	NSMutableDictionary* parameters = [NSMutableDictionary new];
	if (fromID > 0)
		parameters[@"fromID"] = @(fromID);
	if (rowCount > 0)
		parameters[@"rowCount"] = @(rowCount);
	return [self GET:@"KillMails" scope:self.apiKey.corporate ? @"Corp" : @"Char" parameters:parameters responseClass:[EVEKillMails class] completionBlock:completionBlock];
}

- (void) locationsWithIDs:(NSArray*) ids completionBlock:(void(^)(EVELocations* result, NSError* error)) completionBlock {
	return [self GET:@"Locations" scope:self.apiKey.corporate ? @"Corp" : @"Char" parameters:@{@"ids":[ids componentsJoinedByString:@","]} responseClass:[EVELocations class] completionBlock:completionBlock];
}

- (void) mailBodiesWithIDs:(NSArray*) ids completionBlock:(void(^)(EVEMailBodies* result, NSError* error)) completionBlock {
	return [self GET:@"MailBodies" scope:@"Char" parameters:@{@"ids":[ids componentsJoinedByString:@","]} responseClass:[EVEMailBodies class] completionBlock:completionBlock];
}

- (void) mailingListsWithCompletionBlock:(void(^)(EVEMailingLists* result, NSError* error)) completionBlock {
	return [self GET:@"MailingLists" scope:@"Char" parameters:nil responseClass:[EVEMailingLists class] completionBlock:completionBlock];
}

- (void) mailMessagesWithCompletionBlock:(void(^)(EVEMailMessages* result, NSError* error)) completionBlock {
	return [self GET:@"MailMessages" scope:@"Char" parameters:nil responseClass:[EVEMailMessages class] completionBlock:completionBlock];
}

- (void) marketOrdersWithOrderID:(int32_t) orderID completionBlock:(void(^)(EVEMarketOrders* result, NSError* error)) completionBlock {
	return [self GET:@"MarketOrders" scope:self.apiKey.corporate ? @"Corp" : @"Char" parameters:orderID ? @{@"orderID":@(orderID)} : nil responseClass:[EVEMarketOrders class] completionBlock:completionBlock];
}

- (void) notificationsWithCompletionBlock:(void(^)(EVENotifications* result, NSError* error)) completionBlock {
	return [self GET:@"Notifications" scope:@"Char" parameters:nil responseClass:[EVENotifications class] completionBlock:completionBlock];
}

- (void) notificationTextsWithIDs:(NSArray*) ids completionBlock:(void(^)(EVENotificationTexts* result, NSError* error)) completionBlock {
	return [self GET:@"NotificationTexts" scope:@"Char" parameters:@{@"ids":[ids componentsJoinedByString:@","]} responseClass:[EVENotificationTexts class] completionBlock:completionBlock];
}

- (void) planetaryColoniesWithCompletionBlock:(void(^)(EVEPlanetaryColonies* result, NSError* error)) completionBlock {
	return [self GET:@"PlanetaryColonies" scope:@"Char" parameters:nil responseClass:[EVEPlanetaryColonies class] completionBlock:completionBlock];
}

- (void) planetaryLinksWithPlanetID:(int32_t) planetID completionBlock:(void(^)(EVEPlanetaryLinks* result, NSError* error)) completionBlock {
	return [self GET:@"PlanetaryLinks" scope:@"Char" parameters:@{@"planetID":@(planetID)} responseClass:[EVEPlanetaryLinks class] completionBlock:completionBlock];
}

- (void) planetaryPinsWithPlanetID:(int32_t) planetID completionBlock:(void(^)(EVEPlanetaryPins* result, NSError* error)) completionBlock {
	return [self GET:@"PlanetaryPins" scope:@"Char" parameters:@{@"planetID":@(planetID)} responseClass:[EVEPlanetaryPins class] completionBlock:completionBlock];
}

- (void) planetaryRoutesWithPlanetID:(int32_t) planetID completionBlock:(void(^)(EVEPlanetaryRoutes* result, NSError* error)) completionBlock {
	return [self GET:@"PlanetaryRoutes" scope:@"Char" parameters:@{@"planetID":@(planetID)} responseClass:[EVEPlanetaryRoutes class] completionBlock:completionBlock];
}

- (void) researchWithCompletionBlock:(void(^)(EVEResearch* result, NSError* error)) completionBlock {
	return [self GET:@"Research" scope:@"Char" parameters:nil responseClass:[EVEResearch class] completionBlock:completionBlock];
}

- (void) skillInTrainingWithCompletionBlock:(void(^)(EVESkillInTraining* result, NSError* error)) completionBlock {
	return [self GET:@"SkillInTraining" scope:@"Char" parameters:nil responseClass:[EVESkillInTraining class] completionBlock:completionBlock];
}

- (void) skillQueueWithCompletionBlock:(void(^)(EVESkillQueue* result, NSError* error)) completionBlock {
	return [self GET:@"SkillQueue" scope:@"Char" parameters:nil responseClass:[EVESkillQueue class] completionBlock:completionBlock];
}

- (void) upcomingCalendarEventsWithCompletionBlock:(void(^)(EVEUpcomingCalendarEvents* result, NSError* error)) completionBlock {
	return [self GET:@"UpcomingCalendarEvents" scope:@"Char" parameters:nil responseClass:[EVEUpcomingCalendarEvents class] completionBlock:completionBlock];
}

#pragma mark - Corporation

- (void) containerLogWithCompletionBlock:(void(^)(EVEContainerLog* result, NSError* error)) completionBlock {
	return [self GET:@"ContainerLog" scope:@"Corp" parameters:nil responseClass:[EVEContainerLog class] completionBlock:completionBlock];
}

- (void) corporationSheetWithCorporationID:(int32_t) corporationID completionBlock:(void(^)(EVECorporationSheet* result, NSError* error)) completionBlock {
	return [self GET:@"CorporationSheet" scope:@"Corp" parameters:corporationID ? @{@"corporationID":@(corporationID)} : nil responseClass:[EVECorporationSheet class] completionBlock:completionBlock];
}

- (void) corpFacWarStatsWithCompletionBlock:(void(^)(EVECorpFacWarStats* result, NSError* error)) completionBlock {
	return [self GET:@"FacWarStats" scope:@"Corp" parameters:nil responseClass:[EVECorpFacWarStats class] completionBlock:completionBlock];
}

- (void) customsOfficesWithCompletionBlock:(void(^)(EVECustomsOffices* result, NSError* error)) completionBlock {
	return [self GET:@"CustomsOffices" scope:@"Corp" parameters:nil responseClass:[EVECustomsOffices class] completionBlock:completionBlock];
}

- (void) facilitiesWithCompletionBlock:(void(^)(EVEFacilities* result, NSError* error)) completionBlock {
	return [self GET:@"Facilities" scope:@"Corp" parameters:nil responseClass:[EVEFacilities class] completionBlock:completionBlock];
}

- (void) corpMedalsWithCompletionBlock:(void(^)(EVECorpMedals* result, NSError* error)) completionBlock {
	return [self GET:@"Medals" scope:@"Corp" parameters:nil responseClass:[EVECorpMedals class] completionBlock:completionBlock];
}

- (void) memberMedalsWithCompletionBlock:(void(^)(EVEMemberMedals* result, NSError* error)) completionBlock {
	return [self GET:@"MemberMedals" scope:@"Corp" parameters:nil responseClass:[EVEMemberMedals class] completionBlock:completionBlock];
}

- (void) memberSecurityWithCompletionBlock:(void(^)(EVEMemberSecurity* result, NSError* error)) completionBlock {
	return [self GET:@"MemberSecurity" scope:@"Corp" parameters:nil responseClass:[EVEMemberSecurity class] completionBlock:completionBlock];
}

- (void) memberSecurityLogWithCompletionBlock:(void(^)(EVEMemberSecurityLog* result, NSError* error)) completionBlock {
	return [self GET:@"MemberSecurityLog" scope:@"Corp" parameters:nil responseClass:[EVEMemberSecurityLog class] completionBlock:completionBlock];
}

- (void) memberTrackingWithExtendedInfo:(BOOL) extended completionBlock:(void(^)(EVEMemberTracking* result, NSError* error)) completionBlock {
	return [self GET:@"MemberTracking" scope:@"Corp" parameters:@{@"extended":@(extended)} responseClass:[EVEMemberTracking class] completionBlock:completionBlock];
}

- (void) outpostListWithCompletionBlock:(void(^)(EVEOutpostList* result, NSError* error)) completionBlock {
	return [self GET:@"OutpostList" scope:@"Corp" parameters:nil responseClass:[EVEOutpostList class] completionBlock:completionBlock];
}

- (void) outpostServiceDetailWithItemID:(int32_t) itemID completionBlock:(void(^)(EVEOutpostServiceDetail* result, NSError* error)) completionBlock {
	return [self GET:@"OutpostServiceDetail" scope:@"Corp" parameters:@{@"itemID":@(itemID)} responseClass:[EVEOutpostServiceDetail class] completionBlock:completionBlock];
}

- (void) shareholdersWithCompletionBlock:(void(^)(EVEShareholders* result, NSError* error)) completionBlock {
	return [self GET:@"Shareholders" scope:@"Corp" parameters:nil responseClass:[EVEShareholders class] completionBlock:completionBlock];
}

- (void) corpStandingsWithCompletionBlock:(void(^)(EVECorpStandings* result, NSError* error)) completionBlock {
	return [self GET:@"Standings" scope:@"Corp" parameters:nil responseClass:[EVECorpStandings class] completionBlock:completionBlock];
}

- (void) starbaseDetailWithItemID:(int64_t) itemID completionBlock:(void(^)(EVEStarbaseDetail* result, NSError* error)) completionBlock {
	return [self GET:@"StarbaseDetail" scope:@"Corp" parameters:@{@"itemID":@(itemID)} responseClass:[EVEStarbaseDetail class] completionBlock:completionBlock];
}

- (void) starbaseListWithCompletionBlock:(void(^)(EVEStarbaseList* result, NSError* error)) completionBlock {
	return [self GET:@"StarbaseList" scope:@"Corp" parameters:nil responseClass:[EVEStarbaseList class] completionBlock:completionBlock];
}

- (void) titlesWithCompletionBlock:(void(^)(EVETitles* result, NSError* error)) completionBlock {
	return [self GET:@"Titles" scope:@"Corp" parameters:nil responseClass:[EVETitles class] completionBlock:completionBlock];
}

- (void) corpWalletJournalWithAccountKey:(int32_t) accountKey fromID:(int64_t )fromID rowCount:(NSInteger) rowCount completionBlock:(void(^)(EVECorpWalletJournal* result, NSError* error)) completionBlock {
	NSMutableDictionary* parameters = [NSMutableDictionary new];
	if (fromID > 0)
		parameters[@"fromID"] = @(fromID);
	if (rowCount > 0)
		parameters[@"rowCount"] = @(rowCount);
	if (accountKey)
		parameters[@"accountKey"] = @(accountKey);
	return [self GET:@"WalletJournal" scope:@"Corp" parameters:parameters responseClass:[EVECorpWalletJournal class] completionBlock:completionBlock];
}

- (void) corpWalletTransactionsWithAccountKey:(int32_t) accountKey fromID:(int64_t )fromID rowCount:(NSInteger) rowCount completionBlock:(void(^)(EVECorpWalletTransactions* result, NSError* error)) completionBlock {
	NSMutableDictionary* parameters = [NSMutableDictionary new];
	if (fromID > 0)
		parameters[@"fromID"] = @(fromID);
	if (rowCount > 0)
		parameters[@"rowCount"] = @(rowCount);
	if (accountKey)
		parameters[@"accountKey"] = @(accountKey);
	return [self GET:@"WalletTransactions" scope:@"Corp" parameters:parameters responseClass:[EVECorpWalletTransactions class] completionBlock:completionBlock];
}

#pragma mark - EVE

- (void) allianceListWithCompletionBlock:(void(^)(EVEAllianceList* result, NSError* error)) completionBlock {
	return [self GET:@"AllianceList" scope:@"Eve" parameters:nil responseClass:[EVEAllianceList class] completionBlock:completionBlock];
}

- (void) characterAffiliationWithIDs:(NSArray*) ids completionBlock:(void(^)(EVECharacterAffiliation* result, NSError* error)) completionBlock {
	return [self GET:@"CharacterAffiliation" scope:@"Eve" parameters:@{@"ids": [ids componentsJoinedByString:@","]} responseClass:[EVECharacterAffiliation class] completionBlock:completionBlock];
}

- (void) characterIDWithNames:(NSArray*) names completionBlock:(void(^)(EVECharacterID* result, NSError* error)) completionBlock {
	return [self GET:@"CharacterID" scope:@"Eve" parameters:@{@"names": [names componentsJoinedByString:@","]} responseClass:[EVECharacterID class] completionBlock:completionBlock];
}

- (void) characterInfoWithCharacterID:(int32_t) characterID completionBlock:(void(^)(EVECharacterInfo* result, NSError* error)) completionBlock {
	if (self.apiKey.characterID != characterID || self.apiKey.corporate)
		return [self GET:@"CharacterInfo" scope:@"Eve" parameters:@{@"characterID": @(characterID), @"keyID":@"", @"vCode":@""} responseClass:[EVECharacterInfo class] completionBlock:completionBlock];
	else
		return [self GET:@"CharacterInfo" scope:@"Eve" parameters:@{@"characterID": @(characterID)} responseClass:[EVECharacterInfo class] completionBlock:completionBlock];
}

- (void) characterNameWithIDs:(NSArray*) ids completionBlock:(void(^)(EVECharacterName* result, NSError* error)) completionBlock {
	return [self GET:@"CharacterName" scope:@"Eve" parameters:@{@"ids": [ids componentsJoinedByString:@","]} responseClass:[EVECharacterName class] completionBlock:completionBlock];
}

- (void) conquerableStationListWithCompletionBlock:(void(^)(EVEConquerableStationList* result, NSError* error)) completionBlock {
	return [self GET:@"ConquerableStationList" scope:@"Eve" parameters:nil responseClass:[EVEConquerableStationList class] completionBlock:completionBlock];
}

- (void) errorListWithCompletionBlock:(void(^)(EVEErrorList* result, NSError* error)) completionBlock {
	return [self GET:@"ErrorList" scope:@"Eve" parameters:nil responseClass:[EVEErrorList class] completionBlock:completionBlock];
}

- (void) facWarStatsWithCompletionBlock:(void(^)(EVEFacWarStats* result, NSError* error)) completionBlock {
	return [self GET:@"FacWarStats" scope:@"Eve" parameters:nil responseClass:[EVEFacWarStats class] completionBlock:completionBlock];
}

- (void) facWarTopStatsWithCompletionBlock:(void(^)(EVEFacWarTopStats* result, NSError* error)) completionBlock {
	return [self GET:@"FacWarTopStats" scope:@"Eve" parameters:nil responseClass:[EVEFacWarTopStats class] completionBlock:completionBlock];
}

- (void) ownerIDWithNames:(NSArray*) names completionBlock:(void(^)(EVEOwnerID* result, NSError* error)) completionBlock {
	return [self GET:@"OwnerID" scope:@"Eve" parameters:@{@"names": [names componentsJoinedByString:@","]} responseClass:[EVEOwnerID class] completionBlock:completionBlock];
}

- (void) refTypesWithCompletionBlock:(void(^)(EVERefTypes* result, NSError* error)) completionBlock {
	return [self GET:@"RefTypes" scope:@"Eve" parameters:nil responseClass:[EVERefTypes class] completionBlock:completionBlock];
}

- (void) skillTreeWithCompletionBlock:(void(^)(EVESkillTree* result, NSError* error)) completionBlock {
	return [self GET:@"SkillTree" scope:@"Eve" parameters:nil responseClass:[EVESkillTree class] completionBlock:completionBlock];
}

- (void) typeNameWithIDs:(NSArray*) ids completionBlock:(void(^)(EVETypeName* result, NSError* error)) completionBlock {
	return [self GET:@"TypeName" scope:@"Eve" parameters:@{@"ids": [ids componentsJoinedByString:@","]} responseClass:[EVETypeName class] completionBlock:completionBlock];
}

#pragma mark - Map

- (void) facWarSystemsWithCompletionBlock:(void(^)(EVEFacWarSystems* result, NSError* error)) completionBlock {
	return [self GET:@"FacWarSystems" scope:@"Map" parameters:nil responseClass:[EVEFacWarSystems class] completionBlock:completionBlock];
}

- (void) jumpsWithCompletionBlock:(void(^)(EVEJumps* result, NSError* error)) completionBlock {
	return [self GET:@"Jumps" scope:@"Map" parameters:nil responseClass:[EVEJumps class] completionBlock:completionBlock];
}

- (void) killsWithCompletionBlock:(void(^)(EVEKills* result, NSError* error)) completionBlock {
	return [self GET:@"Kills" scope:@"Map" parameters:nil responseClass:[EVEKills class] completionBlock:completionBlock];
}

- (void) sovereigntyWithCompletionBlock:(void(^)(EVESovereignty* result, NSError* error)) completionBlock {
	return [self GET:@"Sovereignty" scope:@"Map" parameters:nil responseClass:[EVESovereignty class] completionBlock:completionBlock];
}

#pragma mark - Server

- (void) serverStatusWithCompletionBlock:(void(^)(EVEServerStatus* result, NSError* error)) completionBlock {
	return [self GET:@"ServerStatus" scope:@"Server" parameters:nil responseClass:[EVEServerStatus class] completionBlock:completionBlock];
}

#pragma mark - API

- (void) callListWithCompletionBlock:(void(^)(EVECallList* result, NSError* error)) completionBlock {
	return [self GET:@"CallList" scope:@"API" parameters:nil responseClass:[EVECallList class] completionBlock:completionBlock];
}


#pragma mark - Private

- (void) GET:(NSString*) method scope:(NSString*) scope parameters:(NSDictionary*) parameters responseClass:(Class) responseClass completionBlock:(void(^)(id result, NSError* error)) completionBlock {
	NSString* urlString = [[scope stringByAppendingPathComponent:method] stringByAppendingPathExtension:@"xml.aspx"];
	
	NSMutableDictionary* param = [parameters mutableCopy] ?: [NSMutableDictionary new];
	if (self.apiKey && self.apiKey.vCode) {
		param[@"keyID"] = @(self.apiKey.keyID);
		param[@"vCode"] = self.apiKey.vCode;
		param[@"characterID"] = @(self.apiKey.characterID);
	}
	
	self.sessionManager.requestSerializer.cachePolicy = self.cachePolicy;
	
	[self.sessionManager GET:urlString parameters:param responseSerializer:[EVEAPISerializer serializerWithRootClass:responseClass] completionBlock:completionBlock];
}

@end
