//
//  EVEOwnerID.h
//  Neocom
//
//  Created by Артем Шиманский on 28.03.14.
//  Copyright (c) 2014 Artem Shimanski. All rights reserved.
//

#import "EVEResult.h"

typedef NS_ENUM(int32_t, EVEOwnerGroup) {
	EVEOwnerGroupCharacter = 1,
	EVEOwnerGroupCorporation = 2,
	EVEOwnerGroupFaction = 19,
	EVEOwnerGroupAlliance = 32
};

@interface EVEOwnerIDItem : EVEObject
@property (nonatomic) int32_t ownerID;
@property (nonatomic, copy) NSString* ownerName;
@property (nonatomic) EVEOwnerGroup ownerGroupID;
@end

@interface EVEOwnerID : EVEResult
@property (nonatomic, strong) NSArray *owners;
@end
