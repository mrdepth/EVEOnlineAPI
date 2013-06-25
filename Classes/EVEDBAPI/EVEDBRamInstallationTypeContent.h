//
//  EVEDBRamInstallationTypeContent.h
//  EVEOnlineAPI
//
//  Created by Mr. Depth on 3/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EVEDBObject.h"

@class EVEDBInvType;
@class EVEDBRamAssemblyLineType;
@interface EVEDBRamInstallationTypeContent : EVEDBObject
@property (nonatomic) NSInteger installationTypeID;
@property (nonatomic, strong) EVEDBInvType* installationType;
@property (nonatomic) NSInteger assemblyLineTypeID;
@property (nonatomic, strong) EVEDBRamAssemblyLineType* assemblyLineType;
@property (nonatomic) NSInteger quantity;

@end