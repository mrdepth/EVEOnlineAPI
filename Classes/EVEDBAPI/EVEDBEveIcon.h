//
//  EVEDBEveIcon.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEDBObject.h"


@interface EVEDBEveIcon : EVEDBObject
@property(nonatomic) NSInteger iconID;
@property(nonatomic, strong) NSString *iconFile;
@property(nonatomic, strong) NSString *description;
@property(nonatomic, strong, readonly) NSString *iconImageName;

+ (id) eveIconWithIconID: (NSInteger)aIconID error:(NSError **)errorPtr;
- (id) initWithIconID: (NSInteger)aIconID error:(NSError **)errorPtr;
@end