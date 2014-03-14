//
//  EVEDBDgmTypeEffect.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 4/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEDBObject.h"

@class EVEDBInvType;
@class EVEDBDgmEffect;
@interface EVEDBDgmTypeEffect : EVEDBObject
@property(nonatomic) int32_t typeID;
@property(nonatomic) int32_t effectID;
@property(nonatomic, strong) EVEDBDgmEffect *effect;
@property(nonatomic) BOOL isDefault;

@end
