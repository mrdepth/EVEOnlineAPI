//
//  EVECharacterID.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVECharacterIDItem : NSObject {
	NSInteger characterID;
	NSString *name;
}
@property (nonatomic) NSInteger characterID;
@property (nonatomic, copy) NSString *name;

+ (id) characterIDItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVECharacterID : EVERequest {
	NSMutableArray *characters;
}
@property (nonatomic, retain) NSArray *characters;

+ (id) characterIDWithNames:(NSArray*) names error:(NSError **)errorPtr;
+ (id) characterIDWithNames:(NSArray*) names target:(id)target action:(SEL)action object:(id)object;
- (id) initWithNames:(NSArray*) names error:(NSError **)errorPtr;
- (id) initWithNames:(NSArray*) names target:(id)target action:(SEL)action object:(id)object;
@end