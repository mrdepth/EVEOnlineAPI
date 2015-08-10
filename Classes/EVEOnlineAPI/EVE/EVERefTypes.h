//
//  EVERefTypes.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVERefTypesItem : EVEObject
@property (nonatomic) int32_t refTypeID;
@property (nonatomic, copy) NSString *refTypeName;
@end


@interface EVERefTypes : EVEResult
@property (nonatomic, strong) NSArray *refTypes;
@end