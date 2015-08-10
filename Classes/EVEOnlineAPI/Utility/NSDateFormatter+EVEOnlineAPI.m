//
//  NSDateFormatter+EVEOnlineAPI.m
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 07.08.15.
//
//

#import "NSDateFormatter+EVEOnlineAPI.h"

@implementation NSDateFormatter (EVEOnlineAPI)
+ (NSDateFormatter*) eveDateFormatter {
	static NSDateFormatter* dateFormatter;
	if (!dateFormatter) {
		static dispatch_once_t onceToken;
		dispatch_once(&onceToken, ^{
			dateFormatter = [NSDateFormatter new];
			[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
			[dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
			[dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
		});
	}
	return dateFormatter;
}

+ (NSDateFormatter*) rfc822DateFormatter {
	static NSDateFormatter* dateFormatter;
	if (!dateFormatter) {
		static dispatch_once_t onceToken;
		dispatch_once(&onceToken, ^{
			dateFormatter = [NSDateFormatter new];
			[dateFormatter setDateFormat:@"EEE, d MMM yyyy HH:mm:ss zzz"];
			[dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
			[dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
		});
	}
	return dateFormatter;
}


@end
