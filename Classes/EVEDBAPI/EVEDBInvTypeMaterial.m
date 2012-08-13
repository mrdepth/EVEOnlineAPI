//
//  EVEDBInvTypeMaterial.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 13.08.12.
//
//

#import "EVEDBInvTypeMaterial.h"
#import "EVEDBDatabase.h"
#import "EVEDBInvType.h"

@interface EVEDBInvTypeMaterial(Private)
- (void) setValuesWithDictionary:(NSDictionary *)dictionary;
@end

@implementation EVEDBInvTypeMaterial(Private)

- (void) setValuesWithDictionary:(NSDictionary *)dictionary {
	self.typeID = [[dictionary valueForKey:@"typeID"] integerValue];
	self.materialTypeID = [[dictionary valueForKey:@"materialTypeID"] integerValue];
	self.quantity = [[dictionary valueForKey:@"quantity"] integerValue];
}

@end

@implementation EVEDBInvTypeMaterial
@synthesize typeID;
@synthesize type;
@synthesize materialTypeID;
@synthesize materialType;
@synthesize quantity;

+ (id) invTypeMaterialWithDictionary: (NSDictionary*) dictionary {
	return [[[EVEDBInvTypeMaterial alloc] initWithDictionary:dictionary] autorelease];
}

- (id) initWithDictionary: (NSDictionary*) dictionary {
	if (self = [super init]) {
		[self setValuesWithDictionary:dictionary];
	}
	return self;
}

- (void) dealloc {
	[type release];
	[materialType release];
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

- (EVEDBInvType*) materialType {
	if (materialTypeID == 0)
		return NULL;
	if (!materialType) {
		materialType = [[EVEDBInvType invTypeWithTypeID:materialTypeID error:nil] retain];
		if (!materialType)
			materialType = (EVEDBInvType*) [[NSNull null] retain];
	}
	if ((NSNull*) materialType == [NSNull null])
		return NULL;
	else
		return materialType;
}

@end