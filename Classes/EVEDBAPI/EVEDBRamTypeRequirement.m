//
//  EVEDBRamTypeRequirement.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 13.08.12.
//
//

#import "EVEDBRamTypeRequirement.h"
#import "EVEDBDatabase.h"
#import "EVEDBRamActivity.h"
#import "EVEDBInvType.h"

@interface EVEDBRamTypeRequirement(Private)
- (void) setValuesWithDictionary:(NSDictionary *)dictionary;
- (void) didReceiveRecord: (NSDictionary*) record;
@end

@implementation EVEDBRamTypeRequirement(Private)

- (void) setValuesWithDictionary:(NSDictionary *)dictionary {
	self.typeID = [[dictionary valueForKey:@"typeID"] integerValue];
	self.activityID = [[dictionary valueForKey:@"activityID"] integerValue];
	self.requiredTypeID = [[dictionary valueForKey:@"requiredTypeID"] integerValue];
	self.quantity = [[dictionary valueForKey:@"quantity"] integerValue];
	self.damagePerJob = [[dictionary valueForKey:@"damagePerJob"] floatValue];
	self.recycle = [[dictionary valueForKey:@"recycle"] integerValue];
}

- (void) didReceiveRecord: (NSDictionary*) record {
	[self setValuesWithDictionary:record];
}

@end

@implementation EVEDBRamTypeRequirement
@synthesize typeID;
@synthesize type;
@synthesize activityID;
@synthesize activity;
@synthesize requiredTypeID;
@synthesize requiredType;
@synthesize quantity;
@synthesize damagePerJob;
@synthesize recycle;

+ (id) ramTypeRequirementWithDictionary: (NSDictionary*) dictionary {
	return [[[EVEDBRamTypeRequirement alloc] initWithDictionary:dictionary] autorelease];
}

- (id) initWithDictionary: (NSDictionary*) dictionary {
	if (self = [super init]) {
		[self setValuesWithDictionary:dictionary];
	}
	return self;
}

- (void) dealloc {
	[type release];
	[activity release];
	[requiredType release];
	[super dealloc];
}

- (EVEDBInvType*) type {
	if (typeID == 0)
		return NULL;
	if (!type) {
		type = [[EVEDBInvType invTypeWithTypeID:typeID error:nil] retain];
		if (!type)
			type = (EVEDBInvType*) [[NSNull null] retain];
	}
	if ((NSNull*) type == [NSNull null])
		return NULL;
	else
		return type;
}

- (EVEDBRamActivity*) activity {
	if (activityID == 0)
		return NULL;
	if (!activity) {
		activity = [[EVEDBRamActivity ramActivityWithActivityID:activityID error:nil] retain];
		if (!activity)
			activity = (EVEDBRamActivity*) [[NSNull null] retain];
	}
	if ((NSNull*) activity == [NSNull null])
		return NULL;
	else
		return activity;
}

- (EVEDBInvType*) requiredType {
	if (requiredTypeID == 0)
		return NULL;
	if (!requiredType) {
		requiredType = [[EVEDBInvType invTypeWithTypeID:requiredTypeID error:nil] retain];
		if (!requiredType)
			requiredType = (EVEDBInvType*) [[NSNull null] retain];
	}
	if ((NSNull*) requiredType == [NSNull null])
		return NULL;
	else
		return requiredType;
}

@end