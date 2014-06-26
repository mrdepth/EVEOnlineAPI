//
//  EVEMailMessages.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEMailMessagesItem : NSObject<NSCoding>
@property (nonatomic) int32_t messageID;
@property (nonatomic) int32_t senderID;
@property (nonatomic, strong) NSDate *sentDate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic) int32_t toCorpOrAllianceID;
@property (nonatomic, strong) NSArray *toCharacterIDs;
@property (nonatomic, strong) NSArray *toListID;
@property (nonatomic) BOOL read;
@property (nonatomic, assign) int32_t senderTypeID;

+ (id) mailMessagesItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEMailMessages : EVERequest
@property (nonatomic, strong) NSArray *mailMessages;

+ (id) mailMessagesWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end
