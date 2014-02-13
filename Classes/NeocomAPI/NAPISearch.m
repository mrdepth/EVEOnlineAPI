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

- (id) initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.typeID = [aDecoder decodeIntegerForKey:@"typeID"];
		self.groupID = [aDecoder decodeIntegerForKey:@"groupID"];
		self.flags = [aDecoder decodeIntegerForKey:@"flags"];
		
		self.canonicalName = [aDecoder decodeObjectForKey:@"canonicalName"];
		self.typeName = [aDecoder decodeObjectForKey:@"typeName"];
		self.groupName = [aDecoder decodeObjectForKey:@"groupName"];
		
		self.ehp = [aDecoder decodeFloatForKey:@"ehp"];
		self.tank = [aDecoder decodeFloatForKey:@"tank"];
		self.speed = [aDecoder decodeFloatForKey:@"speed"];
		self.totalDps = [aDecoder decodeFloatForKey:@"totalDps"];
		self.turretDps = [aDecoder decodeFloatForKey:@"turretDps"];
		self.droneDps = [aDecoder decodeFloatForKey:@"droneDps"];
		self.maxRange = [aDecoder decodeFloatForKey:@"maxRange"];
		self.falloff = [aDecoder decodeFloatForKey:@"falloff"];
	}
	return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.typeID forKey:@"typeID"];
	[aCoder encodeInteger:self.groupID forKey:@"groupID"];
	[aCoder encodeInteger:self.flags forKey:@"flags"];
	
	if (self.canonicalName)
		[aCoder encodeObject:self.canonicalName forKey:@"canonicalName"];
	if (self.typeName)
		[aCoder encodeObject:self.typeName forKey:@"typeName"];
	if (self.groupName)
		[aCoder encodeObject:self.groupName forKey:@"groupName"];
	
	[aCoder encodeFloat:self.ehp forKey:@"ehp"];
	[aCoder encodeFloat:self.tank forKey:@"tank"];
	[aCoder encodeFloat:self.speed forKey:@"speed"];
	[aCoder encodeFloat:self.totalDps forKey:@"totalDps"];
	[aCoder encodeFloat:self.turretDps forKey:@"turretDps"];
	[aCoder encodeFloat:self.droneDps forKey:@"droneDps"];
	[aCoder encodeFloat:self.maxRange forKey:@"maxRange"];
	[aCoder encodeFloat:self.falloff forKey:@"falloff"];
}

@end

@implementation NAPISearch

+ (id) searchWithCriteria:(NSDictionary*) criteria order:(NSString*) order cachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[NAPISearch alloc] initWithCriteria:criteria order:order cachePolicy:cachePolicy error:errorPtr progressHandler:progressHandler];
}

- (id) initWithCriteria:(NSDictionary*) criteria order:(NSString*) order cachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	NSMutableArray* arguments = [[NSMutableArray alloc] init];
	for (NSString* key in [criteria allKeys])
		[arguments addObject:[NSString stringWithFormat:@"%@=%@", key, [criteria valueForKey:key]]];
	
	if (order)
		[arguments addObject:[NSString stringWithFormat:@"order=%@", order]];
	
	NSString* argumentsString = [arguments componentsJoinedByString:@"&"];
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/search?%@", NeocomAPIHost, argumentsString]]
					   cachePolicy:cachePolicy
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
