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

- (void) GET:(NSString*) method path:(NSString*) path parameters:(NSDictionary*) parameters responseClass:(Class) responseClass completionBlock:(void(^)(id result, NSError* error)) completionBlock;

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

- (AFHTTPSessionManager*) httpRequestOperationManager {
	static AFHTTPSessionManager* manager;
	if (!manager) {
		static dispatch_once_t onceToken;
		dispatch_once(&onceToken, ^{
			manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"https://api.eveonline.com"]];
			manager.requestSerializer = [AFHTTPRequestSerializer serializer];
		});
	}
	return manager;
}

#pragma mark - Account

- (void) accountStatusWithCompletionBlock:(void(^)(EVEAccountStatus* result, NSError* error)) completionBlock {
	return [self GET:@"AccountStatus" path:@"Account" parameters:nil responseClass:[EVEAccountStatus class] completionBlock:completionBlock];
}

- (void) apiKeyInfoWithCompletionBlock:(void(^)(EVEAPIKeyInfo* result, NSError* error)) completionBlock {
	return [self GET:@"APIKeyInfo" path:@"Account" parameters:nil responseClass:[EVEAPIKeyInfo class] completionBlock:completionBlock];
}


- (void) charactersWithCompletionBlock:(void(^)(EVECharacters* result, NSError* error)) completionBlock {
	return [self GET:@"Characters" path:@"Account" parameters:nil responseClass:[EVECharacters class] completionBlock:completionBlock];
}

#pragma mark - Character

// Character
- (void) accountBalanceWithCompletionBlock:(void(^)(EVEAccountBalance* result, NSError* error)) completionBlock {
	return [self GET:@"AccountBalance" path:self.apiKey.corporate ? @"Corp" : @"Char" parameters:nil responseClass:[EVEAccountBalance class] completionBlock:completionBlock];
}

- (void) assetListWithCompletionBlock:(void(^)(EVEAssetList* result, NSError* error)) completionBlock {
	return [self GET:@"AssetList" path:self.apiKey.corporate ? @"Corp" : @"Char" parameters:nil responseClass:[EVEAssetList class] completionBlock:completionBlock];
}

- (void) blueprintsWithCompletionBlock:(void(^)(EVEBlueprints* result, NSError* error)) completionBlock {
	return [self GET:@"Blueprints" path:self.apiKey.corporate ? @"Corp" : @"Char" parameters:nil responseClass:[EVEBlueprints class] completionBlock:completionBlock];
}

- (void) calendarEventAttendeesWithCompletionBlock:(void(^)(EVECalendarEventAttendees* result, NSError* error)) completionBlock {
	return [self GET:@"CalendarEventAttendees" path:self.apiKey.corporate ? @"Corp" : @"Char" parameters:nil responseClass:[EVECalendarEventAttendees class] completionBlock:completionBlock];
}

- (void) characterSheetWithCompletionBlock:(void(^)(EVECharacterSheet* result, NSError* error)) completionBlock {
	return [self GET:@"CharacterSheet" path:self.apiKey.corporate ? @"Corp" : @"Char" parameters:nil responseClass:[EVECharacterSheet class] completionBlock:completionBlock];
}

- (void) charFacWarStatsWithCompletionBlock:(void(^)(EVECharFacWarStats* result, NSError* error)) completionBlock {
	return [self GET:@"FacWarStats" path:@"Char" parameters:nil responseClass:[EVECharFacWarStats class] completionBlock:completionBlock];
}

- (void) charMedalsWithCompletionBlock:(void(^)(EVECharMedals* result, NSError* error)) completionBlock {
	return [self GET:@"Medals" path:@"Char" parameters:nil responseClass:[EVECharMedals class] completionBlock:completionBlock];
}

- (void) charStandingsWithCompletionBlock:(void(^)(EVECharStandings* result, NSError* error)) completionBlock {
	return [self GET:@"Standings" path:@"Char" parameters:nil responseClass:[EVECharStandings class] completionBlock:completionBlock];
}

