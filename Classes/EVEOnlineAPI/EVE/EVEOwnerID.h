//
//  EVEOwnerID.h
//  Neocom
//
//  Created by Артем Шиманский on 28.03.14.
//  Copyright (c) 2014 Artem Shimanski. All rights reserved.
//

#import "EVERequest.h"

typedef NS_ENUM(int32_t, EVEOwnerGroup) {
	EVEOwnerGroupCharacter = 1,
	EVEOwnerGroupCorporation = 2,
	EVEOwnerGroupFaction = 19,
	EVEOwnerGroupAlliance = 32
};

@interface EVEOwnerIDItem : NSObject<NSCoding>
@property (nonatomic) int32_t ownerID;
@property (nonatomic, copy) NSString* ownerName;
@property (nonatomic) EVEOwnerGroup ownerGroupID;

+ (id) ownerIDItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEOwnerID : EVERequest
@property (nonatomic, strong) NSArray *owners;

+ (id) ownerIDWithNames:(NSArray*) names cachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithNames:(NSArray*) names cachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end
