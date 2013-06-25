//
//  EVEDBCrtRelationship.h
//  EVEOnlineAPI
//
//  Created by Mr. Depth on 1/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EVEDBObject.h"

@class EVEDBCrtCertificate;
@class EVEDBInvTypeRequiredSkill;
@interface EVEDBCrtRelationship : EVEDBObject
@property (nonatomic) NSInteger relationshipID;
@property (nonatomic) NSInteger parentID;
@property (nonatomic, readonly, strong) EVEDBCrtCertificate* parent;
@property (nonatomic) NSInteger parentTypeID;
@property (nonatomic, readonly, strong) EVEDBInvTypeRequiredSkill* parentType;
@property (nonatomic) NSInteger parentLevel;
@property (nonatomic) NSInteger childID;
@property (nonatomic, readonly, strong) EVEDBCrtCertificate* child;

+ (id) crtRelationshipWithRelationshipID: (NSInteger)aRelationshipID error:(NSError **)errorPtr;
- (id) initWithRelationshipID: (NSInteger)aRelationshipID error:(NSError **)errorPtr;

@end