- (void) charWalletJournalFromID:(int64_t )fromID rowCount:(NSInteger) rowCount completionBlock:(void(^)(EVECharWalletJournal* result, NSError* error)) completionBlock {
	NSMutableDictionary* parameters = [NSMutableDictionary new];
	if (fromID > 0)
		parameters[@"fromID"] = @(fromID);
	if (rowCount > 0)
		parameters[@"rowCount"] = @(rowCount);
	return [self GET:@"WalletJournal" path:@"Char" parameters:parameters responseClass:[EVECharWalletJournal class] completionBlock:completionBlock];
}

- (void) charWalletTransactionsFromID:(int64_t )fromID rowCount:(NSInteger) rowCount completionBlock:(void(^)(EVECharWalletTransactions* result, NSError* error)) completionBlock {
	NSMutableDictionary* parameters = [NSMutableDictionary new];
	if (fromID > 0)
		parameters[@"fromID"] = @(fromID);
	if (rowCount > 0)
		parameters[@"rowCount"] = @(rowCount);
	return [self GET:@"WalletTransactions" path:@"Char" parameters:parameters responseClass:[EVECharWalletTransactions class] completionBlock:completionBlock];
}

- (void) contactListWithCompletionBlock:(void(^)(EVEContactList* result, NSError* error)) completionBlock {
	return [self GET:@"ContactList" path:self.apiKey.corporate ? @"Corp" : @"Char" parameters:nil responseClass:[EVEContactList class] completionBlock:completionBlock];
}

- (void) contactNotificationsWithCompletionBlock:(void(^)(EVEContactNotifications* result, NSError* error)) completionBlock {
	return [self GET:@"ContactNotifications" path:self.apiKey.corporate ? @"Corp" : @"Char" parameters:nil responseClass:[EVEContactNotifications class] completionBlock:completionBlock];
}

- (void) contractBidsWithCompletionBlock:(void(^)(EVEContractBids* result, NSError* error)) completionBlock {
	return [self GET:@"ContractBids" path:self.apiKey.corporate ? @"Corp" : @"Char" parameters:nil responseClass:[EVEContractBids class] completionBlock:completionBlock];
}

- (void) contractItemsWithContractID:(int64_t) contractID completionBlock:(void(^)(EVEContractItems* result, NSError* error)) completionBlock {
	return [self GET:@"ContractItems" path:self.apiKey.corporate ? @"Corp" : @"Char" parameters:@{@"contractID":@(contractID)} responseClass:[EVEContractItems class] completionBlock:completionBlock];
}

- (void) contractsWithContractID:(int64_t) contractID completionBlock:(void(^)(EVEContracts* result, NSError* error)) completionBlock {
	return [self GET:@"Contracts" path:self.apiKey.corporate ? @"Corp" : @"Char" parameters:contractID ? @{@"contractID":@(contractID)} : nil responseClass:[EVEContracts class] completionBlock:completionBlock];
}

- (void) industryJobsWithCompletionBlock:(void(^)(EVEIndustryJobs* result, NSError* error)) completionBlock {
	return [self GET:@"IndustryJobs" path:self.apiKey.corporate ? @"Corp" : @"Char" parameters:nil responseClass:[EVEIndustryJobs class] completionBlock:completionBlock];
	
}

- (void) industryJobsHistoryWithCompletionBlock:(void(^)(EVEIndustryJobsHistory* result, NSError* error)) completionBlock {
	return [self GET:@"IndustryJobsHistory" path:self.apiKey.corporate ? @"Corp" : @"Char" parameters:nil responseClass:[EVEIndustryJobsHistory class] completionBlock:completionBlock];
}

- (void) killMailsFromID:(int32_t )fromID rowCount:(NSInteger) rowCount completionBlock:(void(^)(EVEKillMails* result, NSError* error)) completionBlock {
	NSMutableDictionary* parameters = [NSMutableDictionary new];
	if (fromID > 0)
		parameters[@"fromID"] = @(fromID);
	if (rowCount > 0)
		parameters[@"rowCount"] = @(rowCount);
	return [self GET:@"KillMails" path:self.apiKey.corporate ? @"Corp" : @"Char" parameters:parameters responseClass:[EVEKillMails class] completionBlock:completionBlock];
}

