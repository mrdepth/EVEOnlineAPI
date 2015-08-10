//
//  EVEBlueprints.h
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 10.08.15.
//
//

#import "EVEResult.h"
#import "EVEGlobals.h"

@interface EVEBlueprintsItem : EVEObject
@property (nonatomic) int64_t itemID;
@property (nonatomic) int64_t locationID;
@property (nonatomic) int32_t typeID;
@property (nonatomic, strong) NSString* typeName;
@property (nonatomic) EVEInventoryFlag flag;
@property (nonatomic) int32_t quantity;
@property (nonatomic) int32_t timeEfficiency;
@property (nonatomic) int32_t materialEfficiency;
@property (nonatomic) int32_t runs;
@end

@interface EVEBlueprints : EVEResult
@property (nonatomic, strong) NSArray *blueprints;

@end
