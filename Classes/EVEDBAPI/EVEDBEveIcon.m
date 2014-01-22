//
//  EVEDBEveIcon.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEDBEveIcon.h"

@interface EVEDBEveIcon()
@property(nonatomic, strong, readwrite) NSString *iconImageName;
@end

@implementation EVEDBEveIcon

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"iconID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"iconID"},
		  @"iconFile" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"iconFile"},
		  @"description" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"description"}
		  };
	return map;
}

+ (id) eveIconWithIconID: (NSInteger)iconID error:(NSError **)errorPtr {
	return [[EVEDBEveIcon alloc] initWithIconID:iconID error:errorPtr];
}

- (id) initWithIconID: (NSInteger)iconID error:(NSError **)errorPtr {
	if (self = [super initWithSQLRequest:[NSString stringWithFormat:@"SELECT * from eveIcons WHERE iconID=%d;", iconID]
								   error:errorPtr]) {
	}
	return self;
}

- (NSString*) iconImageName {
	if (!_iconImageName) {
		if (!self.iconFile)
			_iconImageName = (NSString*) [NSNull null];
		else {
			if ([self.iconFile hasPrefix:@"res:/"])
				_iconImageName = [NSString stringWithFormat:@"Icons/%@", [self.iconFile lastPathComponent]];
			else
				_iconImageName = [NSString stringWithFormat:@"Icons/icon%@.png", self.iconFile];
		}
	}
	if ((NSNull*) _iconImageName == [NSNull null])
		return nil;
	else
		return _iconImageName;
}

@end
