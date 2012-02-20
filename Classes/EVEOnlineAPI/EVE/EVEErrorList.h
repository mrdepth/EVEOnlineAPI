//
//  EVEErrorList.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEErrorListItem : NSObject {
	NSInteger errorCode;
	NSString *errorText;
}
@property (nonatomic) NSInteger errorCode;
@property (nonatomic, copy) NSString *errorText;

+ (id) errorListItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEErrorList : EVERequest {
	NSMutableArray *errors;
}
@property (nonatomic, retain) NSArray *errors;

+ (id) errorListWithError:(NSError **)errorPtr;
+ (id) errorListWithTarget:(id)target action:(SEL)action object:(id)object;
- (id) initWithError:(NSError **)errorPtr;
- (id) initWithTarget:(id)target action:(SEL)action object:(id)object;
@end