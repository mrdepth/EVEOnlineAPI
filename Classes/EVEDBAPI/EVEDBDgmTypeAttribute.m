//
//  EVEDBDgmTypeAttribute.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEDBDgmTypeAttribute.h"
#import "EVEDBDatabase.h"
#import "EVEDBDgmAttributeType.h"

@interface EVEDBDgmTypeAttribute(Private)
- (void) setValuesWithDictionary:(NSDictionary *)dictionary;
- (void) didReceiveRecord: (NSDictionary*) record;
@end

@implementation EVEDBDgmTypeAttribute(Private)

- (void) setValuesWithDictionary:(NSDictionary *)dictionary {
	self.typeID = [[dictionary valueForKey:@"typeID"] integerValue];
	self.attributeID = [[dictionary valueForKey:@"attributeID"] integerValue];
	self.value = [[dictionary valueForKey:@"value"] floatValue];
}

- (void) didReceiveRecord: (NSDictionary*) record {
	[self setValuesWithDictionary:record];
}

@end


@implementation EVEDBDgmTypeAttribute
@synthesize typeID;
@synthesize attributeID;
@synthesize attribute;
@synthesize value;

+ (id) dgmTypeAttributeWithDictionary: (NSDictionary*) dictionary {
	return [[[EVEDBDgmTypeAttribute alloc] initWithDictionary:dictionary] autorelease];
}

- (id) initWithDictionary: (NSDictionary*) dictionary {
	if (self = [super init]) {
		[self setValuesWithDictionary:dictionary];
	}
	return self;
}

- (EVEDBDgmAttributeType*) attribute {
	if (attributeID == 0)
		return NULL;
	if (!attribute) {
		attribute = [[EVEDBDgmAttributeType dgmAttributeTypeWithAttributeTypeID:attributeID error:nil] retain];
		if (!attribute)
			attribute = (EVEDBDgmAttributeType*) [[NSNull null] retain];
	}
	if ((NSNull*) attribute == [NSNull null])
		return NULL;
	else
		return attribute;
}

- (void) dealloc {
	[attribute release];
	[super dealloc];
}

@end
