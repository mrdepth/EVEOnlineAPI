//
//  EVEAPIKeyInfo.h
//  EVEOnlineAPI
//
//  Created by Shimanski on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEAPIKeyInfoCharactersItem : NSObject
@property (nonatomic) NSInteger characterID;
@property (nonatomic, copy) NSString *characterName;
@property (nonatomic) NSInteger corporationID;
@property (nonatomic, copy) NSString *corporationName;

+ (id) charactersItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEAPIKeyInfoKey : NSObject
@property (nonatomic) NSInteger accessMask;
@property (nonatomic) EVEAPIKeyType type;
@property (nonatomic, strong) NSDate *expires;

+ (id) keyWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end



@interface EVEAPIKeyInfo : EVERequest
@property (nonatomic, strong) EVEAPIKeyInfoKey *key;
@property (nonatomic, strong) NSArray *characters;

+ (id) apiKeyInfoWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;

@end
