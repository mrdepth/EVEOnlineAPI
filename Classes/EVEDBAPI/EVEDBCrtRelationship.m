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

@interface EVEDBCrtRelationship()
@property (nonatomic, readwrite, strong) EVEDBCrtCertificate* parent;
@property (nonatomic, readwrite, strong) EVEDBInvTypeRequiredSkill* parentType;
@property (nonatomic, readwrite, strong) EVEDBCrtCertificate* child;
@end


@implementation EVEDBCrtRelationship

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"relationshipID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"relationshipID"},
		  @"parentID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"parentID"},
		  @"parentTypeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"parentTypeID"},
		  @"parentLevel" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"parentLevel"},
		  @"childID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"childID"}
		  };
	return map;
}

+ (id) crtRelationshipWithRelationshipID: (NSInteger)relationshipID error:(NSError **)errorPtr {
	return [[EVEDBCrtRelationship alloc] initWithRelationshipID:relationshipID error:errorPtr];
}

- (id) initWithRelationshipID: (NSInteger)relationshipID error:(NSError **)errorPtr {
	if (self = [super initWithSQLRequest:[NSString stringWithFormat:@"SELECT * from crtRelationships WHERE relationshipID=%d;", relationshipID]
								   error:errorPtr]) {
	}
	return self;
}

- (EVEDBCrtCertificate*) parent {
	if (self.parentID == 0)
		return NULL;
	if (!_parent) {
		_parent = [EVEDBCrtCertificate crtCertificateWithCertificateID:self.parentID error:nil];
		if (!_parent)
			_parent = (EVEDBCrtCertificate*) [NSNull null];
	}
	if ((NSNull*) _parent == [NSNull null])
		return NULL;
	else
		return _parent;
}

- (EVEDBInvTypeRequiredSkill*) parentType {
	if (self.parentTypeID == 0)
		return NULL;
	if (!_parentType) {
		_parentType = [EVEDBInvTypeRequiredSkill invTypeWithTypeID:self.parentTypeID error:nil];
		_parentType.requiredLevel = self.parentLevel;
		if (!_parentType)
			_parentType = (EVEDBInvTypeRequiredSkill*) [NSNull null];
	}
	if ((NSNull*) _parentType == [NSNull null])
		return NULL;
	else
		return _parentType;
}

- (EVEDBCrtCertificate*) child {
	if (self.childID == 0)
		return NULL;
	if (!_child) {
		_child = [EVEDBCrtCertificate crtCertificateWithCertificateID:self.childID error:nil];
		if (!_child)
			_child = (EVEDBCrtCertificate*) [NSNull null];
	}
	if ((NSNull*) _child == [NSNull null])
		return NULL;
	else
		return _child;
}

@end