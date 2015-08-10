//
//  EVEJumps.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVEJumpsItem : EVEObject
@property (nonatomic) int32_t solarSystemID;
@property (nonatomic) int32_t shipJumps;
@end


@interface EVEJumps : EVEResult
@property (nonatomic, strong) NSArray *solarSystems;
@end