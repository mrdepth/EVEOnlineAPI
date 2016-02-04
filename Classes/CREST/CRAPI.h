//
//  CRAPI.h
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 05.11.15.
//
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import <EVEAPI/CRToken.h>
#import <EVEAPI/CRFitting.h>
#import <EVEAPI/CRKillMail.h>
#import <EVEAPI/CRMarketOrder.h>
#import <EVEAPI/CRIncursion.h>
#import <EVEAPI/CRSolarSystem.h>
#import <EVEAPI/CRMarketHistory.h>

#define CRAPIErrorDomain @"CREST API"

typedef enum {
	CRAPIErrorCodeParsingError = 1,
	CRAPIErrorBadToken = 2
} CRAPIErrorCodes;

#define CRAPIErrorCodeParsingErrorText @"Result parsing error"



@interface CRAPI : NSObject
@property (nonatomic, assign) NSURLRequestCachePolicy cachePolicy;
@property (nonatomic, readonly) AFHTTPRequestOperationManager* httpRequestOperationManager;
@property (nonatomic, strong, readonly) NSString* clientID;
@property (nonatomic, strong, readonly) NSString* secretKey;
@property (nonatomic, strong, readonly) NSURL* callbackURL;
@property (nonatomic, strong, readonly) CRToken* token;

+ (instancetype) apiWithCachePolicy:(NSURLRequestCachePolicy) cachePolicy clientID:(NSString*) clientID secretKey:(NSString*) secretKey token:(CRToken*) token callbackURL:(NSURL*) callbackURL;
+ (instancetype) publicApiWithCachePolicy:(NSURLRequestCachePolicy) cachePolicy;
+ (void) handleOpenURL:(NSURL*) url;

- (instancetype) initWithCachePolicy:(NSURLRequestCachePolicy) cachePolicy clientID:(NSString*) clientID secretKey:(NSString*) secretKey token:(CRToken*) token callbackURL:(NSURL*) callbackURL;
- (instancetype) initPublicAPIWithCachePolicy:(NSURLRequestCachePolicy) cachePolicy;

- (void) authenticateWithCompletionBlock:(void(^)(CRToken* token, NSError* error)) completionBlock;
- (void) loadFittingsWithCompletionBlock:(void(^)(NSArray<CRFitting*>* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (void) postFitting:(CRFitting*) fitting withCompletionBlock:(void(^)(BOOL completed, NSError* error)) completionBlock;
- (void) deleteFittingWithID:(int64_t) fittingID completionBlock:(void(^)(BOOL completed, NSError* error)) completionBlock;
- (void) loadKillMailWithID:(int64_t) killID hash:(NSString*) hash completionBlock:(void(^)(CRKillMail* killMail, NSError* error)) completionBlock;
- (void) loadSellOrdersWithTypeID:(int32_t) typeID regionID:(int32_t) regionID completionBlock:(void(^)(CRMarketOrderCollection* marketOrders, NSError* error)) completionBlock;
- (void) loadBuyOrdersWithTypeID:(int32_t) typeID regionID:(int32_t) regionID completionBlock:(void(^)(CRMarketOrderCollection* marketOrders, NSError* error)) completionBlock;
- (void) loadIncursionsWithCompletionBlock:(void(^)(CRIncursionCollection* incursions, NSError* error)) completionBlock;
- (void) loadSolarSystemWithSolarSystemID:(int32_t) solarSystemID completionBlock:(void(^)(CRSolarSystem* solarSystem, NSError* error)) completionBlock;
- (void) loadMarketHistoryWithTypeID:(int32_t) typeID regionID:(int32_t) regionID completionBlock:(void(^)(CRMarketHistoryCollection* marketHistory, NSError* error)) completionBlock;
@end
