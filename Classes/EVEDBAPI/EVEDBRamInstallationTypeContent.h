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
@property (nonatomic) int32_t installationTypeID;
@property (nonatomic, strong) EVEDBInvType* installationType;
@property (nonatomic) int32_t assemblyLineTypeID;
@property (nonatomic, strong) EVEDBRamAssemblyLineType* assemblyLineType;
@property (nonatomic) int32_t quantity;

@end