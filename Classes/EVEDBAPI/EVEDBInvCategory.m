//
//  EVEDBInvCategory.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEDBInvCategory.h"
#import "EVEDBDatabase.h"
#import "EVEDBEveIcon.h"

@interface EVEDBInvCategory(Private)
- (void) setValuesWithDictionary:(NSDictionary *)dictionary;
- (void) didReceiveRecord: (NSDictionary*) record;
@end

@implementation EVEDBInvCategory(Private)

- (void) setValuesWithDictionary:(NSDictionary *)dictionary {
	self.categoryID = [[dictionary valueForKey:@"categoryID"] integerValue];
	self.categoryName = [dictionary valueForKey:@"categoryName"];
	self.description = [dictionary valueForKey:@"description"];
	self.iconID = [[dictionary valueForKey:@"iconID"] integerValue];
	self.published = [[dictionary valueForKey:@"published"] integerValue];
}

- (void) didReceiveRecord: (NSDictionary*) record {
	[self setValuesWithDictionary:record];
}

@end


@implementation EVEDBInvCategory
@synthesize categoryID;
@synthesize categoryName;
@synthesize description;
@synthesize iconID;
@synthesize icon;
@synthesize published;

+ (id) invCategoryWithCategoryID: (NSInteger)aCategoryID error:(NSError **)errorPtr {
	return [[[EVEDBInvCategory alloc] initWithCategoryID:aCategoryID error:errorPtr] autorelease];
}

+ (id) invCategoryWithDictionary: (NSDictionary*) dictionary {
	return [[[EVEDBInvCategory alloc] initWithDictionary:dictionary] autorelease];
}

- (id) initWithCategoryID: (NSInteger)aCategoryID error:(NSError **)errorPtr {
	if (self = [super init]) {
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (!database) {
			[self release];
			return nil;
		}
		NSError *error = [database execWithSQLRequest:[NSString stringWithFormat:@"SELECT * from invCategories WHERE categoryID=%d;", aCategoryID]
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

- (void) dealloc {
	[categoryName release];
	[description release];
	[icon release];
	[super dealloc];
}
@end
