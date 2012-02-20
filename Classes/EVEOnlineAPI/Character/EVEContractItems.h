//
//  EVEContractItems.h
//  EVEOnlineAPI
//
//  Created by Shimanski on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEContractItemsItem : NSObject {
	long long recordID;
	NSInteger typeID;
	NSInteger quantity;
	NSInteger rawQuantity;
	BOOL singleton;
	BOOL included;
}
@property (nonatomic) long long recordID;
@property (nonatomic) NSInteger typeID;
@property (nonatomic) NSInteger quantity;
@property (nonatomic) NSInteger rawQuantity;
@property (nonatomic) BOOL singleton;
@property (nonatomic) BOOL included;

+ (id) contractItemsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEContractItems : EVERequest {
	NSMutableArray *itemList;
}
@property (nonatomic, retain) NSArray *itemList;

+ (id) contractItemsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID contractID:(long long) contractID corporate: (BOOL) corporate error:(NSError **)errorPtr;
+ (id) contractItemsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID contractID:(long long) contractID corporate: (BOOL) corporate target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID contractID:(long long) contractID corporate: (BOOL) corporate error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID contractID:(long long) contractID corporate: (BOOL) corporate target:(id)target action:(SEL)action object:(id)object;
@end
