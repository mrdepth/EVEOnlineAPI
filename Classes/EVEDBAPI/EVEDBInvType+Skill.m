//
//  EVEDBInvTypeSkill.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 3/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEDBInvType+Skill.h"
#import "EVEDBDgmTypeAttribute.h"

@implementation EVEDBInvType(Skill)

- (float) skillPointsAtLevel:(NSInteger) level {
	if (level == 0)
		return 0;
	EVEDBDgmTypeAttribute *rank = self.attributesDictionary[@(275)];
	float sp = pow(2, 2.5 * level - 2.5) * 250 * rank.value;
	return sp;
}

@end
