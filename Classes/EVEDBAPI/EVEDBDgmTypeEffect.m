//
//  EVEDBDgmTypeEffect.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 4/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEDBDgmTypeEffect.h"
#import "EVEDBDgmEffect.h"
#import "EVEDBInvType.h"

@implementation EVEDBDgmTypeEffect

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"typeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"typeID"},
		  @"effectID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"effectID"},
		  @"isDefault" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"isDefault"}
		  };
	return map;
}

- (EVEDBDgmEffect*) effect {
	if (self.effectID == 0)
		return NULL;
	if (!_effect) {
		_effect = [EVEDBDgmEffect dgmEffectWithEffectID:self.effectID error:nil];
		if (!_effect)
			_effect = (EVEDBDgmEffect*) [NSNull null];
	}
	if ((NSNull*) _effect == [NSNull null])
		return NULL;
	else
		return _effect;
}

@end