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
@property (nonatomic) int64_t itemID;
@property (nonatomic) int32_t locationID;
@property (nonatomic) int32_t typeID;
@property (nonatomic) int32_t quantity;
@property (nonatomic) EVEInventoryFlag flag;
@property (nonatomic) BOOL singleton;
@property (nonatomic, strong) NSMutableArray *contents;
@property (nonatomic, weak) EVEAssetListItem* parent;

+ (id) assetListItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end



@interface EVEAssetList : EVERequest
@property (nonatomic, strong) NSArray *assets;

+ (id) assetListWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end
