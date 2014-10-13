//
//  EVEDBInvMetaGroup.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 17.06.13.
//
//

#import "EVEDBInvMetaGroup.h"
#import "EVEDBEveIcon.h"

@implementation EVEDBInvMetaGroup
@synthesize description = _description;

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"metaGroupID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"metaGroupID"},
		  @"metaGroupName" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"metaGroupName"},
		  @"description" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"description"},
		  @"iconID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"iconID"}
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
