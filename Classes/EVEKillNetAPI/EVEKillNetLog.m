//
//  EVEKillNetLog.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 25.10.12.
//
//

#import "EVEKillNetLog.h"
#import "EVERequest.h"
#import "EVEKillNetAPI.h"

@interface NSDictionary(NotNull)

- (id) notNullValueForKey:(NSString*) key;
- (id) notNullValueForKeyPath:(NSString*) keyPath;

@end

@implementation NSDictionary(SafeKeyValue)

- (id) notNullValueForKey:(NSString*) key {
	id value = [self valueForKey:key];
	if (value == [NSNull null])
		return nil;
	else
		return value;
}

- (id) notNullValueForKeyPath:(NSString*) keyPath {
	id value = [self valueForKeyPath:keyPath];
	if (value == [NSNull null])
		return nil;
	else
		return value;
}

@end

@implementation EVEKillNetLogItem

- (id) initWithDictinary:(NSDictionary*) dictionary {
	if (self = [super init]) {
		self.typeName = [dictionary notNullValueForKey:@"typeName"];
		self.typeID = [[dictionary notNullValueForKey:@"typeID"] intValue];
		self.itemSlot = [[dictionary notNullValueForKey:@"itemSlot"] intValue];
		self.qtyDropped = [[dictionary notNullValueForKey:@"qtyDropped"] intValue];
		self.qtyDestroyed = [[dictionary notNullValueForKey:@"qtyDestroyed"] intValue];
	}
	return self;
}

@end

@implementation EVEKillNetLogInvolved

- (id) initWithDictinary:(NSDictionary*) dictionary {
	if (self = [super init]) {
		self.characterID = [[dictionary notNullValueForKey:@"characterID"] intValue];
		self.characterName = [dictionary notNullValueForKey:@"characterName"];
		self.corporationID = [[dictionary notNullValueForKey:@"corporationID"] intValue];
		self.corporationName = [dictionary notNullValueForKey:@"corporationName"];
		self.allianceID = [[dictionary notNullValueForKey:@"allianceID"] intValue];
		self.allianceName = [dictionary notNullValueForKey:@"allianceName"];
		self.factionID = [[dictionary notNullValueForKey:@"factionID"] intValue];
		self.factionName = [dictionary notNullValueForKey:@"factionName"];
		self.securityStatus = [[dictionary notNullValueForKey:@"securityStatus"] floatValue];
		self.damageDone = [[dictionary notNullValueForKey:@"damageDone"] floatValue];
		self.finalBlow = [[dictionary notNullValueForKey:@"finalBlow"] boolValue];
		self.weaponTypeID = [[dictionary notNullValueForKey:@"weaponTypeID"] intValue];
		self.shipTypeID = [[dictionary notNullValueForKey:@"shipTypeID"] intValue];
	}
	return self;
}

@end

@implementation EVEKillNetLogEntry


@end

@interface EVEKillNetLog()

- (void) didParseObject:(NSArray*) object;

@end

@implementation EVEKillNetLog

+ (id) logWithFilter:(NSDictionary*) filter mask:(int32_t) mask error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEKillNetLog alloc] initWithFilter:filter mask:mask error:errorPtr progressHandler:progressHandler];
}

- (id) initWithFilter:(NSDictionary*) filter mask:(int32_t) mask error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	NSMutableString* args = [NSMutableString string];
	for (NSString* key in [filter allKeys]) {
		NSString* value = [filter valueForKey:key];
		if ([value isKindOfClass:[NSString class]])
			value = [value stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
		[args appendFormat:@"%@:%@/", key, value];
	}
	[args appendFormat:@"mask:%d", mask];
	NSURL* url = [NSURL URLWithString:[EVEKillNetLogAPIHost stringByAppendingPathComponent:args]];
	
	if (self = [super initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy error:errorPtr progressHandler:progressHandler]) {
		
	}
	return self;
}

- (NSError*) parseData: (NSData*) aData {
	NSError* error = nil;
	id object = [NSJSONSerialization JSONObjectWithData:aData options:0 error:&error];
	if ([object isKindOfClass:[NSArray class]]) {
		error = nil;
		[self didParseObject:object];
	}
	else
		error = [NSError errorWithDomain:EVEKillNetAPIErrorDomain code:EVEKillNetAPIErrorCodeParsingError userInfo:@{NSLocalizedDescriptionKey: EVEKillNetAPIErrorCodeParsingErrorText}];
	return error;
}

