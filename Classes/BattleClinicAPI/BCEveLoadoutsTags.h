//
//  BCEveLoadoutsTags.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 5/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BCRequest.h"

@interface BCEveLoadoutsTags : BCRequest {
	NSMutableArray *tags;
}
@property (nonatomic, retain) NSArray *tags;

+ (id) eveLoadoutsTagsWithAPIKey:(NSString*) apiKey target:(id)target action:(SEL)action object:(id)object;
+ (id) eveLoadoutsTagsWithAPIKey:(NSString*) apiKey error:(NSError **)errorPtr;
- (id) initWithAPIKey:(NSString*) apiKey target:(id)target action:(SEL)action object:(id)object;
- (id) initWithAPIKey:(NSString*) apiKey error:(NSError **)errorPtr;

@end
