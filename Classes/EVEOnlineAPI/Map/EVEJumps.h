//
//  EVEJumps.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEJumpsItem : NSObject {
	NSInteger solarSystemID;
	NSInteger shipJumps;
}
@property (nonatomic) NSInteger solarSystemID;
@property (nonatomic) NSInteger shipJumps;

+ (id) jumpsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEJumps : EVERequest {
	NSMutableArray *solarSystems;
}
@property (nonatomic, retain) NSArray *solarSystems;

+ (id) jumpsWithError:(NSError **)errorPtr;
+ (id) jumpsWithTarget:(id)target action:(SEL)action object:(id)object;
- (id) initWithError:(NSError **)errorPtr;
- (id) initWithTarget:(id)target action:(SEL)action object:(id)object;
@end