#pragma mark - Private

- (void) didParseObject:(NSArray*) object {
	NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	[formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_GB"]];
	self.killLog = [NSMutableArray array];
	
	for (NSDictionary* dic in object) {
		EVEKillNetLogEntry* entry = [[EVEKillNetLogEntry alloc] init];
		entry.url = [NSURL URLWithString:[dic notNullValueForKey:@"url"]];
		entry.timestamp = [formatter dateFromString:[dic notNullValueForKey:@"timestamp"]];
		entry.internalID = [[dic notNullValueForKey:@"internalID"] intValue];
		entry.externalID = [[dic notNullValueForKey:@"externalID"] intValue];
		entry.victimName = [dic notNullValueForKey:@"victimName"];
		entry.victimExternalID = [[dic notNullValueForKey:@"victimExternalID"] intValue];
		entry.victimCorpName = [dic notNullValueForKey:@"victimCorpName"];
		entry.victimAllianceName = [dic notNullValueForKey:@"victimAllianceName"];
		entry.victimShipName = [dic notNullValueForKey:@"victimShipName"];
		entry.victimShipClass = [dic notNullValueForKey:@"victimShipClass"];
		entry.victimShipID = [[dic notNullValueForKey:@"victimShipID"] intValue];
		entry.fbPilotName = [dic notNullValueForKey:@"FBPilotName"];
		entry.fbCorpName = [dic notNullValueForKey:@"FBCorpName"];
		entry.fbAllianceName = [dic notNullValueForKey:@"FBAllianceName"];
		entry.involvedPartyCount = [[dic notNullValueForKey:@"involvedPartyCount"] intValue];
		entry.solarSystemName = [dic notNullValueForKey:@"solarSystemName"];
		entry.solarSystemSecurity = [[dic notNullValueForKey:@"solarSystemSecurity"] floatValue];
		entry.regionName = [dic notNullValueForKey:@"regionName"];
		entry.isk = [[dic notNullValueForKey:@"ISK"] longLongValue];
		entry.eveKillID = [[dic notNullValueForKey:@"eveKillID"] intValue];
		entry.eveKillExternalID = [[dic notNullValueForKey:@"eveKillExternalID"] intValue];
		entry.corpName = [dic notNullValueForKey:@"corpName"];
		entry.allianceName = [dic notNullValueForKey:@"allianceName"];
		entry.factionName = [dic valueForKey:@"factionName"];
		entry.shipDestroyed = [dic notNullValueForKey:@"shipDestroyed"];
		entry.systemName = [dic notNullValueForKey:@"systemName"];
		entry.systemSecurity = [[dic notNullValueForKey:@"systemSecurity"] floatValue];
		entry.damageTaken = [[dic notNullValueForKey:@"damageTaken"] floatValue];
		
		NSMutableArray* involved = [NSMutableArray array];
		for (NSDictionary* inv in [dic notNullValueForKey:@"involved"])
			[involved addObject:[[EVEKillNetLogInvolved alloc] initWithDictinary:inv]];
		entry.involved = involved;

		NSMutableArray* involvedParties = [NSMutableArray array];
		for (NSDictionary* inv in [dic notNullValueForKey:@"involvedParties"])
			[involvedParties addObject:[[EVEKillNetLogInvolved alloc] initWithDictinary:inv]];
		entry.involvedParties = involvedParties;

		NSMutableArray* destroyedItems = [NSMutableArray array];
		for (NSDictionary* item in [dic notNullValueForKeyPath:@"items.destroyed"])
			[destroyedItems addObject:[[EVEKillNetLogItem alloc] initWithDictinary:item]];
		entry.destroyedItems = destroyedItems;

		NSMutableArray* droppedItems = [NSMutableArray array];
		for (NSDictionary* item in [dic notNullValueForKeyPath:@"items.dropped"])
			[droppedItems addObject:[[EVEKillNetLogItem alloc] initWithDictinary:item]];
		entry.droppedItems = droppedItems;
		[(NSMutableArray*) self.killLog addObject:entry];

	}
}

@end