- (void) locationsWithIDs:(NSArray*) ids completionBlock:(void(^)(EVELocations* result, NSError* error)) completionBlock {
	return [self GET:@"Locations" path:self.apiKey.corporate ? @"Corp" : @"Char" parameters:@{@"ids":[ids componentsJoinedByString:@","]} responseClass:[EVELocations class] completionBlock:completionBlock];
}

- (void) mailBodiesWithIDs:(NSArray*) ids completionBlock:(void(^)(EVEMailBodies* result, NSError* error)) completionBlock {
	return [self GET:@"MailBodies" path:@"Char" parameters:@{@"ids":[ids componentsJoinedByString:@","]} responseClass:[EVEMailBodies class] completionBlock:completionBlock];
}

- (void) mailingListsWithCompletionBlock:(void(^)(EVEMailingLists* result, NSError* error)) completionBlock {
	return [self GET:@"MailingLists" path:@"Char" parameters:nil responseClass:[EVEMailingLists class] completionBlock:completionBlock];
}

- (void) mailMessagesWithCompletionBlock:(void(^)(EVEMailMessages* result, NSError* error)) completionBlock {
	return [self GET:@"MailMessages" path:@"Char" parameters:nil responseClass:[EVEMailMessages class] completionBlock:completionBlock];
}

- (void) marketOrdersWithOrderID:(int32_t) orderID completionBlock:(void(^)(EVEMarketOrders* result, NSError* error)) completionBlock {
	return [self GET:@"MarketOrders" path:self.apiKey.corporate ? @"Corp" : @"Char" parameters:orderID ? @{@"orderID":@(orderID)} : nil responseClass:[EVEMarketOrders class] completionBlock:completionBlock];
}

- (void) notificationsWithCompletionBlock:(void(^)(EVENotifications* result, NSError* error)) completionBlock {
	return [self GET:@"Notifications" path:@"Char" parameters:nil responseClass:[EVENotifications class] completionBlock:completionBlock];
}

- (void) notificationTextsWithIDs:(NSArray*) ids completionBlock:(void(^)(EVENotificationTexts* result, NSError* error)) completionBlock {
	return [self GET:@"NotificationTexts" path:@"Char" parameters:@{@"ids":[ids componentsJoinedByString:@","]} responseClass:[EVENotificationTexts class] completionBlock:completionBlock];
}

- (void) planetaryColoniesWithCompletionBlock:(void(^)(EVEPlanetaryColonies* result, NSError* error)) completionBlock {
	return [self GET:@"PlanetaryColonies" path:@"Char" parameters:nil responseClass:[EVEPlanetaryColonies class] completionBlock:completionBlock];
}

- (void) planetaryLinksWithPlanetID:(int32_t) planetID completionBlock:(void(^)(EVEPlanetaryLinks* result, NSError* error)) completionBlock {
	return [self GET:@"PlanetaryLinks" path:@"Char" parameters:@{@"planetID":@(planetID)} responseClass:[EVEPlanetaryLinks class] completionBlock:completionBlock];
}

- (void) planetaryPinsWithPlanetID:(int32_t) planetID completionBlock:(void(^)(EVEPlanetaryPins* result, NSError* error)) completionBlock {
	return [self GET:@"PlanetaryPins" path:@"Char" parameters:@{@"planetID":@(planetID)} responseClass:[EVEPlanetaryPins class] completionBlock:completionBlock];
}

- (void) planetaryRoutesWithPlanetID:(int32_t) planetID completionBlock:(void(^)(EVEPlanetaryRoutes* result, NSError* error)) completionBlock {
	return [self GET:@"PlanetaryRoutes" path:@"Char" parameters:@{@"planetID":@(planetID)} responseClass:[EVEPlanetaryRoutes class] completionBlock:completionBlock];
}

