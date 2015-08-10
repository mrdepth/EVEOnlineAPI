//
//  EVEzKillBoardSearch.m
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 25.02.14.
//
//

#import "EVEzKillBoardSearch.h"
#import "EVEzKillBoardAPI.h"

@interface EVEzKillBoardSearch()
- (void) didParseObject:(NSArray*) object;
@end

@implementation EVEzKillBoardSearch

+ (id) searchWithFilter:(NSDictionary*) filter error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEzKillBoardSearch alloc] initWithFilter:filter error:errorPtr progressHandler:progressHandler];
}

- (id) initWithFilter:(NSDictionary*) filter error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	NSMutableString* args = [NSMutableString new];
	[filter enumerateKeysAndObjectsUsingBlock:^(NSString* key, id obj, BOOL *stop) {
		NSString* value = [obj description];
		if (value.length > 0)
			[args appendFormat:@"%@/%@/", key, value];
		else
			[args appendFormat:@"%@/", key];
	}];
	NSURL* url = [NSURL URLWithString:[EVEzKillBoardAPIHost stringByAppendingString:args]];
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
		error = [NSError errorWithDomain:EVEzKillBoardAPIErrorDomain code:EVEzKillBoardAPIErrorCodeParsingError userInfo:@{NSLocalizedDescriptionKey: EVEzKillBoardAPIErrorCodeParsingErrorText}];
	return error;
}

#pragma mark - Private

- (void) didParseObject:(NSArray*) object {
	NSMutableArray* kills = [NSMutableArray new];
	for (NSDictionary* dictionary in object) {
		if ([dictionary isKindOfClass:[NSDictionary class]]) {
			EVEKillMailsKill* kill = [[EVEKillMailsKill alloc] initWithDictionary:dictionary];
			if (!kill.killID)
				continue;
			kill.victim = [[EVEKillMailsVictim alloc] initWithDictionary:dictionary[@"victim"]];
			NSMutableArray* items = [NSMutableArray new];
			for (NSDictionary* dictionaryItem in dictionary[@"items"])
				[items addObject:[[EVEKillMailsItem alloc] initWithDictionary:dictionaryItem]];
			NSMutableArray* attackers = [NSMutableArray new];
			for (NSDictionary* dictionaryAttacker in dictionary[@"attackers"])
				[attackers addObject:[[EVEKillMailsAttacker alloc] initWithDictionary:dictionaryAttacker]];
			kill.items = items;
			kill.attackers = attackers;
			[kills addObject:kill];
		}
	}
	self.kills = kills;
}

@end
