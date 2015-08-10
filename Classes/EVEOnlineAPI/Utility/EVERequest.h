//
//  EVERequest.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 5/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVEGlobals.h"
#import "EVECachedURLRequest.h"



@interface EVERequest : EVECachedURLRequest<NSXMLParserDelegate, NSCoding>

@property (nonatomic, strong) NSDate *currentTime;
@property (nonatomic, strong) NSDate *cachedUntil;
@property (nonatomic, copy) NSString *apiVersion;
@property (nonatomic, readonly, strong) NSString *text;

+ (EVEApiKeyType) requiredApiKeyType;
- (NSDate*) currentServerTime;
- (NSDate*) serverTimeWithLocalTime:(NSDate*) localTime;
- (NSDate*) localTimeWithServerTime:(NSDate*) serverTime;

- (NSString*) currentRowset;
- (id) currentRow;

- (id) didStartRowset:(NSString*) rowset;
- (void) didEndRowset:(NSString*) rowset rowsetObject:(id) object;
- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object;
- (void) didEndRow: (id) row rowset: (NSString*) rowset;

@end

@interface NSDateFormatter(EVERequest)
+ (NSDateFormatter*) eveDateFormatter;
@end