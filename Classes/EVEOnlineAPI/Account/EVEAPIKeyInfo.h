//
//  EVEAPIKeyInfo.h
//  EVEOnlineAPI
//
//  Created by Shimanski on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEAPIKeyInfoCharactersItem : NSObject<NSCoding>
@property (nonatomic) int32_t characterID;
@property (nonatomic, copy) NSString *characterName;
@property (nonatomic) int32_t corporationID;
@property (nonatomic, copy) NSString *corporationName;

+ (id) charactersItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEAPIKeyInfoKey : NSObject<NSCoding>
@property (nonatomic) int32_t accessMask;
@property (nonatomic) EVEAPIKeyType type;
@property (nonatomic, strong) NSDate *expires;

+ (id) keyWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end



@interface EVEAPIKeyInfo : EVERequest
@property (nonatomic, strong) EVEAPIKeyInfoKey *key;
@property (nonatomic, strong) NSArray *characters;

+ (id) apiKeyInfoWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end
