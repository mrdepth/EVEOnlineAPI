//
//  EVEStarbaseList.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEStarbaseListItem : NSObject {
	long long itemID;
	NSInteger typeID;
	long long locationID;
	NSInteger moonID;
	EVEPOSState state;
	NSDate *stateTimestamp;
	NSDate *onlineTimestamp;
}
@property (nonatomic) long long itemID;
@property (nonatomic) NSInteger typeID;
@property (nonatomic) long long locationID;
@property (nonatomic) NSInteger moonID;
@property (nonatomic) EVEPOSState state;
@property (nonatomic, retain) NSDate *stateTimestamp;
@property (nonatomic, retain) NSDate *onlineTimestamp;

+ (id) starbaseListItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEStarbaseList : EVERequest {
	NSMutableArray *starbases;
}
@property (nonatomic, retain) NSArray *starbases;

+ (id) starbaseListWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
+ (id) starbaseListWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;

@end