//
//  EVECharacterID.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVECharacterIDItem : EVEObject
@property (nonatomic) int32_t characterID;
@property (nonatomic, copy) NSString *name;
@end


@interface EVECharacterID : EVEResult
@property (nonatomic, strong) NSArray *characters;
@end