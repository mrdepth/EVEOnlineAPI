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
@property (nonatomic) int32_t relationshipID;
@property (nonatomic) int32_t parentID;
@property (nonatomic, readonly, strong) EVEDBCrtCertificate* parent;
@property (nonatomic) int32_t parentTypeID;
@property (nonatomic, readonly, strong) EVEDBInvTypeRequiredSkill* parentType;
@property (nonatomic) int32_t parentLevel;
@property (nonatomic) int32_t childID;
@property (nonatomic, readonly, strong) EVEDBCrtCertificate* child;

+ (id) crtRelationshipWithRelationshipID: (int32_t)aRelationshipID error:(NSError **)errorPtr;
- (id) initWithRelationshipID: (int32_t)aRelationshipID error:(NSError **)errorPtr;

@end