- (void) researchWithCompletionBlock:(void(^)(EVEResearch* result, NSError* error)) completionBlock {
	return [self GET:@"Research" path:@"Char" parameters:nil responseClass:[EVEResearch class] completionBlock:completionBlock];
}

- (void) skillInTrainingWithCompletionBlock:(void(^)(EVESkillInTraining* result, NSError* error)) completionBlock {
	return [self GET:@"SkillInTraining" path:@"Char" parameters:nil responseClass:[EVESkillInTraining class] completionBlock:completionBlock];
}

- (void) skillQueueWithCompletionBlock:(void(^)(EVESkillQueue* result, NSError* error)) completionBlock {
	return [self GET:@"SkillQueue" path:@"Char" parameters:nil responseClass:[EVESkillQueue class] completionBlock:completionBlock];
}

- (void) upcomingCalendarEventsWithCompletionBlock:(void(^)(EVEUpcomingCalendarEvents* result, NSError* error)) completionBlock {
	return [self GET:@"UpcomingCalendarEvents" path:@"Char" parameters:nil responseClass:[EVEUpcomingCalendarEvents class] completionBlock:completionBlock];
}

#pragma mark - Corporation

- (void) containerLogWithCompletionBlock:(void(^)(EVEContainerLog* result, NSError* error)) completionBlock {
	return [self GET:@"ContainerLog" path:@"Corp" parameters:nil responseClass:[EVEContainerLog class] completionBlock:completionBlock];
}

- (void) corporationSheetWithCorporationID:(int32_t) corporationID completionBlock:(void(^)(EVECorporationSheet* result, NSError* error)) completionBlock {
	return [self GET:@"CorporationSheet" path:@"Corp" parameters:corporationID ? @{@"corporationID":@(corporationID)} : nil responseClass:[EVECorporationSheet class] completionBlock:completionBlock];
}

- (void) corpFacWarStatsWithCompletionBlock:(void(^)(EVECorpFacWarStats* result, NSError* error)) completionBlock {
	return [self GET:@"FacWarStats" path:@"Corp" parameters:nil responseClass:[EVECorpFacWarStats class] completionBlock:completionBlock];
}

- (void) customsOfficesWithCompletionBlock:(void(^)(EVECustomsOffices* result, NSError* error)) completionBlock {
	return [self GET:@"CustomsOffices" path:@"Corp" parameters:nil responseClass:[EVECustomsOffices class] completionBlock:completionBlock];
}

- (void) facilitiesWithCompletionBlock:(void(^)(EVEFacilities* result, NSError* error)) completionBlock {
	return [self GET:@"Facilities" path:@"Corp" parameters:nil responseClass:[EVEFacilities class] completionBlock:completionBlock];
}

- (void) corpMedalsWithCompletionBlock:(void(^)(EVECorpMedals* result, NSError* error)) completionBlock {
	return [self GET:@"Medals" path:@"Corp" parameters:nil responseClass:[EVECorpMedals class] completionBlock:completionBlock];
}

- (void) memberMedalsWithCompletionBlock:(void(^)(EVEMemberMedals* result, NSError* error)) completionBlock {
	return [self GET:@"MemberMedals" path:@"Corp" parameters:nil responseClass:[EVEMemberMedals class] completionBlock:completionBlock];
}

- (void) memberSecurityWithCompletionBlock:(void(^)(EVEMemberSecurity* result, NSError* error)) completionBlock {
	return [self GET:@"MemberSecurity" path:@"Corp" parameters:nil responseClass:[EVEMemberSecurity class] completionBlock:completionBlock];
}

- (void) memberSecurityLogWithCompletionBlock:(void(^)(EVEMemberSecurityLog* result, NSError* error)) completionBlock {
	return [self GET:@"MemberSecurityLog" path:@"Corp" parameters:nil responseClass:[EVEMemberSecurityLog class] completionBlock:completionBlock];
}

