//
//  EVEDBInvTypeSkill.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 3/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVEDBInvType.h"

@interface EVEDBInvType(Skill)

- (float) skillPointsAtLevel:(NSInteger) level;

@end
