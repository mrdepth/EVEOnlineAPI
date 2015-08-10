//
//  EVECharacterName.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECharacterID.h"

@interface EVECharacterName : EVEResult
@property (nonatomic, strong) NSArray *characters;
@end