//
//  EVEDBDgmEffect.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 4/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEDBDgmEffect.h"
#import "EVEDBDatabase.h"

@interface EVEDBDgmEffect(Private)
- (void) setValuesWithDictionary:(NSDictionary *)dictionary;
- (void) didReceiveRecord: (NSDictionary*) record;
@end

@implementation EVEDBDgmEffect(Private)

- (void) setValuesWithDictionary:(NSDictionary *)dictionary {
	self.effectID = [[dictionary valueForKey:@"effectID"] integerValue];
	self.effectName = [dictionary valueForKey:@"effectName"];
	self.effectCategory = [[dictionary valueForKey:@"effectCategory"] integerValue];
	self.preExpression = [[dictionary valueForKey:@"preExpression"] integerValue];
	self.postExpression = [[dictionary valueForKey:@"postExpression"] integerValue];
	self.description = [dictionary valueForKey:@"description"];
	self.guid = [dictionary valueForKey:@"guid"];
	self.iconID = [[dictionary valueForKey:@"iconID"] integerValue];
	self.isOffensive = [[dictionary valueForKey:@"isOffensive"] boolValue];
	self.isAssistance = [[dictionary valueForKey:@"isAssistance"] boolValue];
	self.durationAttributeID = [[dictionary valueForKey:@"durationAttributeID"] integerValue];
	self.trackingSpeedAttributeID = [[dictionary valueForKey:@"trackingSpeedAttributeID"] integerValue];
	self.dischargeAttributeID = [[dictionary valueForKey:@"dischargeAttributeID"] integerValue];
	self.rangeAttributeID = [[dictionary valueForKey:@"rangeAttributeID"] integerValue];
	self.falloffAttributeID = [[dictionary valueForKey:@"falloffAttributeID"] integerValue];
	self.disallowAutoRepeat = [[dictionary valueForKey:@"disallowAutoRepeat"] boolValue];
	self.published = [[dictionary valueForKey:@"published"] boolValue];
	self.displayName = [dictionary valueForKey:@"displayName"];
	self.isWarpSafe = [[dictionary valueForKey:@"isWarpSafe"] boolValue];
	self.rangeChance = [[dictionary valueForKey:@"rangeChance"] boolValue];
	self.electronicChance = [[dictionary valueForKey:@"electronicChance"] boolValue];
	self.propulsionChance = [[dictionary valueForKey:@"propulsionChance"] boolValue];
	self.distribution = [[dictionary valueForKey:@"distribution"] integerValue];
	self.sfxName = [dictionary valueForKey:@"sfxName"];
	self.npcUsageChanceAttributeID = [[dictionary valueForKey:@"npcUsageChanceAttributeID"] integerValue];
	self.npcActivationChanceAttributeID = [[dictionary valueForKey:@"npcActivationChanceAttributeID"] integerValue];
	self.fittingUsageChanceAttributeID = [[dictionary valueForKey:@"fittingUsageChanceAttributeID"] integerValue];
}

- (void) didReceiveRecord: (NSDictionary*) record {
	[self setValuesWithDictionary:record];
}

@end


@implementation EVEDBDgmEffect
@synthesize effectID;
@synthesize effectName;
@synthesize effectCategory;
@synthesize preExpression;
@synthesize postExpression;
@synthesize description;
@synthesize guid;
@synthesize iconID;
@synthesize isOffensive;
@synthesize isAssistance;
@synthesize durationAttributeID;
@synthesize trackingSpeedAttributeID;
@synthesize dischargeAttributeID;
@synthesize rangeAttributeID;
@synthesize falloffAttributeID;
@synthesize disallowAutoRepeat;
@synthesize published;
@synthesize displayName;
@synthesize isWarpSafe;
@synthesize rangeChance;
@synthesize electronicChance;
@synthesize propulsionChance;
@synthesize distribution;
@synthesize sfxName;
@synthesize npcUsageChanceAttributeID;
@synthesize npcActivationChanceAttributeID;
@synthesize fittingUsageChanceAttributeID;

+ (id) dgmEffectWithEffectID: (NSInteger)aEffectID error:(NSError **)errorPtr {
	return [[[EVEDBDgmEffect alloc] initWithEffectID:aEffectID error:errorPtr] autorelease];
}

+ (id) dgmEffectWithDictionary: (NSDictionary*) dictionary {
	return [[[EVEDBDgmEffect alloc] initWithDictionary:dictionary] autorelease];
}

- (id) initWithEffectID: (NSInteger)aEffectID error:(NSError **)errorPtr {
	if (self = [super init]) {
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (!database) {
			[self release];
			return nil;
		}
		NSError *error = [database execWithSQLRequest:[NSString stringWithFormat:@"SELECT * from dgmEffects WHERE effectID=%d;", aEffectID]
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
	[effectName release];
	[description release];
	[guid release];
	[displayName release];
	[sfxName release];
	[super dealloc];
}

@end
