//
//  EVEStarbaseList.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEStarbaseListItem : NSObject<NSCoding>
@property (nonatomic) int64_t itemID;
@property (nonatomic) int32_t typeID;
@property (nonatomic) int32_t locationID;
@property (nonatomic) int32_t moonID;
@property (nonatomic) EVEPOSState state;
@property (nonatomic, strong) NSDate *stateTimestamp;
@property (nonatomic, strong) NSDate *onlineTimestamp;

+ (id) starbaseListItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEStarbaseList : EVERequest
@property (nonatomic, strong) NSArray *starbases;

+ (id) starbaseListWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end