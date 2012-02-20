//
//  EVEServerStatus.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEServerStatus : EVERequest {
	BOOL serverOpen;
	NSInteger onlinePlayers;
}
@property (nonatomic) BOOL serverOpen;
@property (nonatomic) NSInteger onlinePlayers;

+ (id) serverStatusWithError:(NSError **)errorPtr;
+ (id) serverStatusWithTarget:(id)target action:(SEL)action object:(id)object;
- (id) initWithError:(NSError **)errorPtr;
- (id) initWithTarget:(id)target action:(SEL)action object:(id)object;
@end