//
//  EVECorpMedals.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVECorpMedalsItem : NSObject<NSCoding>
@property (nonatomic) int32_t medalID;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *description;
@property (nonatomic) int32_t creatorID;
@property (nonatomic, strong) NSDate *created;

+ (id) corpMedalsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVECorpMedals : EVERequest
@property (nonatomic, strong) NSArray *medals;

+ (id) corpMedalsWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end