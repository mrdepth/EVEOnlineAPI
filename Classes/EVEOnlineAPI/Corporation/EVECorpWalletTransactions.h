//
//  EVECorpWalletTransactions.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVECorpWalletTransactionsItem : NSObject {
	NSDate *transactionDateTime;
	NSInteger transactionID;
	NSInteger quantity;
	NSString *typeName;
	NSInteger typeID;
	float price;
	NSInteger clientID;
	NSString *clientName;
	NSInteger characterID;
	NSString *characterName;
	NSInteger stationID;
	NSString *stationName;
	NSString *transactionType;
	NSString *transactionFor;
}
@property (nonatomic, retain) NSDate *transactionDateTime;
@property (nonatomic) NSInteger transactionID;
@property (nonatomic) NSInteger quantity;
@property (nonatomic, copy) NSString *typeName;
@property (nonatomic) NSInteger typeID;
@property (nonatomic) float price;
@property (nonatomic) NSInteger clientID;
@property (nonatomic, copy) NSString *clientName;
@property (nonatomic) NSInteger characterID;
@property (nonatomic, copy) NSString *characterName;
@property (nonatomic) NSInteger stationID;
@property (nonatomic, copy) NSString *stationName;
@property (nonatomic, copy) NSString *transactionType;
@property (nonatomic, copy) NSString *transactionFor;

+ (id) corpWalletTransactionsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVECorpWalletTransactions : EVERequest {
	NSMutableArray *transactions;
}
@property (nonatomic, retain) NSArray *transactions;

+ (id) corpWalletTransactionsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID beforeTransID: (NSInteger) beforeTransID accountKey: (NSInteger) accountKey error:(NSError **)errorPtr;
+ (id) corpWalletTransactionsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID beforeTransID: (NSInteger) beforeTransID accountKey: (NSInteger) accountKey target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID beforeTransID: (NSInteger) beforeTransID accountKey: (NSInteger) accountKey error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID beforeTransID: (NSInteger) beforeTransID accountKey: (NSInteger) accountKey target:(id)target action:(SEL)action object:(id)object;

@end