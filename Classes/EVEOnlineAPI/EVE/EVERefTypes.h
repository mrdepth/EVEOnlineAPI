//
//  EVERefTypes.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVERefTypesItem : NSObject
@property (nonatomic) NSInteger refTypeID;
@property (nonatomic, copy) NSString *refTypeName;

+ (id) refTypesItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVERefTypes : EVERequest
@property (nonatomic, strong) NSArray *refTypes;

+ (id) refTypesWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;
- (id) initWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;
@end