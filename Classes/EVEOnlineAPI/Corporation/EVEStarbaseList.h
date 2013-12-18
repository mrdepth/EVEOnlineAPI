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
@property (nonatomic) long long itemID;
@property (nonatomic) NSInteger typeID;
@property (nonatomic) long long locationID;
@property (nonatomic) NSInteger moonID;
@property (nonatomic) EVEPOSState state;
@property (nonatomic, strong) NSDate *stateTimestamp;
@property (nonatomic, strong) NSDate *onlineTimestamp;

+ (id) starbaseListItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEStarbaseList : EVERequest
@property (nonatomic, strong) NSArray *starbases;

+ (id) starbaseListWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end