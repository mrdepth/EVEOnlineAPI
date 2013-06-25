//
//  EVEJumps.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEJumpsItem : NSObject
@property (nonatomic) NSInteger solarSystemID;
@property (nonatomic) NSInteger shipJumps;

+ (id) jumpsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEJumps : EVERequest
@property (nonatomic, strong) NSArray *solarSystems;

+ (id) jumpsWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;
- (id) initWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;
@end