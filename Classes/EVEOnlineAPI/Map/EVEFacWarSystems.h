//
//  EVEFacWarSystems.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEFacWarSystemsItem : NSObject<NSCoding>
@property (nonatomic) NSInteger solarSystemID;
@property (nonatomic, copy) NSString *solarSystemName;
@property (nonatomic) NSInteger occupyingFactionID;
@property (nonatomic, copy) NSString *occupyingFactionName;
@property (nonatomic) BOOL contested;

+ (id) facWarSystemsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEFacWarSystems : EVERequest
@property (nonatomic, strong) NSArray *solarSystems;

+ (id) facWarSystemsWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
@end