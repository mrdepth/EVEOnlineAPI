//
//  EVEDBInvTrait.m
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 11.04.14.
//
//

#import "EVEDBInvTrait.h"
#import "EVEDBInvType.h"
#import "EVEDBEveUnit.h"

@interface EVEDBInvTrait()
@property (nonatomic, strong, readwrite) EVEDBInvType* skill;
@property (nonatomic, strong, readwrite) EVEDBEveUnit* unit;
@end


@implementation EVEDBInvTrait

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"typeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"typeID"},
				@"skillID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"skillID"},
				@"bonus" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"bonus"},
				@"bonusText" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"bonusText"},
				@"unitID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"unitID"}
				};
	
	return map;
}

- (EVEDBInvType*) skill {
	if (self.skillID <= 0)
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

- (EVEDBEveUnit*) unit {
	if (self.unitID == 0)
		return nil;
	if (!_unit) {
		_unit = [EVEDBEveUnit eveUnitWithUnitID:self.unitID error:nil];
		if (!_unit)
			_unit = (EVEDBEveUnit*) [NSNull null];
	}
	if ((NSNull*) _unit == [NSNull null])
		return nil;
	else
		return _unit;
}

@end