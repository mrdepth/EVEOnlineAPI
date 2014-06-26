//
//  EVECorpWalletJournal.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVECorpWalletJournalItem : NSObject<NSCoding>
@property (nonatomic, strong) NSDate *date;
@property (nonatomic) int64_t refID;
@property (nonatomic) int32_t refTypeID;
@property (nonatomic, copy) NSString *ownerName1;
@property (nonatomic) int32_t ownerID1;
@property (nonatomic, copy) NSString *ownerName2;
@property (nonatomic) int32_t ownerID2;
@property (nonatomic, copy) NSString *argName1;
@property (nonatomic) int32_t argID1;
@property (nonatomic) float amount;
@property (nonatomic) float balance;
@property (nonatomic, copy) NSString *reason;

+ (id) corpWalletJournalItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVECorpWalletJournal : EVERequest
@property (nonatomic, strong) NSArray *corpWalletJournal;

+ (id) corpWalletJournalWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID accountKey: (int32_t) accountKey fromID: (int64_t) fromID rowCount:(int32_t) rowCount error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID accountKey: (int32_t) accountKey fromID: (int64_t) fromID rowCount:(int32_t) rowCount error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end
