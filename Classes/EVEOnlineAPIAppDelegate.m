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

@implementation EVEOnlineAPIAppDelegate

@synthesize window;

#define KEY_ID 0
#define V_CODE @""

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	window.rootViewController = [UIViewController new];
	[window makeKeyAndVisible];
	NSURLCache* cache = [[NSURLCache alloc] initWithMemoryCapacity:1024*1024 diskCapacity:1024*1024*50 diskPath:@"EVECache"];
	[NSURLCache setSharedURLCache:cache];
	
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
	
	[[EVECentralAPI new] quickLookWithTypeID:645 regionIDs:nil systemID:0 hours:0 minQ:0 completionBlock:^(EVECentralQuickLook *result, NSError *error) {
		NSLog(@"%@",result);
	} progressBlock:nil];
	return YES;
}


@end
