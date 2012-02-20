//
//  EVEMetricsRequest.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEMetricsRequest.h"
#import "EVERequestsCache.h"
#import "JSON.h"

NSDateFormatter *eveMetricsDateFormatterSingleton;

@implementation NSDateFormatter(EVEMetricsRequest)

+ (NSDateFormatter*) eveMetricsDateFormatter {
	if (!eveMetricsDateFormatterSingleton) {
		eveMetricsDateFormatterSingleton = [[NSDateFormatter alloc] init];
		[eveMetricsDateFormatterSingleton setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZ"];
	}
	return eveMetricsDateFormatterSingleton;
}

@end

@implementation EVEMetricsRequest(Protected)

- (NSError*) parseData: (NSData*) aData {
	NSString *s = [[NSString alloc] initWithData:aData encoding:NSUTF8StringEncoding];
//	NSLog(@"%@", s);
	
	SBJSON *parser = [[SBJSON alloc] init];
	id object = [parser objectWithString:s];
	if (object) {
		[self didParseObject:object];
		error = nil;
	}
	else
		error = [NSError errorWithDomain:EVEMetricsErrorDomain code:EVEMetricsErrorCodeParsingError userInfo:[NSDictionary dictionaryWithObject:EVEMetricsErrorCodeParsingErrorText forKey:NSLocalizedDescriptionKey]];
	[parser release];
	[s release];
	return error;
}

- (void) didParseObject: (id) object {
}

@end

@implementation EVEMetricsRequest


@end
