//
//  NAPIUpload.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 18.06.13.
//
//

#import "NAPIUpload.h"
#import "NeocomAPI.h"

@implementation NAPIUpload

+ (id) uploadFitsWithCannonicalNames:(NSArray*) cannonicalNames userID:(NSString*) userID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[NAPIUpload alloc] initWithCannonicalNames:cannonicalNames userID:userID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithCannonicalNames:(NSArray*) cannonicalNames userID:(NSString*) userID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	NSDictionary* jsonObject = @{@"userID" : userID, @"loadouts" : [cannonicalNames sortedArrayUsingSelector:@selector(compare:)]};
	NSData* data = [NSJSONSerialization dataWithJSONObject:jsonObject options:0 error:errorPtr];

	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/upload", NeocomAPIHost]]
						 bodyData:data
					  contentType:@"application/json"
					   cacheStyle:EVERequestCacheStyleLong
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

- (NSError*) parseData:(NSData *)data {
	NSError* error = nil;
	NSDictionary* result = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
	if ([result isKindOfClass:[NSDictionary class]]) {
		self.success = YES;
		self.cacheExpireDate = [NSDate dateWithTimeIntervalSinceNow:60 * 60 * 24 * 30];
		return nil;
	}
	else {
		self.success = NO;
		self.cacheExpireDate = [NSDate dateWithTimeIntervalSinceNow:60 * 60 * 24];
		return error;
	}
}

@end
