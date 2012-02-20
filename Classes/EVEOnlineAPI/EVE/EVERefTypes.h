//
//  EVERefTypes.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVERefTypesItem : NSObject {
	NSInteger refTypeID;
	NSString *refTypeName;
}
@property (nonatomic) NSInteger refTypeID;
@property (nonatomic, copy) NSString *refTypeName;

+ (id) refTypesItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVERefTypes : EVERequest {
	NSMutableArray *refTypes;
}
@property (nonatomic, retain) NSArray *refTypes;

+ (id) refTypesWithError:(NSError **)errorPtr;
+ (id) refTypesWithTarget:(id)target action:(SEL)action object:(id)object;
- (id) initWithError:(NSError **)errorPtr;
- (id) initWithTarget:(id)target action:(SEL)action object:(id)object;
@end