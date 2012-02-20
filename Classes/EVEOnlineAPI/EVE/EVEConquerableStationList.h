//
//  EVEConquerableStationList.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEConquerableStationListItem : NSObject {
	NSInteger stationID;
	NSString *stationName;
	NSInteger stationTypeID;
	NSInteger solarSystemID;
	NSInteger corporationID;
	NSString *corporationName;
}
@property (nonatomic) NSInteger stationID;
@property (nonatomic, copy) NSString *stationName;
@property (nonatomic) NSInteger stationTypeID;
@property (nonatomic) NSInteger solarSystemID;
@property (nonatomic) NSInteger corporationID;
@property (nonatomic, copy) NSString *corporationName;

+ (id) conquerableStationListItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEConquerableStationList : EVERequest {
	NSMutableArray *outposts;
}
@property (nonatomic, retain) NSArray *outposts;

+ (id) conquerableStationListWithError:(NSError **)errorPtr;
+ (id) conquerableStationListWithTarget:(id)target action:(SEL)action object:(id)object;
- (id) initWithError:(NSError **)errorPtr;
- (id) initWithTarget:(id)target action:(SEL)action object:(id)object;
@end