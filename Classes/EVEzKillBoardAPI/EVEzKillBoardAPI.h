//
//  EVEzKillBoardAPI.h
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 25.02.14.
//
//

#import "EVEHTTPSessionManager.h"
#import <EVEAPI/EVEzKillBoardSearch.h>

#define EVEzKillBoardAPIErrorDomain @"EVEzKillBoardAPI"

typedef enum {
	EVEzKillBoardAPIErrorCodeParsingError = 1
} EVEzKillBoardAPIErrorCodes;

#define EVEzKillBoardAPIErrorCodeParsingErrorText @"Result parsing error"

@interface EVEzKillBoardAPI : NSObject
@property (nonatomic, assign) NSURLRequestCachePolicy cachePolicy;
@property (nonatomic, readonly) EVEHTTPSessionManager* sessionManager;

- (instancetype) initWithCachePolicy:(NSURLRequestCachePolicy) cachePolicy NS_DESIGNATED_INITIALIZER;

- (void) searchWithFilter:(NSDictionary*) filter completionBlock:(void(^)(EVEzKillBoardSearch* result, NSError* error)) completionBlock;

@end
