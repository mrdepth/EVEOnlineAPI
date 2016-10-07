//
//  EVEResult.m
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 07.08.15.
//
//

#import "EVEResult.h"

@implementation EVEResult

- (id) initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.eveapi = [aDecoder decodeObjectForKey:@"eveapi"];
	}
	return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.eveapi forKey:@"eveapi"];
}

#pragma mark - EVEHTTPCachedContent

- (NSDate*) currentTime {
	return self.eveapi.currentTime;
}

- (NSDate*) cachedUntil {
	return self.eveapi.cachedUntil;
}

- (NSDate*) cacheDate {
	return self.eveapi.cacheDate;
}

- (void) setCacheDate:(NSDate *)cacheDate {
	self.eveapi.cacheDate = cacheDate;
}


@end
