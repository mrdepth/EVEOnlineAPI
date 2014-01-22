//
//  EVEDBRamInstallationTypeContent.m
//  EVEOnlineAPI
//
//  Created by Mr. Depth on 3/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EVEDBRamInstallationTypeContent.h"
#import "EVEDBRamAssemblyLineType.h"
#import "EVEDBInvType.h"


@implementation EVEDBRamInstallationTypeContent

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"installationTypeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"installationTypeID"},
		  @"assemblyLineTypeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"assemblyLineTypeID"},
		  @"quantity" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"quantity"}
		  };
	return map;
}

- (EVEDBInvType*) installationType {
	if (self.installationTypeID == 0)
		return nil;
	if (!_installationType) {
		_installationType = [EVEDBInvType invTypeWithTypeID:self.installationTypeID error:nil];
		if (!_installationType)
			_installationType = (EVEDBInvType*) [NSNull null];
	}
	if ((NSNull*) _installationType == [NSNull null])
		return nil;
	else
		return _installationType;
}

- (EVEDBRamAssemblyLineType*) assemblyLineType {
	if (self.assemblyLineTypeID == 0)
		return nil;
	if (!_assemblyLineType) {
		_assemblyLineType = [EVEDBRamAssemblyLineType ramAssemblyLineTypeWithAssemblyLineTypeID:self.assemblyLineTypeID error:nil];
		if (!_assemblyLineType)
			_assemblyLineType = (EVEDBRamAssemblyLineType*) [NSNull null];
	}
	if ((NSNull*) _assemblyLineType == [NSNull null])
		return nil;
	else
		return _assemblyLineType;
}

@end