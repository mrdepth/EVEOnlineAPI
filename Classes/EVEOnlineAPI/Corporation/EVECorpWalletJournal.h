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
@property (nonatomic) NSInteger refID;
@property (nonatomic) NSInteger refTypeID;
@property (nonatomic, copy) NSString *ownerName1;
@property (nonatomic) NSInteger ownerID1;
@property (nonatomic, copy) NSString *ownerName2;
@property (nonatomic) NSInteger ownerID2;
@property (nonatomic, copy) NSString *argName1;
@property (nonatomic) NSInteger argID1;
@property (nonatomic) float amount;
@property (nonatomic) float balance;
@property (nonatomic, copy) NSString *reason;

+ (id) corpWalletJournalItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVECorpWalletJournal : EVERequest
@property (nonatomic, strong) NSArray *corpWalletJournal;

+ (id) corpWalletJournalWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID accountKey: (NSInteger) accountKey fromID: (long long) fromID rowCount:(NSInteger) rowCount error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID accountKey: (NSInteger) accountKey fromID: (long long) fromID rowCount:(NSInteger) rowCount error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end
