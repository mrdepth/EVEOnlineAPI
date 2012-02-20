//
//  EVEDBCrtCategory.m
//  EVEOnlineAPI
//
//  Created by Mr. Depth on 1/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EVEDBCrtCategory.h"
#import "EVEDBDatabase.h"

@interface EVEDBCrtCategory(Private)
- (void) setValuesWithDictionary:(NSDictionary *)dictionary;
- (void) didReceiveRecord: (NSDictionary*) record;
@end

@implementation EVEDBCrtCategory(Private)

- (void) setValuesWithDictionary:(NSDictionary *)dictionary {
	self.categoryID = [[dictionary valueForKey:@"categoryID"] integerValue];
	self.description = [dictionary valueForKey:@"description"];
	self.categoryName = [dictionary valueForKey:@"categoryName"];
}

- (void) didReceiveRecord: (NSDictionary*) record {
	[self setValuesWithDictionary:record];
}

@end

@implementation EVEDBCrtCategory
@synthesize categoryID;
@synthesize description;
@synthesize categoryName;

+ (id) crtCategoryWithCategoryID: (NSInteger)aCategoryID error:(NSError **)errorPtr {
	return [[[EVEDBCrtCategory alloc] initWithCategoryID:aCategoryID error:errorPtr] autorelease];
}

+ (id) crtCategoryWithDictionary: (NSDictionary*) dictionary {
	return [[[EVEDBCrtCategory alloc] initWithDictionary:dictionary] autorelease];
}

- (id) initWithCategoryID: (NSInteger)aCategoryID error:(NSError **)errorPtr {
	if (self = [super init]) {
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (!database) {
			[self release];
			return nil;
		}
		NSError *error = [database execWithSQLRequest:[NSString stringWithFormat:@"SELECT * from crtCategories WHERE categoryID=%d;", aCategoryID]
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
	[description release];
	[categoryName release];
	[super dealloc];
}

@end