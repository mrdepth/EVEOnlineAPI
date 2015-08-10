//
//  EVESovereignty.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVESovereigntyItem : EVEObject
@property (nonatomic) int32_t solarSystemID;
@property (nonatomic) int32_t allianceID;
@property (nonatomic) int32_t factionID;
@property (nonatomic, strong) NSString *solarSystemName;
@property (nonatomic) int32_t corporationID;
@end


@interface EVESovereignty : EVEResult
@property (nonatomic, strong) NSArray *solarSystems;
@end