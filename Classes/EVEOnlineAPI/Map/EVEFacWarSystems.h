//
//  EVEFacWarSystems.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEFacWarSystemsItem : NSObject {
	NSInteger solarSystemID;
	NSString *solarSystemName;
	NSInteger occupyingFactionID;
	NSString *occupyingFactionName;
	BOOL contested;
}
@property (nonatomic) NSInteger solarSystemID;
@property (nonatomic, copy) NSString *solarSystemName;
@property (nonatomic) NSInteger occupyingFactionID;
@property (nonatomic, copy) NSString *occupyingFactionName;
@property (nonatomic) BOOL contested;

+ (id) facWarSystemsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEFacWarSystems : EVERequest {
	NSMutableArray *solarSystems;
}
@property (nonatomic, retain) NSArray *solarSystems;

+ (id) facWarSystemsWithError:(NSError **)errorPtr;
+ (id) facWarSystemsWithTarget:(id)target action:(SEL)action object:(id)object;
- (id) initWithError:(NSError **)errorPtr;
- (id) initWithTarget:(id)target action:(SEL)action object:(id)object;
@end