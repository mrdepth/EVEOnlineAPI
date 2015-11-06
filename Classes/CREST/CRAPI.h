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
+ (void) handleOpenURL:(NSURL*) url;

- (instancetype) initWithCachePolicy:(NSURLRequestCachePolicy) cachePolicy clientID:(NSString*) clientID secretKey:(NSString*) secretKey token:(CRToken*) token callbackURL:(NSURL*) callbackURL;

- (void) authenticateWithCompletionBlock:(void(^)(CRToken* token, NSError* error)) completionBlock;

- (void) loadFittingsWithCompletionBlock:(void(^)(NSArray<CRFitting*>* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (void) postFitting:(CRFitting*) fitting withCompletionBlock:(void(^)(BOOL completed, NSError* error)) completionBlock;

@end
