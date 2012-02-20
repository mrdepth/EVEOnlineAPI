//
//  EVEKills.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEKillsItem : NSObject {
	NSInteger solarSystemID;
	NSInteger shipKills;
	NSInteger factionKills;
	NSInteger podKills;
}
@property (nonatomic) NSInteger solarSystemID;
@property (nonatomic) NSInteger shipKills;
@property (nonatomic) NSInteger factionKills;
@property (nonatomic) NSInteger podKills;

+ (id) killsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEKills : EVERequest {
	NSMutableArray *solarSystems;
}
@property (nonatomic, retain) NSArray *solarSystems;

+ (id) killsWithError:(NSError **)errorPtr;
+ (id) killsWithTarget:(id)target action:(SEL)action object:(id)object;
- (id) initWithError:(NSError **)errorPtr;
- (id) initWithTarget:(id)target action:(SEL)action object:(id)object;
@end