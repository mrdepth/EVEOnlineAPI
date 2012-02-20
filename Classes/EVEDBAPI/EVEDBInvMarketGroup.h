//
//  EVEDBInvMarketGroup.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EVEDBEveIcon;
@interface EVEDBInvMarketGroup : NSObject {
	NSInteger marketGroupID;
	NSInteger parentGroupID;
	EVEDBInvMarketGroup *parentGroup;
	NSString *marketGroupName;
	NSString *description;
	NSInteger iconID;
	EVEDBEveIcon *icon;
	BOOL hasTypes;
}
@property (nonatomic) NSInteger marketGroupID;
@property (nonatomic) NSInteger parentGroupID;
@property (nonatomic, retain) EVEDBInvMarketGroup *parentGroup;
@property (nonatomic, retain) NSString *marketGroupName;
@property (nonatomic, retain) NSString *description;
@property (nonatomic) NSInteger iconID;
@property (nonatomic, retain) EVEDBEveIcon *icon;
@property (nonatomic) BOOL hasTypes;

+ (id) invMarketGroupWithMarketGroupID: (NSInteger)aMarketGroupID error:(NSError **)errorPtr;
+ (id) invMarketGroupWithDictionary: (NSDictionary*) dictionary;
- (id) initWithMarketGroupID: (NSInteger)aMarketGroupID error:(NSError **)errorPtr;
- (id) initWithDictionary: (NSDictionary*) dictionary;
@end
