//
//  EVELocations.h
//  EVEOnlineAPI
//
//  Created by Mr. Depth on 2/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVELocationsItem : EVEObject
@property (nonatomic) int64_t itemID;
@property (nonatomic, strong) NSString* itemName;
@property (nonatomic) float x;
@property (nonatomic) float y;
@property (nonatomic) float z;
@end



@interface EVELocations : EVEResult
@property (nonatomic, strong) NSArray *locations;
@end
