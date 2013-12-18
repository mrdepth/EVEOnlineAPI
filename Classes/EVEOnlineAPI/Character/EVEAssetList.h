//
//  EVEAssetList.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEAssetListItem : NSObject<NSCoding>
@property (nonatomic) long long itemID;
@property (nonatomic) long long locationID;
@property (nonatomic) NSInteger typeID;
@property (nonatomic) NSInteger quantity;
@property (nonatomic) EVEInventoryFlag flag;
@property (nonatomic) BOOL singleton;
@property (nonatomic, strong) NSMutableArray *contents;

+ (id) assetListItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end



@interface EVEAssetList : EVERequest
@property (nonatomic, strong) NSArray *assets;

+ (id) assetListWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end
