//
//  NeocomAPI.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 18.06.13.
//
//

#import <AFNetworking/AFNetworking.h>
#import <EVEAPI/NAPISearch.h>
#import <EVEAPI/NAPIUpload.h>
#import <EVEAPI/NAPILookup.h>

#define NeocomAPIHost @"http://neocom.by/api"

#define NeocomAPIErrorDomain @"EVECentralAPI"

typedef enum {
	NeocomAPIErrorCodeParsingError = 1
} NeocomAPIErrorCodes;

#define NeocomAPIErrorCodeParsingErrorText @"Result parsing error"

typedef enum {
	NeocomAPIFlagNone                = 0,
	NeocomAPIFlagCapStable           = 1 << 0,
	NeocomAPIFlagImplantsUsed        = 1 << 1,
	NeocomAPIFlagBoostersUsed        = 1 << 2,
	NeocomAPIFlagHybridTurrets       = 1 << 3,
	NeocomAPIFlagLaserTurrets        = 1 << 4,
	NeocomAPIFlagProjectileTurrets   = 1 << 5,
	NeocomAPIFlagMissileLaunchers    = 1 << 6,
	NeocomAPIFlagPassiveTank         = 1 << 7,
	NeocomAPIFlagActiveTank          = 1 << 8,
	NeocomAPIFlagShieldTank          = 1 << 9,
	NeocomAPIFlagArmorTank           = 1 << 10,
	NeocomAPIFlagPVP                 = 1 << 11,
	NeocomAPIFlagComplete            = 1 << 12,
	NeocomAPIFlagValid               = 1 << 13,
} NeocomAPIFlag;

@interface NeocomAPI : NSObject
@property (nonatomic, assign) NSURLRequestCachePolicy cachePolicy;
@property (nonatomic, readonly) AFHTTPRequestOperationManager* httpRequestOperationManager;

- (instancetype) initWithCachePolicy:(NSURLRequestCachePolicy) cachePolicy NS_DESIGNATED_INITIALIZER;
- (AFHTTPRequestOperation*) lookupWithCriteria:(NSDictionary*) criteria completionBlock:(void(^)(NAPILookup* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) searchWithCriteria:(NSDictionary*) criteria order:(NSString*) order  completionBlock:(void(^)(NAPISearch* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (AFHTTPRequestOperation*) uploadFitsWithCannonicalNames:(NSArray*) cannonicalNames userID:(NSString*) userID completionBlock:(void(^)(NAPIUpload* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;

@end