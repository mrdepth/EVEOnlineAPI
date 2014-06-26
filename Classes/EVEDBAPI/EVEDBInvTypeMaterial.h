//
//  EVEDBInvTypeMaterial.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 13.08.12.
//
//

#import "EVEDBObject.h"

@class EVEDBInvType;
@interface EVEDBInvTypeMaterial : EVEDBObject
@property (nonatomic) int32_t typeID;
@property (nonatomic, strong) EVEDBInvType* type;
@property (nonatomic) int32_t materialTypeID;
@property (nonatomic, strong) EVEDBInvType* materialType;
@property (nonatomic) int32_t quantity;

@end
