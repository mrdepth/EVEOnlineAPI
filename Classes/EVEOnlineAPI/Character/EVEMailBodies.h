//
//  EVEMailBodies.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVEMailBodiesItem : EVEObject
@property (nonatomic) int32_t messageID;
@property (nonatomic, copy) NSString *text;
@end

@interface EVEMailBodies : EVEResult
@property (nonatomic, strong) NSArray *messages;
@property (nonatomic, strong) NSArray *missingMessageIDs;
@end