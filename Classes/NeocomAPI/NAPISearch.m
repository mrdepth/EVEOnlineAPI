//
//  NAPISearch.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 18.06.13.
//
//

#import "NAPISearch.h"
#import "NeocomAPI.h"

@implementation NAPISearchItem

@end

@implementation NAPISearch

+ (id) searchWithCriteria:(NSDictionary*) criteria order:(NSString*) order error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	return [[NAPISearch alloc] initWithCriteria:criteria order:order error:errorPtr progressHandler:progressHandler];
}

- (id) initWithCriteria:(NSDictionary*) criteria order:(NSString*) order error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	NSMutableArray* arguments = [[NSMutableArray alloc] init];
	for (NSString* key in [criteria allKeys])
		[arguments addObject:[NSString stringWithFormat:@"%@=%@", key, [criteria valueForKey:key]]];
	
	if (order)
		[arguments addObject:[NSString stringWithFormat:@"order=%@", order]];
	
	NSString* argumentsString = [arguments componentsJoinedByString:@"&"];
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/search?%@", NeocomAPIHost, argumentsString]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr
				  progressHandler:progressHandler]) {
		
	}
	return self;
}

- (NSError*) parseData:(NSData *)data {
	NSError* error = nil;
	NSArray* records = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
	if ([records isKindOfClass:[NSArray class]]) {
		NSMutableArray* loadouts = [NSMutableArray array];
		for (NSDictionary* record in records) {
			NAPISearchItem* loadout = [[NAPISearchItem alloc] init];
			loadout.canonicalName = record[@"loadout"];
			loadout.typeID = [record[@"typeID"] integerValue];
			loadout.typeName = record[@"typeName"];
			loadout.groupID = [record[@"groupID"] integerValue];
			loadout.groupName = record[@"groupName"];
			loadout.flags = [record[@"flags"] integerValue];
			loadout.ehp = [record[@"ehp"] floatValue];
			loadout.tank = [record[@"tank"] floatValue];
			loadout.speed = [record[@"speed"] floatValue];
			loadout.totalDps = [record[@"totalDps"] floatValue];
			loadout.turretDps = [record[@"turretDps"] floatValue];
			loadout.droneDps = [record[@"droneDps"] floatValue];
			loadout.maxRange = [record[@"maxRange"] floatValue];
			loadout.falloff = [record[@"falloff"] floatValue];
			[loadouts addObject:loadout];
		}
		
		self.loadouts = loadouts;
		return nil;
	}
	else
		return error;
}

@end
