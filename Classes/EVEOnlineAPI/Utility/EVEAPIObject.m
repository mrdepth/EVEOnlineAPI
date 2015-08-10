//
//  EVEAPIObject.m
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 07.08.15.
//
//

#import "EVEAPIObject.h"

@implementation EVEAPIObject

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"currentTime":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"cachedUntil":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"cacheDate":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"version":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"error":@{@"type":@(EVEXMLSchemePropertyTypeError)}};
	return scheme;
}

- (NSDate*) currentServerTime {
	if (!self.cacheDate || !self.currentTime)
		return nil;
	return [NSDate dateWithTimeIntervalSinceNow:-[self.cacheDate timeIntervalSinceDate:self.currentTime]];
}

- (NSDate*) serverTimeWithLocalTime:(NSDate*) localTime {
	if (!localTime || !self.cacheDate || !self.currentTime)
		return nil;
	return [NSDate dateWithTimeInterval:[self.currentTime timeIntervalSinceDate:self.cacheDate] sinceDate:localTime];
}

- (NSDate*) localTimeWithServerTime:(NSDate*) serverTime {
	if (!serverTime || !self.cacheDate || !self.currentTime)
		return nil;
	return [NSDate dateWithTimeInterval:[self.cacheDate timeIntervalSinceDate:self.currentTime] sinceDate:serverTime];
}

@end