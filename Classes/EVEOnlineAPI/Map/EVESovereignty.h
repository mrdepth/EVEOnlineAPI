//
//  EVESovereignty.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVESovereigntyItem : NSObject {
	NSInteger solarSystemID;
	NSInteger allianceID;
	NSInteger factionID;
	NSString *solarSystemName;
	NSInteger corporationID;
}
@property (nonatomic) NSInteger solarSystemID;
@property (nonatomic) NSInteger allianceID;
@property (nonatomic) NSInteger factionID;
@property (nonatomic, copy) NSString *solarSystemName;
@property (nonatomic) NSInteger corporationID;

+ (id) sovereigntyItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVESovereignty : EVERequest {
	NSMutableArray *solarSystems;
}
@property (nonatomic, retain) NSArray *solarSystems;

+ (id) sovereigntyWithError:(NSError **)errorPtr;
+ (id) sovereigntyWithTarget:(id)target action:(SEL)action object:(id)object;
- (id) initWithError:(NSError **)errorPtr;
- (id) initWithTarget:(id)target action:(SEL)action object:(id)object;
@end