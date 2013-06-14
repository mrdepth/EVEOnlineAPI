//
//  BCEveLoadoutsTags.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 5/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BCRequest.h"

@interface BCEveLoadoutsTags : BCRequest
@property (nonatomic, strong) NSArray *tags;

+ (id) eveLoadoutsTagsWithAPIKey:(NSString*) apiKey error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;
- (id) initWithAPIKey:(NSString*) apiKey error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;

@end
