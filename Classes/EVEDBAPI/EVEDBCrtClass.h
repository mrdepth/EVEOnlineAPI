//
//  EVEDBCrtClass.h
//  EVEOnlineAPI
//
//  Created by Mr. Depth on 1/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EVEDBObject.h"

@interface EVEDBCrtClass : EVEDBObject
@property (nonatomic) int32_t classID;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *className;

+ (id) crtClassWithClassID: (int32_t)aClassID error:(NSError **)errorPtr;
- (id) initWithClassID: (int32_t)aClassID error:(NSError **)errorPtr;

@end