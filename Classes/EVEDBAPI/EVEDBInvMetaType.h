//
//  EVEDBInvMetaType.h
//  Neocom
//
//  Created by Артем Шиманский on 13.05.14.
//  Copyright (c) 2014 Artem Shimanski. All rights reserved.
//

#import "EVEDBObject.h"

@interface EVEDBInvMetaType : EVEDBObject
@property (nonatomic) int32_t typeID;
@property (nonatomic) int32_t parentTypeID;
@property (nonatomic) int32_t metaGroupID;
@end
