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
@property (nonatomic) NSInteger recommendationID;
@property (nonatomic) NSInteger shipTypeID;
@property (nonatomic, readonly, strong) EVEDBInvType* shipType;
@property (nonatomic) NSInteger certificateID;
@property (nonatomic, readonly, strong) EVEDBCrtCertificate* certificate;
@property (nonatomic) NSInteger recommendationLevel;

+ (id) crtRecommendationWithRecommendationID: (NSInteger)aRecommendationID error:(NSError **)errorPtr;
- (id) initWithRecommendationID: (NSInteger)aRecommendationID error:(NSError **)errorPtr;

@end