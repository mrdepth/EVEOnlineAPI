//
//  EVECharacterName.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVECharacterNameItem : NSObject<NSCoding>
@property (nonatomic) NSInteger characterID;
@property (nonatomic, copy) NSString *name;

+ (id) characterNameItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVECharacterName : EVERequest
@property (nonatomic, strong) NSDictionary *characters;

+ (id) characterNameWithIDs:(NSArray*) ids cachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithIDs:(NSArray*) ids cachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
@end