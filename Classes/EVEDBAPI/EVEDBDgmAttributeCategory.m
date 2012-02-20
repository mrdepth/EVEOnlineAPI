//
//  EVEDBDgmAttributeCategory.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEDBDgmAttributeCategory.h"
#import "EVEDBDatabase.h"

@interface EVEDBDgmAttributeCategory(Private)
- (void) setValuesWithDictionary:(NSDictionary *)dictionary;
- (void) didReceiveRecord: (NSDictionary*) record;
@end

@implementation EVEDBDgmAttributeCategory(Private)

- (void) setValuesWithDictionary:(NSDictionary *)dictionary {
	self.categoryID = [[dictionary valueForKey:@"categoryID"] integerValue];
	self.categoryName = [dictionary valueForKey:@"categoryName"];
	self.categoryDescription = [dictionary valueForKey:@"categoryDescription"];
}

- (void) didReceiveRecord: (NSDictionary*) record {
	[self setValuesWithDictionary:record];
}

@end


@implementation EVEDBDgmAttributeCategory
@synthesize categoryID;
@synthesize categoryName;
@synthesize categoryDescription;

+ (id) dgmAttributeCategoryWithAttributeCategoryID: (NSInteger)aAttributeCategoryID error:(NSError **)errorPtr {
	return [[[EVEDBDgmAttributeCategory alloc] initWithAttributeCategoryID:aAttributeCategoryID error:errorPtr] autorelease];
}

+ (id) dgmAttributeCategoryWithDictionary: (NSDictionary*) dictionary {
	return [[[EVEDBDgmAttributeCategory alloc] initWithDictionary:dictionary] autorelease];
}

- (id) initWithAttributeCategoryID: (NSInteger)aAttributeCategoryID error:(NSError **)errorPtr {
	if (self = [super init]) {
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (!database) {
			[self release];
			return nil;
		}
		NSError *error = [database execWithSQLRequest:[NSString stringWithFormat:@"SELECT * from dgmAttributeCategories WHERE categoryID=%d;", aAttributeCategoryID]
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
	[categoryName release];
	[categoryDescription release];
	[super dealloc];
}

@end
