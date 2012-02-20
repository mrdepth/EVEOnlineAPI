//
//  EVECharacterName.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVECharacterNameItem : NSObject {
	NSInteger characterID;
	NSString *name;
}
@property (nonatomic) NSInteger characterID;
@property (nonatomic, copy) NSString *name;

+ (id) characterNameItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVECharacterName : EVERequest {
	//NSMutableArray *characters;
	NSMutableDictionary* characters;
}
@property (nonatomic, retain) NSDictionary *characters;

+ (id) characterNameWithIDs:(NSArray*) ids error:(NSError **)errorPtr;
+ (id) characterNameWithIDs:(NSArray*) ids target:(id)target action:(SEL)action object:(id)object;
- (id) initWithIDs:(NSArray*) ids error:(NSError **)errorPtr;
- (id) initWithIDs:(NSArray*) ids target:(id)target action:(SEL)action object:(id)object;
@end