//
//  EVEDBCrtRelationship.m
//  EVEOnlineAPI
//
//  Created by Mr. Depth on 1/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EVEDBCrtRelationship.h"
#import "EVEDBDatabase.h"
#import "EVEDBCrtCertificate.h"
#import "EVEDBInvType.h"

@interface EVEDBCrtRelationship(Private)
- (void) setValuesWithDictionary:(NSDictionary *)dictionary;
- (void) didReceiveRecord: (NSDictionary*) record;
@end

@implementation EVEDBCrtRelationship(Private)

- (void) setValuesWithDictionary:(NSDictionary *)dictionary {
	self.relationshipID = [[dictionary valueForKey:@"relationshipID"] integerValue];
	self.parentID = [[dictionary valueForKey:@"parentID"] integerValue];
	self.parentTypeID = [[dictionary valueForKey:@"parentTypeID"] integerValue];
	self.parentLevel = [[dictionary valueForKey:@"parentLevel"] integerValue];
	self.childID = [[dictionary valueForKey:@"childID"] integerValue];
}

- (void) didReceiveRecord: (NSDictionary*) record {
	[self setValuesWithDictionary:record];
}

@end

@implementation EVEDBCrtRelationship
@synthesize relationshipID;
@synthesize parentID;
@synthesize parent;
@synthesize parentTypeID;
@synthesize parentType;
@synthesize parentLevel;
@synthesize childID;
@synthesize child;

+ (id) crtRelationshipWithRelationshipID: (NSInteger)aRelationshipID error:(NSError **)errorPtr {
	return [[[EVEDBCrtRelationship alloc] initWithRelationshipID:aRelationshipID error:errorPtr] autorelease];
}

+ (id) crtRelationshipWithDictionary: (NSDictionary*) dictionary {
	return [[[EVEDBCrtRelationship alloc] initWithDictionary:dictionary] autorelease];
}

- (id) initWithRelationshipID: (NSInteger)aRelationshipID error:(NSError **)errorPtr {
	if (self = [super init]) {
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (!database) {
			[self release];
			return nil;
		}
		NSError *error = [database execWithSQLRequest:[NSString stringWithFormat:@"SELECT * from crtRelationships WHERE relationshipID=%d;", aRelationshipID]
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
	[parent release];
	[parentType release];
	[child release];
	[super dealloc];
}

- (EVEDBCrtCertificate*) parent {
	if (parentID == 0)
		return NULL;
	if (!parent) {
		parent = [[EVEDBCrtCertificate crtCertificateWithCertificateID:parentID error:nil] retain];
		if (!parent)
			parent = (EVEDBCrtCertificate*) [[NSNull null] retain];
	}
	if ((NSNull*) parent == [NSNull null])
		return NULL;
	else
		return parent;
}

- (EVEDBInvTypeRequiredSkill*) parentType {
	if (parentTypeID == 0)
		return NULL;
	if (!parentType) {
		parentType = [[EVEDBInvTypeRequiredSkill invTypeWithTypeID:parentTypeID error:nil] retain];
		parentType.requiredLevel = parentLevel;
		if (!parentType)
			parentType = (EVEDBInvTypeRequiredSkill*) [[NSNull null] retain];
	}
	if ((NSNull*) parentType == [NSNull null])
		return NULL;
	else
		return parentType;
}

- (EVEDBCrtCertificate*) child {
	if (childID == 0)
		return NULL;
	if (!child) {
		child = [[EVEDBCrtCertificate crtCertificateWithCertificateID:childID error:nil] retain];
		if (!child)
			child = (EVEDBCrtCertificate*) [[NSNull null] retain];
	}
	if ((NSNull*) child == [NSNull null])
		return NULL;
	else
		return child;
}

@end