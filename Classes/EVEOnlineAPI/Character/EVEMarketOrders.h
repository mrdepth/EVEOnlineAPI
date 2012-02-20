//
//  EVEMarketOrders.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEMarketOrdersItem : NSObject {
	NSInteger orderID;
	NSInteger charID;
	NSInteger stationID;
	NSInteger volEntered;
	NSInteger volRemaining;
	NSInteger minVolume;
	EVEOrderState orderState;
	NSInteger typeID;
	NSInteger range;
	NSInteger accountKey;
	NSInteger duration;
	float escrow;
	float price;
	BOOL bid;
	NSDate *issued;
}
@property (nonatomic) NSInteger orderID;
@property (nonatomic) NSInteger charID;
@property (nonatomic) NSInteger stationID;
@property (nonatomic) NSInteger volEntered;
@property (nonatomic) NSInteger volRemaining;
@property (nonatomic) NSInteger minVolume;
@property (nonatomic) EVEOrderState orderState;
@property (nonatomic) NSInteger typeID;
@property (nonatomic) NSInteger range;
@property (nonatomic) NSInteger accountKey;
@property (nonatomic) NSInteger duration;
@property (nonatomic) float escrow;
@property (nonatomic) float price;
@property (nonatomic) BOOL bid;
@property (nonatomic, retain) NSDate *issued;

+ (id) marketOrdersItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEMarketOrders : EVERequest {
	NSMutableArray *orders;
}
@property (nonatomic, retain) NSArray *orders;

+ (id) marketOrdersWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr;
+ (id) marketOrdersWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate target:(id)target action:(SEL)action object:(id)object;

@end

