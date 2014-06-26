//
//  EVEDBCertSkill.m
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 22.01.14.
//
//

#import "EVEDBCertSkill.h"
#import "EVEDBDatabase.h"
#import "EVEDBInvType.h"

@interface EVEDBCertSkill()
@property (nonatomic, strong, readwrite) EVEDBInvType* skill;
@end


@implementation EVEDBCertSkill

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"certID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"certificateID"},
				@"skillID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"skillID"},
				@"certLevelInt" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"certificateLevel"},
				@"skillLevel" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"skillLevel"},
				@"certLevelText" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"certificateLevelText"}
				};
	
	return map;
}

- (EVEDBInvType*) skill {
	if (self.skillID == 0)
		return nil;
	if (!_skill) {
		_skill = [EVEDBInvType invTypeWithTypeID:self.skillID error:nil];
		if (!_skill)
			_skill = (EVEDBInvType*) [NSNull null];
	}
	if ((NSNull*) _skill == [NSNull null])
		return nil;
	else
		return _skill;
}

@end