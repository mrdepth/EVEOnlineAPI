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
@property (nonatomic) NSInteger typeID;
@property (nonatomic, strong) EVEDBInvType* type;
@property (nonatomic) NSInteger materialTypeID;
@property (nonatomic, strong) EVEDBInvType* materialType;
@property (nonatomic) NSInteger quantity;

@end
