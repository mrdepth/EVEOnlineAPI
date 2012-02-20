//
//  EVECharWalletTransactions.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVECharWalletTransactionsItem : NSObject {
	NSDate *transactionDateTime;
	NSInteger transactionID;
	NSInteger quantity;
	NSString *typeName;
	NSInteger typeID;
	float price;
	NSInteger clientID;
	NSString *clientName;
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
@property (nonatomic) NSInteger stationID;
@property (nonatomic, copy) NSString *stationName;
@property (nonatomic, copy) NSString *transactionType;
@property (nonatomic, copy) NSString *transactionFor;

+ (id) charWalletTransactionsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVECharWalletTransactions : EVERequest {
	NSMutableArray *transactions;
}
@property (nonatomic, retain) NSArray *transactions;

+ (id) charWalletTransactionsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID beforeTransID: (NSInteger) beforeTransID error:(NSError **)errorPtr;
+ (id) charWalletTransactionsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID beforeTransID: (NSInteger) beforeTransID target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID beforeTransID: (NSInteger) beforeTransID error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID beforeTransID: (NSInteger) beforeTransID target:(id)target action:(SEL)action object:(id)object;

@end