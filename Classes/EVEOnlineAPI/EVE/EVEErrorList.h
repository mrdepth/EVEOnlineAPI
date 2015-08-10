//
//  EVEErrorList.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVEErrorListItem : EVEObject
@property (nonatomic) int32_t errorCode;
@property (nonatomic, copy) NSString *errorText;
@end


@interface EVEErrorList : EVEResult
@property (nonatomic, strong) NSArray *errors;
@end