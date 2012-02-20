//
//  EVEDBCrtRecommendation.h
//  EVEOnlineAPI
//
//  Created by Mr. Depth on 1/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EVEDBCrtCertificate;
@class EVEDBInvType;
@interface EVEDBCrtRecommendation : NSObject {
	NSInteger recommendationID;
	NSInteger shipTypeID;
	EVEDBInvType* shipType;
	NSInteger certificateID;
	EVEDBCrtCertificate* certificate;
	NSInteger recommendationLevel;
}
@property (nonatomic) NSInteger recommendationID;
@property (nonatomic) NSInteger shipTypeID;
@property (nonatomic, retain) EVEDBInvType* shipType;
@property (nonatomic) NSInteger certificateID;
@property (nonatomic, retain) EVEDBCrtCertificate* certificate;
@property (nonatomic) NSInteger recommendationLevel;

+ (id) crtRecommendationWithRecommendationID: (NSInteger)aRecommendationID error:(NSError **)errorPtr;
+ (id) crtRecommendationWithDictionary: (NSDictionary*) dictionary;
- (id) initWithRecommendationID: (NSInteger)aRecommendationID error:(NSError **)errorPtr;
- (id) initWithDictionary: (NSDictionary*) dictionary;

@end