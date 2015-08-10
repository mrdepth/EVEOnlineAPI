//
//  EVEOutpostServiceDetail.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVEOutpostServiceDetailItem : EVEObject
@property (nonatomic) int32_t stationID;
@property (nonatomic) int32_t ownerID;
@property (nonatomic, strong) NSString *serviceName;
@property (nonatomic) float minStanding;
@property (nonatomic) float surchargePerBadStanding;
@property (nonatomic) float discountPerGoodStanding;
@end

@interface EVEOutpostServiceDetail : EVEResult
@property (nonatomic, strong) NSArray *outpostServiceDetails;
@end
