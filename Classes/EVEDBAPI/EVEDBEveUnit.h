//
//  EVEDBEveUnit.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEDBObject.h"


@interface EVEDBEveUnit : EVEDBObject
@property (nonatomic) NSInteger unitID;
@property (nonatomic, strong) NSString *unitName;
@property (nonatomic, strong) NSString *displayName;
@property (nonatomic, strong) NSString *description;

+ (id) eveUnitWithUnitID: (NSInteger)aUnitID error:(NSError **)errorPtr;
- (id) initWithUnitID: (NSInteger)aUnitID error:(NSError **)errorPtr;

@end
