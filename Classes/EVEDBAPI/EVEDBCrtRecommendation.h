//
//  EVEDBCrtRecommendation.h
//  EVEOnlineAPI
//
//  Created by Mr. Depth on 1/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EVEDBObject.h"

@class EVEDBCrtCertificate;
@class EVEDBInvType;
@interface EVEDBCrtRecommendation : EVEDBObject
@property (nonatomic) int32_t recommendationID;
@property (nonatomic) int32_t shipTypeID;
@property (nonatomic, readonly, strong) EVEDBInvType* shipType;
@property (nonatomic) int32_t certificateID;
@property (nonatomic, readonly, strong) EVEDBCrtCertificate* certificate;
@property (nonatomic) int32_t recommendationLevel;

+ (id) crtRecommendationWithRecommendationID: (int32_t)aRecommendationID error:(NSError **)errorPtr;
- (id) initWithRecommendationID: (int32_t)aRecommendationID error:(NSError **)errorPtr;

@end