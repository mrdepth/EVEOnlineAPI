//
//  EVEDBCrtCertificate.m
//  EVEOnlineAPI
//
//  Created by Mr. Depth on 1/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EVEDBCrtCertificate.h"
#import "EVEDBCrtCategory.h"
#import "EVEDBCrtClass.h"
#import "EVEDBEveIcon.h"
#import "EVEDBCrtRelationship.h"
#import "EVEDBCrtRecommendation.h"

@interface EVEDBCrtCertificate()
@property (nonatomic, readwrite, strong) NSArray* prerequisites;
@property (nonatomic, readwrite, strong) NSArray* derivations;
@property (nonatomic, readwrite, strong) NSArray* recommendations;

@end

@implementation EVEDBCrtCertificate

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"certificateID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"certificateID"},
		  @"categoryID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"categoryID"},
		  @"classID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"classID"},
		  @"grade" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"grade"},
		  @"corpID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"corpID"},
		  @"iconID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"iconID"},
		  @"description" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"description"}
		  };
	return map;
}

+ (id) crtCertificateWithCertificateID: (NSInteger)certificateID error:(NSError **)errorPtr {
	return [[EVEDBCrtCertificate alloc] initWithCertificateID:certificateID error:errorPtr];
}

- (id) initWithCertificateID: (NSInteger)certificateID error:(NSError **)errorPtr {
	if (self = [super initWithSQLRequest:[NSString stringWithFormat:@"SELECT * from crtCertificates WHERE certificateID=%d;", certificateID]
								   error:errorPtr]) {
	}
	return self;
}

- (EVEDBCrtCategory*) category {
	if (self.categoryID == 0)
		return NULL;
	if (!_category) {
		_category = [EVEDBCrtCategory crtCategoryWithCategoryID:self.categoryID error:nil];
		if (!_category)
			_category = (EVEDBCrtCategory*) [NSNull null];
	}
	if ((NSNull*) _category == [NSNull null])
		return NULL;
	else
		return _category;
}

- (EVEDBCrtClass*) certificateClass {
	if (self.classID == 0)
		return NULL;
	if (!_certificateClass) {
		_certificateClass = [EVEDBCrtClass crtClassWithClassID:self.classID error:nil];
		if (!_certificateClass)
			_certificateClass = (EVEDBCrtClass*) [NSNull null];
	}
	if ((NSNull*) _certificateClass == [NSNull null])
		return NULL;
	else
		return _certificateClass;
}

- (EVEDBEveIcon*) icon {
	if (self.iconID == 0)
		return NULL;
	if (!_icon) {
		_icon = [EVEDBEveIcon eveIconWithIconID:self.iconID error:nil];
		if (!_icon)
			_icon = (EVEDBEveIcon*) [NSNull null];
	}
	if ((NSNull*) _icon == [NSNull null])
		return NULL;
	else
		return _icon;
}

- (NSArray*) prerequisites {
	if (!_prerequisites) {
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (!database)
			return nil;
		_prerequisites = [[NSMutableArray alloc] init];
		
		[database execSQLRequest:[NSString stringWithFormat:@"SELECT * FROM crtRelationships WHERE childID=%d;", self.certificateID]
					 resultBlock:^(sqlite3_stmt *stmt, BOOL *needsMore) {
						 EVEDBCrtRelationship* relationship = [[EVEDBCrtRelationship alloc] initWithStatement:stmt];
						 //relationship.child = self;
						 [(NSMutableArray*) _prerequisites addObject:relationship];
					 }];
	}
	return _prerequisites;
}

- (NSArray*) derivations {
	if (!_derivations) {
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (!database)
			return nil;
		_derivations = [[NSMutableArray alloc] init];
		
		[database execSQLRequest:[NSString stringWithFormat:@"SELECT * FROM crtRelationships WHERE parentID=%d;", self.certificateID]
					 resultBlock:^(sqlite3_stmt *stmt, BOOL *needsMore) {
						 EVEDBCrtRelationship* relationship = [[EVEDBCrtRelationship alloc] initWithStatement:stmt];
						 //relationship.parent = self;
						 [(NSMutableArray*) _derivations addObject:relationship];
					 }];
	}
	return _derivations;
}

- (NSArray*) recommendations {
	if (!_recommendations) {
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (!database)
			return nil;
		_recommendations = [[NSMutableArray alloc] init];
		
		[database execSQLRequest:[NSString stringWithFormat:@"SELECT * FROM crtRecommendations WHERE certificateID=%d;", self.certificateID]
					 resultBlock:^(sqlite3_stmt *stmt, BOOL *needsMore) {
						 EVEDBCrtRecommendation* recommendation = [[EVEDBCrtRecommendation alloc] initWithStatement:stmt];
						 //recommendation.certificate = self;
						 [(NSMutableArray*) _recommendations addObject:recommendation];
					 }];
	}
	return _recommendations;
}

- (NSString*) gradeText {
	switch (self.grade) {
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
		return [NSString stringWithFormat:@"Icons/icon79_0%d.png", 1 + self.grade];
}

@end