- (void) memberTrackingWithExtendedInfo:(BOOL) extended completionBlock:(void(^)(EVEMemberTracking* result, NSError* error)) completionBlock {
	return [self GET:@"MemberTracking" path:@"Corp" parameters:@{@"extended":@(extended)} responseClass:[EVEMemberTracking class] completionBlock:completionBlock];
}

- (void) outpostListWithCompletionBlock:(void(^)(EVEOutpostList* result, NSError* error)) completionBlock {
	return [self GET:@"OutpostList" path:@"Corp" parameters:nil responseClass:[EVEOutpostList class] completionBlock:completionBlock];
}

- (void) outpostServiceDetailWithItemID:(int32_t) itemID completionBlock:(void(^)(EVEOutpostServiceDetail* result, NSError* error)) completionBlock {
	return [self GET:@"OutpostServiceDetail" path:@"Corp" parameters:@{@"itemID":@(itemID)} responseClass:[EVEOutpostServiceDetail class] completionBlock:completionBlock];
}

- (void) shareholdersWithCompletionBlock:(void(^)(EVEShareholders* result, NSError* error)) completionBlock {
	return [self GET:@"Shareholders" path:@"Corp" parameters:nil responseClass:[EVEShareholders class] completionBlock:completionBlock];
}

- (void) corpStandingsWithCompletionBlock:(void(^)(EVECorpStandings* result, NSError* error)) completionBlock {
	return [self GET:@"Standings" path:@"Corp" parameters:nil responseClass:[EVECorpStandings class] completionBlock:completionBlock];
}

- (void) starbaseDetailWithItemID:(int64_t) itemID completionBlock:(void(^)(EVEStarbaseDetail* result, NSError* error)) completionBlock {
	return [self GET:@"StarbaseDetail" path:@"Corp" parameters:@{@"itemID":@(itemID)} responseClass:[EVEStarbaseDetail class] completionBlock:completionBlock];
}

- (void) starbaseListWithCompletionBlock:(void(^)(EVEStarbaseList* result, NSError* error)) completionBlock {
	return [self GET:@"StarbaseList" path:@"Corp" parameters:nil responseClass:[EVEStarbaseList class] completionBlock:completionBlock];
}

- (void) titlesWithCompletionBlock:(void(^)(EVETitles* result, NSError* error)) completionBlock {
	return [self GET:@"Titles" path:@"Corp" parameters:nil responseClass:[EVETitles class] completionBlock:completionBlock];
}

- (void) corpWalletJournalWithAccountKey:(int32_t) accountKey fromID:(int64_t )fromID rowCount:(NSInteger) rowCount completionBlock:(void(^)(EVECorpWalletJournal* result, NSError* error)) completionBlock {
	NSMutableDictionary* parameters = [NSMutableDictionary new];
	if (fromID > 0)
		parameters[@"fromID"] = @(fromID);
	if (rowCount > 0)
		parameters[@"rowCount"] = @(rowCount);
	if (accountKey)
		parameters[@"accountKey"] = @(accountKey);
	return [self GET:@"WalletJournal" path:@"Corp" parameters:parameters responseClass:[EVECorpWalletJournal class] completionBlock:completionBlock];
}

- (void) corpWalletTransactionsWithAccountKey:(int32_t) accountKey fromID:(int64_t )fromID rowCount:(NSInteger) rowCount completionBlock:(void(^)(EVECorpWalletTransactions* result, NSError* error)) completionBlock {
	NSMutableDictionary* parameters = [NSMutableDictionary new];
	if (fromID > 0)
		parameters[@"fromID"] = @(fromID);
	if (rowCount > 0)
		parameters[@"rowCount"] = @(rowCount);
	if (accountKey)
		parameters[@"accountKey"] = @(accountKey);
	return [self GET:@"WalletTransactions" path:@"Corp" parameters:parameters responseClass:[EVECorpWalletTransactions class] completionBlock:completionBlock];
}

#pragma mark - EVE

- (void) allianceListWithCompletionBlock:(void(^)(EVEAllianceList* result, NSError* error)) completionBlock {
	return [self GET:@"AllianceList" path:@"Eve" parameters:nil responseClass:[EVEAllianceList class] completionBlock:completionBlock];
}

