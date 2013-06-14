//
//  EVEDBCrtClass.h
//  EVEOnlineAPI
//
//  Created by Mr. Depth on 1/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EVEDBObject.h"

@interface EVEDBCrtClass : EVEDBObject
@property (nonatomic) NSInteger classID;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *className;

+ (id) crtClassWithClassID: (NSInteger)aClassID error:(NSError **)errorPtr;
- (id) initWithClassID: (NSInteger)aClassID error:(NSError **)errorPtr;

@end