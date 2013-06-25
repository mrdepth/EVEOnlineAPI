//
//  EVEResearch.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEResearchItem : NSObject
@property (nonatomic) NSInteger agentID;
@property (nonatomic) NSInteger skillTypeID;
@property (nonatomic, strong) NSDate *researchStartDate;
@property (nonatomic) float pointsPerDay;
@property (nonatomic) float remainderPoints;

+ (id) researchItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEResearch : EVERequest
@property (nonatomic, strong) NSArray *research;

+ (id) researchWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;

@end
