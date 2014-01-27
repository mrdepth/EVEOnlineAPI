//
//  EVEDBNpcGroup.m
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 27.01.14.
//
//

#import "EVEDBNpcGroup.h"
#import "EVEDBDatabase.h"
#import "EVEDBEveIcon.h"

@implementation EVEDBNpcGroup

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"npcGroupID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"npcGroupID"},
				@"parentNpcGroupID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"parentNpcGroupID"},
				@"groupID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"groupID"},
				@"iconID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"iconID"},
				@"npcGroupName" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"npcGroupName"}
				};
	
	return map;
}

- (EVEDBEveIcon*) icon {
	if (self.iconID == 0)
		return nil;
	if (!_icon) {
		_icon = [EVEDBEveIcon eveIconWithIconID:self.iconID error:nil];
		if (!_icon)
			_icon = (EVEDBEveIcon*) [NSNull null];
	}
	if ((NSNull*) _icon == [NSNull null])
		return nil;
	else
		return _icon;
}
		
@end