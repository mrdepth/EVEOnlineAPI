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
@property (nonatomic) NSInteger messageID;
@property (nonatomic) NSInteger senderID;
@property (nonatomic, strong) NSDate *sentDate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic) NSInteger toCorpOrAllianceID;
@property (nonatomic, strong) NSArray *toCharacterIDs;
@property (nonatomic, strong) NSArray *toListID;
@property (nonatomic) BOOL read;

+ (id) mailMessagesItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEMailMessages : EVERequest
@property (nonatomic, strong) NSArray *mailMessages;

+ (id) mailMessagesWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end
