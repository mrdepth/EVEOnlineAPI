//
//  EVECalllist.h
//  EVEOnlineAPI
//
//  Created by Shimanski on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVECalllistCallGroupsItem : NSObject {
	NSInteger groupID;
	NSString *name;
	NSString *description;
}
@property (nonatomic) NSInteger groupID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *description;

+ (id) callGroupsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVECalllistCallsItem : NSObject {
	NSInteger accessMask;
	EVECallType type;
	NSString *name;
	NSInteger groupID;
	NSString *description;
}
@property (nonatomic) NSInteger accessMask;
@property (nonatomic) EVECallType type;
@property (nonatomic, copy) NSString *name;
@property (nonatomic) NSInteger groupID;
@property (nonatomic, copy) NSString *description;

+ (id) callsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end



@interface EVECalllist : EVERequest {
	NSMutableArray *callGroups;
	NSMutableArray *calls;
}
@property (nonatomic, retain) NSArray *callGroups;
@property (nonatomic, retain) NSArray *calls;

+ (id) calllistWithError:(NSError **)errorPtr;
+ (id) calllistWithTarget:(id)target action:(SEL)action object:(id)object;
- (id) initWithError:(NSError **)errorPtr;
- (id) initWithTarget:(id)target action:(SEL)action object:(id)object;

@end