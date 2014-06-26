//
//  EVEDBInvTrait.h
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 11.04.14.
//
//

#import "EVEDBObject.h"

@class EVEDBInvType;
@class EVEDBEveUnit;
@interface EVEDBInvTrait : EVEDBObject

@property (nonatomic) int32_t typeID;
@property (nonatomic) int32_t skillID;
@property (nonatomic, strong, readonly) EVEDBInvType* skill;
@property (nonatomic) int32_t bonus;
@property (nonatomic, strong) NSString* bonusText;
@property (nonatomic) int32_t unitID;
@property (nonatomic, strong, readonly) EVEDBEveUnit* unit;

@end