- (void) characterAffiliationWithIDs:(NSArray*) ids completionBlock:(void(^)(EVECharacterAffiliation* result, NSError* error)) completionBlock {
	return [self GET:@"CharacterAffiliation" path:@"Eve" parameters:@{@"ids": [ids componentsJoinedByString:@","]} responseClass:[EVECharacterAffiliation class] completionBlock:completionBlock];
}

- (void) characterIDWithNames:(NSArray*) names completionBlock:(void(^)(EVECharacterID* result, NSError* error)) completionBlock {
	return [self GET:@"CharacterID" path:@"Eve" parameters:@{@"names": [names componentsJoinedByString:@","]} responseClass:[EVECharacterID class] completionBlock:completionBlock];
}

- (void) characterInfoWithCharacterID:(int32_t) characterID completionBlock:(void(^)(EVECharacterInfo* result, NSError* error)) completionBlock {
	if (self.apiKey.characterID != characterID || self.apiKey.corporate)
		return [self GET:@"CharacterInfo" path:@"Eve" parameters:@{@"characterID": @(characterID), @"keyID":@"", @"vCode":@""} responseClass:[EVECharacterInfo class] completionBlock:completionBlock];
	else
		return [self GET:@"CharacterInfo" path:@"Eve" parameters:@{@"characterID": @(characterID)} responseClass:[EVECharacterInfo class] completionBlock:completionBlock];
}

- (void) characterNameWithIDs:(NSArray*) ids completionBlock:(void(^)(EVECharacterName* result, NSError* error)) completionBlock {
	return [self GET:@"CharacterName" path:@"Eve" parameters:@{@"ids": [ids componentsJoinedByString:@","]} responseClass:[EVECharacterName class] completionBlock:completionBlock];
}

- (void) conquerableStationListWithCompletionBlock:(void(^)(EVEConquerableStationList* result, NSError* error)) completionBlock {
	return [self GET:@"ConquerableStationList" path:@"Eve" parameters:nil responseClass:[EVEConquerableStationList class] completionBlock:completionBlock];
}

- (void) errorListWithCompletionBlock:(void(^)(EVEErrorList* result, NSError* error)) completionBlock {
	return [self GET:@"ErrorList" path:@"Eve" parameters:nil responseClass:[EVEErrorList class] completionBlock:completionBlock];
}

- (void) facWarStatsWithCompletionBlock:(void(^)(EVEFacWarStats* result, NSError* error)) completionBlock {
	return [self GET:@"FacWarStats" path:@"Eve" parameters:nil responseClass:[EVEFacWarStats class] completionBlock:completionBlock];
}

- (void) facWarTopStatsWithCompletionBlock:(void(^)(EVEFacWarTopStats* result, NSError* error)) completionBlock {
	return [self GET:@"FacWarTopStats" path:@"Eve" parameters:nil responseClass:[EVEFacWarTopStats class] completionBlock:completionBlock];
}

- (void) ownerIDWithNames:(NSArray*) names completionBlock:(void(^)(EVEOwnerID* result, NSError* error)) completionBlock {
	return [self GET:@"OwnerID" path:@"Eve" parameters:@{@"names": [names componentsJoinedByString:@","]} responseClass:[EVEOwnerID class] completionBlock:completionBlock];
}

- (void) refTypesWithCompletionBlock:(void(^)(EVERefTypes* result, NSError* error)) completionBlock {
	return [self GET:@"RefTypes" path:@"Eve" parameters:nil responseClass:[EVERefTypes class] completionBlock:completionBlock];
}

- (void) skillTreeWithCompletionBlock:(void(^)(EVESkillTree* result, NSError* error)) completionBlock {
	return [self GET:@"SkillTree" path:@"Eve" parameters:nil responseClass:[EVESkillTree class] completionBlock:completionBlock];
}

