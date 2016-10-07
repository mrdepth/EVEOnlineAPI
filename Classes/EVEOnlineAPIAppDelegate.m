//
//  EVEOnlineAPIAppDelegate.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 5/31/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "EVEOnlineAPIAppDelegate.h"
#import "EVEOnlineAPI.h"
#import "EVEDBAPI.h"
#import "EVECentralAPI.h"
#import "RSS.h"
#import "BattleClinicAPI.h"
#import "EVEKillNetAPI.h"
#import "EVEzKillBoardAPI.h"
#import "EVEAPISerializer.h"
#import "EVEAPIObject.h"
#import "NeocomAPI.h"
#import "CRAPI.h"

@interface EVEOnlineAPIAppDelegate()
//@property (strong, nonatomic) CRAPI* crapi;
@end

@implementation EVEOnlineAPIAppDelegate

@synthesize window;

#define KEY_ID 0
#define V_CODE @""

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	NSURLCache* cache = [[NSURLCache alloc] initWithMemoryCapacity:1024*1024 diskCapacity:1024*1024*50 diskPath:@"EVECache"];
	[NSURLCache setSharedURLCache:cache];

	EVEAPIKey* apiKey = [[EVEAPIKey alloc] initWithKeyID:KEY_ID vCode:V_CODE characterID:0 corporate:NO];
	NSProgress *p = [NSProgress progressWithTotalUnitCount:1];
	[p becomeCurrentWithPendingUnitCount:1];
	[[EVEOnlineAPI apiWithAPIKey:apiKey cachePolicy:NSURLRequestUseProtocolCachePolicy] serverStatusWithCompletionBlock:^(EVEServerStatus *result, NSError *error) {
		NSLog(@"%@", p);
	}];
	[p resignCurrent];
	
	self.window.rootViewController = [UIViewController new];
	return YES;
	NSDictionary* d = @{@"key":@{@"subkey":@"value"}};
	NSLog(@"%@", d[@"key.subkey"]);
	window.rootViewController = [UIViewController new];
	[window makeKeyAndVisible];
	
/*	EVEAPIKey* apiKey = [[EVEAPIKey alloc] initWithKeyID:KEY_ID vCode:V_CODE characterID:0 corporate:NO];
	[[EVEOnlineAPI apiWithAPIKey:apiKey cachePolicy:NSURLRequestUseProtocolCachePolicy] serverStatusWithCompletionBlock:^(EVEServerStatus *result, NSError *error) {
		NSLog(@"%@", result);
	} progressBlock:nil];
	
	[[EVEOnlineAPI apiWithAPIKey:apiKey cachePolicy:NSURLRequestUseProtocolCachePolicy] serverStatusWithCompletionBlock:^(EVEServerStatus *result, NSError *error) {
		NSLog(@"%@", result);
	} progressBlock:nil];

	
	[[EVEOnlineAPI apiWithAPIKey:apiKey cachePolicy:NSURLRequestUseProtocolCachePolicy] serverStatusWithCompletionBlock:^(EVEServerStatus *result, NSError *error) {
		NSLog(@"%@", result);
	} progressBlock:nil];*/
	
/*	[[EVECentralAPI new] quickLookWithTypeID:645 regionIDs:nil systemID:0 hours:0 minQ:0 completionBlock:^(EVECentralQuickLook *result, NSError *error) {
		NSLog(@"%@",result);
	} progressBlock:nil];*/
/*	[[NeocomAPI new] searchWithCriteria:@{@"typeID":@(645)} order:nil completionBlock:^(NAPISearch *result, NSError *error) {
		NSLog(@"%@", result);
	} progressBlock:nil];*/
/*	[[NeocomAPI new] uploadFitsWithCannonicalNames:@[@"645|2299::2;2303::1;3186:21740:6;12068::1;15895::3;19187::1;33844::4|28288:5",
													 @"645|2299::2;2303::1;3186:21740:6;12068::1;15895::3;19187::1;33844::4|28288:5"]
											userID:@"test"
								   completionBlock:^(NAPIUpload *result, NSError *error) {
									   
								   } progressBlock:nil];*/
	/*[[EVEzKillBoardAPI new] searchWithFilter:@{@"losses":@"solo"} completionBlock:^(EVEzKillBoardSearch *result, NSError *error) {
		NSLog(@"%@", result);
	} progressBlock:nil];*/
/*	dispatch_async(dispatch_get_main_queue(), ^{
		NSString* file = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"token.plist"];
		CRToken* token = [NSKeyedUnarchiver unarchiveObjectWithFile:file];
		CRAPI* crapi = [[CRAPI alloc] initWithCachePolicy:NSURLRequestUseProtocolCachePolicy
											   clientID:@"c2cc974798d4485d966fba773a8f7ef8"
											  secretKey:@"GNhSE9GJ6q3QiuPSTIJ8Q1J6on4ClM4v9zvc0Qzu"
												  token:token
											callbackURL:[NSURL URLWithString:@"neocom://sso"]];
		
		if (!token)
			[crapi authenticateWithCompletionBlock:^(CRToken *token, NSError *error) {
				if (token)
					[NSKeyedArchiver archiveRootObject:token toFile:file];
				NSLog(@"%@", error);
			}];
		else
			[crapi loadFittingsWithCompletionBlock:^(NSArray<CRFitting *> *result, NSError *error) {
				[crapi postFitting:result[0] withCompletionBlock:^(BOOL completed, NSError *error) {
					NSLog(@"%d %@", completed, error);
				}];
				NSLog(@"%@", result);
			} progressBlock:nil];
	});*/
	/*[[CRAPI publicApiWithCachePolicy:NSURLRequestUseProtocolCachePolicy] loadKillMailWithID:47987352 hash:@"e9e95594d41b66b6bd198adcdeb28651b405fbdc" completionBlock:^(CRKillMail *killMail, NSError *error) {
		NSLog(@"%@", killMail);
	}];*/
	/*[[CRAPI publicApiWithCachePolicy:NSURLRequestUseProtocolCachePolicy] loadSellOrdersWithTypeID:34 regionID:10000002 completionBlock:^(CRMarketOrderCollection *marketOrders, NSError *error) {
		NSLog(@"%@", marketOrders);
	}]*/
	[[CRAPI publicApiWithCachePolicy:NSURLRequestUseProtocolCachePolicy] loadSolarSystemWithSolarSystemID:30002966 completionBlock:^(CRSolarSystem *solarSystem, NSError *error) {
		NSLog(@"%@", solarSystem);
	}];
	
	[[CRAPI publicApiWithCachePolicy:NSURLRequestUseProtocolCachePolicy] loadMarketHistoryWithTypeID:645 regionID:10000002 completionBlock:^(CRMarketHistoryCollection *marketHistory, NSError *error) {
		NSLog(@"%@", marketHistory);
	}];

	return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options  {
	[CRAPI handleOpenURL:url];
	return YES;
}


@end
