//
//  EVEDBDgmAttributeType.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEDBDgmAttributeType.h"
#import "EVEDBDatabase.h"
#import "EVEDBDgmAttributeCategory.h"
#import "EVEDBEveIcon.h"
#import "EVEDBEveUnit.h"

@interface EVEDBDgmAttributeType(Private)
- (void) setValuesWithDictionary:(NSDictionary *)dictionary;
- (void) didReceiveRecord: (NSDictionary*) record;
@end

@implementation EVEDBDgmAttributeType(Private)

- (void) setValuesWithDictionary:(NSDictionary *)dictionary {
	self.attributeID = [[dictionary valueForKey:@"attributeID"] integerValue];
	self.attributeName = [dictionary valueForKey:@"attributeName"];
	self.description = [dictionary valueForKey:@"description"];
	self.iconID = [[dictionary valueForKey:@"iconID"] integerValue];
	self.defaultValue = [[dictionary valueForKey:@"defaultValue"] floatValue];
	self.published = [[dictionary valueForKey:@"published"] integerValue];
	self.displayName = [dictionary valueForKey:@"displayName"];
	self.unitID = [[dictionary valueForKey:@"unitID"] integerValue];
	self.stackable = [[dictionary valueForKey:@"stackable"] integerValue];
	self.highIsGood = [[dictionary valueForKey:@"highIsGood"] integerValue];
	self.categoryID = [[dictionary valueForKey:@"categoryID"] integerValue];
}

- (void) didReceiveRecord: (NSDictionary*) record {
	[self setValuesWithDictionary:record];
}

@end

@implementation EVEDBDgmAttributeType
@synthesize attributeID;
@synthesize attributeName;
@synthesize description;
@synthesize iconID;
@synthesize icon;
@synthesize defaultValue;
@synthesize published;
@synthesize displayName;
@synthesize unitID;
@synthesize unit;
@synthesize stackable;
@synthesize highIsGood;
@synthesize categoryID;
@synthesize category;

+ (id) dgmAttributeTypeWithAttributeTypeID: (NSInteger)aAttributeTypeID error:(NSError **)errorPtr {
	return [[[EVEDBDgmAttributeType alloc] initWithAttributeTypeID:aAttributeTypeID error:errorPtr] autorelease];
}

+ (id) dgmAttributeTypeWithDictionary: (NSDictionary*) dictionary {
	return [[[EVEDBDgmAttributeType alloc] initWithDictionary:dictionary] autorelease];
}

- (id) initWithAttributeTypeID: (NSInteger)aAttributeTypeID error:(NSError **)errorPtr {
	if (self = [super init]) {
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (!database) {
			[self release];
			return nil;
		}
		NSError *error = [database execWithSQLRequest:[NSString stringWithFormat:@"SELECT * from dgmAttributeTypes WHERE attributeID=%d;", aAttributeTypeID]
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

- (EVEDBDgmAttributeCategory*) category {
	if (categoryID == 0)
		return NULL;
	if (!category) {
		category = [[EVEDBDgmAttributeCategory dgmAttributeCategoryWithAttributeCategoryID:categoryID error:nil] retain];
		if (!category)
			category = (EVEDBDgmAttributeCategory*) [[NSNull null] retain];
	}
	if ((NSNull*) category == [NSNull null])
		return NULL;
	else
		return category;
}

- (EVEDBEveIcon*) icon {
	if (iconID == 0)
		return NULL;
	if (!icon) {
		icon = [[EVEDBEveIcon eveIconWithIconID:iconID error:nil] retain];
		if (!icon)
			icon = (EVEDBEveIcon*) [[NSNull null] retain];
	}
	if ((NSNull*) icon == [NSNull null])
		return NULL;
	else
		return icon;
}


- (EVEDBEveUnit*) unit {
	if (unitID == 0)
		return NULL;
	if (!unit) {
		unit = [[EVEDBEveUnit eveUnitWithUnitID:unitID error:nil] retain];
		if (!unit)
			unit = (EVEDBEveUnit*) [[NSNull null] retain];
	}
	if ((NSNull*) unit == [NSNull null])
		return NULL;
	else
		return unit;
}

- (void) dealloc {
	[attributeName release];
	[description release];
	[icon release];
	[displayName release];
	[unit release];
	[category release];
	[super dealloc];
}

@end