- (void) typeNameWithIDs:(NSArray*) ids completionBlock:(void(^)(EVETypeName* result, NSError* error)) completionBlock {
	return [self GET:@"TypeName" path:@"Eve" parameters:@{@"ids": [ids componentsJoinedByString:@","]} responseClass:[EVETypeName class] completionBlock:completionBlock];
}

#pragma mark - Map

- (void) facWarSystemsWithCompletionBlock:(void(^)(EVEFacWarSystems* result, NSError* error)) completionBlock {
	return [self GET:@"FacWarSystems" path:@"Map" parameters:nil responseClass:[EVEFacWarSystems class] completionBlock:completionBlock];
}

- (void) jumpsWithCompletionBlock:(void(^)(EVEJumps* result, NSError* error)) completionBlock {
	return [self GET:@"Jumps" path:@"Map" parameters:nil responseClass:[EVEJumps class] completionBlock:completionBlock];
}

- (void) killsWithCompletionBlock:(void(^)(EVEKills* result, NSError* error)) completionBlock {
	return [self GET:@"Kills" path:@"Map" parameters:nil responseClass:[EVEKills class] completionBlock:completionBlock];
}

- (void) sovereigntyWithCompletionBlock:(void(^)(EVESovereignty* result, NSError* error)) completionBlock {
	return [self GET:@"Sovereignty" path:@"Map" parameters:nil responseClass:[EVESovereignty class] completionBlock:completionBlock];
}

#pragma mark - Server

- (void) serverStatusWithCompletionBlock:(void(^)(EVEServerStatus* result, NSError* error)) completionBlock {
	return [self GET:@"ServerStatus" path:@"Server" parameters:nil responseClass:[EVEServerStatus class] completionBlock:completionBlock];
}

#pragma mark - API

- (void) callListWithCompletionBlock:(void(^)(EVECallList* result, NSError* error)) completionBlock {
	return [self GET:@"CallList" path:@"API" parameters:nil responseClass:[EVECallList class] completionBlock:completionBlock];
}


#pragma mark - Private

