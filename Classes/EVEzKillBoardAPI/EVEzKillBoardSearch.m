//
//  EVEzKillBoardSearch.m
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 25.02.14.
//
//

#import "EVEzKillBoardSearch.h"
#import "EVEzKillBoardAPI.h"
#import <EVEAPI/EVEOnlineAPI.h>

@implementation EVEzKillBoardSearch

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"loadouts":@{@"type":@(EVEXMLSchemePropertyTypeArray), @"class":[EVEKillMailsKill class]}};
	return scheme;
}

- (id) initWithArray:(NSArray*) array {
	if (self = [super init]) {
		NSMutableArray* result = [NSMutableArray new];
		for (NSDictionary* dic in array) {
			id obj = [[EVEKillMailsKill alloc] initWithDictionary:dic];
			if (obj)
				[result addObject:obj];
		}
		self.kills = result;
	}
	return self;
}

@end
