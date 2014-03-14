//
//  EVEDBDgmTypeAttribute.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEDBObject.h"

@class EVEDBDgmAttributeType;
@interface EVEDBDgmTypeAttribute : EVEDBObject
@property (nonatomic) int32_t typeID;
@property (nonatomic) int32_t attributeID;
@property (nonatomic, strong) EVEDBDgmAttributeType *attribute;
@property (nonatomic) float value;

@end
