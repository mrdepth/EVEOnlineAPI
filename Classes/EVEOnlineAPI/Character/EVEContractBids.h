//
//  EVEContractBids.h
//  EVEOnlineAPI
//
//  Created by Shimanski on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEContractBidsItem : NSObject {
	long long bidID;
	NSInteger contractID;
	NSInteger bidderID;
	NSDate *dateBid;
	float amount;
}
@property (nonatomic) long long bidID;
@property (nonatomic) NSInteger contractID;
@property (nonatomic) NSInteger bidderID;
@property (nonatomic, retain) NSDate *dateBid;
@property (nonatomic) float amount;

+ (id) contractBidsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEContractBids : EVERequest {
	NSMutableArray *bidList;
}
@property (nonatomic, retain) NSArray *bidList;

+ (id) contractBidsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr;
+ (id) contractBidsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate target:(id)target action:(SEL)action object:(id)object;
@end
