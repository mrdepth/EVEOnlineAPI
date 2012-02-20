//
//  EVEOutpostServiceDetail.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEOutpostServiceDetailItem : NSObject {
	NSInteger stationID;
	NSInteger ownerID;
	NSString *serviceName;
	float minStanding;
	float surchargePerBadStanding;
	float discountPerGoodStanding;
}
@property (nonatomic) NSInteger stationID;
@property (nonatomic) NSInteger ownerID;
@property (nonatomic, copy) NSString *serviceName;
@property (nonatomic) float minStanding;
@property (nonatomic) float surchargePerBadStanding;
@property (nonatomic) float discountPerGoodStanding;

+ (id) outpostServiceDetailItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEOutpostServiceDetail : EVERequest {
	NSMutableArray *outpostServiceDetails;
}
@property (nonatomic, retain) NSArray *outpostServiceDetails;

+ (id) outpostServiceDetailWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID itemID:(long long) itemID error:(NSError **)errorPtr;
+ (id) outpostServiceDetailWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID itemID:(long long) itemID target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID itemID:(long long) itemID error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID itemID:(long long) itemID target:(id)target action:(SEL)action object:(id)object;

@end
