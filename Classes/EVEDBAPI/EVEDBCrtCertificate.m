//
//  EVEDBCrtCertificate.m
//  EVEOnlineAPI
//
//  Created by Mr. Depth on 1/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EVEDBCrtCertificate.h"
#import "EVEDBDatabase.h"
#import "EVEDBCrtCategory.h"
#import "EVEDBCrtClass.h"
#import "EVEDBEveIcon.h"
#import "EVEDBCrtRelationship.h"
#import "EVEDBCrtRecommendation.h"

@interface EVEDBCrtCertificate(Private)
- (void) setValuesWithDictionary:(NSDictionary *)dictionary;
- (void) didReceiveRecord: (NSDictionary*) record;
- (void) didReceivePrerequisite: (NSDictionary*) record;
- (void) didReceiveDerivation: (NSDictionary*) record;
- (void) didReceiveRecommendation: (NSDictionary*) record;
- (void) loadPrerequisites;
- (void) loadDerivations;
- (void) loadRecommendations;
@end

@implementation EVEDBCrtCertificate(Private)

- (void) setValuesWithDictionary:(NSDictionary *)dictionary {
	self.certificateID = [[dictionary valueForKey:@"certificateID"] integerValue];
	self.categoryID = [[dictionary valueForKey:@"categoryID"] integerValue];
	self.classID = [[dictionary valueForKey:@"classID"] integerValue];
	self.grade = [[dictionary valueForKey:@"grade"] integerValue];
	self.corpID = [[dictionary valueForKey:@"corpID"] integerValue];
	self.iconID = [[dictionary valueForKey:@"iconID"] integerValue];
	self.description = [dictionary valueForKey:@"description"];
}

- (void) didReceiveRecord: (NSDictionary*) record {
	[self setValuesWithDictionary:record];
}

- (void) didReceivePrerequisite: (NSDictionary*) record {
	EVEDBCrtRelationship* relationship = [EVEDBCrtRelationship crtRelationshipWithDictionary:record];
	relationship.child = self;
	[prerequisites addObject:relationship];
}

- (void) didReceiveDerivation: (NSDictionary*) record {
	EVEDBCrtRelationship* relationship = [EVEDBCrtRelationship crtRelationshipWithDictionary:record];
	relationship.parent = self;
	[derivations addObject:relationship];
}

- (void) didReceiveRecommendation: (NSDictionary*) record {
	EVEDBCrtRecommendation* recommendation = [EVEDBCrtRecommendation crtRecommendationWithDictionary:record];
	recommendation.certificate = self;
	[recommendations addObject:recommendation];
}

- (void) loadPrerequisites {
	EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
	if (!database)
		return;
	prerequisites = [[NSMutableArray alloc] init];
	
	[database execWithSQLRequest:[NSString stringWithFormat:@"SELECT * FROM crtRelationships WHERE childID=%d;", certificateID]
						  target:self
						  action:@selector(didReceivePrerequisite:)];
}

- (void) loadDerivations {
	EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
	if (!database)
		return;
	derivations = [[NSMutableArray alloc] init];
	
	[database execWithSQLRequest:[NSString stringWithFormat:@"SELECT * FROM crtRelationships WHERE parentID=%d;", certificateID]
						  target:self
						  action:@selector(didReceiveDerivation:)];
}

- (void) loadRecommendations {
	EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
	if (!database)
		return;
	recommendations = [[NSMutableArray alloc] init];
	
	[database execWithSQLRequest:[NSString stringWithFormat:@"SELECT * FROM crtRecommendations WHERE certificateID=%d;", certificateID]
						  target:self
						  action:@selector(didReceiveRecommendation:)];
}

@end

@implementation EVEDBCrtCertificate
@synthesize certificateID;
@synthesize categoryID;
@synthesize category;
@synthesize classID;
@synthesize certificateClass;
@synthesize grade;
@synthesize corpID;
@synthesize iconID;
@synthesize icon;
@synthesize description;
@synthesize prerequisites;
@synthesize derivations;
@synthesize recommendations;

+ (id) crtCertificateWithCertificateID: (NSInteger)aCertificateID error:(NSError **)errorPtr {
	return [[[EVEDBCrtCertificate alloc] initWithCertificateID:aCertificateID error:errorPtr] autorelease];
}

+ (id) crtCertificateWithDictionary: (NSDictionary*) dictionary {
	return [[[EVEDBCrtCertificate alloc] initWithDictionary:dictionary] autorelease];
}

- (id) initWithCertificateID: (NSInteger)aCertificateID error:(NSError **)errorPtr {
	if (self = [super init]) {
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (!database) {
			[self release];
			return nil;
		}
		NSError *error = [database execWithSQLRequest:[NSString stringWithFormat:@"SELECT * from crtCertificates WHERE certificateID=%d;", aCertificateID]
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
	[category release];
	[certificateClass release];
	[icon release];
	[prerequisites release];
	[derivations release];
	[recommendations release];
	[super dealloc];
}

- (EVEDBCrtCategory*) category {
	if (categoryID == 0)
		return NULL;
	if (!category) {
		category = [[EVEDBCrtCategory crtCategoryWithCategoryID:categoryID error:nil] retain];
		if (!category)
			category = (EVEDBCrtCategory*) [[NSNull null] retain];
	}
	if ((NSNull*) category == [NSNull null])
		return NULL;
	else
		return category;
}

- (EVEDBCrtClass*) certificateClass {
	if (classID == 0)
		return NULL;
	if (!certificateClass) {
		certificateClass = [[EVEDBCrtClass crtClassWithClassID:classID error:nil] retain];
		if (!certificateClass)
			certificateClass = (EVEDBCrtClass*) [[NSNull null] retain];
	}
	if ((NSNull*) certificateClass == [NSNull null])
		return NULL;
	else
		return certificateClass;
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

- (NSArray*) prerequisites {
	if (!prerequisites) {
		[self loadPrerequisites];
	}
	return prerequisites;
}

- (NSArray*) derivations {
	if (!derivations) {
		[self loadDerivations];
	}
	return derivations;
}

- (NSArray*) recommendations {
	if (!recommendations) {
		[self loadRecommendations];
	}
	return recommendations;
}

- (NSString*) gradeText {
	switch (grade) {
		case 1:
			return @"Basic";
		case 2:
			return @"Standard";
		case 3:
			return @"Improved";
		case 5:
			return @"Elite";
		default:
			return @"Unknown";
	}
}

- (NSString*) iconImageName {
	if (self.icon)
		return self.icon.iconImageName;
	else
		return [NSString stringWithFormat:@"Icons/icon79_0%d.png", 1 + grade];
}

@end