//
//  EVEDBCrtRecommendation.m
//  EVEOnlineAPI
//
//  Created by Mr. Depth on 1/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EVEDBCrtRecommendation.h"
#import "EVEDBDatabase.h"
#import "EVEDBCrtCertificate.h"
#import "EVEDBInvType.h"

@interface EVEDBCrtRecommendation(Private)
- (void) setValuesWithDictionary:(NSDictionary *)dictionary;
- (void) didReceiveRecord: (NSDictionary*) record;
@end

@implementation EVEDBCrtRecommendation(Private)

- (void) setValuesWithDictionary:(NSDictionary *)dictionary {
	self.recommendationID = [[dictionary valueForKey:@"recommendationID"] integerValue];
	self.shipTypeID = [[dictionary valueForKey:@"shipTypeID"] integerValue];
	self.certificateID = [[dictionary valueForKey:@"certificateID"] integerValue];
	self.recommendationLevel = [[dictionary valueForKey:@"recommendationLevel"] integerValue];
}

- (void) didReceiveRecord: (NSDictionary*) record {
	[self setValuesWithDictionary:record];
}

@end

@implementation EVEDBCrtRecommendation
@synthesize recommendationID;
@synthesize shipTypeID;
@synthesize shipType;
@synthesize certificateID;
@synthesize certificate;
@synthesize recommendationLevel;

+ (id) crtRecommendationWithRecommendationID: (NSInteger)aRecommendationID error:(NSError **)errorPtr {
	return [[[EVEDBCrtRecommendation alloc] initWithRecommendationID:aRecommendationID error:errorPtr] autorelease];
}

+ (id) crtRecommendationWithDictionary: (NSDictionary*) dictionary {
	return [[[EVEDBCrtRecommendation alloc] initWithDictionary:dictionary] autorelease];
}

- (id) initWithRecommendationID: (NSInteger)aRecommendationID error:(NSError **)errorPtr {
	if (self = [super init]) {
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (!database) {
			[self release];
			return nil;
		}
		NSError *error = [database execWithSQLRequest:[NSString stringWithFormat:@"SELECT * from crtRecommendations WHERE recommendationID=%d;", aRecommendationID]
											   target:self
											   action:@selector(didReceiveRecord:)];
		if (error) {
			if (errorPtr)
				*errorPtr = error;
			[self release];
			return nil;
		}
	}
	return self;
}

- (id) initWithDictionary: (NSDictionary*) dictionary {
	if (self = [super init]) {
		[self setValuesWithDictionary:dictionary];
	}
	return self;
}

- (void) dealloc {
	[shipType release];
	[certificate release];
	[super dealloc];
}

- (EVEDBInvType*) shipType {
	if (shipTypeID == 0)
		return NULL;
	if (!shipType) {
		shipType = [[EVEDBInvType invTypeWithTypeID:shipTypeID error:nil] retain];
		if (!shipType)
			shipType = (EVEDBInvType*) [[NSNull null] retain];
	}
	if ((NSNull*) shipType == [NSNull null])
		return NULL;
	else
		return shipType;
}

- (EVEDBCrtCertificate*) certificate {
	if (certificateID == 0)
		return NULL;
	if (!certificate) {
		certificate = [[EVEDBCrtCertificate crtCertificateWithCertificateID:certificateID error:nil] retain];
		if (!certificate)
			certificate = (EVEDBCrtCertificate*) [[NSNull null] retain];
	}
	if ((NSNull*) certificate == [NSNull null])
		return NULL;
	else
		return certificate;
}

@end