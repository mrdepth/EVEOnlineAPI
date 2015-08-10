//
//  EVEResearch.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVEResearchItem : EVEObject
@property (nonatomic) int32_t agentID;
@property (nonatomic) int32_t skillTypeID;
@property (nonatomic, strong) NSDate *researchStartDate;
@property (nonatomic) float pointsPerDay;
@property (nonatomic) float remainderPoints;
@end

@interface EVEResearch : EVEResult
@property (nonatomic, strong) NSArray *research;
@end
