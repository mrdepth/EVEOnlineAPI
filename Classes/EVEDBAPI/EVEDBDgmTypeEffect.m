//
//  EVEDBDgmTypeEffect.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 4/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEDBDgmTypeEffect.h"
#import "EVEDBDatabase.h"
#import "EVEDBDgmEffect.h"
#import "EVEDBInvType.h"

@interface EVEDBDgmTypeEffect(Private)
- (void) setValuesWithDictionary:(NSDictionary *)dictionary;
- (void) didReceiveRecord: (NSDictionary*) record;
@end

@implementation EVEDBDgmTypeEffect(Private)

- (void) setValuesWithDictionary:(NSDictionary *)dictionary {
	self.typeID = [[dictionary valueForKey:@"typeID"] integerValue];
	self.effectID = [[dictionary valueForKey:@"effectID"] integerValue];
	self.isDefault = [[dictionary valueForKey:@"isDefault"] boolValue];
}

- (void) didReceiveRecord: (NSDictionary*) record {
	[self setValuesWithDictionary:record];
}

@end


@implementation EVEDBDgmTypeEffect
@synthesize typeID;
//@synthesize type;
@synthesize effectID;
@synthesize effect;
@synthesize isDefault;

+ (id) dgmTypeEffectWithDictionary: (NSDictionary*) dictionary {
	return [[[EVEDBDgmTypeEffect alloc] initWithDictionary:dictionary] autorelease];
}

- (id) initWithDictionary: (NSDictionary*) dictionary {
	if (self = [super init]) {
		[self setValuesWithDictionary:dictionary];
	}
	return self;
}

/*- (EVEDBInvType*) type {
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
}*/

- (EVEDBDgmEffect*) effect {
	if (effectID == 0)
		return NULL;
	if (!effect) {
		effect = [[EVEDBDgmEffect dgmEffectWithEffectID:effectID error:nil] retain];
		if (!effect)
			effect = (EVEDBDgmEffect*) [[NSNull null] retain];
	}
	if ((NSNull*) effect == [NSNull null])
		return NULL;
	else
		return effect;
}

- (void) dealloc {
//	[type release];
	[effect release];
	[super dealloc];
}

@end