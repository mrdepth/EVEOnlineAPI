//
//  EVECharacterID.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVECharacterIDItem : NSObject
@property (nonatomic) NSInteger characterID;
@property (nonatomic, copy) NSString *name;

+ (id) characterIDItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVECharacterID : EVERequest
@property (nonatomic, strong) NSArray *characters;

+ (id) characterIDWithNames:(NSArray*) names error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;
- (id) initWithNames:(NSArray*) names error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;
@end