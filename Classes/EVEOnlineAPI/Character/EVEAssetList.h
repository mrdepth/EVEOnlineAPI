//
//  EVEAssetList.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVEAssetListItem : EVEObject
@property (nonatomic) int64_t itemID;
@property (nonatomic) int64_t locationID;
@property (nonatomic) int32_t typeID;
@property (nonatomic) int32_t quantity;
@property (nonatomic) int32_t rawQuantity;
@property (nonatomic) EVEInventoryFlag flag;
@property (nonatomic) BOOL singleton;
@property (nonatomic, strong) NSArray *contents;
@property (nonatomic, weak) EVEAssetListItem* parent;

@end



@interface EVEAssetList : EVEResult
@property (nonatomic, strong) NSArray *assets;
@end
