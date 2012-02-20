//
//  EVEDBCrtRelationship.h
//  EVEOnlineAPI
//
//  Created by Mr. Depth on 1/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EVEDBCrtCertificate;
@class EVEDBInvTypeRequiredSkill;
@interface EVEDBCrtRelationship : NSObject {
	NSInteger relationshipID;
	NSInteger parentID;
	EVEDBCrtCertificate* parent;
	NSInteger parentTypeID;
	EVEDBInvTypeRequiredSkill* parentType;
	NSInteger parentLevel;
	NSInteger childID;
	EVEDBCrtCertificate* child;
}
@property (nonatomic) NSInteger relationshipID;
@property (nonatomic) NSInteger parentID;
@property (nonatomic, retain) EVEDBCrtCertificate* parent;
@property (nonatomic) NSInteger parentTypeID;
@property (nonatomic, retain) EVEDBInvTypeRequiredSkill* parentType;
@property (nonatomic) NSInteger parentLevel;
@property (nonatomic) NSInteger childID;
@property (nonatomic, retain) EVEDBCrtCertificate* child;

+ (id) crtRelationshipWithRelationshipID: (NSInteger)aRelationshipID error:(NSError **)errorPtr;
+ (id) crtRelationshipWithDictionary: (NSDictionary*) dictionary;
- (id) initWithRelationshipID: (NSInteger)aRelationshipID error:(NSError **)errorPtr;
- (id) initWithDictionary: (NSDictionary*) dictionary;

@end