- (void) GET:(NSString*) method path:(NSString*) path parameters:(NSDictionary*) parameters responseClass:(Class) responseClass completionBlock:(void(^)(id result, NSError* error)) completionBlock {
	NSString* urlString = [[path stringByAppendingPathComponent:method] stringByAppendingPathExtension:@"xml.aspx"];
	
	NSMutableDictionary* param = [self.apiKey ? @{@"keyID":@(self.apiKey.keyID), @"vCode":self.apiKey.vCode, @"characterID":@(self.apiKey.characterID)} : @{} mutableCopy];
	if (parameters)
		[param setValuesForKeysWithDictionary:parameters];
	
	AFHTTPRequestSerializer* serializer = [AFHTTPRequestSerializer serializer];
	serializer.cachePolicy = self.cachePolicy;
	
	static NSMutableDictionary* dispatchGroups = nil;
	static NSMutableDictionary* progress = nil;
	if (!dispatchGroups) {
		static dispatch_once_t onceToken;
		dispatch_once(&onceToken, ^{
			dispatchGroups = [NSMutableDictionary new];
		});
	}
	if (!progress) {
		static dispatch_once_t onceToken;
		dispatch_once(&onceToken, ^{
			progress = [NSMutableDictionary new];
		});
	}
	

	id requestKey = @([@{@"url":urlString, @"parameters":param ?: @""} fullHash]);

	NSMutableArray* progressArray;
	@synchronized (progress) {
		progressArray = progress[requestKey];
		if (!progressArray)
			progress[requestKey] = progressArray = [NSMutableArray new];
		[progressArray addObject:[NSProgress progressWithTotalUnitCount:100]];
	}

	BOOL load = NO;
	dispatch_group_t dispatchGroup;
	@synchronized(dispatchGroups) {
		dispatchGroup = dispatchGroups[requestKey];
		if (!dispatchGroup) {
			dispatchGroups[requestKey] = dispatchGroup = dispatch_group_create();
			dispatch_set_finalizer_f(dispatchGroup, (dispatch_function_t) &CFRelease);
			dispatch_group_enter(dispatchGroup);
			load = YES;
		}
	}
	
	if (completionBlock) {
		dispatch_group_notify(dispatchGroup, dispatch_get_main_queue(), ^{
			NSDictionary* context = (__bridge NSDictionary*) dispatch_get_context(dispatchGroup);
			completionBlock(context[@"result"], context[@"error"]);
		});
	}
	
	if (load) {
		EVEAPISerializer* serializer = [EVEAPISerializer serializerWithRootClass:responseClass];
		self.httpRequestOperationManager.responseSerializer = serializer;
		[self.httpRequestOperationManager GET:urlString parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
			for (NSProgress* progress in progressArray)
				progress.completedUnitCount = downloadProgress.fractionCompleted * 100;
			
		} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
			for (NSProgress* progress in progressArray)
				progress.completedUnitCount = 100;
			
			if (responseObject)
				dispatch_set_context(dispatchGroup, (__bridge_retained void*)@{@"result":responseObject});

			NSHTTPURLResponse* response = (NSHTTPURLResponse*) task.response;

			NSMutableDictionary* headers = [[response allHeaderFields] mutableCopy];
			NSString* md5 = [task.currentRequest.URL md5];
			NSString* etag = headers[@"Etag"];
			EVEResult* eveResult = responseObject;
			
			NSData* responseData = serializer.data;
			serializer.data = nil;

			if (!etag || ![md5 isEqualToString:etag]) {
				
				if (!eveResult.eveapi.cacheDate)
					eveResult.eveapi.cacheDate = [NSDate date];
				
				NSString* date = [[NSDateFormatter rfc822DateFormatter] stringFromDate:eveResult.eveapi.currentTime];
				NSString* expired = [[NSDateFormatter rfc822DateFormatter] stringFromDate:eveResult.eveapi.cachedUntil];
				if (date && expired) {
					headers[@"Date"] = date;
					headers[@"Expires"] = expired;
					headers[@"Etag"] = md5;
					[headers removeObjectForKey:@"Vary"];
					NSHTTPURLResponse* response = [[NSHTTPURLResponse alloc] initWithURL:task.response.URL statusCode:response.statusCode HTTPVersion:@"HTTP/1.1" headerFields:headers];
					NSCachedURLResponse* cachedResponse = [[NSCachedURLResponse alloc] initWithResponse:response data:responseData userInfo:@{@"cacheDate":eveResult.eveapi.cacheDate} storagePolicy:NSURLCacheStorageAllowed];
					[[NSURLCache sharedURLCache] storeCachedResponse:cachedResponse forRequest:task.currentRequest];
				}
			}
			else {
				NSCachedURLResponse* cachedResponse = [[NSURLCache sharedURLCache] cachedResponseForRequest:task.currentRequest];
				eveResult.eveapi.cacheDate = cachedResponse.userInfo[@"cacheDate"];
			}
			
			dispatch_group_leave(dispatchGroup);
			@synchronized(dispatchGroups) {
				[dispatchGroups removeObjectForKey:requestKey];
			}
			@synchronized(progress) {
				[progress removeObjectForKey:requestKey];
			}
		} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
			if (error)
				dispatch_set_context(dispatchGroup, (__bridge_retained void*)@{@"error":error});
			dispatch_group_leave(dispatchGroup);
			@synchronized(dispatchGroups) {
				[dispatchGroups removeObjectForKey:requestKey];
			}
			@synchronized(progress) {
				[progress removeObjectForKey:requestKey];
			}
		}];
		
		
//		operation.responseSerializer = [EVEAPISerializer serializerWithRootClass:responseClass];
//		[operation setCacheResponseBlock:^NSCachedURLResponse* (NSURLConnection* connection, NSCachedURLResponse* response) {
//			return nil;
//		}];
////		if (self.startImmediately)
//			[self.httpRequestOperationManager.operationQueue addOperation:operation];
	}
	else {
//		@synchronized(operations) {
//			return operations[request];
//		}
	}
}

@end
