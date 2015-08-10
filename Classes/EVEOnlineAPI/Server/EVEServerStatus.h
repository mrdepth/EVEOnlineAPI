//
//  EVEServerStatus.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVEServerStatus : EVEResult
@property (nonatomic) BOOL serverOpen;
@property (nonatomic) int32_t onlinePlayers;
@end