//
//  NAPILookup.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 19.06.13.
//
//

#import "NAPILookup.h"
#import "NeocomAPI.h"

@implementation NAPILookup

+ (id) lookupWithCriteria:(NSDictionary*) criteria error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[NAPILookup alloc] initWithCriteria:criteria error:errorPtr progressHandler:progressHandler];
}

- (id) initWithCriteria:(NSDictionary*) criteria error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	NSMutableArray* arguments = [[NSMutableArray alloc] init];
	for (NSString* key in [criteria allKeys])
		[arguments addObject:[NSString stringWithFormat:@"%@=%@", key, [criteria valueForKey:key]]];
	
	NSString* argumentsString = [arguments componentsJoinedByString:@"&"];
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/lookup?%@", NeocomAPIHost, argumentsString]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr
				  progressHandler:progressHandler]) {
		
	}
	return self;
}

- (NSError*) parseData:(NSData *)data {
	NSError* error = nil;
	NSDictionary* result = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
	if ([result isKindOfClass:[NSDictionary class]]) {
		self.count = [result[@"count"] integerValue];
		return nil;
	}
	else
		return error;
}

@end
