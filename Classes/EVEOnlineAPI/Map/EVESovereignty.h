//
//  EVESovereignty.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVESovereigntyItem : NSObject
@property (nonatomic) NSInteger solarSystemID;
@property (nonatomic) NSInteger allianceID;
@property (nonatomic) NSInteger factionID;
@property (nonatomic, copy) NSString *solarSystemName;
@property (nonatomic) NSInteger corporationID;

+ (id) sovereigntyItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVESovereignty : EVERequest
@property (nonatomic, strong) NSArray *solarSystems;

+ (id) sovereigntyWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;
- (id) initWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;
@end