//
//  EVEC0rporationFaction.h
//  EVEOnlineAPI
//
//  Created by Mr. Depth on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVECachedURLRequest.h"

#define EVEC0rporationAPIHost @"http://prices.c0rporation.com"
#define EVEC0rporationErrorDomain @"EVEC0rporation"

typedef enum {
	EVEC0rporationErrorCodeParsingError = 1
} EVEC0rporationErrorCodes;

#define EVEC0rporationErrorCodeParsingErrorText @"Result parsing error"

@interface EVEC0rporationFactionItem : NSObject
@property (nonatomic, assign) NSInteger typeID;
@property (nonatomic, assign) float avg;
@property (nonatomic, assign) float median;
@property (nonatomic, assign) float lo;
@property (nonatomic, assign) float hi;
@property (nonatomic, assign) float latest;
@property (nonatomic, strong) NSDate* lastupdate;

+ (id) factionItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEC0rporationFaction : EVECachedURLRequest<NSXMLParserDelegate>
@property (nonatomic, strong) NSDictionary* types;

+ (id) factionWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;
- (id) initWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;

@end
