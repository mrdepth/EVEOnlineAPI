//
//  EVEDBInvControlTowerResource.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 3/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEDBInvControlTowerResource.h"
#import "EVEDBDatabase.h"
#import "EVEDBInvControlTowerResourcePurpose.h"
#import "EVEDBInvType.h"

@interface EVEDBInvControlTowerResource(Private)
- (void) setValuesWithDictionary:(NSDictionary *)dictionary;
@end

@implementation EVEDBInvControlTowerResource(Private)

- (void) setValuesWithDictionary:(NSDictionary *)dictionary {
	self.controlTowerTypeID = [[dictionary valueForKey:@"controlTowerTypeID"] integerValue];
	self.resourceTypeID = [[dictionary valueForKey:@"resourceTypeID"] integerValue];
	self.purposeID = [[dictionary valueForKey:@"purpose"] integerValue];
	self.quantity = [[dictionary valueForKey:@"quantity"] integerValue];
	self.minSecurityLevel = [[dictionary valueForKey:@"minSecurityLevel"] doubleValue];
	self.factionID = [[dictionary valueForKey:@"factionID"] integerValue];
}

@end

@implementation EVEDBInvControlTowerResource
@synthesize controlTowerTypeID;
@synthesize resourceTypeID;
@synthesize resourceType;
@synthesize purposeID;
@synthesize purpose;
@synthesize quantity;
@synthesize minSecurityLevel;
@synthesize factionID;

+ (id) invControlTowerResourceWithDictionary: (NSDictionary*) dictionary {
	return [[[EVEDBInvControlTowerResource alloc] initWithDictionary:dictionary] autorelease];
}

- (id) initWithDictionary: (NSDictionary*) dictionary {
	if (self = [super init]) {
		[self setValuesWithDictionary:dictionary];
	}
	return self;
}

- (void) dealloc {
	[resourceType release];
	[purpose release];
	[super dealloc];
}

- (EVEDBInvType*) resourceType {
	if (resourceTypeID == 0)
		return NULL;
	if (!resourceType) {
		resourceType = [[EVEDBInvType invTypeWithTypeID:resourceTypeID error:nil] retain];
		if (!resourceType)
			resourceType = (EVEDBInvType*) [[NSNull null] retain];
	}
	if ((NSNull*) resourceType == [NSNull null])
		return NULL;
	else
		return resourceType;
}

- (EVEDBInvControlTowerResourcePurpose*) purpose {
	if (purposeID == 0)
		return NULL;
	if (!purpose) {
		purpose = [[EVEDBInvControlTowerResourcePurpose invControlTowerResourcePurposeWithPurposeID:purposeID error:nil] retain];
		if (!purpose)
			purpose = (EVEDBInvControlTowerResourcePurpose*) [[NSNull null] retain];
	}
	if ((NSNull*) purpose == [NSNull null])
		return NULL;
	else
		return purpose;
}

@end