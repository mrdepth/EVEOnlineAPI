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

@interface EVEC0rporationFactionItem : NSObject {
	NSInteger typeID;
	float avg;
	float median;
	float lo;
	float hi;
	float latest;
	NSDate* lastupdate;
}
@property (nonatomic, assign) NSInteger typeID;
@property (nonatomic, assign) float avg;
@property (nonatomic, assign) float median;
@property (nonatomic, assign) float lo;
@property (nonatomic, assign) float hi;
@property (nonatomic, assign) float latest;
@property (nonatomic, retain) NSDate* lastupdate;

+ (id) factionItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEC0rporationFaction : EVECachedURLRequest<NSXMLParserDelegate> {
	NSMutableString *text;
	NSMutableDictionary* types;
}
@property (nonatomic, retain) NSDictionary* types;

+ (id) factionWithError:(NSError **)errorPtr;
+ (id) factionWithTarget:(id)target action:(SEL)action object:(id)object;
- (id) initWithError:(NSError **)errorPtr;
- (id) initWithTarget:(id)target action:(SEL)action object:(id)object;

@end
